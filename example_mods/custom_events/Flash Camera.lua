function onEvent(n,v1,v2)
if n == 'Flash Camera' then
makeLuaSprite('flash', '', 0, 0);
makeGraphic('flash',screenWidth, screenHeight,'ffffff')
addLuaSprite('flash', true);
setProperty('flash.scale.x',2)
setProperty('flash.scale.y',2)
setObjectCamera('flash','other')
setProperty('flash.alpha',v2)
doTweenAlpha('flTw','flash',0,v1,'linear')
end
end