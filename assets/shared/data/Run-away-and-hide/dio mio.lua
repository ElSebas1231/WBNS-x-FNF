function onCreatePost()
addCharacterToList("lucasta", "boyfriend")
addCharacterToList("lucasta-run", "boyfriend")
addCharacterToList("fakerlucasta", "dad")
addCharacterToList("faker-run", "dad")

makeLuaSprite('blackui', 'blackui', 0, 0)
setObjectCamera('blackui', 'camHUD')
setProperty('blackui.alpha', 0)
scaleObject('blackui',1.15, 1.15)
addLuaSprite('blackui', false)

makeLuaSprite('negrooscuro', nil, 0, 0)
makeGraphic('negrooscuro', 1350 ,900,'000000')
setObjectCamera('negrooscuro', 'Other')
setProperty('negrooscuro.alpha', 1)
scaleObject('negrooscuro',1.8,1.8)
addLuaSprite('negrooscuro', true)

makeLuaSprite('darkness', nil, 0, 0);
makeGraphic('darkness', 1350 ,900,'646464')
setObjectCamera('darkness', 'other')
setBlendMode('darkness','SUBTRACT')
setProperty('darkness.alpha', 1)
addLuaSprite('darkness', true);

setPropertyFromGroup('opponentStrums',0,'x', -5000);
setPropertyFromGroup('opponentStrums',1,'x', -5000);
setPropertyFromGroup('opponentStrums',2,'x', -5000);
setPropertyFromGroup('opponentStrums',3, 'x', -5000);

setProperty('defaultCamZoom', 0.8)
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
doTweenAlpha("a", "negrooscuro", 0, 15,'linear')      
doTweenAlpha("b", "darkness", 0.15,  21,'linear') 
doTweenZoom('camZoom','camGame', 0.8, 19, 'linear')     
end
if curStep == 800 then
doTweenAlpha("c", "negrooscuro", 0.35, 3,'linear')      
doTweenAlpha("d", "darkness", 0.28,  3,'linear')  
doTweenAlpha("e", "blackui", 0.48,  3,'linear')  
end
if curStep == 1056 then
doTweenAlpha("e", "blackui", 0.18,  1,'linear')  
doTweenAlpha("c", "negrooscuro", 0.1, 1,'linear')   
end
if curStep == 1312 then
doTweenAlpha("d", "darkness", 0.4, 1,'linear')  
end
if curStep == 1568 then
doTweenAlpha("d", "darkness", 0.1, 1,'linear')  
end
if curStep == 1760 then
doTweenAlpha("c", "negrooscuro", 0.45, 1.5,'linear')      
doTweenAlpha("d", "darkness", 0.85,  1.5,'linear')  
doTweenAlpha("e", "blackui", 0.48,  1.5,'linear')  
end
if curStep == 1824 then
doTweenAlpha("c", "negrooscuro", 0.35, 3,'linear')      
doTweenAlpha("d", "darkness", 0.28,  3,'linear')  
doTweenAlpha("e", "blackui", 0.48,  3,'linear')  
end
if curStep == 2848 then
setProperty('camHUD.visible', false)
setProperty('camGame.visible', false)
end
end