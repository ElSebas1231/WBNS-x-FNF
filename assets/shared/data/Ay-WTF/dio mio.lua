function onCreatePost()
makeLuaSprite('negrooscuro', nul, 0, 0)
makeGraphic('negrooscuro', 1350 ,900,'000000')
setObjectCamera('negrooscuro', 'Other')
setProperty('negrooscuro.alpha', 1)
scaleObject('negrooscuro',1.8,1.8)
addLuaSprite('negrooscuro', true)

setProperty('defaultCamZoom', 0.7)
setProperty('camGame.zoom', 1.2)
setProperty('camHUD.zoom', 5)
end

function onEvent(n,v1,v2)
if n == 'Flash Camera' then
setBlendMode("flash", 'add')
setObjectCamera("flash",'other')
end
end

function onStepHit()
if curStep == 1 then
doTweenAlpha("waza", "negrooscuro", 0, 6, "linear")
doTweenZoom('camZoom','camGame', 0.7, 6, 'QuadOut')
end
if curStep == 2175 then
doTweenAlpha("waza", "negrooscuro", 1, 1, "linear")
end
end