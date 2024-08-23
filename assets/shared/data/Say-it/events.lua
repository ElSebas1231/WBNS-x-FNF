local cosas = {"scoreTxt", "timeBar.bg", "timeBar.leftBar", "timeBar.rightBar", "timeTxt", "healthBar.bg", "healthBar.leftBar", "healthBar.rightBar",
"iconP1", "iconP2"}

function onCreate()
    makeLuaSprite('black', nil, 0, 0)
    makeGraphic('black', 1280, 720, '000000')
    setObjectCamera('black', 'other')
    screenCenter('black')
    addLuaSprite('black')

    makeLuaSprite('blackOverlay', nil, 0, 0)
    makeGraphic('blackOverlay', 1280, 720, '000000')
    setObjectCamera('blackOverlay', 'other')
    setProperty('blackOverlay.alpha', 0.001)
    screenCenter('blackOverlay')
    addLuaSprite('blackOverlay',true)

    makeLuaSprite('upBarr', nil, 0, -430)
    makeGraphic('upBarr',1500, 500, '000000')
    screenCenter('upBarr', 'X')
    setObjectCamera('upBarr','hud')
    addLuaSprite('upBarr')

    makeLuaSprite('downBarr', nil, 0, 620)
    makeGraphic('downBarr', 1500, 500, '000000')
    addLuaSprite('downBarr')
    screenCenter('downBarr', 'X')
    setObjectCamera('downBarr','hud')
    addLuaSprite('downBarr')

    setProperty('camGame.zoom', 1.2)
    addHaxeLibrary('FlxFlicker', 'flixel.effects')
end

function onEvent(n, v1, v2)
    if n == 'Say It Events' then
        if v1 == 'intro' then
            for i = 1, #cosas do
                setProperty(cosas[i]..'.alpha', 0)
            end
        
            for i = 0, 3 do
                setPropertyFromGroup('opponentStrums', i, 'alpha', 0.001)
                setPropertyFromGroup('playerStrums', i, 'alpha', 0.001)
            end

            if v2 == 'bf' then
                setProperty('camFollow.x', 653)
                setProperty('camFollow.y', 500)
                setProperty('cameraSpeed', 22)
                setProperty('isCameraOnForcedPos', true)

                doTweenX('cambf', 'camFollow', 1053, 4, 'smoothstepin')
                doTweenAlpha('blackA', 'black', 0.75, 2, 'cubein')
            end

            if v2 == 'dad' then
                setProperty('camFollow.x', 153)
                setProperty('camFollow.y', 530)
                setProperty('cameraSpeed', 22)
                setProperty('isCameraOnForcedPos', true)

                doTweenX('camdad', 'camFollow', -153, 4, 'smoothstepin')
                doTweenAlpha('blackA', 'black', 0.75, 2, 'cubein')
            end

            if v2 == 'both' then
                setProperty('cameraSpeed', 99)
                setProperty('camGame.zoom', 0.85)
                setProperty('camFollow.x', 350)
                setProperty('camFollow.y', 560)
                setProperty('isCameraOnForcedPos', true)
                doTweenAlpha('blackA', 'black', 0.75, 3.5, 'cubein')
            end
        end

        if v1 == 'flash' then
            setProperty('black.visible', false)
            setProperty('camGame.zoom', 0.6)
            cameraFlash('other', 'ffffff', 1)
            setProperty('cameraSpeed', 1)
            setProperty('isCameraOnForcedPos', false)
        end

        if v1 == 'overlay' then
            local opts = stringSplit(v2, ",")
            cancelTween('bgAl')
            doTweenAlpha('bgAl', 'blackOverlay', opts[1], opts[2], opts[3])
        end

        if v1 == 'hud' then
            local opts = stringSplit(v2, ",")
            for i = 1, #cosas do
                doTweenAlpha('things'..cosas[i], cosas[i], opts[1], opts[2])
            end

            for i = 0, 7 do
                noteTweenAlpha('notes'..i, i, opts[1], opts[2])
            end
        end

        if v1 == 'camT' then
            if v2 ~= 'mid' then
                cameraSetTarget(v2)
                setProperty('isCameraOnForcedPos', false)
            else
                setProperty('camFollow.x', 350)
                setProperty('camFollow.y', 560)
                setProperty('isCameraOnForcedPos', true)
            end
        end

        if v1 == 'flicker' then
            runHaxeCode([[
                var flicker:FlxFlicker = null;
                setVar('flicker', flicker);


                flicker = FlxFlicker.flicker(game.boyfriend, 1, 1 / 30, true, true, function(_) {
                    flicker = null;
                });
            ]])
        end
    end
end

function onTweenCompleted(t)
    if t == 'blackA' then
        doTweenAlpha('blackA', 'black', 1, 1.5, 'cubein')
    end

    if t == 'camdad' then
        setProperty('cameraSpeed', 1)
        setProperty('isCameraOnForcedPos', false)
    end

    if t == 'cambf' then
        setProperty('cameraSpeed', 1)
        setProperty('isCameraOnForcedPos', false)
    end
end