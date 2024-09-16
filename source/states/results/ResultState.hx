package states.results;

import backend.Highscore;
import flixel.addons.transition.FlxTransitionableState;
import substates.StickerSubState;
import backend.FunkinTools;
import backend.Scoring;
import backend.PsychCamera;
import backend.animation.FlxAtlasSprite;
import shaders.LeftMaskShader;
import flixel.FlxSprite;

import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxBitmapFont;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;

import flixel.math.FlxRect;
import flixel.text.FlxBitmapText;

import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxEase;

import flixel.tweens.FlxTween;
import flixel.addons.display.FlxBackdrop;

import flixel.util.FlxGradient;
import flixel.util.FlxTimer;
using backend.FunkinTools;

/**
 * The state for the results screen after a song or week is finished.
 */
//@:nullSafety
class ResultState extends MusicBeatSubstate
{
	final params:ResultsStateParams;

	final rank:ScoringRank;
	final songName:FlxBitmapText;
	final difficulty:FlxBitmapText;
	final clearPercentSmall:ClearPercentCounter;

	final maskShaderSongName:LeftMaskShader = new LeftMaskShader();
	final maskShaderDifficulty:LeftMaskShader = new LeftMaskShader();

	final resultsAnim:FlxSprite;
	final ratingsPopin:FlxSprite;
	final scorePopin:FlxSprite;

	final bgFlash:FlxSprite;

	final highscoreNew:FlxSprite;
	final score:ResultScore;

	var rankBg:FlxSprite;
	final cameraBG:PsychCamera;
	final cameraScroll:PsychCamera;
	final cameraEverything:PsychCamera;
	final cameraOverlay:PsychCamera;
	var resultingAccuracy:Float;


	public function new(params:ResultsStateParams)
	{
		super();

		this.params = params;

		resultingAccuracy = Math.min(1,params.scoreData.accPoints/params.scoreData.totalNotesHit); 
		if (params.scoreData.totalNotesHit == 0) resultingAccuracy = 0;

		rank = Scoring.calculateRankFromData(params.scoreData.score,resultingAccuracy,params.scoreData.missed == 0) ?? SHIT;

		cameraBG = new PsychCamera( 0, 0, FlxG.width, FlxG.height);
		cameraScroll = new PsychCamera(0, 0, FlxG.width, FlxG.height);
		cameraEverything = new PsychCamera(0, 0, FlxG.width, FlxG.height);
		cameraOverlay = new PsychCamera(0, 0, FlxG.width, FlxG.height);
		// We build a lot of this stuff in the constructor, then place it in create().
		// This prevents having to do `null` checks everywhere.

		var fontLetters:String = "AaBbCcDdEeFfGgHhiIJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz:1234567890";
		songName = new FlxBitmapText(FlxBitmapFont.fromMonospace(Paths.image("resultScreen/tardlingSpritesheet"), fontLetters, FlxPoint.get(49, 62)));
		songName.text = params.title;
		songName.letterSpacing = -15; //!!!
		songName.angle = -4.4;
		var difColor = PlayState.storyDifficultyColor;
		var fractal = difColor.redFloat*0.33;
		difColor.greenFloat = Math.max(difColor.greenFloat,fractal);

		difficulty = new FlxBitmapText(FlxBitmapFont.fromMonospace(Paths.image("resultScreen/tardlingSpritesheet-white"), fontLetters, FlxPoint.get(49, 62)));
		difficulty.text = Difficulty.list[PlayState.storyDifficulty].toUpperCase();
		difficulty.color = difColor;
		difficulty.letterSpacing = -12; //!!!
		difficulty.angle = -4.4;

		clearPercentSmall = new ClearPercentCounter(FlxG.width / 2 + 300, FlxG.height / 2 - 100, 100, true);
		clearPercentSmall.visible = false;

		bgFlash = FlxGradient.createGradientFlxSprite(FlxG.width, FlxG.height, [0xFFFFF1A6, 0xFFFFF1BE], 90);
		resultsAnim = FunkinTools.createSparrow(-200, -10, "resultScreen/results");
		ratingsPopin = FunkinTools.createSparrow(-135, 135, "resultScreen/ratingsPopin");
		scorePopin = FunkinTools.createSparrow(-180, 515, "resultScreen/scorePopin");
		highscoreNew = new FlxSprite(44, 557);
		score = new ResultScore(35, 305, 10, params.scoreData.score);
		rankBg = new FlxSprite(0, 0);
	}

