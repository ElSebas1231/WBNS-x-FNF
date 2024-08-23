local boom = false
local nose = false
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
if nose then
    if curStep % waza == 0 then
setProperty('camHUD.y', 20)
 doTweenY('YAx','camHUD', 0, 0.35, 'quadOut')
end
end
end

function onBeatHit()
if curBeat == 4 or curBeat == 72 then
boom = true		
end
if curBeat == 68 then
boom = false		
end
if curBeat == 72 then
nose = true
boom1 = 0.025
boom2 = 0.035		
end
if curBeat == 296 then
nose = false
end
if curBeat == 472 then
nose = true
end
end