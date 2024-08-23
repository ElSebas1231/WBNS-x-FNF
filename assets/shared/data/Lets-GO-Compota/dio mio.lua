function onCreatePost()
makeLuaSprite('blackui', 'blackui', 0, 0)
setObjectCamera('blackui', 'Other')
setProperty('blackui.alpha', 1)
scaleObject('blackui',1.15, 1.15)
addLuaSprite('blackui', false)

makeLuaSprite('negrooscuro', nul, 0, 0)
makeGraphic('negrooscuro', 1350 ,900,'000000')
setObjectCamera('negrooscuro', 'Other')
setProperty('negrooscuro.alpha', 0.75)
scaleObject('negrooscuro',1.8,1.8)
addLuaSprite('negrooscuro', true)

makeLuaSprite('darkness', null, 0, 0);
makeGraphic('darkness', 1350 ,900,'646464')
setObjectCamera('darkness', 'other')
setBlendMode('darkness','SUBTRACT')
setProperty('darkness.alpha', 1)
addLuaSprite('darkness', true);

setProperty('camHUD.visible',false)
setProperty('defaultCamZoom', 0.65)
setProperty('camGame.zoom', 1.15)
setProperty('camHUD.zoom', 2.5)
end

function onEvent(n,v1,v2)
if n == 'Flash Camera' then
setBlendMode("flash", 'add')
setObjectCamera("flash",'other')
end
end

function onStepHit()
if curStep == 1 then
doTweenAlpha("a", "negrooscuro", 0, 27,'linear')      
doTweenAlpha("b", "darkness", 0.05,  27,'linear') 
doTweenAlpha("c", "blackui", 0, 27,'linear')   
doTweenZoom('camZoom','camGame', 0.65, 25, 'linear')     
end
if curStep == 384 then
setProperty('camHUD.visible', true)
end
if curStep == 640 then
doTweenAlpha("d", "darkness", 0.15,  1.5,'linear') 
doTweenAlpha("e", "blackui", 0.25, 1.5,'linear')   
end
if curStep == 896 then
setProperty('dad.alpha', 0)
setProperty('boyfriend.alpha', 0)
setProperty('negrooscuro.alpha', 1)
setProperty('feliz.visible', false)
setProperty('fondo.visible', false)
setProperty('waza.visible', false)
setProperty('waza2.visible', false)
setProperty('image.visible', false)
setProperty('image1.visible', false)
setProperty('gf.visible', false)
setProperty('a.visible', false)
doTweenAlpha("f", "negrooscuro", 0, 1.2,'linear')     
doTweenAlpha("g", "dad", 1, 3,'linear')     
doTweenAlpha("h", "boyfriend", 1, 3,'linear')     
end
if curStep == 1152 or curStep == 2431 then
setProperty('negrooscuro.alpha', 1)
setProperty('feliz.visible', true)
setProperty('fondo.visible', true)
setProperty('waza.visible', true)
setProperty('waza2.visible', true)
setProperty('image.visible', true)
setProperty('image1.visible', true)
setProperty('gf.visible',true)
setProperty('a.visible', true)
doTweenAlpha("i", "negrooscuro", 0, 1.2,'linear')     
end
if curStep == 1408 then  
setProperty('blackui.alpha', 0) 
end
if curStep == 1891 then
doTweenAlpha("j", "negrooscuro", 0.75, 3,'linear')      
doTweenAlpha("k", "darkness", 0.8,  3,'linear') 
doTweenAlpha("l", "blackui", 1, 3,'linear')   
end
if curStep == 1944 then
setProperty('dad.alpha', 0)
setProperty('boyfriend.alpha', 0)
setProperty('negrooscuro.alpha', 1)
setProperty('feliz.visible', false)
setProperty('fondo.visible', false)
setProperty('waza.visible', false)
setProperty('waza2.visible', false)
setProperty('image.visible', false)
setProperty('image1.visible', false)
setProperty('gf.visible', false)
setProperty('a.visible', false)
doTweenAlpha("m", "dad", 1, 12,'linear')     
doTweenAlpha("n", "negrooscuro", 0.15, 15,'linear')      
doTweenAlpha("o", "darkness", 0.3, 15,'linear') 
doTweenAlpha("p", "blackui", 0.15, 15,'linear')   
end
if curStep == 2175 then
doTweenAlpha("q", "boyfriend", 1, 3,'linear')     
end
if curStep == 2527 then
doTweenAlpha("r", "negrooscuro", 0.55, 7,'linear')      
doTweenAlpha("s", "darkness", 0.3, 7,'linear') 
doTweenAlpha("x", "blackui", 0.35, 7,'linear')   
end
if curStep == 2687 then
doTweenAlpha("v", "negrooscuro", 0, 16,'linear')      
doTweenAlpha("w", "darkness", 0,  16,'linear') 
doTweenAlpha("x", "blackui", 0, 16,'linear')   
end
if curStep == 3199 then
doTweenAlpha("y", "negrooscuro", 1, 2.5,'linear')      
doTweenAlpha("z", "darkness", 1,  2.5,'linear') 
doTweenAlpha("noway", "camHUD", 0, 1,'linear')   
end
end