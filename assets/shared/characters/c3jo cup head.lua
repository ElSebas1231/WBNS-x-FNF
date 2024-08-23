function onGameOverStart()
    makeAnimatedLuaSprite('ded', 'characters/c3jo taza', 0, 0)
    addAnimationByPrefix('ded', 'death', 'c3jo death 0', 24, true)
    setScrollFactor('ded', 0, 0)
    screenCenter('ded')
    addLuaSprite('ded', true)

    setProperty('ded.velocity.y', -250)
    setProperty('boyfriend.visible', false)

    playSound('cupDeath'..getRandomInt(1, 2), 1, 'ded')
end