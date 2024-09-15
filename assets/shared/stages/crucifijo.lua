function onCreate()
    makeAnimatedLuaSprite('bg', 'crucifijo/Escenario-Lucasta-Amarrado', -340, -100)
    addAnimationByPrefix('bg', 'idle', 'Escenario-Lucasta-Amarrado idle', 24, true)
    scaleObject('bg', 1.6, 1.6)
    setProperty('bg.antialiasing', true)
    addLuaSprite('bg')

    makeLuaSprite('cadenas', 'crucifijo/Cadenas-Lucasta-Amarrado', 205, -30)
    scaleObject('cadenas', 1.6, 1.6)
    setProperty('cadenas.antialiasing', true)
    addLuaSprite('cadenas', true)

    makeLuaSprite('tela', 'crucifijo/Telarana-Lucasta-Amarrado', 440, 150)
    scaleObject('tela', 1.6, 1.6)
    setProperty('tela.antialiasing', true)
    setObjectOrder('tela', 3)
    addLuaSprite('tela')
end