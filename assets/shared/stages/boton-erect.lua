function onCreate()
    makeAnimatedLuaSprite('bg', 'fondos/boton/Escenario-Boton-Erect', -400, -20)
    addAnimationByPrefix('bg', 'idle', 'Escenario-Boton-Erect idle', 48, false)
    setProperty('bg.antialiasing', false)
    scaleObject('bg', 2.2, 2.2)
    addLuaSprite('bg')
end

function onCountdownTick(c)
    if c % 2 == 0 then
        playAnim('bg', 'idle', true)
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        playAnim('bg', 'idle', true)
    end
end