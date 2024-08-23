local decimalMissColor = -6323721 -- Color en decimar del color 9F81F7 (que es usado para los fallos)
local pixelMissColor = -2390651 -- Color en decimar del color DB8585 (fallos en pixel stages)

local mcChars = {
    'Aquino-Amarrado', 'Aquino_cuanmalo', 'c3jita-mc', 'duxo_boton', 'lucasta', 'lucasta-run',
    'loco_lococlassic', 'duxo_boton'
}

function onCreatePost()
    if getPropertyFromClass('states.PlayState', 'isPixelStage') or songName == 'Trivia' then
        decimalMissColor = pixelMissColor
    end

    for i = 1, #mcChars do
        if boyfriendName == mcChars[i] then
            decimalMissColor = pixelMissColor
        end
    end
end

function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    for i = 1, #mcChars do
        if boyfriendName == mcChars[i] then
            playSound('hit'..getRandomInt(1, 3), 1, 'hiti')
        end
    end

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

function onPause()
    if luaSoundExists('hiti') then
        pauseSound('hiti')
    end
end

function onResume()
    if luaSoundExists('hiti') then
        resumeSound('hiti')
    end
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
		
function goodNoteHit()
	if getProperty('boyfriend.color') == decimalMissColor then
        setProperty('boyfriend.color', 16777215)
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

        if getProperty('gf.color') == decimalMissColor then
            setProperty('gf.color', 16777215)
		end
	end
end