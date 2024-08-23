function onCreatePost()
    makeLuaSprite('negrooscuro', nil, -800, 0)
    makeGraphic('negrooscuro', 1350 ,900,'000000')
    setObjectCamera('negrooscuro', 'camGame')
    scaleObject('negrooscuro',2.5,2.5)
    addLuaSprite('negrooscuro', true)

    setProperty('defaultCamZoom', 1.2)
    setProperty('camGame.zoom', 1.2)
end

function onUpdate()
    setProperty('camZoomingMult', 0)
end

function onSongStart()
    setProperty('negrooscuro.alpha', 1)
    doTweenAlpha("waza", "negrooscuro", 0, 15, "linear")
end

function onStepHit()
    if curStep == 1020 then
        setProperty('camGame.alpha', 0)
    elseif curStep == 1064 then
        setProperty('camGame.alpha', 1)
    elseif curStep == 2008 then
        setProperty('camGame.alpha', 0)
    elseif curStep == 2016 then
        doTweenAlpha("aa", "camHUD", 0, 2, "linear")
    end
end