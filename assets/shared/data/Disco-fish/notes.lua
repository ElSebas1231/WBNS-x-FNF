function onCreatePost()
    noteSkin = string.lower(getPropertyFromClass('backend.ClientPrefs', 'data.noteSkin'))
    noteSplash = string.lower(getPropertyFromClass('backend.ClientPrefs', 'data.splashSkin'))

    if isRunning('scripts/noteskin') then
        removeLuaScript('scripts/noteskin')
    end
    
    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'useRGBShader', false)
    end
end

local skinsRGB = {
    ['c3jo'] = {
        {'ff6e00', 'ffffff', 'fec216'},
        {'fe3b22', 'ffffff', 'fdad23'},
        {'fe3b22', 'ffffff', 'fdad23'},
        {'ff6e00', 'ffffff', 'fec216'},
    },
    ['hiper'] = {
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
            if not getPropertyFromGroup('notes', i, 'mustPress') then
                if getPropertyFromGroup('notes', i, 'noteType') == '' then
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-c3jo')
                    setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['c3jo'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['c3jo'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['c3jo'][noteData + 1][3]))

                    setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['c3jo'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['c3jo'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['c3jo'][noteData + 1][3]))
                end
            end
        end

        if gfSection then
            if not getPropertyFromGroup('notes', i, 'mustPress') then
                if getPropertyFromGroup('notes', i, 'noteType') == '' then
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets')
                    setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['hiper'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['hiper'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['hiper'][noteData + 1][3]))
    
                    setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['hiper'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['hiper'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['hiper'][noteData + 1][3]))
                end
            end
        end
    end
end

function opponentNoteHit(index, noteData, noteType, isSustainNote)
    setPropertyFromGroup('opponentStrums', noteData, 'texture', 'noteSkins/NOTE_assets-c3jo')
    callMethod('iconP2.changeIcon', {getProperty('dad.healthIcon')})
    setHealthBarColors(rgbToHex(getProperty('dad.healthColorArray')), rgbToHex(getProperty('boyfriend.healthColorArray')))

    if noteType == 'GF Sing' or gfSection then
        callMethod('iconP2.changeIcon', {getProperty('gf.healthIcon')})
        setHealthBarColors(rgbToHex(getProperty('gf.healthColorArray')), rgbToHex(getProperty('boyfriend.healthColorArray')))
        setPropertyFromGroup('opponentStrums', noteData, 'texture', 'noteSkins/NOTE_assets')
    end
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end