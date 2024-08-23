function onCreate()
    if not getProperty('skipCountdown') then
        makeLuaSprite('blackbg', nil, screenWidth * -0.5, screenHeight * -0.5)
        makeGraphic('blackbg', screenWidth * 2, screenHeight * 2, '000000')
        setObjectOrder('blackbg', getObjectOrder('boyfriendGroup') + 1)
        addLuaSprite('blackbg')
        setObjectCamera('blackbg','other')

        makeLuaSprite('soul', 'hearticon', 0, 0)
        setObjectCamera('soul','other')
        setProperty('soul.antialiasing', false)
        screenCenter('soul')
        addLuaSprite('soul', true)

        --[[ In case you wanna have a different color, uncomment this and delete the other one
        makeLuaSprite('soul', 'hearticon-white', 0, 0)
        screenCenter('soul')
        addLuaSprite('soul', true)
        setProperty('camHUD.alpha', 0)
        ]]
    end
end

function onCreatePost()
    if not getProperty('skipCountdown') then
        --setProperty('soul.color', getIconColor('boyfriend'))
        setProperty('introSoundsSuffix', nil)
        setProperty('camFollow.x', getMidpointX('gfGroup') - 100)
        setProperty('camFollow.y', getMidpointY('gfGroup') - 100)
        setProperty('camFollowPos.x', getMidpointX('gfGroup') - 100)
        setProperty('camFollowPos.y', getMidpointY('gfGroup') - 100)
        setProperty('isCameraOnForcedPos', true)
    else
        setProperty('camHUD.alpha', getProperty('camHUD.alpha'))
        removeLuaSprite('soul')
        removeLuaSprite('blackbg')
    end
end

function onSongStart()
    if not getProperty('skipCountdown') then
        doTweenAlpha('soulAlpha', 'soul', 0, 1.2, 'smoothStepOut')
        setProperty('camHUD.alpha', 1)
        section = mustHitSection
        setProperty('isCameraOnForcedPos', false)
        cameraSetTarget((section and 'boyfriend' or 'dad'))
    end
end

function onCountdownTick(counter)
    if counter ~= 4 then
        playSound('black-out', 1, 'blacki')
    end
    if counter % 2 == 0 then
        setProperty('soul.visible', false)
    else
        setProperty('soul.visible', true)
    end
    if counter == 4 then
        setProperty('soul.visible', true)
        playSound('battle-start', 1, 'starti')
        doTweenX('soulX', 'soul', getProperty('boyfriend.x') + 250, 0.3)
        doTweenY('soulY', 'soul', getProperty('boyfriend.y') - 90, 0.3)
        doTweenAlpha('blackbgAlpha', 'blackbg', 0, 0.3, 'smoothStepOut')
    end
end

function onPause()
    if luaSoundExists('blacki') then
        pauseSound('blacki')
    elseif luaSoundExists('starti') then
        pauseSound('starti')
    end
end

function onResume()
    if luaSoundExists('blacki') then
        resumeSound('blacki')
    elseif luaSoundExists('starti') then
        resumeSound('starti')
    end
end

function getIconColor(chr)
	local chr = chr or "dad"
	return getColorFromHex(rgbToHex(getProperty(chr .. ".healthColorArray")))
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end