--[[
    ¡Hola! Lo que hace básicamente este script es hacer que las splashes cambien ya sea en el nombre
    de la noteskin o en la skin que tengas de notesplashes. El array de skinsRGB es en base a tu noteskin, la lista de skins
    son los nombres de las skins que se búscara para aplicarles los colores deseados, es decir, si quieres agregar tu skin
    con un nombre específico, solo debes agregar el nombre (ya que para agregar una noteskin los archivos deben llamarse NOTE_assets-nombre),
    mientras que la lista de rgbSplashes es en base a tu opción de splashes en los colores rgb.

    Si la skin de noteSplashes están en los colores de RGB, solo agregalo en la lista de rgbSplashes y el archivo
    de txt, png y xml deberán llamarse noteSplashes-(nombre)rgb. Por ejemplo, si tu skin se llama "Electric",
    el los archivos mencionados se llamarán noteSplashes-electricrgb.

    - ElSebas1231
]]

local skins = {'aquino', 'duxo', 'c3jo', 'soarinng', 'locochon', 'natalan', 'enderman', 'andreh',
'mictia', 'meica', 'grimm', 'lucasta', 'compota', 'mishifu', 'darick'}

local rgbSplashes = {
    'electric', 'sparkles', 'diamond'
}

--[[
    ['nombre'] = {
        {'ColorRojo', 'ColorVerde', 'ColorAzul'}, // Nota Izquierda | Right Note
        {'ColorRojo', 'ColorVerde', 'ColorAzul'}, // Nota Abajo | Down Note
        {'ColorRojo', 'ColorVerde', 'ColorAzul'}, // Nota Arriba | Up Note
        {'ColorRojo', 'ColorVerde', 'ColorAzul'}, // Nota Derecha | Left Note
    }
]]

--This should be the rgb values from ClientPrefs, but idk :)

local defaultRGB = {
    {'d4599f', 'ffffff', '2f163f'},
    {'01e4fe', 'ffffff', '041d58'},
    {'03d801', 'ffffff', '003300'},
    {'fe4050', 'ffffff', '44061e'},
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
    ['compota'] = {
        {'6f68e3', 'ffffff', '8e1cad'},
        {'6f68e3', 'ffffff', '8e1cad'},
        {'6f68e3', 'ffffff', '8e1cad'},
        {'6f68e3', 'ffffff', '8e1cad'},
    },
    ['darick'] = {
        {'cdfeff', 'ffffff', 'dbfeff'},
        {'27fbff', 'ffffff', 'b7feff'},
        {'cdfeff', 'ffffff', 'dbfeff'},
        {'27fbff', 'ffffff', 'b7feff'},
    },
}

