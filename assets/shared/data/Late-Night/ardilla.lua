function onCreate()
    addHaxeLibrary('Character', 'objects')
    runHaxeCode([[
        var tragadick:Character;

        tragadick = new Character(815, 50, 'ardillaculia', true);
        tragadick.scrollFactor.set(0.95, 0.95);
        //tragadick.alpha = 0;
        game.dadGroup.add(tragadick);
        setVar('tragadick', tragadick);
    ]])
end

function onCreatePost()
    makeLuaText("txt", "Ardilla joined the game", 1500, -630, 595)
    setTextFont("txt", "Minecraftia.ttf")
    setObjectCamera("txt",'Other')
    setTextColor('txt', 'f6ff00')
    setProperty("txt.alpha", 0)
    addLuaText("txt")

    makeLuaSprite("chat", nil,0,600)
    setObjectCamera("chat", 'Other')
    makeGraphic("chat",500,20,'000000')
    setProperty("chat.alpha", 0)
    addLuaSprite("chat")

    setProperty('tragadick.visible', false)
    setObjectOrder('tragadick',getObjectOrder('mesa') + 1)
end

function opponentNoteHit(index, noteData, noteType, isSustainNote)
    if noteType == 'Note Invisible' then
        playAnim('tragadick', getProperty('singAnimations['..noteData..']'), true)
        setProperty('tragadick.holdTimer', 0)
    end
end

function onCountdownTick(c)
    if getProperty('tragadick.animation.curAnim.finished') then
        if not getProperty('tragadick.animation.curAnim.name'):find('sing') then
            playAnim('tragadick', 'idle', true)
        end
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        if getProperty('tragadick.animation.curAnim.finished') then
            if not getProperty('tragadick.animation.curAnim.name'):find('sing') then
                playAnim('tragadick', 'idle', true)
            end
        end
    end
end

function onEvent(name, value1, value2)
    if name == "sanfordxd" then
        if value1 == '1' then
            setProperty("txt.alpha", 1)
            setProperty("chat.alpha", 0.65)
            doTweenAlpha("awa", "txt", 0, 3.0, "linear")
            doTweenAlpha("awa2", "chat", 0, 3.0, "linear")
            setProperty('tragadick.visible',true)
            playAnim('tragadick', 'intro', true)
        end

        if value1 == '2' then
            playAnim('tragadick', 'trompeta', true)
        end

        if value1 == 'end' then
            setProperty('tragadick.visible',false)
            setProperty("txt.alpha", 1)
            setProperty("chat.alpha", 0.65)
            doTweenAlpha("awa", "txt", 0, 3.0, "linear")
            doTweenAlpha("awa2", "chat", 0, 3.0, "linear")
            setTextString("txt", "Ardilla left the game")
        end
    end
end