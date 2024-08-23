function onCreate()
    makeLuaSprite("fondo",'animal/FondoPetConflict', -500, -180)
    scaleObject("fondo", 1.2, 1.2)
    setScrollFactor("fondo", 0.9, 0.9)
    addLuaSprite("fondo", false)

    makeAnimatedLuaSprite("pez",'animal/CejoPez', -150, 325)
    addAnimationByPrefix("pez", 'idle', 'Idle0', 20, false)
    scaleObject("pez", 1.35, 1.35)
    setScrollFactor("pez", 1.2, 0.9)
    addLuaSprite("pez", false)

    makeLuaSprite("light",'light', -1000, -300)
    scaleObject("light", 1.2, 1.2)
    setScrollFactor("light", 1.2,0.7)
    setProperty('light.alpha', 0.5)
    setBlendMode("light",'add')
    addLuaSprite("light", true)
end

function onCountdownTick(c)
    if c % 2 == 0 then
        playAnim('pez', 'idle', true)
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        playAnim('pez', 'idle', true)
    end
end