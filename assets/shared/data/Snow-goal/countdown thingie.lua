function onCreate()
    if getRandomBool(50) then
        setProperty('introSoundsSuffix', '-duxo')
    else
        setProperty('introSoundsSuffix', '-aquino')
    end
end