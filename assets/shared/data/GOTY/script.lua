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
	setProperty('timeBar.leftBar.visible', false)
	setProperty('timeBar.rightBar.visible', false)
	setProperty('timeBar.bg.visible', false)

	makeLuaSprite('goty', 'goty/goty', 0, 0)
	scaleObject('goty', 2, 2)
	setObjectCamera('goty', 'other')
	screenCenter('goty')
	setProperty('goty.alpha', 0.001)
	addLuaSprite('goty', true)
end

function onEvent(n, _, _)
	if n == 'goty' then
		setProperty('goty.alpha', 1)
		setProperty('camGame.visible', false)
		setProperty('camHUD.visible', false)
	end
end

function onSongStart()
	setProperty('cameraSpeed', 1)
end

function onDestroy()
	if not middlescroll then
		setPropertyFromClass('backend.ClientPrefs', 'data.middleScroll', false)
	end
	
	setPropertyFromClass('backend.ClientPrefs', 'data.opponentStrums', opponentStrums)
end