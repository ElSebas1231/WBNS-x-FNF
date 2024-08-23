function onCreatePost()
    makeLuaSprite('negrooscuro', nil, 0, 0)
    makeGraphic('negrooscuro', 1350 ,900,'000000')
    setObjectCamera('negrooscuro', 'Other')
    scaleObject('negrooscuro',1.8,1.8)
    addLuaSprite('negrooscuro', true)

    setProperty('defaultCamZoom', 1.5)
    setProperty('camGame.zoom', 1.5)
    setProperty('gf.visible', false)
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
        doTweenAlpha("waza", "negrooscuro", 0, 1.2, "linear")
    end
    if curStep == 16 then
        setProperty('camHUD.visible', true)
    end
    
    if curStep == 2112 then
        setProperty('camHUD.visible', false)
        setProperty('camGame.visible', false)
    end
end