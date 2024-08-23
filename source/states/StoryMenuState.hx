package states;

import backend.WeekData;
import backend.Highscore;
import backend.Song;

import flixel.group.FlxGroup;
import flixel.graphics.FlxGraphic;
import flixel.addons.display.FlxBackdrop;

import objects.MenuItem;
import objects.MenuCharacter;

import substates.GameplayChangersSubstate;
import substates.ResetScoreSubState;
import substates.StickerSubState;

class StoryMenuState extends MusicBeatState
{
	public static var weekCompleted:Map<String, Bool> = new Map<String, Bool>();

	var scoreText:FlxText;

	private static var lastDifficultyName:String = '';
	var curDifficulty:Int = 1;

	var txtWeekTitle:FlxText;
	var bgSprite:FlxSprite;

	private static var curWeek:Int = 0;

	var txtTracklist:FlxText;

	var grpWeekText:FlxTypedGroup<MenuItem>;

	var grpLocks:FlxTypedGroup<FlxSprite>;

	var difficultySelectors:FlxGroup;
	var sprDifficulty:FlxSprite;
	var leftArrow:FlxSprite;
	var rightArrow:FlxSprite;
	var upArrow:FlxSprite;
	var downArrow:FlxSprite;

	var loadedWeeks:Array<WeekData> = [];

	var stickerSubState:StickerSubState;
	
	public function new(?stickers:StickerSubState = null)
	{
		super();
	  
		if (stickers != null)
		{
			stickerSubState = stickers;
		}
	}

	override function create()
	{
		Paths.clearUnusedMemory();

		if (stickerSubState != null && !ClientPrefs.data.noStickers) {
			  openSubState(stickerSubState);
			  stickerSubState.degenStickers();
		} else {
			Paths.clearStoredMemory();
		}

		PlayState.isStoryMode = true;
		WeekData.reloadWeekFiles(true);
		if(curWeek >= WeekData.weeksList.length) curWeek = 0;
		persistentUpdate = persistentDraw = true;

		scoreText = new FlxText(10, 10, 0, "SCORE: 49324858", 36);
		scoreText.setFormat("VCR OSD Mono", 32);

		var sillyText:FlxText = new FlxText(FlxG.width * 0.7, 10);
		sillyText.text = 'Selección de semanas';
		sillyText.setFormat(Paths.font("vcr.ttf"), 32);
		sillyText.size = scoreText.size;

		txtWeekTitle = new FlxText(10, 650, 0, "", 40);
		txtWeekTitle.x = sillyText.x + 200;
		txtWeekTitle.setFormat("VCR OSD Mono", 40, FlxColor.WHITE, RIGHT);

		var ui_tex = Paths.getSparrowAtlas('campaign_menu_UI_assets');

		bgSprite = new FlxSprite(0, 56);
		bgSprite.screenCenter();
		bgSprite.antialiasing = ClientPrefs.data.antialiasing;
		add(bgSprite);

		grpWeekText = new FlxTypedGroup<MenuItem>();
		add(grpWeekText);

		var blackBarThingie:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, 56, FlxColor.BLACK);
		add(blackBarThingie);

