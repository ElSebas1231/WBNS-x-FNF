local decimalMissColor = -6323721 -- Color en decimar del color 9F81F7 (que es usado para los fallos)

function onCreatePost()
    if isRunning('scripts/miss') then
        removeLuaScript('scripts/miss')
    end
end

function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    if not getProperty('boyfriend.animation.curAnim.name'):find('miss') then
        if getProperty('boyfriend.animation.curAnim.name') ~= 'idle' or not getProperty('boyfriend.animation.curAnim.name'):find('sing') then
            playAnim('boyfriend', getProperty('singAnimations['..noteData..']'), true)
            if getProperty('boyfriend.color') == 16777215 then
                setProperty('boyfriend.color', decimalMissColor)
            end
        end
    end

    if not getProperty('gf.animation.curAnim.name'):find('miss') then
        if getProperty('gf.animation.curAnim.name') ~= 'idle' or not getProperty('gf.animation.curAnim.name'):find('sing') then
            playAnim('gf', getProperty('singAnimations['..noteData..']'), true)
            if getProperty('gf.color') == 16777215 then
                setProperty('gf.color', decimalMissColor)
            end
        end
    end

	runTimer('miss', 0.5)
end

function noteMissPress(membersIndex)
    if not getProperty('boyfriend.animation.curAnim.name'):find('miss')then
        playAnim('boyfriend', getProperty('singAnimations['..membersIndex..']'), true)
        if getProperty('boyfriend.color') == 16777215 then
            setProperty('boyfriend.color', decimalMissColor)
        end
    end

    if not getProperty('gf.animation.curAnim.name'):find('miss') then
        playAnim('gf', getProperty('singAnimations['..membersIndex..']'), true)
        if getProperty('gf.color') == 16777215 then
            setProperty('gf.color', decimalMissColor)
        end
    end

	runTimer('miss', 0.5)
end
		
function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
	if getProperty('boyfriend.color') == decimalMissColor then
        setProperty('boyfriend.color', 16777215)
    end

    if getProperty('gf.color') == decimalMissColor then
        setProperty('gf.color', 16777215)
    end

    cancelTween('miss')
end

function onTimerCompleted(t)
	if t == 'miss' then
		if getProperty('boyfriend.color') == decimalMissColor then
            setProperty('boyfriend.color', 16777215)
		end

        if getProperty('gf.color') == decimalMissColor then
            setProperty('gf.color', 16777215)
		end
	end
end