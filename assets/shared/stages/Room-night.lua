function onCreate()
makeLuaSprite('bg', 'latenight/wbnas-bg', -900, 310);
setScrollFactor("bg", 0.8, 0.8)
scaleObject('bg', 1.1, 1.1)
addLuaSprite('bg', false);

makeLuaSprite('mesa', 'latenight/mesa', -650, 580);
setScrollFactor("mesa", 1.25, 1.0)
scaleObject('mesa', 0.85, 0.85)
addLuaSprite('mesa', true);

makeLuaSprite('luces', 'latenight/luces', -1070, 490);
setScrollFactor("luces", 1.15, 1.15)
scaleObject('luces', 1.3, 1.3)
addLuaSprite('luces', true);
end 