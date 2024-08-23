--[[
    ¡Hola! Resumiendo lo que hace este script, es dependiendo el nombre del personaje se cambiarán
    las notas, strums y las splashes. Esto se hace automáticamente siempre y cuando dicho nombre esté
    en las dos listas, es decir, en la lista de skins es en donde tu pondrás la skin que se cambiarán las
    notas y strums y en skinsRGB el color de las splashes.

    NOTA: La imagen de la skin deberá llamarse NOTE_assets-nombre, así junto a su xml correspondiente.

    Para agregar los colores de las splashes a tu skin deberás hacer lo siguiente:

    ['nombre'] = {
        {'ColorRojo', 'ColorVerde', 'ColorAzul'}, // Nota Izquierda | Right Note
        {'ColorRojo', 'ColorVerde', 'ColorAzul'}, // Nota Abajo | Down Note
        {'ColorRojo', 'ColorVerde', 'ColorAzul'}, // Nota Arriba | Up Note
        {'ColorRojo', 'ColorVerde', 'ColorAzul'}, // Nota Derecha | Left Note
    }

    Puedes tomar en cuenta por el editor de color de notas del juego del menú de opciones para una mejor
    referencia. Si tu skin de notas está en el formato de los colores de rgb puedes poner true a useRGB.
    Además si quieres usar tu propia skin de noteSplashes sin el formato de rgb, puedes revisar el script "noteSplashes"
    
    - ElSebas1231
]]

local useRGB = false

local skins = {
    'aquino', 'duxo', 'c3jo', 'soarinng', 'natalan', 'enderman', 'andreh',
    'mictia', 'mishifu', 'meica', 'grimm', 'lucasta'
}

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
    ['c3jo'] = {
        {'ff6e00', 'ffffff', 'fec216'},
        {'fe3b22', 'ffffff', 'fdad23'},
        {'fe3b22', 'ffffff', 'fdad23'},
        {'ff6e00', 'ffffff', 'fec216'},
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
    ['natalan'] = {
        {'daf2ff', 'ffffff', '2d268a'},
        {'daf2ff', 'ffffff', '2d268a'},
        {'daf2ff', 'ffffff', '2d268a'},
        {'daf2ff', 'ffffff', '2d268a'},
    },
    ['enderman'] = {
        {'903385', 'ffffff', '74296b'},
        {'903385', 'ffffff', '74296b'},
        {'903385', 'ffffff', '74296b'},
        {'903385', 'ffffff', '74296b'},
    },
    ['grimm'] = {
        {'ffffff', 'ff0619', '000000'},
        {'ffffff', 'ff0619', '000000'},
        {'ffffff', 'ff0619', '000000'},
        {'ffffff', 'ff0619', '000000'},
    },
    ['lucasta'] = {
        {'b4793c', 'ffffff', 'c49564'},
        {'dfc678', 'ffffff', 'd8bb5d'},
        {'dfc678', 'ffffff', 'd8bb5d'},
        {'b4793c', 'ffffff', 'be8c58'},
    },
    ['mictia'] = {
        {'7c43b5', 'ffffff', 'bf53ad'},
        {'ca8be1', 'ffffff', 'df5eb9'},
        {'ca8be1', 'ffffff', 'df5eb9'},
        {'7c43b5', 'ffffff', 'bf53ad'},
    },
    ['mishifu'] = {
        {'0ec520', 'ffffff', '0f984d'},
        {'43fc68', 'ffffff', '16c478'},
        {'43fc68', 'ffffff', '16c478'},
        {'49fc6c', 'ffffff', '18c478'},
    },
    ['andreh'] = {
        {'fe6fa8', 'ffffff', 'f39588'},
        {'a62a52', 'ffffff', 'b56e48'},
        {'fe6fa8', 'ffffff', 'f39588'},
        {'a62a52', 'ffffff', 'b56e48'},
    },
    ['meica'] = {
        {'2a5f6d', 'ffffff', '3f7d9b'},
        {'13cc7c', 'ffffff', '2cc9a0'},
        {'13cc7c', 'ffffff', '2cc9a0'},
        {'77474e', 'ffffff', '737591'},
    },
}

