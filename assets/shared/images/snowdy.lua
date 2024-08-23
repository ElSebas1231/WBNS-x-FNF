function onCreate()
makeLuaSprite('basment', 'snowdy/welcometotheunderground', -830, -185);
scaleObject('basment', 1.1, 1.1)
addLuaSprite('basment', false);

    makeLuaSprite('upBarr')
    makeGraphic('upBarr',1500,500,'000000')
    addLuaSprite('upBarr')
    setObjectCamera('upBarr','camHUD')

    makeLuaSprite('downBarr')
    makeGraphic('downBarr',1500,500,'000000')
    addLuaSprite('downBarr')
    setObjectCamera('downBarr','camHUD')

    makeLuaText('version', 'Psych Engine v'..version, 0, screenWidth - (getTextWidth('cornerMark') + 320), 5);
    setTextBorder('version', 2, '000000');
    setTextFont('version', 'undertale-hud-font.ttf')
    setTextSize('version', 18);
    addLuaText('version',HUD)

    makeLuaText("time", songName, 1500, -570, 5)
    setTextBorder('time',5,'000000')
    setTextFont('time', 'undertale-hud-font.ttf')
    setTextSize('time', 25);
    addLuaText('time',true)

    makeLuaText("wea", 'Duxo', 1500, -550, 640)
    setTextBorder('wea',5,'000000')
    setTextFont('wea', 'undertale-hud-font.ttf')
    setTextSize('wea', 35);
    addLuaText('wea',true)

    makeLuaText("wea2", 'lv  1', 1500, -400, 650)
    setTextBorder('wea2',3,'000000')
    setTextFont('wea2', 'undertale-hud-font.ttf')
    setTextSize('wea2', 25);
    addLuaText('wea2',true)

    makeLuaText("wea3", 'hp', 1500, -200, 650)
    setTextBorder('wea3',3,'000000')
    setTextFont('wea3', 'undertale-hud-font.ttf')
    setTextSize('wea3', 15);
    addLuaText('wea3',true)

    makeLuaText("wea4", '20/20', 1500, -80, 650)
    setTextBorder('wea4',3,'000000')
    setTextFont('wea4', 'undertale-hud-font.ttf')
    setTextSize('wea4', 15);
    addLuaText('wea4',true)

    makeLuaText("score", nill, 1500, 130, 650)
    setTextBorder('score',5,'000000')
    setTextFont('score', 'undertale-hud-font.ttf')
    setTextSize('score', 20);
    addLuaText('score',true)

    makeLuaText("miss", nill, 1500, 370, 650)
    setTextBorder('miss',5,'000000')
    setTextFont('miss', 'undertale-hud-font.ttf')
    setTextSize('miss', 20);
    addLuaText('miss',true)

    setObjectCamera('time','camHUD')
    setObjectCamera('wea','camHUD')
    setObjectCamera('wea2','camHUD')
    setObjectCamera('wea3','camHUD')
    setObjectCamera('miss','camHUD')
    setObjectCamera('score','camHUD')

    screenCenter('upBarr','X')
    screenCenter('downBarr','X')
    setProperty('upBarr.y',-1500)
    setProperty('downBarr.y',1500)
    doTweenY('moveStart', 'upBarr', -430, 0.01 , 'circInOut')
    doTweenY('moveStart2', 'downBarr', 620, 0.01 , 'circInOut')
end 

function onCreatePost()
setProperty('healthBar.scale.x', getProperty('healthBar.scale.x') - 0.9)
setProperty('healthBar.scale.y', getProperty('healthBar.scale.y') + 1.5)
setHealthBarColors('ff0000', 'ffff00');
setProperty('healthBar.x',299)
setProperty('healthBar.y',655)
setProperty('timeTxt.x',450)
setProperty('timeTxt.y',10)
setTextFont('timeTxt', "undertale-hud-font.ttf")
setTextSize('timeTxt', 25);
setProperty('healthBar.bg.visible', false);
setProperty('timeBar.visible', false);
setProperty('iconP2.visible', false);
setProperty('iconP1.visible', false);
setProperty('scoreTxt.visible', false);
setProperty('showComboNum', false)
setProperty('showRating', false);
setProperty('Num.visible', false)
setPropertyFromClass('Main','fpsVar.visible',false)
addHealth(2)
setProperty('healthGain', 0)
end

function noteMiss(membersIndex, noteData, noteType, isSustainNote)
setProperty('boyfriend.alpha',0.5)
addHealth(-0.15)
playSound("dañoundertale",1)
runTimer('noway', 0.015)
end



function onTimerCompleted(tag)
if tag == 'noway' then
setProperty('boyfriend.alpha',1)
runTimer('end', 1)
runTimer('a', 0.015)
end
if tag == 'a' then
setProperty('boyfriend.alpha',0.5) 
runTimer('noway', 0.015)
end
if curStep % 15 == 0 then
setProperty('boyfriend.alpha',1)
cancelTimer("a")
cancelTimer("noway")
end
end

function onUpdate()
setProperty('camZoomingMult', false)
end

function onUpdatePost()
    setTextString('score', 'Score: '..score)
    setTextString('miss', 'Misses: '..misses)
end