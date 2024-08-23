buttonArray = {} -- sprite groups rule!
scalething = 3
amIdead = false
curselect = 1

function onPause()
    if getPropertyFromClass('states.PlayState', 'chartingMode') then -- oops
    return Function_Continue
    else
        if not amIdead then
            openCustomSubstate('minecraftPause', true)
        end
    end
    return Function_Stop
end


function onGameOver()
    if not amIdead then
        cameraSetTarget('boyfriend')
        setProperty('boyfriend.color', 16777215)
        triggerEvent('Play Animation', 'Anim', 'bf')
        setProperty('dad.visible', false)
        setProperty('camHUD.visible', false)

        if luaTextExists('credits') then
            setProperty('name.visible', false)
            setProperty('credits.visible', false)
            setProperty('barBox.visible', false)
            setProperty('border.visible', false)
        end
        
        runTimer('cosa', 2.4)
        runTimer('ender', 1.5)
        runHaxeCode([[
            for (tween in modchartTweens) {
                tween.active = false;
            }
            
            game.persistentUpdate = false;
            game.paused = true;

            FlxG.sound.music.pause();
            game.vocals.pause();
        ]])
        amIdead = true
    end
    return Function_Stop
end

function onTimerCompleted(t)
    if t == 'cosa' then
        openCustomSubstate('udied', false)
        playSound('hit'..getRandomInt(1, 3), 1, 'hiti');
    end

    if t == 'ender' then
        playSound('portal1', 1, 'endi');
    end
end

function onCustomSubstateCreate(name)
    if name == 'minecraftPause' then
        setPropertyFromClass('flixel.FlxG', 'mouse.visible', true)

        makeLuaSprite('Punderlay', '', 0, 0)
        makeGraphic('Punderlay', screenWidth, screenHeight, '000000')
        setObjectCamera('Punderlay', 'other')
        addLuaSprite('Punderlay', false)
        setProperty('Punderlay.alpha', 0.6)

        makeLuaText('credits', 'Script by n_bonnie2\nModified by ElSebas1231', 0, 0)
        setTextFont('credits', 'Minecraftia.ttf')
        setTextSize('credits', 18)
        setTextAlignment('credits', 'left')
        setProperty('credits.y', 650)
        setProperty('credits.alpha', 0.25)
        setObjectCamera('credits', 'other')
        addLuaText('credits', true)

        makeButton('resume', 'Volver al juego', 350, 230, false, 'other', 1)
        makeButton('restart', 'Reiniciar', 650, 320, false, 'other', 0.5)
        makeButton('optionsmenu', 'Opciones', 350, 320, false, 'other', 0.5)
        makeButton('quit', 'Guardar y salir '..(isStoryMode and 'al Menú de StoryMode' or 'a Freeplay'), 350, 410, false, 'other', 1)

        makeLuaText('pausename', 'Menú del juego', screenWidth, 0, 50)
        setTextFont('pausename', 'Minecraftia.ttf')
        setTextSize('pausename', 24)
        setObjectCamera('pausename', 'other')
        addLuaText('pausename')
        screenCenter('pausename', 'x')
    end
    
    if name == 'udied' then
        setPropertyFromClass('flixel.FlxG', 'mouse.visible', true)

        makeLuaSprite('Punderlay', '', 0, 0)
        makeGraphic('Punderlay', screenWidth, screenHeight, 'a80000')
        setObjectCamera('Punderlay', 'other')
        addLuaSprite('Punderlay', false)
        setProperty('Punderlay.alpha', 0.6)

        makeButton('restart', 'Reaparecer', 350, 300, false, 'other', 1)
        makeButton('quit', (isStoryMode and 'Menú de StoryMode' or 'Menú de Freeplay'), 350, 400, false, 'other', 1)

        makeLuaText('pausename', '¡Has muerto!', screenWidth, 0, 100)
        setTextFont('pausename', 'Minecraftia.ttf')
        setTextSize('pausename', 40)
        setObjectCamera('pausename', 'other')
        setProperty('pausename.antialiasing', false)
        addLuaText('pausename')
        screenCenter('pausename', 'x')

        extraSpaces = '   '
        for i = 1, string.len(tostring(score)) do 
            extraSpaces = extraSpaces..' '
        end

        makeLuaText('scoreshitty', 'Puntuación:'..extraSpaces, screenWidth, 0, 200)
        setTextFont('scoreshitty', 'Minecraftia.ttf')
        setTextSize('scoreshitty', 20)
        setObjectCamera('scoreshitty', 'other')
        setProperty('scoreshitty.antialiasing', false)
        addLuaText('scoreshitty')
        screenCenter('scoreshitty', 'x')

        makeLuaText('scoreshitty2', '       '..extraSpaces..score, screenWidth, 0, 200)
        setTextFont('scoreshitty2', 'Minecraftia.ttf')
        setTextSize('scoreshitty2', 20)
        setObjectCamera('scoreshitty2', 'other')
        setProperty('scoreshitty2.antialiasing', false)
        addLuaText('scoreshitty2')
        screenCenter('scoreshitty2', 'x')
        setTextColor('scoreshitty2', 'f6ff00')
    end
