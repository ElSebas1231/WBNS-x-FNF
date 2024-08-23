function onCreatePost()
	addHaxeLibrary('Character', 'objects')

	runHaxeCode([[
		var bfLife:Character;
		bfLife = new Character(780, 250, 'bf_life-grande', true);
        bfLife.scrollFactor.set(0.95, 0.95);
		bfLife.scale.set(1.5, 1.5);
		bfLife.alpha = 0.001;
        game.modchartSprites.set('bfLife', bfLife);
        game.add(bfLife);

		var aquinoLife:Character;
		aquinoLife = new Character(250, 150, 'aquino_life-grande', false);
        aquinoLife.scrollFactor.set(0.95, 0.95);
		aquinoLife.scale.set(1.5, 1.5);
		aquinoLife.alpha = 0.001;
        game.modchartSprites.set('aquinoLife', aquinoLife);
        game.add(aquinoLife);
	]])
	setObjectCamera('bfLife', 'hud')
	setObjectCamera('aquinoLife', 'hud')

	setObjectOrder('bfLife', getObjectOrder('topBar') - 1)
	setObjectOrder('aquinoLife', getObjectOrder('bfLife'))
end

function onEvent(n, v1, v2)
	if n == "trail" then
		if v1 == '1' then
			setProperty('bfLife.alpha', 0.45)
			setProperty('aquinoLife.alpha', 0.45)
		end

		if v1 == '0' then
			setProperty('bfLife.alpha', 0.001)
			setProperty('aquinoLife.alpha', 0.001)
		end
	end
end

function goodNoteHit(index, noteData, noteType, isSustainNote)
	playAnim('bfLife', getProperty('singAnimations['..noteData..']'), true)
	setProperty('bfLife.holdTimer', 0)
end

function opponentNoteHit(index, noteData, noteType, isSustainNote)
	playAnim('aquinoLife', getProperty('singAnimations['..noteData..']'), true)
	setProperty('aquinoLife.holdTimer', 0)
end

function onBeatHit()
    if curBeat % 2 == 0 then
        if not getProperty('bfLife.animation.curAnim.name'):find('sing') then
			playAnim('bfLife', 'idle', true)
        end

		if not getProperty('aquinoLife.animation.curAnim.name'):find('sing') then
			playAnim('aquinoLife', 'idle', true)
        end
	end
end