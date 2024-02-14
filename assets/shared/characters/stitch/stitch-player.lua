function onCreate()
	setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'stitch-player'); --Character json file for the death animation
	setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'stitch/amongkill'); --put in mods/sounds/
	setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', 'stitch/silence'); --put in mods/music/
	setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'stitch/bwopm'); --put in mods/music/
end