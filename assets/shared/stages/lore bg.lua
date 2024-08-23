function onCreate()
    makeLuaSprite('1', 'Lore Bg/Lore_Bg_7', -850, -450)
    setScrollFactor("1", 0.85, 1.0)
    scaleObject('1', 1.25, 1.25)
    addLuaSprite('1')

    makeLuaSprite('2', 'Lore Bg/Lore_Bg_6', -460, -40)
    setScrollFactor("2", 0.85, 0.96)
    scaleObject('2', 1.05, 1.05)
    addLuaSprite('2')

    makeLuaSprite('3', 'Lore Bg/Lore_Bg_5', -500, 0)
    setScrollFactor("3", 0.75, 1.0)
    scaleObject('3', 1.0, 1.0)
    addLuaSprite('3')

    makeLuaSprite('4', 'Lore Bg/Lore_Bg_3', -750, -10)
    setScrollFactor("4", 0.68, 1.0)
    scaleObject('4', 1.0, 1.0)
    addLuaSprite('4')

    makeLuaSprite('5', 'Lore Bg/Lore_Bg_4', -900, -300)
    scaleObject('5', 1.25, 1.3)
    addLuaSprite('5')

    makeLuaSprite('6', 'Lore Bg/Lore_Bg_2', -400, -60)
    setScrollFactor("6", 0.95, 0.9)
    scaleObject('6', 1.05, 1.05)
    addLuaSprite('6')

    makeLuaSprite('7', 'Lore Bg/Lore_Bg_1', -1400, -290)
    setScrollFactor("7", 1.35, 1.15)
    scaleObject('7', 1.25, 1.25)
    addLuaSprite('7', true)

    makeLuaSprite('8', 'Lore Bg/mesita_lore', 355, 720)
    scaleObject('8', 1.1, 1.1)
    addLuaSprite('8', false)

makeAnimatedLuaSprite("logo",'Lore Bg/tiktoklogo',70,600)
addAnimationByPrefix("logo", "idle", "idle0",54, true)
setObjectCamera("logo",'Other')
scaleObject("logo", 0.45, 0.45)
addLuaSprite("logo",true)
end

function onCreatePost()
setTextFont("botplayTxt", "Cracker Winter.otf"); 
setTextFont("scoreTxt", "Cracker Winter.otf"); 
setTextFont("timeTxt", "Cracker Winter.otf"); 
setTextBorder('timeTxt',2.5,'000000')
setTextSize('timeTxt', 22)
setTextSize('scoreTxt', 18)
end
