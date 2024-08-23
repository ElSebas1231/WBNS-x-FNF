function onCreate()
    if getRandomBool(50) then
        setProperty('introSoundsSuffix', '-aquino')
    else
        setProperty('introSoundsSuffix', '-c3jo')
    end
end