active = false
function onEvent(n,v1,v2)
    if n == "Corruption" then
        if not active then
            makeLuaSprite('Corruption', '', 0, 0)
            makeGraphic('Corruption', 1480, 920, '9D00C0')
            setObjectCamera('Corruption', 'hud')
            screenCenter('Corruption')
            setProperty('Corruption.alpha', 0)
            addLuaSprite('Corruption')
            doTweenAlpha('Corruption1', 'Corruption', 0.4, 1, 'sineInOut')
        else
            cancelTween('Corruption1')
            cancelTween('Corruption2')
            doTweenAlpha('CorruptionBye', 'Corruption', 0, 1, 'sineInOut')
        end
        active = not active
    end
end

function onTweenCompleted(tag)
    if tag == 'Corruption1' then
        doTweenAlpha('Corruption2', 'Corruption', 0.7, 1, 'sineInOut')
    elseif tag == 'Corruption2' then
        doTweenAlpha('Corruption1', 'Corruption', 0.4, 1, 'sineInOut')
    elseif tag == 'CorruptionBye' then
        removeLuaSprite('Corruption')
    end
end