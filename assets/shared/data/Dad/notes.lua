function onCreatePost()
    noteSkin = string.lower(getPropertyFromClass('backend.ClientPrefs', 'data.noteSkin'))
    noteSplash = string.lower(getPropertyFromClass('backend.ClientPrefs', 'data.splashSkin'))

    if isRunning('scripts/noteskin') then
        removeLuaScript('scripts/noteskin')
    end
    
    for i = 0, 3 do
        setPropertyFromGroup('playerStrums', i, 'useRGBShader', false)
        if not string.find(string.lower(noteSkin), 'locochon') and noteSkin == 'default' then
            setPropertyFromGroup('playerStrums', i, 'texture', 'noteSkins/NOTE_assets-locochon')
        end
    end
end

local skinsRGB = {
    ['locochon'] = {
        {'666666', 'ffffff', '3e3141'},
        {'666666', 'ffffff', '3e3141'},
        {'666666', 'ffffff', '3e3141'},
        {'666666', 'ffffff', '3e3141'},
    },
    ['estailus'] = {
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

        if not gfSection then
            if not string.find(string.lower(noteSkin), 'locochon') and noteSkin == 'default' then
                if getPropertyFromGroup('notes', i, 'mustPress') then
                    if getPropertyFromGroup('notes', i, 'noteType') == '' then
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
        end

        if gfSection then
            if getPropertyFromGroup('notes', i, 'mustPress') then
                if getPropertyFromGroup('notes', i, 'noteType') == '' then
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets')
                    setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['estailus'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['estailus'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['estailus'][noteData + 1][3]))
    
                    setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['estailus'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['estailus'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['estailus'][noteData + 1][3]))
                end
            end
        end
    end
end

function goodNoteHit(index, noteData, noteType, isSustainNote)
    if mustHitSection then
        if not string.find(string.lower(noteSkin), 'locochon') and noteSkin == 'default' then
            if noteType == '' then
                setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-locochon')
            end
        else
            setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-'..noteSkin)
        end

        callMethod('iconP1.changeIcon', {getProperty('boyfriend.healthIcon')})
        setHealthBarColors(rgbToHex(getProperty('dad.healthColorArray')), rgbToHex(getProperty('boyfriend.healthColorArray')))

        if noteType == 'GF Sing' or gfSection then
            callMethod('iconP1.changeIcon', {getProperty('gf.healthIcon')})
            setHealthBarColors(rgbToHex(getProperty('dad.healthColorArray')), rgbToHex(getProperty('gf.healthColorArray')))
            setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets')
        end
    end

    if not mustHitSection then
        if getPropertyFromGroup('notes', index, 'mustPress') then
            if noteType == 'GF Sing' then
                callMethod('iconP1.changeIcon', {getProperty('gf.healthIcon')})
                setHealthBarColors(rgbToHex(getProperty('dad.healthColorArray')), rgbToHex(getProperty('gf.healthColorArray')))
                setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets')
            elseif noteType == '' then
                if not string.find(string.lower(noteSkin), 'locochon') and noteSkin == 'default' then
                    setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-locochon')
                else
                    setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-'..noteSkin)
                end
                callMethod('iconP1.changeIcon', {getProperty('boyfriend.healthIcon')})
                setHealthBarColors(rgbToHex(getProperty('dad.healthColorArray')), rgbToHex(getProperty('boyfriend.healthColorArray')))
            end
        end
    end
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end