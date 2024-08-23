local decimalMissColor = -2390651 -- Color en decimar del color 9F81F7 (que es usado para los fallos)

function onCreatePost()
    if isRunning('scripts/miss') then
        removeLuaScript('scripts/miss')
    end
end

function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    playSound('hit'..getRandomInt(1, 3), 1, 'hiti')

    if noteType == '' then
        if not getProperty('boyfriend.animation.curAnim.name'):find('miss') then
            if getProperty('boyfriend.animation.curAnim.name') ~= 'idle' or not getProperty('boyfriend.animation.curAnim.name'):find('sing') then
                playAnim('boyfriend', getProperty('singAnimations['..noteData..']'), true)
                if getProperty('boyfriend.color') == 16777215 then
                    setProperty('boyfriend.color', decimalMissColor)
                end
            end
        end
    else
        if getProperty('boyfriend.animation.curAnim.name'):find('miss') then
            playAnim('boyfriend', 'idle')
        end
    end

    if noteType == 'Enemyextra1' then
        if luaSpriteExists('duxo1') then
            if not getProperty('duxo1.animation.curAnim.name'):find('miss') then
                if getProperty('duxo1.animation.curAnim.name') ~= 'idle' or not getProperty('duxo1.animation.curAnim.name'):find('sing') then
                    playAnim('duxo1', getProperty('singAnimations['..noteData..']'), true)
                    if getProperty('duxo1.color') == 16777215 then
                        setProperty('duxo1.color', decimalMissColor)
                    end
                end
            end
        end
    else
        if getProperty('duxo1.animation.curAnim.name'):find('miss') then
            playAnim('duxo1', 'idle')
        end

        if getProperty('boyfriend.animation.curAnim.name'):find('miss') then
            playAnim('boyfriend', 'idle')
        end
    end

    if noteType == 'Soarinng Note' then
        if not gfSection and noteType ~= 'GF Sing' then
            if not getProperty('soarinngEnd.animation.curAnim.name'):find('miss') then
                if getProperty('soarinngEnd.animation.curAnim.name') ~= 'idle' or not getProperty('soarinngEnd.animation.curAnim.name'):find('sing') then
                    playAnim('soarinngEnd', getProperty('singAnimations['..noteData..']'), true)
                    if getProperty('soarinngEnd.color') == 16777215 then
                        setProperty('soarinngEnd.color', decimalMissColor)
                    end
                end
            end
        end
    else
        if getProperty('soarinngEnd.animation.curAnim.name'):find('miss') then
            playAnim('soarinngEnd', 'idle')
        end
    end

    if noteType == 'Loco Note' then
        if not gfSection and noteType ~= 'GF Sing' then
            if not getProperty('locoEnd.animation.curAnim.name'):find('miss') then
                if getProperty('locoEnd.animation.curAnim.name') ~= 'idle' or not getProperty('locoEnd.animation.curAnim.name'):find('sing') then
                    playAnim('locoEnd', getProperty('singAnimations['..noteData..']'), true)
                    if getProperty('locoEnd.color') == 16777215 then
                        setProperty('locoEnd.color', decimalMissColor)
                    end
                end
            end
        end
    else
        if getProperty('locoEnd.animation.curAnim.name'):find('miss') then
            playAnim('locoEnd', 'idle')
        end
    end

    if noteType == 'Duxo Note' then
        if not gfSection and noteType ~= 'GF Sing' then
            if not getProperty('duxo2.animation.curAnim.name'):find('miss') then
                if getProperty('duxo2.animation.curAnim.name') ~= 'idle' or not getProperty('duxo2.animation.curAnim.name'):find('sing') then
                    playAnim('duxo2', getProperty('singAnimations['..noteData..']'), true)
                    if getProperty('duxo2.color') == 16777215 then
                        setProperty('duxo2.color', decimalMissColor)
                    end
                end
            end
        end
    else
        if getProperty('duxo2.animation.curAnim.name'):find('miss') then
            playAnim('duxo2', 'idle')
        end
    end

    if noteType ~= 'No Animation' then
        if gfSection or noteType == 'GF Sing' then
            if mustHitSection then
                if not getProperty('gf.animation.curAnim.name'):find('miss') then
                    if getProperty('gf.animation.curAnim.name') ~= 'idle' or not getProperty('gf.animation.curAnim.name'):find('sing') then
                        playAnim('gf', getProperty('singAnimations['..noteData..']'), true)
                        if getProperty('gf.color') == 16777215 then
                            setProperty('gf.color', decimalMissColor)
                        end
                    end
                end
            end
        end
    else
        if getProperty('gf.animation.curAnim.name'):find('miss') then
            playAnim('gf', 'idle')
        end
    end
	runTimer('miss', 0.5)
end

function noteMissPress(membersIndex)
    if not gfSection then
        if not getProperty('boyfriend.animation.curAnim.name'):find('miss')then
            playAnim('boyfriend', getProperty('singAnimations['..membersIndex..']'), true)
            if getProperty('boyfriend.color') == 16777215 then
                setProperty('boyfriend.color', decimalMissColor)
            end
        end
	end

	if gfSection or getProperty('gf.animation.curAnim.name'):find('sing') then
        if mustHitSection then
            if not getProperty('gf.animation.curAnim.name'):find('miss') then
                playAnim('gf', getProperty('singAnimations['..membersIndex..']'), true)
                if getProperty('gf.color') == 16777215 then
                    setProperty('gf.color', decimalMissColor)
                end
            end
        else
            if not getProperty('boyfriend.animation.curAnim.name'):find('miss')then
                playAnim('boyfriend', getProperty('singAnimations['..membersIndex..']'), true)
                if getProperty('boyfriend.color') == 16777215 then
                    setProperty('boyfriend.color', decimalMissColor)
                end
            end
        end
	end
	runTimer('miss', 0.5)
end
		
function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
	if getProperty('boyfriend.color') == decimalMissColor then
        setProperty('boyfriend.color', 16777215)
    end

    if noteType == 'Soarinng Note' then
        if getProperty('soarinngEnd.color') == decimalMissColor then
            setProperty('soarinngEnd.color', 16777215)
        end
    end

    if noteType == 'Loco Note' then
        if getProperty('locoEnd.color') == decimalMissColor then
            setProperty('locoEnd.color', 16777215)
        end
    end

    if noteType == 'Duxo Note' then
        if getProperty('duxo2.color') == decimalMissColor then
            setProperty('duxo2.color', 16777215)
        end
    end

	if gfSection or getProperty('gf.animation.curAnim.name') == 'idle' then
		if getProperty('gf.color') == decimalMissColor then
            setProperty('gf.color', 16777215)
		end
	end
    cancelTween('miss')
end

function onTimerCompleted(t)
	if t == 'miss' then
		if getProperty('boyfriend.color') == decimalMissColor then
            setProperty('boyfriend.color', 16777215)
		end

        if getProperty('duxo1.color') == decimalMissColor then
            setProperty('duxo1.color', 16777215)
        end

        if getProperty('soarinngEnd.color') == decimalMissColor then
            setProperty('soarinngEnd.color', 16777215)
        end
        
        if getProperty('locoEnd.color') == decimalMissColor then
            setProperty('locoEnd.color', 16777215)
        end

        if getProperty('duxo2.color') == decimalMissColor then
            setProperty('duxo2.color', 16777215)
        end

        if getProperty('gf.color') == decimalMissColor then
            setProperty('gf.color', 16777215)
		end
	end
end