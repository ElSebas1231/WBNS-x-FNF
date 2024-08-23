soulColor = '63269c'
soulScale = 3

-- Script Used in VS CHARA - Remake
-- Modified by ElSebas1231
-- All credits to VS CHARA - Remake devs

function onCreate()
    setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', 'silencio')
    setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'silencio')
    setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'silencio')

    randomX = getRandomInt(-1500,700)
    randomY = getRandomInt(-300,0)
    randomX2 = getRandomInt(-1500,700)
    randomY2 = getRandomInt(-300,0)
    randomX3 = getRandomInt(-1500,700)
    randomY3 = getRandomInt(-300,0)
    randomX4 = getRandomInt(-1500,700)
    randomY4 = getRandomInt(-300,0)
    randomX5 = getRandomInt(-1500,700)
    randomY5 = getRandomInt(-300,0)

    randomTimeX = getRandomFloat(3,6)
    randomTimeX2 = getRandomFloat(3,6)
    randomTimeX3 = getRandomFloat(3,6)
    randomTimeX4 = getRandomFloat(3,6)
    randomTimeX5 = getRandomFloat(3,6)

    randomTimeY = getRandomFloat(0.6, 1.2)
    randomTimeY2 = getRandomFloat(0.6, 1.2)
    randomTimeY3 = getRandomFloat(0.6, 1.2)
    randomTimeY4 = getRandomFloat(0.6, 1.2)
    randomTimeY5 = getRandomFloat(0.6, 1.2)
end

function onGameOverStart()
    runTimer('break', 1)

	makeAnimatedLuaSprite('bfsoul', 'gameOverAssets', 915, 450)
	addAnimationByPrefix('bfsoul', 'SOUL', 'SAUL', 1, false)
	addAnimationByPrefix('bfsoul', 'SOULBREAK', 'SOULBREAK', 1, false)
    playAnim('bfsoul', 'SOUL')
	setObjectCamera('bfsoul', 'hud')
    setProperty('bfsoul.antialiasing', false)
    setProperty('bfsoul.color', getColorFromHex(soulColor))
    scaleObject('bfsoul', soulScale, soulScale)
	addLuaSprite('bfsoul')

    makeLuaSprite('BLACKGAMEOVER', nil, 0, 0);
    makeGraphic('BLACKGAMEOVER', 1280*2, 720*2, '000000');
	setObjectCamera('BLACKGAMEOVER', 'other')
	setProperty('BLACKGAMEOVER.alpha', 0)
	addLuaSprite('BLACKGAMEOVER', true);

    setProperty('boyfriend.visible', false)
end

function onGameOverConfirm(r)
    soundFadeOut('manimdead', 2, 0)
    doTweenAlpha('BLACKNESS', 'BLACKGAMEOVER', 1, 2)
end

function onTweenCompleted(tag)
    if tag == 'pellet1YG' then
        doTweenY('pellet1Y2', 'pellet1', 1250, 2, 'quadIn')
    end
    if tag == 'pellet2YG' then
        doTweenY('pellet2Y2', 'pellet2', 1250, 2, 'quadIn')
    end
    if tag == 'pellet3YG' then
        doTweenY('pellet3Y2', 'pellet3', 1250, 2, 'quadIn')
    end
    if tag == 'pellet4YG' then
        doTweenY('pellet4Y2', 'pellet4', 1250, 2, 'quadIn')
    end
    if tag == 'pellet5YG' then
        doTweenY('pellet5Y2', 'pellet5', 1250, 2, 'quadIn')
    end
end

