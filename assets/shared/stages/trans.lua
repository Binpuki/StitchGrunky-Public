function onCreate()
    makeLuaSprite("sky", 'white', -500, -100)
    addLuaSprite("sky", false)

    makeLuaSprite("pinkg", 'pink', -500, -100)
    addLuaSprite("pinkg", false)

    makeLuaSprite("putple", 'purplegradient', -500, -100)
    addLuaSprite("putple", false)

    makeLuaSprite("bg", 'mountainbg', -500, -100)
    addLuaSprite("bg", false)

    makeLuaSprite("mountain", 'bgmountain', -500, -100)
    addLuaSprite("mountain", false)

    makeLuaSprite("bgROCK", 'rock3', -500, -100)
    addLuaSprite("bgROCK", false)

    makeLuaSprite("bgROCK2", 'rock3straight', -500, -100)
    addLuaSprite("bgROCK2", false)

    makeLuaSprite("bgROCK3", 'rock2', -500, -100)
    addLuaSprite("bgROCK3", false)

    makeLuaSprite("bgROCK14", 'rock1', -500, -100)
    addLuaSprite("bgROCK14", false)

    makeLuaSprite("floor", "floor", -235, 570)--im gonna kill myself, someone please check the code please please please please
    addLuaSprite("floor", false)
	scaleObject("floor", 0.625, 0.6, true)

    makeLuaSprite('UpperBar', '', 0, -130) --Default value of the y is -130
	makeGraphic('UpperBar', 1500, 550, '000000')
	setObjectCamera('UpperBar', 'hud')	
	addLuaSprite('UpperBar', true);	
	setProperty('UpperBar.color', "0x000000")
	setProperty("UpperBar.y", 625);
	setScrollFactor('UpperBar', 1.0, 1.0);
	
	makeLuaSprite('LowerBar', '', 0, 650) -- Default value of the y is 650
	makeGraphic('LowerBar', 1500, 550, '000000')
	setObjectCamera('LowerBar', 'hud')
	setScrollFactor('LowerBar', 1.0, 1.0);	
	setProperty('LowerBar.color', "0x000000")
	addLuaSprite('LowerBar', true);
	setProperty("LowerBar.y", -450);
end