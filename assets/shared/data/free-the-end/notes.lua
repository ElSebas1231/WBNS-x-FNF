function onCreatePost()
    if isRunning('scripts/noteskin') then
        removeLuaScript('scripts/noteskin')
    end

    noteSkin = string.lower(getPropertyFromClass('backend.ClientPrefs', 'data.noteSkin'))
    noteSplash = string.lower(getPropertyFromClass('backend.ClientPrefs', 'data.splashSkin'))

    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'useRGBShader', false)
        setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/NOTE_assets-aquino')
        setPropertyFromGroup('playerStrums', i, 'useRGBShader', false)

        if noteSkin == 'default' then
            setPropertyFromGroup('playerStrums', i, 'texture', 'noteSkins/NOTE_assets-locochon')
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
        {'cb33ff', 'ffffff', '660089'},
        {'dd79ff', 'ffffff', '9200c4'},
        {'db65ff', 'ffffff', '71009a'},
        {'cc2cfd', 'ffffff', '690084'},
    },
    ['locochon'] = {
        {'666666', 'ffffff', '3e3141'},
        {'666666', 'ffffff', '3e3141'},
        {'666666', 'ffffff', '3e3141'},
        {'666666', 'ffffff', '3e3141'},
    },
    ['soarinng'] = {
        {'ffc36f', 'ffffff', 'ff7d7f'},
        {'ffc36f', 'ffffff', 'ff7d7f'},
        {'ffc36f', 'ffffff', 'ff7d7f'},
        {'ffc36f', 'ffffff', 'ff7d7f'},
    },
}

