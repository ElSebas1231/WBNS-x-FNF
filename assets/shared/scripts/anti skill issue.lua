local vida = true

function onCreate()
	if songName == 'Boneless Wings' then
		vida = false
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if vida then
		if getProperty('health') >= 1.6 then
			addHealth(difficultyName == 'soarinng' and (0.0065 * healthGainMult) or 0.0045);
		end

		if getProperty('health') >= 0.8 then
			addHealth(difficultyName == 'soarinng' and (0.0045 * healthGainMult) or 0.0025);
		end

		if getProperty('health') >= 0.4 then
			addHealth(difficultyName == 'soarinng' and (0.004 * healthGainMult) or 0.002);
		end

		if isSustainNote then
			if getProperty('health') >= 1.6 then
				addHealth(difficultyName == 'soarinng' and (0.0045 * healthGainMult) or 0.0025);
			end
	
			if getProperty('health') >= 0.8 then
				addHealth(difficultyName == 'soarinng' and (0.00035 * healthGainMult) or 0.00015);
			end
	
			if getProperty('health') >= 0.4 then
				addHealth(difficultyName == 'soarinng' and (0.0030 * healthGainMult) or 0.0010);
			end
		end
	end
end

function noteMiss(id, noteData, noteType, isSustainNote)
	if vida then
		if getProperty('health') >= 1 then
			addHealth(0.0015);
		end

		if getProperty('health') >= 0.8 then
			addHealth(0.00025);
		end

		if getProperty('health') <= 0.4 then
			addHealth(0.017);
		end

		if isSustainNote then
			if getProperty('health') >= 1 then
				addHealth(0.001);
			end
	
			if getProperty('health') >= 0.8 then
				addHealth(0.00020);
			end
	
			if getProperty('health') <= 0.4 then
				addHealth(0.01);
			end
		end
	end

	if difficultyName == 'soarinng' then
		if getProperty('health') <= 0.2 then
			addHealth(0.015)
		end

		if isSustainNote then
			addHealth(0.02)
		end
	end
end

function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
	if vida and difficultyName ~= 'soarinng' then
		if getProperty('health') >= 1.6 then
			addHealth(-0.025);
		end
		if getProperty('health') >= 1.2 then
			addHealth(-0.0015);
		end
		if getProperty('health') >= 0.4 then
			addHealth(-0.007);
		end

		if isSustainNote then
			if getProperty('health') >= 1.6 then
				addHealth(-0.0025);
			end
	
			if getProperty('health') >= 0.8 then
				addHealth(-0.0001);
			end
	
			if getProperty('health') >= 0.4 then
				addHealth(-0.0005);
			end
		end
	end
end