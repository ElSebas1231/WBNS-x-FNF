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
if curBeat == 32  or curBeat == 192 then
boom = true		
end
if curBeat == 96 then
boom1 = 0.005
boom2 = 0.015		
end
if curBeat == 188 or curBeat == 320 then
boom = false		
end
if curBeat == 192 then
boom1 = 0.015
boom2 = 0.025		
end
end