local boom = false
local boom1 = 0.025
local boom2 = 0.035
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

function onBeatHit()
if curBeat == 16 or curBeat == 48 or curBeat == 176 then
boom = true
end 
if curBeat == 46 or curBeat == 112 or curBeat == 240 then
boom = false
end 
end
end