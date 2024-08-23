function onCreate()
    makeLuaSprite('DiscordBg', 'discord/DiscordBg', -1050, -1075)
    scaleObject('DiscordBg', 1.15, 1.15)
    addLuaSprite('DiscordBg', false)

    makeAnimatedLuaSprite('audiencia', 'discord/audiencia', -425, 640)
    addAnimationByPrefix('audiencia', 'idle', 'audiencia de cap', 24, false)
    scaleObject('audiencia', 1.15, 1.15)
    addLuaSprite('audiencia', false)
end

function onCountdownTick(c)
    if c % 2 == 0 then
        playAnim('audiencia', 'idle', true)
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        playAnim('audiencia', 'idle', true)
    end
end