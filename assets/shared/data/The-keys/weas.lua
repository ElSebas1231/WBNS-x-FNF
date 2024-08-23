function onCreate()
	opponentStrums = getPropertyFromClass('backend.ClientPrefs', 'data.opponentStrums')
	timeBarTypeOG = getPropertyFromClass('backend.ClientPrefs', 'data.timeBarType')

	if opponentStrums then
		setPropertyFromClass('backend.ClientPrefs', 'data.opponentStrums', false)
	end

	if not middlescroll then
		setPropertyFromClass('backend.ClientPrefs', 'data.middleScroll', true)
	end
end

function onDestroy()
	if not middlescroll then
		setPropertyFromClass('backend.ClientPrefs', 'data.middleScroll', false)
	end
	
	setPropertyFromClass('backend.ClientPrefs', 'data.opponentStrums', opponentStrums)
end

local zoomshit = 0;
function onUpdate()
    zoomshit = (getProperty('camGame.zoom')/0.8);
    setCharacterX('boyfriend',bfx*zoomshit)
    setCharacterY('boyfriend',bfy*zoomshit)
end

local invBar = false
function onUpdatePost()
    if mustHitSection then 
        setProperty('defaultCamZoom', 1.2)
        doTweenAlpha("waza8", 'dad', 0.5, 0.5, "linear")
        doTweenAlpha("waza9", 'gf', 0.5, 0.5, "linear")
    else
        setProperty('defaultCamZoom', 0.8)
        doTweenAlpha("waza8", 'dad', 1, 0.15, "linear")
        doTweenAlpha("waza9", 'gf', 1, 0.15, "linear")
    end

    if gfSection then 
        setProperty('defaultCamZoom', 0.8)
    end

    if invBar then
        x1 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) + (150 * getProperty('iconP2.scale.x') - 150) / 2 - 26
        x2 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) - (150 * getProperty('iconP1.scale.x')) / 2 - 26 * 2

        setProperty('iconP1.x', x2)
        setProperty('iconP2.x', x1)

        setProperty('healthBar.flipX', true)
        setProperty('iconP1.flipX', true)
        setProperty('iconP2.flipX', true)
    else
        setProperty('healthBar.flipX', false)
        setProperty('iconP1.flipX', false)
        setProperty('iconP2.flipX', false)
    end
end

function opponentNoteHit(index, noteData, noteType, isSustainNote)
    if not mustHitSection then
        if noteType == 'GF Sing' or gfSection then
            invBar = true
            callMethod('iconP1.changeIcon', {getProperty('boyfriend.healthIcon')})
            callMethod('iconP2.changeIcon', {getProperty('gf.healthIcon')})
            setHealthBarColors(rgbToHex(getProperty('gf.healthColorArray')), rgbToHex(getProperty('boyfriend.healthColorArray')))
        else
            callMethod('iconP1.changeIcon', {getProperty('boyfriend.healthIcon')})
            callMethod('iconP2.changeIcon', {getProperty('dad.healthIcon')})
            invBar = false
            setHealthBarColors(rgbToHex(getProperty('dad.healthColorArray')), rgbToHex(getProperty('boyfriend.healthColorArray')))
        end
    end
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end