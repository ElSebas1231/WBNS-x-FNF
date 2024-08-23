function onCreate()
makeLuaSprite('Stage', 'fnafBG/FondoOficina', -160, -490);
setScrollFactor('Stage', 1, 1);
scaleObject('Stage', 1.15, 1.15);
setProperty("Stage.visible", true)
addLuaSprite('Stage', false);

makeLuaSprite('Stage2', 'fnafBG/FondoStage', -160, -490);
setScrollFactor('Stage2', 1, 1);
scaleObject('Stage2', 1.15, 1.15);
setProperty("Stage2.visible", false)
addLuaSprite('Stage2', false);

makeLuaSprite('Stage3', 'fnafBG/FondoMesas1', -160, -360);
setScrollFactor('Stage3', 1, 1);
scaleObject('Stage3', 1.0, 1.0);
setProperty("Stage3.visible", false)
addLuaSprite('Stage3', false);

makeLuaSprite('Stage4', 'fnafBG/FondoMesas2', -160, -360);
setScrollFactor('Stage4', 1, 1);
scaleObject('Stage4', 1.0, 1.0);
setProperty("Stage4.visible", false)
addLuaSprite('Stage4', false);
setObjectOrder('Stage4',5)

makeLuaSprite('Stage5', 'fnafBG/FondoPirateCave', -70, -490);
setScrollFactor('Stage5', 1, 1);
scaleObject('Stage5', 1.0, 1.0);
setProperty("Stage5.visible", false)
addLuaSprite('Stage5', false);

makeLuaSprite('Stage6', 'fnafBG/FondoPart&Services', -70, -490);
setScrollFactor('Stage6', 1, 1);
scaleObject('Stage6', 1.0, 1.0);
setProperty("Stage6.visible", false)
addLuaSprite('Stage6', false);
end

function onCreatePost()
setProperty("boyfriend.visible", true)
setProperty("gf.visible", false)
setObjectCamera("gfGroup",'camHUD')
end

function onEvent(eventName, value1, value2, strumTime)
if eventName == 'sanfordxd' then
if value1 == 'aquino' then
setProperty("Stage.visible", true)
setProperty("Stage2.visible", false)
setProperty("Stage3.visible", false)
setProperty("Stage4.visible", false)
setProperty("Stage5.visible", false)
setProperty("Stage6.visible", false)
end
if value1 == 'lucasta' then
setProperty("Stage2.visible", true)
setProperty("Stage.visible", false)
setProperty("Stage3.visible", false)
setProperty("Stage4.visible", false)
setProperty("Stage5.visible", false)
setProperty("Stage.visible", false)
end
if value1 == 'mictia' then
setProperty("Stage.visible", false)
setProperty("Stage2.visible", false)
setProperty("Stage3.visible", true)
setProperty("Stage4.visible", true)
setProperty("Stage5.visible", false)
setProperty("Stage6.visible", false)
end
if value1 == 'michu' then
setProperty("Stage.visible", false)
setProperty("Stage2.visible", false)
setProperty("Stage3.visible", false)
setProperty("Stage4.visible", false)
setProperty("Stage5.visible", true)
setProperty("Stage6.visible", false)
end
if value1 == 'soaring' then
setProperty("Stage.visible", false)
setProperty("Stage2.visible", false)
setProperty("Stage3.visible", false)
setProperty("Stage4.visible", false)
setProperty("Stage5.visible", false)
setProperty("Stage6.visible", true)
end
end
end