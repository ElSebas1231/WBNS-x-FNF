function onCreate()
    makeLuaSprite('bg', 'mogus/polusbg', -800, -400)
    setScrollFactor("bg", 0.75, 0.75)
    scaleObject('bg', 1.1, 1.1)
    addLuaSprite('bg')

    makeLuaSprite('mesa', 'mogus/mesapolus', -620, 300)
    addLuaSprite('mesa', true)

    makeLuaSprite('mogus', 'mogus/susbg', -500, -100)
    setScrollFactor('mogus', 0.6, 0.6)
    addLuaSprite('mogus', true)
end

function onBeatHit()
    if curBeat % 2 == 0 then
        setProperty('mogus.y',-80)
        runTimer('a', 0.15)
    end
end

function onCreatePost()
setProperty('timeBar.visible', false);
setTextFont("botplayTxt", "amongus vector.ttf"); 
setTextFont("scoreTxt", "amongus vector.ttf"); 
setTextFont("timeTxt", "amongus vector.ttf");
setTextSize('boyplayTxt', 20)
setTextSize('timeTxt', 30)
setTextSize('scoreTxt', 25)
end

function onCountdownTick(c)
    if c % 2 == 0 then
        setProperty('mogus.y',-80)
        runTimer('a', 0.15)
    end
end

function onTimerCompleted(tag)
if tag == 'a' then
doTweenY("noway", "mogus", -100, 0.15,'linear')    
runTimer('noway', 1.05)
end
end