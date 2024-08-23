function onCreate()
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'bala' then
            setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false)
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'Bullet_Notes')
            setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
            if getPropertyFromGroup('unspawnNotes', i, 'noteData') == 1 or getPropertyFromGroup('unspawnNotes', i, 'noteData') == 2 then
                setPropertyFromGroup('unspawnNotes', i, 'offsetX', 15)
            end
        end
    end
end

function goodNoteHit(index, noteData, noteType, isSustainNote)
    if noteType == 'bala' then
        addHealth(0.02)
		playAnim('boyfriend', 'DISPARO', true)
		setProperty('boyfriend.specialAnim', true)
    end
end

function opponentNoteHit(index, noteData, noteType, isSustainNote)
    if noteType == 'bala' then
        if getHealth() > 0.1 then
            addHealth(-0.02)
            playAnim('dad', 'DISPARO', true)
            setProperty('dad.specialAnim', true)
        end
    end
end