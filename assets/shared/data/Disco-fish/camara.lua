local xx = 410;
local yy = 360
local xx2 = 1060;
local yy2 = 360;
local xx3 = 570; 
local yy3 = 340; 
local ofs = 10; 
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
   if getProperty('dad.animation.curAnim.name') == 'PREPARAR' then
   triggerEvent('Camera Follow Pos',xx,yy)
   end
   if getProperty('dad.animation.curAnim.name') == 'DISPARO' then
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
   if getProperty('boyfriend.animation.curAnim.name') == 'DISPARO' then
   triggerEvent('Camera Follow Pos',xx2,yy2)
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
                if getProperty('gf.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
	            end
            end
    else
        triggerEvent('Camera Follow Pos','','') -- Self explanatory
    end
end

function onStepHit()
if curStep == 576 then
xx = 800;
yy = 360
xx2 = 800;
yy2 = 360;
xx3 = 800;
yy3 = 360
end
if curStep == 640 or curStep == 1152 then
xx = 410;
yy = 360
xx2 = 1060;
yy2 = 360;
xx3 = 570; 
yy3 = 340; 
end
if curStep == 1024 or curStep == 1792 then
xx = 700;
yy = 360
xx2 = 700;
yy2 = 360;
xx3 = 700;
yy3 = 360
end
end