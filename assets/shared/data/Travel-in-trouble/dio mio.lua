function onCreatePost()
makeLuaSprite('negrooscuro', nul, 0, 0)
makeGraphic('negrooscuro', 1350 ,900,'000000')
setObjectCamera('negrooscuro', 'Other')
setProperty('negrooscuro.alpha', 0.8)
scaleObject('negrooscuro',1.8,1.8)
addLuaSprite('negrooscuro', false)

setProperty('defaultCamZoom', 0.8)
setProperty('camGame.zoom', 1.5)
setProperty('camHUD.zoom', 1)
end

function onEvent(n,v1,v2)
if n == 'Flash Camera' then
setBlendMode("flash", 'add')
setObjectCamera("flash",'other')
end
end

function onStepHit()
if curStep == 1 then
doTweenAlpha("waza", "negrooscuro", 0, 2.5, "linear")
doTweenZoom('camZoom','camGame', 0.8, 2.5, 'QuadOut')
end
end