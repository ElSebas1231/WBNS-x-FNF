invBar = false

local introCosas = {'name', 'credits', 'border', 'barBox'}
local healthBarThings = {'iconP1', 'iconP2', 'healthBar.bg', 'healthBar.leftBar', 'healthBar.rightBar'}

function onCreatePost()
    healthBarAlpha = getPropertyFromClass('backend.ClientPrefs', 'data.healthBarAlpha')
    
    makeAnimatedLuaSprite('aquinin', 'fnafBG/aquinin chiquito', 1120, 580)
    addAnimationByPrefix('aquinin', 'bailesito', 'aquino chikito0', 24, true)
    setObjectCamera('aquinin', 'hud')
    addLuaSprite('aquinin')

    makeLuaText('AquinoSubs', 'Subs: 1,036/2002', 600, 845, 665)
    setTextBorder('AquinoSubs', 0.5,'000000')
    setProperty('AquinoSubs.antialiasing', getPropertyFromClass('backend.ClientPrefs', 'data.antialiasing'))
    setTextFont('AquinoSubs', 'PT_Sans-Narrow-Web-Bold.ttf')
    setTextSize('AquinoSubs', 40);
    setObjectOrder('AquinoSubs', getObjectOrder('aquinin'))
    addLuaText('AquinoSubs')

    makeLuaSprite('negrooscuro', nil, 0, 0)
    makeGraphic('negrooscuro', 1350 ,900,'000000')
    setObjectCamera('negrooscuro', 'camHUD')
    setProperty('negrooscuro.alpha', 0.9)
    scaleObject('negrooscuro',1.8,1.8)
    addLuaSprite('negrooscuro', false)

    makeLuaSprite('blackui', 'vignette', 0, 0)
    setObjectCamera('blackui', 'camHUD')
    setProperty('blackui.alpha', 0.8)
    scaleObject('blackui',1.15, 1.15)
    addLuaSprite('blackui', false)

    makeLuaSprite('darkness', nil, 0, 0);
    makeGraphic('darkness', 1350 ,900,'646464')
    setObjectCamera('darkness', 'camHUD')
    setBlendMode('darkness','SUBTRACT')
    setProperty('darkness.alpha', 0.25)
    addLuaSprite('darkness', false);

    makeAnimatedLuaSprite('static', 'static', 0, 0);
    setObjectCamera('static', 'Other')
    addAnimationByPrefix('static','idle','idle0',24,true);
    setProperty('static.alpha',0)
    scaleObject('static', 1, 1);
    addLuaSprite('static', false);

    setProperty('dad.alpha', 0)
    setProperty('defaultCamZoom', 0.7)
    setProperty('camGame.zoom', 1.15)
    setProperty('cameraSpeed', 0.25)
    invBar = true

    for i = 1, #healthBarThings do
        setProperty(healthBarThings[i]..'.alpha', 0)
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if direction == 0 then
        triggerEvent("Play Animation", 'singLEFT', 'GF')
    elseif direction == 1 then
        triggerEvent("Play Animation", 'singDOWN', 'GF')
    elseif direction == 2 then
        triggerEvent("Play Animation", 'singUP', 'GF')
    elseif direction == 3 then
        triggerEvent("Play Animation", 'singRIGHT', 'GF')
    end
end

function onSongStart()
    for i = 1, #introCosas do
        cancelTween(introCosas[i])
        setProperty(introCosas[i]..'.alpha', 0)
    end

    doTweenAlpha("a", "negrooscuro", 0, 8,'linear')      
    doTweenAlpha("b", "darkness", 0.15,  8,'linear')   
    doTweenZoom('camZoom','camGame', 0.65, 10, 'linear')   
    noteTweenAlpha("waza", 4, 0.75, 0.5, "linear")
    noteTweenAlpha("waza1", 5, 0.75, 0.5, "linear")
    noteTweenAlpha("waza2", 6, 0.75, 0.5, "linear")
    noteTweenAlpha("waza3", 7, 0.75, 0.5, "linear")  
end

invBar = false

function onUpdatePost()
    if invBar then
        x1 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) + (150 * getProperty('iconP2.scale.x') - 150) / 2 - 26
        x2 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) - (150 * getProperty('iconP1.scale.x')) / 2 - 26 * 2

        setProperty('iconP1.x', x2)
        setProperty('iconP2.x', x1)

        setProperty('healthBar.flipX', true)
        setProperty('iconP1.flipX', true)
        setProperty('iconP2.flipX', true)
    else
        setProperty('healthBar.flipX', false)
        setProperty('iconP1.flipX', false)
        setProperty('iconP2.flipX', false)
    end
