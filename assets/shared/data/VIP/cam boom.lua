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
if curBeat == 32 or curBeat == 64 or curBeat == 128 or curBeat == 192 then
boom = true			
end
if curBeat == 62 or curBeat == 96 or curBeat == 190 or curBeat == 224 then
boom = false		
end
if curBeat == 64 or curBeat == 192 then
boom1 = 0.025
boom2 = 0.035		
end
if curBeat == 160 then
boom1 = 0.015
boom2 = 0.025		
end
end