function goodNoteHit(index, noteData, noteType, isSustainNote)
    if noteType == 'GF Sing' or gfSection then
        callMethod('iconP1.changeIcon', {getProperty('gf.healthIcon')})
        setHealthBarColors(rgbToHex(getProperty('dad.healthColorArray')), rgbToHex(getProperty('gf.healthColorArray')))
    else
        callMethod('iconP1.changeIcon', {getProperty('boyfriend.healthIcon')})
        setHealthBarColors(rgbToHex(getProperty('dad.healthColorArray')), rgbToHex(getProperty('boyfriend.healthColorArray')))
    end
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end