	override function create():Void
	{
		if (FlxG.sound.music != null) FlxG.sound.music.stop();

		// We need multiple cameras so we can put one at an angle.
		cameraScroll.angle = -3.8;

		cameraBG.bgColor = FlxColor.BLACK;
		cameraScroll.bgColor = FlxColor.TRANSPARENT;
		cameraEverything.bgColor = FlxColor.TRANSPARENT;
		cameraOverlay.bgColor = FlxColor.TRANSPARENT;

		FlxG.cameras.add(cameraBG, false);
		FlxG.cameras.add(cameraScroll, false);
		FlxG.cameras.add(cameraEverything, false);
		FlxG.cameras.add(cameraOverlay, false);

		FlxG.cameras.setDefaultDrawTarget(cameraEverything, true);
		this.camera = cameraEverything;

		// Reset the camera zoom on the results screen.
		FlxG.camera.zoom = 1.0;

		var bg:FlxSprite = FlxGradient.createGradientFlxSprite(FlxG.width, FlxG.height, [0xFFFECC5C, 0xFFFDC05C], 90);
		bg.scrollFactor.set();
		bg.cameras = [cameraBG];
		add(bg);

		bgFlash.scrollFactor.set();
		bgFlash.visible = false;
		add(bgFlash);

		// The sound system which falls into place behind the score text. Plays every time!
		var soundSystem:FlxSprite = FunkinTools.createSparrow(-15, -180, 'resultScreen/soundSystem');
		soundSystem.animation.addByPrefix("idle", "sound system", 24, false);
		soundSystem.visible = false;
		new FlxTimer().start(8 / 24, _ -> {
			soundSystem.animation.play("idle");
			soundSystem.visible = true;
		});

		add(difficulty);

		add(songName);

		var angleRad = songName.angle * Math.PI / 180;
		speedOfTween.x = -1.0 * Math.cos(angleRad);
		speedOfTween.y = -1.0 * Math.sin(angleRad);

		timerThenSongName(1.0, false);

		var blackTopBar:FlxSprite = new FlxSprite().loadGraphic(Paths.image("resultScreen/topBarBlack"));
		blackTopBar.y = -blackTopBar.height;
		FlxTween.tween(blackTopBar, {y: 0}, 7 / 24, {ease: FlxEase.quartOut, startDelay: 3 / 24});
		add(blackTopBar);
		add(clearPercentSmall);
		add(soundSystem);

		resultsAnim.animation.addByPrefix("result", "results instance 1", 24, false);
		resultsAnim.visible = false;
		add(resultsAnim);
		new FlxTimer().start(6 / 24, _ -> {
			resultsAnim.visible = true;
			resultsAnim.animation.play("result");
		});

		ratingsPopin.animation.addByPrefix("idle", "Categories", 24, false);
		ratingsPopin.visible = false;
		add(ratingsPopin);
		new FlxTimer().start(21 / 24, _ -> {
			ratingsPopin.visible = true;
			ratingsPopin.animation.play("idle");
		});

		scorePopin.animation.addByPrefix("score", "tally score", 24, false);
		scorePopin.visible = false;
		add(scorePopin);
		new FlxTimer().start(36 / 24, _ -> {
			scorePopin.visible = true;
			scorePopin.animation.play("score");
			scorePopin.animation.finishCallback = anim -> {};
		});

		new FlxTimer().start(37 / 24, _ -> {
			score.visible = true;
			score.animateNumbers();
			startRankTallySequence();
		});

		new FlxTimer().start(rank.getBFDelay(), _ -> {
			afterRankTallySequence();
		});

		new FlxTimer().start(rank.getFlashDelay(), _ -> {
			displayRankText();
		});

		highscoreNew.frames = Paths.getSparrowAtlas("resultScreen/highscoreNew");
		highscoreNew.animation.addByPrefix("new", "highscoreAnim0", 24, false);
		highscoreNew.visible = false;
		highscoreNew.updateHitbox();
		add(highscoreNew);

		new FlxTimer().start(rank.getHighscoreDelay(), _ -> {
			if (params.isNewHighscore ?? false) {
				highscoreNew.visible = true;
				highscoreNew.animation.play("new");
				highscoreNew.animation.finishCallback = _ -> highscoreNew.animation.play("new", true, false, 16);
			} else {
				highscoreNew.visible = false;
			}
		});

		var hStuf:Int = 50;

		var ratingGrp:FlxTypedGroup<TallyCounter> = new FlxTypedGroup<TallyCounter>();
		add(ratingGrp);

		/**
		 * NOTE: We display how many notes were HIT, not how many notes there were in total.
		 *
		*/

		var totalHit:TallyCounter = new TallyCounter(375, hStuf * 3, params.scoreData.totalNotesHit);
		ratingGrp.add(totalHit);

		var maxCombo:TallyCounter = new TallyCounter(375, hStuf * 4, params.scoreData.maxCombo);
		ratingGrp.add(maxCombo);

		hStuf += 2;
		var extraYOffset:Float = 7;

		hStuf += 2;

		var tallySick:TallyCounter = new TallyCounter(230, (hStuf * 5) + extraYOffset, params.scoreData.sick, 0xFF89E59E);
		ratingGrp.add(tallySick);

		var tallyGood:TallyCounter = new TallyCounter(210, (hStuf * 6) + extraYOffset, params.scoreData.good, 0xFF89C9E5);
		ratingGrp.add(tallyGood);

		var tallyBad:TallyCounter = new TallyCounter(190, (hStuf * 7) + extraYOffset, params.scoreData.bad, 0xFFE6CF8A);
		ratingGrp.add(tallyBad);

		var tallyShit:TallyCounter = new TallyCounter(220, (hStuf * 8) + extraYOffset, params.scoreData.shit, 0xFFE68C8A);
		ratingGrp.add(tallyShit);

		var tallyMissed:TallyCounter = new TallyCounter(260, (hStuf * 9) + extraYOffset, params.scoreData.missed, 0xFFC68AE6);
		ratingGrp.add(tallyMissed);

		score.visible = false;
		add(score);

		for (ind => rating in ratingGrp.members) {
			rating.visible = false;
			new FlxTimer().start((0.3 * ind) + 1.20, _ -> {
				rating.visible = true;
				FlxTween.tween(rating, {curNumber: rating.neededNumber}, 0.5, {ease: FlxEase.quartOut});
			});
		}

		new FlxTimer().start(rank.getMusicDelay(), _ -> {
			var rankMusicPath = rank.getMusicPath();
			if (rank.hasMusicIntro()) {
				FlxG.sound.play(Paths.music('results/' + rankMusicPath + '/' + rankMusicPath + '-intro'), 1, false, null, true,() -> {
					FlxG.sound.playMusic(Paths.music('results/' + rankMusicPath + '/' + rankMusicPath), 1, rank.shouldMusicLoop());
				});
			} else {
				FlxG.sound.playMusic(Paths.music('results/' + rankMusicPath + '/' + rankMusicPath), 1, rank.shouldMusicLoop());
			}
		});


		rankBg.makeSolidColor(FlxG.width, FlxG.height, 0xFF000000);
		rankBg.cameras = [cameraOverlay];
		rankBg.alpha = 0;

		// quick n dirty way to apply anit-aliasing to everything
		for (sprite in members) {
			var sprite:FlxSprite = cast sprite;
			if(sprite != null && (sprite is FlxSprite)) {
				sprite.antialiasing = ClientPrefs.data.antialiasing;
			}
		}

		super.create();
	}

