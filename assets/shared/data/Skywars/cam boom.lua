local boom = false
local omg = false
local boom1 = 0.025
local boom2 = 0.035
local waza = 8
local waza2 = waza + waza

function onUpdate()
setProperty('camZoomingMult', false)
end

function onStepHit()
if boom then
    if curStep % waza == 0 then
 triggerEvent("Add Camera Zoom",boom1, boom1)
 end
    if curStep % waza2 == 0 then
 triggerEvent("Add Camera Zoom", boom2, boom2)
end
end
if omg then
   if curStep % waza == 0 then
 setProperty("camGame.angle", 2)
 doTweenAngle("omg", "camGame", 0, 0.5, "linear")
end
   if curStep % waza2 == 0 then
 setProperty("camGame.angle", -2)
 doTweenAngle("omg", "camGame", 0, 0.5, "linear")
end
end

function onBeatHit()
if curBeat == 32 or curBeat == 384 then
boom = true		
end
if curBeat == 160 then
omg = true		
end
if curBeat == 216 or curBeat == 444 or curBeat == 476 then
boom = false		
end
if curBeat == 224 then
omg = false		
end
if curBeat == 448 then
boom = true
boom1 = 0.015
boom2 = 0.025
end 
end
end