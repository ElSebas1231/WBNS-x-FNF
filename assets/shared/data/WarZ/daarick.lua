-- script originally by ItsCapp, Modified by ElSebas1231

-- simply, offsets. they're the numbers in the top left of the character editor
idleoffsets = {'-423', '5'} -- I recommend you have your idle offset at 0
leftoffsets = {'-449', '5'}
downoffsets = {'-422', '5'}
upoffsets = {'-425', '5'}
rightoffsets = {'-401', '5'}

-- change all of these to the name of the animation in your character's xml file
idle_xml_name = 'idle0'
left_xml_name = 'left0'
down_xml_name = 'down0'
up_xml_name = 'up0'
right_xml_name = 'right0'

-- Basically horizontal and vertical positions
x_position = -720
y_position = 130

-- Scales your character (set to 1 by default)
xScale = 1
yScale = 1

-- pretty self-explanitory
name_of_character_xml = 'daarickleft'
name_of_character = 'darick-left'
name_of_notetype = 'Enemyextra1'

-- if it's set to true the character appears behind the default characters, including gf, watch out for that
foreground = false
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