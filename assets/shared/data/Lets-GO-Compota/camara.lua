local xx = 815;
local yy = 400;
local xx2 = 815;
local yy2 = 400;
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
if getProperty('dad.animation.curAnim.name') == 'hey' then
triggerEvent('Camera Follow Pos',xx,yy)
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
if curStep == 384 or curStep == 1152 or curStep == 1488 or curStep == 1536 or curStep == 1744 or curStep == 1792 then
xx = 620
yy = 380
xx2 = 1050
yy2 = 450
end
if curStep == 896 or curStep == 1472 or curStep == 1500 or curStep == 1728 or curStep == 1756 then
xx = 815
yy = 400
xx2 = 815
yy2 = 400
end
end