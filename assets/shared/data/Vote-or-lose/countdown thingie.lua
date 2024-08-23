function onCreate()
    if getRandomBool(50) then
        setProperty('introSoundsSuffix', '-locochon')
    elseif getRandomBool(50) then
        setProperty('introSoundsSuffix', '-andreh')
    elseif getRandomBool(50) then
        setProperty('introSoundsSuffix', '-darick')
    else
        setProperty('introSoundsSuffix', '-meica')
    end
end