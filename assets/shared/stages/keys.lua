function onCreate()
    makeLuaSprite('1', 'keys/keysfondo', -320, 150)
    setScrollFactor("1", 0.85, 1.2)
    scaleObject('1', 1.35, 1.35)
    addLuaSprite('1')

    makeAnimatedLuaSprite("2", 'keys/CH1', -150, 550);
    addAnimationByPrefix("2", "idle", "Idle0", 24, false)
    setScrollFactor("2", 1, 1)
    scaleObject('2', 1.45, 1.45)
    addLuaSprite("2")

    makeAnimatedLuaSprite("3", 'keys/CH2', 0, 550);
    addAnimationByPrefix("3", "idle", "Idle0", 24, false)
    setScrollFactor("3", 1, 1)
    scaleObject('3', 1.45, 1.45)
    addLuaSprite("3")

    makeAnimatedLuaSprite("4", 'keys/CH3', 600, 550);
    addAnimationByPrefix("4", "idle", "Idle0", 24, false)
    setScrollFactor("4", 1, 1)
    scaleObject('4', 1.45, 1.45)
    addLuaSprite("4")

    makeAnimatedLuaSprite("5", 'keys/CH4', 750, 550);
    addAnimationByPrefix("5", "idle", "Idle0", 24, false)
    setScrollFactor("5", 1, 1)
    scaleObject('5', 1.45, 1.45)
    addLuaSprite("5")

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
    doTweenY('moveStart', 'upBarr', -450, 0.01 , 'circInOut')
    doTweenY('moveStart2', 'downBarr', 680, 0.01 , 'circInOut')
end

function onCreatePost()
    doTweenColor("awa", "boyfriend", "A28FEB", 0.01, "linear")
    doTweenColor("llaves", "dad", "A28FEB", 0.01, "linear")
    doTweenColor("pi", "gf", "A28FEB", 0.01, "linear")

    doTweenColor("no", "2", "A28FEB", 0.01, "linear")
    doTweenColor("way", "3", "A28FEB", 0.01, "linear")
    doTweenColor("es", "4", "A28FEB", 0.01, "linear")
    doTweenColor("real", "5", "A28FEB", 0.01, "linear")

    setObjectOrder('dadGroup', getObjectOrder('boyfriendGroup') + 1)
    setObjectOrder('gfGroup', getObjectOrder('boyfriendGroup') + 2)
end

function onBeatHit()
    if curBeat % 2 == 0 then
        for i = 2, 5 do
            playAnim(i, 'idle', true)
        end
    end
end