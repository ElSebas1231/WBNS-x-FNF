function onCreatePost()
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)
doTweenZoom('zoomoutall', 'camGame', 0.8, 0.01, 'backIn')
setProperty('defaultCamZoom', 0.8)
end

function onSongStart()
doTweenAlpha('1', 'camGame', 1, 6, 'sineInOut')
doTweenAlpha('2', 'camHUD', 1, 2, 'sineInOut')
end


function onEvent(n,v1,v2)
	if n == 'camera_target' then
if v1 == 'all' then
folowcam = true

else
folowcam = false
end
end
end