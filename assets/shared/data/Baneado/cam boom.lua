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
if curBeat == 32 or curBeat == 192 or curBeat == 256 then
boom = true		
end
if curBeat == 188 or curBeat == 252 or curBeat == 347  or curBeat == 451 then
boom = false		
end
if curBeat == 355 then
boom = true
waza = 8		
end
end