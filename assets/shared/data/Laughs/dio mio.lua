local introCosas = {'name', 'credits', 'border', 'barBox'}

function onCreate()
    addCharacterToList("Aquino_perro", "dad")
    addCharacterToList("Aquino_perro_defrente", "dad")

    makeLuaSprite('negrooscuro', nil, 0, 0)
    makeGraphic('negrooscuro', 1350 ,900,'000000')
    setObjectCamera('negrooscuro', 'Other')
    setProperty('negrooscuro.alpha', 1)
    scaleObject('negrooscuro',1.8,1.8)
    addLuaSprite('negrooscuro', true)

    setProperty('defaultCamZoom', 0.65)
    setProperty('camGame.zoom', 0.65)
    setProperty("camHUD.alpha", 0)
    setProperty('timeTxt.y', getProperty('timeTxt.y') + 10)
end

function onSongStart()
    for i = 1, #introCosas do
        cancelTween(introCosas[i])
        setProperty(introCosas[i]..'.alpha', 0)
    end
end

function onEvent(n,v1,v2)
    if n == 'Flash Camera' then
        setBlendMode("flash", 'add')
        setProperty('flash.alpha',0.7)
        setObjectCamera("flash",'other')
    end

    if n == "Lyrics" then
        setTextBorder('captions',6.5,'000000')
        setTextSize('captions', 150)
        setProperty("captions.y", 250)
        setTextFont('captions', 'Cracker Winter.otf')
    end
end

function onStepHit()
    if curStep == 12 or curStep == 423 then
        setProperty('negrooscuro.alpha', 0)
    end

    if curStep == 16 then
        for i = 1, #introCosas do
            doTweenAlpha('credits'..i, introCosas[i], 1, 0.5)
        end
    end

    if curStep == 16 or curStep == 160 then
        setProperty("camHUD.alpha", 1)
    end

    if curStep == 144 then
        doTweenAlpha("awa", "camHUD", 0.1, 0.7, "linear")
    end

    if curStep == 416 then
        setProperty('negrooscuro.alpha', 1)
    end

    if curStep == 824 then
        doTweenAlpha("awa", "camHUD", 0, 2.5, "linear")
    end
end