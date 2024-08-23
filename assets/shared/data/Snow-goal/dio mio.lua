function onCreatePost()
makeLuaSprite('negrooscuro', nul, 0, 0)
makeGraphic('negrooscuro', 1350 ,900,'000000')
setObjectCamera('negrooscuro', 'Other')
setProperty('negrooscuro.alpha', 1)
scaleObject('negrooscuro',1.8,1.8)
addLuaSprite('negrooscuro', true)

setProperty('defaultCamZoom', 0.5)
setProperty('camGame.zoom', 1.5)
setProperty('camHUD.zoom', 2)
end

function onEvent(n,v1,v2)
if n == 'Flash Camera' then
setBlendMode("flash", 'add')
setProperty('flash.alpha',0.25)
setObjectCamera("flash",'other')
end
end

function onUpdate()
setProperty('camZoomingMult', false)
end

function onStepHit()
if curStep == 16 then
doTweenAlpha("awa", "negrooscuro", '0', 7, "expoIn")
doTweenZoom('camZoom','camGame', 0.5, 6, 'QuadOut')
end
if curStep == 1647 then
doTweenAlpha("pq", "camHUD", '0', 2, "expoIn")
end
if curStep == 1663 then
doTweenAlpha("a", "negrooscuro", '0', 1, "expoIn")
end
end
