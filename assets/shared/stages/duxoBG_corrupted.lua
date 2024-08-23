function onCreatePost()
    makeLuaSprite('bg2', 'duxo/duxo-bg-corrupted', -650, -120)
    scaleObject('bg2', 1.2, 1.2)
    setScrollFactor("bg2", 0.99, 0.99)
    addLuaSprite('bg2')

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
        if getProperty('negro.alpha') == 1 then
            setProperty('bgcharsF.alpha', 0)
        else
            setProperty('bgcharsF.alpha', 1)
        end
    end
end

function onEvent(n, v1, v2)
    if n == 'Change Character' then
        if v1 == 'GF' then
            if v2 == 'RitzPOV' then
                setProperty('gf.x', -100)
                setProperty('gf.y', 800)

                setObjectOrder('gfGroup', getObjectOrder('dadGroup') + 1)
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