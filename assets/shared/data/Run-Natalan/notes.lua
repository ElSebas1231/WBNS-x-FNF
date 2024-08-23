function onCreatePost()
    noteSkin = string.lower(getPropertyFromClass('backend.ClientPrefs', 'data.noteSkin'))

    if isRunning('scripts/noteskin') then
        removeLuaScript('scripts/noteskin')
    end

    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'useRGBShader', false)
        setPropertyFromGroup('playerStrums', i, 'useRGBShader', false)

        if not string.find(string.lower(noteSkin), 'natalan') and noteSkin == 'default' then
            setPropertyFromGroup('playerStrums', i, 'texture', 'noteSkins/NOTE_assets-natalan')
        end
    end
end

local skinsRGB = {
    ['natalan'] = {
        {'709cff', 'ffffff', '3f2721'},
        {'709cff', 'ffffff', '3f2721'},
        {'709cff', 'ffffff', '3f2721'},
        {'709cff', 'ffffff', '3f2721'},
    },
}

function onUpdate()
    for i = 0, getProperty('notes.length')-1 do
        local noteData = getPropertyFromGroup('notes', i, 'noteData')
        setPropertyFromGroup('notes', i, 'rgbShader.enabled', false)
        setPropertyFromGroup('notes', i, 'noteSplashData.useRGBShader', true)
        setPropertyFromGroup('notes', i, 'noteCoverData.useRGBShader', true)
        setPropertyFromGroup('notes', i, 'noteSplashData.texture', 'noteSplashes/noteSplashes-'..noteSplash..'rgb')
        
        if not string.find(string.lower(noteSkin), 'natalan') and noteSkin == 'default' then
            setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-natalan')
            setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['natalan'][noteData + 1][1]))
            setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['natalan'][noteData + 1][2]))
            setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['natalan'][noteData + 1][3]))

            setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['natalan'][noteData + 1][1]))
            setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['natalan'][noteData + 1][2]))
            setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['natalan'][noteData + 1][3]))
        end
    end
end