function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Soarinng Note' then
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
			setPropertyFromGroup('unspawnNotes', i, 'lowPriority', true)

			setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false)
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashData.useRGBShader', true)
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashData.texture', 'noteSplashes/noteSplashes-rgb')
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashData.r', getColorFromHex('eae23f'))
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashData.g', getColorFromHex('ffffff'))
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashData.b', getColorFromHex('5f3b14'))
		end
	end
end

function goodNoteHit(index, noteData, noteType, isSustainNote)
    if mustHitSection then
        if noteType == 'Alt Animation' then
            setPropertyFromGroup('Soarinng Note', noteData, 'texture', 'noteSkins/NOTE_assets-soarinng')
        end
    end
end