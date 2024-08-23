function onCreatePost()
makeLuaSprite('negrooscuro', nul, 0, 0)
makeGraphic('negrooscuro', 1350 ,900,'000000')
setObjectCamera('negrooscuro', 'Other')
setProperty('negrooscuro.alpha', 1)
scaleObject('negrooscuro',1.8,1.8)
addLuaSprite('negrooscuro', true)

setProperty('defaultCamZoom', 0.5)
setProperty('camGame.zoom', 1.5)
setProperty('camHUD.zoom', 3.5)
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
doTweenZoom('camZoom','camGame', 0.5, 2.5, 'QuadOut')
end
if curStep == 512 or curStep == 775 then
setProperty('camGame.alpha', 0)
end
if curStep == 520 or curStep == 783 then
setProperty('camGame.alpha', 1)
end
if curStep == 975 then
doTweenAlpha("waza2", "camHUD", 0, 1, "linear")
end
if curStep == 991 then
doTweenAlpha("waza", "negrooscuro", 1, 2, "linear")
end
end