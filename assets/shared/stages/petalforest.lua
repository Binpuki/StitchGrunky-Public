local PETALS = 0

function onCreate()
	makeLuaSprite("sky", 'sky', -1200, -600)

	makeLuaSprite("cloud", 'cloud', -1200, -600)

	makeLuaSprite("secondcloud", 'secondcloud', -1200, -600)

	makeLuaSprite("foregroundcloud", 'foregroundcloud', -1200, -600)

	makeLuaSprite("foregroundthing", 'foregroundthing', -1200, -600)

	makeLuaSprite("bigtreebranch", 'bigtreebranch', -1200, -600)

	makeLuaSprite("leavesbackground", 'leavesbackground', -1200, -600)	

	makeLuaSprite("branchwithleaves", 'branchwithleaves', -1200, -600)

	makeLuaSprite("leavesandotherthing", 'leavesandotherthing', -1200, -600)

	makeLuaSprite("branches", 'branches', -1200, -600)

	makeLuaSprite("cabin", 'cabin', -1200, -600)

	makeLuaSprite('UpperBar', '', 0, -130) --Default value of the y is -130
	makeGraphic('UpperBar', 1500, 550, '000000')
	setObjectCamera('UpperBar', 'hud')
	setScrollFactor('UpperBar', 1.0, 1.0);
	
	makeLuaSprite('LowerBar', '', 0, 650) -- Default value of the y is 650
	makeGraphic('LowerBar', 1500, 550, '000000')
	setObjectCamera('LowerBar', 'hud')
	setScrollFactor('LowerBar', 1.0, 1.0);
	addLuaSprite('LowerBar', true);
	addLuaSprite('UpperBar', true);
	setProperty("UpperBar.y", 625);
	setProperty("LowerBar.y", -450);

	
	setProperty('UpperBar.color', "0x000000")
	setProperty('LowerBar.color', "0x000000")


	makeAnimatedLuaSprite("rope", 'rope', -620, 600)
	addAnimationByPrefix("rope", "rope", "rope", 12, true)

	addLuaSprite("sky", false)
	addLuaSprite("cloud", false)
	addLuaSprite("secondcloud", false)
	addLuaSprite("foregroundcloud", false)
	addLuaSprite("foregroundthing", false)
	addLuaSprite("bigtreebranch", false)	
	addLuaSprite("leavesbackground", false)
	addLuaSprite("branchwithleaves", false)
	addLuaSprite("leavesandotherthing", false)
	addLuaSprite("branches", false)
	addLuaSprite("cabin", false)
	addLuaSprite("rope", false)

	setScrollFactor("branches", 0.9, 0.95)
	setScrollFactor("leavesandotherthing", 0.85, 0.9)
	setScrollFactor("branchwithleaves", 0.75, 0.85)
	setScrollFactor("leavesbackground", 0.65, 0.80)
	setScrollFactor("bigtreebranch", 0.55, 0.75)
	setScrollFactor("foregroundthing", 0.8, 0.70)
	setScrollFactor("foregroundcloud", 0.7, 0.65)
	setScrollFactor("secondcloud", 0.6, 0.60)
	setScrollFactor("cloud", 0.5, 0.55)
	setScrollFactor("sky", 0.4, 0.5)
	
end

function onCountdownStarted()
	if songName == "sew" then
	doTweenZoom("camin", "camGame", 0.85, 0.0001, "expoIn")
	doTweenZoom("camout", "camGame", 0.52, 4.25, "expoOut")
	doTweenY("up", "UpperBar", 325, 0.0001, "expoIn")
	doTweenY("down", "LowerBar", -50, 0.0001, "expoIn")
	doTweenY("up2", "UpperBar", 625, 2.25, "expoOut")
	doTweenY("down2", "LowerBar", -450, 2.25, "expoOut") 
	end
end

function onUpdate(elapsed)

	if lowQuality == false then
		
	
	size = math.random(0.95,1.05)

	if getRandomBool(0.95) then
	
		makeAnimatedLuaSprite("roses"..PETALS, 'petals', getRandomFloat(-1200, 1600), -750)
		addAnimationByPrefix("roses"..PETALS, "rose petals", "rose petals", 12, true)
		addLuaSprite("roses"..PETALS, true)
		doTweenY("DOWN"..PETALS, "roses"..PETALS, 1300, getRandomFloat(15, 30))
		doTweenX("MOVE"..PETALS, "roses"..PETALS, getRandomFloat(-1200, 1600), getRandomFloat(20,60))
		scaleLuaSprite("roses"..PETALS, size, size)
		doTweenAngle("turne"..PETALS, "roses"..PETALS, getRandomFloat(0, 360), 0.00001)

		if PETALS >= 30 then
		PETALS = 1
	end
		PETALS = PETALS + 1
	end
end
end