int = 30; -- INTENSIDAD DE MOVIMIENTO DE CAMARA, mas = intenso
velcaminicio = 1; --A que velocidad de camara inicias la cancion, el predeterminado es 1
PosicionCamaraInicial = 'normal' -- normal/bf/gf/dad/medio - A donde la cámara apunta al inicio de la canción, se cambia después con eventos

--Offsets de cámara: Ajustar si la cámara está mal ubicada - Se divide en X e Y
automaticCamera = true --Si la cámara obtiene la posición relativa de los jsons o eliges una manual
dadOffset = {0, 0} --Offset de Dad o Enemigo
gfOffset = {0, 0} --Offset de GF
bfOffset = {0, 0} --Offset de BF o Player
middleOffsets = {0, 0} --Offset del medio
extracharacter = false --Si hay otro judador extra como en Trivia
extraIsPlayer = false --Si ese jugador extra es jugable o es enemigo
extraOffset = {0, 0} --Offset del Extra
notaExtra = 'No Animation' --La nota con la que se mueve el jugador extra

corrigebugs = false --Si se te llega a poner rara la cámara coloca esto en true

--INSERTAR DATOS CON EL NOMBRE DE LA CANCIÓN
--EJEMPLO DE PLANTILLA (COPIAR Y PEGAR CON EL NOMBRE DE LA CANCIÓN QUE QUIERAS)
if songName == 'NOMBRE-DE-CANCIÓN-DESDE-DATA' then
    extracharacter = false;
    automaticCamera = true;
    extraIsPlayer = false;
    notaExtra = 'No Animation';
    automaticCamera = true;
    int = 30;
    velcaminicio = 1;
    PosicionCamaraInicial = 'normal';
    dadOffset = {0, 0};
    gfOffset = {0, 0};
    bfOffset = {0, 0};
    middleOffsets = {0, 0};
    extraOffset = {0, 0};
    corrigebugs = false
end

if songName == 'Made in 2002' then
    int = 30;
    velcaminicio = 1;
    PosicionCamaraInicial = 'medio'
    dadOffset = {10, 0}
    gfOffset = {0, 0}
    bfOffset = {-200, 180}
    middleOffsets = {0, -50}
    corrigebugs = true
end
if songName == 'Rethey Forever' then
    int = 30;
    velcaminicio = 1;
    PosicionCamaraInicial = 'medio'
    dadOffset = {-180, 0}
    gfOffset = {0, 0}
    bfOffset = {-290, 0}
    middleOffsets = {-70, 0}
    corrigebugs = true
end
if songName == 'How Bad Can I Be' then
    int = 0;
    velcaminicio = 0;
    PosicionCamaraInicial = 'dad'
    dadOffset = {-350, 230}
    gfOffset = {100, 100}
    bfOffset = {-80, -30}
    middleOffsets = {70, -100}
end
if songName == 'Snow' then
    int = 0;
    velcaminicio = 1;
    PosicionCamaraInicial = 'medio'
    dadOffset = {0, 0}
    gfOffset = {0, 0}
    bfOffset = {-600, 0}
    middleOffsets = {0, 0}
end
if songName == 'Trivia' then
    extracharacter = true
    extraIsPlayer = true
    notaExtra = 'No Animation'
    int = 0;
    velcaminicio = 1;
    PosicionCamaraInicial = 'medio'
    dadOffset = {-100, 0}
    gfOffset = {0, 0}
    bfOffset = {550, 0}
    middleOffsets = {100, 0}
    extraOffset = {1750, -1340}
end 
if songName == 'WarZ' then
    extracharacter = true;
    extraIsPlayer = false;
    notaExtra = 'Enemyextra1';
    int = 30;
    velcaminicio = 1;
    PosicionCamaraInicial = 'normal';
    dadOffset = {0, 0};
    gfOffset = {0, 0};
    bfOffset = {0, 0};
    middleOffsets = {0, 0};
    extraOffset = {200, -500};
    corrigebugs = true
end

--NO TOCAR: Necesario para otras funciones
dadmiddleOffset = {260,50}
bfmiddleOffset = {-170,30}
instacam = false
extraSings = false
Animcantar = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}

--No sé si lo voy a usar
dadextraOffset = {0, 0}
gfextraOffset = {0, 0}
bfextraOffset = {0, 0}
extraextraOffset = {0, 0}

