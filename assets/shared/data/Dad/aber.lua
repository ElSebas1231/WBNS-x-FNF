function onCreatePost()
    if shadersEnabled then
        addHaxeLibrary("ShaderFilter", "openfl.filters")
        initLuaShader("Aberration")
        makeLuaSprite("temporaryShader")
        makeGraphic("temporaryShader", screenWidth, screenHeight)        
        setSpriteShader("temporaryShader", "Aberration")

        initLuaShader("blur")
        makeLuaSprite("BlurCamSha")
        makeGraphic("BlurCamSha", screenWidth, screenHeight)        
        setSpriteShader("BlurCamSha", "blur")

        runHaxeCode([[
            game.camGame.setFilters([new ShaderFilter(game.getLuaObject("BlurCamSha").shader),new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
            game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader),new ShaderFilter(game.getLuaObject("BlurCamSha").shader)]);
        ]])

            framerateOG = getPropertyFromClass('ClientPrefs', 'framerate')

        if getPropertyFromClass('ClientPrefs', 'framerate') >= 120 then
            setPropertyFromClass('ClientPrefs', 'framerate', 120)
        else 
            setPropertyFromClass('ClientPrefs', 'framerate', 60)
        end
    end
end

Chromacrap = 0;
blurval = 0
local waza = false
local no = true

function onUpdatePost(elapsed)
    if shadersEnabled then
        Chromacrap = math.lerp(Chromacrap, 0.0005, boundTo(elapsed * 3, 0.0005, 3))
        setChrome(Chromacrap)
        
        blurval = math.lerp(blurval, 0, boundTo(elapsed * 4, 0, 4));
        setBlur(blurval)

        if no then 
            if curStep % 16 == 0 then
                blurval = blurval + 0.0002
                Chromacrap = Chromacrap + 0.0004
            end
        end

        if waza then 
            if curStep % 8 == 0 then
                blurval = blurval + 0.004
                Chromacrap = Chromacrap + 0.0004
            end
        end
    end
end

function onBeatHit()
    if curBeat >= 352 then
        no = false
    end	

    if curBeat >= 354 then
        waza = true
    end	
end

function onEvent(n,v1,v2)
    if n == 'Add Camera Zoom' then
        Chromacrap = Chromacrap + 0.0004
    end
end


function boundTo(value, min, max)
    return math.max(min, math.min(max, value))
end

function math.lerp(from, to, i)
    return from+(to-from)*i 
end

function setChrome(chromeOffset)
    setShaderFloat("temporaryShader", "rOffset", chromeOffset);
    setShaderFloat("temporaryShader", "gOffset", 0.0);
    setShaderFloat("temporaryShader", "bOffset", chromeOffset * -1);
end

function setBlur(blurOffset)
    if shadersEnabled then
        setShaderFloat("BlurCamSha", "blurWidth", blurOffset)
    end
end

function onDestroy()
    setPropertyFromClass('ClientPrefs', 'framerate', framerateOG)
end