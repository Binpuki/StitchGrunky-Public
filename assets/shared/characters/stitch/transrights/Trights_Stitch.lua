function onCreate()
	debugTrace("Trights init!")

	setPropertyFromClass('GameOverSubstate', 'characterName', 'Trights_Stitch'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'stitch/amongkill'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'stitch/silence'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'stitch/bwopm'); --put in mods/music/
end