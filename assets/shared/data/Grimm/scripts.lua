function onCreatePost()
makeLuaSprite('negrooscuro', nul, 0, 0)
makeGraphic('negrooscuro', 1350 ,900,'000000')
setObjectCamera('negrooscuro', 'Other')
setProperty('negrooscuro.alpha', 1)
scaleObject('negrooscuro',1.8,1.8)
addLuaSprite('negrooscuro', true)

makeLuaSprite('blackui', 'blackui', 0, 0)
setObjectCamera('blackui', 'Other')
setProperty('blackui.alpha', 0)
scaleObject('blackui',1.25,1.25)
addLuaSprite('blackui', true)

setProperty('defaultCamZoom', 0.6)
setProperty('camGame.zoom', 1.5)
setProperty('camHUD.zoom', 5)
end

function onEvent(n,v1,v2)
if n == 'Flash Camera' then
setBlendMode("flash", 'add')
setObjectCamera("flash",'other')
end
end

function onUpdate()
setProperty('camZoomingMult', false)
end

function onStepHit()
if curStep == 1 then
doTweenAlpha("waza", "negrooscuro", 0, 19, "linear")
doTweenZoom('camZoom','camGame', 0.6, 19, 'QuadOut')
doTweenZoom('camHUD','camHUD', 1, 19, 'QuadOut')
end
if curStep == 752 then
doTweenAlpha("blackui", "blackui", 0.75, 1.5, "linear")
doTweenAlpha("hud", "camHUD", 0.75, 1.5, "linear")
end
if curStep == 1280 then
setProperty('camHUD.alpha', 1)
setProperty('blackui.alpha', 0)
end
if curStep == 1792 then
doTweenAlpha("waza", "negrooscuro", 1, 3, "linear")
end
end