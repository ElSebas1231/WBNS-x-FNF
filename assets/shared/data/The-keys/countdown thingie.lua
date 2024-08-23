function onCreate()
    if getRandoBool(50) then
        setProperty('introSoundsSuffix', '-darick')
    else
        setProperty('introSoundsSuffix', '-mictia')
    end
end