function onCreate()
 makeLuaText("meme", "", 1500,200, 300)
 setTextBorder('meme',5.5,'000000')
 setTextFont('meme', 'aquino.ttf')
 setObjectCamera("meme", 'camHUD')
 setTextSize('meme', 75);
 setProperty('meme.alpha',0)
 addLuaText('meme',false)
end

function onEvent(name, value1, value2)
 if name == "Lyrics Lore" then
runTimer('ma', 0.5)
setProperty('meme.alpha',0)
setTextString('meme', value1)
doTweenAlpha("B", "meme", 1, 0.15, "linear")
end
end

function onTimerCompleted(tag)
if tag == 'ma' then
doTweenAlpha('fin', 'meme', 0, 0.25, 'linear');
end
end
