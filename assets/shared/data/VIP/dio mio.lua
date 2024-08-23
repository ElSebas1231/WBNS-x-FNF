function onCreatePost()
makeLuaSprite('negrooscuro', nul, 0, 0)
makeGraphic('negrooscuro', 1350 ,900,'000000')
setObjectCamera('negrooscuro', 'Other')
setProperty('negrooscuro.alpha', 1)
scaleObject('negrooscuro',1.8,1.8)
addLuaSprite('negrooscuro', true)

setProperty('defaultCamZoom', 0.5)
setProperty('camGame.zoom', 1.5)
setProperty('camHUD.zoom', 3.5)
end

function onEvent(n,v1,v2)
if n == 'Flash Camera' then
setBlendMode("flash", 'add')
setObjectCamera("flash",'other')
end
end

function onStepHit()
if curStep == 1 then
doTweenAlpha("waza", "negrooscuro", 0, 10, "linear")
doTweenZoom('camZoom','camGame', 0.5, 10, 'QuadOut')
end
if curStep == 383 or curStep == 895 then
doTweenAlpha("a", "DiscordBg", 0, 0.8, "linear")
doTweenAlpha("wa", "audiencia", 0, 0.8, "linear")
doTweenAlpha("c", "gf", 0, 0.5, "linear")
doTweenAlpha("d", "dad", 0.7, 0.5, "linear")
doTweenAlpha("e", "boyfriend", 0.7, 0.5, "linear")

noteTweenAlpha("notedad", 0, 0.5, 0.8)
noteTweenAlpha("notedad1", 1, 0.5, 0.8)
noteTweenAlpha("notedad2", 2, 0.5, 0.8)
noteTweenAlpha("notedad3", 3, 0.5, 0.8)
noteTweenAlpha("notebf", 4, 0.5, 0.8)
noteTweenAlpha("notebf1", 5, 0.5, 0.8)
noteTweenAlpha("notebf2", 6, 0.5, 0.8)
noteTweenAlpha("notebf3", 7, 0.5, 0.8)
end
if curStep == 511 then
doTweenAlpha("a", "DiscordBg", 1, 0.8, "linear")
doTweenAlpha("wa", "audiencia", 1, 0.8, "linear")
doTweenAlpha("c", "gf", 1, 0.5, "linear")
doTweenAlpha("d", "dad", 1, 0.5, "linear")
doTweenAlpha("e", "boyfriend", 1, 0.5, "linear")

noteTweenAlpha("notedad", 0, 1, 0.8)
noteTweenAlpha("notedad1", 1, 1, 0.8)
noteTweenAlpha("notedad2", 2, 1, 0.8)
noteTweenAlpha("notedad3", 3, 1, 0.8)
noteTweenAlpha("notebf", 4, 1, 0.8)
noteTweenAlpha("notebf1", 5, 1, 0.8)
noteTweenAlpha("notebf2", 6, 1, 0.8)
noteTweenAlpha("notebf3", 7, 1, 0.8)
end
if curStep == 1023 then
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)
end
end