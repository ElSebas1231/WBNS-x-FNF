function onCreate()
    createStage(0)

    for i = 1, 8 do
        precacheStage(i)
    end
end

function onEvent(n, v1, v2)
    if n == 'FTE Events' then
        if v1 == 'stg' then
            c = tonumber(v2)
            createStage(c)
            removeStage((c == 0 and c or c - 1) or (c <= 8 and c - 1 or 8))
        end
    end
end

function createStage(stage)
    if stage == 0 then
        makeAnimatedLuaSprite('Comienzo', 'Speedrun/Speedrun-Comienzo/Escenario-Speedrun-Comienzo', -250, 210)
        addAnimationByPrefix('Comienzo', 'idle', 'Escenario-Speedrun-Comienzo idle', 24, true)
        scaleObject('Comienzo', 1.7, 1.7)
        addLuaSprite('Comienzo')

        setObjectOrder('gfGroup', getObjectOrder('dadGroup') + 1)
    elseif stage == 1 then
        makeAnimatedLuaSprite('MinaAquino', 'Speedrun/Aquino-Minando-Speedrun/Escenario-Minando-Speedrun', -250, 210)
        addAnimationByPrefix('MinaAquino', 'idle', 'Escenario-Minando-Speedrun idle', 24, true)
        scaleObject('MinaAquino', 1.7, 1.7)
        addLuaSprite('MinaAquino')

        setCharacterX('boyfriend', getProperty('boyfriend.x') + 120)

        setProperty('gf.visible', not getProperty('gf.visible'))
        setProperty('dad.visible', not getProperty('dad.visible'))
        setProperty('duxo1.visible', not getProperty('duxo1.visible'))
    elseif stage == 2 then
        makeAnimatedLuaSprite('Portal Soa', 'Speedrun/Soarinng-Portal-Speedrun/Escenario-Portal-Speedrun', -250, 210)
        addAnimationByPrefix('Portal Soa', 'idle', 'Escenario-Portal-Speedrun idle', 24, true);
        scaleObject('Portal Soa', 1.7, 1.7);
        addLuaSprite('Portal Soa');
    elseif stage == 3 then
        makeAnimatedLuaSprite('Fortaleza', 'Speedrun/Speedrun-Nether-Fortaleza/Escenario-Speedrun-fortaleza', -250, 210)
        addAnimationByPrefix('Fortaleza', 'idle', 'Escenario-Speedrun-fortaleza idle', 24, true);
        scaleObject('Fortaleza', 1.7, 1.7);
        addLuaSprite('Fortaleza')

        makeLuaSprite('rocas', 'Speedrun/Speedrun-Nether-Fortaleza/rocas', -250, 210)
        scaleObject('rocas', 1.7, 1.7)
        addLuaSprite('rocas', true)

        setCharacterX('dad', getProperty('dad.x') + 95)
        setCharacterY('dad', getProperty('dad.x') - 110)

        setCharacterX('boyfriend', getProperty('boyfriend.x') - 20)
    elseif stage == 4 then
        makeAnimatedLuaSprite('Ender', 'Speedrun/Duxo-Enderman-Speedrun/Escenario-Enderman-Speedrun', -250, 210)
        addAnimationByPrefix('Ender', 'idle', 'Escenario-Enderman-Speedrun idle', 24, true);
        scaleObject('Ender', 1.7, 1.7);
        addLuaSprite('Ender');

        setProperty('dad.visible', not getProperty('dad.visible'))
    elseif stage == 5 then
        makeLuaSprite('Escenario2', 'Speedrun/Locochon-Nether-Speedrun/Escenario-Locochon-Nether-Speedrun-capa', -250, 210)
        scaleObject('Escenario2', 1.7, 1.7)
        addLuaSprite('Escenario2')
        
        makeLuaSprite('bloque3', 'Speedrun/Locochon-Nether-Speedrun/bloque3', -333, 210)
        scaleObject('bloque3', 1.7, 1.7)
        addLuaSprite('bloque3')

        makeLuaSprite('bloque2', 'Speedrun/Locochon-Nether-Speedrun/bloque2', -333, 210)
        scaleObject('bloque2', 1.7, 1.7)
        addLuaSprite('bloque2')

        makeLuaSprite('bloque1', 'Speedrun/Locochon-Nether-Speedrun/bloque', -333, 210)
        scaleObject('bloque1', 1.7, 1.7)
        addLuaSprite('bloque1')

        makeLuaSprite('Escenario', 'Speedrun/Locochon-Nether-Speedrun/Escenario-Locochon-Nether-Speedrun', -250, 210)
        scaleObject('Escenario', 1.7, 1.7)
        addLuaSprite('Escenario')

        setProperty('boyfriend.visible', true)
    elseif stage == 6 then
        makeAnimatedLuaSprite('Portal', 'Speedrun/Aquino-End-Portal/Escenario-Portal-Apagado', -250, 210)
        addAnimationByPrefix('Portal', 'idle', 'Escenario-Portal-Apagado idle', 24, true)
        scaleObject('Portal', 1.7, 1.7)
        addLuaSprite('Portal')
        
        makeAnimatedLuaSprite('Portal2', 'Speedrun/Aquino-End-Portal/Escenario-End-Portal', -250, 210)
        addAnimationByPrefix('Portal2', 'idle', 'Escenario-End-Portal idle', 24, true);
        scaleObject('Portal2', 1.7, 1.7)
        setProperty('Portal2.visible', false)
        addLuaSprite('Portal2')
    elseif stage == 7 then
        makeAnimatedLuaSprite('End', 'Speedrun/Aquino-End-Speedrun/Escenario-End-Speedrun', -250, 210)
        addAnimationByPrefix('End', 'idle', 'Escenario-End-Speedrun idle', 24, true)
        scaleObject('End', 1.7, 1.7)
        addLuaSprite('End')
    elseif stage == 8 then
        cameraFlash('game', 'ffffff', 0.5)
        cameraSetTarget(mustHitSection and 'boyfriend' or 'dad')
        setProperty('defaultCamZoom', 1.15)
        setProperty('cameraSpeed', 99)

        makeLuaSprite('No dragon', 'Speedrun/Dragon-End-Speedrun/Escenario-SinDragon-End', -250, 210)
        scaleObject('No dragon', 1.7, 1.7)
        setProperty('No dragon.alpha', 0.001)
        addLuaSprite('No dragon')

        makeAnimatedLuaSprite('Escenario', 'Speedrun/Dragon-End-Speedrun/Escenario-Drangon-End', -250, 210)
        addAnimationByPrefix('Escenario', 'idle', 'Escenario-Drangon-End idle', 24, true);
        scaleObject('Escenario', 1.7, 1.7)
        addLuaSprite('Escenario')

        setProperty('gf.visible', false)
        setProperty('dad.visible', false)
        
        setProperty('duxo2.visible', true)
        setProperty('soarinngEnd.visible', true)
        setProperty('locoEnd.visible', true)
    end
