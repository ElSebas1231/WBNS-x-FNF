local weas = {'pez', 'fondo', 'light', 'dad', 'boyfriend', 'camHUD'}
function onCreate()
    makeLuaSprite('bgblanco', nil, -750,  -300)
    makeGraphic('bgblanco', 1350 ,900,'ffffff')
    scaleObject('bgblanco', 2, 2)
    setProperty('bgblanco.alpha', 0)
    addLuaSprite('bgblanco')

    makeLuaSprite("cejo",'21_sin_titulo_20240715164009', 450, 380)
    scaleObject("cejo", 0.45, 0.45)
    addLuaSprite("cejo", false)

makeAnimatedLuaSprite('ratadance', 'ratadance', 1050, 380)
addAnimationByPrefix("ratadance", "idle", "idle0", 35, true)
scaleObject('ratadance', 0.7, 0.7)
addLuaSprite('ratadance')

makeAnimatedLuaSprite('patodance', 'aquinopato', -250, 380)
addAnimationByPrefix("patodance", "idle", "idle0", 35, true)
scaleObject('patodance', 1.5, 1.5)
addLuaSprite('patodance')

    makeLuaSprite("duxo",'DUXO_1616699474291', 1025, 850)
    scaleObject("duxo", 0.45, 0.45)
    addLuaSprite("duxo", true)

    makeLuaSprite("aquino",'Aquino_example', -50, 850)
    scaleObject("aquino", 1.32, 1.32)
    addLuaSprite("aquino", true)

    makeLuaSprite('negrooscuro', nil, 0, 0)
    makeGraphic('negrooscuro', 1350 ,900,'000000')
    setObjectCamera('negrooscuro', 'camHUD')
    scaleObject('negrooscuro', 1.8, 1.8)
    setProperty('negrooscuro.alpha', 0)
    addLuaSprite('negrooscuro')

    makeLuaSprite("pato",'19_sin_titulo_20240715161605', -950, 50)
    setObjectCamera('pato', 'camHUD')
    scaleObject("pato", 0.9, 0.9)
    addLuaSprite("pato", false)

    makeLuaSprite("rata",'20_sin_titulo_20240715162912', 1500, 50)
    setObjectCamera('rata', 'camHUD')
    scaleObject("rata", 0.9, 0.9)
    addLuaSprite("rata", false)

    makeLuaSprite('flash', nil, 0, 0)
    makeGraphic('flash', 1350 ,900,'ffffff')
    setObjectCamera('flash', 'Other')
    setBlendMode('flash','add')
    scaleObject('flash', 1.8, 1.8)
    setProperty('flash.alpha', 0)
    addLuaSprite('flash')

setProperty('pez.visible', false)
setProperty('fondo.visible',  false)
setProperty('camHUD.visible', false)
setProperty('light.visible', false)
setProperty('dad.visible', false)
setProperty('boyfriend.visible', false)
setProperty('boyfriend.alpha', 1)
setProperty('dad.alpha', 1)
    setProperty('bgblanco.alpha', 0)
    setProperty('ratadance.alpha', 0)
    setProperty('patodance.alpha', 0)
    setProperty('cejo.alpha', 0)

    setProperty('aquino.alpha', 0)
    setProperty('duxo.alpha', 0)
    setProperty('cameraSpeed', 2.5)    
end


function onStepHit()
    if curStep % 4 == 0 then
    setProperty('pato.scale.x',1.5)
    setProperty('pato.scale.y',0.5)
    doTweenX('scale1', 'pato.scale', 0.9, 0.15,'smoothStepIn')
    doTweenY('scale2', 'pato.scale', 0.9, 0.15,'smoothStepIn')
   doTweenY('noway', 'pato', 50, 0.15,'linear')
    setProperty('pato.y',150)
    setProperty('rata.scale.x',1.5)
    setProperty('rata.scale.y',0.5)
    doTweenX('rata1', 'rata.scale', 0.9, 0.15,'smoothStepIn')
    doTweenY('rata2', 'rata.scale', 0.9, 0.15,'smoothStepIn')
   doTweenY('rata', 'rata', 50, 0.15,'linear')
    setProperty('rata.y',150)
    setProperty('rata.flipX', true)
    setProperty('pato.flipX', true)
    setProperty('cejo.flipX', true)
   doTweenY('wazay', 'cejo', 380, 0.15,'linear')
    setProperty('cejo.y',420)
   end
    if curStep % 8 == 0 then
    setProperty('rata.flipX', false)
    setProperty('pato.flipX', false)
    setProperty('cejo.flipX', false)
   end
if curStep == 5 or curStep == 384 then
    doTweenAlpha("flash", "flash", 1, 0.8, "linear")
end
if curStep == 16 or curStep == 400 then
    setProperty('flash.alpha', 0)
end
if curStep == 87 then
    doTweenAngle("duxo", "duxo", 360, 1, "linear")
    doTweenY("duxo1", "duxo", 550, 0.5, "")
    doTweenAlpha("duxo2", "duxo", 1, 1, "linear")
