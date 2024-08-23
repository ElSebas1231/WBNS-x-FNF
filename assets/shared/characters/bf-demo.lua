function onCreate()
    if boyfriendName == 'bf-demo' then
        setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'bf-demo-dead')
    end
end

function onEvent(n, v1, v2)
    if n == 'Change Character' then
        if v1 == 'bf' then
            if v2 == 'bf-demo' then
                setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'bf-demo-dead')
            end
        end
    end
end