function onCreate()
makeLuaSprite("sala",'papa/Fondo_sala',-250,-180)
setScrollFactor("sala", 0.95, 0.95)
scaleObject("sala", 1.1, 1.1)
addLuaSprite("sala")

makeAnimatedLuaSprite("Soaring",'papa/Soaring_Papaestricto',830, 400)
addAnimationByPrefix("Soaring", "idle", "Soaring Idle0",24, true)
scaleObject("Soaring", 0.63, 0.63)
setObjectOrder('Soaring', 3)
addLuaSprite("Soaring")

makeAnimatedLuaSprite("Aquino",'papa/Aquino_Papaestricto',-350, 340)
addAnimationByPrefix("Aquino", "idle", "Aquino Idle0",24, true)
scaleObject("Aquino", 0.63, 0.63)
setObjectOrder('Aquino', 3)
addLuaSprite("Aquino")
end

function onCreatePost()
setTextFont("botplayTxt", "RobloxFont121Regular-axoyE.ttf"); 
setTextFont("scoreTxt", "RobloxFont121Regular-axoyE.ttf"); 
setTextFont("timeTxt", "RobloxFont121Regular-axoyE.ttf"); 
setTextSize('timeTxt', 25)

setPropertyFromGroup('playerStrums',0,'x','412')
setPropertyFromGroup('playerStrums',1,'x','527')
setPropertyFromGroup('playerStrums',2,'x','643')
setPropertyFromGroup('playerStrums',3,'x','761')
setPropertyFromGroup('opponentStrums',0,'x', -5000);
setPropertyFromGroup('opponentStrums',1,'x', -5000);
setPropertyFromGroup('opponentStrums',2,'x', -5000);
setPropertyFromGroup('opponentStrums',3, 'x', -5000);
setObjectOrder('gfGroup', getObjectOrder('dadGroup') + 1)
end

function onUpdatePost()
if mustHitSection == true then 
setProperty('defaultCamZoom', 0.95)
noteTweenAlpha("waza", 4, 0.9, 0.25, "linear")
noteTweenAlpha("waza1", 5, 0.9, 0.25, "linear")
noteTweenAlpha("waza2", 6, 0.9, 0.25, "linear")
noteTweenAlpha("waza3", 7, 0.9, 0.25, "linear")
else
setProperty('defaultCamZoom', 1.3)
noteTweenAlpha("waza4", 4, 0.5, 0.25, "linear")
noteTweenAlpha("waza5", 5, 0.5, 0.25, "linear")
noteTweenAlpha("waza6", 6, 0.5, 0.25, "linear")
noteTweenAlpha("waza7", 7, 0.5, 0.25, "linear")
end
end