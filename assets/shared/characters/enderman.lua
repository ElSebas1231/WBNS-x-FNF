function onCreatePost()
    if isRunning('scripts/noteskin') then
        removeLuaScript('scripts/noteskin')
    end
end

function onUpdate()
    if getPropertyFromClass('states.PlayState', 'isPixelStage') then
        for i = 0, 3 do
            setPropertyFromGroup('opponentStrums', i, 'useRGBShader', false)
            setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/NOTE_assets-enderman')
        end

        for i = 0, getProperty('notes.length')-1 do
            if not getPropertyFromGroup('notes', i, 'mustPress') then
                setPropertyFromGroup('notes', i, 'rgbShader.enabled', false)
                setPropertyFromGroup('notes', i, 'noteCoverData.useRGBShader', true)
                setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-enderman')
                setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex('903385'))
                setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex('74296b'))
            end
        end
    end
end