local decimalMissColor = -2390651 -- Color en decimar del color 9F81F7 (que es usado para los fallos)

function onCreatePost()
    if isRunning('scripts/miss') then
        removeLuaScript('scripts/miss')
    end
end

function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    playSound('hit'..getRandomInt(1, 3), 1, 'hiti')

    if noteType ~= 'No Animation' then
        if not gfSection and noteType ~= 'GF Sing' then
            if not getProperty('boyfriend.animation.curAnim.name'):find('miss') then
                if getProperty('boyfriend.animation.curAnim.name') ~= 'idle' or not getProperty('boyfriend.animation.curAnim.name'):find('sing') then
                    playAnim('boyfriend', getProperty('singAnimations['..noteData..']'), true)

                    if getProperty('boyfriend.color') == 16777215 then
                        setProperty('boyfriend.color', decimalMissColor)
                    end
                end
            end
        end
    else
        if getProperty('boyfriend.animation.curAnim.name'):find('miss') then
            playAnim('boyfriend', 'idle')
        end
    end

    if noteType == 'No Animation' then
        if not gfSection and noteType ~= 'GF Sing' then
            if not getProperty('natagano.animation.curAnim.name'):find('miss') then
                if getProperty('natagano.animation.curAnim.name') ~= 'idle' or not getProperty('natagano.animation.curAnim.name'):find('sing') then
                    playAnim('natagano', getProperty('singAnimations['..noteData..']'), true)
                    if getProperty('natagano.color') == 16777215 then
                        setProperty('natagano.color', decimalMissColor)
                    end
                end
            end
        end
    else
        if getProperty('natagano.animation.curAnim.name'):find('miss') then
            playAnim('natagano', 'idle')
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

    if noteType == 'No Animation' then
        if getProperty('natagano.color') == decimalMissColor then
            setProperty('natagano.color', 16777215)
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

        if getProperty('natagano.color') == decimalMissColor then
            setProperty('natagano.color', 16777215)
        end

        if getProperty('gf.color') == decimalMissColor then
            setProperty('gf.color', 16777215)
		end
	end
end