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
        if not string.find(string.lower(noteSkin), 'mishifu') and noteSkin == 'default' then
            setPropertyFromGroup('playerStrums', i, 'texture', 'noteSkins/NOTE_assets-mishifu')
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
    ['darick'] = {
        {'cdfeff', 'ffffff', 'dbfeff'},
        {'27fbff', 'ffffff', 'b7feff'},
        {'cdfeff', 'ffffff', 'dbfeff'},
        {'27fbff', 'ffffff', 'b7feff'},
    },
    ['lucasta'] = {
        {'b4793c', 'ffffff', 'c49564'},
        {'dfc678', 'ffffff', 'd8bb5d'},
        {'dfc678', 'ffffff', 'd8bb5d'},
        {'b4793c', 'ffffff', 'be8c58'},
    },
    ['mishifu'] = {
        {'0ec520', 'ffffff', '0f984d'},
        {'43fc68', 'ffffff', '16c478'},
        {'43fc68', 'ffffff', '16c478'},
        {'49fc6c', 'ffffff', '18c478'},
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
                if not string.find(string.lower(noteSkin), 'mishifu') and noteSkin == 'default' then
                    if getPropertyFromGroup('notes', i, 'noteType') == '' then
                        if getPropertyFromGroup('notes', i, 'mustPress') then
                            setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-mishifu')
                            setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['mishifu'][noteData + 1][1]))
                            setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['mishifu'][noteData + 1][2]))
                            setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['mishifu'][noteData + 1][3]))
    
                            setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['mishifu'][noteData + 1][1]))
                            setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['mishifu'][noteData + 1][2]))
                            setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['mishifu'][noteData + 1][3]))
                        end
                    end
                end

                if getPropertyFromGroup('notes', i, 'noteType') == 'GF Sing' then
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-lucasta')
                    setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['lucasta'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['lucasta'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['lucasta'][noteData + 1][3]))

                    setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['lucasta'][noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['lucasta'][noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['lucasta'][noteData + 1][3]))
                end
            end
        end

        if gfSection then
            if getPropertyFromGroup('notes', i, 'mustPress') then
                setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-lucasta')
                setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB['lucasta'][noteData + 1][1]))
                setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB['lucasta'][noteData + 1][2]))
                setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB['lucasta'][noteData + 1][3]))

                setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['lucasta'][noteData + 1][1]))
                setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['lucasta'][noteData + 1][2]))
                setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['lucasta'][noteData + 1][3]))
            end
        end

        if not getPropertyFromGroup('notes', i, 'mustPress') then
            if getPropertyFromGroup('notes', i, 'noteType') == '' then
                setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-aquino')
                setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['aquino'][noteData + 1][1]))
                setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['aquino'][noteData + 1][2]))
                setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['aquino'][noteData + 1][3]))
            end

            if getPropertyFromGroup('notes', i, 'noteType') == 'Enemyextra1' then
                setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-darick')
                setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB['darick'][noteData + 1][1]))
                setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB['darick'][noteData + 1][2]))
                setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB['darick'][noteData + 1][3]))
            end
        end
    end
end

function goodNoteHit(index, noteData, noteType, isSustainNote)
    if not string.find(string.lower(noteSkin), 'mishifu') and noteSkin == 'default' then
        if mustHitSection then
            if noteType == '' then
                setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-mishifu')
            end
        end
    else
        setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-'..noteSkin)
    end

    if noteType == 'GF Sing' or gfSection then
        setPropertyFromGroup('playerStrums', noteData, 'texture', 'noteSkins/NOTE_assets-lucasta')
    end
end

function opponentNoteHit(index, noteData, noteType, isSustainNote)
    if not mustHitSection then
        if noteType == '' then
            setPropertyFromGroup('opponentStrums', noteData, 'texture', 'noteSkins/NOTE_assets-aquino')
        end
    end

    if not mustHitSection then
        if noteType == 'Enemyextra1' then
            setPropertyFromGroup('opponentStrums', noteData, 'texture', 'noteSkins/NOTE_assets-darick')
        end
    end
end