end

function onCustomSubstateUpdate(name, elapsed)
    if name == 'minecraftPause'then
        buttonShit()

        if keyJustPressed('back') or keyJustPressed('accept') then
            closeCustomSubstate()
        end
    end
    if name == 'udied' then
        buttonShit()
    end
end

function onCustomSubstateDestroy(name)
    if name == 'minecraftPause' then
        setPropertyFromClass('flixel.FlxG', 'mouse.visible', false)
        removeLuaSprite('Punderlay', false)
        removeLuaText('diffname', false)
        removeLuaText('pausename', false)
        removeLuaText('credits', false)
        destroyButtons()
    end
end


function makeButton(tag, text, x, y, unselectable, camera, scalex)
    makeAnimatedLuaSprite('button-'..tag, 'button', x, y)
    addAnimationByPrefix('button-'..tag, 'blank', 'button blank', 24, true)
    addAnimationByPrefix('button-'..tag, 'normal', 'button normal', 24, true)
    addAnimationByPrefix('button-'..tag, 'selected', 'button selected', 24, true)
    setProperty('button-'..tag..'.antialiasing', false)
    scaleObject('button-'..tag, scalex * scalething, scalething)
    setObjectCamera('button-'..tag, camera)
    addLuaSprite('button-'..tag, true)

    if unselectable then 
        playAnim('button-'..tag, 'blank', true)
    else
        playAnim('button-'..tag, 'normal', true)
    end
    updateHitbox('button-'..tag)

    -- text 
    local iammid = betterCenter(x, y, x + (200*scalething)*scalex, y + (20*scalething)) -- stop.
    makeLuaText('button-'..tag..'-text', text, screenWidth, iammid[1] - (screenWidth/2), iammid[2] - 5*scalething)
    setTextFont('button-'..tag..'-text', 'Minecraftia.ttf')
    setTextSize('button-'..tag..'-text', 18)
    setProperty('button-'..tag..'-text.antialiasing', false)
    setTextAlignment('button-'..tag..'-text', 'center')
    setObjectCamera('button-'..tag..'-text', camera)
    addLuaText('button-'..tag..'-text')

    buttonArray[#buttonArray + 1] = {'button-'..tag, unselectable, scalex}
end

function destroyButtons()
    for i = 1, #buttonArray do 
        removeLuaSprite(buttonArray[i][1], false)
        removeLuaText(buttonArray[i][1]..'-text', false)
    end
    buttonArray = {}
end

function buttonShit()
    for i = 1, #buttonArray do -- reused code :skull:
        if not buttonArray[i][2] then
            if getMouseX('other') >= getProperty(buttonArray[i][1]..'.x') and getMouseX('other') <= getProperty(buttonArray[i][1]..'.x') + (200*scalething)*(buttonArray[i][3]) and getMouseY('other') >= getProperty(buttonArray[i][1]..'.y') and getMouseY('other') <= getProperty(buttonArray[i][1]..'.y') + 20*scalething then
                playAnim(buttonArray[i][1], 'selected', true)
                if mouseClicked() then
                    playSound('click', 1, 'clicky')
                    onMCButtonClick(buttonArray[i][1])
                end
            else 
                playAnim(buttonArray[i][1], 'normal', true)
            end
        end
    end
end

function onMCButtonClick(buttontag)
    if buttontag == 'button-resume' then 
        closeCustomSubstate()
    end
    
    if buttontag == 'button-quit' then 
        exitSong(false)
    end

    if buttontag == 'button-pausething' then
        openCustomSubstate('minecraftPause', true)
    end

    if buttontag == 'button-restart' then 
        restartSong(false)
    end

    if buttontag == 'button-optionsmenu' then 
        addHaxeLibrary('ClientPrefs', 'backend')
        addHaxeLibrary('OptionsState', 'options')
        runHaxeCode([[
            FlxG.switchState(new OptionsState());
            OptionsState.onPlayState = true;

            if(ClientPrefs.data.pauseMusic != 'None')
            {
                FlxG.sound.playMusic(Paths.music(Paths.formatToSongPath(ClientPrefs.data.pauseMusic)), 0);

                if (ClientPrefs.data.pauseMusic == 'Breakfast' && PlayState.isPixelStage) {
                    FlxG.sound.playMusic(Paths.music(Paths.formatToSongPath('breakfast-pixel')), 0);
                }

                FlxTween.tween(FlxG.sound.music, {volume: 1}, 0.8);
                FlxG.sound.music.time = FlxG.random.int(0, Std.int(FlxG.sound.music.length / 2));
            }
        ]])
    end
end

function betterCenter(x1, y1, x2, y2) -- ( (x1 + x2) / 2, (y1 + y2) / 2 )
    local centerX = (x1 + x2) / 2
    local centerY = (y1 + y2) / 2 
    return {centerX, centerY}
end