local xx = 500;
local yy = 420;
local xx2 = 900;
local yy2 = 530;
local ofs = 10;
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
if curStep == 767 then
xx = 700;
yy = 500;
xx2 = 700;
yy2 = 500;
end
if curStep == 831 then
xx = 500;
yy = 420;
xx2 = 900;
yy2 = 530;
end
end