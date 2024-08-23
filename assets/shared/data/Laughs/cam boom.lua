local boom = false
local omg = false
local boom1 = 0.035
local boom2 = 0.045
local waza = 4
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
if curBeat == 20 or curBeat == 40 then
boom = true		
end
if curBeat == 36 then
boom = false
end
if curBeat == 40 then
omg = true		
end
if curBeat == 104 or curBeat == 170 or curBeat == 206 then
omg = false		
boom = false
end
if curBeat == 106 or curBeat == 190 then
omg = true		
boom = true
end
end
end