package states;

import backend.WeekData;
import backend.Highscore;
import backend.Song;

import flixel.input.keyboard.FlxKey;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.frames.FlxFrame;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import haxe.Json;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;

import shaders.ColorSwap;

import states.StoryMenuState;
import states.OutdatedState;
import states.MainMenuState;

typedef TitleData =
{
	titlex:Float,
	titley:Float,
	startx:Float,
	starty:Float,
	gfx:Float,
	gfy:Float,
	backgroundSprite:String,
	bpm:Float
}

class TitleState extends MusicBeatState
{
	public static var muteKeys:Array<FlxKey> = [FlxKey.ZERO];
	public static var volumeDownKeys:Array<FlxKey> = [FlxKey.NUMPADMINUS, FlxKey.MINUS];
	public static var volumeUpKeys:Array<FlxKey> = [FlxKey.NUMPADPLUS, FlxKey.PLUS];

	public static var initialized:Bool = false;

	var blackScreen:FlxSprite;
	var credGroup:FlxGroup;
	var credTextShit:Alphabet;
	var textGroup:FlxGroup;
	var psychLogo:FlxSprite;
	
	var titleTextAlphas:Array<Float> = [1, .64];

	var curWacky:Array<String> = [];

	var wackyImage:FlxSprite;

	var mustUpdate:Bool = false;

	var titleJSON:TitleData;

	public static var updateVersion:String = '';

	override public function create():Void
	{
		Paths.clearStoredMemory();

		#if LUA_ALLOWED
		Mods.pushGlobalMods();
		#end
		Mods.loadTopMod();

		FlxG.fixedTimestep = false;
		FlxG.game.focusLostFramerate = 60;
		FlxG.keys.preventDefaultKeys = [TAB];

		curWacky = FlxG.random.getObject(getIntroTextShit());

		super.create();

		FlxG.save.bind('funkin', CoolUtil.getSavePath());

		ClientPrefs.loadPrefs();

		#if CHECK_FOR_UPDATES
		if(ClientPrefs.data.checkForUpdates && !closedState) {
			trace('checking for update');
			var http = new haxe.Http("https://raw.githubusercontent.com/ShadowMario/FNF-PsychEngine/main/gitVersion.txt");

			http.onData = function (data:String)
			{
				updateVersion = data.split('\n')[0].trim();
				var curVersion:String = MainMenuState.psychEngineVersion.trim();
				trace('version online: ' + updateVersion + ', your version: ' + curVersion);
				if(updateVersion != curVersion) {
					trace('versions arent matching!');
					mustUpdate = true;
				}
			}

			http.onError = function (error) {
				trace('error: $error');
			}

			http.request();
		}
		#end

		Highscore.load();

		// IGNORE THIS!!!
		titleJSON = Json.parse(Paths.getTextFromFile('images/gfDanceTitle.json'));

		if(!initialized)
		{
			if(FlxG.save.data != null && FlxG.save.data.fullscreen)
			{
				FlxG.fullscreen = FlxG.save.data.fullscreen;
				//trace('LOADED FULLSCREEN SETTING!!');
			}
			persistentUpdate = true;
			persistentDraw = true;
		}

		if (FlxG.save.data.weekCompleted != null)
		{
			StoryMenuState.weekCompleted = FlxG.save.data.weekCompleted;
		}

		FlxG.mouse.visible = false;
		#if FREEPLAY
		FlxG.switchState(() -> new FreeplayState());
		#elseif CHARTING
		FlxG.switchState(() -> new ChartingState());
		#else
		if(FlxG.save.data.flashing == null && !FlashingState.leftState) {
			FlxTransitionableState.skipNextTransIn = true;
			FlxTransitionableState.skipNextTransOut = true;
			FlxG.switchState(() -> new FlashingState());
		} else {
			if (initialized)
				startIntro();
			else
			{
				new FlxTimer().start(1, function(tmr:FlxTimer)
				{
					startIntro();
				});
			}
		}
		#end
	}

	var logoBl:FlxSprite;
	var danceLeft:Bool = false;
	var titleText:FlxSprite;
	var swagShader:ColorSwap = null;

