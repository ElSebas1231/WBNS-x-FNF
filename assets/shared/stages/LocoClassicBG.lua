function onCreate()
	makeAnimatedLuaSprite('Escenario Phantoms', 'lococlassic/Escenario-Lococlassic', 180, 420)
	scaleObject('Escenario Phantoms', 1.5, 1.5);
	addAnimationByPrefix('Escenario Phantoms', 'idle', 'Escenario-Lococlassic idle', 20, true);
	addLuaSprite('Escenario Phantoms');

	makeAnimatedLuaSprite('Escenario', 'lococlassic/Escenario-Lococlassicsinphantoms', 180, 420)
	scaleObject('Escenario', 1.5, 1.5);
	addAnimationByPrefix('Escenario', 'idle', 'Escenario-Lococlassicsinphantoms idle', 20, true);
	setProperty('Escenario.alpha', 0)
	addLuaSprite('Escenario', false);
end

function onEvent(n,v1,v2)
	if n == 'Loco Classic' then
		setProperty('Escenario Phantoms.alpha', 0)
		setProperty('Escenario.alpha', 1)
	end
end