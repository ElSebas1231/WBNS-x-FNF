function onCreate()
makeLuaSprite('pikoB2', 'pikoB2', -930, -115);
scaleObject('pikoB2', 1.8, 1.8)
addLuaSprite('pikoB2', false);

makeLuaSprite('pikoB1', 'pikoB1', -930, -115);
scaleObject('pikoB1', 1.8, 1.8)
addLuaSprite('pikoB1', false);

makeAnimatedLuaSprite('pikoDuxo', 'pikoDuxo', 450, 375)
scaleObject('pikoDuxo', 1.8, 1.8);

addLuaSprite('pikoDuxo', false);
addAnimationByPrefix('pikoDuxo', 'idle', 'pikoDuxo idle', 20, true);

makeAnimatedLuaSprite('pikoRandom', 'pikoRandom', -425, 720)
scaleObject('pikoRandom', 1.8, 1.8);

addLuaSprite('pikoRandom', false);
addAnimationByPrefix('pikoRandom', 'idle', 'pikoRandom idle', 20, true);

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