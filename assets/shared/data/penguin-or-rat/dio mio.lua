function onCreatePost()
makeLuaSprite('negrooscuro', nul, 0, 0)
makeGraphic('negrooscuro', 1350 ,900,'000000')
setObjectCamera('negrooscuro', 'Other')
setProperty('negrooscuro.alpha', 1)
scaleObject('negrooscuro',1.8,1.8)
addLuaSprite('negrooscuro', true)

setProperty('defaultCamZoom', 0.7)
setProperty('camGame.zoom', 1.5)
setProperty('camHUD.zoom', 3.5)

end

function onEvent(n,v1,v2)
if n == 'Flash Camera' then
setBlendMode("flash", 'add')
setObjectCamera("flash",'other') 
end
end

function onStepHit()
if curStep == 1 then
doTweenAlpha("waza", "negrooscuro", 0, 2.5, "linear")
doTweenZoom('camZoom','camGame', 0.8, 2.5, 'QuadOut')
end
if curStep == 1647 then
doTweenAlpha("fin", "negrooscuro", 1, 2, "linear")
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