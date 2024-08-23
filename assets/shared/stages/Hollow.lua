function onCreate()
	makeAnimatedLuaSprite('public', 'public', -950, -100)
	scaleObject('public', 1.3, 1.3)
	addAnimationByPrefix('public', 'idle', 'OnlyPublic', 20, false)
	addLuaSprite('public', false)

	makeAnimatedLuaSprite('Arena', 'arena', -870, -100)
	scaleObject('Arena', 1.3, 1.3)
	addAnimationByPrefix('Arena', 'idle', 'Arena', 20, true)
	addLuaSprite('Arena')
end

function onBeatHit()
	if curBeat % 2 == 0 then
		if getProperty('public.animation.curAnim.finished') then
			playAnim('public', 'idle', true)
		end
	end
end