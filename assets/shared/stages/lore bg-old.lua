function onCreate()
    makeLuaSprite('1', 'Lore Bg/Lore_Bg_7', -300, -100)
    scaleObject('1', 1.1, 1.1)
    addLuaSprite('1')

    makeLuaSprite('2', 'Lore Bg/Lore_Bg_6', -300, -100)
    scaleObject('2', 1.1, 1.1)
    addLuaSprite('2')

    makeLuaSprite('3', 'Lore Bg/Lore_Bg_5', -300, -100)
    scaleObject('3', 1.1, 1.1)
    addLuaSprite('3')

    makeLuaSprite('4', 'Lore Bg/Lore_Bg_4', -300, -100)
    scaleObject('4', 1.1, 1.1)
    addLuaSprite('4')

    makeLuaSprite('5', 'Lore Bg/Lore_Bg_3', -300, -100)
    scaleObject('5', 1.1, 1.1)
    addLuaSprite('5')

    makeLuaSprite('6', 'Lore Bg/Lore_Bg_2', -300, -100)
    scaleObject('6', 1.1, 1.1)
    addLuaSprite('6')

    makeLuaSprite('7', 'Lore Bg/Lore_Bg_1', -300, -100)
    scaleObject('7', 1.1, 1.1)
    setObjectOrder('7', getObjectOrder('dadGroup') + 1)
    addLuaSprite('7')

    makeLuaSprite('8', 'Lore Bg/mesita_lore', 557, 720)
    scaleObject('8', 1.1, 1.1)
    addLuaSprite('8', false)

    makeLuaSprite('upBarr')
    makeGraphic('upBarr',1500,500,'000000')
    addLuaSprite('upBarr')
    setObjectCamera('upBarr','camHUD')

    makeLuaSprite('downBarr')
    makeGraphic('downBarr',1500,500,'000000')
    addLuaSprite('downBarr')
    setObjectCamera('downBarr','camHUD')

    screenCenter('upBarr','X')
    screenCenter('downBarr','X')
    setProperty('upBarr.y',-1500)
    setProperty('downBarr.y',1500)
    doTweenY('moveStart', 'upBarr', -490, 0.01 , 'circInOut')
    doTweenY('moveStart2', 'downBarr', 700, 0.01 , 'circInOut')
end