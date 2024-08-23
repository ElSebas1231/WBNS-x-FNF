canLoseHealth = true

function onCreate()
    fps = getPropertyFromClass('Main','fpsVar.visible')

    if fps then
        setPropertyFromClass('Main', 'fpsVar.visible', false)
    end

    addHaxeLibrary('FlxFlicker', 'flixel.effects')

    if luaTextExists('credits') then
        setTextFont('name', 'undertale-hud-font.ttf')
        setProperty('name.y', getProperty('name.y') + 15)
        setTextSize('name', 45)

        setTextFont('credits', 'undertale-hud-font.ttf')
        setProperty('credits.x', getProperty('credits.x') + 30)
        setTextBorder('credits', 4, '000000')

        makeGraphic('border', 680, 9.5, '000000')
        setObjectCamera("border", 'other')
        screenCenter('border', 'x')
        addLuaSprite('border', true)
    
        makeGraphic('barBox', 670, 5.5, 'ffffff')
        setObjectCamera("barBox",'other')
        screenCenter('barBox', 'x')
        addLuaSprite('barBox', true)
    end

    makeLuaSprite('upBarr', nil, 0, -430)
    makeGraphic('upBarr',1500,500,'000000')
    screenCenter('upBarr','X')
    setObjectCamera('upBarr', 'hud')
    addLuaSprite('upBarr')

    makeLuaSprite('downBarr', nil, 0, 620)
    makeGraphic('downBarr',1500,500,'000000')
    addLuaSprite('downBarr')
    screenCenter('downBarr','X')
    setObjectCamera('downBarr','hud')
    setObjectOrder('downBarr', getObjectOrder('uiGroup') - 1)
    addLuaSprite('downBarr', true)

    makeLuaText('version', 'Psych Engine v'..version, 0, screenWidth - (getTextWidth('cornerMark') + 320), 5);
    setTextBorder('version', 2, '000000');
    setTextFont('version', 'undertale-hud-font.ttf')
    setTextSize('version', 18);
    addLuaText('version', true)

    makeLuaText("time", songName, 1500, -570, 5)
    setTextBorder('time',3,'000000')
    setTextFont('time', 'undertale-hud-font.ttf')
    setObjectCamera('time','camHUD')
    setTextSize('time', 25)
    addLuaText('time',true)

    makeLuaText("wea", 'Duxo', 1500, -550, 640)
    setTextBorder('wea',3,'000000')
    setObjectCamera('wea','camHUD')
    setTextFont('wea', 'undertale-hud-font.ttf')
    setTextSize('wea', 35)
    addLuaText('wea', true)

    makeLuaText("wea2", 'lv  1', 1500, -400, 650)
    setTextBorder('wea2',3,'000000')
    setTextFont('wea2', 'undertale-hud-font.ttf')
    setTextSize('wea2', 25);
    setObjectCamera('wea2','camHUD')
    addLuaText('wea2',true)

    makeLuaText("wea3", 'hp', 1500, -220, 650)
    setTextBorder('wea3',3,'000000')
    setTextFont('wea3', 'undertale-hud-font.ttf')
    setTextSize('wea3', 15);
    setObjectCamera('wea3','camHUD')
    addLuaText('wea3', true)

    makeLuaText("wea4", '20/20', 1500, -80, 650)
    setTextBorder('wea4',3,'000000')
    setTextFont('wea4', 'undertale-hud-font.ttf')
    setTextSize('wea4', 15);
    setObjectCamera('wea4','camHUD')
    addLuaText('wea4', true)

    makeLuaText("score", nil, 1500, 130, 650)
    setTextBorder('score',3,'000000')
    setTextFont('score', 'undertale-hud-font.ttf')
    setTextSize('score', 20);
    setObjectCamera('score','camHUD')
    addLuaText('score', true)

    makeLuaText("miss", nil, 1500, 370, 650)
    setTextBorder('miss',3,'000000')
    setTextFont('miss', 'undertale-hud-font.ttf')
    setTextSize('miss', 20)
    setObjectCamera('score','camHUD')
    addLuaText('miss', true)
