function onCreatePost()
    makeLuaSprite('negrooscuro', nil, 0, 0)
    makeGraphic('negrooscuro', 1350, 900, '000000')
    setObjectCamera('negrooscuro', 'Other')
    setProperty('negrooscuro.alpha', 1)
    scaleObject('negrooscuro', 1.8, 1.8)
    addLuaSprite('negrooscuro', true)

    setProperty('defaultCamZoom', 0.5)
    setProperty('camGame.zoom', 1.5)
    setProperty('camHUD.visible', false)
end

function onEvent(n,v1,v2)
    if n == 'Flash Camera' then
        setBlendMode("flash", 'add')
        setObjectCamera("flash",'other')
    end
end

function onStepHit()
    if curStep == 1 then
        doTweenAlpha("waza", "negrooscuro", 0, 1.5, "linear")
        doTweenZoom('camZoom','camGame', 0.5, 1.5, 'QuadOut')
    end
    if curStep == 16 then
        setProperty('camHUD.visible', true)
    end
    if curStep == 911 then -- Referencia noway!
        setProperty('camHUD.visible', false)
        setProperty('camGame.visible', false)
    end
end