heartScale = 6;
heartPrefix = '-normal'

function onCreate()
    setProperty('healthBar.visible', false)
    setProperty('timeBar.visible', false)
    setProperty('timeBarBG.visible', false)
    setProperty('timeTxt.visible', false)
    setProperty('scoreTxt.visible', false)
    setProperty('iconP2.visible', false)

    if downscroll then
        heartsOffsets = 735
    else
        heartsOffsets = 285
    end

    for i = 1, 4 do
        makeLuaSprite('heartHolder'..i, 'hearts'..heartPrefix, 0, (downscroll and 60 or 600))
        scaleObject('heartHolder'..i, heartScale, heartScale)
        loadGraphic('heartHolder'..i, 'hearts'..heartPrefix, 9, 0);
        addAnimation('heartHolder'..i, 'heart', {0, 1, 2}, 24, false);
        setProperty('heartHolder'..i..'.antialiasing', false);
        setObjectCamera('heartHolder'..i, 'hud');
        addLuaSprite('heartHolder'..i, false);
    end

    setProperty('heartHolder1.x', 250)
    setProperty('heartHolder2.x', getProperty('heartHolder1.x') + 60)
    setProperty('heartHolder3.x', getProperty('heartHolder2.x') + 250)
    setProperty('heartHolder4.x', getProperty('heartHolder3.x') + 60)
    
    makeLuaSprite('box1', 'Squares', 180, (downscroll and 60 or 490))
    scaleObject('box1', 5.2, 5.2)
    
    setProperty('box1.antialiasing', false)
    setObjectCamera('box1', 'hud')
    screenCenter('box1', 'x')
    addLuaSprite('box1')

    makeLuaSprite('expempty', 'expbar/empty', 0, (downscroll and 38 or 658))
    scaleObject('expempty', 3, 3)
    setObjectCamera('expempty', 'hud')
    setProperty('expempty.antialiasing', false)
    addLuaSprite('expempty', true)
    screenCenter('expempty', 'x')
  
    makeLuaSprite('expfill', 'expbar/full', 0, getProperty('expempty.y'))
    scaleObject('expfill', 3, 3)
    setObjectCamera('expfill', 'hud')
    setProperty('expfill.antialiasing', false)
    screenCenter('expfill', 'x')
    setProperty('expfill._frame.frame.width', 0.002)
    addLuaSprite('expfill', true)

    makeLuaText('exptext', (timeBarType == 'Song Name' and string.gsub(songName, "-", " ") or '00:00'), 400, 42 + screenWidth/2 - 248, screenHeight/2 -335)
    setTextAlignment('exptext', 'center')
    setTextFont('exptext', 'Minecraftia.ttf')
    setTextSize('exptext', 20)
    setProperty('exptext.antialiasing', false)
    setProperty('exptext.y', (downscroll and getProperty('expempty.y') - 30 or getProperty('expempty.y') + 10))
    screenCenter('exptext', 'x')
    setTextColor('exptext', 'b5fc7c')
    setObjectCamera('exptext', 'hud')

    makeLuaText('scoreText', nil, 400, 0, (downscroll and 225 or 455))
    setTextAlignment('scoreText', 'center')
    setTextFont('scoreText', 'Minecraftia.ttf')
    setTextSize('scoreText', 20)
    setProperty('scoreText.antialiasing', false)
    screenCenter('scoreText', 'x')
    setProperty('scoreText.x', getProperty('scoreText.x') - 10)
    setTextColor('scoreText', 'b5fc7c')
    setObjectCamera('scoreText', 'hud')

    if timeBarType ~= 'Song Name' then
        setProperty('exptext.alpha', 0)
    end

    addLuaText('exptext', true)
    addLuaText('scoreText', true)
end

local allowTime = false

function onSongStart()
    allowTime = true
end

