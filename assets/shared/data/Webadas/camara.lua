local xx = -200;
local yy = 630;
local xx2 = 550;
local yy2 = 720;
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
   if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
   triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
   end
   if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
   triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
   end
   if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
   triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
   end
   if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
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
if curStep == 192 or curStep == 704 then
xx = -200
yy = 630
xx2 = 550
yy2 = 750
end
if curStep == 128 or curStep == 574 then
xx = 180;
yy = 630;
xx2 = 180;
yy2 = 630;
end
end