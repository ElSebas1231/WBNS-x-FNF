function onCreate()
    setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'aquinovs-dead')
end

function onGameOverStart()
    setProperty('boyfriend.colorTransform.redMultiplier', 1)
    setProperty('boyfriend.colorTransform.greenMultiplier', 1)
    setProperty('boyfriend.colorTransform.blueMultiplier', 1)

    setProperty('boyfriend.colorTransform.redOffset', 0)
    setProperty('boyfriend.colorTransform.greenOffset', 0)
    setProperty('boyfriend.colorTransform.blueOffset', 0)
end