function onCreate()
	if songName == "manual" then
	setProperty("instakillOnMiss", false)
	else
	setProperty("instakillOnMiss", true)
	end
end

function onUpdate(elapsed)
	if songName == "manual" then
		setProperty("health", 10)
	end
end