function onCreatePost()
    if isRunning('scripts/noteskin') then
        removeLuaScript('scripts/noteskin')
    end
end

function onUpdate()
    if getPropertyFromClass('states.PlayState', 'isPixelStage') then
        for i = 0, 3 do
            setPropertyFromGroup('opponentStrums', i, 'useRGBShader', false)
            setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/NOTE_assets-ut')
        end

        for i = 0, getProperty('notes.length')-1 do
            if not getPropertyFromGroup('notes', i, 'mustPress') then
                setPropertyFromGroup('notes', i, 'rgbShader.enabled', false)
                setPropertyFromGroup('notes', i, 'noteCoverData.useRGBShader', true)
                setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-ut')
                setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex('2d1a82'))
                setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex('ad1919'))
            end
        end
    end
end