function onUpdate()
    if curStep <= 10 then
        setProperty('iconP1.alpha',0.99999)
        setProperty('exptext.alpha',0.99999)
        if downscroll then
            setProperty('scoreText.y', 175)
        end
    end

    curTime = math.max(0, getSongPosition() - noteOffset)
    songCalc = songLength - curTime

    if timeBarType == 'Time Elapsed' then
        songCalc = curTime
    end
    
    secondsTotal = math.floor(songCalc / 1000)
    if secondsTotal < 0 then
        secondsTotal = 0
    end

    if timeBarType ~= 'Song Name' then
        setTextString('exptext', string.format("%.2d:%.2d", secondsTotal/60%60, secondsTotal%60))
	end
end

--[[
    Frame 0 = vacio
    Frame 1 = completo
    Frame 2 = medio completo
]]

function onUpdatePost()
    if getHealth() < 0.3 then
        for i = 1, 4 do
            setProperty('heartHolder'..i..'.animation.curAnim.curFrame', 0)
        end
    elseif getHealth() >= 0.3 and getHealth() <= 0.5 then
        setProperty('heartHolder1.animation.curAnim.curFrame', 2)
        for i = 2, 4 do
            setProperty('heartHolder'..i..'.animation.curAnim.curFrame', 0)
        end
    elseif getHealth() > 0.5 and getHealth() <= 0.7 then
        setProperty('heartHolder1.animation.curAnim.curFrame', 1)
        for i = 2, 4 do
            setProperty('heartHolder'..i..'.animation.curAnim.curFrame', 0)
        end
    elseif getHealth() > 0.7 and getHealth() <= 0.9 then
        setProperty('heartHolder1.animation.curAnim.curFrame', 1)
        setProperty('heartHolder2.animation.curAnim.curFrame', 2)
        for i = 3, 4 do
            setProperty('heartHolder'..i..'.animation.curAnim.curFrame', 0)
        end
    elseif getHealth() > 0.9 and getHealth() <= 1.1 then
        for i = 1, 2 do
            setProperty('heartHolder'..i..'.animation.curAnim.curFrame', 1)
        end
        for i = 3, 4 do
            setProperty('heartHolder'..i..'.animation.curAnim.curFrame', 0)
        end
    elseif getHealth() > 1.1 and getHealth() <= 1.3 then
        setProperty('heartHolder3.animation.curAnim.curFrame', 2)
        setProperty('heartHolder4.animation.curAnim.curFrame', 0)
        for i = 1, 2 do
            setProperty('heartHolder'..i..'.animation.curAnim.curFrame', 1)
        end
    elseif getHealth() > 1.3 and getHealth() <= 1.5 then
        setProperty('heartHolder4.animation.curAnim.curFrame', 0)
        for i = 1, 3 do
            setProperty('heartHolder'..i..'.animation.curAnim.curFrame', 1)
        end
    elseif getHealth() >= 1.5 and getHealth() <= 1.7 then
        setProperty('heartHolder4.animation.curAnim.curFrame', 2)
        for i = 1, 3 do
            setProperty('heartHolder'..i..'.animation.curAnim.curFrame', 1)
        end
    elseif getHealth() >= 1.7 and getHealth() <= 2 then
        for i = 1, 4 do
            setProperty('heartHolder'..i..'.animation.curAnim.curFrame', 1)
        end
    end

    setProperty('iconP1.x', 565)
    setProperty('iconP1.y', (downscroll and 72 or 500))

    setTextString('scoreText', 'Puntuación: '..score)
    if allowTime then
        setProperty('expfill._frame.frame.width', (math.lerp(0, 182, getSongPosition() / songLength)))
    end
end

function onUpdateScore()
    if getPropertyFromClass('backend.ClientPrefs', 'data.scoreZoom') then
        scaleObject('scoreText', 1.075, 1.075)
        doTweenX('scale1', 'scoreText.scale', 1, 0.2, 'smoothStepIn')
        doTweenY('scale2', 'scoreText.scale', 1, 0.2, 'smoothStepIn')
    end
end

function math.lerp(a, b, t)
	return a + t * (b - a);
end