function onCreatePost()
makeLuaSprite('golden', 'euzqh160ptp61', 0, 0)
setObjectCamera('golden', 'Other')
setProperty('golden.alpha', 0)
scaleObject('golden',0.67,0.67)
addLuaSprite('golden', true)

makeLuaSprite('susto', 'cassid', 0, 0)
setObjectCamera('susto', 'Other')
setProperty('susto.alpha', 0)
scaleObject('susto',1,1)
addLuaSprite('susto', false)

makeLuaSprite('susto1', 'gfed', 0, 0)
setObjectCamera('susto1', 'Other')
setProperty('susto1.alpha', 0)
scaleObject('susto1',1,1)
addLuaSprite('susto1', false)

makeLuaSprite('susto2', 'itsme', 0, 0)
setObjectCamera('susto2', 'Other')
setProperty('susto2.alpha', 0)
scaleObject('susto2',1,1)
addLuaSprite('susto2', false)
end

function onEvent(eventName, value1, value2, strumTime)
if eventName == 'sanfordxd' then
if value1 == 'soaring' then
runTimer('golden', 0.15)
setProperty('golden.alpha', 1)
end
end
if eventName == 'golden' then
if value1 == 'susto' then
runTimer('susto', 0.1)
setProperty('susto.alpha', 1)
end
end
end

function onTimerCompleted(tag)
if tag == 'golden' then
setProperty('golden.alpha', 0)
end
if tag == 'susto' then
runTimer('susto1', 0.1)
setProperty('susto1.alpha', 1)
setProperty('susto.alpha', 0)
end
if tag == 'susto1' then
runTimer('susto2', 0.1)
setProperty('susto2.alpha', 1)
setProperty('susto1.alpha', 0)
end
if tag == 'susto2' then
setProperty('susto2.alpha', 0)
end
end