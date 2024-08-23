function onCreate()
    addHaxeLibrary('FlxBackdrop', 'flixel.addons.display')

    runHaxeCode([[
		var cielo3:FlxBackdrop;
        var cielo2:FlxBackdrop;
        var cielo1:FlxBackdrop;

		cielo3 = new FlxBackdrop(Paths.image('nieveBG/119_sin_titulo_20240518204526'), 0x01);
		cielo3.velocity.set(-80, 0);
        cielo3.scale.set(1.45, 1.45);
		cielo3.antialiasing = false;
        game.add(cielo3);

        cielo2 = new FlxBackdrop(Paths.image('nieveBG/119_sin_titulo_20240518204537'), 0x01);
		cielo2.velocity.set(-60, 0);
        cielo2.scale.set(1.45, 1.45);
		cielo2.antialiasing = false;
        game.add(cielo2);

        cielo1 = new FlxBackdrop(Paths.image('nieveBG/119_sin_titulo_20240518204645'), 0x01);
		cielo1.velocity.set(-30, 0);
        cielo1.scale.set(1.45, 1.45);
		cielo1.antialiasing = false;
        game.add(cielo1);

        setVar('cielo1', cielo1);
        setVar('cielo2', cielo2);
        setVar('cielo3', cielo3);
	]])

    makeLuaSprite('monta', 'nieveBG/119_sin_titulo_20240518204704', -850, -505)
    scaleObject('monta', 1.25, 1.25)
    setProperty('monta.antialiasing', false)
    addLuaSprite('monta')

    makeLuaSprite('pared', 'nieveBG/pared', -650, -305)
    scaleObject('pared', 2, 2)
    setProperty('pared.antialiasing', false)
    addLuaSprite('pared')

    makeLuaSprite('suelo', 'nieveBG/suelo', -650, -485)
    scaleObject('suelo', 1.5, 1.5)
    setProperty('suelo.antialiasing', false)
    addLuaSprite('suelo')

    makeLuaSprite('pared2', 'nieveBG/119_sin_titulo_20240518204709', -900, -355)
    scaleObject('pared2', 1.5, 1.5)
    setProperty('pared2.antialiasing', false)
    addLuaSprite('pared2', true)

    setObjectOrder('cielo1', getObjectOrder('monta'))
    setObjectOrder('cielo2', getObjectOrder('cielo1'))
    setObjectOrder('cielo3', getObjectOrder('cielo2'))

    for i = 1, 3 do
        setProperty('cielo'..i..'.y', -550)
    end
end

function onCreatePost()
    setTextFont("botplayTxt", "Bread.ttf"); 
    setTextFont("scoreTxt", "Bread.ttf"); 
    setTextFont("timeTxt", "Bread.ttf");
    setTextSize('boyplayTxt', 20)
    setTextSize('timeTxt', 25)
    setTextSize('scoreTxt', 15)
end