function onCreatePost()
makeLuaSprite('negrooscuro', nul, 0, 0)
makeGraphic('negrooscuro', 1350 ,900,'000000')
setObjectCamera('negrooscuro', 'Other')
setProperty('negrooscuro.alpha', 1)
scaleObject('negrooscuro',1.8,1.8)
addLuaSprite('negrooscuro', true)

makeLuaSprite('blackui', 'blackui', 0, 0)
setObjectCamera('blackui', 'camHUD')
setProperty('blackui.alpha', 0)
scaleObject('blackui',1.15, 1.15)
addLuaSprite('blackui', false)

makeLuaSprite('darkness', null, 0, 0);
makeGraphic('darkness', 1350 ,900,'646464')
setObjectCamera('darkness', 'other')
setBlendMode('darkness','SUBTRACT')
setProperty('darkness.alpha', 0.15)
addLuaSprite('darkness', true);

setProperty("camHUD.alpha", 0)
setProperty("fondo_lethal.visible", false)
setProperty("thumper.visible", false)
setProperty("baranda.visible", false)
setProperty("natalan piernas.visible",false)
setProperty('defaultCamZoom', 1.05)
setProperty('camGame.zoom', 1.05)

setPropertyFromGroup('opponentStrums',0,'x','-500')
setPropertyFromGroup('opponentStrums',1,'x','-500')
setPropertyFromGroup('opponentStrums',2,'x','-500')
setPropertyFromGroup('opponentStrums',3,'x','-500')

setPropertyFromGroup('playerStrums',0,'x','412')
setPropertyFromGroup('playerStrums',1,'x','527')
setPropertyFromGroup('playerStrums',2,'x','643')
setPropertyFromGroup('playerStrums',3,'x','761')
end

function onEvent(n,v1,v2)
if n == 'sanfordxd' then
if v1 == 'noway' then
cameraShake("camGame",0.015,0.5)
end
if n == 'Flash Camera' then
setBlendMode("flash", 'add')
setObjectCamera("flash",'other')
setObjectOrder('flash', 99);
end
end
end

function onStepHit()
if curStep == 1 then
doTweenAlpha("a", "negrooscuro", 0, 6,'linear')      
end
if curStep == 152  or curStep == 712  or curStep == 1000  then
doTweenAlpha("c", "camHUD", 1, 0.25,'linear')      
end
if curStep == 160 or curStep == 1008  then
setProperty("fondo_lethal.visible", true)
setProperty("thumper.visible", true)
setProperty("baranda.visible", true)
setProperty("natalan piernas.visible",true)
setProperty('healthBar.visible', true)
setProperty('iconP2.visible', true)
setProperty('iconP1.visible', true)
setProperty("camGame.visible", true)
setProperty('blackui.alpha', 1)
setProperty('negrooscuro.alpha', 0)
end
if curStep == 667 then
setProperty("fondo_lethal.visible", false)
setProperty("thumper.visible", false)
setProperty("baranda.visible", false)
setProperty("natalan piernas.visible",false)
setProperty("camGame.visible",false)
setProperty('blackui.alpha', 0)
doTweenAlpha("c", "camHUD", 0, 1.2,'linear') 
end
if curStep == 700 then
setProperty('negrooscuro.alpha', 0.6)
setProperty('dad.alpha', 0)
setProperty('healthBar.visible', false)
setProperty('iconP2.visible', false)
setProperty('iconP1.visible', false)
end
if curStep == 720 then
setProperty("camGame.visible", true)
doTweenAlpha("n", "dad", 1, 1.2,'linear') 
end
if curStep == 976 then
doTweenAlpha("c", "camHUD", 0, 0.5,'linear') 
end
if curStep == 992 then
setProperty("camGame.visible", false)
end
if curStep == 1520 then
doTweenAlpha("n", "negrooscuro", 1, 1.5,'linear')   
doTweenAlpha("b", "darkness", 1, 1.5,'linear')   
end
end