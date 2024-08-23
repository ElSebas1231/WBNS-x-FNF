package objects;

class MenuItem extends FlxSprite
{
	public var targetY:Float = 0;
	public var flashingInt:Int = 0;
	public var locked:Bool;
	var maxWidth:Float;

	public function new(x:Float, y:Float, weekName:String = '', ?locked:Bool)
	{
		super(x, y);
		frames = Paths.getSparrowAtlas('storymenu/' + weekName);
       
		animation.addByPrefix('idle', "no seleccion", 24);
		animation.addByPrefix('selected', "seleccion", 24, false);

		this.locked = locked;
		antialiasing = ClientPrefs.data.antialiasing;
		maxWidth = 0;
	}

	public function idle() {
		animation.play("idle");
	}

	public function select() {
		animation.play("selected");
	}
	
	public function forceRepo() {
		updateHitbox();
		x = (targetY * width) + 480;
	}

	private var isFlashing:Bool = false;

	public function startFlashing():Void
	{
		isFlashing = true;
	}

	// if it runs at 60fps, fake framerate will be 6
	// if it runs at 144 fps, fake framerate will be like 14, and will update the graphic every 0.016666 * 3 seconds still???
	// so it runs basically every so many seconds, not dependant on framerate??
	// I'm still learning how math works thanks whoever is reading this 
	
	var fakeFramerate:Int = Math.round((1 / FlxG.elapsed) / 10);

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		updateHitbox();

		if (maxWidth < frameWidth) maxWidth = frameWidth;

		x = FlxMath.lerp(x, (targetY * 880) + 640, FlxMath.bound(elapsed * 10.2, 0, 1));
		screenCenter(Y);

		if (isFlashing) flashingInt += 1;

		if (flashingInt % fakeFramerate >= Math.floor(fakeFramerate / 2))
			color = 0xFF33ffff;
		else
			color = FlxColor.WHITE;
	}
}
