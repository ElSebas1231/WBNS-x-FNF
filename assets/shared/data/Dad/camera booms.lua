local boom = false

function onStepHit()
if boom then
    if curStep % 4 == 0 then
    triggerEvent("Add Camera Zoom", 0.05, 0.05)
  end
  end
end

function onBeatHit()
 if curBeat >= 354 then
     boom = true
  end
 if curBeat >= 418 then
     boom = false
  end	
end

