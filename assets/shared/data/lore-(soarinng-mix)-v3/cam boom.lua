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
if curBeat == 72 or curBeat == 168 or curBeat == 272 or curBeat == 344 or curBeat == 376 then
boom = true		
end
if curBeat == 160 or curBeat == 192 or curBeat == 336 or curBeat == 368 or curBeat == 392 then
boom = false		
end
end