function onCreate()
    makeLuaSprite('bg', 'barBG/bar', -450, -120)
    scaleObject('bg', 2.2, 2.2)
    setScrollFactor('bg', 0.9, 1)
    addLuaSprite('bg')

    makeAnimatedLuaSprite('duo', 'barBG/duo-bar', 80, -30)
    addAnimationByPrefix('duo', 'idle', 'duo-bar', 24, false)
    scaleObject('duo', 2.2, 2.2)
    setScrollFactor('duo', 0.9, 1)
    addLuaSprite('duo')

    makeAnimatedLuaSprite('audiencia', 'barBG/audiencia-bar', -80, 0)
    addAnimationByPrefix('audiencia', 'idle', 'audiencia-bar', 24, false)
    scaleObject('audiencia', 2.2, 2.2)
    setScrollFactor('audiencia', 0.9, 1)
    addLuaSprite('audiencia')

    makeAnimatedLuaSprite('mateo', 'barBG/mateo-bar', 960, 550)
    addAnimationByPrefix('mateo', 'idle', 'mateo-bar', 24, false)
    scaleObject('mateo', 2.2, 2.2)
    setScrollFactor('mateo', 0.8, 1)
    addLuaSprite('mateo', true)

    function onCreatePost()
        setProperty('gf.visible', false) --Camera reasons
    end
end

function onCountdownTick(c)
    if c % 2 == 0 then
        playAnim('duo', 'idle', true)
        playAnim('audiencia', 'idle', true)
        playAnim('mateo', 'idle', true)
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        playAnim('duo', 'idle', true)
        playAnim('audiencia', 'idle', true)
        playAnim('mateo', 'idle', true)
    end
end