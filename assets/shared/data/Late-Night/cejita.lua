function onCreate()
    addHaxeLibrary('Character', 'objects')
    runHaxeCode([[
        var cejita:Character;

        cejita = new Character(-50, 10, 'c3jita-late', false);
        cejita.scrollFactor.set(1.0, 1.0);
        //cejita.alpha = 0;
        game.gfGroup.add(cejita);
        setVar('cejita', cejita);
    ]])
end


function opponentNoteHit(index, noteData, noteType, isSustainNote)
    if noteType == 'Enemyextra1' or noteType == 'Enemyduo' then
        playAnim('cejita', getProperty('singAnimations['..noteData..']'), true)
        setProperty('cejita.holdTimer', 0)
    end
end

function onCountdownTick(c)
    if c % 2 == 0 then
        if getProperty('cejita.animation.curAnim.finished') and not getProperty('cejita.animation.curAnim.name'):find('sing') then
            playAnim('cejita', 'idle', true)
        end
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        if getProperty('cejita.animation.curAnim.finished') and not getProperty('cejita.animation.curAnim.name'):find('sing') then
            playAnim('cejita', 'idle', true)
        end
    end
end