function onCreate()
makeLuaSprite("fondo",'fondos/compota/BG-vs_compota_20240208190740',-550,-200)
setScrollFactor("fondo", 0.5, 0.5)
scaleObject("fondo", 1.25, 1.25)
addLuaSprite("fondo")

makeAnimatedLuaSprite("waza",'fondos/compota/BG_Compota_2',-450,175)
setScrollFactor("waza", 0.75, 0.75)
addAnimationByPrefix("waza", "idle", "BG Compota 20",25, true)
scaleObject("waza", 1.2, 1.2)
addLuaSprite("waza")

makeLuaSprite("a",'fondos/compota/BG-vs_compota_20240208190443',-550,-180)
setScrollFactor("a", 0.5, 0.6)
scaleObject("a", 1.25, 1.5)
addLuaSprite("a")

makeLuaSprite("image",'fondos/compota/BG-vs_compota_20240208190118',-600,-200)
setScrollFactor("image", 0.95, 0.95)
scaleObject("image", 1.35, 1.35)
addLuaSprite("image")

makeLuaSprite("image1",'fondos/compota/BG-vs_compota_20240208190320',-500,-200)
setScrollFactor("image1",1.15, 0.95)
scaleObject("image1", 1.35, 1.35)
addLuaSprite("image1",true)

makeLuaSprite("feliz",'fondos/compota/BG-vs_compota_20240208190327',-500,-200)
setScrollFactor("feliz",1.15, 0.95)
scaleObject("feliz", 1.35, 1.35)
addLuaSprite("feliz",true)

makeAnimatedLuaSprite("waza2",'fondos/compota/BG_Compota_1',-800,700)
addAnimationByPrefix("waza2", "idle", "BG Compota 10",25, true)
setScrollFactor("waza2", 1.25, 0.6)
scaleObject("waza2", 1.65, 1.65)
addLuaSprite("waza2",true)
end

function onCreatePost()
setTextFont("botplayTxt", "All Season Font by Keithzo (7NTypes).otf"); 
setTextFont("scoreTxt", "All Season Font by Keithzo (7NTypes).otf"); 
setTextFont("timeTxt", "All Season Font by Keithzo (7NTypes).otf");
end