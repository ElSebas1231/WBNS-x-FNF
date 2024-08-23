function onCreate()
    makeLuaText("night", "12:00 AM\n5th Night", 720, 0, 0)
    setTextBorder('night',0.5,'ffffff')
    setTextFont('night', 'FiveFontsatFreddy_s-Regular.ttf')
    setObjectCamera("night", 'Other')
    setTextSize('night', 45);
    screenCenter('night')
    setProperty('night.alpha',0)
    addLuaText('night')
end

function onStepHit()
if curStep == 1 then
runTimer('ma', 0.5)
setProperty('night.alpha',1)  
end
end

function onEvent(eventName, value1, value2, strumTime)
if eventName == 'sanfordxd' then
if value1 == 'aquino' then
runTimer('ma', 0.5)
setProperty('night.alpha',1)
setTextString('night', '5:00 AM\n5th Night')
end
if value1 == 'lucasta' then
runTimer('ma', 0.5)
setProperty('night.alpha',1)
setTextString('night', '1:00 AM\n5th Night')
end
if value1 == 'mictia' then
runTimer('ma', 0.5)
setProperty('night.alpha',1)
setTextString('night', '2:00 AM\n5th Night')
end
if value1 == 'michu' then
runTimer('ma', 0.5)
setProperty('night.alpha',1)
setTextString('night', '3:00 AM\n5th Night')
end
if value1 == 'soaring' then
runTimer('ma', 0.5)
setProperty('night.alpha',1)
setTextString('night', '4:00 AM\n5th Night')
end
end
end

function onTimerCompleted(tag)
if tag == 'ma' then
doTweenAlpha('fin', 'night', 0, 1.5, 'linear');
end
end
