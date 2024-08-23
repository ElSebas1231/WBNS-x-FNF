function onCreatePost()
    makeAnimatedLuaSprite('bg1', 'how-badBG/Escenario-cuan_malo_puedo_ser', -100, -120)
    addAnimationByPrefix('bg1', 'idle', 'Escenario-cuan malo puedo ser idle0', 24, true)
    makeLuaSprite('bg2', 'how-badBG/Cielo rojo', -100, -120);
    scaleObject('bg2', 1.8, 1.8)    
    scaleObject('bg1', 1.8, 1.8)
    
    addLuaSprite('bg2', false);
    addLuaSprite('bg1')

    setProperty('dad.alpha', 0.0001)
    setProperty('gf.alpha', 0.0001)
end