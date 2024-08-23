local boom = false
local boom1 = 0.025
local boom2 = 0.015
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
end

function onBeatHit()
if curBeat == 4 or curBeat == 37 or curBeat == 88 or curBeat == 204 then
boom = true		
end
if curBeat == 36 or curBeat == 84 or curBeat == 128 or curBeat == 328 or curBeat == 396 then
boom = false		
end
if curBeat == 332 then
boom1 = 0.035
boom2 = 0.025
boom = true		
end
end