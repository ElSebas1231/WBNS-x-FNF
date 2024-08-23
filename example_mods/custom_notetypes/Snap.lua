function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Snap' then
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)	
		end
	end
end

function opponentNoteHit(index, noteData, noteType, isSustainNote)
    if dadName == 'adrian' then
        if noteType == 'Snap' then
            playAnim('dad', 'snap', true)
            setProperty('dad.specialAnim', true)
        end
    end
end