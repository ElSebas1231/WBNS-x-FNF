local introtxt = {'name', 'credits', 'border', 'barBox'}
tiempoextra = 0

--  ['Canción'] = {'Compositor(es)'', 'Charter(s)'}

local songIntro = {
    ['Animal Conflict'] = {'HeyMega & NexoV', 'ElSebas1231'},
    ['Creepers'] = {'Plushie_77', 'El Gatisty'},
    ['Travel In Trouble'] = {'NexoV', 'El Gatisty'},
    ['Trivia'] = {'NexoV', 'Roval'},
    ['Ay WTF'] = {'Shedar & NexoV', (difficultyName == 'hard' and 'GarretTheStickman' or difficultyName == 'insane' and 'GarretTheStickman' or difficultyName == 'soarinng' and 'El Gatisty')},
    ['Baneado'] = {'NexoV', (difficultyName == 'hard' and 'GarretTheStickman' or difficultyName == 'insane' and 'Roval' or difficultyName == 'soarinng' and 'El Gatisty')},
    ['Dinamica'] = {'HeyMega & NexoV', (difficultyName == 'hard' and 'GarretTheStickman' or difficultyName == 'insane' and 'WorteX' or difficultyName == 'soarinng' and 'GarretTheStickman')},
    ['Disco Fish'] = {'Daxx & NexoV', (difficultyName == 'hard' and 'GarretTheStickman' or difficultyName == 'insane' and 'TelmexCedric & WorteX' or difficultyName == 'soarinng' and 'WorteX')},
    ['Beat the GF'] = {'HeyMega & NexoV', (difficultyName == 'hard' and 'TelmexCedric' or difficultyName == 'insane' and 'TelmexCedric' or difficultyName == 'soarinng' and 'GarretTheStickman')},
    ['Boneless Wings'] = {'NexoV', 'Manuzfz'},
    ['Code C3jo'] = {'Shedar & NexoV', (difficultyName == 'hard' and 'GarretTheStickman' or difficultyName == 'insane' and 'WorteX' or difficultyName == 'soarinng' and 'WorteX')},
    ['Dad'] = {'GonTheGhost & NexoV', 'El Gatisty'},
    ['Era Bait'] = {'HeyMega & NexoV', 'Manuzfz'},
    ['Free The End'] = {'Not_Wingow & NexoV', 'Manuzfz & ElSebas1231'},
    ['GOTY'] = {'GonTheGhost & NexoV', 'ElSebas1231'},
    ['Grimm'] = {'HeyMega & NexoV', 'GarretTheStickman'},
    ['How Bad Can I Be'] = {'Daxx & NexoV', 'Roval'},
    ['Infinity'] = {'Pluhsie_77', 'Thunder'},
    ["Don't Look Up"] = {'HeyMega & NexoV', 'GarretTheStickman'},
    ['Late Night'] = {'GonTheGhost & NexoV', 'El Gatisty'},
    ['Laughs'] = {'HeyMega & NexoV', 'ElSebas1231'},
    ["Let's GO Compota"] = {'HeyMega, GonTheGhost & NexoV', 'WorteX'},
    ['Loco Classic Encore'] = {'NexoV', 'El Gatisty'},
    ['Lore (Soarinng Mix) v3'] = {'HeyMega & NexoV', 'Thunder'},
    ['Lore (Soarinng Mix) v2'] = {'HeyMega & NexoV', 'Roval'},
    ['Made in 2002'] = {'Not_Wingow', (difficultyName == 'hard' and 'Roval' or difficultyName == 'insane' and 'TelmexCedric' or difficultyName == 'soarinng' and 'Thunder')},
    ['Memes'] = {'AnxiusKitty & NexoV', (difficultyName == 'hard' and 'GarretTheStickman' or difficultyName == 'insane' and 'TelmexCedric' or difficultyName == 'soarinng' and 'WorteX')},
    ['Mexican School'] = {'HeyMega & NexoV', 'Manuzfz'},
    ['Penguin or Rat'] = {'Shedar & NexoV', (difficultyName == 'hard' and 'Roval' or difficultyName == 'insane' and 'El Gatisty' or difficultyName == 'soarinng' and 'ThePiero456')},
    ['Possesion'] = {'Daxx & NexoV', (difficultyName == 'hard' and 'Thunder' or difficultyName == 'insane' and 'Manuzfz' or difficultyName == 'soarinng' and 'ThePiero456')},
    ['Report'] = {'Daxx & NexoV', 'El Gatisty'},
    ['Rethey Forever'] = {'HeyMega & NexoV', (difficultyName == 'hard' and 'Roval' or difficultyName == 'insane' and 'WorteX' or difficultyName == 'soarinng' and 'ThePiero456')},
    ['Run Away And Hide'] = {'Daxx & NexoV', 'Andree'},
    ['Run Natalan'] = {'GonTheGhost', 'El Gatisty'},
    ['Say It'] = {'HeyMega & NexoV', 'Roval'},
    ['Skywars'] = {'Sanko', (difficultyName == 'hard' and 'GarretTheStickman' or difficultyName == 'insane' and 'TelmexCedric' or difficultyName == 'soarinng' and 'Thunder')},
    ['Snow Goal'] = {'NexoV', 'ThePiero456'},
    ['Speedrun'] = {'NexoV', 'Roval'},
    ['The Keys'] = {'Daxx_v & NexoV', 'Manuzfz'},
    ['Top Streamer'] = {'Shedar & NexoV', difficultyName == 'hard' and 'GarretTheStickman' or difficultyName == 'insane' and 'GarretTheStickman' or difficultyName == 'soarinng' and 'El Gatisty'},
    ['Uncoordinated'] = {'GonTheGhost & NexoV', 'Manuzfz'},
    ['Unerected Victory'] = {'GonTheGhost & NexoV', 'El Gatisty'},
    ['VIP'] = {'GonTheGhost & NexoV', difficultyName == 'hard' and 'Thunder' or difficultyName == 'insane' and 'Thunder' or difficultyName == 'soarinng' and 'GarretTheStickman'},
    ['Vote or Lose'] = {'Sanko', 'El Gatisty'},
    ['WarZ'] = {'Daxx & NexoV', 'El Gatisty'},
    ['Double A'] = {'GonTheGhost & NexoV', 'ElSebas1231'},
    ['Webadas'] = {'HeyMega & NexoV', (difficultyName == 'hard' and 'Roval' or difficultyName == 'insane' and 'TelmexCedric' or difficultyName == 'soarinng' and 'Thunder')},
    ['Night Guards'] = {'AnxiusKitty & NexoV', 'El Gatisty'},
    ['Origins'] = {'NexoV', 'El Gatisty'},
    ['Snow'] = {'bb-panzu  Vocals: NexoV', 'Roval'},
}

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
    
    makeLuaText("credits", 'Composer: '..songIntro[songName][1]..'    |   Charter: '..songIntro[songName][2], 1500, -110, 355)
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