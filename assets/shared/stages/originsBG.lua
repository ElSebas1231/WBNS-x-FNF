local scale = 1.5
local cameraLock = true

function onCreate()
    makeLuaSprite('bg', 'originsBG/fondo1', 30, 0)
    setScrollFactor('bg', 0.8, 1.1)
    scaleObject('bg', scale, scale)
    addLuaSprite('bg')

    makeLuaSprite('fg', 'originsBG/fondo2', -200, 220)
    scaleObject('fg', scale + 0.3, scale - 0.5)
    setScrollFactor('fg', 1, 1)
    addLuaSprite('fg', true)
end

function onCreatePost()
    if cameraLock then
        x1 = getProperty('boyfriend.cameraPosition[0]') + getProperty('boyfriendCameraOffset[0]')
        x2 = getProperty('dad.cameraPosition[0]') - getProperty('opponentCameraOffset[0]')

        y1 = getProperty('boyfriend.cameraPosition[1]') + getProperty('boyfriendCameraOffset[1]')
        y2 = getProperty('dad.cameraPosition[1]') + getProperty('opponentCameraOffset[1]')

        off1 = getProperty('camFollow.x') + (x1 + x2 / 2) + 70
        off2 = getProperty('camFollow.y') + (y1 + y2 / 2) - 130

        triggerEvent('Camera Follow Pos', tostring(off1), tostring(off2))
        setProperty('isCameraOnForcedPos', true)
        setProperty('cameraSpeed', 20)
    end
end