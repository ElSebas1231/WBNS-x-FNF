local stage1 = {'cielo', 'isla1','isla2','isla3','isla', 'arbustos', 'arbol'}
local stage2 = {'fondo', 'sol','nubes','ciudades','piso'}

function onCreate()
	makeLuaSprite('cielo', 'aquinobg/cielo_aquino',-1150, -420)
	scaleObject('cielo', 2.3, 2.3)
	addLuaSprite('cielo')

	makeLuaSprite('isla1', 'aquinobg/islas_aquino1', -1000, -100)
	scaleObject('isla1', 1.75, 1.75)
	addLuaSprite('isla1')

	makeLuaSprite('isla2', 'aquinobg/islas_aquino2', -900, -200)
	scaleObject('isla2', 1.75, 1.75)
	addLuaSprite('isla2')

	makeLuaSprite('isla3', 'aquinobg/islas_aquino3', -800, -50)
	scaleObject('isla3', 1.75, 1.75)
	addLuaSprite('isla3')

	makeLuaSprite('isla', 'aquinobg/isla_aquino', -1150, -420)
	scaleObject('isla', 2.3, 2.3)
	addLuaSprite('isla')

	makeLuaSprite('arbol', 'aquinobg/arbol_aquino', -840, -160);
	setScrollFactor('arbol', 1, 1)
	scaleObject('arbol', 1.7, 1.7)
	addLuaSprite('arbol')

	makeLuaSprite('arbustos', 'aquinobg/arbusto_aquino', -900, -150)
	scaleObject('arbustos', 1.8, 1.8)
	addLuaSprite('arbustos')

	makeLuaSprite('fondo','life/life_fondo', -775, -400);
	setScrollFactor('fondo', 1.0, 1.0);
	scaleObject('fondo', 1.3, 1.3);
	setProperty('fondo.alpha', 0.001)
	addLuaSprite('fondo', false);

	makeLuaSprite('sol','life/life_sol', -775, -400);
	setScrollFactor('sol', 0.8, 0.8);
	scaleObject('sol', 1.3, 1.3);
	setProperty('sol.alpha', 0.001)
	addLuaSprite('sol', false);

	addHaxeLibrary('FlxBackdrop', 'flixel.addons.display')
	runHaxeCode([[
		var nubes:FlxBackdrop;

		nubes = new FlxBackdrop(Paths.image('life/life_nubes'), 0x01);
		nubes.velocity.set(-50, 0);
		nubes.antialiasing = ClientPrefs.data.antialiasing;
		nubes.alpha = 0;
		game.add(nubes);

		setVar('nubes', nubes);
	]])
	setProperty('nubes.x', -775)
	setProperty('nubes.y', -200)

	makeLuaSprite('ciudades','life/life_ciudades', -775, -400);
	setScrollFactor('ciudades', 1.0, 1.0);
	scaleObject('ciudades', 1.3, 1.3);
	setProperty('ciudades.alpha', 0.001)
	addLuaSprite('ciudades', false);

	makeLuaSprite('piso','life/life_piso', -775, -400);
	setScrollFactor('piso', 1.0, 1.0)
	scaleObject('piso', 1.3, 1.3)
	setProperty('piso.alpha', 0.001)
	addLuaSprite('piso', false)

	startTween('tweenIsla1', 'isla1', {y = getProperty('isla1.y') + 40}, 1.5, {type = 'PINGPONG', ease = 'quadInOut'})
	startTween('tweenIsla2', 'isla2', {y = getProperty('isla2.y') + 30}, 1.5, {type = 'PINGPONG', ease = 'quadInOut', startDelay = '0.5'})
	startTween('tweenIsla3', 'isla3', {y = getProperty('isla3.y') + 20}, 1.5, {type = 'PINGPONG', ease = 'quadInOut', startDelay = '1'})
end

function onEvent(n, v1, v2)
	if n == 'Stage Change' then
		if v1 == '0' then
			setProperty('boyfriendGroup.x', 780)
			setProperty('boyfriendGroup.y', 120)
			setProperty('gfGroup.x', 210)
			setProperty('gfGroup.y', 130)
			setProperty('dadGroup.x', -90)
			setProperty('dadGroup.y', 135)
			setProperty('boyfriend.alpha',0.0001)
			setProperty('dad.alpha',0.0001)

			cameraFlash('game', 'ffffff', 1)
			setProperty('defaultCamZoom', 0.74)


			for i = 1, #stage1 do
				removeLuaSprite(stage1[i], false)
			end

			for i = 1, #stage2 do
				setProperty(tostring(stage2[i])..'.alpha', 1)
			end
		end

		if v1 == '1' then
			setProperty('boyfriendGroup.x', 470)
			setProperty('boyfriendGroup.y', 250)
			setProperty('gfGroup.x', -230)
			setProperty('gfGroup.y', 100)
			setProperty('dadGroup.x', -520)
			setProperty('dadGroup.y', 200)
			cameraFlash('game', 'ffffff', 1)
			setProperty('defaultCamZoom', 0.74)

			for i = 1, #stage2 do
				removeLuaSprite(stage2[i], true)
			end

			for i = 1, #stage1 do
				addLuaSprite(stage1[i], false)
			end
		end

		if v1 == '2' then
			setProperty('boyfriend.alpha',1)
			setProperty('dad.alpha',1)
		end
	end
end