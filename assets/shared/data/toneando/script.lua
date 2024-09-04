function onCreate()
    makeLuaSprite('b', nil, screenWidth * -0.5, screenHeight * -0.5)
    makeGraphic('b', screenWidth * 2, screenHeight * 2, '000000')
    setScrollFactor('b', 0)
    setObjectCamera('b', 'hud')
    if not getPropertyFromClass('states.PlayState', 'chartingMode') then
        setProperty('b.alpha', true)
    else
        setProperty('b.alpha', false)
    end
    addLuaSprite('b', true)

    function onCreatePost()
        x1 = getProperty('boyfriend.cameraPosition[0]') + getProperty('boyfriendCameraOffset[0]')
        x2 = getProperty('dad.cameraPosition[0]') - getProperty('opponentCameraOffset[0]')
    
        y1 = getProperty('boyfriend.cameraPosition[1]') + getProperty('boyfriendCameraOffset[1]')
        y2 = getProperty('dad.cameraPosition[1]') + getProperty('opponentCameraOffset[1]')
    
        off1 = getProperty('camFollow.x') + (x1 + x2 / 2) - 550
        off2 = getProperty('camFollow.y') + (y1 + y2 / 2) - 50

        centerCam(true)
    end
end

function onSongStart()
    if not getPropertyFromClass('states.PlayState', 'chartingMode') then
        doTweenZoom('z1', 'camGame', 4, 0.01)
    else
        setProperty('isCameraOnForcedPos', false)
    end
end

local camCentered = false
local tweenCam = false
function onStepHit()
    if curStep >= 1666 and curStep <= 2176 then
        if not camCentered then
            centerCam(true)
            camCentered = true
        end
    elseif curStep >= 2176 then
        if camCentered then
            centerCam(false)
            camCentered = false
        end
    end
    if curStep >= 2560 then
        if not tweenCam then
            setProperty('isCameraOnForcedPos', false)
            doTweenAlpha('h', 'camHUD', 0, 4, 'smootstepin')
            doTweenX('x1', 'camFollow', off1, 3.5, 'smootstepout')
            doTweenY('y1', 'camFollow', off2, 3.5, 'smootstepout')
            debugPrint('aaaaa')
            tweenCam = true
        end
    end
end

function onTweenCompleted(t)
    if t == 'z1' then
        doTweenZoom('z2', 'camGame', 0.8, 8, 'smoothstepout')
        doTweenAlpha('b1', 'b', 0, 8)
    end

    if t == 'b1' then
        setProperty('isCameraOnForcedPos', false)
    end
end

function centerCam(center)
    triggerEvent('Camera Follow Pos', (center and tostring(off1) or ''), (center and tostring(off2) or ''))
    setProperty('isCameraOnForcedPos', center)
end