		var blackBarBottom:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, 200, FlxColor.BLACK);
		blackBarBottom.y = 620;
		add(blackBarBottom);

		grpLocks = new FlxTypedGroup<FlxSprite>();
		add(grpLocks);

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Menú del Modo Historia", null);
		#end

		var num:Int = 0;
		for (i in 0...WeekData.weeksList.length) {
			var weekFile:WeekData = WeekData.weeksLoaded.get(WeekData.weeksList[i]);
			var isLocked:Bool = weekIsLocked(WeekData.weeksList[i]);
			if(!isLocked || !weekFile.hiddenUntilUnlocked) {
				loadedWeeks.push(weekFile);
				WeekData.setDirectoryFromWeek(weekFile);
				var weekThing:MenuItem = new MenuItem(0, bgSprite.y + 356, WeekData.weeksList[i]);
				weekThing.y += ((weekThing.height + 20) * num);
				weekThing.targetY = num;
				weekThing.forceRepo();
				weekThing.screenCenter(Y);

				// Arreglos del sprite de Soarinng
				if (i == 4){
					weekThing.scale.set(0.7, 0.7);
					weekThing.updateHitbox();
				}
				
				weekThing.updateHitbox();
				grpWeekText.add(weekThing);
				num++;
			}
		}

		WeekData.setDirectoryFromWeek(loadedWeeks[0]);

		difficultySelectors = new FlxGroup();
		add(difficultySelectors);

		leftArrow = new FlxSprite(0, 0);
		leftArrow.x = 165;
		leftArrow.screenCenter(Y);
		leftArrow.y -= 50;
		leftArrow.antialiasing = ClientPrefs.data.antialiasing;
		leftArrow.frames = ui_tex;
		leftArrow.animation.addByPrefix('idle', "arrow left");
		leftArrow.animation.addByPrefix('press', "arrow push left");
		leftArrow.animation.play('idle');

		Difficulty.resetList();
		if(lastDifficultyName == '')
		{
			lastDifficultyName = Difficulty.getDefault();
		}
		curDifficulty = Math.round(Math.max(0, Difficulty.defaultList.indexOf(lastDifficultyName)));

		sprDifficulty = new FlxSprite(50, 635);
		sprDifficulty.antialiasing = ClientPrefs.data.antialiasing;
		difficultySelectors.add(sprDifficulty);

		upArrow = new FlxSprite(50, sprDifficulty.getGraphicMidpoint().y - 50);
		upArrow.scale.set(0.6, 0.6);
		upArrow.angle = 90;
		upArrow.antialiasing = ClientPrefs.data.antialiasing;
		upArrow.frames = ui_tex;
		upArrow.animation.addByPrefix('idle', "arrow left");
		upArrow.animation.addByPrefix('press', "arrow push left");
		upArrow.animation.play('idle');

		downArrow = new FlxSprite(upArrow.x, upArrow.y + 80);
		downArrow.angle = -90;
		downArrow.scale.set(0.6, 0.6);
		downArrow.antialiasing = ClientPrefs.data.antialiasing;
		downArrow.frames = ui_tex;
		downArrow.animation.addByPrefix('idle', "arrow left");
		downArrow.animation.addByPrefix('press', "arrow push left");
		downArrow.animation.play('idle');

		rightArrow = new FlxSprite(leftArrow.x + 900, leftArrow.y);
		rightArrow.antialiasing = ClientPrefs.data.antialiasing;
		rightArrow.frames = ui_tex;
		rightArrow.animation.addByPrefix('idle', 'arrow right');
		rightArrow.animation.addByPrefix('press', "arrow push right", 24, false);
		rightArrow.animation.play('idle');

		add(sillyText);
		add(txtWeekTitle);
		add(scoreText);

		difficultySelectors.add(leftArrow);
		difficultySelectors.add(rightArrow);
		difficultySelectors.add(upArrow);
		difficultySelectors.add(downArrow);

		changeWeek();
		changeDifficulty();

		super.create();
	}

	override function closeSubState() {
		persistentUpdate = true;
		changeWeek();
		super.closeSubState();
	}

	var holdTime:Float = 0;
	override function update(elapsed:Float)
	{
		if (FlxG.sound.music != null) Conductor.songPosition = FlxG.sound.music.time;
		lerpScore = Math.floor(FlxMath.lerp(lerpScore, intendedScore, FlxMath.bound(elapsed * 30, 0, 1)));
		if(Math.abs(intendedScore - lerpScore) < 10) lerpScore = intendedScore;

		var shiftMult:Int = 1;
		if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

		scoreText.text = "PUNTACIÓN DE SEMANA: " + lerpScore;

		if (!movedBack && !selectedWeek)
		{
			var upP = controls.UI_LEFT_P;
			var downP = controls.UI_RIGHT_P;

			if (upP) {
				FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
				changeWeek(-shiftMult);
				changeDifficulty();
				holdTime = 0;
			}
			
			if (downP)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
				changeWeek(shiftMult);
				changeDifficulty();
				holdTime = 0;
			}

			if (controls.UI_UP_P) {
				changeDifficulty(1);
				holdTime = 0;
				FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
			}
			
			if (controls.UI_DOWN_P) {
				changeDifficulty(-1);
				holdTime = 0;
				FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
			}

			if (controls.UI_RIGHT)
				rightArrow.animation.play('press');
			else
				rightArrow.animation.play('idle');

			if (controls.UI_LEFT)
				leftArrow.animation.play('press');
			else
				leftArrow.animation.play('idle');

			if (controls.UI_UP)
				upArrow.animation.play('press');
			else
				upArrow.animation.play('idle');

			if (controls.UI_DOWN)
				downArrow.animation.play('press');
			else
				downArrow.animation.play('idle');

			if(controls.UI_RIGHT || controls.UI_LEFT)
			{
				var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
				holdTime += elapsed;
				var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

				if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
				{
					FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
					changeWeek((checkNewHold - checkLastHold) * (controls.UI_LEFT ? -shiftMult : shiftMult));
				}
			}

			if(controls.UI_UP || controls.UI_DOWN)
			{
				var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
				holdTime += elapsed;
				var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

				if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
				{
					FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
					changeDifficulty((checkNewHold - checkLastHold) * (controls.UI_DOWN ? -shiftMult : shiftMult));
					changeDifficulty();
				}
			}

			if(FlxG.mouse.wheel != 0) {
				FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
				changeWeek(-shiftMult * FlxG.mouse.wheel);
				changeDifficulty();
			}

			if(FlxG.keys.justPressed.CONTROL) {
				persistentUpdate = false;
				openSubState(new GameplayChangersSubstate());
			} else if(controls.RESET) {
				persistentUpdate = false;
				openSubState(new ResetScoreSubState('', curDifficulty, '', curWeek));
				FlxG.sound.play(Paths.sound('cancelMenu'));
			} else if (controls.ACCEPT || FlxG.mouse.justPressedRight) {
				selectWeek();
			}
		}

		if (controls.BACK && !movedBack && !selectedWeek)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			movedBack = true;
			FlxG.switchState(() -> new MainMenuState());
		}

		if (grpWeekText.members[curWeek].animation.curAnim.name == 'selected') {
			if (curBeat % 2 == 0) {
				grpWeekText.members[curWeek].select();
			}
		}

		super.update(elapsed);
	}

	override function beatHit()
	{
		super.beatHit();
	}

	var movedBack:Bool = false;
	var selectedWeek:Bool = false;
	var stopspamming:Bool = false;

	function selectWeek()
		{
			if (!weekIsLocked(loadedWeeks[curWeek].fileName))
			{
				// We can't use Dynamic Array .copy() because that crashes HTML5, here's a workaround.
				var songArray:Array<String> = [];
				var leWeek:Array<Dynamic> = loadedWeeks[curWeek].songs;
				for (i in 0...leWeek.length) {
					songArray.push(leWeek[i][0]);
				}
	
				// Nevermind that's stupid lmao
				try
				{
					PlayState.storyPlaylist = songArray;
					PlayState.isStoryMode = true;
					selectedWeek = true;
		
					var diffic = Difficulty.getFilePath(curDifficulty);
					if(diffic == null) diffic = '';
		
					PlayState.storyDifficulty = curDifficulty;
		
					PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase() + diffic, PlayState.storyPlaylist[0].toLowerCase());
					PlayState.campaignScore = 0;
					PlayState.campaignMisses = 0;
				}
				catch(e:Dynamic)
				{
					trace('ERROR! $e');
					return;
				}
				
				if (stopspamming == false)
				{
					FlxG.sound.play(Paths.sound('confirmMenu'));
					grpWeekText.members[curWeek].startFlashing();
					stopspamming = true;
				}
	
				new FlxTimer().start(1, function(tmr:FlxTimer)
				{
					LoadingState.loadAndSwitchState(new PlayState(), true);
					FreeplayState.destroyFreeplayVocals();
				});
				
				#if (MODS_ALLOWED && cpp)
				DiscordClient.loadModRPC();
				#end
			} else {
				FlxG.sound.play(Paths.sound('cancelMenu'));
			}
		}

	var tweenDifficulty:FlxTween;
	function changeDifficulty(change:Int = 0):Void
	{
		curDifficulty += change;

		if (curDifficulty < 0)
			curDifficulty = Difficulty.list.length-1;
		if (curDifficulty >= Difficulty.list.length)
			curDifficulty = 0;

		WeekData.setDirectoryFromWeek(loadedWeeks[curWeek]);

		var diff:String = Difficulty.getString(curDifficulty);
		var newImage:FlxGraphic = Paths.image('menudifficulties/' + Paths.formatToSongPath(diff));
		//trace(Mods.currentModDirectory + ', menudifficulties/' + Paths.formatToSongPath(diff));

		if(sprDifficulty.graphic != newImage)
		{
			sprDifficulty.loadGraphic(newImage);
			sprDifficulty.screenCenter(X);
			sprDifficulty.alpha = 0;
			sprDifficulty.x -= 430;

			if(tweenDifficulty != null) tweenDifficulty.cancel();
			tweenDifficulty = FlxTween.tween(sprDifficulty, {alpha: 1}, 0.07, {onComplete: function(twn:FlxTween)
			{
				tweenDifficulty = null;
			}});
		}

		upArrow.x  = sprDifficulty.getGraphicMidpoint().x - 30;
		downArrow.x =  upArrow.x;
		
		lastDifficultyName = diff;

		#if !switch
		intendedScore = Highscore.getWeekScore(loadedWeeks[curWeek].fileName, curDifficulty);
		#end
	}

	var lerpScore:Int = 0;
	var intendedScore:Int = 0;

	function changeWeek(change:Int = 0):Void
	{
		curWeek += change;

		if (curWeek >= loadedWeeks.length)
			curWeek = 0;
		if (curWeek < 0)
			curWeek = loadedWeeks.length - 1;

		var leWeek:WeekData = loadedWeeks[curWeek];
		WeekData.setDirectoryFromWeek(leWeek);

		var leName:String = leWeek.storyName;
		txtWeekTitle.text = leName.toUpperCase();
		txtWeekTitle.x = FlxG.width - (txtWeekTitle.width + 10);

		var bullShit:Int = 0;

		for (item in grpWeekText.members)
		{
			item.targetY = bullShit - curWeek;
			item.alpha = 0.6;
			item.idle();

			if (item.targetY == Std.int(0)){
				item.alpha = 1;
				item.select();
			}
			bullShit++;
		}

		bgSprite.visible = true;
		var assetName:String = leWeek.weekBackground;
		if(assetName == null || assetName.length < 1) {
			bgSprite.visible = false;
		} else {
			bgSprite.loadGraphic(Paths.image('menubackgrounds/menu_' + assetName));
			bgSprite.screenCenter();
		}
		
		PlayState.storyWeek = curWeek;
		Difficulty.loadFromWeek();

		if(Difficulty.list.contains(Difficulty.getDefault()))
			curDifficulty = Math.round(Math.max(0, Difficulty.defaultList.indexOf(Difficulty.getDefault())));
		else
			curDifficulty = 0;

		var newPos:Int = Difficulty.list.indexOf(lastDifficultyName);
		if(newPos > -1) {
			curDifficulty = newPos;
		}
	}

	var locked:Array<String> = [];
	function forceLocked(name) {
		weekCompleted.set(name, false);
		locked.push(name);
	}
	function weekIsLocked(name:String):Bool {
		var leWeek:WeekData = WeekData.weeksLoaded.get(name);
		if(locked.contains(name))
			return true;
		return (!leWeek.startUnlocked && leWeek.weekBefore.length > 0 && (!weekCompleted.exists(leWeek.weekBefore) || !weekCompleted.get(leWeek.weekBefore)));
	}
}