function onSongStart()
    if  checkFileExists('data/'..songPath..'/credits.txt') then
        makeLuaSprite("Black", '', -900, 0)
        makeGraphic("Black", screenWidth * 2, 250, '000000')
        addLuaSprite("Black", true)
        setObjectCamera("Black", 'hud')
        screenCenter("Black", 'xy')
        setProperty("Black.alpha", 0)
        doTweenAlpha("blacvk", "Black", 0.645, 0.65, "sineInOut")

        makeLuaText("TITLE", "TITLE", 1000, -1000, 250)
        addLuaText("TITLE")
        setTextFont("TITLE", "Dissfunction.ttf")
        setTextBorder("TITLE", 4, "000000")
        setTextSize("TITLE", 100)
        doTweenX("TITLE", "TITLE", 140, 1.25, "sineOut")
        setTextString("TITLE", songName)
        setObjectCamera("TITLE", 'other')

        makeLuaText('ComposerCredit', getTextFromFile('data/'..songPath..'/credits.txt'), 2000, -1500, 400) --credit to nil
        addLuaText('ComposerCredit')
        setTextFont("ComposerCredit", "Dissfunction.ttf")
        setTextColor('ComposerCredit', 'FFFFFF')
        setTextBorder('ComposerCredit', 2, '000000')
        doTweenX("ComposerCredit", "ComposerCredit", -360, 1.30, "sineOut")
        setTextSize('ComposerCredit', 35)

        runTimer("NO title", 2.5, 1)
        runTimer("byebye", 5, 1)
    else
        debugPrint("aw hell naw")
        debugPrint('assets/shared/data/'..songPath..'/credits.txt')
    end
end

function onTimerCompleted(TIMMER)
    if TIMMER == "NO title" then
        doTweenX("TITLE", "TITLE", 2000, 1.3, "sineIn")
        doTweenAlpha("blacvk", "Black", 0, 1.5, "sineIn")
        doTweenX("ComposerCredit", "ComposerCredit", 2000, 2.6, "sineInOut")
    end
    if TIMMER == "byebye" then
        removeLuaText("TITLE", true)
        removeLuaSprite("Black", true)
        removeLuaText("ComposerCredit", true)
    end
end