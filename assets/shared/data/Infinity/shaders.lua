local shaderName = "crt"
local shaderActive = false
function onCreate()
    if shadersEnabled then
        addHaxeLibrary("ShaderFilter", "openfl.filters")

        initLuaShader('crt')
        initLuaShader('blue')

        makeLuaSprite("temporaryShader")
        makeGraphic("temporaryShader", screenWidth, screenHeight)
        setSpriteShader("temporaryShader", 'crt')

        makeLuaSprite("temporaryShader2")
        makeGraphic("temporaryShader2", screenWidth, screenHeight)
        setSpriteShader("temporaryShader2", 'blue')

        runHaxeCode([[
            game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
            game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
            game.camOther.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
        ]])
    end
end

function onStepHit()
    if shadersEnabled then
        if curStep >= 816 then
            if not shaderActive then
                runHaxeCode([[
                    game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader), new ShaderFilter(game.getLuaObject("temporaryShader2").shader)]);
                ]])
                setShaderFloat('temporaryShader2', 'hue', 1.25)
                setShaderFloat('temporaryShader2', 'pix', 0.00001)
                shaderActive = true
            end
        end
    end
end

function onUpdate()
    if shadersEnabled then
        setShaderFloat("temporaryShader", "iTime", os.clock());
    end
end
