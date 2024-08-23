package objects;

import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxSort;
import flixel.util.FlxTimer;

class BGScrollingText extends FlxSpriteGroup
{
	var grpTexts:FlxTypedSpriteGroup<FlxText>;

	public var widthShit:Float = FlxG.width;
	public var placementOffset:Float = 20;
	public var speed:Float = 1;
	public var text(default, set):String;
	public var size(default, set):Int = 48;

	public var funnyColor(default, set):Int = 0xFFFFFFFF;

	public function new(x:Float, y:Float, text:String, widthShit:Float = 100, font:String, ?bold:Bool = false, ?size:Int = 48)
	{
		super(x, y);

		this.widthShit = widthShit;
		if (size != null) this.size = size;

		grpTexts = new FlxTypedSpriteGroup<FlxText>();
		add(grpTexts);

		var testText:FlxText = new FlxText(0, 0, 0, text, this.size);
		testText.font = Paths.font(font);
		testText.bold = bold;
		testText.updateHitbox();
		grpTexts.add(testText);

		var needed:Int = Math.ceil(widthShit / testText.frameWidth) + 1;

		for (i in 0...needed)
		{
			var coolText:FlxText = new FlxText((i + 1 * testText.frameWidth) + (i + 1 * 20), 0, 0, text, this.size);

			coolText.font = Paths.font(font);
			coolText.bold = bold;
			coolText.updateHitbox();
			grpTexts.add(coolText);
		}
	}

	function set_text(newText:String)
	{
		if (grpTexts != null) {
			grpTexts.forEach(function(txt:FlxText) {
			txt.text = newText;
			});
		}
		return newText;
	}

	function set_size(value:Int):Int
	{
		if (grpTexts != null) {
			grpTexts.forEach(function(txt:FlxText) {
			txt.size = value;
			});
		}
		
		this.size = value;
		return value;
	}

	function set_funnyColor(col:Int):Int
	{
		grpTexts.forEach(function(txt) {
			txt.color = col;
		});

		return col;
	}

	override public function update(elapsed:Float)
	{
		for (txt in grpTexts.group)
		{
			txt.x -= 1 * (speed * (elapsed / (1 / 60)));

			if (speed > 0) {
				if (txt.x < -txt.frameWidth) {
					txt.x = grpTexts.group.members[grpTexts.length - 1].x + grpTexts.group.members[grpTexts.length - 1].frameWidth + placementOffset;

					sortTextShit();
				}
			} else {
				if (txt.x > txt.frameWidth * 2) {
					txt.x = grpTexts.group.members[0].x - grpTexts.group.members[0].frameWidth - placementOffset;
					sortTextShit();
				}
			}
		}

		super.update(elapsed);
	}

	function sortTextShit():Void
	{
		grpTexts.sort(function(Order:Int, Obj1:FlxObject, Obj2:FlxObject) {
			return FlxSort.byValues(Order, Obj1.x, Obj2.x);
		});
	}
}
