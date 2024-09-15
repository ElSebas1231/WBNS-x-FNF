package substates;

import backend.WeekData;
import backend.Highscore;
import backend.Song;

import flixel.addons.transition.FlxTransitionableState;

import flixel.util.FlxStringUtil;

import states.StoryMenuState;
import states.FreeplayState;
import options.OptionsState;

class PauseSubState extends MusicBeatSubstate
{
	var grpMenuShit:FlxTypedGroup<Alphabet>;

	var menuItems:Array<String> = [];
	var menuItemsOG:Array<String> = ['Resumir', 'Reiniciar canción', 'Cambiar Dificultad', 'Opciones', 'Salir al menú'];
	var difficultyChoices = [];
	var curSelected:Int = 0;

	var pauseMusic:FlxSound;
	var practiceText:FlxText;
	var songArtist:FlxText;
	var skipTimeText:FlxText;
	var skipTimeTracker:Alphabet;
	var curTime:Float = Math.max(0, Conductor.songPosition);

	var missingTextBG:FlxSprite;
	var missingText:FlxText;

	var artistFadeDelay:Float = 5.0;
	var artistFadeDuration:Float = 0.75;
	var allowInput:Bool = false;

	public static var songName:String = '';

	public function new(x:Float, y:Float)
	{
		super();
		if(Difficulty.list.length < 2) menuItemsOG.remove('Cambiar Dificultad'); //No need to change difficulty if there is only one!

		if(PlayState.chartingMode)
		{
			menuItemsOG.insert(2, 'Quitar Modo Charteo');
			
			var num:Int = 0;
			if(!PlayState.instance.startingSong)
			{
				num = 1;
				menuItemsOG.insert(3, 'Saltar Tiempo');
			}
			menuItemsOG.insert(3 + num, 'Terminar Canción');
			menuItemsOG.insert(4 + num, 'Alternar Modo Práctica');
			menuItemsOG.insert(5 + num, 'Alternar Botplay');
		}
		menuItems = menuItemsOG;

		for (i in 0...Difficulty.list.length) {
			var diff:String = Difficulty.getString(i);
			difficultyChoices.push(diff);
		}
		difficultyChoices.push('Volver');


		pauseMusic = new FlxSound();
		if(songName != null) {
			pauseMusic.loadEmbedded(Paths.music(songName), true, true);
		} else if (songName != 'None') {
			pauseMusic.loadEmbedded(Paths.music(Paths.formatToSongPath(ClientPrefs.data.pauseMusic)), true, true);
		}

		if (ClientPrefs.data.pauseMusic == 'Breakfast' && PlayState.isPixelStage) {
			pauseMusic.loadEmbedded(Paths.music(Paths.formatToSongPath('breakfast-pixel')), true, true);
		}

		pauseMusic.volume = 0;
		pauseMusic.play(false, FlxG.random.int(0, Std.int(pauseMusic.length / 2)));

		FlxG.sound.list.add(pauseMusic);

		var bg:FlxSprite = new FlxSprite().makeGraphic(1, 1, FlxColor.BLACK);
		bg.scale.set(FlxG.width, FlxG.height);
		bg.updateHitbox();
		bg.alpha = 0;
		bg.scrollFactor.set();
		add(bg);

		var levelInfo:FlxText = new FlxText(20, 15, 0, PlayState.SONG.song, 32);
		levelInfo.scrollFactor.set();
		levelInfo.setFormat(Paths.font("vcr.ttf"), 32);
		levelInfo.updateHitbox();
		add(levelInfo);

		songArtist = new FlxText(20, levelInfo.y + 32, 0, 'Compositor(es): ' + PlayState.SONG.composer, 32);
		songArtist.scrollFactor.set();
		songArtist.setFormat(Paths.font("vcr.ttf"), 32);
		songArtist.updateHitbox();
		add(songArtist);
		
		var levelDifficulty:FlxText = new FlxText(20, levelInfo.y + 64, 0, Difficulty.getString().toUpperCase(), 32);
		levelDifficulty.scrollFactor.set();
		levelDifficulty.setFormat(Paths.font('vcr.ttf'), 32);
		levelDifficulty.updateHitbox();
		add(levelDifficulty);

		var blueballedTxt:FlxText = new FlxText(20, levelInfo.y + 96, 0, "Blueballed: " + PlayState.deathCounter, 32);
		blueballedTxt.scrollFactor.set();
		blueballedTxt.setFormat(Paths.font('vcr.ttf'), 32);
		blueballedTxt.updateHitbox();
		add(blueballedTxt);

		practiceText = new FlxText(20, 15 + 101, 0, "PRACTICE MODE", 32);
		practiceText.scrollFactor.set();
		practiceText.setFormat(Paths.font('vcr.ttf'), 32);
		practiceText.x = FlxG.width - (practiceText.width + 20);
		practiceText.updateHitbox();
		practiceText.visible = PlayState.instance.practiceMode;
		add(practiceText);

		var chartingText:FlxText = new FlxText(20, 15 + 101, 0, "CHARTING MODE", 32);
		chartingText.scrollFactor.set();
		chartingText.setFormat(Paths.font('vcr.ttf'), 32);
		chartingText.x = FlxG.width - (chartingText.width + 20);
		chartingText.y = FlxG.height - (chartingText.height + 20);
		chartingText.updateHitbox();
		chartingText.visible = PlayState.chartingMode;
		add(chartingText);

		blueballedTxt.alpha = 0;
		levelDifficulty.alpha = 0;
		levelInfo.alpha = 0;
		songArtist.alpha = 0;

		levelInfo.x = FlxG.width - (levelInfo.width + 20);
		songArtist.x = FlxG.width - (songArtist.width + 10);
		blueballedTxt.x = FlxG.width - (blueballedTxt.width + 20);
		levelDifficulty.x = FlxG.width - (levelDifficulty.width + 20);

		FlxTween.tween(bg, {alpha: 0.6}, 0.4, {ease: FlxEase.quartOut});
		FlxTween.tween(levelInfo, {alpha: 1, y: 20}, 0.4, {ease: FlxEase.quartOut, startDelay: 0.1});
		FlxTween.tween(songArtist, {alpha: 1, y: songArtist.y + 5}, 0.4, {
			ease: FlxEase.quartOut, 
			startDelay: 0.2,
			onComplete: (_) -> {
				startCharterTimer();
			}
		});
		FlxTween.tween(levelDifficulty, {alpha: 1, y: levelDifficulty.y + 5}, 0.4, {ease: FlxEase.quartOut, startDelay: 0.3});
		FlxTween.tween(blueballedTxt, {alpha: 1, y: blueballedTxt.y + 5}, 0.4, {ease: FlxEase.quartOut, startDelay: 0.4});

		grpMenuShit = new FlxTypedGroup<Alphabet>();
		add(grpMenuShit);

		missingTextBG = new FlxSprite().makeGraphic(1, 1, FlxColor.BLACK);
		missingTextBG.scale.set(FlxG.width, FlxG.height);
		missingTextBG.updateHitbox();
		missingTextBG.alpha = 0.6;
		missingTextBG.visible = false;
		add(missingTextBG);
		
		missingText = new FlxText(50, 0, FlxG.width - 100, '', 24);
		missingText.setFormat(Paths.font("vcr.ttf"), 24, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		missingText.scrollFactor.set();
		missingText.visible = false;
		add(missingText);

		new FlxTimer().start(0.1, (_) -> {
			allowInput = true;
		});

		regenMenu();

		cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];
	}

