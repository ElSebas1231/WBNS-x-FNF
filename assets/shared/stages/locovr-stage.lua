function onCreate()
    makeLuaSprite("fondo",'loco/LocoBG-1',-500,-480)
    setScrollFactor("fondo", 0.75, 0.75)
    scaleObject("fondo", 0.85, 0.85)
    addLuaSprite("fondo")

    makeAnimatedLuaSprite("emi",'loco/pipol_webones', 450, 150)
    addAnimationByPrefix("emi", "idle", "idle emi0", 24, false)
    setScrollFactor("emi", 0.8, 0.8)
    scaleObject("emi", 0.45, 0.45)
    addLuaSprite("emi", false)

    makeAnimatedLuaSprite("rakk",'loco/pipol_webones', -250, 180)
    addAnimationByPrefix("rakk", "idle", "idle rakk0", 24, false)
    setScrollFactor("rakk", 0.8, 0.8)
    scaleObject("rakk", 0.45, 0.45)
    addLuaSprite("rakk", false)

    makeAnimatedLuaSprite("lunaria",'loco/pipol_webones',   100, 110)
    addAnimationByPrefix("lunaria", "idle", "idle lunari0", 24, false)
    setScrollFactor("lunaria", 0.8, 0.8)
    scaleObject("lunaria", 0.45, 0.45)
    addLuaSprite("lunaria", false)

    makeAnimatedLuaSprite("kendo",'loco/pipol_webones', 750, 150)
    addAnimationByPrefix("kendo", "idle", "idle  kend0", 24, false)
    setScrollFactor("kendo", 0.8, 0.8)
    scaleObject("kendo", 0.45, 0.45)
    addLuaSprite("kendo", false)

    makeAnimatedLuaSprite("aquino",'loco/pipol_webones', 1350, 230)
    addAnimationByPrefix("aquino", "idle", "idle aquinin0", 24, false)
    setScrollFactor("aquino", 0.8, 0.8)
    scaleObject("aquino", 0.45, 0.45)
    addLuaSprite("aquino", false)

    makeLuaSprite("fondo1",'loco/LocoBG-2',-500,-450)
    setScrollFactor("fondo1", 0.95, 0.95)
    scaleObject("fondo1", 0.85, 0.85)
    addLuaSprite("fondo1")

    makeAnimatedLuaSprite("gentevr2",'loco/bg_loco_vr_2', -700, 150)
    addAnimationByPrefix("gentevr2", "idle", "BG Loco 20",24, false)
    setScrollFactor("gentevr2", 0.8, 0.8)
    scaleObject("gentevr2", 1.1, 1.1)
    addLuaSprite("gentevr2", true)
end

function onCreatePost()
    doTweenColor("awa", "boyfriend", "#a67bbb", 0.01, "linear")
    doTweenColor("llaves", "dad", "#a67bbb", 0.01, "linear")
    doTweenColor("pi", "gf", "#a67bbb", 0.01, "linear")
    doTweenColor("no", "gentevr2", "#a67bbb", 0.01, "linear")

    setTextFont("botplayTxt", "Dosis-Regular.otf"); 
    setTextFont("scoreTxt", "Dosis-Regular.otf"); 
    setTextFont("timeTxt", "Dosis-Regular.otf");
    setTextSize('boyplayTxt', 25)
    setTextSize('timeTxt', 20)
    setProperty('timeTxt', getProperty('timeTxt') - 5)
    setTextSize('scoreTxt', 20)
    setProperty('timeTxt.y',  (downscroll and 685 or 29))
end

bgChars = {
    'emi', 'rakk', 'lunaria', 'kendo', 'aquino', 'gentevr2' 
}

function onBeatHit()
    if curBeat % 2 == 0 then
        for i = 1, #bgChars do
            playAnim(bgChars[i], 'idle', true)
        end
    end
end