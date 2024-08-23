local cosas = {"scoreTxt", "timeBar.bg", "timeBar.leftBar", "timeBar.rightBar", "timeTxt", "healthBar.bg", "healthBar.leftBar", "healthBar.rightBar",
"iconP1", "iconP2"}

function onCreate()
    addHaxeLibrary('FlxVideo', 'hxcodec.flixel')

    makeLuaSprite('blackbg', nil, screenWidth * -0.5, screenHeight * -0.5)
    makeGraphic('blackbg', screenWidth * 2, screenHeight * 2, '000000')
    setScrollFactor('blackbg', 0)
    setObjectCamera('blackbg', 'hud')
    setProperty('blackbg.alpha', 0.001)
    addLuaSprite('blackbg')

    makeLuaSprite('blackbgOverlay', nil, screenWidth * -0.5, screenHeight * -0.5)
    makeGraphic('blackbgOverlay', screenWidth * 2, screenHeight * 2, '000000')
    setScrollFactor('blackbgOverlay', 0)
    setObjectCamera('blackbgOverlay', 'other')
    setProperty('blackbgOverlay.alpha', 0.001)
    addLuaSprite('blackbgOverlay')

    runHaxeCode([[
        var cache:FlxVideo = new FlxVideo();
        cache.play(Paths.video('Cinematica FTE'));
        cache.alpha = 0;
    ]])
end

function onGameOverStart()
    if luaSpriteExists('videoSprite') then
        runHaxeCode([[
            var video = getVar('video');
            video.dispose();
        ]])
    end
end

function onPause()
    if luaSpriteExists('videoSprite') then
        runHaxeCode([[
            var video = getVar('video');
            video.pause();
        ]])
    end
end

function onResume()
    if luaSpriteExists('videoSprite') then
        runHaxeCode([[
            var video = getVar('video');
            video.resume();
        ]])
    end
end

function onEvent(n, v1, v2)
    if n == 'FTE Events' then
        if v1 == 'trans' then
            local opts = stringSplit(v2, ",")
            cancelTween('bgAl')
            doTweenAlpha('bgAl', 'blackbg', opts[1], opts[2], opts[3])
        end

        if v1 == 'trans over' then
            local opts = stringSplit(v2, ",")
            cancelTween('bgAl')
            doTweenAlpha('bgAl', 'blackbgOverlay', opts[1], opts[2], opts[3])
        end

        if v1 == 'hudfade' then
            local opts = stringSplit(v2, ",")
            for i = 1, #cosas do
                doTweenAlpha('things'..cosas[i], cosas[i], opts[1], opts[2])
            end

            for i = 0, 7 do
                noteTweenAlpha('notesAlpha'..i, i, opts[1], opts[2])
            end
        end

        if v1 == 'camTwn' then
            local opts = stringSplit(v2, ",")

            doTweenX('camX', 'camFollow', opts[1], opts[3], opts[4])
            doTweenY('camY', 'camFollow', opts[2], opts[3], opts[4])
        end

        if v1 == 'portal' then
            if luaSpriteExists('Portal') then
                setProperty('Portal2.visible', true)
                setProperty('Portal.visible', false)
            end
        end

        if v1 == 'video' then
            makeLuaSprite('videoSprite', nil, 0, 0)
            setObjectCamera('videoSprite', 'other')
            addLuaSprite('videoSprite')
        
            runHaxeCode([[
                var duxo2 = game.getLuaObject('duxo2');
                var soarinngEnd = game.getLuaObject('soarinngEnd');
                var locoEnd = game.getLuaObject('locoEnd');

                
                var video:FlxVideo = new FlxVideo();
                video.play(Paths.video('Cinematica FTE'));
                video.alpha = 0;
    
                video.onTextureSetup.add(function() {
                    game.getLuaObject('videoSprite').loadGraphic(video.bitmapData);
                });
    
                video.onEndReached.add(function(){
                    video.dispose();
                    game.remove(game.getLuaObject('duxo2'));
                    game.remove(game.getLuaObject('soarinngEnd'));
                    game.remove(game.getLuaObject('locoEnd'));
                    game.remove(game.getLuaObject('Escenario'));
                    game.getLuaObject('No dragon').alpha = 1;
                    game.remove(game.getLuaObject('videoSprite'));
                }, true);

                setVar('video', video);
            ]])
        end
    end
end

function onTweenCompleted(t)
    if t == 'camX' then
        cameraSetTarget(mustHitSection and 'boyfriend' or 'dad')
    end
end