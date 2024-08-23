function onCreate() -- Creas el script
	makeLuaSprite('blanco', '', -400, -100);  --Pones apodo a la nada pq no uso asset
	makeGraphic('blanco', 1480*2, 920*2, 'FFFFFF');  -- pero a esa nada la graficas de un solo color con una resolucion mayor a la pantalla (1280x720)
	screenCenter('blanco'); --Centras el sprite para que se mueva siempre en medio de la pantalla, o sea que siempre estara
	addLuaSprite('blanco', false); -- Lo colocas atras de los personajes
end
function onCreatePost()
	setProperty('healthBar.visible', true);
	setProperty('healthBarBG.visible', true);
	setProperty('healthicon.visible', true);
	setProperty('iconP2.visible', true);
	setProperty('iconP1.visible', true);
	setProperty('scoreTxt.visible', true);
	setProperty('showRating', true);
	setProperty('gf.visible', true)
	setProperty('timeBar.visible', true);
	setProperty('timeBarBG.visible', true);
	setProperty('timeTxt.visible', true);
	setProperty('showComboNum', true)
	setPropertyFromClass('Main','fpsVar.visible',true)
end