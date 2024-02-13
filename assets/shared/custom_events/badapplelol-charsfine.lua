local hasSpawned = false
function onEvent(name, value1, value2)
	if name == 'badapplelol-charsfine' and value1 == 'a' and hasSpawned == false then
		makeLuaSprite('whitebg', '', -1000, -600)
		setScrollFactor('whitebg', 0, 0)
		makeGraphic('whitebg', 10000, 10000, 'ffffff')
		addLuaSprite('whitebg', false)
		setProperty('whitebg.alpha', 0)
		doTweenAlpha('applebadxd69', 'whitebg', 1, value2, 'linear')
		hasSpawned = true
	end
	if name == 'badapplelol-charsfine' and value1 == 'a' and hasSpawned == true then
		doTweenAlpha('applebadxd69', 'whitebg', 1, value2, 'linear')
	end
	if name == 'badapplelol-charsfine' and value1 == 'b' then
		doTweenAlpha('applebadxd', 'whitebg', 0, value2, 'linear')
	end
end