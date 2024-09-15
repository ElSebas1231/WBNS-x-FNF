local introtxt = {'name', 'credits', 'border', 'barBox'}
tiempoextra = 0

if songName == "Let's GO Compota" or songName == 'Run Away And Hide' then
    tiempoextra = 5
elseif songName == 'Say It' then
    tiempoextra = -2
elseif songName == 'Laughs' then
    tiempoextra = 2
elseif songName == 'Snow Goal' then
    tiempoextra = 4
end

function onCreate()
    makeLuaText("name", songName, 1500, -110, 250)
    setTextBorder('name',4,'000000')
    setObjectCamera("name",'other')
    setTextFont('name', 'Uni Sans Heavy.otf')
    setTextSize('name', 105);
    addLuaText('name',false)
    
    makeLuaText("credits", 'Composer: '..songComposer..'    |   Charter: '..songCharter, 1500, -110, 355)
    setTextBorder('credits',2,'000000')
    setObjectCamera("credits",'other')
    setTextFont('credits', 'Uni Sans Heavy.otf')
    setTextSize('credits', 25);
    addLuaText('credits',false)

    makeLuaSprite('border', '', -100, 340)
    makeGraphic('border',440, 9.5, '#000000');
    setObjectCamera("border",'other')
    screenCenter('border', 'x')
    addLuaSprite('border',true);

    makeLuaSprite('barBox', '', -100, 342)
    makeGraphic('barBox',430, 5.5, 'ffffff')
    setObjectCamera("barBox",'other')
    screenCenter('barBox', 'x')
    addLuaSprite('barBox',true)
end

function onCreatePost()
    for i = 1, #introtxt do
        setProperty(introtxt[i]..'.alpha', 0)
        setProperty(introtxt[i]..'.antialiasing', getPropertyFromClass('backend.ClientPrefs', 'data.antialiasing'))
    end
end

function onSongStart()
    for i = 1, #introtxt do   
        doTweenAlpha(introtxt[i], introtxt[i], 1, 1, "quadOut")
        runTimer('end', 4+tiempoextra);
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    for i = 1, #introtxt do
        if tag == 'end' then
            doTweenAlpha(introtxt[i], introtxt[i], 0, 0.7, 'quadOut')
        end
    end
end