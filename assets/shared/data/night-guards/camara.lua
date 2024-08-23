local xx = 1315;
local yy = 200;
local xx2 = 815;
local yy2 = 200;
local ofs = 15;
local followchars = true;
local del = 0;
local del2 = 0;

function onUpdate(elapsed)
if del > 0 then
del = del - 1
end
if del2 > 0 then
del2 = del2 - 1
end
if followchars == true then
if mustHitSection == false then
if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
triggerEvent('Camera Follow Pos',xx-ofs,yy)
end
if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
triggerEvent('Camera Follow Pos',xx+ofs,yy)
end
if getProperty('dad.animation.curAnim.name') == 'singUP' then
triggerEvent('Camera Follow Pos',xx,yy-ofs)
end
if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
triggerEvent('Camera Follow Pos',xx,yy+ofs)
end
if getProperty('dad.animation.curAnim.name') == 'idle' then
triggerEvent('Camera Follow Pos',xx,yy)
end
else
if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
end
if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
end
if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
end
if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
end
if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
triggerEvent('Camera Follow Pos',xx2,yy2)
end
end
else
triggerEvent('Camera Follow Pos','','')
end
end

function onEvent(eventName, value1, value2, strumTime)
if eventName == 'sanfordxd' then
if value1 == 'aquino' then
xx = 1315;
yy = 200;
xx2 = 815;
yy2 = 200;
end
if value1 == 'lucasta' then
xx = 615;
yy = 100;
xx2 = 915;
yy2 = 200;
end
if value1 == 'mictia' then
xx = 915;
yy = 0;
xx2 = 615;
yy2 = 200;
end
if value1 == 'michu' then
xx = 915;
yy = 150;
xx2 = 915;
yy2 = 150;
end
if value1 == 'soaring' then
xx = 1015;
yy = 150;
xx2 = 715;
yy2 = 250;
end
end
end