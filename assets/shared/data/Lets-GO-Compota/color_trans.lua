--[[ 
    I don't know how to use FlxTween.num I'm sorry, please don't kill me

    - ElSebas1231
]]

function onCreatePost()
    mc1 = getProperty('boyfriend.healthColorArray[0]') 
    mc2 = getProperty('boyfriend.healthColorArray[1]') 
    mc3 = getProperty('boyfriend.healthColorArray[2]')

    lc1 = getProperty('dad.healthColorArray[0]') 
    lc2 = getProperty('dad.healthColorArray[1]') 
    lc3 = getProperty('dad.healthColorArray[2]')
    
    makeLuaSprite('mc1', nil, 0, 1)
    makeLuaSprite('mc2', nil, 0, 1)
    makeLuaSprite('mc3', nil, 0, 1)

    makeLuaSprite('lc1', nil, 0, 1)
    makeLuaSprite('lc2', nil, 0, 1)
    makeLuaSprite('lc3', nil, 0, 1)
end

function onUpdatePost()
    setProperty('boyfriend.colorTransform.redMultiplier', getProperty('mc1.y'))
    setProperty('boyfriend.colorTransform.greenMultiplier', getProperty('mc1.y'))
    setProperty('boyfriend.colorTransform.blueMultiplier', getProperty('mc1.y'))

    setProperty('boyfriend.colorTransform.redOffset', getProperty('mc1.x'))
    setProperty('boyfriend.colorTransform.greenOffset', getProperty('mc2.x'))
    setProperty('boyfriend.colorTransform.blueOffset', getProperty('mc3.x'))

    setProperty('dad.colorTransform.redMultiplier', getProperty('lc1.y'))
    setProperty('dad.colorTransform.greenMultiplier', getProperty('lc1.y'))
    setProperty('dad.colorTransform.blueMultiplier', getProperty('lc1.y'))

    setProperty('dad.colorTransform.redOffset', getProperty('lc1.x'))
    setProperty('dad.colorTransform.greenOffset', getProperty('lc2.x'))
    setProperty('dad.colorTransform.blueOffset', getProperty('lc3.x'))
end

function onStepHit()
    if curStep == 896 or curStep == 1944 then
        doTweenX('mc1', 'mc1', mc1, 0.5, 'smoothStepIn')
        doTweenX('mc2', 'mc2', mc2, 0.5, 'smoothStepIn')
        doTweenX('mc3', 'mc3', mc3, 0.5, 'smoothStepIn')
        doTweenY('mc4', 'mc1', 0, 0.5, 'smoothStepIn')

        doTweenX('lc1', 'lc1', lc1, 0.5, 'smoothStepIn')
        doTweenX('lc2', 'lc2', lc2, 0.5, 'smoothStepIn')
        doTweenX('lc3', 'lc3', lc3, 0.5, 'smoothStepIn')
        doTweenY('lc4', 'lc1', 0, 0.5, 'smoothStepIn')
    elseif curStep == 1152 or curStep == 2431 then
        doTweenX('mc1', 'mc1', 0, 0.1, 'smoothStepIn')
        doTweenX('mc2', 'mc2', 0, 0.1, 'smoothStepIn')
        doTweenX('mc3', 'mc3', 0, 0.1, 'smoothStepIn')
        doTweenY('mc4', 'mc1', 1, 0.1, 'smoothStepIn')

        doTweenX('lc1', 'lc1', 0, 0.1, 'smoothStepIn')
        doTweenX('lc2', 'lc2', 0, 0.1, 'smoothStepIn')
        doTweenX('lc3', 'lc3', 0, 0.1, 'smoothStepIn')
        doTweenY('lc4', 'lc1', 1, 0.1, 'smoothStepIn')
    end
end