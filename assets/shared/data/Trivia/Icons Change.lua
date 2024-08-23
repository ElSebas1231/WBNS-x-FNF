--Script by Roval: Odio con toda mi vida a shadowmario que me chupe bien la pija y toda la mrda de código que hizo en el puto psych engine de mrd
function onCreate()
    chars = {'Nat', 'Nat-D', 'Dux', 'Dux-D'}
	makeLuaSprite('Nat', 'Normal-Natalan', getProperty('iconP1.x'), getProperty('iconP1.y'))
	makeLuaSprite('Dux', 'Normal-Duxo', getProperty('iconP1.x'), getProperty('iconP1.y'))
    makeLuaSprite('Nat-D', 'Death-Natalan', getProperty('iconP1.x'), getProperty('iconP1.y'))
	makeLuaSprite('Dux-D', 'Death-Duxo', getProperty('iconP1.x'), getProperty('iconP1.y'))

	carlos = 'iconP1'
    for i = 1, 4 do
	    setObjectOrder(chars[i], getObjectOrder(carlos) - 1)
	    setObjectCamera(chars[i], 'hud')
	    addLuaSprite(chars[i], true)
        setProperty(chars[i]..'.visible',false)
    end
    setProperty('iconP1.visible',true)
end
function goodNoteHit(id, direccion, tipo, esSustain)
    if singer ~= cursinger then
        runTimer('bolas',0.0001)
        singer = cursinger
    end
    if mustHitSection then
        if tipo == 'No Animation' then
            cursinger = 'nat'
            setProperty('iconP1.visible',false)
            duxocanta = false
            natcanta = true
        elseif tipo == 'GF Sing' then
            cursinger = 'dux'
            setProperty('iconP1.visible',false)
            duxocanta = true
            natcanta = false
        else
            cursinger = 'loc'
            setProperty('iconP1.visible',true)
            duxocanta = false
            natcanta = false            
        end
    end
    if gfSection then
        cursinger = 'dux'
        setProperty('iconP1.visible',false)
        duxocanta = true
        natcanta = false
    end
end
function onUpdate()
    for i = 1, 4 do
		setProperty(chars[i]..'.alpha', getProperty(carlos..'.alpha'))
		setProperty(chars[i]..'.angle', getProperty(carlos..'.angle'))
		setProperty(chars[i]..'.y', getProperty(carlos..'.y'))
		setProperty(chars[i]..'.x', 925)
		setProperty(chars[i]..'.scale.x', getProperty(carlos..'.scale.x'))
		setProperty(chars[i]..'.scale.y', getProperty(carlos..'.scale.y'))
        setProperty(chars[i]..'.width', getProperty(carlos..'.width'))
        setProperty(chars[i]..'.flipX', true)
	end

	if getProperty('health') <= 0.4 then
        if natcanta then
            setProperty('Nat.visible',false)
            setProperty('Nat-D.visible',true)
            setProperty('Dux.visible',false)
            setProperty('Dux-D.visible',false)
        elseif duxocanta then
            setProperty('Dux.visible',false)
            setProperty('Dux-D.visible',true)
            setProperty('Nat.visible',false)
            setProperty('Nat-D.visible',false)
        else
            setProperty('Nat.visible',false)
            setProperty('Nat-D.visible',false)
            setProperty('Dux.visible',false)
            setProperty('Dux-D.visible',false)
        end
        setProperty('iconP1.flipX',true)
	else
        if natcanta then
            setProperty('Nat.visible',true)
            setProperty('Nat-D.visible',false)
            setProperty('Dux.visible',false)
            setProperty('Dux-D.visible',false)
        elseif duxocanta then
            setProperty('Dux.visible',true)
            setProperty('Dux-D.visible',false)
            setProperty('Nat.visible',false)
            setProperty('Nat-D.visible',false)
        else
            setProperty('Nat.visible',false)
            setProperty('Nat-D.visible',false)
            setProperty('Dux.visible',false)
            setProperty('Dux-D.visible',false)
        end
        setProperty('iconP1.flipX',false)
	end
end

function onTimerCompleted(a,b,c)
    if a == 'bolas' then
        setProperty('iconP1.angle',20)
        doTweenAngle('iconaaa', 'iconP1', 0, 0.2, 'quadOut')
    end
end