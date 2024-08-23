package options;

class GameplaySettingsSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Opciones de Gameplay';
		rpcTitle = 'Menú de Opciones de Gameplay'; //for Discord Rich Presence

		//I'd suggest using "Downscroll" as an example for making your own option since it is the simplest here
		var option:Option = new Option('Downscroll', //Name
			'Si está marcado, las flechas irán hacia abajo\nen vez de ir hacia arriba.', //Description
			'downScroll', //Save data variable name
			'bool'); //Variable type
		addOption(option);

		var option:Option = new Option('Middlescroll',
			'Si está marcado, tus notas estarán centradas.',
			'middleScroll',
			'bool');
		addOption(option);

		var option:Option = new Option('Notas del oponente',
			'Si está marcado, se ocultarán las notas del oponente.',
			'opponentStrums',
			'bool');
		addOption(option);

		var option:Option = new Option('Ghost Tapping',
			"Si está marcado, no tendrás fallos mientras\nno haya notas que pulsar.",
			'ghostTapping',
			'bool');
		addOption(option);

		var option:Option = new Option('Sustains como una nota',
		"Si está marcado, no puedes presionar las notas largas\nsi las fallaste, contando como un hit o miss.\nDesactiva esto si prefieres el antiguo Input System.",
		'guitarHeroSustains',
		'bool');
	addOption(option);
		
		var option:Option = new Option('Pausa automática',
			"Si está marcada, el juego se pausará al estar en otra ventana.",
			'autoPause',
			'bool');
		addOption(option);
		option.onChange = onChangeAutoPause;

		var option:Option = new Option('Desactivar el botón Reset',
			"Si está marcado, desativará poder reiniciar\nal presionar la teclar de Reset.",
			'noReset',
			'bool');
		addOption(option);

		var option:Option = new Option('Volumen de Hit:',
			'Se hace un \"¡Tick!\" cuando presionas una nota.',
			'hitsoundVolume',
			'percent');
		addOption(option);
		option.scrollSpeed = 1.6;
		option.minValue = 0.0;
		option.maxValue = 1;
		option.changeValue = 0.1;
		option.decimals = 1;
		option.onChange = onChangeHitsoundVolume;

		var option:Option = new Option('Rating Offset',
			'Cambia que tan tarde/antes tienes que pulsar para tener un "Sick!"\nValores altos significan que tan tarde tienes que pulsar.',
			'ratingOffset',
			'int');
		option.displayFormat = '%vms';
		option.scrollSpeed = 20;
		option.minValue = -30;
		option.maxValue = 30;
		addOption(option);

		var option:Option = new Option('Sick! Hit Window',
			'Cambia la cantidad de tiempo que tienes\npara obtener un "Sick!" en millisegundos.',
			'sickWindow',
			'int');
		option.displayFormat = '%vms';
		option.scrollSpeed = 15;
		option.minValue = 15;
		option.maxValue = 45;
		addOption(option);

		var option:Option = new Option('Good Hit Window',
			'Cambia la cantidad de tiempo que tienes\npara obtener un "Good" en millisegundos.',
			'goodWindow',
			'int');
		option.displayFormat = '%vms';
		option.scrollSpeed = 30;
		option.minValue = 15;
		option.maxValue = 90;
		addOption(option);

		var option:Option = new Option('Bad Hit Window',
			'Cambia la cantidad de tiempo que tienes\npara obtener un "Bad" en millisegundos.',
			'badWindow',
			'int');
		option.displayFormat = '%vms';
		option.scrollSpeed = 60;
		option.minValue = 15;
		option.maxValue = 135;
		addOption(option);

		var option:Option = new Option('Safe Frames',
			'Cambia cuantos frames tienes\npara pulsar una nota antes o tarde.',
			'safeFrames',
			'float');
		option.scrollSpeed = 5;
		option.minValue = 2;
		option.maxValue = 10;
		option.changeValue = 0.1;
		addOption(option);

		super();
	}

	function onChangeHitsoundVolume()
		FlxG.sound.play(Paths.sound('hitsound'), ClientPrefs.data.hitsoundVolume);

	function onChangeAutoPause()
		FlxG.autoPause = ClientPrefs.data.autoPause;
}