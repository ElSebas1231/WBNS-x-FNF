local whoisbf = '';
local isON = true;

function onCreate()
    if boyfriendName == 'faker-run' then
        whoisbf = 'boyfriend';
    else
        whoisbf = 'dad';
    end
end

function onCreatePost()
    makeAnimatedLuaSprite('piernasfalsa','backrooms/Pies-Lucasta-Falso', 0, 0);
    addAnimationByPrefix('piernasfalsa', 'idle', 'Pies-Lucasta-Falso idle0', 24, true);
    setObjectOrder('piernasfalsa', getObjectOrder('dadGroup') - 1);
    scaleObject('piernasfalsa', 3,3)
    setProperty('piernasfalsa.visible', false)
    setProperty('piernasfalsa.antialiasing', false)
    addLuaSprite('piernasfalsa', false);
end

function onUpdatePost()
    if getProperty('boyfriend.alpha') == 0 or not isON then
        setProperty('piernasfalsa.visible', true)
    else
        setProperty('piernasfalsa.visible', false)
    end
end

function onEvent(name, value1, value2)
    if name == 'Change Character' then
        if value1 == '0' or value1 == 'dad' then
            if value2 == 'faker-run' then
                isON = false;
                setProperty('piernasfalsa.visible', true)
                setProperty('piernasfalsa.x', getProperty('dad.x') - 980)
                setProperty('piernasfalsa.y', getProperty('dad.y') - 405)
            else
                isON = true;
                setProperty('piernasfalsa.visible', false)
            end
        end
    end
end