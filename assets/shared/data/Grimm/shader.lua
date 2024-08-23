Chromacrap = 0;
chromatic = 0;
blurval = 0
function onCreatePost()
initLuaShader("ChromaticAbberation")
makeLuaSprite("Shader")
setSpriteShader("Shader", "ChromaticAbberation")

initLuaShader("glitchChromatic")
makeLuaSprite("temporaryShader1")
setSpriteShader("temporaryShader1", "glitchChromatic")
makeLuaSprite('shaderXb',nil,0,0)

initLuaShader("blur")
makeLuaSprite("BlurCamSha")
setSpriteShader("BlurCamSha", "blur")

triggerEvent('glitchy transition', '0.1')

addHaxeLibrary("ShaderFilter1", "openfl.filters")
runHaxeCode([[
trace(ShaderFilter);
game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader1").shader),new ShaderFilter(game.getLuaObject("BlurCamSha").shader)]);
game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("Shader").shader),new ShaderFilter(game.getLuaObject("BlurCamSha").shader)]);
]])
framerateOG = getPropertyFromClass('ClientPrefs', 'framerate')

if getPropertyFromClass('ClientPrefs', 'framerate') >= 120 then
            setPropertyFromClass('ClientPrefs', 'framerate', 120)
else 
setPropertyFromClass('ClientPrefs', 'framerate', 60)
end
end

function onUpdate(elapsed)
setShaderFloat("chromatic", "chromaticWidth", Chromacrap)
setShaderFloat('temporaryShader1', "iTime", os.clock())
local value1 = getProperty('shaderXb.x')
setShaderFloat('temporaryShader1', "GLITCH", value1)  
end

function onUpdatePost(elapsed)
Chromacrap = math.lerp(Chromacrap, 0.001, boundTo(elapsed * 6, 0.001, 4))
setChrome(Chromacrap)
if shadersEnabled then
blurval = math.lerp(blurval, 0, boundTo(elapsed * 3, 0, 150));
setBlur(blurval)
end
end

function onEvent(name,value1,value2)
if name == 'Add Camera Zoom' then
Chromacrap = Chromacrap + 0.0012
blurval = blurval + 0.002
end
if name == 'glitchy transition' then
chromatic = chromatic + value1   
end
end

function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
Chromacrap = Chromacrap + 0.0005
setProperty('shaderXb.x',chromatic * getRandomFloat(-2, 2) )
doTweenX('shaderbLol','shaderXb',0,0.3,'linear')
end

function boundTo(value, min, max)
    return math.max(min, math.min(max, value))
end
function math.lerp(from,to,i)return from+(to-from)*i end

function setChrome(chromeOffset)
    setShaderFloat("Shader", "rOffset", chromeOffset);
    setShaderFloat("Shader", "gOffset", 0.0);
    setShaderFloat("Shader", "bOffset", chromeOffset * -1);
end

function onTweenCompleted(tag)
if tag == 'shaderbLol' then
setProperty('shaderXb.x',0)
end  
if tag == 'shaderrLol' then
setProperty('shaderXr.x',0)
end 
if tag == 'shadergLol' then
setProperty('shaderXg.x',0)
end
end

function setBlur(blurOffset)
if shadersEnabled then
setShaderFloat("BlurCamSha", "blurWidth", blurOffset)
end
end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
        return;
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
            return;
        ]])
        if (temp) then temp() end
    end
end

function onDestroy()
    setPropertyFromClass('ClientPrefs', 'framerate', framerateOG)
end