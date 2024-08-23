package states;

import backend.Paths;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.addons.display.FlxBackdrop;
import flixel.group.FlxGroup.FlxTypedGroup;

import flixel.math.FlxMath;
import flixel.effects.FlxFlicker;

import flixel.addons.display.FlxRuntimeShader;
import sys.io.File;
import openfl.filters.ShaderFilter;
import haxe.Json;

class GalleryState extends MusicBeatState
{
    // DATA STUFF
    var itemGroup:FlxTypedGroup<GalleryImage>;

    var imagePaths:Array<String>;
    var imageDescriptions:Array<String>;
    var linkOpen:Array<String>;
    var descBox:FlxSprite;
    var descriptionText:FlxText;
    var tvShader:FlxRuntimeShader;

    var currentIndex:Int = 0;
    var allowInputs:Bool = true;

    // UI STUFF
    var imageSprite:FlxSprite;
    var background:FlxBackdrop;
    var titleText:FlxText;
    var bars:FlxSprite;
    var backspace:FlxSprite;
    var leftArrow:FlxSprite;
	var rightArrow:FlxSprite;
    
    // Customize the image path here
    var imagePath:String = "gallery/";

    override public function create():Void
    {
        var jsonData:String = File.getContent("assets/shared/images/gallery/gallery.json");
        var imageData:Array<ImageData> = haxe.Json.parse(jsonData);
        var ui_tex = Paths.getSparrowAtlas('campaign_menu_UI_assets');

        imagePaths = [];
        imageDescriptions = [];
        linkOpen = [];
        
        for (data in imageData) {
            imagePaths.push(data.path);
            imageDescriptions.push(data.description);
            linkOpen.push(data.link);
        }
    
        itemGroup = new FlxTypedGroup<GalleryImage>();
    
        for (i in 0...imagePaths.length) {
            var newItem = new GalleryImage();
            newItem.loadGraphic(Paths.image(imagePath + imagePaths[i]));
            newItem.antialiasing = ClientPrefs.data.antialiasing;
            newItem.screenCenter();

            if (newItem.width > FlxG.width){
                newItem.setGraphicSize(Std.int(FlxG.width * 0.9));
                newItem.updateHitbox();
            }

            newItem.ID = i;

            itemGroup.add(newItem);
        }
    
        background = new FlxBackdrop(Paths.image("gallery/ui/galleryBG"), X);
        background.antialiasing = ClientPrefs.data.antialiasing;
        background.velocity.x = 20;
        add(background);

        add(itemGroup);

        var blackBarThingie:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, 56, FlxColor.BLACK);
		add(blackBarThingie);

        var sillyText:FlxText = new FlxText(0, 10);
		sillyText.text = '¡Fanarts del #WBNSxFNFarts!';
		sillyText.setFormat(Paths.font("vcr.ttf"), 32);
		sillyText.size = 36;
		sillyText.screenCenter(X);
        sillyText.antialiasing = false;
        add(sillyText);

        descBox = new FlxSprite().makeGraphic(1, 1, FlxColor.BLACK);
		descBox.alpha = 0.6;
		add(descBox);
    
        descriptionText = new FlxText(0, 0, FlxG.width - 100, imageDescriptions[currentIndex]);
        descriptionText.setFormat("vcr.ttf", 25, 0xffffff, "center");
        descriptionText.y += 275;
        descriptionText.setFormat(Paths.font("vcr.ttf"), 32);
        descriptionText.antialiasing = false;
        add(descriptionText);
    
        backspace = new FlxSprite(0, 620);
        backspace.frames = Paths.getSparrowAtlas('gallery/ui/backspace');
		backspace.animation.addByPrefix('exit', "backspace to exit", 24);
        backspace.animation.addByPrefix('exit white', "backspace to exit white", 24);
        backspace.animation.addByPrefix('exit pressed', "backspace PRESSED", 24, false);
        backspace.animation.play('exit white');
        backspace.updateHitbox();
        backspace.antialiasing = ClientPrefs.data.antialiasing;
        add(backspace);

