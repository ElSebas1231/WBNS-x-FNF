local video = 'memes' 

function onCreate()
    if isStoryMode and not seenCutscene then
        addHaxeLibrary('FlxVideo', 'hxcodec.flixel')
        makeLuaSprite('videoSprite', nil, 0, 0)
        setObjectCamera('videoSprite', 'other')
        addLuaSprite('videoSprite')
        setProperty('introSoundsSuffix', '-silencio')

        runHaxeCode([[
            var video:FlxVideo = new FlxVideo();
            video.play(Paths.video(']]..video..[['));
            video.alpha = 0;

            video.onTextureSetup.add(function() {
                game.getLuaObject('videoSprite').loadGraphic(video.bitmapData);
                if (game.modchartSprites.exists('negrooscuro')) game.getLuaObject('negrooscuro').alpha = 0;
            });

            video.onEndReached.add(function(){
                video.dispose();
                game.remove(game.getLuaObject('videoSprite'));
                if (game.modchartSprites.exists('negrooscuro')) game.getLuaObject('negrooscuro').alpha = 1;
                game.callOnScripts('onVideoFinished');
            }, true);

            setVar('video', video);
        ]])

        createTip('Puedes saltar la cinemática presionando X', 'KurriIslandCaps.ttf')
    else
        close(true)
    end
end

function onDestroy()
    if luaSpriteExists('videoSprite') then
        runHaxeCode([[
            var video = getVar('video');
            video.dispose();
        ]])
    end
end

function onTimerCompleted(t)
    if t == 'texty' then
        if luaTextExists('texthelp') then
            doTweenAlpha('text', 'texthelp', 1, 1, 'smoothstepin')
            runTimer('fady', 4)
        end
    end

    if t == 'fady' then
        if luaTextExists('texthelp') then
            doTweenAlpha('text1', 'texthelp', 0, 0.5, 'smoothstepout')
        end
    end
end

function onCountdownTick(c)
    if c == 4 then
        if luaSpriteExists('videoSprite') then
            runHaxeCode([[
                FlxG.camera.followLerp = 0;
                game.persistentUpdate = false;
                game.persistentDraw = true;
                game.paused = true;

                for (tween in modchartTweens) {
                    tween.active = false;
                }
    
                if (FlxG.sound.music != null){
                    FlxG.sound.music.pause();
                    game.vocals.pause();
                }
            ]])
        end
    end
end

function onGameOverStart()
    if luaSpriteExists('videoSprite') then
        runHaxeCode([[
            var video = getVar('video');
            video.dispose();
        ]])
        onVideoFinished()
        removeLuaSprite('videoSprite', true)
        removeLuaText('texthelp', true)
        removeLuaText('textShadow', true)
    end
end

function onUpdate()
    if keyboardPressed('X') then
        if luaSpriteExists('videoSprite') then
            runHaxeCode([[
                var video = getVar('video');
                video.dispose();
            ]])
            onVideoFinished()
            removeLuaSprite('videoSprite', true)
        end
    end

    if luaTextExists('texthelp') then
        setProperty('textShadow.alpha', getProperty('texthelp.alpha') * 0.6)
    end
end

function onPause()
    if luaSpriteExists('videoSprite') then
        runHaxeCode([[
            var video = getVar('video');
            video.pause();

            for (tween in modchartTweens) {
                tween.active = false;
            }

            FlxG.sound.music.pause();
            game.vocals.pause();

            FlxG.camera.followLerp = 0;
            game.persistentUpdate = false;
            game.persistentDraw = true;
            game.paused = true;
        ]])
    end
end

function onResume()
    if luaSpriteExists('videoSprite') then
        runHaxeCode([[
            var video = getVar('video');
            video.resume();

            for (tween in modchartTweens) {
                tween.active = false;
            }

            FlxG.sound.music.pause();
            game.vocals.pause();

            FlxG.camera.followLerp = 0;
            game.persistentUpdate = true;
            game.persistentDraw = true;
            game.paused = true;
        ]])
    end
end

function onVideoFinished()
    removeLuaText('texthelp', true)
    removeLuaText('textShadow', true)
    runHaxeCode([[

        FlxG.camera.followLerp = 0;
        game.persistentUpdate = true;
        game.persistentDraw = true;
        game.paused = false;

        for (tween in modchartTweens) {
            tween.active = true;
        }

        if (FlxG.sound.music != null){
            FlxG.sound.music.play();
            game.vocals.play();
        }
    ]])

    removeLuaSprite('videoSprite', true)
    
    if luaSpriteExists('negrooscuro') then
        setProperty('negrooscuro.alpha', 1)
    end
end

function createTip(text, font)
    makeLuaText('texthelp', tostring(text), screenWidth, 0, screenHeight * 0.92)
    setTextBorder('texthelp', 1.25, '000000')
    setTextColor('texthelp', 'FFFFFF')
    setTextSize('texthelp', 32)
    setTextFont('texthelp', tostring(font))
    screenCenter('texthelp', 'x')
    setObjectCamera('texthelp','other')
    setTextAlignment('texthelp', 'center')
    setProperty('texthelp.alpha', 0)
    addLuaText('texthelp')
    setProperty('texthelp.antialiasing', getPropertyFromClass('backend.ClientPrefs', 'data.antialiasing'))
    runTimer('texty', 2)

    makeLuaText('textShadow', text, screenWidth, 0, screenHeight * 0.92)
    setTextColor('textShadow', '000000')
    setTextSize('textShadow', 32)
    setTextFont('textShadow', 'KurriIslandCaps.ttf')
    setObjectCamera('textShadow','other')
    setProperty('textShadow.x', getProperty('texthelp.x') + 3)
    setProperty('textShadow.y', getProperty('texthelp.y') + 2)
    setTextAlignment('textShadow', 'center')
    setProperty('textShadow.alpha', 0)
    addLuaText('textShadow')
    setProperty('textShadow.antialiasing', getPropertyFromClass('backend.ClientPrefs', 'data.antialiasing'))

    setObjectOrder('textShadow', getObjectOrder('texthelp') - 1)
end