function onCreate()
    makeLuaSprite('bg', 'mexico/FondoEscuela', 0, -5)
    scaleObject('bg', 1.2, 1.2)
    addLuaSprite('bg')

    addHaxeLibrary('Character', 'objects')
    runHaxeCode([[
        var Asaltante:Character;
        Asaltante = new Character(100, -250, 'Asaltante', false);
        Asaltante.scrollFactor.set(0.95, 0.95);
        game.gfGroup.add(Asaltante);
        setVar('Asaltante', Asaltante);

        var SoaringMX:Character;
        SoaringMX = new Character(420, 0, 'Soarinng_MX', true);
        SoaringMX.scrollFactor.set(0.95, 0.95);
        game.boyfriendGroup.add(SoaringMX);
        setVar('SoaringMX', SoaringMX);
    ]])
end

function opponentNoteHit(index, noteData, noteType, isSustainNote)
    if noteType == '' then
        playAnim('Asaltante', getProperty('singAnimations['..noteData..']'), true)
    end
end

function goodNoteHit(index, noteData, noteType, isSustainNote)
    if noteType == 'Alt Animation' then
        playAnim('SoaringMX', getProperty('singAnimations['..noteData..']'), true)
    end
end

function onCountdownTick(c)
    if c % 2 == 0 then
        playAnim('Asaltante', 'idle', true)
        playAnim('SoaringMX', 'idle', true)
    end
end
function onBeatHit()
    if curBeat % 2 == 0 then
        playAnim('Asaltante', 'idle', true)
        playAnim('SoaringMX', 'idle', true)
    end
end