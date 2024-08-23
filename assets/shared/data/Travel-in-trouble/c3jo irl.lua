-- script originally by ItsCapp, Modified by ElSebas1231

-- simply, offsets. they're the numbers in the top left of the character editor
idleoffsets = {'0', '10'} -- I recommend you have your idle offset at 0
leftoffsets = {'1', '9'}
downoffsets = {'-9', '-3'}
upoffsets = {'-14', '24'}
rightoffsets = {'-10', '13'}

-- change all of these to the name of the animation in your character's xml file
idle_xml_name = 'idle instancia 10'
left_xml_name = 'left instancia 10'
down_xml_name = 'down instancia 10'
up_xml_name = 'up instancia 10'
right_xml_name = 'right instancia 10'

-- Basically horizontal and vertical positions
x_position = 250
y_position = 330

-- Scales your character (set to 1 by default)
xScale = 0.8
yScale = 0.8

-- pretty self-explanitory
name_of_character_xml = 'c3jo_irl'
name_of_character = 'c3jo'
name_of_notetype = 'Enemyextra1'

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function onCreate()
	makeAnimatedLuaSprite(name_of_character, 'characters/' .. name_of_character_xml, x_position, y_position);
	addAnimationByPrefix(name_of_character, 'idle', idle_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singLEFT', left_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singDOWN', down_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singUP', up_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singRIGHT', right_xml_name, 24, false);
	scaleObject(name_of_character, xScale, yScale);
	setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
	setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
	playAnim(name_of_character, 'idle')
	setObjectOrder(name_of_character, getObjectOrder('dadGroup') + 1)
	addLuaSprite(name_of_character)
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
local singOffsets = {leftoffsets, downoffsets, upoffsets, rightoffsets};
local idle = true
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == name_of_notetype then
		playAnim(name_of_character, singAnims[direction + 1], true);
		idle = false
		setProperty(name_of_character .. '.offset.x', singOffsets[direction + 1][1]);
		setProperty(name_of_character .. '.offset.y', singOffsets[direction + 1][2]);
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
		triggerEvent('Camera Follow Pos', '', '')
	end
end

function onBeatHit()
	if curBeat % 2 == 0 and idle then
        playAnim(name_of_character, 'idle')
	end
end

function onCountdownTick(counter)
	if counter % 2 == 0 then
        playAnim(name_of_character, 'idle')
	end
end