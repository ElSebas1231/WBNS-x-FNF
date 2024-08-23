function onCreatePost()
makeLuaSprite('negrooscuro', nul, 0, 0)
makeGraphic('negrooscuro', 1350 ,900,'000000')
setObjectCamera('negrooscuro', 'Other')
setProperty('negrooscuro.alpha', 1)
scaleObject('negrooscuro',1.8,1.8)
addLuaSprite('negrooscuro', true)

makeLuaSprite('blackui', 'blackui', 0, 0)
setObjectCamera('blackui', 'camHUD')
setProperty('blackui.alpha', 0)
scaleObject('blackui',1.15, 1.15)
addLuaSprite('blackui', false)

makeLuaSprite('darkness', null, 0, 0);
makeGraphic('darkness', 1350 ,900,'646464')
setObjectCamera('darkness', 'other')
setBlendMode('darkness','SUBTRACT')
setProperty('darkness.alpha', 0.)
addLuaSprite('darkness', true);

makeLuaSprite('negro', nul, 0, 0)
makeGraphic('negro', 1350 ,900,'000000')
setObjectCamera('negro', 'camHUD')
setProperty('negro.alpha', 0)
scaleObject('negro',1.8,1.8)
addLuaSprite('negro', false)
end

function onEvent(n,v1,v2)
if n == 'Flash Camera' then
setBlendMode("flash", 'add')
setObjectCamera("flash",'other')
end
end

function onStepHit()
if curStep == 1 then
doTweenAlpha("waza", "negrooscuro", 0, 2, "linear")
end
if curStep == 896 then
setProperty('negro.alpha', 1)
doTweenAlpha("waza", "negro", 0, 2, "linear")
doTweenAlpha("awa", "darkness", 0.4, 2, "linear")
doTweenAlpha("nowe", "blackui", 0.85, 2, "linear")
doTweenAlpha("no", "negrooscuro", 0.25, 2, "linear")
end
if curStep == 1471 then
doTweenAlpha("si", "negrooscuro", 1, 0.5, "linear")
end
end