end

function removeStage(stage, destroy)
    if destroy ~= false then
        destroy = true
    end

    if stage == 0 then
        removeLuaSprite('Comienzo', destroy)
    elseif stage == 1 then
        removeLuaSprite('MinaAquino', destroy)
    elseif stage == 2 then
        removeLuaSprite('Portal Soa', destroy)
    elseif stage == 3 then
        removeLuaSprite('rocas', destroy)
        removeLuaSprite('Fortaleza', destroy)
    elseif stage == 4 then
        removeLuaSprite('Ender', destroy)
    elseif stage == 5 then
        removeLuaSprite('Escenario', destroy)
        removeLuaSprite('Escenario2', destroy)
        removeLuaSprite('bloque1', destroy)
        removeLuaSprite('bloque2', destroy)
        removeLuaSprite('bloque3', destroy)
    elseif stage == 6 then
        removeLuaSprite('Portal', destroy)
        removeLuaSprite('Portal2', destroy)
    elseif stage == 7 then
        removeLuaSprite('End', destroy)
    end
end

function precacheStage(stage)
    if stage == 1 then
        precacheImage('Speedrun/Aquino-Minando-Speedrun/Escenario-Minando-Speedrun')
    elseif stage == 2 then
        precacheImage('Speedrun/Soarinng-Portal-Speedrun/Escenario-Portal-Speedrun')
    elseif stage == 3 then
        precacheImage('Speedrun/Speedrun-Nether-Fortaleza/Escenario-Speedrun-fortaleza')
    elseif stage == 4 then
        precacheImage('Speedrun/Duxo-Enderman-Speedrun/Escenario-Enderman-Speedrun')
    elseif stage == 5 then
        precacheImage('Speedrun/Locochon-Nether-Speedrun/Escenario-Locochon-Nether-Speedrun')
        precacheImage('Speedrun/Locochon-Nether-Speedrun/Escenario-Locochon-Nether-Speedrun-capa')
        precacheImage('Speedrun/Locochon-Nether-Speedrun/bloque')
        for i = 2, 3 do 
            precacheImage('Speedrun/Locochon-Nether-Speedrun/bloque'..i)
        end
    elseif stage == 6 then
        precacheImage('Speedrun/Aquino-End-Portal/Escenario-End-Portal')
        precacheImage('Speedrun/Aquino-End-Portal/Escenario-End-Portal-Apagado')
    elseif stage == 7 then
        precacheImage('Speedrun/Aquino-End-Speedrun/Escenario-End-Speedrun')
    elseif stage == 8 then
        precacheImage('Speedrun/Dragon-End-Speedrun/Escenario-Drangon-End')
    end
end