if getPropertyFromClass('backend.ClientPrefs', 'data.shaders') == true then
function onCreatePost()
initLuaShader("ChromaticAbberation")
makeLuaSprite("Shader")
setSpriteShader("Shader", "ChromaticAbberation")
runHaxeCode([[trace(ShaderFilter);
game.camGame.setFilters([new ShaderFilter(game.getLuaObject("Shader").shader)]);
]])
addHaxeLibrary("ShaderFilter1", "openfl.filters")
setShaderFloat("Shader", "amount", 0)
end
end

aberration = 0
local awaz = false
function onUpdate(elapsed)
if awaz then
if curStep % 1 == 0 then
setShaderFloat("Shader", "amount", aberration)
aberration = aberration + 0.010
end  
end
end

function onStepHit()
if curStep == 640 or curStep == 768 or curStep == 1056 or curStep == 1472 then
awaz = true
end
if curStep == 672 or curStep == 800 or curStep == 1088 or curStep == 1504 then
aberration = 0
setShaderFloat("Shader", "amount", 0)
awaz = false
end
end