function onUpdate()
    for i = 0, getProperty('notes.length')-1 do
        local noteData = getPropertyFromGroup('notes', i, 'noteData')
        setPropertyFromGroup('notes', i, 'rgbShader.enabled', false)
        setPropertyFromGroup('notes', i, 'noteSplashData.useRGBShader', true)
        setPropertyFromGroup('notes', i, 'noteSplashData.texture', 'noteSplashes/noteSplashes-'..noteSplash..'rgb')

        if curStep >= 10 and curStep <= 904 then
            if getPropertyFromGroup('notes', i, 'noteType') == '' then
                if getPropertyFromGroup('notes', i, 'mustPress') then
                    if noteSkin == 'default' then
                        setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-locochon')
                        setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['locochon'][noteData + 1][1]))
                        setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['locochon'][noteData + 1][2]))
                        setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['locochon'][noteData + 1][3]))

                        setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['locochon'][noteData + 1][1]))
                        setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['locochon'][noteData + 1][2]))
                        setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['locochon'][noteData + 1][3]))
                    end
                else
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-aquino')
                    setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['aquino'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['aquino'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['aquino'][noteData + 1][3]))
                end
            end

            if getPropertyFromGroup('notes', i, 'noteType') == 'GF Sing' or gfSection then
                setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-soarinng')
                setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['soarinng'][noteData + 1][1]))
                setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['soarinng'][noteData + 1][2]))
                setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['soarinng'][noteData + 1][3]))
            end

            if getPropertyFromGroup('notes', i, 'noteType') == 'Enemyextra1' then
                setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-duxo')
                setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['duxo'][noteData + 1][1]))
                setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['duxo'][noteData + 1][2]))
                setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['duxo'][noteData + 1][3]))

                setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['duxo'][noteData + 1][1]))
                setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['duxo'][noteData + 1][2]))
                setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['duxo'][noteData + 1][3]))
            end
        end

        if curStep >= 904 and curStep <= 1408 or curStep >= 3328 and curStep <= 3632 then
            if noteSkin == 'default' then
                setPropertyFromGroup('playerStrums', i, 'texture', 'noteSkins/NOTE_assets-aquino')
                setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-aquino')
                setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['aquino'][noteData + 1][1]))
                setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['aquino'][noteData + 1][2]))
                setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['aquino'][noteData + 1][3]))

                setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['aquino'][noteData + 1][1]))
                setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['aquino'][noteData + 1][2]))
                setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['aquino'][noteData + 1][3]))
            end
        end

        if curStep >= 1408 and curStep <= 1667 then
            if noteSkin == 'default' then
                for b = 0, 3 do
                    setPropertyFromGroup('playerStrums', b, 'texture', 'noteSkins/NOTE_assets-soarinng')
                end
                setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-soarinng')
                setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['soarinng'][noteData + 1][1]))
                setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['soarinng'][noteData + 1][2]))
                setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['soarinng'][noteData + 1][3]))

                setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['soarinng'][noteData + 1][1]))
                setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['soarinng'][noteData + 1][2]))
                setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['soarinng'][noteData + 1][3]))
            end
        end

        if curStep >= 1667 and curStep <= 2304 then
            for b = 0, 3 do
                setPropertyFromGroup('opponentStrums', b, 'texture', 'noteSkins/NOTE_assets-soarinng')
            end

            if noteSkin == 'default' then
                for b = 0, 3 do
                    setPropertyFromGroup('playerStrums', b, 'texture', 'noteSkins/NOTE_assets-aquino')
                end

                if getPropertyFromGroup('notes', i, 'mustPress') then
                    if getPropertyFromGroup('notes', i, 'noteType') == '' then
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
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-soarinng')
                    setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['soarinng'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['soarinng'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['soarinng'][noteData + 1][3]))
                end
            end
        end

        if curStep >= 2304 and curStep <= 2860 then
            if noteSkin == 'default' then
                for b = 0, 3 do
                    setPropertyFromGroup('playerStrums', b, 'texture', 'noteSkins/NOTE_assets-duxo')
                end
                setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-duxo')
                setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['duxo'][noteData + 1][1]))
                setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['duxo'][noteData + 1][2]))
                setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['duxo'][noteData + 1][3]))

                setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['duxo'][noteData + 1][1]))
                setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['duxo'][noteData + 1][2]))
                setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['duxo'][noteData + 1][3]))
            end
        end

        if curStep >= 2860 and curStep <= 3328 then
            if noteSkin == 'default' then
                for b = 0, 3 do
                    setPropertyFromGroup('playerStrums', b, 'texture', 'noteSkins/NOTE_assets-locochon')
                end
                setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-locochon')
                setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['locochon'][noteData + 1][1]))
                setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['locochon'][noteData + 1][2]))
                setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['locochon'][noteData + 1][3]))

                setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['locochon'][noteData + 1][1]))
                setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['locochon'][noteData + 1][2]))
                setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['locochon'][noteData + 1][3]))
            end
        end

        if curStep >= 3632 and curStep <= 4159 then
            if noteSkin == 'default' then
                if getPropertyFromGroup('notes', i, 'mustPress') then
                    if getPropertyFromGroup('notes', i, 'noteType') == '' then
                        for b = 0, 3 do
                            setPropertyFromGroup('playerStrums', b, 'texture', 'noteSkins/NOTE_assets-duxo')
                        end
                        setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-duxo')
                        setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['duxo'][noteData + 1][1]))
                        setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['duxo'][noteData + 1][2]))
                        setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['duxo'][noteData + 1][3]))
        
                        setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['duxo'][noteData + 1][1]))
                        setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['duxo'][noteData + 1][2]))
                        setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['duxo'][noteData + 1][3]))
                    end
                end
            end

            if not getPropertyFromGroup('notes', i, 'mustPress') then
                if getPropertyFromGroup('notes', i, 'noteType') == '' then
                    for b = 0, 3 do
                        setPropertyFromGroup('opponentStrums', b, 'texture', 'noteSkins/NOTE_assets-aquino')
                    end
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-aquino')    
                    setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['aquino'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['aquino'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['aquino'][noteData + 1][3]))
                end
            end
        end

        if getPropertyFromGroup('notes', i, 'noteType') == 'Soarinng Note' then
            setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-soarinng')
            setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['soarinng'][noteData + 1][1]))
            setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['soarinng'][noteData + 1][2]))
            setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['soarinng'][noteData + 1][3]))

            setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['soarinng'][noteData + 1][1]))
            setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['soarinng'][noteData + 1][2]))
            setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['soarinng'][noteData + 1][3]))
        end

        if getPropertyFromGroup('notes', i, 'noteType') == 'Duxo Note' then
            setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-duxo')
            setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['duxo'][noteData + 1][1]))
            setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['duxo'][noteData + 1][2]))
            setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['duxo'][noteData + 1][3]))

            setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['duxo'][noteData + 1][1]))
            setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['duxo'][noteData + 1][2]))
            setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['duxo'][noteData + 1][3]))
        end

        if getPropertyFromGroup('notes', i, 'noteType') == 'Loco Note' then
            setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-locochon')
            setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['locochon'][noteData + 1][1]))
            setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['locochon'][noteData + 1][2]))
            setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['locochon'][noteData + 1][3]))

            setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['locochon'][noteData + 1][1]))
            setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['locochon'][noteData + 1][2]))
            setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['locochon'][noteData + 1][3]))
        end

        if curStep >= 4159 then
            if noteSkin == 'default' then 
                if getPropertyFromGroup('notes', i, 'noteType') == '' then
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
end

