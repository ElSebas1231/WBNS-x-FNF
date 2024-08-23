function onCreate()
    makeLuaText("LO", "", 1500, -80, 450)
    setTextBorder('LO',5.5,'000000')
    setTextFont('LO', 'Dosis-Regular.ttf')
    setTextSize('LO', 80);
    setProperty('LO.alpha',0)
    addLuaText('LO',false)

    runHaxeCode(
        [[
            game.modchartTexts.get('LO').cameras = [game.camGame];
            game.modchartTexts.get('LO').scrollFactor.set(1,1);
            game.insert(game.members.indexOf(game.dadGroup)-2,game.modchartTexts.get('LO'));
            return;
        ]]
    )
end
function onUpdate()
    local minOrder = math.min(getObjectOrder('dadGroup'),getObjectOrder('boyfriendGroup'),getObjectOrder('gfGroup')) - 1
    if getObjectOrder('LO') ~= minOrder then
        setObjectOrder('LO',minOrder)
    end
end

function onEvent(name, value1, value2)
 if name == "sanfordxd" then
doTweenY("A", "LO", 300, 0.1, "linear")
setProperty('LO.y', 450)
doTweenAlpha("B", "LO", 1, 0.15, "linear")
setProperty('LO.alpha',0)
runTimer('LO', 0.5)
setTextString('LO', value1)
end
end

function onTimerCompleted(tag)
if tag == 'LO' then
doTweenAlpha('fin', 'LO', 0, 0.15, 'linear');
end
end
