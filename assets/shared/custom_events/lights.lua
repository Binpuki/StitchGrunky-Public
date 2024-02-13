function onCreate()
	makeAnimatedLuaSprite('testicle', 'nutssack', -730, -400)
	addAnimationByPrefix('testicle', '1', 'nutssack 1', 1, false)
	addAnimationByPrefix('testicle', '2', 'nutssack 2', 1, false)
	addLuaSprite('testicle', true)
	setBlendMode('testicle', 'add');
end

function onCreatePost()
	doTweenAlpha('CUMM', 'testicle', 0, 0.01, cubeInOut)
	setProperty('CUMM.alpha', tonumber(0.4))
end

function onEvent(n,v1,v2)
	if n == 'lights' then
		if v1 == '1' then
			doTweenAlpha('nuts', 'testicle', 1, 0.2, cubeInOut)
			setProperty('testicle.alpha', tonumber(0.4))
			objectPlayAnimation('testicle','1',true)

		elseif v1 == '2' then
			doTweenAlpha('nuts', 'testicle', 1, 0.2, cubeInOut)
			setProperty('testicle.alpha', tonumber(0.4))
			objectPlayAnimation('testicle','2',true)
		elseif v1 == 'off' then
			doTweenAlpha('CUMM', 'testicle', 0, v2, cubeInOut)
			setProperty('CUMM.alpha', tonumber(0.4))
		end
	end
end