	var rankTallyTimer:Null<FlxTimer> = null;
	var clearPercentTarget:Int = 100;
	var clearPercentLerp:Int = 0;

	function startRankTallySequence():Void
	{
		bgFlash.visible = true;
		FlxTween.tween(bgFlash, {alpha: 0}, 5 / 24);
		var clearPercentFloat = resultingAccuracy* 100;
		clearPercentTarget = Math.floor(clearPercentFloat);
		// Prevent off-by-one errors.

		clearPercentLerp = Std.int(Math.max(0, clearPercentTarget - 36));

		trace('Clear percent target: ' + clearPercentFloat + ', round: ' + clearPercentTarget);

		var clearPercentCounter:ClearPercentCounter = new ClearPercentCounter(FlxG.width / 2 + 190, FlxG.height / 2 - 70, clearPercentLerp);
		FlxTween.tween(clearPercentCounter, {curNumber: clearPercentTarget}, 58 / 24, {
			ease: FlxEase.quartOut,
			onUpdate: _ -> {
				// Only play the tick sound if the number increased.
				if (clearPercentLerp != clearPercentCounter.curNumber)
				{
				clearPercentLerp = clearPercentCounter.curNumber;
				FlxG.sound.play(Paths.sound('scrollMenu'));
				}
			},

			onComplete: _ -> {
				// Play confirm sound.
				FlxG.sound.play(Paths.sound('confirmMenu'));

				// Just to be sure that the lerp didn't mess things up.
				clearPercentCounter.curNumber = clearPercentTarget;

				clearPercentCounter.flash(true);
				new FlxTimer().start(0.4, _ -> {
				clearPercentCounter.flash(false);
				});
			}
		});
		add(clearPercentCounter);

		if (ratingsPopin == null) {
			trace("Could not build ratingsPopin!");
		} else {
			ratingsPopin.animation.finishCallback = anim -> {
				if (params.isNewHighscore ?? false) {
					highscoreNew.visible = true;
					highscoreNew.animation.play("new");
				} else {
					highscoreNew.visible = false;
				}
			};
		}
	}