        leftArrow = new FlxSprite(0, 0);
		leftArrow.screenCenter();
		leftArrow.x -= 300;
		leftArrow.antialiasing = ClientPrefs.data.antialiasing;
		leftArrow.frames = ui_tex;
        leftArrow.scale.set(1.2, 1.2);
		leftArrow.animation.addByPrefix('idle', "arrow left");
		leftArrow.animation.addByPrefix('press', "arrow push left");
		leftArrow.animation.play('idle');
        add(leftArrow);

        rightArrow = new FlxSprite(0, leftArrow.y);
		rightArrow.antialiasing = ClientPrefs.data.antialiasing;
		rightArrow.frames = ui_tex;
        rightArrow.screenCenter();
        rightArrow.x += 300;
        rightArrow.scale.set(1.2, 1.2);
		rightArrow.animation.addByPrefix('idle', 'arrow right');
		rightArrow.animation.addByPrefix('press', "arrow push right", 24, false);
		rightArrow.animation.play('idle');
        add(rightArrow);
    
        persistentUpdate = true;
        changeSelection();
    
        super.create();
        CustomFadeTransition.nextCamera = FlxG.cameras.list[FlxG.cameras.list.length - 1];
    }

    var holdTime:Float = 0;
    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        var shiftMult:Int = 1;
		if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

        if(controls.UI_RIGHT || controls.UI_LEFT && allowInputs)
        {
            var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
            holdTime += elapsed;
            var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

            if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
            {
                FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
                changeSelection((checkNewHold - checkLastHold) * (controls.UI_LEFT ? -shiftMult : shiftMult));
            }
        }

        if ((controls.UI_LEFT_P || controls.UI_RIGHT_P)) {
            changeSelection(controls.UI_LEFT_P ? -shiftMult : shiftMult);
            FlxG.sound.play(Paths.sound("scrollMenu"));
            holdTime = 0;
        }

        if (controls.UI_RIGHT)
            rightArrow.animation.play('press');
        else
            rightArrow.animation.play('idle');

        if (controls.UI_LEFT)
            leftArrow.animation.play('press');
        else
            leftArrow.animation.play('idle');
        
        if(FlxG.mouse.wheel != 0) {
            FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
            changeSelection(-shiftMult * FlxG.mouse.wheel);
        }
    
        if (controls.BACK && allowInputs)
        {
            allowInputs = false;
			FlxG.sound.play(Paths.sound('cancelMenu'));
            backspace.y -= 50;
            backspace.animation.play('exit pressed');
			FlxFlicker.flicker(backspace, 1, 0.06, false, false, function(flick:FlxFlicker){
                FlxG.switchState(() -> new MainMenuState());
            });
        }
    
        if (controls.ACCEPT || FlxG.mouse.justPressedRight && allowInputs) {
            if (linkOpen[currentIndex] != null) {
                CoolUtil.browserLoad(linkOpen[currentIndex]);
            }
        }
    }
    
    private function changeSelection(i:Int = 0)
    {
        currentIndex = FlxMath.wrap(currentIndex + i, 0, imageDescriptions.length - 1);
    
        descriptionText.text = imageDescriptions[currentIndex];
        descriptionText.screenCenter();

        var change = 0;
        for (item in itemGroup) {
            item.posX = change++ - currentIndex;
            item.alpha = (item.ID == currentIndex) ? 1 : 0.6;

            item.setGraphicSize(0, Std.int(FlxG.height * 0.8));
            item.updateHitbox();
            item.screenCenter(Y);
            item.y -= 30;

            descriptionText.screenCenter();
            descriptionText.y = item.y + item.height + 15;
        }

        descBox.setPosition(descriptionText.x - 10, descriptionText.y - 10);
		descBox.setGraphicSize(Std.int(descriptionText.width + 20), Std.int(descriptionText.height + 25));
		descBox.updateHitbox();
    }
}

class GalleryImage extends FlxSprite {
    public var lerpSpeed:Float = 6;
    public var posX:Float = 0;
    
    override function update(elapsed:Float) {
        super.update(elapsed);
        x = FlxMath.lerp(x, (FlxG.width - width) / 2 + posX * 760, boundTo(elapsed * lerpSpeed, 0, 1));
    }
}

function boundTo(value:Float, min:Float, max:Float):Float {
    var newValue:Float = value;
    if(newValue < min) newValue = min;
    else if(newValue > max) newValue = max;
    return newValue;
}

typedef ImageData = {
    path:String,
    description:String,
    title:String,
    link:String
}