end

function onCreatePost()
    addHealth(2)
    if downscroll then
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'y', 520)
        end
    else
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'y', 70)
        end
    end

    setProperty('healthBar.scale.x', getProperty('healthBar.scale.x') - 0.9)
    setProperty('healthBar.scale.y', getProperty('healthBar.scale.y') + 1.5)
    setHealthBarColors('ff0000', 'ffff00');
    setProperty('healthBar.x',213)
    setProperty('healthBar.y',655)

    setProperty('timeTxt.x',450)
    setProperty('timeTxt.y',10)
    setTextFont('timeTxt', "undertale-hud-font.ttf")
    setTextSize('timeTxt', 25)

    setProperty('showComboNum', false)
    setProperty('showRating', false)
    setProperty('Num.visible', false)
    setProperty('healthGain', 0)

    setProperty('healthBar.bg.visible', false)
    setProperty('timeBar.visible', false)
    setProperty('scoreTxt.visible', false)
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)

    -- icons
    addHaxeLibrary('HealthIcon', 'objects')
    runHaxeCode([[
        var fakeIcon1:HealthIcon = new HealthIcon(game.boyfriend.healthIcon, true);
        fakeIcon1.setPosition(670, -30);
        setVar('fakeIcon1', fakeIcon1);
		game.uiGroup.add(fakeIcon1);

        var fakeIcon2:HealthIcon = new HealthIcon(game.gf.healthIcon, false);
        fakeIcon2.setPosition(450, -45);
        setVar('fakeIcon2', fakeIcon2);
		game.uiGroup.add(fakeIcon2);

        var fakeIcon3:HealthIcon = new HealthIcon(game.dad.healthIcon, false);
        fakeIcon3.setPosition(380, -30);
        setVar('fakeIcon3', fakeIcon3);
		game.uiGroup.add(fakeIcon3);
    ]])
end

function onUpdate()
    setProperty('camZoomingMult', false)

    scaleObject('fakeIcon1', getProperty('iconP1.scale.x') - 0.5, getProperty('iconP1.scale.y') - 0.5)
    setProperty('fakeIcon1.animation.curAnim.curFrame', getProperty('iconP1.animation.curAnim.curFrame'))

    scaleObject('fakeIcon2', getProperty('iconP2.scale.x') - 0.5, getProperty('iconP2.scale.y') - 0.5)
    setProperty('fakeIcon2.animation.curAnim.curFrame', getProperty('iconP1.animation.curAnim.curFrame'))

    scaleObject('fakeIcon3', getProperty('iconP2.scale.x') - 0.5, getProperty('iconP2.scale.y') - 0.5)
    setProperty('fakeIcon3.animation.curAnim.curFrame', getProperty('iconP1.animation.curAnim.curFrame'))
end

function onUpdatePost()
    setTextString('score', 'Score: '..score)
    setTextString('miss', 'Misses: '..misses)

    if getHealth() * 10 <= 1 then
        setTextString('wea4', '0/20')
    else
        setTextString('wea4', round(getHealth() * 10)..'/20')
    end
end

function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    if canLoseHealth then
        canLoseHealth = false
        addHealth(-0.15)
        playSound("dañoundertale", 0.5)
        runHaxeCode([[
            var playerFlicker:FlxFlicker = null;

            playerFlicker = FlxFlicker.flicker(game.boyfriend, 1, 1 / 10, true, true, function(flick:FlxFlicker) {
                playerFlicker = null;
                game.callOnLuas('onFlickerCompleted', ['playerFlicker']);
            });

            setVar('playerFlicker', playerFlicker);
        ]])
    end

    if not canLoseHealth then
        addHealth(0.05)
    end
end

function onFlickerCompleted(t)
    if t == 'playerFlicker' then
        canLoseHealth = true
    end
end

function onDestroy()
    if fps then
        setPropertyFromClass('Main', 'fpsVar.visible', true)
    end
end

function onSongStart()
    for i = 0, 7 do
        setPropertyFromGroup('strumLineNotes', i, 'alpha', 0.75)
    end
end

function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end