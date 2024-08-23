heartScale = 4;
heartPrefix = '-normal'
mode = ''
squaresY = 0
squaresX = 0

function onCreatePost()
    setProperty('healthBar.visible', false)
    setProperty('timeBar.visible', false)
    setProperty('timeBarBG.visible', false)
    setProperty('timeTxt.visible', false)
    setProperty('scoreTxt.visible', false)

    squaresY = (downscroll and -8 or 560)

    if downscroll then
        heartsOffsets = 735
    else
        heartsOffsets = 285
    end

    for i = 1, 5 do
        makeLuaSprite('heartHolder'..i, 'hearts'..heartPrefix, screenWidth/2 - 235 + 9*heartScale*i, (downscroll and 70 or 640))
        scaleObject('heartHolder'..i, heartScale, heartScale)
        loadGraphic('heartHolder'..i, 'hearts'..heartPrefix, 9, 0);
        addAnimation('heartHolder'..i, 'heart', {0, 1, 2}, 24, false);
        setProperty('heartHolder'..i..'.antialiasing', false);
        setObjectCamera('heartHolder'..i, 'hud');
        addLuaSprite('heartHolder'..i, true)
    end
    
    makeLuaSprite('box1', 'Squares', 905, squaresY)
    scaleObject('box1', 7, 7)
    setProperty('box1.antialiasing', false)
    setObjectCamera('box1', 'hud')
    addLuaSprite('box1')

    makeLuaSprite('box2', 'Squares', 180, squaresY)
    scaleObject('box2', 7, 7)
    setProperty('box2.antialiasing', false)
    setObjectCamera('box2', 'hud')
    addLuaSprite('box2')

    makeLuaSprite('expempty', 'expbar/empty', 0, (downscroll and 48 or 618))
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

    makeLuaText('exptext', (timeBarType == 'Song Name' and string.gsub(songName, "-", " ") or '0'), 400, 0, (downscroll and 15 or 585))
    setTextAlignment('exptext', 'center')
    setTextFont('exptext', 'Minecraftia.ttf')
    setTextSize('exptext', 20)
    setProperty('exptext.antialiasing', false)
    screenCenter('exptext', 'x')
    setTextColor('exptext', 'b5fc7c')
    setObjectCamera('exptext', 'hud')

    makeLuaText('scoreText', nil, 400, 0, (downscroll and 225 or 675))
    setTextAlignment('scoreText', 'center')
    setTextFont('scoreText', 'Minecraftia.ttf')
    setTextSize('scoreText', 20)
    setProperty('scoreText.antialiasing', false)
    screenCenter('scoreText', 'x')
    setTextColor('scoreText', 'b5fc7c')
    setObjectCamera('scoreText', 'hud')

    if timeBarType ~= 'Song Name' then
        setProperty('exptext.alpha', 0)
    end

    addLuaText('exptext', true)
    addLuaText('scoreText', true)

    hudChange('dual inv')
end

-- HUD Changer on event

