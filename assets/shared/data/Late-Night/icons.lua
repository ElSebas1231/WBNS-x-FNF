function goodNoteHit(index, noteData, noteType, isSustainNote)
    if noteType == 'GF Sing' or gfSection then
        if getProperty('iconP2.char') == 'aquinita_icon' then
            callMethod('iconP1.changeIcon', {getProperty('gf.healthIcon')})
            setHealthBarColors(rgbToHex(getProperty('dad.healthColorArray')), rgbToHex(getProperty('gf.healthColorArray')))
        elseif getProperty('iconP2.char') == 'cejita_icon' then
            callMethod('iconP1.changeIcon', {getProperty('gf.healthIcon')})
            setHealthBarColors(rgbToHex(getProperty('cejita.healthColorArray')), rgbToHex(getProperty('gf.healthColorArray')))
        end
    elseif noteType == '' then
        if getProperty('iconP2.char') == 'aquinita_icon' then
            callMethod('iconP1.changeIcon', {getProperty('boyfriend.healthIcon')})
            setHealthBarColors(rgbToHex(getProperty('dad.healthColorArray')), rgbToHex(getProperty('boyfriend.healthColorArray')))
        elseif getProperty('iconP2.char') == 'cejita_icon' then
            callMethod('iconP1.changeIcon', {getProperty('boyfriend.healthIcon')})
            setHealthBarColors(rgbToHex(getProperty('cejita.healthColorArray')), rgbToHex(getProperty('boyfriend.healthColorArray')))
        end
    end
end

function opponentNoteHit(index, noteData, noteType, isSustainNote)
    if noteType == '' then
        if getProperty('iconP1.char') == 'lacachona_icon' then
            callMethod('iconP2.changeIcon', {getProperty('dad.healthIcon')})
            setHealthBarColors(rgbToHex(getProperty('dad.healthColorArray')), rgbToHex(getProperty('boyfriend.healthColorArray')))
        elseif getProperty('iconP1.char') == 'icon-duxita' then
            callMethod('iconP2.changeIcon', {getProperty('dad.healthIcon')})
            setHealthBarColors(rgbToHex(getProperty('dad.healthColorArray')), rgbToHex(getProperty('gf.healthColorArray')))
        end
    end

    if noteType == 'Enemyextra1' or noteType == 'Enemyduo' then
        if getProperty('iconP1.char') == 'lacachona_icon' then
            callMethod('iconP2.changeIcon', {getProperty('cejita.healthIcon')})
            setHealthBarColors(rgbToHex(getProperty('cejita.healthColorArray')), rgbToHex(getProperty('boyfriend.healthColorArray')))
        elseif getProperty('iconP1.char') == 'icon-duxita' then
            callMethod('iconP2.changeIcon', {getProperty('cejita.healthIcon')})
            setHealthBarColors(rgbToHex(getProperty('cejita.healthColorArray')), rgbToHex(getProperty('gf.healthColorArray')))
        end
    end
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end