function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    if curStep >= 10 and curStep <= 904 then
        if noteSkin == 'default' then 
            if noteType == '' then
                callMethod('iconP1.changeIcon', {getProperty('boyfriend.healthIcon')})
                setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-locochon')
            end
        else
            setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-'..noteSkin)
        end

        if noteType == 'Enemyextra1' then
            callMethod('iconP1.changeIcon', {getProperty('duxo1.healthIcon')})
            setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-duxo')
        end
    end

    if curStep >= 4159 then
        if noteType == '' then
            if noteSkin == 'default' then 
                setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-aquino')
            else
                setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-'..noteSkin)
            end
            callMethod('iconP1.changeIcon', {getProperty('boyfriend.healthIcon')})
        end
    end

    if noteType == 'Soarinng Note' then
        setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-soarinng')
        callMethod('iconP1.changeIcon', {getProperty('soarinngEnd.healthIcon')})
    end

    if noteType == 'Duxo Note' then
        setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-duxo')
        callMethod('iconP1.changeIcon', {getProperty('duxo2.healthIcon')})
    end

    if noteType == 'Loco Note' then
        setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-locochon')
        callMethod('iconP1.changeIcon', {getProperty('locoEnd.healthIcon')})
    end
end

function goodNoteHit(index, noteData, noteType, isSustainNote)
    if curStep >= 10 and curStep <= 904 then
        if noteType == '' then
            if noteSkin == 'default' then 
                setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-locochon')
            else
                setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-'..noteSkin)
            end
            callMethod('iconP1.changeIcon', {getProperty('boyfriend.healthIcon')})
        end

        if noteType == 'Enemyextra1' then
            callMethod('iconP1.changeIcon', {getProperty('duxo1.healthIcon')})
            setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-duxo')
        end
    end

    if curStep >= 4159 then
        if noteType == '' then
            if noteSkin == 'default' then 
                setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-aquino')
            else
                setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-'..noteSkin)
            end
            callMethod('iconP1.changeIcon', {getProperty('boyfriend.healthIcon')})
        end
    end

    if noteType == 'Soarinng Note' then
        setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-soarinng')
        callMethod('iconP1.changeIcon', {getProperty('soarinngEnd.healthIcon')})
    end

    if noteType == 'Duxo Note' then
        setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-duxo')
        callMethod('iconP1.changeIcon', {getProperty('duxo2.healthIcon')})
    end

    if noteType == 'Loco Note' then
        setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-locochon')
        callMethod('iconP1.changeIcon', {getProperty('locoEnd.healthIcon')})
    end
end

function opponentNoteHit(index, noteData, noteType, isSustainNote)
    if curStep >= 10 and curStep <= 904 then
        if noteType == '' then
            callMethod('iconP2.changeIcon', {getProperty('dad.healthIcon')})
            setPropertyFromGroup('opponentStrums', noteData, 'texture', 'noteSkins/NOTE_assets-aquino')
        end

        if noteType == 'GF Sing' then
            callMethod('iconP2.changeIcon', {getProperty('gf.healthIcon')})
            setPropertyFromGroup('opponentStrums', noteData, 'texture', 'noteSkins/NOTE_assets-soarinng')
        end
    end
end