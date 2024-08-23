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
        if not string.find(string.lower(noteSkin), 'locochon') and noteSkin == 'default' then
            setPropertyFromGroup('playerStrums', i, 'texture', 'noteSkins/NOTE_assets-locochon')
        end
    end
end

local skinsRGB = {
    ['duxo'] = {
        {'d300d0', 'ffffff', 'ad00ce'},
        {'d300d0', 'ffffff', 'ad00ce'},
        {'d300d0', 'ffffff', 'ad00ce'},
        {'d300d0', 'ffffff', 'ad00ce'},
    },
    ['soarinng'] = {
        {'eae23f', 'ffffff', '5f3b14'},
        {'eae23f', 'ffffff', '5f3b14'},
        {'eae23f', 'ffffff', '5f3b14'},
        {'eae23f', 'ffffff', '5f3b14'},
    },
    ['locochon'] = {
        {'666666', 'ffffff', '3e3141'},
        {'666666', 'ffffff', '3e3141'},
        {'666666', 'ffffff', '3e3141'},
        {'666666', 'ffffff', '3e3141'},
    },
}

function onUpdate()
    for i = 0, getProperty('notes.length')-1 do
        local noteData = getPropertyFromGroup('notes', i, 'noteData')
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
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-soarinng')
                    setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['soarinng'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['soarinng'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['soarinng'][noteData + 1][3]))
    
                    setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['soarinng'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['soarinng'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['soarinng'][noteData + 1][3]))
                end
            end
        end

        if gfSection then
            if getPropertyFromGroup('notes', i, 'mustPress') then
                if getPropertyFromGroup('notes', i, 'noteType') == 'No Animation' or getPropertyFromGroup('notes', i, 'noteType') == 'Alt Animation' then
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-soarinng')
                    setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['soarinng'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['soarinng'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['soarinng'][noteData + 1][3]))
    
                    setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['soarinng'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['soarinng'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['soarinng'][noteData + 1][3]))
                else
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-soarinng')
                    setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['soarinng'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['soarinng'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['soarinng'][noteData + 1][3]))
    
                    setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['soarinng'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['soarinng'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['soarinng'][noteData + 1][3]))
                end
            end
        end

        if not getPropertyFromGroup('notes', i, 'mustPress') then
            setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-duxo')
            setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['duxo'][noteData + 1][1]))
            setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['duxo'][noteData + 1][2]))
            setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['duxo'][noteData + 1][3]))
        end
    end
end


function goodNoteHit(index, noteData, noteType, isSustainNote)
    if not string.find(string.lower(noteSkin), 'locochon') and noteSkin == 'default' then
        if mustHitSection then
            if noteType == '' then
                setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-locochon')
            end
        end
    else
        setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-'..noteSkin)
    end

    if noteType == 'GF Sing' or gfSection then
        setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-soarinng')
    end
end