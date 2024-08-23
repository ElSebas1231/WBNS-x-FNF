local boom = true
local boom1 = 0.015
local boom2 = 0.005
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
end

function onBeatHit()
if curBeat == 160 or curBeat == 260 then
boom = true		
end
if curBeat == 128 or curBeat == 256 or curBeat == 387 then
boom = false		
end
end