package states.editors;

import backend.WeekData;

import objects.Character;

import states.MainMenuState;
import states.FreeplayState;

class MasterEditorMenu extends MusicBeatState
{
	var options:Array<String> = [
		'Editor de Charteo',
		'Editor de Personajes',
		'Editor de Semanas',
		'Editor de Personajes de Menú',
		'Editor de Diálogo',
		'Editor de Personajes de Diálogo',
		'Debug de Note Splash'
	];
	private var grpTexts:FlxTypedGroup<Alphabet>;
	private var directories:Array<String> = [null];

	private var curSelected = 0;
	private var curDirectory = 0;
	private var directoryTxt:FlxText;

	override function create()
	{
		FlxG.camera.bgColor = FlxColor.BLACK;
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Menú Principal de Editores", null);
		#end

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.scrollFactor.set();
		bg.color = 0xFF353535;
		add(bg);

		grpTexts = new FlxTypedGroup<Alphabet>();
		add(grpTexts);

		for (i in 0...options.length)
		{
			var leText:Alphabet = new Alphabet(90, 320, options[i], true);
			leText.isMenuItem = true;
			leText.targetY = i;
			grpTexts.add(leText);
			leText.snapToPosition();
		}
		
		#if MODS_ALLOWED
		var textBG:FlxSprite = new FlxSprite(0, FlxG.height - 42).makeGraphic(FlxG.width, 42, 0xFF000000);
		textBG.alpha = 0.6;
		add(textBG);

		directoryTxt = new FlxText(textBG.x, textBG.y + 4, FlxG.width, '', 32);
		directoryTxt.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER);
		directoryTxt.scrollFactor.set();
		add(directoryTxt);
		
		for (folder in Mods.getModDirectories())
		{
			directories.push(folder);
		}

		var found:Int = directories.indexOf(Mods.currentModDirectory);
		if(found > -1) curDirectory = found;
		changeDirectory();
		#end
		changeSelection();

		FlxG.mouse.visible = false;
		super.create();
	}

	var holdTime:Float = 0;
	override function update(elapsed:Float)
	{
		var shiftMult:Int = 1;
		if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

		if (controls.UI_UP_P)
		{
			changeSelection(-shiftMult);
			holdTime = 0;
		}
		
		if (controls.UI_DOWN_P)
		{
			changeSelection(shiftMult);
			holdTime = 0;
		}

		if(controls.UI_DOWN || controls.UI_UP)
		{
			var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
			holdTime += elapsed;
			var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

			if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
			{
				changeSelection((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
			}
		}

		if(FlxG.mouse.wheel != 0)
		{
			changeSelection(-shiftMult * FlxG.mouse.wheel);
		}

		#if MODS_ALLOWED
		if(controls.UI_LEFT_P)
		{
			changeDirectory(-1);
		}
		if(controls.UI_RIGHT_P)
		{
			changeDirectory(1);
		}
		#end

		if (controls.BACK)
		{
			FlxG.switchState(() -> new MainMenuState());
		}

		if (controls.ACCEPT)
		{
			switch(options[curSelected]) {
				case 'Editor de Charteo'://felt it would be cool maybe
					LoadingState.loadAndSwitchState(new ChartingState(), false);
				case 'Editor de Personajes':
					LoadingState.loadAndSwitchState(new CharacterEditorState(Character.DEFAULT_CHARACTER, false));
				case 'Editor de Semanas':
					LoadingState.loadAndSwitchState(new WeekEditorState(), false);
				case 'Editor de Pers. de Menú':
					LoadingState.loadAndSwitchState(new MenuCharacterEditorState(), false);
				case 'Editor de Diálogo':
					LoadingState.loadAndSwitchState(new DialogueEditorState(), false);
				case 'Editor de Pers. de Diálogo':
					LoadingState.loadAndSwitchState(new DialogueCharacterEditorState(), false);
				case 'Debug de Note Splash':
					LoadingState.loadAndSwitchState(new NoteSplashDebugState(), false);
			}
			FlxG.sound.music.volume = 0;
			FreeplayState.destroyFreeplayVocals();
		}
		
		var bullShit:Int = 0;
		for (item in grpTexts.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				// item.setGraphicSize(Std.int(item.width));
			}
		}
		super.update(elapsed);
	}

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = options.length - 1;
		if (curSelected >= options.length)
			curSelected = 0;
	}

	#if MODS_ALLOWED
	function changeDirectory(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		curDirectory += change;

		if(curDirectory < 0)
			curDirectory = directories.length - 1;
		if(curDirectory >= directories.length)
			curDirectory = 0;
	
		WeekData.setDirectoryFromWeek();
		if(directories[curDirectory] == null || directories[curDirectory].length < 1)
			directoryTxt.text = '< No Mod Directory Loaded >';
		else
		{
			Mods.currentModDirectory = directories[curDirectory];
			directoryTxt.text = '< Loaded Mod Directory: ' + Mods.currentModDirectory + ' >';
		}
		directoryTxt.text = directoryTxt.text.toUpperCase();
	}
	#end
}