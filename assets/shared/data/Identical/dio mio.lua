function onCreatePost()
addCharacterToList("SkinStealer", "dad")

makeLuaSprite('negrooscuro', nul, 0, 0)
makeGraphic('negrooscuro', 1350 ,900,'000000')
setObjectCamera('negrooscuro', 'Other')
setProperty('negrooscuro.alpha', 1)
scaleObject('negrooscuro',1.8,1.8)
addLuaSprite('negrooscuro', true)

makeLuaSprite('blackui', 'blackui', 0, 0)
setObjectCamera('blackui', 'camHUD')
setProperty('blackui.alpha', 0.5)
scaleObject('blackui',1.15, 1.15)
addLuaSprite('blackui', false)

makeLuaSprite('darkness', null, 0, 0);
makeGraphic('darkness', 1350 ,900,'646464')
setObjectCamera('darkness', 'other')
setBlendMode('darkness','SUBTRACT')
setProperty('darkness.alpha', 1)
addLuaSprite('darkness', true);

setProperty("camHUD.zoom", 3)
setProperty('defaultCamZoom', 1.05)
setProperty('camGame.zoom', 1.05)
end

function onEvent(n,v1,v2)
if n == 'Flash Camera' then
setBlendMode("flash", 'add')
setObjectCamera("flash",'other')
setObjectOrder('flash', 99);
end
end

function onStepHit()
if curStep == 1 then
doTweenAlpha("a", "negrooscuro", 0, 2.5,'linear')      
doTweenAlpha("b", "darkness", 0.15,  2.5,'linear')      
end
if curStep == 847 then
doTweenAlpha("a", "negrooscuro", 0.5, 1.5,'linear')     
doTweenAlpha("b", "darkness", 1,  2,'linear')      
end
if curStep == 895 then
doTweenAlpha("a", "negrooscuro", 0, 2.5,'linear')    
doTweenAlpha("b", "darkness", 0.15,  2.5,'linear')         
end
if curStep == 1663 then
doTweenAlpha("a", "negrooscuro", 1, 1.5,'linear')     
doTweenAlpha("b", "darkness", 1,  2, 'linear')           
end
end