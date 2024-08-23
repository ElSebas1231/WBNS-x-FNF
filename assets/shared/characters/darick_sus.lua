local defaultRGB = {
    {'8207cd', 'ffffff', '9600ba'},
    {'8207cd', 'ffffff', '9600ba'},
    {'8207cd', 'ffffff', '9600ba'},
    {'8207cd', 'ffffff', '9600ba'},
}

function onUpdate()
    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'useRGBShader', false)
        setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/NOTE_assets-darick')
    end

    for i = 0, getProperty('notes.length')-1 do
        local noteData = getPropertyFromGroup('notes', i, 'noteData')s
        if not getPropertyFromGroup('notes', i, 'mustPress') then
            setPropertyFromGroup('notes', i, 'rgbShader.enabled', false)
            setPropertyFromGroup('notes', i, 'noteCoverData.useRGBShader', true)
            setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-darick')

            setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(defaultRGB[noteData + 1][1]))
            setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(defaultRGB[noteData + 1][2]))
            setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(defaultRGB[noteData + 1][3]))
        end
    end
end