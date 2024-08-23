package states;

import flixel.FlxObject;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.input.keyboard.FlxKey;
import lime.app.Application;
import states.editors.MasterEditorMenu;
import options.OptionsState;

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.7.2'; // This is also used for Discord RPC
	public static var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;

	var optionShit:Array<String> = [
		'story_mode',
		'freeplay',
		'credits',
		'gallery',
		'options'
	];

	var camFollow:FlxObject;
	var debugKeysEditor:Array<FlxKey>;
	var debugKeysMods:Array<FlxKey>;

	override function create()
	{
		Paths.clearStoredMemory();

		#if MODS_ALLOWED
		Mods.pushGlobalMods();
		#end
		Mods.loadTopMod();

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Menú Principal", null);
		#end

		debugKeysEditor = ClientPrefs.keyBinds.get('debug_1');
		debugKeysMods = ClientPrefs.keyBinds.get('debug_2');

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var yScroll:Float = Math.max(0.25 - (0.05 * (optionShit.length - 4)), 0.1);
		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		bg.antialiasing = ClientPrefs.data.antialiasing;
		bg.scrollFactor.set(0, 0);
		bg.setGraphicSize(Std.int(bg.width * 1.175));
		bg.updateHitbox();
		bg.screenCenter();
		add(bg);

		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var scale:Float = 0.7;

		for (i in 0...optionShit.length)
		{
			var offset:Float = 108 - (Math.max(optionShit.length, 4) - 4) * 80;
			var menuItem:FlxSprite = new FlxSprite(0, (i * 140) + offset);
			menuItem.antialiasing = ClientPrefs.data.antialiasing;
			menuItem.scale.set(scale, scale);
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[i]);
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.play('idle');
			menuItems.add(menuItem);
			var scr:Float = (optionShit.length - 4) * 0.135;
			if (optionShit.length < 6)
				scr = 0;
			menuItem.scrollFactor.set(0, scr);
			menuItem.updateHitbox();

			switch(i)
			{
				case 0:
					menuItem.setPosition(205, 75);
				case 1:
					menuItem.setPosition(185, 200);
				case 2:
					menuItem.setPosition(125, 325);
				case 3:
					menuItem.setPosition(85, 450);
				case 4:
					menuItem.setPosition(45, 575);
			}
		}

		var psychVer:FlxText = new FlxText(12, FlxG.height - 44, 0, "Psych Engine v" + psychEngineVersion, 12);
		psychVer.scrollFactor.set();
		psychVer.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(psychVer);
		var fnfVer:FlxText = new FlxText(12, FlxG.height - 24, 0, "Friday Night Funkin' v" + Application.current.meta.get('version'), 12);
		fnfVer.scrollFactor.set();
		fnfVer.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(fnfVer);
		changeItem();

		super.create();

		FlxG.camera.follow(camFollow, null, 0.15);

		Paths.clearUnusedMemory();
	}
	
	var holdTime:Float = 0;
	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		var shiftMult:Int = 1;
		if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * elapsed;
			if (FreeplayState.vocals != null)
				FreeplayState.vocals.volume += 0.5 * elapsed;
		}

		if (!selectedSomethin)
		{
			if (controls.UI_UP_P) {
				changeItem(-shiftMult);
				holdTime = 0;
			}

			if (controls.UI_DOWN_P) {
				changeItem(shiftMult);
				holdTime = 0;
			}

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				FlxG.switchState(() -> new TitleState());
			}

			if(controls.UI_DOWN || controls.UI_UP)
			{
				var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
				holdTime += elapsed;
				var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

				if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
				{
					changeItem((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
				}
			}

			if(FlxG.mouse.wheel != 0)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'), 0.5);
				changeItem(-shiftMult * FlxG.mouse.wheel);
			}

			if (controls.ACCEPT || FlxG.mouse.justPressedRight)
			{
				FlxG.sound.play(Paths.sound('confirmMenu'));
				selectedSomethin = true;
				FlxFlicker.flicker(menuItems.members[curSelected], 1, 0.06, false, false, function(flick:FlxFlicker)
				{
					switch (optionShit[curSelected])
					{
						case 'story_mode':
							FlxG.switchState(() -> new StoryMenuState());
						case 'freeplay':
							FlxG.switchState(() -> new FreeplayState());
						case 'credits':
							FlxG.switchState(() -> new CreditsState());
						case 'gallery':
							FlxG.switchState(() -> new GalleryState());
						case 'options':
							FlxG.switchState(() -> new OptionsState());
							OptionsState.onPlayState = false;
							if (PlayState.SONG != null)
							{
								PlayState.SONG.arrowSkin = null;
								PlayState.SONG.splashSkin = null;
							}
					}
				});

				for (i in 0...menuItems.members.length)
				{
					if (i == curSelected)
						continue;
					FlxTween.tween(menuItems.members[i], {alpha: 0}, 0.4, {
						ease: FlxEase.quadOut,
						onComplete: function(twn:FlxTween)
						{
							menuItems.members[i].kill();
						}
					});
				}
			}
			#if desktop
			else if (FlxG.keys.anyJustPressed(debugKeysEditor)) {
				selectedSomethin = true;
				FlxG.switchState(() -> new MasterEditorMenu());
			}

			else if (FlxG.keys.anyJustPressed(debugKeysMods)) {
				selectedSomethin = true;
				FlxG.switchState(() -> new ModsMenuState());
			}
			#end
		}

		super.update(elapsed);
	}

	function changeItem(huh:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.5);
		menuItems.members[curSelected].animation.play('idle');
		menuItems.members[curSelected].updateHitbox();

		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.members[curSelected].animation.play('selected');
		menuItems.members[curSelected].centerOffsets();

		camFollow.setPosition(menuItems.members[curSelected].getGraphicMidpoint().x,
			menuItems.members[curSelected].getGraphicMidpoint().y - (menuItems.length > 4 ? menuItems.length * 8 : 0));
	}
}
