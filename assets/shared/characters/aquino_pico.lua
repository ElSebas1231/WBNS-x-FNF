function onCreatePost()
    if isRunning('scripts/noteskin') then
        removeLuaScript('scripts/noteskin')
    end
end

local defaultRGB = {
    {'ea8237', 'e5aa7f', '9d2735'},
    {'ea8237', 'e5aa7f', '9d2735'},
    {'ea8237', 'e5aa7f', '9d2735'},
    {'ea8237', 'e5aa7f', '9d2735'},
}

function onUpdate()
    if getPropertyFromClass('states.PlayState', 'isPixelStage') then
        for i = 0, 3 do
            setPropertyFromGroup('opponentStrums', i, 'useRGBShader', false)
            setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/NOTE_assets-aquinoPiko')
        end

        for i = 0, getProperty('notes.length')-1 do
            local noteData = getPropertyFromGroup('notes', i, 'noteData')
            if not getPropertyFromGroup('notes', i, 'mustPress') then
                setPropertyFromGroup('notes', i, 'rgbShader.enabled', false)
                setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-aquinoPiko')

                setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(defaultRGB[noteData + 1][1]))
                setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(defaultRGB[noteData + 1][2]))
                setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(defaultRGB[noteData + 1][3]))
            end
        end
    end
end