local pixelSkinsRBG = {
    ['aquino'] = {
        {'8c6f68', 'ffffff', '43261f'},
        {'bb9e97', 'ffffff', '563932'},
        {'af928b', 'ffffff', '482b24'},
        {'886b64', 'ffffff', '43261f'},
    },
    ['duxo'] = {
        {'cb33ff', 'ffffff', '660089'},
        {'dd79ff', 'ffffff', '9200c4'},
        {'db65ff', 'ffffff', '71009a'},
        {'cc2cfd', 'ffffff', '690084'},
    },
    ['c3jo'] = {
        {'ff7640', 'ffffff', 'ed8812'},
        {'ff7640', 'ffffff', 'ed8812'},
        {'ff7640', 'ffffff', 'ed8812'},
        {'ff7640', 'ffffff', 'ed8812'},
    },
    ['soarinng'] = {
        {'f5ad6d', 'ffffff', 'd7b640'},
        {'f5ad6d', 'ffffff', 'd7b640'},
        {'f5ad6d', 'ffffff', 'd7b640'},
        {'f5ad6d', 'ffffff', 'd7b640'},
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
    ['enderman'] = {
        {'903385', 'ffffff', '74296b'},
        {'903385', 'ffffff', '74296b'},
        {'903385', 'ffffff', '74296b'},
        {'903385', 'ffffff', '74296b'},
    },
    ['grimm'] = {
        {'1a1a1a', '8c3034', '1a1a1a'},
        {'1a1a1a', '8c3034', '1a1a1a'},
        {'1a1a1a', '8c3034', '1a1a1a'},
        {'1a1a1a', '8c3034', '1a1a1a'},
    },
    ['lucasta'] = {
        {'dfc678', 'ffffff', 'd8bb5d'},
        {'dfc678', 'ffffff', 'd8bb5d'},
        {'dfc678', 'ffffff', 'd8bb5d'},
        {'dfc678', 'ffffff', 'd8bb5d'},
    },
    ['mictia'] = {
        {'ca8be1', 'ffffff', 'df5eb9'},
        {'ca8be1', 'ffffff', 'df5eb9'},
        {'ca8be1', 'ffffff', 'df5eb9'},
        {'ca8be1', 'ffffff', 'df5eb9'},
    },
    ['andreh'] = {
        {'ff5c8e', 'ffffff', 'ff2e94'},
        {'ff5c8e', 'ffffff', 'ff2e94'},
        {'ff5c8e', 'ffffff', 'ff2e94'},
        {'ff5c8e', 'ffffff', 'ff2e94'},
    },
    ['meica'] = {
        {'15cc7f', 'ffffff', '2cc9a0'},
        {'15cc7f', 'ffffff', '2cc9a0'},
        {'15cc7f', 'ffffff', '2cc9a0'},
        {'15cc7f', 'ffffff', '2cc9a0'},
    },
    ['compota'] = {
        {'6f68e3', 'ffffff', '8e1cad'},
        {'6f68e3', 'ffffff', '8e1cad'},
        {'6f68e3', 'ffffff', '8e1cad'},
        {'6f68e3', 'ffffff', '8e1cad'},
    },
    ['mishifu'] = {
        {'49fc6c', 'ffffff', '18c478'},
        {'49fc6c', 'ffffff', '18c478'},
        {'49fc6c', 'ffffff', '18c478'},
        {'49fc6c', 'ffffff', '18c478'},
    },
    ['darick'] = {
        {'cdfeff', 'ffffff', 'dbfeff'},
        {'27fbff', 'ffffff', 'b7feff'},
        {'cdfeff', 'ffffff', 'dbfeff'},
        {'27fbff', 'ffffff', 'b7feff'},
    },
}

-------------------------------- [Actual Script] --------------------------------

function onCreate()
    noteSkin = string.lower(getPropertyFromClass('backend.ClientPrefs', 'data.noteSkin'))
    noteSplash = string.lower(getPropertyFromClass('backend.ClientPrefs', 'data.splashSkin'))
end

function onUpdate()
    if not inGameOver then
        for s = 1, #rgbSplashes do
            if string.find(string.lower(noteSplash), rgbSplashes[s]) then
                for i = 0, getProperty('notes.length')-1 do
                    local data = getPropertyFromGroup('notes', i, 'noteData')
                    if getPropertyFromGroup('notes', i, 'mustPress') then
                        setPropertyFromGroup('notes', i, 'noteSplashData.useRGBShader', true)
                        setPropertyFromGroup('notes', i, 'noteCoverData.useRGBShader', true)
                        setPropertyFromGroup('notes', i, 'noteSplashData.texture', 'noteSplashes/noteSplashes-'..noteSplash..'rgb')
                        
                        for b = 0, 3 do
                            if getPropertyFromGroup('playerStrums', b, 'texture') == 'noteSkins/NOTE_assets' then
                                setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(defaultRGB[data + 1][1]))
                                setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(defaultRGB[data + 1][2]))
                                setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(defaultRGB[data + 1][3]))
        
                                setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(defaultRGB[data + 1][1]))
                                setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(defaultRGB[data + 1][2]))
                                setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(defaultRGB[data + 1][3]))
                            end
                        end
                    end

                    if not getPropertyFromGroup('notes', i, 'mustPress') then
                        for b = 0, 3 do
                            if getPropertyFromGroup('opponentStrums', b, 'texture') == 'noteSkins/NOTE_assets' then
                                setPropertyFromGroup('notes', i, 'noteCoverData.useRGBShader', true)
                                setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(defaultRGB[data + 1][1]))
                                setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(defaultRGB[data + 1][2]))
                                setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(defaultRGB[data + 1][3]))
                            end
                        end
                    end
                end
            end
        end

        if string.find(string.lower(noteSplash), 'psych') or string.find(string.lower(noteSplash), 'vanilla') then
            for i = 0, getProperty('notes.length')-1 do
                local data = getPropertyFromGroup('notes', i, 'noteData')
                setPropertyFromGroup('notes', i, 'noteCoverData.useRGBShader', true)
                
                if getPropertyFromGroup('notes', i, 'mustPress') then
                    for b = 0, 3 do
                        if getPropertyFromGroup('playerStrums', b, 'texture') == 'noteSkins/NOTE_assets' then
                            setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(defaultRGB[data + 1][1]))
                            setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(defaultRGB[data + 1][2]))
                            setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(defaultRGB[data + 1][3]))
                        end
                    end
                end

                if not getPropertyFromGroup('notes', i, 'mustPress') then
                    for b = 0, 3 do
                        if getPropertyFromGroup('opponentStrums', b, 'texture') == 'noteSkins/NOTE_assets' then
                            setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(defaultRGB[data + 1][1]))
                            setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(defaultRGB[data + 1][2]))
                            setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(defaultRGB[data + 1][3]))
                        end
                    end
                end
            end
        end
            
        for s = 1, #skins do
            if string.find(string.lower(noteSkin), skins[s]) then
                for i = 0, getProperty('notes.length')-1 do
                    local noteData = getPropertyFromGroup('notes', i, 'noteData')

                    if getPropertyFromGroup('opponentStrums', b, 'texture') == 'noteSkins/NOTE_assets-'..skins[s] then
                        setPropertyFromGroup('notes', i, 'noteCoverData.useRGBShader', true)
                        if getPropertyFromClass('states.PlayState', 'isPixelStage') then
                            setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(pixelSkinsRBG[skins[s]][noteData + 1][1]))
                            setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(pixelSkinsRBG[skins[s]][noteData + 1][2]))
                            setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(pixelSkinsRBG[skins[s]][noteData + 1][3]))
                        else
                            setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(skinsRGB[skins[s]][noteData + 1][1]))
                            setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(skinsRGB[skins[s]][noteData + 1][2]))
                            setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(skinsRGB[skins[s]][noteData + 1][3]))
                        end
                    end
                    
                    if getPropertyFromGroup('notes', i, 'mustPress') then
                        setPropertyFromGroup('notes', i, 'rgbShader.enabled', false)
                        setPropertyFromGroup('notes', i, 'noteSplashData.useRGBShader', true)
                        setPropertyFromGroup('notes', i, 'noteCoverData.useRGBShader', true)
                        setPropertyFromGroup('notes', i, 'noteSplashData.texture', 'noteSplashes/noteSplashes-'..noteSplash..'rgb')
                        
                        if getPropertyFromClass('states.PlayState', 'isPixelStage') then
                            setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(pixelSkinsRBG[skins[s]][noteData + 1][1]))
                            setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(pixelSkinsRBG[skins[s]][noteData + 1][2]))
                            setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(pixelSkinsRBG[skins[s]][noteData + 1][3]))

                            setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(pixelSkinsRBG[skins[s]][noteData + 1][1]))
                            setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(pixelSkinsRBG[skins[s]][noteData + 1][2]))
                            setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(pixelSkinsRBG[skins[s]][noteData + 1][3]))
                        else
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