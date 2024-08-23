function onCreatePost()
precacheImage("duxo",'Lore Bg/weas/loreduxo_png')
precacheImage("loco",'Lore Bg/weas/loreloco_png')
precacheImage("soaring",'Lore Bg/weas/loresoaring_png')
precacheImage("duxoHUD",'duxo')
precacheImage("locoHUD",'loco')
precacheImage("Soaringloco",'soaring')
precacheImage("endlore",'Lore Bg/endlore')

makeLuaSprite('negrobg', 'blackbg', -500, -50)
setProperty('negrobg.alpha', 0)
scaleObject('negrobg',2.5,2.5)
addLuaSprite('negrobg', false)

makeLuaSprite('negrooscuro', nul, 0, 0)
makeGraphic('negrooscuro', 1350 ,900,'000000')
setObjectCamera('negrooscuro', 'Other')
setProperty('negrooscuro.alpha', 1)
scaleObject('negrooscuro',1.8,1.8)
addLuaSprite('negrooscuro', true)

makeLuaSprite('blackui', 'blackui', 0, 0)
setObjectCamera('blackui', 'Other')
setProperty('blackui.alpha', 1)
scaleObject('blackui',1.15, 1.15)
addLuaSprite('blackui', false)

makeLuaSprite('negroHUD', nul, 0, 0)
makeGraphic('negroHUD', 1350 ,900,'000000')
setObjectCamera('negroHUD', 'camHUD')
setProperty('negroHUD.alpha', 0)
scaleObject('negroHUD',1.8,1.8)
addLuaSprite('negroHUD', false)

makeLuaSprite('darkness', null, 0, 0);
makeGraphic('darkness', 1350 ,900,'646464')
setObjectCamera('darkness', 'other')
setBlendMode('darkness','SUBTRACT')
setProperty('darkness.alpha', 0.65)
addLuaSprite('darkness', true);

makeLuaSprite("duxo",'Lore Bg/weas/loreduxo_png', 0, 0)
setObjectCamera("duxo",'camHUD')
setProperty("duxo.visible", false)
addLuaSprite("duxo")

makeLuaSprite("loco",'Lore Bg/weas/loreloco_png', 0, 0)
setObjectCamera("loco",'camHUD')
setProperty("loco.visible", false)
addLuaSprite("loco")

makeLuaSprite("soaring",'Lore Bg/weas/loresoaring_png', 0, 0)
setObjectCamera("soaring",'camHUD')
setProperty("soaring.visible", false)
addLuaSprite("soaring")

makeLuaSprite("duxoHUD",'duxo', -650, -300)
setObjectCamera("duxoHUD",'camHUD')
scaleObject("duxoHUD", 1.0, 1.0)
setProperty("duxoHUD.alpha", 0)
addLuaSprite("duxoHUD", true)

makeLuaSprite("locoHUD",'loco', 100, 25)
setObjectCamera("locoHUD",'camHUD')
scaleObject("locoHUD", 1.0, 1.0)
setProperty("locoHUD.alpha", 0)
addLuaSprite("locoHUD", true)

makeLuaSprite("Soaringloco",'soaring', -750, -300)
setObjectCamera("Soaringloco",'Other')
scaleObject("Soaringloco", 1.5, 1.5)
setProperty("Soaringloco.alpha", 0)
addLuaSprite("Soaringloco", false)

makeAnimatedLuaSprite("endlore",'Lore Bg/endlore',0,-400)
addAnimationByPrefix("endlore", "idle", "end0",24, false)
setProperty("endlore.alpha", 0)
setObjectCamera("endlore",'Other')
scaleObject("endlore", 3.35, 2.25)
addLuaSprite("endlore",true)

setProperty('defaultCamZoom', 0.75)
setProperty('camGame.zoom',1.5)
end

function onEvent(n,v1,v2)
if n == 'Flash Camera' then
setBlendMode("flash", 'add')
setObjectCamera("flash",'other')
end
end

