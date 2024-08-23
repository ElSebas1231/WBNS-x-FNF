local defaultRGB = {
    {'28069f', 'ffffff', '77029e'},
    {'28069f', 'ffffff', '77029e'},
    {'28069f', 'ffffff', '77029e'},
    {'28069f', 'ffffff', '77029e'},
}

function onCreatePost()
    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'useRGBShader', false)
        setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/NOTE_assets-compota')
    end
end

function onUpdate()
    for i = 0, getProperty('notes.length')-1 do
        if not getPropertyFromGroup('notes', i, 'mustPress') then
            local noteData = getPropertyFromGroup('notes', i, 'noteData')
            setPropertyFromGroup('notes', i, 'rgbShader.enabled', false)
            setPropertyFromGroup('notes', i, 'noteCoverData.useRGBShader', true)
            setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-compota')

            setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(defaultRGB[noteData + 1][1]))
            setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(defaultRGB[noteData + 1][2]))
            setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(defaultRGB[noteData + 1][3]))
        end
    end
end