function onCreate()
makeAnimatedLuaSprite('nether','fondos/bg c3jo nether/Escenario-C3jo', -350, -150)
addAnimationByPrefix("nether", "idle", 'Escenario-C3jo-Nether idle0', 24 , true)
setScrollFactor('nether', 0.95, 0.95) 
scaleObject('nether', 2.2,2.2)
addLuaSprite('nether')
end