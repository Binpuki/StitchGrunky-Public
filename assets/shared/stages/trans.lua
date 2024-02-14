function onCreate()
    makeLuaSprite("sky", 'white', -450, -100)
    addLuaSprite("sky", false)

    makeLuaSprite("pinkg", 'pink', -450, -100)
    addLuaSprite("pinkg", false)

    makeLuaSprite("putple", 'purplegradient', -450, -100)
    addLuaSprite("putple", false)

    makeLuaSprite("bg", 'mountainbg', -400, 550)
    addLuaSprite("bg", false)

    makeLuaSprite("mountain", 'bgmountain', -350, 550)
    addLuaSprite("mountain", false)

    makeLuaSprite("bgROCK", 'rock3', -650, 550)
    addLuaSprite("bgROCK", false)

    makeLuaSprite("bgROCK2", 'rock3straight', -650, 550)
    addLuaSprite("bgROCK2", false)

    makeLuaSprite("bgROCK3", 'rock2', -650, 550)
    addLuaSprite("bgROCK3", false)

    makeLuaSprite("bgROCK14", 'rock1', -650, 550)
    addLuaSprite("bgROCK14", false)

    setScrollFactor("bgROCK", 0.7, 1.05)
    setScrollFactor("bgROCK2", 0.725, 1.05)
    setScrollFactor("bgROCK3", 0.75, 1.05)
    setScrollFactor("bgROCK14", 0.775, 1.05)
    setScrollFactor("mountain", 0.5, 1)
    setScrollFactor("bg", 0.3, 1)
    setScrollFactor("sky", 0.4, 1.1)
    setScrollFactor("pinkg", 0.4, 1.15)
    setScrollFactor("putple", 0.4, 1.2)

    makeLuaSprite("floor", "floor", -600, -325)
    addLuaSprite("floor", false)

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

function onUpdate(elapsed)
    if mustHitSection then 
        setProperty("defaultCamZoom", 1.1)
    else
        setProperty("defaultCamZoom", 1.35)
    end
end

function onBeatHit()
    if curBeat == 80 then
        doTweenY("up", "bg", -250, 1, "backOut")
        doTweenY("up2", "mountain", -250, 2, "backOut")
        doTweenY("up3", "bgROCK", -250, 2.5, "backOut")
        doTweenY("up4", "bgROCK2", -250, 1.2, "backOut")
        doTweenY("up5", "bgROCK3", -250, 1.4, "backOut")
        doTweenY("up6", "bgROCK14", -250, 2, "backOut")
    end
end
