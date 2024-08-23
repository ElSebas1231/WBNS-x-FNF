function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Duxo Note' then
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
			setPropertyFromGroup('unspawnNotes', i, 'lowPriority', true)

			setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false)
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashData.useRGBShader', true)
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashData.texture', 'noteSplashes/noteSplashes-rgb')
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashData.r', getColorFromHex('666666'))
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashData.g', getColorFromHex('413544'))
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashData.b', getColorFromHex('3e3141'))			
		end
	end
end

function goodNoteHit(index, noteData, noteType, isSustainNote)
    if mustHitSection then
        if noteType == 'Alt Animation' then
            setPropertyFromGroup('Duxo Note', noteData, 'texture', 'noteSkins/NOTE_assets-duxo')
        end
    end
end