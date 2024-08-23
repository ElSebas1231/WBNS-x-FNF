function onCreatePost()
setPropertyFromGroup('playerStrums',0,'x','412')
setPropertyFromGroup('playerStrums',1,'x','527')
setPropertyFromGroup('playerStrums',2,'x','643')
setPropertyFromGroup('playerStrums',3,'x','761')
setPropertyFromGroup('opponentStrums',0,'x', -5000);
setPropertyFromGroup('opponentStrums',1,'x', -5000);
setPropertyFromGroup('opponentStrums',2,'x', -5000);
setPropertyFromGroup('opponentStrums',3, 'x', -5000);
end

local zoomshit = 0;

function onUpdate()
zoomshit = (getProperty('camGame.zoom')/0.7);
setCharacterX('boyfriend',bfx*zoomshit)
setCharacterY('boyfriend',bfy*zoomshit)
end

function onUpdatePost()
if mustHitSection == true then 
setProperty('defaultCamZoom', 0.8)
noteTweenAlpha("waza", 4, 0.9, 0.25, "linear")
noteTweenAlpha("waza1", 5, 0.9, 0.25, "linear")
noteTweenAlpha("waza2", 6, 0.9, 0.25, "linear")
noteTweenAlpha("waza3", 7, 0.9, 0.25, "linear")
else
setProperty('defaultCamZoom', 0.7)
noteTweenAlpha("waza4", 4, 0.5, 0.25, "linear")
noteTweenAlpha("waza5", 5, 0.5, 0.25, "linear")
noteTweenAlpha("waza6", 6, 0.5, 0.25, "linear")
noteTweenAlpha("waza7", 7, 0.5, 0.25, "linear")
end
if gfSection == true then 
setProperty('defaultCamZoom', 0.8)
end
end

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