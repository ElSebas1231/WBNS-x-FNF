function onCreatePost()
    noteSkin = string.lower(getPropertyFromClass('backend.ClientPrefs', 'data.noteSkin'))
    noteSplash = string.lower(getPropertyFromClass('backend.ClientPrefs', 'data.splashSkin'))

    if isRunning('scripts/noteskin') then
        removeLuaScript('scripts/noteskin')
    end

    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'useRGBShader', false)
        setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/NOTE_assets-locochon')
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
    ['natalan'] = {
        {'709cff', 'ffffff', '3f2721'},
        {'709cff', 'ffffff', '3f2721'},
        {'709cff', 'ffffff', '3f2721'},
        {'709cff', 'ffffff', '3f2721'},
    },
}

function onUpdate()
    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'useRGBShader', false)
        setPropertyFromGroup('playerStrums', i, 'useRGBShader', false)
    end

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

        if getPropertyFromGroup('notes', i, 'noteType') == 'GF Sing' or gfSection then
            setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-natalan')
            setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['natalan'][noteData + 1][1]))
            setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['natalan'][noteData + 1][2]))
            setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['natalan'][noteData + 1][3]))

            setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['natalan'][noteData + 1][1]))
            setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['natalan'][noteData + 1][2]))
            setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['natalan'][noteData + 1][3]))
        end

        if getPropertyFromGroup('notes', i, 'noteType') == 'Alt Animation' then
            setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-soarinng')
            setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['soarinng'][noteData + 1][1]))
            setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['soarinng'][noteData + 1][2]))
            setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['soarinng'][noteData + 1][3]))

            setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['soarinng'][noteData + 1][1]))
            setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['soarinng'][noteData + 1][2]))
            setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['soarinng'][noteData + 1][3]))
        end

        if not getPropertyFromGroup('notes', i, 'mustPress') then
            if getPropertyFromGroup('notes', i, 'noteType') == '' then
                setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-locochon')
                setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['locochon'][noteData + 1][1]))
                setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['locochon'][noteData + 1][2]))
                setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['locochon'][noteData + 1][3]))
            end
        end
    end
end


function goodNoteHit(index, noteData, noteType, isSustainNote)
    if not string.find(string.lower(noteSkin), 'aquino') and noteSkin == 'default' then
        if noteType == '' then
            if curStep <= 320 or curStep >= 352 then
                callMethod('iconP1.changeIcon', {getProperty('boyfriend.healthIcon')})
                setHealthBarColors(rgbToHex(getProperty('dad.healthColorArray')), rgbToHex(getProperty('boyfriend.healthColorArray')))
            end
            setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-aquino')
        end
    else
        if curStep <= 320 or curStep >= 352 then
            callMethod('iconP1.changeIcon', {getProperty('boyfriend.healthIcon')})
            setHealthBarColors(rgbToHex(getProperty('dad.healthColorArray')), rgbToHex(getProperty('boyfriend.healthColorArray')))
        end
        setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-'..noteSkin)
    end

    if noteType == 'Alt Animation' then
        if curStep <= 320 or curStep >= 352 then
            callMethod('iconP1.changeIcon', {getProperty('SoaringMX.healthIcon')})
            setHealthBarColors(rgbToHex(getProperty('dad.healthColorArray')), rgbToHex(getProperty('SoaringMX.healthColorArray')))
        end
        setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-soarinng')
    end

    if noteType == 'GF Sing' then
        if curStep <= 320 or curStep >= 352 then
            callMethod('iconP1.changeIcon', {getProperty('gf.healthIcon')})
            setHealthBarColors(rgbToHex(getProperty('dad.healthColorArray')), rgbToHex(getProperty('gf.healthColorArray')))
        end
        setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-natalan')
    end
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end