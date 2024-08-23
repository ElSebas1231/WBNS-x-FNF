function onCreatePost()
    noteSkin = string.lower(getPropertyFromClass('backend.ClientPrefs', 'data.noteSkin'))
    noteSplash = string.lower(getPropertyFromClass('backend.ClientPrefs', 'data.splashSkin'))


    if isRunning('scripts/noteskin') then
        removeLuaScript('scripts/noteskin')
    end

    for i = 0, 3 do
        setPropertyFromGroup('playerStrums', i, 'useRGBShader', false)
        if noteSkin == 'default' then
            setPropertyFromGroup('playerStrums', i, 'texture', 'noteSkins/NOTE_assets-tomiiPiko')
        end
    end
end

local defaultRGB = {
    {'18b926', '26c734', '062a13'},
    {'18b926', '26c734', '062a13'},
    {'18b926', '26c734', '062a13'},
    {'18b926', '26c734', '062a13'},
}

function onUpdate()
    if getPropertyFromClass('states.PlayState', 'isPixelStage') then
        for i = 0, getProperty('notes.length')-1 do
            local noteData = getPropertyFromGroup('notes', i, 'noteData')
            if noteSkin == 'default' then
                if getPropertyFromGroup('notes', i, 'mustPress') then
                    setPropertyFromGroup('notes', i, 'rgbShader.enabled', false)
                    setPropertyFromGroup('notes', i, 'noteSplashData.useRGBShader', true)
                    setPropertyFromGroup('notes', i, 'noteCoverData.useRGBShader', true)
                    setPropertyFromGroup('notes', i, 'noteSplashData.texture', 'noteSplashes/noteSplashes-'..noteSplash..'rgb')

                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets-tomiiPiko')
                    setPropertyFromGroup('notes', i, 'noteSplashData.r', getColorFromHex(defaultRGB[noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteSplashData.g', getColorFromHex(defaultRGB[noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteSplashData.b', getColorFromHex(defaultRGB[noteData + 1][3]))

                    setPropertyFromGroup('notes', i, 'noteCoverData.r', getColorFromHex(defaultRGB[noteData + 1][1]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.g', getColorFromHex(defaultRGB[noteData + 1][2]))
                    setPropertyFromGroup('notes', i, 'noteCoverData.b', getColorFromHex(defaultRGB[noteData + 1][3]))
                end
            end
        end
    end
end