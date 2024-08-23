function onCreate()
	-- background shit

	 makeLuaSprite('FunBG','FunBG', -800, -300);
	setScrollFactor('FunBG', 0.9, 0.9);
   	scaleObject('FunBG', 1.0, 1.0);

 makeAnimatedLuaSprite('tilines waos','tilines waos',-800,-300)addAnimationByPrefix('tilines waos','dance','kimajin',24,true)
   objectPlayAnimation('tilines waos','dance',false)
   setScrollFactor('tilines waos', 0.9, 0.9);
   scaleObject('tilines waos', 1.0, 1.0);

 makeLuaSprite('arbustos','arbustos', -800, 500);
	setScrollFactor('arbustos', 0.9, 0.9);
   	scaleObject('arbustos', 1.0, 1.0);

 makeLuaSprite('Bush2','Bush2', -800, 300);
	setScrollFactor('Bush2', 0.9, 0.9);
   	scaleObject('Bush2', 1.0, 1.0);

 makeLuaSprite('floor BG','floor BG', -800, 500);
	setScrollFactor('floor BG', 0.9, 0.9);
   	scaleObject('floor BG', 1.0, 1.0);

	addLuaSprite('FunBG', false);
 addLuaSprite('Bush2', false);
 addLuaSprite('tilines waos', false);
 addLuaSprite('arbustos', false);
 addLuaSprite('floor BG', false);

function onCreatePost()
doTweenColor('timeBar', 'timeBar', '0000BA', 1, 'linear');
end

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end