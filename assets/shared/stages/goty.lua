function onCreate()
    makeLuaSprite('bg1', 'goty/bg1', -100, -340)
    addLuaSprite('bg1')

    makeLuaSprite('bg2', 'goty/bg2', -100, -700)
    scaleObject('bg2', 1.2, 1.2)
    addLuaSprite('bg2', true)
end