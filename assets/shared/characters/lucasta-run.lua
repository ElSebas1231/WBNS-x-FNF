local whoisbf = '';
local isON = true;

function onCreate()
    if boyfriendName == 'lucasta-run' then
        whoisbf = 'boyfriend';
    else
        whoisbf = 'dad';
    end
end

function onCreatePost()
    makeAnimatedLuaSprite('piernas','backrooms/Pies-Lucasta', 0, 0);
    addAnimationByPrefix('piernas', 'idle', 'Pies-Lucasta idle0', 24, true);
    setObjectOrder('piernas', getObjectOrder('boyfriendGroup') - 1);
    scaleObject('piernas', 2.5,2.5)
    setProperty('piernas.visible', false)
    setProperty('piernas.antialiasing', false)
    addLuaSprite('piernas', false);

    setProperty('piernas.x', getProperty('boyfriend.x'));
    setProperty('piernas.y', getProperty('boyfriend.y'));
    setProperty('piernas.offset.x', 0);
    setProperty('piernas.offset.y', 0)
end

function onUpdatePost()
    if getProperty('boyfriend.alpha') == 0 or not isON then
        setProperty('piernas.alpha', 0)
    else
        setProperty('piernas.alpha', 1)
    end
    if isON then
        setProperty('piernas.x', getProperty('boyfriend.x'));
        setProperty('piernas.y', getProperty('boyfriend.y'));
    end
end

function onEvent(name, value1, value2)
    if name == 'Change Character' then
        if value1 == '1' or value1 == 'dad' then
            whoisbf = 'dad';
        elseif value1 == '0' or value1 == 'bf' then
            whoisbf = 'boyfriend';
        end
        if value1 == '0' or value1 == 'bf' then
            if value2 == 'lucasta-run' then
                isON = true
                setProperty('piernas.visible', true)
                setProperty('piernas.x', getProperty('boyfriend.x') + 300);
                setProperty('piernas.y', getProperty('boyfriend.y'));
            else
                isON = false
                setProperty('piernas.visible', false)
            end
        end
    end   
end