local curSelection = 1
local allowSubState = true
local canSelect = true
local cosas = {"scoreTxt", "timeBar.bg", "timeBar.leftBar", "timeBar.rightBar", "timeTxt"}

function onUpdate()
    if allowSubState and not seenCutscene then
        openCustomSubstate('Pop-Up', true)
        return Function_Stop
    end
    return Function_Continue
end

function onStepHit()
    if curStep > 0 then
        if allowSubState then
            allowSubState = false
        end
    end
end

function onTimerCompleted(t)
    if t == 'closing' then
        for i = 1, #cosas do
            doTweenAlpha('things'..cosas[i], cosas[i], 1, 0.01)
        end

        for i = 0, 3 do
            setPropertyFromGroup('playerStrums', i, 'visible', true)
        end
        setProperty('camGame.visible', true)
        closeCustomSubstate()
        allowSubState = false
    end
end

function onCustomSubstateCreate(t)
    if t == 'Pop-Up' then
        setProperty('camGame.visible', false)
        for i = 1, #cosas do
            doTweenAlpha('things'..cosas[i], cosas[i], 0, 0.01)
        end

        for i = 0, 3 do
            setPropertyFromGroup('playerStrums', i, 'visible', false)
        end

        makeLuaText('warning', nil, 1280, 0, 0)
        setTextFont('warning', 'JapariSans.otf')
        setTextString('warning', [[
            ¡Advertencia!
            Se recomienda a aquellos que estén grabando con cámara activada que la desactiven 
            solamente en esta canción para una mejor experiencia dentro del juego. 
            De antemano muchas gracias. ¡Que disfrutes la canción!

            Presiona ENTER ó ESPACIO para continuar
        ]])
        setTextAlignment('warning', 'center')
        screenCenter('warning')
        setProperty('warning.y', getProperty('warning.y') - 130)
        setProperty('warning.antialiasing', getPropertyFromClass('backend.ClientPrefs', 'data.antialiasing'))
        setProperty('warning.alpha', 0)
        setTextSize('warning', 25)
        doTweenAlpha('warningA', 'warning', 1, 1.5)
        addLuaText('warning')
    end
end

function onCustomSubstateUpdate(t)
    if t == 'Pop-Up' then
        if keyJustPressed('accept') and canSelect then
            if canSelect then
                canSelect = false
            end
            cancelTween('warningA')
            doTweenAlpha('warningAC', 'warning', 0, 2)
            runTimer('closing', 2)
        end
    end
end

function onTweenCompleted(t)
    if t == 'warningAC' then
        removeLuaText('warning', true)
    end
end