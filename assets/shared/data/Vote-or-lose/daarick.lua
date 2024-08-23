function onCreate()
    addHaxeLibrary('Character', 'objects')
    runHaxeCode([[
        var tragadick:Character;

        tragadick = new Character(-400, -30, 'daaricksus', false);
        tragadick.scrollFactor.set(0.95, 0.95);
        //tragadick.alpha = 0;
        game.dadGroup.add(tragadick);
        setVar('tragadick', tragadick);
    ]])
end

local allowMoveCam = true

function opponentNoteHit(index, noteData, noteType, isSustainNote)
    if noteType == 'Enemyextra1' or noteType == 'Enemyduo' then
        allowMoveCam = true
        playAnim('tragadick', getProperty('singAnimations['..noteData..']'), true)
        setProperty('tragadick.holdTimer', 0)
        if not mustHitSection then
            if not gfSection then
                if not getProperty('dad.animation.curAnim.name'):find('sing') then
                    if allowMoveCam then
                        a = getProperty('tragadick.cameraPosition[0]') + getProperty('opponentCameraOffset[0]')
                        b = getProperty('tragadick.cameraPosition[1]') - getProperty('opponentCameraOffset[1]')

                        setProperty('camFollow.x', a)
                        setProperty('camFollow.y', b)
                    end
                end
            else
                triggerEvent('Camera Follow Pos', '', '')
            end
        end
    else
        triggerEvent('Camera Follow Pos', '', '')
        allowMoveCam = false
    end
end

function onCountdownTick(c)
    if c % 2 == 0 then
        if getProperty('tragadick.animation.curAnim.finished') and not getProperty('tragadick.animation.curAnim.name'):find('sing') then
            playAnim('tragadick', 'idle', true)
        end
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        if getProperty('tragadick.animation.curAnim.finished') and not getProperty('tragadick.animation.curAnim.name'):find('sing') then
            playAnim('tragadick', 'idle', true)
        end
    end
end