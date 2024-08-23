function onCreate()
    if getRandomBool(50) then
        setProperty('introSoundsSuffix', '-lucasta')
    elseif getRandomBool(50) then
        setProperty('introSoundsSuffix', '-darick')
    else
        setProperty('introSoundsSuffix', '-aquino')
    end
end