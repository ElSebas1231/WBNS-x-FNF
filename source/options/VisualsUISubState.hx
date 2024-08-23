package options;

import objects.Note;
import objects.StrumNote;
import objects.Alphabet;

class VisualsUISubState extends BaseOptionsMenu
{
	var noteOptionID:Int = -1;
	var notes:FlxTypedGroup<StrumNote>;
	var notesTween:Array<FlxTween> = [];
	var noteY:Float = 90;
	public function new()
	{
		title = 'Visuales y UI';
		rpcTitle = 'Opciones de Visuales y UI'; //for Discord Rich Presence

		// for note skins
		notes = new FlxTypedGroup<StrumNote>();
		for (i in 0...Note.colArray.length)
		{
			var note:StrumNote = new StrumNote(370 + (560 / Note.colArray.length) * i, -200, i, 0);
			note.centerOffsets();
			note.centerOrigin();
			note.playAnim('static');
			notes.add(note);
		}

		// options

		var noteSkins:Array<String> = Mods.mergeAllTextsNamed('images/noteSkins/list.txt');
		if(noteSkins.length > 0)
		{
			if(!noteSkins.contains(ClientPrefs.data.noteSkin))
				ClientPrefs.data.noteSkin = ClientPrefs.defaultData.noteSkin; //Reset to default if saved noteskin couldnt be found

			noteSkins.insert(0, ClientPrefs.defaultData.noteSkin); //Default skin always comes first
			var option:Option = new Option('Note Skins:',
				"Selecciona tu Note Skin preferida.",
				'noteSkin',
				'string',
				noteSkins);
			addOption(option);
			option.onChange = onChangeNoteSkin;
			noteOptionID = optionsArray.length - 1;
		}
		
		var noteSplashes:Array<String> = Mods.mergeAllTextsNamed('images/noteSplashes/list.txt');
		if(noteSplashes.length > 0)
		{
			if(!noteSplashes.contains(ClientPrefs.data.splashSkin))
				ClientPrefs.data.splashSkin = ClientPrefs.defaultData.splashSkin; //Reset to default if saved splashskin couldnt be found

			noteSplashes.insert(0, ClientPrefs.defaultData.splashSkin); //Default skin always comes first
			//noteSplashes.insert(noteSplashes.length + 1, 'Desactivado');
			var option:Option = new Option('Note Splashes:',
				"Selecciona tu variación preferida de Note Splash.",
				'splashSkin',
				'string',
				noteSplashes);
			addOption(option);
		}

		var option:Option = new Option('Ocultar Note Splashes',
			'Si está marcado, al acertar un "Sick!" no se hará una animación.',
			'hideNoteSplashes',
			'bool');
		addOption(option);

		var option:Option = new Option('Opacidad de NoteSplashes',
			'¿Qué tan transparentes deben ser las notesplashes?.',
			'splashAlpha',
			'percent');
		option.scrollSpeed = 1.6;
		option.minValue = 0.0;
		option.maxValue = 1;
		option.changeValue = 0.1;
		option.decimals = 1;
		addOption(option);

		var option:Option = new Option('Ocultar Hold Note Covers',
			'Si está marcado, al mantener una nota larga no se mostrará una animación mientra se mantenga la nota.',
			'hideNoteCovers',
			'bool');
		addOption(option);

		var option:Option = new Option('Ocultar HUD',
			'Si está marcado, oculta la mayoría de elementos del HUD.',
			'hideHud',
			'bool');
		addOption(option);
		
		var option:Option = new Option('Barra de Tiempo:',
			"¿Qué debería de mostrar la Barra de Tiempo?",
			'timeBarType',
			'string',
			['Time Left', 'Time Elapsed', 'Song Name', 'Disabled']);
		addOption(option);

		var option:Option = new Option('Luces Parpadeantes',
			"¡Desactiva esto si eres fotosensible a luces parpadeantes!",
			'flashing',
			'bool');
		addOption(option);

		var option:Option = new Option('Zooms de Cámara',
			"Si está desactivado, la cámara no hará un zoom en un Beat.",
			'camZooms',
			'bool');
		addOption(option);

		var option:Option = new Option('Zoom de Puntuación en aciertos',
			"Si está desactivado, desactiva el zoom de la puntuación\ncada vez que pulses una nota.",
			'scoreZoom',
			'bool');
		addOption(option);

		var option:Option = new Option('Opacidad de HealthBar',
			'¿Qué tan transparente quieres que sea de la barra de vida e íconos?',
			'healthBarAlpha',
			'percent');
		option.scrollSpeed = 1.6;
		option.minValue = 0.0;
		option.maxValue = 1;
		option.changeValue = 0.1;
		option.decimals = 1;
		addOption(option);

		var option:Option = new Option('Ocultar Stickers',
			'Si está marcado, no se hará la transición de los stickers al dejar de jugar.',
			'noStickers',
			'bool');
		addOption(option);
		
		#if !mobile
		var option:Option = new Option('Contador de FPS',
			'Si no está marcada, oculta el contador de FPS.',
			'showFPS',
			'bool');
		addOption(option);
		option.onChange = onChangeFPSCounter;
		#end
		
		var option:Option = new Option('Canción de Pausa:',
			"¿Qué canción prefieres escuchar en al pausar el juego?",
			'pauseMusic',
			'string',
			['None', 'Pause Improv', 'Breakfast', 'Tea Time']);
		addOption(option);
		option.onChange = onChangePauseMusic;
		
		#if CHECK_FOR_UPDATES
		var option:Option = new Option('Revisar actualizaciones',
			'En builds de release, desactiva el recibir un mensaje de actualización.',
			'checkForUpdates',
			'bool');
		addOption(option);
		#end

		#if desktop
		var option:Option = new Option('Discord Rich Presence',
			"Desactiva esto si no quieres que se muestre tu actividad en Discord\nNota: deberás de tener activada la opción en Discord",
			'discordRPC',
			'bool');
		addOption(option);
		#end

		var option:Option = new Option('Combo Stacking',
			"Si no está marcado, Ratings y Combo no se amontonarán, ahorrando memoria y haciéndolos más fáciles de ver",
			'comboStacking',
			'bool');
		addOption(option);

		super();
		add(notes);
	}

