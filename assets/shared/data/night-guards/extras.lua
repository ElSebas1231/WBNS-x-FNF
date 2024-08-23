function onCreatePost()
setPropertyFromGroup('opponentStrums',0,'x', -5000);
setPropertyFromGroup('opponentStrums',1,'x', -5000);
setPropertyFromGroup('opponentStrums',2,'x', -5000);
setPropertyFromGroup('opponentStrums',3, 'x', -5000);
end

local zoombf = 0.7
local zoomdad = 0.95
local zoom = true

function onUpdatePost()
if zoom then
if mustHitSection == true then 
setProperty('defaultCamZoom', zoombf)
else
setProperty('defaultCamZoom', zoomdad)
end
end
end

function onEvent(eventName, value1, value2, strumTime)
if eventName == 'sanfordxd' then
if value1 == 'aquino' then
zoombf = 0.7
zoomdad = 0.95
zoom = true
end
if value1 == 'lucasta' then
zoombf = 1.05
zoomdad = 0.85
zoom = true
end
if value1 == 'mictia' then
zoombf = 0.85
zoomdad = 0.7
zoom = true
end
if value1 == 'michu' then
zoombf = 0.65
zoomdad = 0.65
zoom = false
end
if value1 == 'soaring' then
zoombf = 0.9
zoomdad = 0.7
zoom = true
end
end
end