function onCreatePost()
    noteSkin = string.lower(getPropertyFromClass('backend.ClientPrefs', 'data.noteSkin'))
    noteSplash = string.lower(getPropertyFromClass('backend.ClientPrefs', 'data.splashSkin'))

    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'useRGBShader', useRGB)
        setPropertyFromGroup('playerStrums', i, 'useRGBShader', useRGB)
    end
end

function onUpdate()
    if not inGameOver then
        if not useRGB then
            for i = 0, getProperty('notes.length')-1 do
                noteData = getPropertyFromGroup('notes', i, 'noteData')
                setPropertyFromGroup('notes', i, 'rgbShader.enabled', false)
                setPropertyFromGroup('notes', i, 'noteSplashData.useRGBShader', false)
                setPropertyFromGroup('notes', i, 'noteCoverData.useRGBShader', false)
            end
        end

----------------------------------- [Manual tweaks for weirds names] ---------------------------------

        if string.find(string.lower(dadName), 'loco') then
            for i = 0, 3 do
                setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/NOTE_assets-locochon')
            end
    
            for i = 0, getProperty('notes.length')-1 do
                if not getPropertyFromGroup('notes', i, 'mustPress') then
                    if getPropertyFromGroup('notes', i, 'noteType') == '' or getPropertyFromGroup('notes', i, 'noteType') == 'Alt Animation' 
                    or getPropertyFromGroup('notes', i, 'noteType') == 'No Animation' or gfSection or getPropertyFromGroup('notes', i, 'noteType') == 'GF Sing' then
                        setPropertyFromGroup('notes', i, 'rgbShader.enabled', false)
                        setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-locochon')

                        setPropertyFromGroup('notes', i, 'noteCoverData.useRGBShader', true)
                        setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex('666666'))
                        setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex('ffffff'))
                        setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex('3e3141'))
                    end
                end
            end
        end

        if not string.find(string.lower(boyfriendName), string.lower('bf')) then
            if string.find(string.lower(boyfriendName), 'loco') then
                if not string.find(string.lower(noteSkin), 'locochon') and noteSkin == 'default' then
                    for i = 0, 3 do
                        setPropertyFromGroup('playerStrums', i, 'texture', 'noteSkins/NOTE_assets-locochon')
                    end
            
                    for i = 0, getProperty('notes.length')-1 do
                        if getPropertyFromGroup('notes', i, 'mustPress') then
                            if getPropertyFromGroup('notes', i, 'noteType') == '' or getPropertyFromGroup('notes', i, 'noteType') == 'Alt Animation' 
                            or getPropertyFromGroup('notes', i, 'noteType') == 'No Animation' or gfSection or getPropertyFromGroup('notes', i, 'noteType') == 'GF Sing' then
                                setPropertyFromGroup('notes', i, 'rgbShader.enabled', false)
                                setPropertyFromGroup('notes', i, 'noteSplashData.useRGBShader', true)
                                setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-locochon')
                                setPropertyFromGroup('notes', i, 'noteSplashData.texture', 'noteSplashes/noteSplashes-'..noteSplash..'rgb')
                                setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex('666666'))
                                setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex('ffffff'))
                                setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex('3e3141'))

                                setPropertyFromGroup('notes', i, 'noteCoverData.useRGBShader', true)
                                setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex('666666'))
                                setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex('ffffff'))
                                setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex('3e3141'))
                            end
                        end
                    end
                end
            end
        end

        if string.find(string.lower(dadName), 'cejo') then
            for i = 0, 3 do
                setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/NOTE_assets-c3jo')
            end
    
            for i = 0, getProperty('notes.length')-1 do
                if not getPropertyFromGroup('notes', i, 'mustPress') then
                    if getPropertyFromGroup('notes', i, 'noteType') == '' or getPropertyFromGroup('notes', i, 'noteType') == 'Alt Animation' 
                    or getPropertyFromGroup('notes', i, 'noteType') == 'No Animation' or gfSection or getPropertyFromGroup('notes', i, 'noteType') == 'GF Sing' then
                        setPropertyFromGroup('notes', i, 'rgbShader.enabled', false)
                        setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-c3jo')

                        setPropertyFromGroup('notes', i, 'noteCoverData.useRGBShader', true)
                        setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex('fec216'))
                        setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex('ffffff'))
                        setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex('ff7402'))
                    end
                end
            end
        end
    
        if not string.find(string.lower(boyfriendName), string.lower('bf')) then
            if string.find(string.lower(boyfriendName), 'cejo') then
                if not string.find(string.lower(noteSkin), 'c3jo') and noteSkin == 'default' then
                    for i = 0, 3 do
                        setPropertyFromGroup('playerStrums', i, 'texture', 'noteSkins/NOTE_assets-c3jo')
                    end
            
                    for i = 0, getProperty('notes.length')-1 do
                        if getPropertyFromGroup('notes', i, 'mustPress') then
                            if getPropertyFromGroup('notes', i, 'noteType') == '' or getPropertyFromGroup('notes', i, 'noteType') == 'Alt Animation' 
                            or getPropertyFromGroup('notes', i, 'noteType') == 'No Animation' or gfSection or getPropertyFromGroup('notes', i, 'noteType') == 'GF Sing' then
                                setPropertyFromGroup('notes', i, 'rgbShader.enabled', false)
                                setPropertyFromGroup('notes', i, 'noteSplashData.useRGBShader', true)
                                setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-c3jo')
                                setPropertyFromGroup('notes', i, 'noteSplashData.texture', 'noteSplashes/noteSplashes-'..noteSplash..'rgb')
                                setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex('fec216'))
                                setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex('ffffff'))
                                setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex('ff7402'))

                                setPropertyFromGroup('notes', i, 'noteCoverData.useRGBShader', true)
                                setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex('fec216'))
                                setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex('ffffff'))
                                setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex('ff7402'))
                            end
                        end
                    end
                end
            end
        end

        if string.find(string.lower(dadName), 'soaring') then
            for i = 0, 3 do
                setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/NOTE_assets-soarinng')
            end
    
            for i = 0, getProperty('notes.length')-1 do
                if not getPropertyFromGroup('notes', i, 'mustPress') then
                    if getPropertyFromGroup('notes', i, 'noteType') == '' or getPropertyFromGroup('notes', i, 'noteType') == 'Alt Animation' 
                    or getPropertyFromGroup('notes', i, 'noteType') == 'No Animation' or gfSection or getPropertyFromGroup('notes', i, 'noteType') == 'GF Sing' then
                        setPropertyFromGroup('notes', i, 'rgbShader.enabled', false)
                        setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-soarinng')

                        setPropertyFromGroup('notes', i, 'noteCoverData.useRGBShader', true)
                        setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex('eae23f'))
                        setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex('ffffff'))
                        setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex('5f3b14'))
                    end
                end
            end
        end
    
        if not string.find(string.lower(boyfriendName), string.lower('bf')) then
            if string.find(string.lower(boyfriendName), 'soaring') then
                if not string.find(string.lower(noteSkin), 'soarinng') and noteSkin == 'default' then
                    for i = 0, 3 do
                        setPropertyFromGroup('playerStrums', i, 'texture', 'noteSkins/NOTE_assets-soarinng')
                    end
            
                    for i = 0, getProperty('notes.length')-1 do
                        if getPropertyFromGroup('notes', i, 'mustPress') then
                            if getPropertyFromGroup('notes', i, 'noteType') == '' or getPropertyFromGroup('notes', i, 'noteType') == 'Alt Animation' 
                            or getPropertyFromGroup('notes', i, 'noteType') == 'No Animation' or gfSection or getPropertyFromGroup('notes', i, 'noteType') == 'GF Sing' then
                                setPropertyFromGroup('notes', i, 'rgbShader.enabled', false)
                                setPropertyFromGroup('notes', i, 'noteSplashData.useRGBShader', true)
                                setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-soarinng')
                                setPropertyFromGroup('notes', i, 'noteSplashData.texture', 'noteSplashes/noteSplashes-'..noteSplash..'rgb')
                                setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex('eae23f'))
                                setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex('ffffff'))
                                setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex('5f3b14'))

                                setPropertyFromGroup('notes', i, 'noteCoverData.useRGBShader', true)
                                setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex('eae23f'))
                                setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex('ffffff'))
                                setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex('5f3b14'))
                            end
                        end
                    end
                end
            end
        end