	override function changeSelection(change:Int = 0)
	{
		super.changeSelection(change);
		
		if(noteOptionID < 0) return;

		for (i in 0...Note.colArray.length)
		{
			var note:StrumNote = notes.members[i];
			if(notesTween[i] != null) notesTween[i].cancel();
			if(curSelected == noteOptionID)
				notesTween[i] = FlxTween.tween(note, {y: noteY}, Math.abs(note.y / (200 + noteY)) / 3, {ease: FlxEase.quadInOut});
			else
				notesTween[i] = FlxTween.tween(note, {y: -200}, Math.abs(note.y / (200 + noteY)) / 3, {ease: FlxEase.quadInOut});
		}
	}

	var changedMusic:Bool = false;
	function onChangePauseMusic()
	{
		if(ClientPrefs.data.pauseMusic == 'None') {
			FlxG.sound.music.volume = 0;
		} else {
			if (OptionsState.onPlayState){
				if (ClientPrefs.data.pauseMusic == 'Breakfast' && PlayState.isPixelStage){
					FlxG.sound.playMusic(Paths.music(Paths.formatToSongPath('breakfast-pixel')));
				}
			} else {
				FlxG.sound.playMusic(Paths.music(Paths.formatToSongPath(ClientPrefs.data.pauseMusic)));
			}
		}

		changedMusic = true;
	}

	function onChangeNoteSkin()
	{
		notes.forEachAlive(function(note:StrumNote) {
			changeNoteSkin(note);
			note.centerOffsets();
			note.centerOrigin();
		});
	}

	function changeNoteSkin(note:StrumNote)
	{
		var skin:String = Note.defaultNoteSkin;
		var customSkin:String = skin + Note.getNoteSkinPostfix();
		if(Paths.fileExists('images/$customSkin.png', IMAGE)) skin = customSkin;

		note.texture = skin; //Load texture and anims
		note.reloadNote();
		note.playAnim('static');
	}

	override function destroy()
	{
		if(changedMusic && !OptionsState.onPlayState) FlxG.sound.playMusic(Paths.music('freakyMenu'), 1, true);
		super.destroy();
	}

	#if !mobile
	function onChangeFPSCounter()
	{
		if(Main.fpsVar != null)
			Main.fpsVar.visible = ClientPrefs.data.showFPS;
	}
	#end
}
