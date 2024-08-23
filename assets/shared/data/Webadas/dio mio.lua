function onCreatePost()
    makeLuaSprite('negrobg', nil, -1300, -160)
    makeGraphic('negrobg', 1250 ,750,'000000')
    setProperty('negrobg.alpha', 0)
    scaleObject('negrobg', 3.5, 2.2)
    addLuaSprite('negrobg', false)

    makeLuaSprite('fondito', 'aquinobg/recuerdos/xd4pmpunbco71', -1000, -700)
    setProperty('fondito.alpha', 0.001)
    scaleObject('fondito', 2.5, 2.5)
    addLuaSprite('fondito', false)

    makeLuaSprite('negrooscuro', nil, 0, 0)
    makeGraphic('negrooscuro', 1350, 900, '000000')
    setObjectCamera('negrooscuro', 'other')
    scaleObject('negrooscuro', 1.8, 1.8)
    addLuaSprite('negrooscuro', true)

    setProperty('defaultCamZoom', 1.5)
    setProperty('camGame.zoom', 1.5)
end

function onEvent(n,v1,v2)
    if n == 'Flash Camera' then
        setBlendMode("flash", 'add')
        setObjectCamera("flash",'other')
    end
end

function onSongStart()
    doTweenAlpha("waza", "negrooscuro", 0, 5, "linear")
end

function onStepHit()
    if curStep == 186 then
        setProperty("camGame.alpha", 0)
    end

    if curStep == 192 then
        setProperty("camGame.alpha", 1)
    end

    if curStep == 320 or curStep == 832 then 
        for i = 0, 3 do
            noteTweenX("notedad"..i, i, _G['defaultPlayerStrumX'..i] , 0.5, 'cubein')
            noteTweenAlpha('notep'..i, i+4, 0, 0.5, 'smoothstepout')
        end
    end

    if curStep == 378 or curStep == 890 then 
        for i = 0, 3 do
            noteTweenAlpha('noteop'..i, i, 0, 0.5, 'smoothstepout')
            if not middlescroll then
                noteTweenX("notebf"..i, i+4, _G['defaultOpponentStrumX'..i], 0.5, 'smoothstepout')
            end
        end

        for i = 4, 7 do
            noteTweenAlpha('notebf'..i, i, 1, 0.5, 'smoothstepin')
        end
    end

    if curStep == 448 then 
        setProperty('negrooscuro.alpha', 1)
        doTweenAlpha("waza", "negrooscuro", 0, 10, "linear")

        for i = 0, 3 do
            noteTweenX("notedad"..i, i, _G['defaultOpponentStrumX'..i] , 0.01)
            noteTweenAlpha('notep'..i, i, (middlescroll and 0.35 or 1), 0.01)
        end
        
        for i = 4, 7 do
            noteTweenX("notebf"..i, i, _G['defaultPlayerStrumX'..i-4], 0.01)
            noteTweenAlpha('notep'..i, i, 1, 0.01)
        end
    end

    if curStep == 576 then
        doTweenAlpha("fondo", "fondito", 0.6, 2, "linear")
        doTweenAlpha("bf", "dad", 0.7, 4, "linear")
        doTweenAlpha("dad", "boyfriend", 0.7, 4, "linear")
        doTweenAlpha("waza", "negrooscuro", 0, 1, "linear")
        setProperty('negrooscuro.alpha', 0.75)
        setProperty('boyfriend.alpha', 0)
        setProperty("negrobg.alpha", 1)
        setProperty('dad.alpha', 0)

        for i = 0, 7 do
            noteTweenAlpha("note"..i, i, 0.75, 0.1, 'smoothstepin')
        end
    end

    if curStep == 704 then
        setProperty('boyfriend.alpha', 1)
        setProperty("negrobg.alpha", 0)
        setProperty('dad.alpha', 1)
        setProperty('fondito.alpha', 0)

        for i = 0, 3 do
            noteTweenAlpha("note"..i, i, (middlescroll and 0.35 or 1), 0.1, 'smoothstepin')
        end

        for i = 4, 7 do
            noteTweenAlpha("note"..i, i, 1, 0.1, 'smoothstepin')
        end
    end

    if curStep == 960 then
        setProperty('negrooscuro.alpha', 1)
        doTweenAlpha("waza", "negrooscuro", 0.15, 7, "linear")

        for i = 0, 3 do
            noteTweenX("notedad"..i, i, _G['defaultOpponentStrumX'..i] , 0.01)
            noteTweenAlpha('notep'..i, i, (middlescroll and 0.35 or 1), 0.01)
        end
        
        for i = 4, 7 do
            noteTweenX("notebf"..i, i, _G['defaultPlayerStrumX'..i-4], 0.01)
            noteTweenAlpha('notep'..i, i, 1, 0.01)
        end
    end

    if curStep == 1088 then
        doTweenAlpha("waza", "negrooscuro", 1, 1.5, "linear")
    end
end