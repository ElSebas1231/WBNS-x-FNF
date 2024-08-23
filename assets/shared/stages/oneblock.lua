function onCreatePost()
    makeAnimatedLuaSprite('bg', 'fondos/oneblock/Escenario-C3jitauwu', 50, 300)
    scaleObject('bg', 2, 2)
    addAnimationByPrefix('bg', 'idle', 'Escenario-C3jitauwu idle', 24, false)
    setProperty('bg.antialiasing', false)
    addLuaSprite('bg', false);
end

function onStepHit()
    if curStep % 2 == 0 then
        playAnim('bg', 'idle')
    end
end