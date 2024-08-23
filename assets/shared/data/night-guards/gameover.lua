function onCreate()
    setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', 'silencio')
    setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'fnaf gameover')
end

function onGameOverStart()
    runHaxeCode([[
        game.camGame.setFilters();
    ]])

    if dadName == 'GoldenFreddy-FNAF' then
        setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'silencio')

        makeLuaSprite('golden', 'euzqh160ptp61', 0, 0)
        setObjectCamera('golden', 'hud')
        setScrollFactor('gm screen', 0, 0)
        scaleObject('golden',0.67,0.67)
        addLuaSprite('golden')
        
        playSound('screamGolden', 0.5, 'golden')
    else
        makeLuaSprite('gm screen', 'fnafBG/fnaf gameover', 0, 0)
        screenCenter('gm screen')
        setObjectCamera('gm screen', 'hud')
        setScrollFactor('gm screen', 0, 0)
        addLuaSprite('gm screen')

        makeAnimatedLuaSprite('static1', 'static', 0, 0)
        addAnimationByPrefix('static1', 'idle', 'idle0', 24, true)
        setScrollFactor('static1', 0, 0)
        setObjectCamera('static1', 'hud')
        screenCenter('static1')
        addLuaSprite('static1')

        runTimer('fade', 10.3)
    end
    setProperty('boyfriend.visible', false)
end

function onGameOverConfirm(retry)
    cameraFade('camHUD', '000000', 2)
end

function onSoundFinished(t)
    if t == 'golden' then
        os.exit()
    end
end

function onTimerCompleted(t)
    if t == 'fade' then
        doTweenAlpha('static', 'static1', 0, 1)
    end
end

function onTweenCompleted(t)
    if t == 'static' then
        removeLuaSprite('static1', true)
    end
end