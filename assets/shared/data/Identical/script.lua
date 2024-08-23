function onEvent(n, v1, v2)
    if n == 'Change Character' then
        if v1 == 'dad' then
            if v2 == 'SkinStealer' then
                doTweenAlpha('cam', 'camGame', 1, 1.5, 'quadinout')
            end
        end
    end

    if n == 'Play Animation' then
        if v1 == 'anim' and v2 == 'dad' then
            doTweenAlpha('camara', 'camGame', 0, 1, 'quadinout')
        end
    end
end

function onMoveCamera(f)
    if f == 'dad' then
        if dadName == 'SkinStealer' then
            setProperty('defaultCamZoom', 1)
        else
            setProperty('defaultCamZoom', 1.2)
        end
    end

    if f == 'boyfriend' then
        setProperty('defaultCamZoom', 0.7)
    end
end