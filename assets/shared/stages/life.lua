function onCreate()
	-- background shit
 makeLuaSprite('fondo','life/life_fondo', -775, -400);
	setScrollFactor('fondo', 1.0, 1.0);
   	scaleObject('fondo', 1.3, 1.3);

 makeLuaSprite('sol','life/life_sol', -775, -400);
	setScrollFactor('sol', 0.8, 0.8);
   	scaleObject('sol', 1.3, 1.3);

 makeLuaSprite('nubes','life/life_nubes', -775, -400);
	setScrollFactor('nubes', 0.9, 0.9);
   	scaleObject('nubes', 1.3, 1.3);

 makeLuaSprite('ciudades','life/life_ciudades', -775, -400);
	setScrollFactor('ciudades', 1.0, 1.0);
   	scaleObject('ciudades', 1.3, 1.3);

 makeLuaSprite('piso','life/life_piso', -775, -400);
	setScrollFactor('piso', 1.0, 1.0);
   	scaleObject('piso', 1.3, 1.3);

 addLuaSprite('fondo', false);
 addLuaSprite('sol', false);
 addLuaSprite('nubes', false);
 addLuaSprite('ciudades', false);
 addLuaSprite('piso', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end