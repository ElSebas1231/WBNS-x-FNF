heartScale = 4;
heartPrefix = '-normal'
function onCreate()
    setProperty('healthBar.visible', false)
    setProperty('timeBar.visible', false)
    setProperty('timeBarBG.visible', false)
    setProperty('timeTxt.visible', false)
    setProperty('scoreTxt.visible', false)

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
        addLuaSprite('heartHolder'..i, true);
    end
    
    makeLuaSprite('box1', 'Squares', 180, (downscroll and -8 or 560))
    scaleObject('box1', 7, 7)
    setProperty('box1.antialiasing', false)
    setObjectCamera('box1', 'hud')
    addLuaSprite('box1')

    makeLuaSprite('box2', 'Squares', 905, (downscroll and -8 or 560))
    scaleObject('box2', 7, 7)
    setProperty('box2.antialiasing', false)
    setObjectCamera('box2', 'hud')
    addLuaSprite('box2')

    makeLuaSprite('wawa', nil, 0, 0)
    setProperty('wawa.x', 105140)
    addLuaSprite('wawa')

    makeLuaSprite('expempty', 'expbar/empty', 0, (downscroll and 48 or 618))
    scaleObject('expempty', 3, 3)
    setObjectCamera('expempty', 'hud')
    setProperty('expempty.antialiasing', false)
    addLuaSprite('expempty', true)
    screenCenter('expempty', 'x')
  
    makeLuaSprite('expfill', 'expbar/full', 0, (downscroll and 48 or 618))
    scaleObject('expfill', 3, 3)
    setObjectCamera('expfill', 'hud')
    setProperty('expfill.antialiasing', false)
    screenCenter('expfill', 'x')
    setProperty('expfill._frame.frame.width', 0.002)
    addLuaSprite('expfill', true)

    makeLuaText('exptext', (timeBarType == 'Song Name' and string.gsub(songName, "-", " ") or '0'), 400, 0, (downscroll and 10 or 585))
    setTextAlignment('exptext', 'center')
    setTextFont('exptext', 'Minecraftia.ttf')
    setTextSize('exptext', 20)
    setProperty('exptext.antialiasing', false)
    screenCenter('exptext', 'x')
    setTextColor('exptext', 'b5fc7c')
    setObjectCamera('exptext', 'hud')

    makeLuaText('scoreText', nil, 400, 0, (downscroll and 105 or 675))
    setTextAlignment('scoreText', 'center')
    setTextFont('scoreText', 'Minecraftia.ttf')
    setTextSize('scoreText', 20)
    setProperty('scoreText.antialiasing', false)
    screenCenter('scoreText', 'x')
    setProperty('scoreText.x', getProperty('scoreText.x') - 20)
    setTextColor('scoreText', 'b5fc7c')
    setObjectCamera('scoreText', 'hud')
    
    if timeBarType ~= 'Song Name' then
        setProperty('exptext.alpha', 0)
    end
    addLuaText('exptext', true)
    addLuaText('scoreText', true)

    addHaxeLibrary('FlxStringUtil', 'flixel.util')
end

local allowTime = false

function onSongStart()
    allowTime = true
    songLength = 105140
end

function onStepHit()
    if curStep == 1450 then
        runTimer('cambia', 0.001)
    end
end
function onEvent()

end
function onTimerCompleted(n, loops, loopsLeft)
    if n == 'cambia' then                
        doTweenX('oasdoas','wawa',196610,2.41,'linear')
        local tag_valParam = {songLength = 196610}
        local tag_optnParam = {ease = 'linear', onComplete = 'onTweenCompleted'}
        startTween('mierda', 'game', tag_valParam, 2.41, tag_optnParam)
        runTimer('que',3)
    end
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
    secola2 = math.floor((getProperty('wawa.x')-getSongPosition()) / 1000)
    if secola2 < 0 then
        secola2 = 0
    end


    if timeBarType ~= 'Song Name' then
        setTextString('exptext', string.format("%.2d:%.2d", secola2/60%60, secola2%60))
	end

    setTextString('scoreText', 'Puntuación: '..score)

    for i = 1, 5 do
        setProperty('heartHolder'..i..'.alpha', getProperty('healthBar.rightBar.alpha'))
    end

    setProperty('box1.alpha', getProperty('iconP1.alpha'))
    setProperty('box2.alpha', getProperty('iconP2.alpha'))
    setProperty('expempty.alpha', getProperty('scoreTxt.alpha'))
    setProperty('expfill.alpha', getProperty('scoreTxt.alpha'))
    setProperty('exptext.alpha', getProperty('scoreTxt.alpha'))
    setProperty('scoreText.alpha', getProperty('iconP2.alpha'))
    ola = getProperty('wawa.x')
end

--[[
    Frame 0 = vacio
    Frame 1 = completo
    Frame 2 = medio completo
]]

function onUpdatePost()
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

    setProperty('iconP1.x', 925);
    setProperty('iconP2.x', 205);
    

    if allowTime then
        setProperty('expfill._frame.frame.width', (math.lerp(0, 182, getSongPosition() / ola)))
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