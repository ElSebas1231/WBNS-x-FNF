function onCreatePost()
    setProperty('iconP1.flipX', true)
    setProperty('iconP2.flipX', true)
    
    if not middlescroll then
        for i = 0, 3 do
            setPropertyFromGroup('playerStrums', i, 'x', _G['defaultOpponentStrumX'..i])
            setPropertyFromGroup('opponentStrums', i, 'x', _G['defaultPlayerStrumX'..i])
        end
    end
end

function onUpdate()
    if getProperty('boyfriend.curAnim.name') == 'Animation' then
        if getProperty('boyfriend.curAnim.finished') then
            setProperty('boyfriend.visible', false)
        end
    end
end

function onEvent(n, v1, v2)
    if n == 'Loco Classic' then
        if v1 == 'Cam Fade' then
            doTweenAlpha('hud', 'camHUD', 0, 1, 'cubeout')
        end
    end
end

function onMoveCamera(t)
    if t == 'dad' then
        setProperty('defaultCamZoom', 1.5)
    end

    if t == 'boyfriend' then
        setProperty('defaultCamZoom', 1.1)
    end
end