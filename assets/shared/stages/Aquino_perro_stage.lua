function onCreate()
makeLuaSprite('XD', 'fondos/AKJHSLKAJDLKJALKSJA/fondo', -1150, -1200)
setScrollFactor("XD", 0.95, 0.95)
scaleObject('XD', 2.8, 2.8)
addLuaSprite('XD', false)

makeLuaSprite('XD2', 'fondos/AKJHSLKAJDLKJALKSJA/arboles', -800, -650)
setScrollFactor("XD2", 1.05, 1.05)
scaleObject('XD2', 1.8, 1.8)
addLuaSprite('XD2', false)
end

function onCreatePost()
setTextFont("botplayTxt", "vcr.otf"); 
setTextFont("scoreTxt", "vcr.otf"); 
setTextFont("timeTxt", "vcr.otf"); 
setTextSize('timeTxt', 15)
setTextSize('scoreTxt', 15)
end