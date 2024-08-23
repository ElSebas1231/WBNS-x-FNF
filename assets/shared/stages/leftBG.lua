function onCreate()
	-- background shit
	makeLuaSprite('Left4', 'leftBG/leftcuatrodeath', -820, -300);
	setScrollFactor('Left4', 1, 1);
	scaleObject('Left4', 1.0, 1.0);
        setProperty('skipCountdown', true)
	
	addLuaSprite('Left4', false);
end