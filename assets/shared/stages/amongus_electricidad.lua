function onCreate()
    makeLuaSprite('bg1', 'fondos/elect/AmongUs_BG_1', -440, -400)
    setScrollFactor("bg1", 0.95, 0.95)
    scaleObject('bg1', 0.8, 0.8)
    addLuaSprite('bg1')

    makeLuaSprite('bg2', 'fondos/elect/AmongUs_BG_2', -150, -250)
    setScrollFactor("bg2", 1, 1)
    scaleObject('bg2', 0.75, 0.75)
    addLuaSprite('bg2', true)
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