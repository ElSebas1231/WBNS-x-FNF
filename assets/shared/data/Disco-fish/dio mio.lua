function onCreatePost()
makeLuaSprite('negrooscuro', nul, 0, 0)
makeGraphic('negrooscuro', 1350 ,900,'000000')
setObjectCamera('negrooscuro', 'Other')
setProperty('negrooscuro.alpha', 0)
scaleObject('negrooscuro',1.8,1.8)
addLuaSprite('negrooscuro', true)

setProperty('defaultCamZoom', 0.7)
setProperty('camGame.zoom', 0.7)
setProperty('camGame.visible', false)
end

function onEvent(n,v1,v2)
if n == 'Flash Camera' then
setBlendMode("flash", 'add')
setObjectCamera("flash",'other')
end
end

function onStepHit()
if curStep == 1 then
setProperty('camGame.visible',true)
end
if curStep == 1792 then
setProperty('camGame.visible', false)
setProperty('camHUD.visible', false)
end
if curStep == 1808 then
setProperty('camGame.visible', true)
end
if curStep == 1824 then
setProperty('camGame.visible', false)
end
end