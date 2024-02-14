function onCreate()

    makeLuaSprite("sky", 'Bg', -500, -250)
    addLuaSprite("sky", false)

    makeLuaSprite("Bg mountains", 'bgmountains', -500, -250)
    addLuaSprite("Bg mountains", false)

    makeLuaSprite("mountains", 'mountains', -500, -250)
    addLuaSprite("mountains", false)

    makeLuaSprite("floor", 'Floor', -500, -250)
    addLuaSprite("floor", false)

    makeLuaSprite("floor glow", 'floorglow', -500, -250)
    addLuaSprite("floor glow", false)

    setProperty("Bg mountains.alpha", 0.5)
    setProperty("mountains.alpha", 0.5)
    setScrollFactor("Bg mountains", 0.7, 1)
    setScrollFactor("mountains", 0.9, 1)

end

function onCreatePost()
    setProperty('boyfriend.visible', false)
end

    