	function startIntro()
	{
		if (!initialized)
		{
			if(FlxG.sound.music == null) {
				FlxG.sound.playMusic(Paths.music('freakyMenu'), 0);
			}
		}

		Conductor.bpm = titleJSON.bpm;
		persistentUpdate = true;

		logoBl = new FlxSprite(titleJSON.titlex, titleJSON.titley);
		logoBl.frames = Paths.getSparrowAtlas('logoBumpin');
		logoBl.antialiasing = ClientPrefs.data.antialiasing;

		logoBl.animation.addByPrefix('bump', 'logo bumpin', 24, false);
		logoBl.animation.play('bump');
		logoBl.updateHitbox();

		if(ClientPrefs.data.shaders) swagShader = new ColorSwap();

		add(logoBl);
		if(swagShader != null)
		{
			logoBl.shader = swagShader.shader;
		}

		titleText = new FlxSprite(titleJSON.startx, titleJSON.starty);
		titleText.frames = Paths.getSparrowAtlas('titleEnter');
		var animFrames:Array<FlxFrame> = [];
		@:privateAccess {
			titleText.animation.findByPrefix(animFrames, "Press Enter to Begin");
			titleText.animation.findByPrefix(animFrames, "ENTER FREEZE");
		}
		
		if (animFrames.length > 0) {
			newTitle = true;
			
			titleText.animation.addByPrefix('idle', "Press Enter to Begin", 24);
			titleText.animation.addByPrefix('press', ClientPrefs.data.flashing ? "ENTER PRESSED" : "ENTER FREEZE", 24);
		}
		else {
			newTitle = false;
			
			titleText.animation.addByPrefix('idle', "Press Enter to Begin", 24);
			titleText.animation.addByPrefix('press', "ENTER PRESSED", 24);
		}
		
		titleText.animation.play('idle');
		titleText.updateHitbox();
		// titleText.screenCenter(X);
		add(titleText);

		credGroup = new FlxGroup();
		add(credGroup);
		textGroup = new FlxGroup();

		blackScreen = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		credGroup.add(blackScreen);

		credTextShit = new Alphabet(0, 0, "", true);
		credTextShit.screenCenter();
		credTextShit.visible = false;

		psychLogo = new FlxSprite(0, 0).loadGraphic(Paths.image('psych'));
		psychLogo.visible = false;
		psychLogo.setGraphicSize(Std.int(psychLogo.width * 0.4));
		psychLogo.updateHitbox();
		psychLogo.screenCenter();
		psychLogo.y += 80;
		psychLogo.antialiasing = ClientPrefs.data.antialiasing;
		add(psychLogo);

		if (initialized)
			skipIntro();
		else
			initialized = true;

		Paths.clearUnusedMemory();
	}

	function getIntroTextShit():Array<Array<String>>
	{
		#if MODS_ALLOWED
		var firstArray:Array<String> = Mods.mergeAllTextsNamed('data/introText.txt', Paths.getSharedPath());
		#else
		var fullText:String = Assets.getText(Paths.txt('introText'));
		var firstArray:Array<String> = fullText.split('\n');
		#end
		var swagGoodArray:Array<Array<String>> = [];

		for (i in firstArray)
		{
			swagGoodArray.push(i.split('--'));
		}

		return swagGoodArray;
	}

