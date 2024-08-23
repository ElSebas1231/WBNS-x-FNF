function onCreate()
makeLuaSprite("awa", 'backrooms/Escenario-Backrooms',-150,10)
setScrollFactor("awa", 0.95, 0.95)
scaleObject("awa", 2.5, 2.5)
addLuaSprite("awa")

makeAnimatedLuaSprite("awa2", 'backrooms/Escenario-Backrooms-Corriendo',-150,10)
addAnimationByPrefix('awa2','idle','Escenario-Backrooms-Corriendo idle0',24, true);
setScrollFactor("awa2", 0.95, 0.95)
scaleObject("awa2", 2.5, 2.5)
addLuaSprite("awa2")
setProperty('awa2.visible', false)

makeAnimatedLuaSprite("patas2", "backrooms/Pies-Lucasta-Falso",-320,-10)
addAnimationByPrefix("patas2","idle","Pies-Lucasta-Falso idle0",24, true);
setScrollFactor("patas2", 1, 1)
scaleObject("patas2", 2.5, 2.5)
addLuaSprite("patas2")

makeAnimatedLuaSprite("patas1", "backrooms/Pies-Lucasta",-170,-5)
addAnimationByPrefix("patas1","idle","Pies-Lucasta idle0",24, true);
setScrollFactor("patas1", 1, 1)
scaleObject("patas1", 2.5, 2.5)
setObjectOrder('patas1', getObjectOrder('boyfriendGroup'))
addLuaSprite("patas1")

setProperty('patas2.visible', false)
setProperty('patas1.visible', false)
end

local waza = true
function onUpdatePost()
if waza then
    setProperty('defaultCamZoom', (mustHitSection and 0.8 or 2))
end
end

function onEvent(name, value1, value2)
if name == 'backrooms' then
if value1 == '1' then
waza = false
triggerEvent('Change Character', 'dad', 'faker-run');
triggerEvent('Change Character', 'boyfriend','lucasta-run');
setProperty('boyfriend.y', getProperty('boyfriend.y') + 8)
setProperty('boyfriend.x', getProperty('boyfriend.x') - 10)
setProperty('awa2.visible', true)
setProperty('awa.visible', false)
setProperty('defaultCamZoom', 0.9)
setProperty('patas2.visible', true)
setProperty('patas1.visible', true)
end
end
end