function hudChange(m)
    if m == 'single' then
        mode = 'single'

        setProperty('box1.x', 545.5)
        setProperty('box1.y', (downscroll and 60 or 450))
        
        setProperty('heartHolder1.x', 430)
        setProperty('heartHolder2.x', getProperty('heartHolder1.x') + 60)
        setProperty('heartHolder3.x', getProperty('heartHolder2.x') + 250)
        setProperty('heartHolder4.x', getProperty('heartHolder3.x') + 60)
        setProperty('heartHolder5.visible', false)
        setProperty('iconP1.flipX', false)

        for i = 1, 4 do
            scaleObject('heartHolder'..i, 6, 6)
            setProperty('heartHolder'..i..'.y', (downscroll and 70 or 555))
        end

        setProperty('iconP2.visible', false)
        setProperty('box2.visible', false)
        setProperty('exptext.y', (downscroll and 8 or 635))
        setProperty('scoreText.y', (downscroll and 225 or 420))
        
        for i = 0, 3 do
            setPropertyFromGroup('opponentStrums', i, 'alpha', 0.001)
        end

        if not middlescroll then
            setPropertyFromGroup('playerStrums', '0', 'x', 412)
            setPropertyFromGroup('playerStrums', '1', 'x', 524)
            setPropertyFromGroup('playerStrums', '2', 'x', 636)
            setPropertyFromGroup('playerStrums', '3', 'x', 748)
        end
    end

    if m == 'dual' then
        mode = 'dual'
        setProperty('box1.x', 905)
        setProperty('box1.y', squaresY)
        setProperty('exptext.y', (downscroll and 15 or 585))
        setProperty('scoreText.y', (downscroll and 105 or 675))
        
        setProperty('iconP2.visible', true)
        setProperty('iconP2.flipX', false)
        setProperty('box2.visible', true)

        for i = 1, 5 do
            scaleObject('heartHolder'..i, 4, 4)
            setProperty('heartHolder'..i..'.y', (downscroll and 70 or 640))
        end

        setProperty('heartHolder1.x', 550)
        setProperty('heartHolder2.x', getProperty('heartHolder1.x') + 35)
        setProperty('heartHolder3.x', getProperty('heartHolder2.x') + 35)
        setProperty('heartHolder4.x', getProperty('heartHolder3.x') + 35)
        setProperty('heartHolder5.x', getProperty('heartHolder4.x') + 35)
        setProperty('heartHolder5.visible', true)

        if not middlescroll then
            for i = 0, 3 do
                setPropertyFromGroup('playerStrums', i, 'x', _G['defaultPlayerStrumX'..i])
                setPropertyFromGroup('opponentStrums', i, 'x', _G['defaultOpponentStrumX'..i])
                setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
            end
        end
    end

    if m == 'dual inv' then
        mode = 'dual inv'

        setProperty('box1.x', 905)
        setProperty('box1.y', squaresY)
        setProperty('heartHolder1.x', 445)
        setProperty('heartHolder2.x', getProperty('heartHolder1.x') + 35)
        setProperty('heartHolder3.x', getProperty('heartHolder2.x') + 35)
        setProperty('heartHolder4.x', getProperty('heartHolder3.x') + 35)
        setProperty('heartHolder5.x', getProperty('heartHolder4.x') + 35)
        setProperty('heartHolder5.visible', true)

        setProperty('iconP2.visible', true)
        setProperty('box2.visible', true)
        setProperty('iconP1.flipX', not getProperty('iconP1.flipX'))
        setProperty('iconP2.flipX', not getProperty('iconP2.flipX'))
        setProperty('scoreText.y', (downscroll and 105 or 675))
        
        if not middlescroll then
            for i = 0, 3 do
                setPropertyFromGroup('playerStrums', i, 'x', _G['defaultOpponentStrumX'..i])
                setPropertyFromGroup('opponentStrums', i, 'x', _G['defaultPlayerStrumX'..i])
            end
        end
    end
end

function onEvent(n, v1, v2)
    if n == 'FTE Events' then
        if v1 == 'HUD Change' then
            hudChange(tostring(v2))
        end
    end
end

local allowTime = false

function onSongStart()
    allowTime = true
end

function onUpdate()
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

    for i = 1, 5 do
        setProperty('heartHolder'..i..'.alpha', getProperty('healthBar.rightBar.alpha'))
    end

    setProperty('box1.alpha', getProperty('iconP1.alpha'))
    setProperty('box2.alpha', getProperty('iconP2.alpha'))
    setProperty('expempty.alpha', getProperty('timeBar.rightBar.alpha'))
    setProperty('expfill.alpha', getProperty('timeBar.leftBar.alpha'))
    setProperty('exptext.alpha', getProperty('timeTxt.alpha'))
    setProperty('scoreText.alpha', getProperty('scoreTxt.alpha'))
end

--[[
    Frame 0 = vacio
    Frame 1 = completo
    Frame 2 = medio completo
]]

-- Hearths anims handler

