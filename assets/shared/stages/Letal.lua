function onCreate()
makeAnimatedLuaSprite('fondo_lethal', 'letal/fondo_lethal', -950, -100)
scaleObject('fondo_lethal', 1.3, 1.3);

addLuaSprite('fondo_lethal', false);
addAnimationByPrefix('fondo_lethal', 'idle', 'fondo lethal', 20, true);

makeAnimatedLuaSprite('thumper', 'letal/thumper', 900, 250)
scaleObject('thumper', 1.2, 1.2);

addLuaSprite('thumper', false);
addAnimationByPrefix('thumper', 'idle', 'thumper idle', 20, true);


makeAnimatedLuaSprite('natalan piernas', 'letal/natalan piernas', 2300, 680)
scaleObject('natalan piernas', 1.3, 1.3);

addLuaSprite('natalan piernas', false);
addAnimationByPrefix('natalan piernas', 'idle', 'pies corriendose', 24, true);


makeAnimatedLuaSprite('baranda', 'letal/baranda', -950, -100)
scaleObject('baranda', 1.3, 1.3);

addLuaSprite('baranda', true);
addAnimationByPrefix('baranda', 'idle', 'baranda', 20, true);


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