	function displayRankText():Void {
		bgFlash.visible = true;
		bgFlash.alpha = 1;
		FlxTween.tween(bgFlash, {alpha: 0}, 14 / 24);

		var rankTextVert:FlxBackdrop = new FlxBackdrop(Paths.image(rank.getVerTextAsset()), Y, 0, 30);
		rankTextVert.x = FlxG.width - 44;
		rankTextVert.y = 100;
		add(rankTextVert);

		FlxFlicker.flicker(rankTextVert, 2 / 24 * 3, 2 / 24, true);

		// Scrolling.
		new FlxTimer().start(30 / 24, _ -> {
			rankTextVert.velocity.y = -80;
		});

		for (i in 0...12) {
			var rankTextBack:FlxBackdrop = new FlxBackdrop(Paths.image(rank.getHorTextAsset()), X, 10, 0);
			rankTextBack.x = FlxG.width / 2 - 320;
			rankTextBack.y = 50 + (135 * i / 2) + 10;
			rankTextBack.cameras = [cameraScroll];
			add(rankTextBack);

			rankTextBack.velocity.x = (i % 2 == 0) ? -7.0 : 7.0;
		}
	}

	function afterRankTallySequence():Void {
		showSmallClearPercent();
	}

	function timerThenSongName(timerLength:Float = 3.0, autoScroll:Bool = true):Void
	{
		movingSongStuff = false;
		difficulty.x = 555;

		var diffYTween:Float = 122;

		difficulty.y = -difficulty.height;
		FlxTween.tween(difficulty, {y: diffYTween}, 0.5, {ease: FlxEase.expoOut, startDelay: 0.8});

		if (clearPercentSmall != null) {
			clearPercentSmall.x = (difficulty.x + difficulty.width) + 50;
			clearPercentSmall.y = -clearPercentSmall.height;
			FlxTween.tween(clearPercentSmall, {y: 122 - 5}, 0.5, {ease: FlxEase.expoOut, startDelay: 0.85});
		}

		songName.y = -songName.height;
		var fuckedupnumber = (10) * (songName.text.length / 15);
		FlxTween.tween(songName, {y: diffYTween - 25 - fuckedupnumber}, 0.5, {ease: FlxEase.expoOut, startDelay: 0.9});
		songName.x = clearPercentSmall.x + 94;

		new FlxTimer().start(timerLength, _ -> {
			var tempSpeed = FlxPoint.get(speedOfTween.x, speedOfTween.y);

			speedOfTween.set(0, 0);
			FlxTween.tween(speedOfTween, {x: tempSpeed.x, y: tempSpeed.y}, 0.7, {ease: FlxEase.quadIn});

			movingSongStuff = (autoScroll);
		});
	}

