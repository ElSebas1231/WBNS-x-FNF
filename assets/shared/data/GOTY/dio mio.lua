function onCreatePost()
    makeLuaSprite('darkness', nil, 0, 0);
    makeGraphic('darkness', 1350 ,900,'646464')
    setObjectCamera('darkness', 'other')
    setBlendMode('darkness','SUBTRACT')
    setProperty('darkness.alpha', 1)
    addLuaSprite('darkness', true);

    makeLuaSprite('negrooscuro', nil, 0, 0)
    makeGraphic('negrooscuro', 1350 ,900,'000000')
    setObjectCamera('negrooscuro', 'Other')
    setProperty('negrooscuro.alpha', 1)
    scaleObject('negrooscuro',1.8,1.8)
    addLuaSprite('negrooscuro', true)

    setProperty("camHUD.alpha", 0)
    setProperty('defaultCamZoom', 1.2)
    setProperty('camGame.zoom', 1.2)
end

function onSongStart()
    doTweenAlpha("a", "negrooscuro", 0, 6,'linear')      
    doTweenAlpha("b", "darkness", 0.3, 6,'linear')   
end

function onStepHit()
    if curStep == 125 or curStep == 421 then
        doTweenAlpha("c", "camHUD", 0.8, 0.7,'linear')      
    end

    if curStep == 1152 then
        doTweenAlpha("d", "camHUD", 0.001, 4,'linear')
    end

    if curStep == 1232 then     
        doTweenAlpha("e", "negrooscuro", 1, 7,'linear')      
        doTweenAlpha("f", "darkness", 1, 7,'linear')   
    end
end