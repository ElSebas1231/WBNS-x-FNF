package states;

import flixel.FlxSubState;
import flixel.tweens.FlxTween;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;

class FlashingState extends MusicBeatState
{
	public static var leftState:Bool = false;

	var warnText:FlxText;
	override function create()
	{
		super.create();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		warnText = new FlxText(0, 0, FlxG.width,
			"¡Hola Gracias por descargar el mod!\n
			Recomedamos revisar los ajustes, ya que están en default.
			Dicho eso, agradecemos a los WBNS y sus respectivas
			comunidades por apoyarnos con el mod, muchas gracias y esperamos 
			que disfruten esta versión del mod todavía hay para más hehehehe.\n
			\n
			Presiona ENTER para quitar este mensaje.", 32);
		warnText.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		warnText.antialiasing = true;
		warnText.screenCenter();
		add(warnText);
	}

	override function update(elapsed:Float)
	{
		if(!leftState) {
			if (controls.ACCEPT) {
				leftState = true;
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;

				FlxG.sound.play(Paths.sound('confirmMenu'));
				FlxTween.tween(warnText, {alpha: 0}, 1, {
					onComplete: function (twn:FlxTween) {
						FlxG.switchState(() -> new TitleState());
					}
				});
			}
		}

		super.update(elapsed);
	}
}
