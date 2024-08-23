function onCreate()
    makeAnimatedLuaSprite("ESUNTIO", 'cejo/memes/ESUNTIO', 150, 50)
    addAnimationByPrefix("ESUNTIO", "idle", "UNTIONOWAY0", 12, false)
    setObjectCamera('ESUNTIO', 'Other')
    scaleObject("ESUNTIO", 0.5, 0.5)
    setProperty('ESUNTIO.alpha',0)

    makeAnimatedLuaSprite("noseelname",'cejo/memes/noseelname', 850, 250)
    addAnimationByPrefix("noseelname", "idle", "noseelname a0", 12, false)
    setObjectCamera('noseelname', 'Other')
    scaleObject("noseelname", 0.7, 0.7)
    setProperty('noseelname.alpha',0)
end

function onStepHit()
    if curStep >= 415 then
        if luaSpriteExists('ESUNTIO') then
            removeLuaSprite('ESUNTIO', true)
        end
    end

    if curStep >= 704 then
        if luaSpriteExists('noseelname') then
            removeLuaSprite('noseelname', true)
        end
    end
end

function onEvent(n,v1,v2)
    if n == 'sanfordxd' then
        if v1 == 'untio' then
            playAnim('ESUNTIO', 'idle', true)
            addLuaSprite("ESUNTIO", true )
            doTweenAlpha("noway", "ESUNTIO", 1, 0.2,'linear')    
            runTimer('noway', 1.05)
        end

        if v1 == 'noway' then
            playAnim('noseelname', 'idle', true)
            addLuaSprite('noseelname', true)
            doTweenAlpha("lol", "noseelname", 1, 0.4,'linear')    
            runTimer('a', 3)
        end
    end
end

function onTimerCompleted(tag)
    if tag == 'noway' then
        doTweenAlpha('byebye', 'ESUNTIO', 0, 0.2, 'linear');
    end
    if tag == 'a' then
        doTweenAlpha("awa", "noseelname", 0, 0.2,'linear')   
    end
end
        
function onTweenCompleted(tag)
    if tag == 'byebye' then
        removeLuaSprite('ESUNTIO', true);
    end
    if tag == 'awa' then
        removeLuaSprite('noseelname', true);
    end
end
