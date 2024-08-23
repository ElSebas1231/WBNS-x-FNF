function onCreate()
    addHaxeLibrary('FlxVideo', 'hxcodec.flixel')
    runHaxeCode([[
        var cache:FlxVideo = new FlxVideo();
        cache.play(Paths.video('el_cejota'));
        cache.alpha = 0;
    ]])
end

function onEvent(n, v1, v2)
    if n == 'Code c3jo' then
        makeLuaSprite('videoSprite2', nil, 0, 0)
        setObjectCamera('videoSprite2', 'other')
        addLuaSprite('videoSprite2')
    
        runHaxeCode([[
            var video:FlxVideo = new FlxVideo();
            video.play(Paths.video('el_cejota'));
            video.alpha = 0;

            video.onTextureSetup.add(function() {
                game.getLuaObject('videoSprite2').loadGraphic(video.bitmapData);
            });

            video.onEndReached.add(function(){
                video.dispose();
                game.remove(game.getLuaObject('videoSprite2'));
            }, true);

            setVar('video', video);
        ]])
    end
end

function onStepHit()
    if curStep >= 1888 then
        if luaSpriteExists('videoSprite2') then
            runHaxeCode([[
                var video = getVar('video');
                video.dispose();

                game.remove(game.getLuaObject('videoSprite2'));
            ]])
        end
    end
end

function onGameOverStart()
    if luaSpriteExists('videoSprite2') then
        runHaxeCode([[
            var video = getVar('video');
            video.dispose();
        ]])
    end
end

function onPause()
    if luaSpriteExists('videoSprite2') then
        runHaxeCode([[
            var video = getVar('video');
            video.pause();
        ]])
    end
end

function onResume()
    if luaSpriteExists('videoSprite2') then
        runHaxeCode([[
            var video = getVar('video');
            video.resume();
        ]])
    end
end