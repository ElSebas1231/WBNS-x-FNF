function onCreatePost()
    noteSkin = string.lower(getPropertyFromClass('backend.ClientPrefs', 'data.noteSkin'))
    noteSplash = string.lower(getPropertyFromClass('backend.ClientPrefs', 'data.splashSkin'))


    if isRunning('scripts/noteskin') then
        removeLuaScript('scripts/noteskin')
    end
    
    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'useRGBShader', false)
        setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/NOTE_assets-duxo')
        
        setPropertyFromGroup('playerStrums', i, 'useRGBShader', false)
        if not string.find(string.lower(noteSkin), 'aquino') and noteSkin == 'default' then
            setPropertyFromGroup('playerStrums', i, 'texture', 'noteSkins/NOTE_assets-aquino')
        end
    end
end

local skinsRGB = {
    ['aquino'] = {
        {'ab9fa2', 'ffffff', '7a6c70'},
        {'5f423b', 'ffffff', '3f2721'},
        {'5f423b', 'ffffff', '3f2721'},
        {'ab9fa2', 'ffffff', '7a6c70'},
    },
    ['duxo'] = {
        {'6500a8', 'ffffff', 'c400c3'},
        {'d300d0', 'ffffff', 'ad00ce'},
        {'d300d0', 'ffffff', 'ad00ce'},
        {'6500a8', 'ffffff', 'c400c3'},
    },
    ['skinstealer'] = {
        {'d4599f', 'ffffff', '2f163f'},
        {'01e4fe', 'ffffff', '041d58'},
        {'03d801', 'ffffff', '003300'},
        {'fe4050', 'ffffff', '44061e'},
    },
}

function onUpdate()
    for i = 0, getProperty('notes.length')-1 do
        local noteData = getPropertyFromGroup('notes', i, 'noteData')
        setPropertyFromGroup('notes', i, 'rgbShader.enabled', false)
        setPropertyFromGroup('notes', i, 'noteSplashData.useRGBShader', true)
        setPropertyFromGroup('notes', i, 'noteCoverData.useRGBShader', true)
        setPropertyFromGroup('notes', i, 'noteSplashData.texture', 'noteSplashes/noteSplashes-'..noteSplash..'rgb')

        if not string.find(string.lower(noteSkin), 'aquino') and noteSkin == 'default' then
            if getPropertyFromGroup('notes', i, 'noteType') == '' then
                if getPropertyFromGroup('notes', i, 'mustPress') then
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-aquino')
                    setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['aquino'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['aquino'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['aquino'][noteData + 1][3]))

                    setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['aquino'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['aquino'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['aquino'][noteData + 1][3]))
                end
            end
        end

        if not getPropertyFromGroup('notes', i, 'mustPress') then
            if getPropertyFromGroup('notes', i, 'noteType') == '' then
                if string.find(string.lower(dadName), 'duxo') then
                    if getPropertyFromGroup('notes', i, 'noteType') == '' then
                        setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-duxo')
                        setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['duxo'][noteData + 1][1]))
                        setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['duxo'][noteData + 1][2]))
                        setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['duxo'][noteData + 1][3]))
                    end
                end
            else
                for i = 0, 3 do
                    setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/NOTE_assets')
                end

                setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['skinstealer'][noteData + 1][1]))
                setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['skinstealer'][noteData + 1][2]))
                setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['skinstealer'][noteData + 1][3]))
            end
        end
    end
end