	var transitioning:Bool = false;	
	var newTitle:Bool = false;
	var titleTimer:Float = 0;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music != null)
			Conductor.songPosition = FlxG.sound.music.time;

		var pressedEnter:Bool = FlxG.keys.justPressed.ENTER || controls.ACCEPT;

		#if mobile
		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed)
			{
				pressedEnter = true;
			}
		}
		#end

		var gamepad:FlxGamepad = FlxG.gamepads.lastActive;

		if (gamepad != null)
		{
			if (gamepad.justPressed.START)
				pressedEnter = true;

			#if switch
			if (gamepad.justPressed.B)
				pressedEnter = true;
			#end
		}
		
		if (newTitle) {
			titleTimer += FlxMath.bound(elapsed, 0, 1);
			if (titleTimer > 2) titleTimer -= 2;
		}

		// EASTER EGG

		if (initialized && !transitioning && skippedIntro)
		{
			if (newTitle && !pressedEnter)
			{
				var timer:Float = titleTimer;
				if (timer >= 1)
					timer = (-timer) + 2;
				
				timer = FlxEase.quadInOut(timer);
				
				titleText.alpha = FlxMath.lerp(titleTextAlphas[0], titleTextAlphas[1], timer);
			}
			
			if(pressedEnter) {
				titleText.color = FlxColor.WHITE;
				titleText.alpha = 1;
				
				if(titleText != null) titleText.animation.play('press');

				FlxG.camera.flash(ClientPrefs.data.flashing ? FlxColor.WHITE : 0x4CFFFFFF, 1);
				FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);

				transitioning = true;
				// FlxG.sound.music.stop();

				new FlxTimer().start(1, function(tmr:FlxTimer)
				{
					if (mustUpdate) {
						FlxG.switchState(() -> new OutdatedState());
					} else {
						FlxG.switchState(() -> new MainMenuState());
					}
					closedState = true;
				});
			}
		}

		if (initialized && pressedEnter && !skippedIntro)
		{
			skipIntro();
		}

		if(swagShader != null)
		{
			if(controls.UI_LEFT) swagShader.hue -= elapsed * 0.1;
			if(controls.UI_RIGHT) swagShader.hue += elapsed * 0.1;
		}
		if (!cheatActive && skippedIntro) cheatCodeShit();

		super.update(elapsed);
	}

	var cheatArray:Array<String> = ['TWO', 'FOUR', 'FIVE', 'TWO', 'FOUR'];
	var cheatArrayAlt:Array<String> = ['NUMPADTWO', 'NUMPADFOUR', 'NUMPADFIVE', 'NUMPADTWO', 'NUMPADFOUR'];
	var curCheatPos:Int = 0;
	var cheatActive:Bool = false;

	function cheatCodeShit():Void
	{
		if (FlxG.keys.justPressed.ANY){ 
			codePress(FlxG.keys.firstJustPressed());
		}
	}
	  
	function codePress(input:FlxKey)
	{
		if (input == cheatArray[curCheatPos]) {
			curCheatPos += 1;

			if (curCheatPos >= cheatArray.length) {
				startCheat();
			}
		} else if (input == cheatArrayAlt[curCheatPos]) {
				curCheatPos += 1;

			if (curCheatPos >= cheatArrayAlt.length) {
				startCheat();
			}
		} else {
			curCheatPos = 0;
		}

		trace(curCheatPos);
	}
	  
	function startCheat():Void
	{
		cheatActive = true;

		var black:FlxSprite = new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		black.alpha = 0;
		add(black);

		FlxG.sound.play(Paths.sound('jingle'));
		FlxG.sound.music.fadeOut(0.5, 0);
		FlxTween.tween(black, {alpha: 1}, 1, {onComplete:
			function(twn:FlxTween) {
				PlayState.SONG = Song.loadFromJson('snow-hard', 'snow');
				PlayState.isStoryMode = false;
				PlayState.storyDifficulty = 0;

				LoadingState.loadAndSwitchState(new PlayState());
			}
		});
		closedState = true;
		transitioning = true;
	}

	function createCoolText(textArray:Array<String>, ?offset:Float = 0)
	{
		for (i in 0...textArray.length)
		{
			var money:Alphabet = new Alphabet(0, 0, textArray[i], true);
			money.screenCenter(X);
			money.y += (i * 60) + 200 + offset;
			if(credGroup != null && textGroup != null) {
				credGroup.add(money);
				textGroup.add(money);
			}
		}
	}

	function addMoreText(text:String, ?offset:Float = 0)
	{
		if(textGroup != null && credGroup != null) {
			var coolText:Alphabet = new Alphabet(0, 0, text, true);
			coolText.screenCenter(X);
			coolText.y += (textGroup.length * 60) + 200 + offset;
			credGroup.add(coolText);
			textGroup.add(coolText);
		}
	}

	function deleteCoolText()
	{
		while (textGroup.members.length > 0)
		{
			credGroup.remove(textGroup.members[0], true);
			textGroup.remove(textGroup.members[0], true);
		}
	}

	private var sickBeats:Int = 0; //Basically curBeat but won't be skipped if you hold the tab or resize the screen
	public static var closedState:Bool = false;
	override function beatHit()
	{
		super.beatHit();

		if(logoBl != null)
			logoBl.animation.play('bump', true);

		if(!closedState) {
			sickBeats++;
			switch (sickBeats)
			{
				case 1:
					//FlxG.sound.music.stop();
					FlxG.sound.playMusic(Paths.music('freakyMenu'), 0);
					FlxG.sound.music.fadeIn(4, 0, 1);
				case 2:
					createCoolText(['NexoV', 'Presenta'], 40);
				case 5: 
					deleteCoolText();
				case 6:
					createCoolText(['Un mod dedicado a'], 40);
				case 9:
					addMoreText('Los WBNS', 60);
				case 11:
					deleteCoolText();
				case 12:
					createCoolText(['Hecho con'], -20);
				case 14:
					psychLogo.visible = true;
				case 16:
					deleteCoolText();
					psychLogo.visible = false;
				case 17:
					addMoreText('Con aporte de');
				case 19:
					addMoreText('Muchas personas');
				case 20:
						addMoreText('No, de verdad, si son muchas');
				case 21:
					deleteCoolText();
				case 22:
					addMoreText(curWacky[0]);
				case 24:
					if (curWacky[2] != null) {
						addMoreText(curWacky[1]);
					}
				case 26:
					if (curWacky[2] != null) {
						addMoreText(curWacky[2]);
					} else {
						addMoreText(curWacky[1]);
					}
				case 28:
					deleteCoolText();
				case 29:
					addMoreText('WBNS');
				case 30:
					addMoreText('x');
				case 31:
					addMoreText('FNF');
				case 33:
					skipIntro();
			}
		}
	}

	var skippedIntro:Bool = false;
	var increaseVolume:Bool = false;
	function skipIntro():Void
	{
		#if desktop
		DiscordClient.changePresence("En la pantalla del título");
		#end

		if (!skippedIntro)
		{
			remove(psychLogo);
			remove(credGroup);
			if (ClientPrefs.data.flashing) FlxG.camera.flash(FlxColor.WHITE, 4);
			skippedIntro = true;
		}
	}
}
