function onCreate()
    addHaxeLibrary('Character', 'objects')
    runHaxeCode([[
        var duxo1:Character;
        var duxo2:Character;
        var soarinngEnd:Character;
        var locoEnd:Character;

        duxo1 = new Character(game.boyfriend.x, game.boyfriend.y, 'Duxo-speedrun-comienzo', true);
        duxo1.scrollFactor.set(0.95, 0.95);
        game.modchartSprites.set('duxo1', duxo1);
        game.add(duxo1);

        duxo2 = new Character(game.gf.x + 105, game.gf.y - 20, 'Duxo-speedrun-dragon', true);
        duxo2.scrollFactor.set(0.95, 0.95);
        game.modchartSprites.set('duxo2', duxo2);
        game.add(duxo2);

        soarinngEnd = new Character(game.boyfriend.x + 100, game.boyfriend.y - 20, 'Soarinng-speedrun-dragon', true);
        soarinngEnd.scrollFactor.set(0.95, 0.95);
        game.modchartSprites.set('soarinngEnd', soarinngEnd);
        game.add(soarinngEnd);

        locoEnd = new Character(game.boyfriend.x + 100, game.boyfriend.y - 10, 'Locochon-speedrun-dragon', true);
        locoEnd.scrollFactor.set(0.95, 0.95);
        game.modchartSprites.set('locoEnd', locoEnd);
        game.add(locoEnd);
    ]])

    setObjectOrder('duxo1', getObjectOrder('boyfriendGroup') - 1)
    setObjectOrder('locoEnd', getObjectOrder('duxo2') - 1)

    setProperty('duxo2.visible', false)
    setProperty('soarinngEnd.visible', false)
    setProperty('locoEnd.visible', false)
end

local allowMoveCam = true

function goodNoteHit(index, noteData, noteType, isSustainNote)
    if noteType == 'Enemyextra1' then
        allowMoveCam = true
        playAnim('duxo1', getProperty('singAnimations['..noteData..']'), true)
        setProperty('duxo1.holdTimer', 0)
        if mustHitSection then
            if not gfSection then
                if not getProperty('boyfriend.animation.curAnim.name'):find('sing') then
                    if allowMoveCam then
                        runHaxeCode([[
                            var duxo1 = game.getLuaObject('duxo1');
                            
                            game.camFollow.setPosition(duxo1.getMidpoint().x - 100, duxo1.getMidpoint().y - 100);
                            game.camFollow.x -= duxo1.cameraPosition[0] - boyfriendCameraOffset[0];
                            game.camFollow.y += duxo1.cameraPosition[1] + boyfriendCameraOffset[1];
                        ]])
                    end
                end
            else
                triggerEvent('Camera Follow Pos', '', '')
            end
        end
    end
    
    if noteType == 'Duxo Note' then
        allowMoveCam = true
        playAnim('duxo2', getProperty('singAnimations['..noteData..']'), true)
        setProperty('duxo2.holdTimer', 0)
    end

    if noteType == 'Loco Note' then
        allowMoveCam = true
        playAnim('locoEnd', getProperty('singAnimations['..noteData..']'), true)
        setProperty('locoEnd.holdTimer', 0)
    end

    if noteType == 'Soarinng Note' then
        allowMoveCam = true
        playAnim('soarinngEnd', getProperty('singAnimations['..noteData..']'), true)
        setProperty('soarinngEnd.holdTimer', 0)
    end
end

function onCountdownTick(c)
    if c % 2 == 0 then
        if getProperty('duxo1.animation.curAnim.finished') then
            playAnim('duxo1', 'idle', true)
        end
    end
end

--[[ Te lo juro que no se que pasa, pero en el script de notes.lua
    entre los steps de 1675 a 2303 el script ni eventos funcionan en esa parte para las notas.
    Fue por eso que puse esto, ojalá no pasen cosas raras

    - ElSebas1231
]]
function onStepHit()
    if curStep >= 1770 and curStep <= 2303 then
        for b = 0, 3 do
            for b = 0, 3 do
                setPropertyFromGroup('playerStrums', b, 'texture', 'noteSkins/NOTE_assets-aquino')
            end
        end

        for d = 0, 3 do
            for d = 0, 3 do
                setPropertyFromGroup('opponentStrums', d, 'texture', 'noteSkins/NOTE_assets-soarinng')
            end
        end
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        if getProperty('duxo1.animation.curAnim.finished') then
            if not getProperty('duxo1.animation.curAnim.name'):find('sing') then
                playAnim('duxo1', 'idle', true)
            end
        end

        if getProperty('duxo2.animation.curAnim.finished') then
            if not getProperty('duxo2.animation.curAnim.name'):find('sing') then
                playAnim('duxo2', 'idle', true)
            end
        end

        if getProperty('soarinngEnd.animation.curAnim.finished') then
            if not getProperty('soarinngEnd.animation.curAnim.name'):find('sing') then
                playAnim('soarinngEnd', 'idle', true)
            end
        end

        if getProperty('locoEnd.animation.curAnim.finished') then
            if not getProperty('locoEnd.animation.curAnim.name'):find('sing') then
                playAnim('locoEnd', 'idle', true)
            end
        end
    end
end