function onCreate()
	opponentStrums = getPropertyFromClass('backend.ClientPrefs', 'data.opponentStrums')
	timeBarTypeOG = getPropertyFromClass('backend.ClientPrefs', 'data.timeBarType')

	if opponentStrums then
		setPropertyFromClass('backend.ClientPrefs', 'data.opponentStrums', false)
	end
	if not middlescroll then
		setPropertyFromClass('backend.ClientPrefs', 'data.middleScroll', true)
	end
	
	setProperty('cameraSpeed', 99)
end

function onCreatePost()
	setProperty('dad.visible', false)
	setProperty('timeTxt.visible', false)
	setProperty('iconP2.visible', false)
	setProperty('healthBar.bg.visible', false)
	setProperty('healthBar.leftBar.visible', false)
	setProperty('boyfriend.alpha',0.001)
	setProperty('boyfriend.color',getColorFromHex('000000'))

	setProperty('timeBar.leftBar.visible', false)
	setProperty('timeBar.rightBar.visible', false)
	setProperty('timeBar.bg.visible', false)
end

function onSongStart()
	setProperty('cameraSpeed', 4)
end

function onDestroy()
	if not middlescroll then
		setPropertyFromClass('backend.ClientPrefs', 'data.middleScroll', false)
	end

	setPropertyFromClass('backend.ClientPrefs', 'data.opponentStrums', opponentStrums)
end