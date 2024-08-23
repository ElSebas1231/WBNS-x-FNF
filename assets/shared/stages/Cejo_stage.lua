function onCreate()
    makeLuaSprite("fondo",'cejo/Bg-Cejo_week_20240325200318_1',-500,-350)
    setScrollFactor("fondo", 0.95, 0.95)
    scaleObject("fondo", 1.2, 1.2)
    addLuaSprite("fondo")

    makeAnimatedLuaSprite("osanose",'cejo/chuy_fondo', 350, 310)
    addAnimationByPrefix("osanose", "idle", "chuy fondo0",24, true)
    setScrollFactor("osanose", 1.1, 0.95)
    scaleObject("osanose", 1.7, 1.7)
    addLuaSprite("osanose", false)

    makeAnimatedLuaSprite("gtx",'cejo/gtx_fondo', 750, 168)
    addAnimationByPrefix("gtx", "idle", "GTX fondo0",24, true)
    setScrollFactor("gtx",1.1, 0.95)
    scaleObject("gtx", 1.7, 1.7)
    addLuaSprite("gtx", false)

    makeAnimatedLuaSprite("gatisty",'cejo/gatisty_fondo', 1350, 50)
    addAnimationByPrefix("gatisty", "idle", "gatisty fondo0",24, true)
    setScrollFactor("gatisty", 1.05, 1.05)
    setProperty('gatisty.flipX',true)
    scaleObject("gatisty", 1.3, 1.3)
    addLuaSprite("gatisty", false)

    makeAnimatedLuaSprite("pez",'cejo/steyb_fondo', -350, 600)
    addAnimationByPrefix("pez", "idle", "steyb fondo0",24, true)
    setScrollFactor("pez", 1.05, 1.05)
    scaleObject("pez", 1.4, 1.4)
    addLuaSprite("pez", false)
end

function onCreatePost()
setTextFont("botplayTxt", "fortnite.otf"); 
setTextFont("scoreTxt", "fortnite.otf"); 
setTextFont("timeTxt", "fortnite.otf");
setTextSize('boyplayTxt', 25)
setTextSize('timeTxt', 15)
setTextSize('scoreTxt', 20)
setProperty('timeTxt.y',  (downscroll and 685 or 29))
end