if songName == 'How Bad Can I Be' or songName == 'Trivia' or songName == 'Snow' or songName == 'WarZ' or songName == 'Rethey Forever' or songName == 'Made in 2002' then

    function onCreatePost()
        dadCam = {getMidpointX('dad')+(getProperty('dad.cameraPosition[0]')-getProperty('opponentCameraOffset[0]'))+dadOffset[1]-75+dadmiddleOffset[1], getMidpointY('dad')+(getProperty('dad.cameraPosition[1]')-getProperty('opponentCameraOffset[1]'))-dadOffset[2]-40-dadmiddleOffset[2]}
        bfCam = {getMidpointX('boyfriend')+(getProperty('boyfriend.cameraPosition[0]')-getProperty('boyfriendCameraOffset[0]'))+bfOffset[1]+20+bfmiddleOffset[1], getMidpointY('boyfriend')+(getProperty('boyfriend.cameraPosition[1]')-getProperty('boyfriendCameraOffset[1]'))-bfOffset[2]-90-bfmiddleOffset[2]}
        gfCam = {getMidpointX('gf')+(getProperty('gf.cameraPosition[0]')-getProperty('girlfriendCameraOffset[0]'))+gfOffset[1], getMidpointY('gf')+(getProperty('gf.cameraPosition[1]')-getProperty('girlfriendCameraOffset[1]'))-gfOffset[2]}
        middleCam = {(dadCam[1]+bfCam[1])/2+middleOffsets[1], (dadCam[2]+bfCam[2])/2-middleOffsets[2]}
        if extracharacter == true then
            extraCam = {extraOffset[1], -extraOffset[2]}
        end
        
        velcamactual = 1
        if velcaminicio ~= 1 then
            setProperty('cameraSpeed', velcaminicio)
            velcamactual = velcaminicio
        end

        if PosicionCamaraInicial == 'normal' then
            setProperty('isCameraOnForcedPos',false)
        else
            setProperty('isCameraOnForcedPos',true)
            if PosicionCamaraInicial == 'dad' then
                camPos = 'a'
            elseif PosicionCamaraInicial == 'medio' then
                camPos = 'b'
            elseif PosicionCamaraInicial == 'bf' then
                camPos = 'c'
            elseif PosicionCamaraInicial == 'gf' then
                camPos = 'g'
            elseif PosicionCamaraInicial == 'extra' or PosicionCamaraInicial == 'x' then
                if extracharacter == true then
                    camPos = 'x'
                end
            end
        end
    end

    function onEvent(n,v1,v2)
        if n == 'Change Character' then
            changedcharacter = true
            dadCam = {getMidpointX('dad')+(getProperty('dad.cameraPosition[0]')-getProperty('opponentCameraOffset[0]'))+dadOffset[1]-75+dadmiddleOffset[1], getMidpointY('dad')+(getProperty('dad.cameraPosition[1]')-getProperty('opponentCameraOffset[1]'))-dadOffset[2]-40-dadmiddleOffset[2]}
            bfCam = {getMidpointX('boyfriend')+(getProperty('boyfriend.cameraPosition[0]')-getProperty('boyfriendCameraOffset[0]'))+bfOffset[1]+20+bfmiddleOffset[1], getMidpointY('boyfriend')+(getProperty('boyfriend.cameraPosition[1]')-getProperty('boyfriendCameraOffset[1]'))-bfOffset[2]-90-bfmiddleOffset[2]}
            gfCam = {getMidpointX('gf')+(getProperty('gf.cameraPosition[0]')-getProperty('girlfriendCameraOffset[0]'))+gfOffset[1], getMidpointY('gf')+(getProperty('gf.cameraPosition[1]')-getProperty('girlfriendCameraOffset[1]'))-gfOffset[2]}
            middleCam = {(dadCam[1]+bfCam[1])/2+middleOffsets[1], (dadCam[2]+bfCam[2])/2-middleOffsets[2]}
            if extracharacter == true then
                extraCam = {extraOffset[1], -extraOffset[2]}
            end
        end

        if n == 'roval_camera' or n == 'roval' then
            local cam1 = split(v1) --Divide el value1
            local cam2 = split(v2) --Divide el value2
            local holi = v2:match('^[^,]*,[^,]*$') ~= nil --Verifica si hay 2 comas en value2


            if n == 'roval' then
                if v1 == 'aa' or v1 == 'bb' or v1 == 'cc' or v1 == 'gg' then
                    if cam1[1] == 'aa' then
                        camPos = 'a'
                    end
                    if cam1[1] == 'bb' then
                        camPos = 'b'
                    end
                    if cam1[1] == 'cc' then
                        camPos = 'c'
                    end
                    if cam1[1] == 'gg' then
                        camPos = 'g'
                    end
                    setProperty('isCameraOnForcedPos',true)
                    runTimer('instacam',0.001)
                end
            end
            if cam1[1] == 'n' or cam1[1] == 'p' or cam1[1] == 'normal' then
                camPos = 'p'
                setProperty('isCameraOnForcedPos',false)
                if cam1[2] == 'z' or cam1[2] == 'inst' then
                    if instacam == false then
                        instacam = true
                    else
                        instacam = false
                    end
                end
            else
                setProperty('isCameraOnForcedPos',true)
                if cam1[1] == 'z' or cam1[1] == 'inst' then
                    if instacam == false then
                        instacam = true
                    else
                        instacam = false
                    end
                else
                    instacam = false
                    if cam1[1] == 'a' or cam1[1] == 'dad' then
                        camPos = 'a'
                    end
                    if cam1[1] == 'b' or cam1[1] == 'middle' or cam1[1] == 'medio' then
                        camPos = 'b'
                    end
                    if cam1[1] == 'c' or cam1[1] == 'bf' or cam1[1] == 'boyfriend' then
                        camPos = 'c'
                    end
                    if cam1[1] == 'g' or cam1[1] == 'gf' or cam1[1] == 'girlfriend' then
                        camPos = 'g'
                    end
                    if cam1[1] == 'extra' or cam1[1] == 'x' then
                        camPos = 'x'
                    end
                    if cam1[1] == 'ab' or cam1[1] == 'ba' then
                        camPos = 'ab'
                    end
                    if cam1[1] == 'bc' or cam1[1] == 'cb' then
                        camPos = 'bc'
                    end
                    if cam1[1] == 'bg' or cam1[1] == 'gb' then
                        camPos = 'bg'
                    end
                    if cam1[2] == 'z' or cam1[2] == 'inst' then
                        runTimer('instacam', 0.001)
                    end
                end
            end

            if n == 'roval' then
                if cam1[1] == 'int' then
                    int = cam2[1]
                end
                if cam1[1] == 'velcam' or cam1[1] == 'extra' then
                    velcamactual = cam2[1]
                end
            end
            if v2 ~= 'int' and v2 ~= 'changecam' and n == 'roval_camera' then
                if v2 ~= velcamactual then
                    if v2 == '' then
                        velcamactual = 1
                    else
                        velcamactual = v2
                    end
                    if not instacam then
                        setProperty('cameraSpeed', velcamactual)
                    end
                end
            elseif v2 ~= 'changecam' and n == 'roval_camera' then
                int = v1
            else
                if n == 'roval' then
                    if cam2[1] == 'changecam' then
                        charcam = cam2[2]
                        camx = cam1[3]
                        camy = cam1[4]
                    end
                else
                    if cam1[1] == '' then
                        charcam = 'bf'
                    end
                    if cam1[2] == '' then
                        camx = 0
                    end
                    if cam1[3] == '' then
                        camy = 0
                    end
                    charcam = cam1[1]
                    camx = cam1[2]
                    camy = cam1[3]
                end

                if charcam == 'bf' or charcam == 'boyfriend' or charcam == 'player' or charcam == 'c'or charcam == 'jugador' then
                    bfextraOffset = {camx, camy}
                elseif charcam == 'gf' or charcam == 'girlfriend' or charcam == 'novia' or charcam == 'g' then
                    gfextraOffset = {camx, camy}
                elseif charcam == 'dad' or charcam == 'enemy' or charcam == 'rival' or charcam == 'a' or charcam == 'enemigo' then
                    dadextraOffset = {camx, camy}
                elseif charcam == 'x' or charcam == 'extra' then
                    extraextraOffset = {camx, camy}
                elseif charcam == 'b' or charcam == 'middle' or charcam == 'medio' then
                    middleextraOffset = {camx, camy}
                end

                dadCam = {getMidpointX('dad')+(getProperty('dad.cameraPosition[0]')-getProperty('opponentCameraOffset[0]'))+dadOffset[1]-75+dadextraOffset[1]+dadmiddleOffset[1], getMidpointY('dad')+(getProperty('dad.cameraPosition[1]')-getProperty('opponentCameraOffset[1]'))-dadOffset[2]-40-dadmiddleOffset[2]-dadextraOffset[2]}
                bfCam = {getMidpointX('boyfriend')+(getProperty('boyfriend.cameraPosition[0]')-getProperty('boyfriendCameraOffset[0]'))+bfOffset[1]+20+bfmiddleOffset[1]+bfextraOffset[1], getMidpointY('boyfriend')+(getProperty('boyfriend.cameraPosition[1]')-getProperty('boyfriendCameraOffset[1]'))-bfOffset[2]-90-bfmiddleOffset[2]-bfextraOffset[2]}
                gfCam = {getMidpointX('gf')+(getProperty('gf.cameraPosition[0]')-getProperty('girlfriendCameraOffset[0]'))+gfOffset[1]+gfextraOffset[1], getMidpointY('gf')+(getProperty('gf.cameraPosition[1]')-getProperty('girlfriendCameraOffset[1]'))-gfOffset[2]-gfextraOffset[2]}
                middleCam = {(dadCam[1]+bfCam[1])/2+middleOffsets[1]+middleextraOffset[1], (dadCam[2]+bfCam[2])/2-middleOffsets[2]-middleextraOffset[2]}
                extraCam = {extraOffset[1]+extraextraOffset[1],-extraOffset[2]-extraextraOffset[2]}
            end
        end
    end

    function onSectionHit()
        if mustHitSection then
            cora = 'bf'
        end
        if gfSection then
            cora = 'gf'
        end
        if not mustHitSection then
            cora = 'dad'
        end

        if section ~= cora then
            if instacam then
                runTimer('instacam', 0.001)
            end
            section = cora
        end
    end

    function opponentNoteHit(id, direccion, tipo, esSustain)
        if not mustHitSection then
            if extraIsPlayer then
                extraSings = false
            else
                if tipo == notaExtra then
                    extraSings = true
                    anim = Animcantar[direccion + 1]
                else
                    extraSings = false
                end
            end
        end
    end
    function goodNoteHit(id, direccion, tipo, esSustain)
        if mustHitSection then
            if extraIsPlayer then
                if tipo == notaExtra then
                    extraSings = true
                    anim = Animcantar[direccion + 1]
                else
                    extraSings = false
                end
            else
                extraSings = false
            end
        end
    end
    function noteMiss(id, direccion, tipo, esSustain)
        if tipo == notaExtra then
            extraSings = true
            anim = Animcantar[direccion + 1]
        else
            extraSings = false
        end
    end
    function onUpdate()
        if corrigebugs then
            setProperty('isCameraOnForcedPos',true)
        end

        if not extraSings then
            if not mustHitSection then
                anim = getProperty('dad.animation.curAnim.name')
                xy = {dadCam[1], dadCam[2]}
            end
            if mustHitSection then
                anim = getProperty('boyfriend.animation.curAnim.name')
                xy = {bfCam[1], bfCam[2]}
            end
            if gfSection then 
                anim = getProperty("gf.animation.curAnim.name")
                xy = {gfCam[1], gfCam[2]}
            end
        else
            xy = {extraCam[1], extraCam[2]}
        end

        if camPos == 'a' then
            xy = {dadCam[1], dadCam[2]}
        elseif camPos == 'ab' then
            xy = {(dadCam[1]+middleCam[1])/2, (dadCam[2]+middleCam[2])/2}
        elseif camPos == 'b' then
            xy = {middleCam[1], middleCam[2]}
        elseif camPos == 'bc' then
            xy = {(bfCam[1]+middleCam[1])/2, (bfCam[2]+middleCam[2])/2}
        elseif camPos == 'c' then
            xy = {bfCam[1], bfCam[2]}
        elseif camPos == 'bg' then
            xy = {(gfCam[1]+middleCam[1])/2, (gfCam[2]+middleCam[2])/2}
        elseif camPos == 'g' then
            xy = {gfCam[1], gfCam[2]}
        elseif camPos == 'x' then
            xy = {extraCam[1], extraCam[2]}
        end


        if changedcharacter or instacam or extracharacter then
            setProperty('isCameraOnForcedPos',true)
        elseif not instcam and not changedcharacter then
            setProperty('isCameraOnForcedPos',true)
        end

        if not (string.find(anim, 'singLEFT') == nil) then
            setProperty('camFollow.x', xy[1] - int);
            setProperty('camFollow.y', xy[2]);
        elseif not (string.find(anim, 'singRIGHT') == nil) then
            setProperty('camFollow.x', xy[1] + int);
            setProperty('camFollow.y', xy[2]);
        elseif not (string.find(anim, 'singUP') == nil) then
            setProperty('camFollow.x', xy[1]);
            setProperty('camFollow.y', xy[2] - int);
        elseif not (string.find(anim, 'singDOWN') == nil) then
            setProperty('camFollow.x', xy[1]);
            setProperty('camFollow.y', xy[2] + int);
        elseif not (string.find(anim, 'idle') == nil) or not (string.find(anim, 'dance') == nil) then
            setProperty('camFollow.x', xy[1]);
            setProperty('camFollow.y', xy[2]);
        end
    end

    function onTimerCompleted(n, loops, loopsLeft)
        if n == 'instacam' then
            setProperty('cameraSpeed', 22)
            runTimer('fininstacam', 0.05)
        end
        if n == 'fininstacam' then
            setProperty('cameraSpeed', velcamactual);
        end
    end

    function split(s) --Función con la que se dividen los valores del evento
        local resultados = {}
        for union in (s..","):gmatch("([^,%s]+)") do 
          table.insert(resultados, union)
        end
        return resultados 
    end
end