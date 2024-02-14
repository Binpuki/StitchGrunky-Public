function onCreate()
	setPropertyFromClass('ClientPrefs', 'globalAntialiasing', false);

    makeLuaSprite("bag", 'background', -700, -350)
    addLuaSprite("bag", false)
    makeLuaSprite("girl", 'buhzide_gf', -250, 0)
    addLuaSprite("girl", false)
    makeLuaSprite("a", 'buhzide_amminus', -200, 0)
    addLuaSprite("a", false)

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
end