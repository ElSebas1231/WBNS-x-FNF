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
    ['c3jo'] = {
        {'fec216', 'ffffff', 'ff7402'},
        {'fec216', 'ffffff', 'ff7402'},
        {'fec216', 'ffffff', 'ff7402'},
        {'fec216', 'ffffff', 'ff7402'},
    },
}

function onUpdate()
    for i = 0, getProperty('notes.length')-1 do
        local noteData = getPropertyFromGroup('notes', i, 'noteData')
        setPropertyFromGroup('notes', i, 'rgbShader.enabled', false)
        setPropertyFromGroup('notes', i, 'noteSplashData.useRGBShader', true)
        setPropertyFromGroup('notes', i, 'noteCoverData.useRGBShader', true)
        setPropertyFromGroup('notes', i, 'noteSplashData.texture', 'noteSplashes/noteSplashes-'..noteSplash..'rgb')

        if getPropertyFromGroup('notes', i, 'mustPress') then
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
        end

        if not getPropertyFromGroup('notes', i, 'mustPress') then
            if getPropertyFromGroup('notes', i, 'noteType') == '' then
                if gfSection then
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-duxo')
                    setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['duxo'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['duxo'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['duxo'][noteData + 1][3]))
                else
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-locochon')
                    setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['locochon'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['locochon'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['locochon'][noteData + 1][3]))
                end
            end

            if getPropertyFromGroup('notes', i, 'noteType') == 'Enemyextra1' or getPropertyFromGroup('notes', i, 'noteType') == 'Enemyduo' then
                setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-c3jo')
                setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['c3jo'][noteData + 1][1]))
                setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['c3jo'][noteData + 1][2]))
                setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['c3jo'][noteData + 1][3]))
            end

            if getPropertyFromGroup('notes', i, 'noteType') == 'GF Sing' then
                setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-duxo')
                setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['duxo'][noteData + 1][1]))
                setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['duxo'][noteData + 1][2]))
                setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['duxo'][noteData + 1][3]))
            end
        end
    end
end

function opponentNoteHit(index, noteData, noteType, isSustainNote)
    if noteType == '' then
        if gfSection then
            setPropertyFromGroup('opponentStrums', noteData, 'texture', 'noteSkins/NOTE_assets-duxo')
        else
            setPropertyFromGroup('opponentStrums', noteData, 'texture', 'noteSkins/NOTE_assets-locochon')
        end

        callMethod('iconP2.changeIcon', {getProperty('dad.healthIcon')})
        setHealthBarColors(rgbToHex(getProperty('dad.healthColorArray')), rgbToHex(getProperty('boyfriend.healthColorArray')))
    end

    if noteType == 'GF Sing' or gfSection then
        if not getPropertyFromGroup('notes', index, 'mustPress') then
            if curStep <= 368 or curStep >= 384 then
                callMethod('iconP2.changeIcon', {getProperty('gf.healthIcon')})
                setHealthBarColors(rgbToHex(getProperty('gf.healthColorArray')), rgbToHex(getProperty('boyfriend.healthColorArray')))
            end
            setPropertyFromGroup('opponentStrums', noteData, 'texture', 'noteSkins/NOTE_assets-duxo')
        end
    end

    if noteType == 'Enemyextra1' then
        callMethod('iconP2.changeIcon', {'c3jo_irl_icon'})
        setHealthBarColors('f88349', rgbToHex(getProperty('boyfriend.healthColorArray')))
        setPropertyFromGroup('opponentStrums', noteData, 'texture', 'noteSkins/NOTE_assets-c3jo')
    end

    if noteType == 'Enemyextra2'then
        if curStep <= 408 or curStep >= 448 then
            callMethod('iconP2.changeIcon', {'icon-tomiirl'})
            setHealthBarColors('a5a2a4', rgbToHex(getProperty('boyfriend.healthColorArray')))
        end
        setPropertyFromGroup('opponentStrums', noteData, 'texture', 'noteSkins/NOTE_assets')
    end
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end