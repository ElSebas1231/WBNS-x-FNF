package options;

import states.MainMenuState;
import backend.StageData;

class OptionsState extends MusicBeatState
{
	var options:Array<String> = ['Color de Notas', 'Controles', 'Adjustar Delay y Combo', 'Gráficos', 'Visuales y UI', 'Gameplay'];
	private var grpOptions:FlxTypedGroup<Alphabet>;
	private static var curSelected:Int = 0;
	public static var menuBG:FlxSprite;
	public static var onPlayState:Bool = false;

	function openSelectedSubstate(label:String) {
		switch(label) {
			case 'Color de Notas':
				openSubState(new options.NotesSubState());
			case 'Controles':
				openSubState(new options.ControlsSubState());
			case 'Gráficos':
				openSubState(new options.GraphicsSettingsSubState());
			case 'Visuales y UI':
				openSubState(new options.VisualsUISubState());
			case 'Gameplay':
				openSubState(new options.GameplaySettingsSubState());
			case 'Adjustar Delay y Combo':
				FlxG.switchState(() -> new options.NoteOffsetState());
		}
	}

	var selectorLeft:Alphabet;
	var selectorRight:Alphabet;

	override function create() {
		Paths.clearStoredMemory();
		
		#if desktop
		DiscordClient.changePresence("Menú de Opciones", null);
		#end

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.antialiasing = ClientPrefs.data.antialiasing;
		bg.color = 0xFFea71fd;
		bg.updateHitbox();

		bg.screenCenter();
		add(bg);

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		for (i in 0...options.length)
		{
			var optionText:Alphabet = new Alphabet(0, 0, options[i], true);
			optionText.screenCenter();
			optionText.y += (100 * (i - (options.length / 2))) + 50;
			grpOptions.add(optionText);

			switch(i)
			{
				case 3:
					optionText.y = optionText.y + 15;
			}
		}

		selectorLeft = new Alphabet(0, 0, '>', true);
		add(selectorLeft);
		selectorRight = new Alphabet(0, 0, '<', true);
		add(selectorRight);

		Paths.clearUnusedMemory();

		changeSelection();
		ClientPrefs.saveSettings();

		super.create();
	}

	override function closeSubState() {
		super.closeSubState();
		ClientPrefs.saveSettings();
	}

	var holdTime:Float = 0;
	override function update(elapsed:Float) {
		super.update(elapsed);

		var shiftMult:Int = 1;
		if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

		if (controls.UI_UP_P) {
			changeSelection(-shiftMult);
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.5);
			holdTime = 0;
		}
		
		if (controls.UI_DOWN_P) {
			changeSelection(shiftMult);
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.5);
			holdTime = 0;
		}

		if(controls.UI_DOWN || controls.UI_UP)
		{
			var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
			holdTime += elapsed;
			var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

			if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'), 0.5);
				changeSelection((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
			}
		}

		if(FlxG.mouse.wheel != 0)
		{
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.5);
			changeSelection(-shiftMult * FlxG.mouse.wheel);
		}

		if (controls.BACK) {
			FlxG.sound.play(Paths.sound('cancelMenu'));
			if(onPlayState)
			{
				StageData.loadDirectory(PlayState.SONG);
				LoadingState.loadAndSwitchState(() -> new PlayState());
				FlxG.sound.music.volume = 0;
			}
			else FlxG.switchState(() -> new MainMenuState());
		}
		else if (controls.ACCEPT || FlxG.mouse.justPressedRight) openSelectedSubstate(options[curSelected]);
	}
	
	function changeSelection(change:Int = 0) {
		curSelected += change;
		if (curSelected < 0)
			curSelected = options.length - 1;
		if (curSelected >= options.length)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in grpOptions.members) {
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			if (item.targetY == 0) {
				item.alpha = 1;
				selectorLeft.x = item.x - 63;
				selectorLeft.y = item.y;
				selectorRight.x = item.x + item.width + 15;
				selectorRight.y = item.y;
			}
		}
		FlxG.sound.play(Paths.sound('scrollMenu'));
	}

	override function destroy()
	{
		ClientPrefs.loadPrefs();
		super.destroy();
	}
}