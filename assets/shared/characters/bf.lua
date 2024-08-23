function onCreate()
    setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'bf-dead')
end

function onEvent(n, v1, v2)
    if n == 'Change Character' then
        if v1 == 'bf' then
            if v2 == 'bf' then
                setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'bf-dead')
            end
        end
    end
end