end
if curStep == 110 then
    doTweenAngle("aquino", "aquino", 360, 1, "linear")
    doTweenY("aquino1", "aquino", 550, 0.5, "")
    doTweenAlpha("aquino2", "aquino", 1, 1, "linear")
end
if curStep == 144 or curStep == 400 or curStep == 656 or curStep == 1168 then
setProperty('pez.visible', true)
setProperty('fondo.visible', true)
setProperty('camHUD.visible', true)
setProperty('light.visible', true)
setProperty('boyfriend.visible', true)
setProperty('dad.visible', true)
setProperty('aquino.alpha', 0)
setProperty('duxo.alpha', 0)
end
if curStep == 272 or curStep == 528 then
setProperty('pez.visible', false)
setProperty('fondo.visible',  false)
setProperty('camHUD.visible', false)
setProperty('light.visible', false)
setProperty('boyfriend.alpha', 0)
setProperty('dad.alpha', 0)
ColorTrans('dad', 255, 255, 255)
ColorTrans('boyfriend', 255, 255, 255)
end
    if curStep == 295 or curStep == 544 then
        doTweenAlpha("a", "dad", 1, 5, "linear")
        doTweenAlpha("b", "boyfriend", 1, 5, "linear")
end
if curStep == 400 or curStep == 656 then
ColorTrans('dad', 0, 0, 0)
ColorTrans('boyfriend', 0, 0, 0)
end
if curStep == 640 then
setProperty('camGame.visible',false)
end
if curStep == 656 then
setProperty('camGame.visible', true)
end
if curStep == 770 then
    doTweenAlpha("duxo2", 'negrooscuro', 0.8, 0.5, "linear")
end
if curStep == 784 or curStep == 792 or curStep == 800 then
doTweenX('a', 'pato', 150, 0.15,'smoothStepIn')
end
if curStep == 788 or curStep == 796 or curStep == 804 then
doTweenX('a', 'pato', 500, 0.15,'smoothStepIn')
end
if curStep ==  816 then
doTweenX('a', 'pato', -150, 0.15,'smoothStepIn')
doTweenX('b', 'rata', 550, 0.15,'smoothStepIn')
end
if curStep ==  848 then
doTweenX('a', 'pato', 50, 0.15,'smoothStepIn')
doTweenX('b', 'rata', 1550, 0.15,'smoothStepIn')
end
if curStep ==  864 then
doTweenX('a', 'pato', 150, 0.15,'smoothStepIn')
end
if curStep ==  880 then
doTweenX('a', 'pato', 250, 0.15,'smoothStepIn')
end
if curStep ==  896 then
doTweenX('a', 'pato', 350, 0.15,'smoothStepIn')
end
if curStep ==  912 then
doTweenX('a', 'pato', -550, 0.15,'smoothStepIn')
doTweenX('b', 'rata', 350, 0.15,'smoothStepIn')
end
if curStep ==  917 then
doTweenAngle('a', 'rata', 3960, 4 ,'linear')
end
if curStep ==  960 then
doTweenX('a', 'pato', 50, 0.15,'smoothStepIn')
doTweenX('b', 'rata', 550, 0.15,'smoothStepIn')
end
if curStep ==  976 then
doTweenX('a', 'pato', -950, 0.5,'smoothStepIn')
doTweenX('b', 'rata', 1550, 0.5,'smoothStepIn')
doTweenAngle('c', 'pato', 3960, 1 ,'linear')
doTweenAngle('d', 'rata', 3960, 1 ,'linear')
doTweenAlpha("duxo2", 'negrooscuro', 0, 0.5, "linear")
end
if curStep ==  1040 then
setProperty('pez.visible', false)
setProperty('fondo.visible',  false)
setProperty('light.visible', false)
setProperty('boyfriend.alpha', 0)
setProperty('dad.alpha', 0)
doTweenAlpha("waza", 'negrooscuro', 0, 4, "linear")
doTweenAlpha("pato", 'patodance', 1, 4, "linear")
doTweenAlpha("ez", 'cejo', 1, 2.5, "linear")
doTweenX('b', 'patodance', 50, 2,'smoothStepIn')
setProperty('negrooscuro.alpha', 1)
    setProperty('bgblanco.alpha', 1)
end
if curStep ==  1104 then
doTweenAlpha("roedordance", 'ratadance', 1, 4, "linear")
doTweenX('d', 'ratadance', 850, 2,'smoothStepIn')
end
if curStep == 1168 then
    setProperty('bgblanco.alpha', 0)
    setProperty('ratadance.alpha', 0)
    setProperty('patodance.alpha', 0)
    setProperty('cejo.alpha', 0)
setProperty('boyfriend.alpha', 1)
setProperty('dad.alpha', 1)
end
if curStep == 1296 then
    setProperty('camGame.alpha', 0)
    setProperty('camHUD.alpha', 0)
end
end



function ColorTrans(tag ,n1, n2, n3)
setProperty(tag..".colorTransform.greenOffset", n1)
setProperty(tag..".colorTransform.redOffset", n2)
setProperty(tag..".colorTransform.blueOffset", n3)
end