function onEvent(name, value1, value2)
    if name == "Zoom Rapido" then
   setProperty('defaultCamZoom', value1)
   setProperty('camGame.zoom', value2)
    end
end