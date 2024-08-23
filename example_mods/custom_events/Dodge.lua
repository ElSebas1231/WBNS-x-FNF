local Dodged = false
local canDodge = false
local DodgeTime = 1

function onCreate()	
    precacheImage('aviso')
    precacheSound('Dodged')

    addHaxeLibrary('FlxFlicker', 'flixel.effects')
end

function onEvent(name, value1, value2)
    if name == "Dodge" then
        DodgeTime = value1
        canDodge = true
        Dodged = false

        makeAnimatedLuaSprite('aviso', 'aviso', 400, 200);
        addAnimationByPrefix('aviso', 'aviso', 'aviso', 24, true);
        playAnim('aviso', 'aviso');
        setObjectCamera('aviso', 'other');
        addLuaSprite('aviso', true); 
    
        triggerEvent('Play Animation', 'attack', 'dad')
        runTimer('Died', DodgeTime)
    end
end

function onUpdate()
    if keyboardJustPressed('SPACE') then
        if canDodge then
            Dodged = true
            canDodge = false

            if not luaSoundExists('ataki') then
                playSound('Dodged', 0.35, 'ataki')
            end
            
            cancelTimer('Died')
            removeLuaSprite('aviso')
            playAnim('boyfriend', 'defend', true)
            setProperty('boyfriend.specialAnim', true)
        end
    end

    if getProperty('dad.animation.curAnim.name') == 'Ataque' then
        if getProperty('dad.animation.curAnim.curFrame') == 12 then
            canDodge = false
            Dodged = false
            cancelTimer('Died')
            playSound('Dodged', 0.35, 'ataki')
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'Died' then   
        if Dodged then
            Dodged = false
        end

        if not Dodged then
            if not luaSoundExists('ataki') then
                playSound('Dodged', 0.35, 'ataki')
            end
            
            addHealth(-0.5)

            runHaxeCode([[
                var playerFlicker:FlxFlicker = null;
                setVar('playerFlicker', playerFlicker);


                playerFlicker = FlxFlicker.flicker(game.boyfriend, 1, 1 / 30, true, true, function(_) {
                    playerFlicker = null;
                });
            ]])
        end

        canDodge = false
        removeLuaSprite('aviso')
    end
end

function onPause()
    if luaSoundExists('ataki') then
        pauseSound('ataki')
    end
end

function onResume()
    if luaSoundExists('ataki') then
        resumeSound('ataki')
    end
end