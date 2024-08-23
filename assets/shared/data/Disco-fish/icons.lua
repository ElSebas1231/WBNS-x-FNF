function opponetNoteHit(index, noteData, noteType, isSustainNote)
    if noteType == 'GF Sing' or gfSection then
        callMethod('iconP2.changeIcon', {getProperty('gf.healthIcon')})
        setHealthBarColors(rgbToHex(getProperty('gf.healthColorArray')), rgbToHex(getProperty('boyfriend.healthColorArray')))
    else
        callMethod('iconP2.changeIcon', {getProperty('dad.healthIcon')})
        setHealthBarColors(rgbToHex(getProperty('dad.healthColorArray')), rgbToHex(getProperty('boyfriend.healthColorArray')))
    end
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end