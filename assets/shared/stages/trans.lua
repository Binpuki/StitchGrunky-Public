clod = 0
function onCreate()
    makeLuaSprite("sky", 'sky', 0, 0)
    addLuaSprite("sky", false)
    setScrollFactor("sky", 0, 0)
    
    makeLuaSprite("buildings", 'buildings', -0, 100)
    addLuaSprite("buildings", false)
    setScrollFactor("buildings", 0.2, 1)

    makeLuaSprite("Upperbar", '', 0, -100)
    makeGraphic("Upperbar", 1500, 200, '000000')
    setObjectCamera("Upperbar", 'hud')
    addLuaSprite("Upperbar", true)
    setScrollFactor("Upperbar", 0.0, 0.0)

    makeLuaSprite("lowerbar", '', 0, 600)
    makeGraphic("lowerbar", 1500, 200, '000000')
    setObjectCamera("lowerbar", 'hud')
    addLuaSprite("lowerbar", true)
    setScrollFactor("lowerbar", 0.0, 0.0)
end

function onUpdate(elapsed)
    if getRandomBool(0.05) then
    makeLuaSprite("cloud1"..clod, 'cloud1', 900, getRandomFloat(-100, -300))
    addLuaSprite("cloud1"..clod, false)
    doTweenX("cloud move1"..clod, "cloud1"..clod, getRandomFloat(-2000, -3000), 90, "linear")
    elseif getRandomBool(0.05) then
    makeLuaSprite("cloud2"..clod, 'cloud2', 900, getRandomFloat(-100, -300))
    addLuaSprite("cloud2"..clod, false)
    doTweenX("cloud move2"..clod, "cloud2"..clod, getRandomFloat(-2000, -3000), 90, "linear")
    elseif getRandomBool(0.05) then
    makeLuaSprite("cloud3"..clod, 'cloud3', 900, getRandomFloat(-100, -300))
    addLuaSprite("cloud3"..clod, false)
    doTweenX("cloud move3"..clod, "cloud3"..clod, getRandomFloat(-2000, -3000), 90, "linear")
    elseif getRandomBool(0.05) then
    makeLuaSprite("cloud4"..clod, 'cloud4', 900, getRandomFloat(-100, -300))
    addLuaSprite("cloud4"..clod, false)
    doTweenX("cloud move4"..clod, "cloud4"..clod, getRandomFloat(-2000, -3000), 90, "linear")
    end
    clod = clod + 1
    end
    if clod >= 10 then 
    clod = 1 
end