function onTimerCompleted(tag)
    if tag == 'break' then
        playSound('soulSplit', 1)
        runTimer('shatter', 1.4)
        playAnim('bfsoul', 'SOULBREAK')
    end

    if tag == 'shatter' then
        playSound('soulshatter', 1)
        setProperty('bfsoul.visible', false)
        runTimer('gameOver', 1.7)

        makeAnimatedLuaSprite('pellet1', 'gameOverAssets', getProperty('bfsoul.x'), getProperty('bfsoul.y'))
        addAnimationByPrefix('pellet1', 'petal', 'petals', 8, true)
        setProperty('pellet1.antialiasing', false)
        setProperty('pellet1.color', getColorFromHex(soulColor))
        playAnim('pellet1', 'petal')
        setObjectCamera('pellet1', 'other')
        scaleObject('pellet1', soulScale, soulScale)
        addLuaSprite('pellet1', false)
        doTweenX('pellet1XG', 'pellet1', getProperty('bfsoul.x')+randomX, randomTimeX)
        doTweenY('pellet1YG', 'pellet1', getProperty('bfsoul.y')+randomY, randomTimeY, 'quadOut')

        makeAnimatedLuaSprite('pellet2', 'gameOverAssets', getProperty('bfsoul.x'), getProperty('bfsoul.y'))
        addAnimationByPrefix('pellet2', 'petal', 'petals', 8, true)
        setProperty('pellet2.antialiasing', false)
        setProperty('pellet2.color', getColorFromHex(soulColor))
        setObjectCamera('pellet2', 'other')
        playAnim('pellet2', 'petal')
        scaleObject('pellet2', soulScale, soulScale)
        addLuaSprite('pellet2', false)
        doTweenX('pellet2XG', 'pellet2', getProperty('bfsoul.x')+randomX2, randomTimeX2)
        doTweenY('pellet2YG', 'pellet2', getProperty('bfsoul.y')+randomY2, randomTimeY2, 'quadOut')

        makeAnimatedLuaSprite('pellet3', 'gameOverAssets', getProperty('bfsoul.x'), getProperty('bfsoul.y'))
        addAnimationByPrefix('pellet3', 'petal', 'petals', 8, true)
        setObjectCamera('pellet3', 'other')
        setProperty('pellet3.antialiasing', false)
        setProperty('pellet3.color', getColorFromHex(soulColor))
        playAnim('pellet3', 'petal')
        scaleObject('pellet3', soulScale, soulScale)
        addLuaSprite('pellet3', false)
        doTweenX('pellet3XG', 'pellet3', getProperty('bfsoul.x')+randomX3, randomTimeX3)
        doTweenY('pellet3YG', 'pellet3', getProperty('bfsoul.y')+randomY3, randomTimeY3, 'quadOut')

        makeAnimatedLuaSprite('pellet4', 'gameOverAssets', getProperty('bfsoul.x'), getProperty('bfsoul.y'))
        addAnimationByPrefix('pellet4', 'petal', 'petals', 8, true)
        setProperty('pellet4.antialiasing', false)
        setProperty('pellet4.color', getColorFromHex(soulColor))
        setObjectCamera('pellet4', 'other')
        playAnim('pellet4', 'petal')
        scaleObject('pellet4', soulScale, soulScale)
        addLuaSprite('pellet4', false)
        doTweenX('pellet4XG', 'pellet4', getProperty('bfsoul.x')+randomX4, randomTimeX4)
        doTweenY('pellet4YG', 'pellet4', getProperty('bfsoul.y')+randomY4, randomTimeY4, 'quadOut')

        makeAnimatedLuaSprite('pellet5', 'gameOverAssets', getProperty('bfsoul.x'), getProperty('bfsoul.y'))
        addAnimationByPrefix('pellet5', 'petal', 'petals', 8, true)
        setProperty('pellet5.antialiasing', false)
        setProperty('pellet5.color', getColorFromHex(soulColor))
        setObjectCamera('pellet5', 'other')
        playAnim('pellet5', 'petal')
        scaleObject('pellet5', soulScale, soulScale)
        addLuaSprite('pellet5', false)
        doTweenX('pellet5XG', 'pellet5', getProperty('bfsoul.x')+randomX5, randomTimeX5)
        doTweenY('pellet5YG', 'pellet5', getProperty('bfsoul.y')+randomY5, randomTimeY5, 'quadOut')
    end

    if tag == 'gameOver' then
        playSound('gameOver', 1, 'manimdead')
        runTimer('goText', 1.5)

        makeAnimatedLuaSprite('gameover', 'gameOverAssets', 0, 0)
        screenCenter('gameover', 'x')
        addAnimationByPrefix('gameover', 'GAMEOVER', 'GAMEOVER', 1, false)
        setProperty('gameover.antialiasing', false)
        setObjectCamera('gameover', 'other')
        addLuaSprite('gameover', false)
        setProperty('gameover.alpha', 0)
        doTweenAlpha('gameoverA', 'gameover', 1, 2)
    end
end

function onSoundFinished(tag)
    if tag == 'manimdead' then
        playSound('gameOver', 1, 'manimdead')
    end
end