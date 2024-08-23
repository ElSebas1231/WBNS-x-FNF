function onCreate()
 makeLuaText("noway", "", 1500, -290, 650)
 setTextBorder('noway',5,'000000')
 setTextFont('noway', 'All Season Font by Keithzo (7NTypes).otf')
 setTextSize('noway', 60);
 setProperty('noway.alpha',0)
 addLuaText('noway',false)

 runHaxeCode(
  [[
game.modchartTexts.get('noway').cameras = [game.camGame];
game.modchartTexts.get('noway').scrollFactor.set(1,1);
game.insert(game.members.indexOf(game.dadGroup)-1,game.modchartTexts.get('noway'));
return;
  ]]
 )
end
function onUpdate()
 local minOrder = math.min(getObjectOrder('dadGroup'),getObjectOrder('boyfriendGroup')) - 1
 if getObjectOrder('noway') ~= minOrder then
  setObjectOrder('noway',minOrder)
 end
end

function onEvent(name, value1, value2)
 if name == "Lore Soaring" then
doTweenY("A", "noway", 550, 0.1, "linear")
setProperty('noway.y', 650)
doTweenAlpha("B", "noway", 1, 0.15, "linear")
setProperty('noway.alpha',0)
runTimer('no', 0.5)
setTextString('noway', value1)
end
end

function onTimerCompleted(tag)
if tag == 'no' then
doTweenAlpha('fin', 'noway', 0, 0.15, 'linear');
end
end
