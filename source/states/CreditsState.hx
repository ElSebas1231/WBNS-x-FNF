package states;

import objects.AttachedSprite;

class CreditsState extends MusicBeatState
{
	var curSelected:Int = -1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];
	private var creditsStuff:Array<Array<String>> = [];

	var bg:FlxSprite;
	var descText:FlxText;
	var intendedColor:FlxColor;
	var colorTween:FlxTween;
	var descBox:AttachedSprite;

	var offsetThing:Float = -75;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Menú de créditos", null);
		#end

		persistentUpdate = true;
		bg = new FlxSprite().loadGraphic(Paths.image('menuCredits'));
		bg.antialiasing = ClientPrefs.data.antialiasing;
		add(bg);
		bg.screenCenter();
		
		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		#if MODS_ALLOWED
		for (mod in Mods.parseList().enabled) pushModCreditsToList(mod);
		#end

		var defaultList:Array<Array<String>> = [ //Name - Icon name - Description - Link - BG Color
			['Directivo'],
			['NexoV', 	'wbnsxfnf/wbns directors/OnlyNexo', 	'"Sabia que ver ese video de daarick jugando con aquino hace años serviria de algo vvv"', 				'https://x.com/OnlyNexoV', 		'ff9900'],
			['Nieves',  'wbnsxfnf/wbns directors/nieves',  		'Ex-Directora', 																						'https://x.com/nievesowu', 		'ca7e42'],
			['Artistas'],
			['Bayest50', 		'wbnsxfnf/wbns dev/bayest_50', 			'Artista', 										    'https://x.com/bayest50',     						'ff9501'],
			['Just_Alh', 		'wbnsxfnf/wbns dev/Just_Alh',  			'Artista', 										    'https://x.com/Just_Alh',     						'b164c1'],
			['EIKOZ', 	 		'wbnsxfnf/wbns dev/EIKOZ', 	 			'Artista', 										    'https://x.com/Eikoz_',   	   						'33166e'],
			['elcami22', 		'wbnsxfnf/wbns dev/elcami22',  			'Artista\nHizo los stickers! :D',					'https://x.com/camemllo5879', 						'593ed6'],
			['GTX_TXT', 		'wbnsxfnf/wbns dev/GTX', 				'"Osi Makku sexo"', 						  	    'https://www.youtube.com/@gtx_txt', 				'3d334c'],
			['LAlo', 			'wbnsxfnf/wbns dev/LALO', 	 			'Artista', 					  					    'https://x.com/LAlo_2324', 							'c80300'],
			['NShawdy',			'wbnsxfnf/wbns dev/NShawdi', 	 		'Artista', 										    'https://x.com/NoseShawdi', 						'd4ba3d'],
			['ThePiero456',		'wbnsxfnf/wbns dev/ThePiero456',		'Artista', 										    'https://youtube.com/@thepiero456', 				'fc8425'],
			['T3KO', 			'wbnsxfnf/wbns dev/t3ko', 				'"Artista en ascendencia, los quiero tonotos"', 	'https://x.com/orangestyles11', 					'bd6535'],
			['Makvn_coon', 		'wbnsxfnf/wbns dev/Makvn_coon', 		'Gracias por darme la oportunidad\n de estar acá :3 (No se como no me funaron)\nTe quiero Duxo', 		'https://x.com/_MakvnKun_', 	'd33f89'],
			['Lui', 			'wbnsxfnf/wbns dev/lui', 				'Artista', 										    'https://x.com/CARPy_6', 							'a4a4a4'],
			['khesito', 		'wbnsxfnf/wbns dev/khesito', 			'Artista', 										    'https://x.com/khle_fly', 							'80413a'],
			['Ani_Manny', 		'wbnsxfnf/wbns dev/Ani-Manny', 			'Artista', 										    'https://x.com/ani__manny', 						'ffc347'],
			['SleepyGGHOST', 	'wbnsxfnf/wbns dev/SleepyGGHOST', 		'Artista', 								   		    'https://x.com/sleepyGGHOST', 						'ffffff'],
			['Wox', 			'wbnsxfnf/wbns dev/Wox', 				'Artista', 								   		    'https://x.com/lol_wox',							'8b053e'],
			['Animadores'],
			['Benja_MTR', 			'wbnsxfnf/wbns dev/Benja_MTR',  	'Animador',		'https://x.com/BenjiMtr',     							'f6865e'],
			['Just_Alh', 			'wbnsxfnf/wbns dev/Just_Alh',  		'Animador',		'https://x.com/Just_Alh',     							'b164c1'],
			['Sloaak', 				'wbnsxfnf/wbns dev/Sloaak', 	 	'"NYEHEHEHEHEHE"\nAnimador de sprites de Minecraft',	'https://www.youtube.com/@Sloaak', 			'25213a'],
			['NShawdy',				'wbnsxfnf/wbns dev/NShawdi', 	 	'Animador',		'https://x.com/NoseShawdi', 							'd4ba3d'],
			['joaco_animations', 	'wbnsxfnf/wbns dev/Joaco', 			'"Un Lore"', 	'https://youtube.com/@joaquin_animations', 				'ff0000'],
			['SoyMois', 			'wbnsxfnf/wbns dev/SoyMois', 		'"Pudiera hacer una frase bien elaborada pero me acabo de levantar"', 	'https://x.com/MoisSoy', 	'8df944'],
			['Lui', 				'wbnsxfnf/wbns dev/lui', 			'Animador',		'https://x.com/CARPy_6', 								'a4a4a4'],
			['Ani_Manny', 			'wbnsxfnf/wbns dev/Ani-Manny', 		'Animador',		'https://x.com/ani__manny', 							'ffc347'],
			['DesgiBy', 			'wbnsxfnf/wbns dev/DesgiBy', 		'Animador',		'https://youtube.com/@desgiby?si=7dX5MxsykhmaYjV6', 	'ff6d00'],
			['Wox', 				'wbnsxfnf/wbns dev/Wox', 			'Artista',		'https://x.com/lol_wox',								'8b053e'],
			['Compositores'],
			['NexoV', 			'wbnsxfnf/wbns directors/OnlyNexo', 	'Músico Líder', 			'https://x.com/OnlyNexoV', 					'ff9900'],
			['GonTheGhost', 	'wbnsxfnf/wbns dev/GonTheGhost', 		'Composistor', 				'https://x.com/gon_ghost', 					'e1dfed'],
			['HeyMega', 		'wbnsxfnf/wbns dev/HeyMega', 			'Composistor', 				'https://x.com/HeyMega3', 					'f73b92'],
			['ItsWalker412', 	'wbnsxfnf/wbns dev/ItsWalker412', 		'Composistor', 				'https://x.com/ItsWalker412', 				'444d54'],
			['Not_wingow', 		'wbnsxfnf/wbns dev/Not_wingow', 		'Composistor', 				'https://www.youtube.com/@not_wingow', 		'47b1cd'],
			['Daxx_Xd', 		'wbnsxfnf/wbns dev/daxx', 				'Composistor', 				'https://www.youtube.com/@nosoydaxxv', 		'339900'],
			['Coders'],
			['ElSebas1231', 	'wbnsxfnf/wbns dev/elsebas', 			'No sé me ocurre nada la verdad,\npero un honor haber estado aquí', 		'https://www.youtube.com/@ElSebas1231',		'620d10'],
			['SanfordXD', 		'wbnsxfnf/wbns dev/sanfordxd', 			'Coder', 																	'https://www.youtube.com/@sanfordxdd', 		'77564a'],
			['ThePiero456',		'wbnsxfnf/wbns dev/ThePiero456',		'Coder', 																	'https://youtube.com/@thepiero456', 		'fc8425'],
			['Charters'],
			['ElGatisty', 		'wbnsxfnf/wbns dev/Elgatisty', 			'ElGatisty está escribiendo...\nno envía nada', 			'https://www.youtube.com/@ElGatisty', 		'e920bb'],
			['Manuzfz', 		'wbnsxfnf/wbns dev/Manuzfz', 			'Charter', 													'https://www.youtube.com/@manuzfz', 		'999f21'],
			['Roval', 			'wbnsxfnf/wbns dev/Roval', 				'Tu apoyo me llevó a ser quién soy.\ngracias :3 ', 			'https://www.youtube.com/@Roval', 			'fffd6d'],
			['ThePiero456',		'wbnsxfnf/wbns dev/ThePiero456',		'Charter', 													'https://youtube.com/@thepiero456', 		'fc8425'],
			['Thunder', 		'wbnsxfnf/wbns dev/Thunder_Mount', 		'Charter', 													'https://youtube.com/@silver92381', 		'ff0000'],
			['ElSebas1231', 	'wbnsxfnf/wbns dev/elsebas', 			'Charter', 													'https://www.youtube.com/@ElSebas1231',		'620d10'],
			['WorteX', 			'wbnsxfnf/wbns dev/WorteX', 			'"h"', 														'https://x.com/agus_two',					'f9b7cf'],
			['Garret', 			'wbnsxfnf/wbns dev/garret_the_stickman', 		'Charter',	 	 null, 		'00fff7'],
			['TelmexCedric', 			'wbnsxfnf/wbns dev/TelmexCedric', 		'"La verdad, fue un honor ayudar en esta hotfix y en el mod, esperen más de mi trabajo acá y un saludo a los del tokyo rumble"', 'https://x.com/TelmexCedric',	'ea194a'],
			['Special Thanks'],
			['SquidBowl', 				'wbnsxfnf/special thanks/squidbowl', 			'Código usado para la galería',	 														'https://gamebanana.com/tools/13883', 						'743f39'],
			['Farhad_SH', 				'', 											'Assets usado para el botón de la galería',	 											null, 														''],
			['SnowTheFox', 				'wbnsxfnf/special thanks/snow',					'Assets y código usados para el GameOver en "Boneless Wings"',	 						'https://gamebanana.com/mods/506807', 						'f7a395'],
			['Rozebud', 				'wbnsxfnf/special thanks/rozebud',				'Código de los Note Hold Cover provenientes de FNF FPS Plus\n(Usado como base)',	 	'https://github.com/ThatRozebudDude/FPS-Plus-Public', 		'e678cd'],
			['mikolka9144', 			'wbnsxfnf/special thanks/mikolka',				'Port de la transición de los stickers',	 											'https://github.com/mikolka9144/P-Slice', 					'd2e3ef'],
			['Renestroll', 				'wbnsxfnf/special thanks/renestroll', 			'Artista y animador',	 null, 				'a23333'],
			['Sank0', 					'wbnsxfnf/special thanks/sanko', 				'Músico',				 null, 		'733a43'],
			['Emily_uwu', 				'wbnsxfnf/special thanks/emily_uwu', 			'Artista',				 null, 		'3a316b'],
			['Anxious_Kitty', 			'wbnsxfnf/special thanks/anxius_kitty', 		'Músico',				 null, 		'73389b'],
			['GhosT_Stkder', 			'wbnsxfnf/special thanks/GhosT_Stkder', 		'Artista y animador',	 null, 		'84324f'],
			['ByManupe', 				'', 											'Artista',	 			 null, 		''],
			['Mexis FBI', 				'', 											'Animador',	 			 null, 		''],
			['BluePou', 				'', 											'Eventos en canciones',	 null, 		''],
			['LuisF', 					'wbnsxfnf/special thanks/LuisF',				'Bocetos',	 			 null, 		'66cc66'],
			['ByManupe', 				'', 											'Artista',	 			 null, 		''],
			['KetchoArts', 				'', 											'Bocetos',	 			 null, 		''],
			['Bluee', 					'', 											'Bocetos',	 			 null, 		''],
			['MakkuVT', 				'', 											'Artista',	 			 null, 		''],
			['TipicoArgen', 			'', 											'Artista y animador',	 null, 		''],
			['MayerXD', 				'', 											'Artista',	 			 null, 		''],
			[''],
			['Psych Engine Team'],
			['Shadow Mario',		'psych/shadowmario',		'Main Programmer and Head of Psych Engine',					 'https://ko-fi.com/shadowmario',		'444444'],
			['Riveren',				'psych/riveren',			'Main Artist/Animator of Psych Engine',						 'https://twitter.com/riverennn',		'14967B'],
			[''],
			['Former Engine Members'],
			['bb-panzu',			'psych/bb',				'Ex-Programmer of Psych Engine',							 'https://twitter.com/bbsub3',			'3E813A'],
			['shubs',				'',						'Ex-Programmer of Psych Engine\nI don\'t support them.',	 '',									'A1A1A1'],
			[''],
			['Engine Contributors'],
			['CrowPlexus',			'psych/crowplexus',		'Input System v3, Major Help and Other PRs',				 'https://twitter.com/crowplexus',		'A1A1A1'],
			['Keoiki',				'psych/keoiki',			'Note Splash Animations and Latin Alphabet',				 'https://twitter.com/Keoiki_',			'D2D2D2'],
			['SqirraRNG',			'psych/sqirra',			'Crash Handler and Base code for\nChart Editor\'s Waveform', 'https://twitter.com/gedehari',		'E1843A'],
			['EliteMasterEric',		'psych/mastereric',		'Runtime Shaders support',									 'https://twitter.com/EliteMasterEric',	'FFBD40'],
			['PolybiusProxy',		'psych/proxy',			'.MP4 Video Loader Library (hxCodec)',						 'https://twitter.com/polybiusproxy',	'DCD294'],
			['Tahir',				'psych/tahir',			'Implementing & Maintaining SScript and Other PRs',			 'https://twitter.com/tahirk618',		'A04397'],
			['iFlicky',				'psych/flicky',			'Composer of Psync and Tea Time\nMade the Dialogue Sounds',	 'https://twitter.com/flicky_i',		'9E29CF'],
			['KadeDev',				'psych/kade',				'Fixed some issues on Chart Editor and Other PRs',			 'https://twitter.com/kade0912',		'64A250'],
			['superpowers04',		'psych/superpowers04',	'LUA JIT Fork',												 'https://twitter.com/superpowers04',	'B957ED'],
			['CheemsAndFriends',	'psych/face',	'Creator of FlxAnimate\n(Icon will be added later, merry christmas!)',	 'https://twitter.com/CheemsnFriendos',	'A1A1A1'],
			[''],
			["Funkin' Crew"],
			['ninjamuffin99',		'funkin/ninjamuffin99',	"Programmer of Friday Night Funkin'",						 'https://twitter.com/ninja_muffin99',	'CF2D2D'],
			['PhantomArcade',		'funkin/phantomarcade',	"Animator of Friday Night Funkin'",							 'https://twitter.com/PhantomArcade3K',	'FADC45'],
			['evilsk8r',			'funkin/evilsk8r',			"Artist of Friday Night Funkin'",							 'https://twitter.com/evilsk8r',		'5ABD4B'],
			['kawaisprite',			'funkin/kawaisprite',		"Composer of Friday Night Funkin'",							 'https://twitter.com/kawaisprite',		'378FC7']
		];
		
		for(i in defaultList) {
			creditsStuff.push(i);
		}
	
		for (i in 0...creditsStuff.length)
		{
			var isSelectable:Bool = !unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(FlxG.width / 2, 300, creditsStuff[i][0], !isSelectable);
			optionText.isMenuItem = true;
			optionText.targetY = i;
			optionText.changeX = false;
			optionText.snapToPosition();
			grpOptions.add(optionText);

			if(isSelectable) {
				if(creditsStuff[i][5] != null)
				{
					Mods.currentModDirectory = creditsStuff[i][5];
				}

				var str:String = 'credits/missing_icon';
				if(creditsStuff[i][1] != null && creditsStuff[i][1].length > 0)
				{
					var fileName = 'credits/' + creditsStuff[i][1];
					if (Paths.fileExists('images/$fileName.png', IMAGE)) str = fileName;
					else if (Paths.fileExists('images/$fileName-pixel.png', IMAGE)) str = fileName + '-pixel';
				}

				var icon:AttachedSprite = new AttachedSprite(str);
				if(str.endsWith('-pixel')) icon.antialiasing = false;
				icon.xAdd = optionText.width + 10;
				icon.sprTracker = optionText;

				if (str == 'credits/missing_icon' || (creditsStuff[i][4] == null || creditsStuff[i][4] == '')) {
					creditsStuff[i][4] == 'a1a1a1';
				}
	
				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				add(icon);
				Mods.currentModDirectory = '';

				if(curSelected == -1) curSelected = i;
			}
			else optionText.alignment = CENTERED;
		}
		
		descBox = new AttachedSprite();
		descBox.makeGraphic(1, 1, FlxColor.BLACK);
		descBox.xAdd = -10;
		descBox.yAdd = -10;
		descBox.alphaMult = 0.6;
		descBox.alpha = 0.6;
		add(descBox);

		descText = new FlxText(50, FlxG.height + offsetThing - 25, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER/*, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK*/);
		descText.scrollFactor.set();
		//descText.borderSize = 2.4;
		descBox.sprTracker = descText;
		add(descText);

		bg.color = CoolUtil.colorFromString(creditsStuff[curSelected][4]);
		intendedColor = bg.color;
		changeSelection();
		super.create();
	}

	var quitting:Bool = false;
	var holdTime:Float = 0;
	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if(!quitting)
		{
			if(creditsStuff.length > 1)
			{
				var shiftMult:Int = 1;
				if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

				var upP = controls.UI_UP_P;
				var downP = controls.UI_DOWN_P;

				if (upP)
				{
					changeSelection(-shiftMult);
					holdTime = 0;
				}
				if (downP)
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
			}

			if(controls.ACCEPT && (creditsStuff[curSelected][3] == null || creditsStuff[curSelected][3].length > 4)) {
				CoolUtil.browserLoad(creditsStuff[curSelected][3]);
			}
			if (controls.BACK)
			{
				if(colorTween != null) {
					colorTween.cancel();
				}
				FlxG.sound.play(Paths.sound('cancelMenu'));
				FlxG.switchState(() -> new MainMenuState());
				quitting = true;
			}
		}
		
		for (item in grpOptions.members)
		{
			if(!item.bold)
			{
				var lerpVal:Float = FlxMath.bound(elapsed * 12, 0, 1);
				if(item.targetY == 0)
				{
					var lastX:Float = item.x;
					item.screenCenter(X);
					item.x = FlxMath.lerp(lastX, item.x - 70, lerpVal);
				}
				else
				{
					item.x = FlxMath.lerp(item.x, 200 + -40 * Math.abs(item.targetY), lerpVal);
				}
			}
		}
		super.update(elapsed);
	}

	var moveTween:FlxTween = null;
	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do {
			curSelected += change;
			if (curSelected < 0)
				curSelected = creditsStuff.length - 1;
			if (curSelected >= creditsStuff.length)
				curSelected = 0;
		} while(unselectableCheck(curSelected));

		var newColor:FlxColor = CoolUtil.colorFromString(creditsStuff[curSelected][4]);
		//trace('The BG color is: $newColor');
		if(newColor != intendedColor) {
			if(colorTween != null) {
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween) {
					colorTween = null;
				}
			});
		}

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if(!unselectableCheck(bullShit-1)) {
				item.alpha = 0.6;
				if (item.targetY == 0) {
					item.alpha = 1;
				}
			}
		}

		descText.text = creditsStuff[curSelected][2];
		descText.y = FlxG.height - descText.height + offsetThing - 60;

		if(moveTween != null) moveTween.cancel();
		moveTween = FlxTween.tween(descText, {y : descText.y + 75}, 0.25, {ease: FlxEase.sineOut});

		descBox.setGraphicSize(Std.int(descText.width + 20), Std.int(descText.height + 25));
		descBox.updateHitbox();
	}

	#if MODS_ALLOWED
	function pushModCreditsToList(folder:String)
	{
		var creditsFile:String = null;
		if(folder != null && folder.trim().length > 0) creditsFile = Paths.mods(folder + '/data/credits.txt');
		else creditsFile = Paths.mods('data/credits.txt');

		if (FileSystem.exists(creditsFile))
		{
			var firstarray:Array<String> = File.getContent(creditsFile).split('\n');
			for(i in firstarray)
			{
				var arr:Array<String> = i.replace('\\n', '\n').split("::");
				if(arr.length >= 5) arr.push(folder);
				creditsStuff.push(arr);
			}
			creditsStuff.push(['']);
		}
	}
	#end

	private function unselectableCheck(num:Int):Bool {
		return creditsStuff[num].length <= 1;
	}
}
