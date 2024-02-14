function onCreate()
	setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'stitch-player'); --Character json file for the death animation
	setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'stitch/stitch_death'); --put in mods/sounds/
	setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', 'stitch/silence'); --put in mods/music/
	setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'stitch/stitch_confirm'); --put in mods/music/
end