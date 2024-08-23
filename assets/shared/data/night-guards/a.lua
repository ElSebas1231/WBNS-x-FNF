if getPropertyFromClass('backend.ClientPrefs', 'data.shaders') == true then
    function onCreatePost()
    initLuaShader("ChromaticAbberation")
    makeLuaSprite("Shader")
    setSpriteShader("Shader", "ChromaticAbberation")
    runHaxeCode([[trace(ShaderFilter);
    game.camGame.setFilters([new ShaderFilter(game.getLuaObject("Shader").shader)]);
    ]])
    addHaxeLibrary("ShaderFilter1", "openfl.filters")
    setShaderFloat("Shader", "amount", 0.6)
    end
end