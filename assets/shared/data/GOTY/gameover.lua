function onCreate()
    setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', 'silencio')
    setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'silencio')
end

function onGameOverStart()
    makeAnimatedLuaSprite('gm', 'goty/stream-caido', 0, 0)
    addAnimationByPrefix('gm', 'idle', 'end0', 24, true)
    scaleObject('gm', 2.65, 2.65)
    screenCenter('gm')
    setScrollFactor('gm', 0, 0)
    addLuaSprite('gm', true)

    setProperty('boyfriend.visible', false)
end