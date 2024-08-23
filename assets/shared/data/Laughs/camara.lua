local xx = 550;
local yy = 630;
local xx2 = 550;
local yy2 = 630;
local ofs = 25;
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
if getProperty('boyfriend.animation.curAnim.name') == 'singLEFTmiss' then
triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
end
if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHTmiss' then
triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
end
if getProperty('boyfriend.animation.curAnim.name') == 'singUPmiss' then
triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
end
if getProperty('boyfriend.animation.curAnim.name') == 'singDOWNmiss' then
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

function onStepHit()
if curStep == 16 or curStep == 160 or curStep == 384 or curStep == 699 then
xx = 180;
yy = 550;
xx2 = 900;
yy2 = 550;
end
if curStep == 288 then
xx = 550;
yy = 630;
xx2 = 550;
yy2 = 630;
end
if curStep == 144 then
xx2 = 180;
end
if curStep == 352 or curStep == 416 or curStep == 824 then
xx = 130;
yy = 580;
xx2 = 130;
yy2 = 580;
end
end