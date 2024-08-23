function onCreate()
    if string.lower(songName) == 'rether forever' then
        setProperty('defaultCamZoom', 0.72)
    end

    dadX = getProperty('dad.x')
    dadY = getProperty('dad.y')

    bfX = getProperty('boyfriend.x')
    bfY = getProperty('boyfriend.y')    
end

function onCreatePost()
    makeLuaSprite('demo', 'fondos/duxo-demo/f2', -755, -60)
    scaleObject('demo', 1.1, 1.1)
    setProperty('demo.visible', false)
    addLuaSprite('demo', false)

    makeLuaSprite('bg', 'duxo/BG-Duxo_week', -650, -120)
    scaleObject('bg', 1.2, 1.2)
    setScrollFactor("bg", 0.95, 0.99)
    addLuaSprite('bg')

    makeAnimatedLuaSprite('bgchars', 'duxo/BG_Duxo_Week', -480, 200)
    addAnimationByPrefix('bgchars', 'idle', 'BG Duxo Week', 24, false)
    setScrollFactor("bgchars", 1, 1)
    scaleObject('bgchars', 1.1, 1.1)
    addLuaSprite('bgchars')

    makeAnimatedLuaSprite('bgcharsF', 'duxo/publico-duxo-week', -700, 900)
    addAnimationByPrefix('bgcharsF', 'idle', 'idle-publico0', 24, false)
    scaleObject('bgcharsF', 1.8, 1.8)
    addLuaSprite('bgcharsF', true)

    if gfName == 'ritz' then
        setProperty('boyfriend.x', 720)
        setProperty('boyfriend.y', 840)
    end
end

function onUpdate()
    if luaSpriteExists('negro') then
        setProperty('bgcharsF.alpha', 1 - getProperty('negro.alpha'))

        if getProperty('bgcharsF.alpha') <= 0 then
            setProperty('bgcharsF.alpha', 0)
        end
    end
end

function onEvent(n, v1, v2)
    if n == 'Stage Change' then
        if v1 == 'demo' then
            setProperty('demobg.visible', true)
            setProperty('demo.visible', true)
            setProperty('bg.visible', false)
            setProperty('bgchars.visible', false)
            setProperty('bgcharsF.visible', false)

            if string.lower(songName) == 'rethey forever' then
                setProperty('boyfriend.x', 685)
                setProperty('boyfriend.y', 790)   
    
                setCharacterX('dad', -320)
                setCharacterY('dad', 380)   
            end
        end

        if v1 == 'release' then
            setProperty('demobg.visible', false)
            setProperty('demo.visible', false)
            setProperty('bg.visible', true)
            setProperty('bgchars.visible', true)
            setProperty('bgcharsF.visible', true)

            if string.lower(songName) == 'rethey forever' then
                setProperty('boyfriend.x', 685)
                setProperty('boyfriend.y', 790)   
    
                setProperty('dad.x', -270)
                setProperty('dad.y', 430)  
            end 
        end
    end
end

function onCountdownTick(c)
    if c % 2 == 0 then
        playAnim('bgchars', 'idle', true)
        playAnim('bgcharsF', 'idle', true)
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        playAnim('bgchars', 'idle', true)
        playAnim('bgcharsF', 'idle', true)
    end
end