end

function onStepHit()
    if curStep == 122 or curStep == 1533 then
        doTweenAlpha("freddy", "dad", 1, 0.5,'linear')

        for i = 1, #healthBarThings do
            doTweenAlpha('cosas'..i, healthBarThings[i], 1, 0.5, 'cubein')
        end   
    end

    if curStep == 128 then
        for i = 1, #introCosas do
            doTweenAlpha('credits'..i, introCosas[i], 1, 1)
        end
        runTimer('end', 4)
    end

    if curStep == 895 then
        setProperty('gf.x', -250)
        doTweenX('mictia','gf', 35, 0.8, 'sineIn');
    end

    if curStep == 1407 then
        setProperty('camGame.alpha', 0)
        setProperty('camHUD.alpha', 0)
    end

    if curStep == 1423 then
        doTweenAlpha("fondo", "camGame", 1, 7,'linear')      
    end
    
    if curStep == 1533 then
        setProperty('gf.x', -250)
        doTweenAlpha("hud", "camHUD", 1, 0.5,'linear')  
    end

    if curStep == 1660 then
        doTweenX('michu','gf', 5, 0.8, 'sineIn');
    end

    if curStep >= 128 then
        setProperty('cameraSpeed', 1.5)
    end
end

function onEvent(n,v1,v2)
    if n == 'Flash Camera' then
        setBlendMode("flash", 'add')
        setObjectCamera("flash",'other')
        setObjectOrder('flash', 99);
    end

    if n == 'sanfordxd' then
        if v1 == 'aquino' then
            triggerEvent("Change Character", 'Dad', 'Freddy-FNAF')
            triggerEvent("Change Character", 'BF', 'aquino-FNAF-ALT')
            setProperty("boyfriend.visible", true)
            setProperty("gf.visible", false)

            setProperty('dad.alpha', 1)
            setProperty("aquinin.visible", true)
            setProperty("AquinoSubs.visible", true)
            invBar = true
        end

        if v1 == 'lucasta' then
            triggerEvent("Change Character", 'Dad', 'Bonnie-FNAF')
            triggerEvent("Change Character", 'BF', 'Lucasta-FNAF-ALT')
            setProperty("boyfriend.visible", true)
            setProperty("gf.visible", false)

            setProperty('dad.alpha', 1)
            setProperty("aquinin.visible", false)
            setProperty("AquinoSubs.visible", false)
            invBar = false
        end

        if v1 == 'mictia' then
            triggerEvent("Change Character", 'Dad', 'Chica-FNAF')
            triggerEvent("Change Character", 'BF', 'Mictia-FNAF-ALT')
            triggerEvent("Change Character", 'GF', 'Mictia Irl-FNAF ALT')
            setProperty("boyfriend.visible", true)
            setProperty("gf.visible", true)

            setProperty('dad.alpha', 1)
            setProperty("aquinin.visible", false)
            setProperty("AquinoSubs.visible", false)
            invBar = true
        end

        if v1 == 'michu' then
            triggerEvent("Change Character", 'Dad', 'FoxyFnaf')
            triggerEvent("Change Character", 'BF', 'mishifu-FNAF')
            triggerEvent("Change Character", 'GF', 'mishifu-FNAF')
            setProperty("boyfriend.visible", false)
            setProperty("gf.visible", true)

            setProperty('dad.alpha', 0)
            setProperty("aquinin.visible", false)
            setProperty("AquinoSubs.visible", false)
            invBar = false
        end

        if v1 == 'soaring' then
            triggerEvent("Change Character", 'Dad', 'GoldenFreddy-FNAF')
            triggerEvent("Change Character", 'BF', 'Soarinng Roblox-FNAF')
            triggerEvent("Change Character", 'GF', 'Soarinng Irl-FNAF ALT')
            setProperty("boyfriend.visible", true)
            setProperty("gf.visible", true)

            setProperty('dad.alpha', 1)
            setProperty("aquinin.visible", false)
            setProperty("AquinoSubs.visible", false)
            invBar = true
        end

        if v1 == 'end' then
            setProperty('camGame.alpha', 0)
            setProperty('camHUD.alpha', 0)
            setProperty('static.alpha',1)
            doTweenAlpha("end", "static", 0, 1.5,'linear') 

            setProperty('dad.alpha', 1)
            setProperty("aquinin.visible", true)
            setProperty("AquinoSubs.visible", true)
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    for i = 1, #introtxt do
        if tag == 'end' then
            doTweenAlpha(introtxt[i], introtxt[i], 0, 0.7, 'quadOut')
        end
    end
end