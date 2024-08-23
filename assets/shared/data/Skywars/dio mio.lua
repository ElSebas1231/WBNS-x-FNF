function onCreatePost()
    makeLuaSprite('negrobg', nil, -1300, -160)
    makeGraphic('negrobg', 1250 ,750, '000000')
    setProperty('negrobg.alpha', 0)
    scaleObject('negrobg', 3.5, 2.2)
    addLuaSprite('negrobg', false)

    makeLuaSprite('negrooscuro', nil, 0, 0)
    makeGraphic('negrooscuro', 1350 ,900,'000000')
    setObjectCamera('negrooscuro', 'Other')
    scaleObject('negrooscuro', 1.8, 1.8)
    addLuaSprite('negrooscuro')

    setProperty('defaultCamZoom', 1.5)
    setProperty('camGame.zoom', 1.5)
    setProperty('camHUD.zoom', 3.5)
end

function onEvent(n,v1,v2)
    if n == 'Flash Camera' then
        setBlendMode("flash", 'add')
        setProperty('flash.alpha',0.85)
        setObjectCamera("flash",'other')
    end
end

function onStepHit()
    if curStep == 2 then
        doTweenAlpha("waza", "negrooscuro", 0, 5, "linear")
    end

    if curStep == 896 then
        setProperty('negrooscuro.alpha', 1)
        setProperty('boyfriend.alpha', 0)
        setProperty('negrobg.alpha', 1)
        setProperty('dad.alpha', 0)
        
        doTweenAlpha("waza", "negrooscuro", 0, 1, "linear")
        doTweenAlpha("a", "dad", 0.7, 4, "linear")

        for i = 0, 7 do
            noteTweenAlpha("notedad"..i, i, 0.2, 0.1)
        end
    end

    if curStep == 904 then
        for i = 0, 3 do
            noteTweenAlpha("notedad"..i, i, 1, 2)
        end
    end

    if curStep == 954 then
        for i = 4, 7 do
            noteTweenAlpha("notebf"..i, i, 1, 2)
        end
    end

    if curStep == 960 then
        doTweenAlpha("a", "boyfriend", 0.7, 4, "linear")
    end

    if curStep == 1280 then
        setProperty('negrooscuro.alpha', 1)
        setProperty('boyfriend.alpha', 1)
        setProperty('negrobg.alpha', 0)
        setProperty('dad.alpha', 1)
        doTweenAlpha("waza", "negrooscuro", 0, 1, "linear")
    end

    if curStep == 1776 then
        doTweenAlpha("Fin", "camHUD", 0, 3, "linear")
    end

    if curStep == 1920 then
        setProperty("camGame.alpha", 0)
    end
end