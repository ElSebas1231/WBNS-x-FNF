function onCreatePost()
    makeLuaSprite('bg', 'TIT/BG_TIT', -1030, -115);
    setScrollFactor('bg', 0.95, 0.95)
    scaleObject('bg', 0.6, 0.6)
    addLuaSprite('bg', false);

    makeLuaSprite('bg1', 'TIT/BG_TIT_2', -1030, -115);
    setScrollFactor('bg1', 0.95, 0.95)
    scaleObject('bg1', 0.6, 0.6)
    setObjectOrder('bg1', getObjectOrder('dadGroup') + 1)
    addLuaSprite('bg1', false);

    makeLuaSprite('bg2', 'TIT/BG_TIT_3', -1030, -115);
    setScrollFactor('bg2', 0.95, 0.95)
    scaleObject('bg2', 0.6, 0.6)
    addLuaSprite('bg2', false);
    setObjectOrder('bg2', 3);

    setObjectOrder('gfGroup', getObjectOrder('bg1') +1)
end
