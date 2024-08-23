local boom = false
local boom1 = 0.015
local boom2 = 0.025
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
if curBeat == 96 or curBeat == 288 or curBeat == 352 or curBeat == 607 then
boom = true		
end
if curBeat == 224 or curBeat == 348 or curBeat == 476 or curBeat == 623 then
boom = false		
end
if curBeat == 288 then
waza = 8		
end
end