function onCreate()--
makeLuaSprite('backk', 'fondos/cup/cuphead bg 1', 800, 220)

scaleObject('backk', 1, 1)

addLuaSprite('backk', false)
makeLuaSprite('mesa', 'fondos/cup/cuphead bg 2', 800, 220)

scaleObject('mesa', 1, 1)

makeAnimatedLuaSprite('gefe', 'fondos/cup/twitch_man', 1560, 340)
scaleObject('gefe', 1.2, 1.2)
addAnimationByPrefix('gefe', 'idle', 'twitch employer', 24, true)
addLuaSprite('gefe', false);

addLuaSprite('mesa', false);
makeLuaSprite('esewe', 'fondos/cup/cuphead bg 3', 800, 220)
scaleObject('esewe', 1, 1)
addLuaSprite('esewe', true)



end