-------------------------------------- [Important Stuff below] -------------------------------------------------
    
        for s = 1, #skins do
            if string.find(string.lower(dadName), skins[s]) then
                for i = 0, 3 do
                    setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/NOTE_assets-'..skins[s])
                end
        
                for i = 0, getProperty('notes.length')-1 do
                    if not getPropertyFromGroup('notes', i, 'mustPress') then
                        if getPropertyFromGroup('notes', i, 'noteType') == '' or getPropertyFromGroup('notes', i, 'noteType') == 'Alt Animation' 
                        or getPropertyFromGroup('notes', i, 'noteType') == 'No Animation' or gfSection or getPropertyFromGroup('notes', i, 'noteType') == 'GF Sing' then
                            setPropertyFromGroup('notes', i, 'rgbShader.enabled', false)
                            setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-'..skins[s])

                            setPropertyFromGroup('notes', i, 'noteCoverData.useRGBShader', true)
                            setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB[skins[s]][noteData + 1][1]))
                            setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB[skins[s]][noteData + 1][2]))
                            setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB[skins[s]][noteData + 1][3]))
                        end
                    end
                end
            end
    
            if not string.find(string.lower(boyfriendName), string.lower('bf')) then
                if string.find(string.lower(boyfriendName), skins[s]) then
                    if not string.find(string.lower(noteSkin), skins[s]) and noteSkin == 'default' then
                        for i = 0, 3 do
                            setPropertyFromGroup('playerStrums', i, 'texture', 'noteSkins/NOTE_assets-'..skins[s])
                        end
                
                        for i = 0, getProperty('notes.length')-1 do
                            if getPropertyFromGroup('notes', i, 'mustPress') then
                                if getPropertyFromGroup('notes', i, 'noteType') == '' or getPropertyFromGroup('notes', i, 'noteType') == 'Alt Animation' 
                                or getPropertyFromGroup('notes', i, 'noteType') == 'No Animation' or gfSection or getPropertyFromGroup('notes', i, 'noteType') == 'GF Sing' then
                                    setPropertyFromGroup('notes', i, 'rgbShader.enabled', false)
                                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-'..skins[s])
                                    setPropertyFromGroup('notes', i, 'noteSplashData.useRGBShader', true)
                                    setPropertyFromGroup('notes', i, 'noteSplashData.texture', 'noteSplashes/noteSplashes-'..noteSplash..'rgb')
                                    setPropertyFromGroup('notes', i, 'noteCoverData.useRGBShader', true)
                                    
                                    setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(skinsRGB[skins[s]][noteData + 1][1]))
                                    setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(skinsRGB[skins[s]][noteData + 1][2]))
                                    setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(skinsRGB[skins[s]][noteData + 1][3]))

                                    setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB[skins[s]][noteData + 1][1]))
                                    setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB[skins[s]][noteData + 1][2]))
                                    setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB[skins[s]][noteData + 1][3]))
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end