	function showSmallClearPercent():Void
	{
		if (clearPercentSmall != null)
		{
			clearPercentSmall.visible = true;
			clearPercentSmall.flash(true);

			new FlxTimer().start(0.4, _ -> {
				clearPercentSmall.flash(false);
			});

			clearPercentSmall.curNumber = clearPercentTarget;
		}

		new FlxTimer().start(2.5, _ -> {
			movingSongStuff = true;
		});
	}

	var movingSongStuff:Bool = false;
	var speedOfTween:FlxPoint = FlxPoint.get(-1, 1);

	override function draw():Void {
		super.draw();
		songName.clipRect = FlxRect.get(Math.max(0, 520 - songName.x), 0, FlxG.width, songName.height);
	}

	override function update(elapsed:Float):Void
	{
		maskShaderSongName.swagSprX = songName.x;
		maskShaderDifficulty.swagSprX = difficulty.x;

		if (movingSongStuff) {
			songName.x += speedOfTween.x;
			difficulty.x += speedOfTween.x;
			clearPercentSmall.x += speedOfTween.x;
			songName.y += speedOfTween.y;
			difficulty.y += speedOfTween.y;
			clearPercentSmall.y += speedOfTween.y;

			if (songName.x + songName.width < 100) {
				timerThenSongName();
			}
		}

		if (controls.ACCEPT || FlxG.mouse.justPressedRight) {
			if (FlxG.sound.music != null) {
				FlxTween.tween(FlxG.sound.music, {volume: 0}, 0.5);
				FlxTween.tween(FlxG.sound.music, {pitch: 3}, 0.1, {
					onComplete: _ -> {
						FlxTween.tween(FlxG.sound.music, {pitch: 0.5}, 0.4, {
							onComplete: _ -> {
								FlxG.sound.playMusic(Paths.music('freakyMenu'));
							}
						});
					}
				});
			}

			if (params.storyMode) {
				if (!ClientPrefs.data.noStickers) {
					openSubState(new StickerSubState(null, (sticker) -> new StoryMenuState(sticker)));
				} else {
					if (FlxTransitionableState.skipNextTransIn) {
						CustomFadeTransition.nextCamera = null;
					}
					FlxG.switchState(() -> new StoryMenuState());
				}
			} else {
				if (rank > params.prevScoreRank) {
					if (FlxTransitionableState.skipNextTransIn) {
						CustomFadeTransition.nextCamera = null;
					}
					FlxG.switchState(() -> new FreeplayState());
				} else {
					if (!ClientPrefs.data.noStickers) {
						openSubState(new StickerSubState(null, (sticker) -> new FreeplayState(sticker)));
					} else {
						if(FlxTransitionableState.skipNextTransIn) {
							CustomFadeTransition.nextCamera = null;
						}
						FlxG.switchState(() -> new FreeplayState());
					}
				}
			}
		}

		super.update(elapsed);
	}
}

typedef ResultsStateParams =
{
	/*
	* True if results are for a level, false if results are for a single song.
	*/
	var storyMode:Bool;

	/**
	 * Either "Song Name by Artist Name" or "Week Name"
	 */
	var title:String;

	var songId:String;

	/**
	 * Whether the displayed score is a new highscore
	 */
	var ?isNewHighscore:Bool;

	/**
	 * The difficulty ID of the song/week we just played.
	 * @default Normal
	 */
	var ?difficultyId:String;

	/**
	 * The score, accuracy, and judgements.
	 */
	var scoreData:SaveScoreData;
	/**
	 * Previous
	 */
	var prevScoreRank:ScoringRank;
};

typedef SaveScoreData =
{
	/**
	 * The score achieved.
	 */
	var score:Int;
	var accPoints:Float; // Hit points. Divide by all notes to get accuracy

	var sick:Int;
	var good:Int;
	var bad:Int;
	var shit:Int;
	var missed:Int;
	var combo:Int;
	var maxCombo:Int;
	var totalNotesHit:Int;
	var totalNotes:Int;
}