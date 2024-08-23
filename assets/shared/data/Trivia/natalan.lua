-- script by ItsCapp. Modified by ElSebas1231
-- simply, offsets. they're the numbers in the top left of the character editor
idleoffsets = {'0', '0'} -- I recommend you have your idle offset at 0
leftoffsets = {'0', '0'}
downoffsets = {'0', '0'}
upoffsets = {'0', '0'}
rightoffsets = {'0', '0'}

missleftoffsets = {'0', '0'}
missdownoffsets = {'0', '0'}
missupoffsets = {'0', '0'}
missrightoffsets = {'0', '0'}

-- change all of these to the name of the animation in your character's xml file
idle_xml_name = 'Natalan-Aquisigano idle0'
left_xml_name = 'Natalan-Aquisigano left0'
down_xml_name = 'Natalan-Aquisigano down0'
up_xml_name = 'Natalan-Aquisigano up0'
right_xml_name = 'Natalan-Aquisigano right0'

-- basically horizontal and vertical positions
x_position = 425
y_position = 348

-- scales your character (set to 1 by default)
xScale = 1.4
yScale = 1.4

-- pretty self-explanitory
name_of_character_xml = 'natalangano'
name_of_character = 'natagano'
name_of_notetype = 'No Animation'

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function onCreatePost()
	makeAnimatedLuaSprite(name_of_character, 'characters/' .. name_of_character_xml, x_position, y_position);

	addAnimationByPrefix(name_of_character, 'idle', idle_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singLEFT', left_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singDOWN', down_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singUP', up_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singRIGHT', right_xml_name, 24, false);

	addAnimationByPrefix(name_of_character, 'singLEFTmiss', left_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singDOWNmiss', down_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singUPmiss', up_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singRIGHTmiss', right_xml_name, 24, false);

	scaleObject(name_of_character, xScale, yScale);
	setProperty(name_of_character..'.offset.x', idleoffsets[1]);
	setProperty(name_of_character..'.offset.y', idleoffsets[2]);
	setObjectOrder(name_of_character, getObjectOrder('gfGroup') - 1)
	addLuaSprite(name_of_character)

	if luaSpriteExists(name_of_character) then
        setObjectOrder('boyfriendGroup', getObjectOrder('natagano'))
    end

	if getProperty('skipCountdown') then
		playAnim(name_of_character, 'idle')
	end
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
local singOffsets = {leftoffsets, downoffsets, upoffsets, rightoffsets}
local missOffsets = {missleftoffsets, missdownoffsets, missupoffsets, missrightoffsets}
local idle = true

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == name_of_notetype then
		playAnim(name_of_character, singAnims[direction + 1], true);
		idle = false
		setProperty(name_of_character .. '.offset.x', singOffsets[direction + 1][1])
		setProperty(name_of_character .. '.offset.y', singOffsets[direction + 1][2])
	end
end

function noteMiss(membersIndex, noteData, noteType, isSustainNote)
	if noteType == name_of_notetype then
		playAnim(name_of_character, singAnims[noteData + 1], true)
		idle = false
		setProperty(name_of_character .. '.offset.x', missOffsets[noteData + 1][1])
		setProperty(name_of_character .. '.offset.y', missOffsets[noteData + 1][2])
	end
end

function onStepHit()
	if curStep % 2 == 0 then
		if getProperty(name_of_character..'.animation.curAnim.finished') and getProperty(name_of_character..'.animation.curAnim.name'):find('sing') then
			playAnim(name_of_character, 'idle')
			setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
			setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
		end
		idle = true
	end
end

function onBeatHit()
	if curBeat % 4 == 0 and idle then
        playAnim(name_of_character, 'idle')
		setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
		setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
	end
end

function onCountdownTick(counter)
	if counter % 2 == 0 then
        playAnim(name_of_character, 'idle')
		setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
		setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
	end
end

function onEvent(n,v1,v2)
	if n == 'roval' then
		if v2 == 'nat' or v2 == 'natalan' then
			playAnim(name_of_character, v1)
		end
	end
end
