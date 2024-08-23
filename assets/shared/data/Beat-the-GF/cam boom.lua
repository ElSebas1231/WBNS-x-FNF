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
    if curBeat == 4 or curBeat == 36 or curBeat == 76 or curBeat == 92 then
        boom = true		
    end
    if curBeat == 34 or curBeat == 68 or curBeat == 84 then
        boom = false		
    end
end