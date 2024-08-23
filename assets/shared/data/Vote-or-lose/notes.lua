function onCreatePost()
    noteSkin = string.lower(getPropertyFromClass('backend.ClientPrefs', 'data.noteSkin'))
    noteSplash = string.lower(getPropertyFromClass('backend.ClientPrefs', 'data.splashSkin'))

    if isRunning('scripts/noteskin') then
        removeLuaScript('scripts/noteskin')
    end
    
    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'useRGBShader', false)
        setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/NOTE_assets-andreh')
        
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
    ['meica'] = {
        {'2a5f6d', 'ffffff', '3f7d9b'},
        {'13cc7c', 'ffffff', '2cc9a0'},
        {'13cc7c', 'ffffff', '2cc9a0'},
        {'77474e', 'ffffff', '737591'},
    },
    ['andreh'] = {
        {'fe6fa8', 'ffffff', 'f39588'},
        {'a62a52', 'ffffff', 'b56e48'},
        {'fe6fa8', 'ffffff', 'f39588'},
        {'a62a52', 'ffffff', 'b56e48'},
    },
    ['darick'] = {
        {'cdfeff', 'ffffff', 'dbfeff'},
        {'27fbff', 'ffffff', 'b7feff'},
        {'cdfeff', 'ffffff', 'dbfeff'},
        {'27fbff', 'ffffff', 'b7feff'},
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
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-meica')
                    setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['meica'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['meica'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['meica'][noteData + 1][3]))

                    setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['meica'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['meica'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['meica'][noteData + 1][3]))
                end
            end

            if not getPropertyFromGroup('notes', i, 'mustPress') then
                if getPropertyFromGroup('notes', i, 'noteType') == '' then
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-andreh')

                    setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['andreh'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['andreh'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['andreh'][noteData + 1][3]))
                end

                if getPropertyFromGroup('notes', i, 'noteType') == 'Enemyextra1' or getPropertyFromGroup('notes', i, 'noteType') == 'Enemyduo' then
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-darick')

                    setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['darick'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['darick'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['darick'][noteData + 1][3]))
                end
            end
        end

        if gfSection then
            if getPropertyFromGroup('notes', i, 'mustPress') then
                if getPropertyFromGroup('notes', i, 'noteType') == '' or getPropertyFromGroup('notes', i, 'noteType') == 'GF Sing' then
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-meica')
                    setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['meica'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['meica'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['meica'][noteData + 1][3]))

                    setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['meica'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['meica'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['meica'][noteData + 1][3]))
                end
            end

            if not getPropertyFromGroup('notes', i, 'mustPress') then
                if getPropertyFromGroup('notes', i, 'noteType') == '' then
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-andreh')

                    setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['andreh'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['andreh'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['andreh'][noteData + 1][3]))
                end
            end
        end
    end
end

function goodNoteHit(index, noteData, noteType, isSustainNote)
    if mustHitSection then
        if noteType == 'GF Sing' or gfSection then
            setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-meica')
            
            if getProperty('iconP2.char') == 'andreh_sus_icon' then
                callMethod('iconP1.changeIcon', {getProperty('gf.healthIcon')})
                setHealthBarColors(rgbToHex(getProperty('dad.healthColorArray')), rgbToHex(getProperty('gf.healthColorArray')))
            elseif getProperty('iconP2.char') == 'darick_sus_icon' then
                callMethod('iconP1.changeIcon', {getProperty('gf.healthIcon')})
                setHealthBarColors(rgbToHex(getProperty('tragadick.healthColorArray')), rgbToHex(getProperty('gf.healthColorArray')))
            end
        elseif noteType == '' then
            if not string.find(string.lower(noteSkin), 'locochon') and noteSkin == 'default' then
                setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-locochon')
            else
                setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-'..noteSkin)
            end

            if getProperty('iconP2.char') == 'andreh_sus_icon' then
                callMethod('iconP1.changeIcon', {getProperty('boyfriend.healthIcon')})
                setHealthBarColors(rgbToHex(getProperty('dad.healthColorArray')), rgbToHex(getProperty('boyfriend.healthColorArray')))
            elseif getProperty('iconP2.char') == 'darick_sus_icon' then
                callMethod('iconP1.changeIcon', {getProperty('boyfriend.healthIcon')})
                setHealthBarColors(rgbToHex(getProperty('tragadick.healthColorArray')), rgbToHex(getProperty('boyfriend.healthColorArray')))
            end
        end
    end

    if not mustHitSection then
        if getPropertyFromGroup('notes', index, 'mustPress') then
            if noteType == 'GF Sing' or gfSection  then
                setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-meica')

                if getProperty('iconP2.char') == 'andreh_sus_icon' then
                    callMethod('iconP1.changeIcon', {getProperty('gf.healthIcon')})
                    setHealthBarColors(rgbToHex(getProperty('dad.healthColorArray')), rgbToHex(getProperty('gf.healthColorArray')))
                elseif getProperty('iconP2.char') == 'darick_sus_icon' then
                    callMethod('iconP1.changeIcon', {getProperty('gf.healthIcon')})
                    setHealthBarColors(rgbToHex(getProperty('tragadick.healthColorArray')), rgbToHex(getProperty('gf.healthColorArray')))
                end
            elseif noteType == '' then
                if not string.find(string.lower(noteSkin), 'locochon') and noteSkin == 'default' then
                    setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-locochon')
                else
                    setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-'..noteSkin)
                end

                if getProperty('iconP2.char') == 'andreh_sus_icon' then
                    callMethod('iconP1.changeIcon', {getProperty('boyfriend.healthIcon')})
                    setHealthBarColors(rgbToHex(getProperty('dad.healthColorArray')), rgbToHex(getProperty('boyfriend.healthColorArray')))
                elseif getProperty('iconP2.char') == 'darick_sus_icon' then
                    callMethod('iconP1.changeIcon', {getProperty('boyfriend.healthIcon')})
                    setHealthBarColors(rgbToHex(getProperty('tragadick.healthColorArray')), rgbToHex(getProperty('boyfriend.healthColorArray')))
                end
            end
        end
    end
end

function opponentNoteHit(index, noteData, noteType, isSustainNote)
    if noteType == '' then
        setPropertyFromGroup('opponentStrums', noteData, 'texture', 'noteSkins/NOTE_assets-andreh')

        if getProperty('iconP1.char') == 'loco_sus_icon' then
            callMethod('iconP2.changeIcon', {getProperty('dad.healthIcon')})
            setHealthBarColors(rgbToHex(getProperty('dad.healthColorArray')), rgbToHex(getProperty('boyfriend.healthColorArray')))
        elseif getProperty('iconP1.char') == 'icon-meicasus' then
            callMethod('iconP2.changeIcon', {getProperty('dad.healthIcon')})
            setHealthBarColors(rgbToHex(getProperty('dad.healthColorArray')), rgbToHex(getProperty('gf.healthColorArray')))
        end
    end

    if noteType == 'Enemyextra1' or noteType == 'Enemyduo' then
        setPropertyFromGroup('opponentStrums', noteData, 'texture', 'noteSkins/NOTE_assets-darick')

        if getProperty('iconP1.char') == 'loco_sus_icon' then
            callMethod('iconP2.changeIcon', {getProperty('tragadick.healthIcon')})
            setHealthBarColors(rgbToHex(getProperty('tragadick.healthColorArray')), rgbToHex(getProperty('boyfriend.healthColorArray')))
        elseif getProperty('iconP1.char') == 'icon-meicasus' then
            callMethod('iconP2.changeIcon', {getProperty('tragadick.healthIcon')})
            setHealthBarColors(rgbToHex(getProperty('tragadick.healthColorArray')), rgbToHex(getProperty('gf.healthColorArray')))
        end
    end
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end