function onUpdatePost()
    if mode == 'single' then
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
    end

    if mode == 'dual' or mode == 'dual inv' then
        if getHealth() < 0.2 then
            for i = 1, 5 do
                setProperty('heartHolder'..i..'.animation.curAnim.curFrame', 0)
            end
        elseif getHealth() >= 0.2 and getHealth() <= 0.4 then
            setProperty('heartHolder1.animation.curAnim.curFrame', 2)
            for i = 2, 5 do
                setProperty('heartHolder'..i..'.animation.curAnim.curFrame', 0)
            end
        elseif getHealth() > 0.4 and getHealth() <= 0.6 then
            setProperty('heartHolder1.animation.curAnim.curFrame', 1)
            for i = 2, 5 do
                setProperty('heartHolder'..i..'.animation.curAnim.curFrame', 0)
            end
        elseif getHealth() > 0.6 and getHealth() <= 0.8 then
            setProperty('heartHolder1.animation.curAnim.curFrame', 1)
            setProperty('heartHolder2.animation.curAnim.curFrame', 2)
            for i = 3, 5 do
                setProperty('heartHolder'..i..'.animation.curAnim.curFrame', 0)
            end
        elseif getHealth() > 0.8 and getHealth() <= 1 then
            for i = 1, 2 do
                setProperty('heartHolder'..i..'.animation.curAnim.curFrame', 1)
            end
            for i = 3, 5 do
                setProperty('heartHolder'..i..'.animation.curAnim.curFrame', 0)
            end
        elseif getHealth() > 1 and getHealth() <= 1.2 then
            setProperty('heartHolder3.animation.curAnim.curFrame', 2)
            for i = 1, 2 do
                setProperty('heartHolder'..i..'.animation.curAnim.curFrame', 1)
            end
            for i = 4, 5 do
                setProperty('heartHolder'..i..'.animation.curAnim.curFrame', 0)
            end
        elseif getHealth() > 1.2 and getHealth() <= 1.4 then
            for i = 1, 3 do
                setProperty('heartHolder'..i..'.animation.curAnim.curFrame', 1)
            end
            for i = 4, 5 do
                setProperty('heartHolder'..i..'.animation.curAnim.curFrame', 0)
            end
        elseif getHealth() > 1.4 and getHealth() <= 1.6 then
            setProperty('heartHolder4.animation.curAnim.curFrame', 2)
            setProperty('heartHolder5.animation.curAnim.curFrame', 0)
            for i = 1, 3 do
                setProperty('heartHolder'..i..'.animation.curAnim.curFrame', 1)
            end
        elseif getHealth() > 1.6 and getHealth() <= 1.8 then
            setProperty('heartHolder5.animation.curAnim.curFrame', 0)
            for i = 1, 4 do
                setProperty('heartHolder'..i..'.animation.curAnim.curFrame', 1)
            end
        elseif getHealth() > 1.8 and getHealth() <= 1.9 then
            setProperty('heartHolder5.animation.curAnim.curFrame', 2)
            for i = 1, 4 do
                setProperty('heartHolder'..i..'.animation.curAnim.curFrame', 1)
            end
        elseif getHealth() >= 1.9 and getHealth() <= 2 then -- Se pone raro si no está en 1.9 xd -ElSebas1231
            for i = 1, 5 do
                setProperty('heartHolder'..i..'.animation.curAnim.curFrame', 1)
            end
        end
    end
    
    if mode == 'dual inv' then
        setProperty('iconP1.x', 205)
        setProperty('iconP2.x', 925)
        setProperty('iconP1.y', getProperty('iconP2.y'))
    end

    if mode == 'dual' then
        setProperty('iconP1.x', 925)
        setProperty('iconP2.x', 205)
        setProperty('iconP1.y', getProperty('iconP2.y'))
    end
    
    if mode == 'single' or mode == 'single mid' then
        setProperty('iconP1.x', 565)
        setProperty('iconP1.y', (downscroll and 72 or 450))
    end

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