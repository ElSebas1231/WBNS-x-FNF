function onCreatePost()
makeLuaSprite('negrooscuro', nul, 0, 0)
makeGraphic('negrooscuro', 1350 ,900,'000000')
setObjectCamera('negrooscuro', 'camHUD')
setProperty('negrooscuro.alpha', 1)
scaleObject('negrooscuro',1.8,1.8)
addLuaSprite('negrooscuro', true)

makeLuaSprite('darkness', null, 0, 0);
makeGraphic('darkness', 1350 ,900,'646464')
setObjectCamera('darkness', 'camHUD')
setBlendMode('darkness','SUBTRACT')
setProperty('darkness.alpha', 1)
addLuaSprite('darkness', true);

setProperty('defaultCamZoom', 1.05)
setProperty('camGame.zoom', 1.05)
end

function onEvent(n,v1,v2)
if n == 'Flash Camera' then
setBlendMode("flash", 'add')
setObjectCamera("flash",'other')
end
end

function onStepHit()
if curStep == 1 then
doTweenAlpha("waza", "negrooscuro", 0, 0.7,'linear')      
doTweenAlpha("waz", "darkness", 0.2, 0.7,'linear')      
end
if curStep == 527 then
setProperty('negrooscuro.alpha', 1)
setProperty('FunBG.visible', false)
setProperty('tilines waos.visible', false)
setProperty('arbustos.visible', false)
setProperty('Bush2.visible', false)
setProperty('floor BG.visible', false)
doTweenAlpha("noway", "negrooscuro", 0, 2,'linear')        
end
if curStep == 783 then
setProperty('negrooscuro.alpha', 1)
setProperty('FunBG.visible', true)
setProperty('tilines waos.visible', true)
setProperty('arbustos.visible', true)
setProperty('Bush2.visible',true)
setProperty('floor BG.visible', true)
doTweenAlpha("LOL", "negrooscuro", 0, 1,'linear')        
end
if curStep == 1584 then
doTweenAlpha("SI", "negrooscuro", 1, 4,'linear')      
doTweenAlpha("NO", "darkness", 1, 4,'linear')
end
end