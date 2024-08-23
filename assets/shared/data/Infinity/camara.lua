local xx = 350;
local yy = 530;
local xx2 = 900;
local yy2 = 530;
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
if curStep == 143 or curStep == 335 or curStep == 479 or curStep == 527 or curStep == 816 or curStep == 1200 or curStep == 1327 then
xx = 600;
yy = 530;
xx2 = 600;
yy2 = 530;
end
if curStep == 272 or curStep == 400 or curStep == 496 or curStep == 783 or curStep == 944 or curStep == 1312 then
xx = 350;
yy = 530;
xx2 = 900;
yy2 = 530;
end
end