function onStepHit()
if curStep == 1 then
doTweenAlpha("awa", "negrooscuro", '0', 7.5, "linear")
doTweenAlpha("awa2", "darkness", '0', 7.5, "linear")
doTweenAlpha("awa3", "blackui", '0', 7.5, "linear")
doTweenZoom('camZoom','camGame', 0.75, 7.5, 'linear')
end
if curStep == 640 then
doTweenAlpha("awa", "negrooscuro", '0.3', 1.8, "linear")
doTweenAlpha("awa2", "darkness", '0.3', 1.8, "linear")
doTweenAlpha("awa3", "blackui", '0.4', 1.8, "linear")
end
if curStep == 672 then
doTweenAlpha("awa", "negrooscuro", '0', 0.25, "linear")
doTweenAlpha("awa2", "darkness", '0', 0.25, "linear")
doTweenAlpha("awa3", "blackui", '0', 0.25, "linear")
end
if curStep == 768 then
setProperty("gf.colorTransform.greenOffset", 255)
setProperty("gf.colorTransform.redOffset", 255)
setProperty("gf.colorTransform.blueOffset", 255)
doTweenAlpha("awa", "negrooscuro", '0.1', 1.5, "linear")
doTweenAlpha("awa3", "blackui", '0.4', 1.5, "linear")
doTweenAlpha("awa4", "negrobg", '0.8', 1.5, "linear")
doTweenAlpha("awa5", "boyfriend", '0.25', 1.5, "linear")
doTweenAlpha("awa6", "dad", '0.25', 1.5, "linear")
end
if curStep == 800 then
setProperty("gf.colorTransform.greenOffset", 0)
setProperty("gf.colorTransform.redOffset", 0)
setProperty("gf.colorTransform.blueOffset", 0)
doTweenX("asf", "duxoHUD", 100, 10, "linear")
doTweenAlpha("awa8", "duxoHUD", '0.35', 2.5, "linear")
end
if curStep == 864 then
doTweenAlpha("awa4", "negrobg", '0', 7, "linear")
doTweenX("gas", "locoHUD", -950, 10, "linear")
doTweenAlpha("lolas", "duxoHUD", '0', 2.5, "linear")
doTweenAlpha("awa9", "locoHUD", '0.35', 2.5, "linear")
end
if curStep == 928 then
doTweenAlpha("awa5", "boyfriend", '0.75', 1.5, "linear")
doTweenAlpha("awa6", "dad", '0.75', 1.5, "linear")
doTweenAlpha("awa9", "locoHUD", '0', 1.5, "linear")
end
if curStep == 1088 then
setProperty('blackui.alpha', 0)
setProperty('negrooscuro.alpha', 0)
setProperty('boyfriend.alpha', 1)
setProperty('dad.alpha', 1)
end
if curStep == 1472 then
doTweenAlpha("asfg", "gf", '0.5', 0.5, "linear")
doTweenAlpha("agh", "loco", '0.5', 0.5, "linear")
doTweenAlpha("awa4", "negrobg", '1', 1, "linear")
end
if curStep == 1504 then
setProperty('gf.alpha', 1)
setProperty('dad.alpha', 1)
setProperty('negrobg.alpha', 0)
end
if curStep == 1568 then
doTweenAlpha("lol", "negroHUD", '1', 1.5, "linear")
noteTweenAlpha("a", 0, 0.1, 2, "linear")
noteTweenAlpha("b", 1, 0.1, 2, "linear")
noteTweenAlpha("c", 2, 0.1, 2, "linear")
noteTweenAlpha("d", 3, 0.1, 2, "linear")
end
if curStep == 1600 then 	
setProperty('iconP1.visible', false)
setProperty('iconP2.visible', false);
setProperty('healthBar.visible', false);
setProperty("duxo.visible", true)
end
if curStep == 1664 then 
setProperty("duxo.visible", false)
setProperty("soaring.visible", true)
end
if curStep == 1728 then 
setProperty("soaring.visible", false)
setProperty("loco.visible", true)
end
if curStep == 1856 or curStep == 2527 then
setProperty("Soaringloco.alpha", 1)
end
if curStep == 1888 then
setProperty("Soaringloco.alpha", 0)
setProperty("loco.visible", false)
setProperty('negroHUD.alpha', 0)
setProperty('iconP1.visible', true)
setProperty('iconP2.visible', true);
setProperty('healthBar.visible', true);
noteTweenAlpha("a", 0, 1, 0.5, "linear")
noteTweenAlpha("b", 1, 1, 0.5, "linear")
noteTweenAlpha("c", 2, 1, 0.5, "linear")
noteTweenAlpha("d", 3, 1, 0.5, "linear")
end
if curStep == 2271 then
doTweenAlpha("awa", "negrooscuro", '0.3', 30, "linear")
doTweenAlpha("awa2", "darkness", '0.3', 30, "linear")
doTweenAlpha("awa3", "blackui", '0.4', 30, "linear")
end
if curStep == 2543 then
objectPlayAnimation('endlore','idle'); 
setProperty("endlore.alpha", 1)
setProperty("Soaringloco.alpha", 0)
end
end