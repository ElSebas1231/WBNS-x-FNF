local xx = 130;
local yy = 490; 
local xx2 = 800; 
local yy2 = 650; 
local xx3 = 550; 
local yy3 = 600; 
local ofs = 20; 
local followchars = true; 
local del = 0;
local del2 = 0;

function onUpdate()
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
if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
triggerEvent('Camera Follow Pos',xx-ofs,yy)
end
if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
triggerEvent('Camera Follow Pos',xx+ofs,yy)
end
if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
triggerEvent('Camera Follow Pos',xx,yy-ofs)
end
if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
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
if gfSection == true then 
if getProperty('gf.animation.curAnim.name') == 'singLEFT' then 
triggerEvent('Camera Follow Pos',xx3-ofs,yy3) 
end
if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
end
if getProperty('gf.animation.curAnim.name') == 'singUP' then
triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
end
if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
end
if getProperty('gf.animation.curAnim.name') == 'singLEFT-alt' then 
triggerEvent('Camera Follow Pos',xx3-ofs,yy3) 
end
if getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
end
if getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
end
if getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
end
if getProperty('gf.animation.curAnim.name') == 'entrada' then
triggerEvent('Camera Follow Pos',xx3,yy3)
	end
if getProperty('gf.animation.curAnim.name') == 'llamada' then
triggerEvent('Camera Follow Pos',xx3,yy3)
	end
if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
triggerEvent('Camera Follow Pos',xx3,yy3)
	end
if getProperty('gf.animation.curAnim.name') == 'idle' then
triggerEvent('Camera Follow Pos',xx3,yy3)
	end
end
else
triggerEvent('Camera Follow Pos','','') -- Self explanatory
end
end

function onStepHit()
if curStep == 269 then
xx = 450
yy = 520; 
end
if curStep == 287 then
xx = 100
end
if curStep == 399 or curStep == 527 or curStep == 1328 then
xx = 480;
yy = 580; 
xx2 = 480; 
yy2 = 580; 
xx3 = 480; 
yy3 = 580; 
end
if curStep == 416 or curStep == 928 or curStep == 1344 or curStep == 1888 then
xx = 130;
yy = 490; 
xx2 = 800; 
yy2 = 650; 
xx3 = 520; 
yy3 = 580; 
end
if curStep == 768 then
xx = 520;
yy = 580; 
xx2 = 520; 
yy2 = 580; 
xx3 = 520; 
yy3 = 580; 
end
if curStep == 1472 then
xx = 450
yy = 520; 
xx2 = 450 
yy2 = 520;  
xx3 = 450
yy3 = 520;
end
end