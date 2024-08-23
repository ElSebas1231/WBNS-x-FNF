function onCreatePost()
    noteSkin = string.lower(getPropertyFromClass('backend.ClientPrefs', 'data.noteSkin'))
    noteSplash = string.lower(getPropertyFromClass('backend.ClientPrefs', 'data.splashSkin'))


    if isRunning('scripts/noteskin') then
        removeLuaScript('scripts/noteskin')
    end
    
    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'useRGBShader', false)
        setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/NOTE_assets-aquino')
        
        setPropertyFromGroup('playerStrums', i, 'useRGBShader', false)
        if not string.find(string.lower(noteSkin), 'locochon') and noteSkin == 'default' then
            setPropertyFromGroup('playerStrums', i, 'texture', 'noteSkins/NOTE_assets-locochon')
        end
    end
end

local skinsRGB = {
    ['aquino'] = {
        {'5f423b', 'ffffff', '3f2721'},
        {'5f423b', 'ffffff', '3f2721'},
        {'5f423b', 'ffffff', '3f2721'},
        {'5f423b', 'ffffff', '3f2721'},
    },
    ['duxo'] = {
        {'d300d0', 'ffffff', 'ad00ce'},
        {'d300d0', 'ffffff', 'ad00ce'},
        {'d300d0', 'ffffff', 'ad00ce'},
        {'d300d0', 'ffffff', 'ad00ce'},
    },
    ['locochon'] = {
        {'666666', 'ffffff', '3e3141'},
        {'666666', 'ffffff', '3e3141'},
        {'666666', 'ffffff', '3e3141'},
        {'666666', 'ffffff', '3e3141'},
    },
    ['natalan'] = {
        {'709cff', 'ffffff', '3f2721'},
        {'709cff', 'ffffff', '3f2721'},
        {'709cff', 'ffffff', '3f2721'},
        {'709cff', 'ffffff', '3f2721'},
    },
}

function onUpdate()
    for i = 0, getProperty('notes.length')-1 do
        setPropertyFromGroup('notes', i, 'rgbShader.enabled', false)
        setPropertyFromGroup('notes', i, 'noteSplashData.useRGBShader', true)
        setPropertyFromGroup('notes', i, 'noteCoverData.useRGBShader', true)
        setPropertyFromGroup('notes', i, 'noteSplashData.texture', 'noteSplashes/noteSplashes-'..noteSplash..'rgb')

        if not gfSection then
            if getPropertyFromGroup('notes', i, 'mustPress') then
                if not string.find(string.lower(noteSkin), 'locochon') and noteSkin == 'default' then
                    if getPropertyFromGroup('notes', i, 'noteType') == '' then
                        if getPropertyFromGroup('notes', i, 'mustPress') then
                            setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-locochon')
                            setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['locochon'][noteData + 1][1]))
                            setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['locochon'][noteData + 1][2]))
                            setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['locochon'][noteData + 1][3]))
    
                            setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['locochon'][noteData + 1][1]))
                            setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['locochon'][noteData + 1][2]))
                            setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['locochon'][noteData + 1][3]))
                        end
                    end
                end

                if getPropertyFromGroup('notes', i, 'noteType') == 'GF Sing' then
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-duxo')
                    setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['duxo'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['duxo'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['duxo'][noteData + 1][3]))

                    setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['duxo'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['duxo'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['duxo'][noteData + 1][3]))
                end

                if getPropertyFromGroup('notes', i, 'noteType') == 'No Animation' then
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

        if gfSection then
            if getPropertyFromGroup('notes', i, 'mustPress') then
                setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-duxo')
                setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['duxo'][noteData + 1][1]))
                setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['duxo'][noteData + 1][2]))
                setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['duxo'][noteData + 1][3]))

                setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['duxo'][noteData + 1][1]))
                setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['duxo'][noteData + 1][2]))
                setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['duxo'][noteData + 1][3]))
            end
        end

        if not getPropertyFromGroup('notes', i, 'mustPress') then
            if getPropertyFromGroup('notes', i, 'noteType') == '' then
                setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-aquino')
                setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['aquino'][noteData + 1][1]))
                setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['aquino'][noteData + 1][2]))
                setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['aquino'][noteData + 1][3]))
            end
        end
    end
end

function goodNoteHit(index, noteData, noteType, isSustainNote)
    if noteType == '' then
        setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-locochon')
    end

    if noteType == 'No Animation' then
        setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-natalan')
    end

    if noteType == 'GF Sing' or gfSection then
        setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-duxo')
    end
end