	var holdTime:Float = 0;
	var cantUnpause:Float = 0.1;

	override function update(elapsed:Float)
	{
		var shiftMult:Int = 1;
		if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

		cantUnpause -= elapsed;
		if (pauseMusic.volume < 0.5 && pauseMusic.volume <= 1) pauseMusic.volume += 0.1 * elapsed;

		super.update(elapsed);

		if (allowInput) {
			if(controls.BACK) {
				close();
				allowInput = false;
				return;
			}
	
			if(controls.UI_DOWN || controls.UI_UP) {
				var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
				holdTime += elapsed;
				var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);
	
				if(holdTime > 0.5 && checkNewHold - checkLastHold > 0) {
					changeSelection((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
				}
			}
	
			updateSkipTextStuff();

			if (controls.UI_UP_P) {
				changeSelection(-shiftMult, true);
				holdTime = 0;
			}

			if (controls.UI_DOWN_P) {
				changeSelection(shiftMult, true);
				holdTime = 0;
			}
	
			if(FlxG.mouse.wheel != 0){
				changeSelection(-shiftMult * FlxG.mouse.wheel, true);
			}
	
			var daSelected:String = menuItems[curSelected];
			switch (daSelected) {
				case 'Saltar Tiempo':
				if (controls.UI_LEFT_P) {
					FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
					curTime -= 1000;
					holdTime = 0;
				}
				
				if (controls.UI_RIGHT_P) {
					FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
					curTime += 1000;
					holdTime = 0;
				}

				if(controls.UI_LEFT || controls.UI_RIGHT) {
					holdTime += elapsed;
					if(holdTime > 0.5)
					{
						curTime += 45000 * elapsed * (controls.UI_LEFT ? -1 : 1);
					}

					if(curTime >= FlxG.sound.music.length) curTime -= FlxG.sound.music.length;
					else if(curTime < 0) curTime += FlxG.sound.music.length;
					updateSkipTimeText();
				}
			}
	
			if (controls.ACCEPT || FlxG.mouse.justPressedRight && (cantUnpause <= 0 || !controls.controllerMode)) {
				if (menuItems == difficultyChoices) {
					try {
						if(menuItems.length - 1 != curSelected && difficultyChoices.contains(daSelected)) {
	
							var name:String = PlayState.SONG.song;
							var poop = Highscore.formatSong(name, curSelected);
							PlayState.SONG = Song.loadFromJson(poop, name);
							PlayState.storyDifficulty = curSelected;
							FlxG.resetState();
							FlxG.sound.music.volume = 0;
							PlayState.changedDifficulty = true;
							PlayState.chartingMode = false;
							return;
						}					
					} catch(e:Dynamic) {
						trace('ERROR! $e');
	
						var errorStr:String = e.toString();
						if(errorStr.startsWith('[file_contents,assets/data/')) errorStr = 'Missing file: ' + errorStr.substring(27, errorStr.length-1); //Missing chart
						missingText.text = 'ERROR WHILE LOADING CHART:\n$errorStr';
						missingText.screenCenter(Y);
						missingText.visible = true;
						missingTextBG.visible = true;
						FlxG.sound.play(Paths.sound('cancelMenu'));
	
						super.update(elapsed);
						return;
					}
	
					menuItems = menuItemsOG;
					regenMenu();
				}
	
				switch (daSelected) {
					case "Resumir":
						close();
						allowInput = false;
					case 'Cambiar Dificultad':
						menuItems = difficultyChoices;
						deleteSkipTimeText();
						regenMenu();
					case 'Alternar Modo Práctica':
						PlayState.instance.practiceMode = !PlayState.instance.practiceMode;
						PlayState.changedDifficulty = true;
						practiceText.visible = PlayState.instance.practiceMode;
					case "Reiniciar canción":
						restartSong();
					case "Quitar Modo Charteo":
						restartSong();
						PlayState.chartingMode = false;
					case 'Saltar Tiempo':
						if(curTime < Conductor.songPosition)
						{
							PlayState.startOnTime = curTime;
							restartSong(true);
						}
						else
						{
							if (curTime != Conductor.songPosition)
							{
								PlayState.instance.clearNotesBefore(curTime);
								PlayState.instance.setSongTime(curTime);
							}
							close();
							allowInput = false;
						}
					case 'Terminar Canción':
						close();
						allowInput = false;
						PlayState.instance.notes.clear();
						PlayState.instance.unspawnNotes = [];
						PlayState.instance.finishSong(true);
					case 'Alternar Botplay':
						PlayState.instance.cpuControlled = !PlayState.instance.cpuControlled;
						PlayState.changedDifficulty = true;
						PlayState.instance.botplayTxt.visible = PlayState.instance.cpuControlled;
						PlayState.instance.botplayTxt.alpha = 1;
						PlayState.instance.botplaySine = 0;
					case 'Opciones':
						PlayState.instance.paused = true; // For lua
						PlayState.instance.vocals.volume = 0;
						FlxG.switchState(() -> new OptionsState());
						if(ClientPrefs.data.pauseMusic != 'None')
						{
							FlxG.sound.playMusic(Paths.music(Paths.formatToSongPath(ClientPrefs.data.pauseMusic)), pauseMusic.volume);
	
							if (ClientPrefs.data.pauseMusic == 'Breakfast' && PlayState.isPixelStage) {
								FlxG.sound.playMusic(Paths.music(Paths.formatToSongPath('breakfast-pixel')), pauseMusic.volume);
							}
	
							FlxTween.tween(FlxG.sound.music, {volume: 1}, 0.8);
							FlxG.sound.music.time = pauseMusic.time;
						}
						OptionsState.onPlayState = true;
					case "Salir al menú":
						#if desktop DiscordClient.resetClientID(); #end
						PlayState.deathCounter = 0;
						PlayState.seenCutscene = false;
	
						Mods.loadTopMod();
	
						if (!ClientPrefs.data.noStickers) {
							if (PlayState.isStoryMode) {
								openSubState(new StickerSubState(null, (sticker) -> new StoryMenuState(sticker)));
							} else {
								openSubState(new StickerSubState(null, (sticker) -> new FreeplayState(sticker)));
							}
						} else {
							if(PlayState.isStoryMode) {
								FlxG.switchState(() -> new StoryMenuState());
							} else {
								FlxG.switchState(() -> new FreeplayState());
							}
						}
	
						PlayState.cancelMusicFadeTween();
						FlxG.sound.playMusic(Paths.music('freakyMenu'));
						PlayState.changedDifficulty = false;
						PlayState.chartingMode = false;
						FlxG.camera.followLerp = 0;
				}
			}
		}
	}

	function deleteSkipTimeText()
	{
		if(skipTimeText != null)
		{
			skipTimeText.kill();
			remove(skipTimeText);
			skipTimeText.destroy();
		}
		skipTimeText = null;
		skipTimeTracker = null;
	}

	public static function restartSong(noTrans:Bool = false)
	{
		PlayState.instance.paused = true; // For lua
		FlxG.sound.music.volume = 0;
		PlayState.instance.vocals.volume = 0;

		if(noTrans)
		{
			FlxTransitionableState.skipNextTransIn = true;
			FlxTransitionableState.skipNextTransOut = true;
		}
		FlxG.resetState();
	}

	override function destroy()
	{
		pauseMusic.destroy();

		if (charterFadeTween != null) {
			charterFadeTween.cancel();
			charterFadeTween = null;	
		}

		super.destroy();
	}

	function changeSelection(change:Int = 0, playSound:Bool = false):Void
	{
		curSelected += change;

		if (playSound) FlxG.sound.play(Paths.sound('scrollMenu'), 0.5);

		if (curSelected < 0)
			curSelected = menuItems.length - 1;
		if (curSelected >= menuItems.length)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in grpMenuShit.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				// item.setGraphicSize(Std.int(item.width));

				if(item == skipTimeTracker)
				{
					curTime = Math.max(0, Conductor.songPosition);
					updateSkipTimeText();
				}
			}
		}
		missingText.visible = false;
		missingTextBG.visible = false;
	}

	var charterFadeTween:Null<FlxTween> = null;

	function startCharterTimer():Void
	{
		charterFadeTween = FlxTween.tween(songArtist, {alpha: 0}, artistFadeDuration, {
			startDelay: artistFadeDelay,
			ease: FlxEase.quartOut,
			onComplete: (_) -> {
				songArtist.text = 'Charter(es): ' + PlayState.SONG.charter;
				songArtist.x = FlxG.width - (songArtist.width + 10);

				FlxTween.tween(songArtist, {alpha: 1.0}, artistFadeDuration,
				{
					ease: FlxEase.quartOut,
					onComplete: (_) -> {
					startArtistTimer();
					}
				});
			}
		});
	}

	function startArtistTimer():Void
	{
		charterFadeTween = FlxTween.tween(songArtist, {alpha: 0}, artistFadeDuration, {
			startDelay: artistFadeDelay, 
			ease: FlxEase.quartOut, 
			onComplete: (_) -> {
				songArtist.text = 'Compositor(es): ' + PlayState.SONG.composer;
				songArtist.x = FlxG.width - (songArtist.width + 10);

				FlxTween.tween(songArtist, {alpha: 1.0}, artistFadeDuration, {
					ease: FlxEase.quartOut,
					onComplete: (_) -> {
						startCharterTimer();
					}
				});
			}
		});
	}

	function regenMenu():Void {
		for (i in 0...grpMenuShit.members.length) {
			var obj = grpMenuShit.members[0];
			obj.kill();
			grpMenuShit.remove(obj, true);
			obj.destroy();
		}

		for (i in 0...menuItems.length) {
			var item = new Alphabet(90, 320, menuItems[i], true);
			item.isMenuItem = true;
			item.targetY = i;
			grpMenuShit.add(item);

			if(menuItems[i] == 'Saltar Tiempo')
			{
				skipTimeText = new FlxText(0, 0, 0, '', 64);
				skipTimeText.setFormat(Paths.font("vcr.ttf"), 64, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
				skipTimeText.scrollFactor.set();
				skipTimeText.borderSize = 2;
				skipTimeTracker = item;
				add(skipTimeText);

				updateSkipTextStuff();
				updateSkipTimeText();
			}
		}
		curSelected = 0;
		changeSelection();
	}
	
	function updateSkipTextStuff()
	{
		if(skipTimeText == null || skipTimeTracker == null) return;

		skipTimeText.x = skipTimeTracker.x + skipTimeTracker.width + 60;
		skipTimeText.y = skipTimeTracker.y;
		skipTimeText.visible = (skipTimeTracker.alpha >= 1);
	}

	function updateSkipTimeText()
	{
		skipTimeText.text = FlxStringUtil.formatTime(Math.max(0, Math.floor(curTime / 1000)), false) + ' / ' + FlxStringUtil.formatTime(Math.max(0, Math.floor(FlxG.sound.music.length / 1000)), false);
	}
}
