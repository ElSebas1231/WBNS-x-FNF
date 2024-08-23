function onUpdatePost()
    x1 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) + (150 * getProperty('iconP2.scale.x') - 150) / 2 - 26
    x2 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) - (150 * getProperty('iconP1.scale.x')) / 2 - 26 * 2

    setProperty('iconP1.x', x2)
    setProperty('iconP2.x', x1)

    setProperty('healthBar.flipX', true)
    setProperty('iconP1.flipX', true)
    setProperty('iconP2.flipX', true)
end