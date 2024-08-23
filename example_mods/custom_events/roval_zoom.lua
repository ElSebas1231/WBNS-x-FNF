function onCreatePost()
    zoom = getProperty('defaultCamZoom'); --Zoom que tiene el stage
end
function onEvent(n,v1,v2)
    if n == "roval_zoom" then
        local zumito = split(v2)
        zoomextra = v1
        zoomtiempo = tonumber(zumito[1])
        zoomease = zumito[2]
        if v1 == '' then
            zoomextra = 0
        end
        if v2 == '' then
            zoomtiempo = 0.18
            zoomease = 'linear'
        end

        if zumito[1] == '' then
            zoomtiempo = 0.001
            zoomease = 'linear'
        elseif v2:match(",") == nil then
            zoomease = 'linear'
        end
        unezooms = (zoom + zoomextra)
        doTweenZoom('zoomtween', 'camGame', unezooms, zoomtiempo, zoomease)
        setProperty('defaultCamZoom', unezooms)  
    end
end

function split(s)
    local resultados = {}
    for union in (s..","):gmatch("([^,%s]+)") do 
      table.insert(resultados, union)
    end
    return resultados 
end
