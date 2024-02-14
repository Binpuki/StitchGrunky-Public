function onCreate()
    makeLuaSprite("floor", "stages/trans/floor", -1000, 200)--im gonna kill myself, someone please check the code please please please please
    addLuaSprite("floor", false)
	scaleObject("floor", 1.25, 0.5, true)
setScrollFactor('floor', 1.4, 1);
setScrollFactor('dad', 1.1, 1.1);
setScrollFactor('boyfriend', 1.1, 1.1);
setScrollFactor('gf', 0.95, 1.1);
	setPerspective("floor", 0.4)
	setProperty("floor.angle", 180)
	--setProperty("defaultCamZoom", 0.15)
end

--[[local beat_events = {
    [8] = function() setPerspective("test", 0.5) end,
    [12] = function() setVanishOffset(nil, -100) end,
    [16] = function() removePerspective("test") end
}

function onBeatHit()
    if beat_events[curBeat] then beat_events[curBeat]() end
end]]

-------------------- DO NOT TOUCH!! --------------------

--[[ perspective sprite ]]

local vanish_offset = {x = 0, y = 0}
local sprites = {}

function setPerspective(tag, depth)
	depth = tonumber(depth) or 1
	
	if sprites[tag] then
		sprites[tag].depth = depth
	else
		sprites[tag] = {
			x = getProperty(tag .. ".x"),
			y = getProperty(tag .. ".y"),
			width = getProperty(tag .. ".width"),
			height = getProperty(tag .. ".height"),
			scale = {x = getProperty(tag .. ".scale.x"), y = getProperty(tag .. ".scale.y")},
			depth = depth
		}

		initLuaShader("perspective")
		setSpriteShader(tag, "perspective")
		setShaderFloatArray(tag, "u_top", {0, 1})
		setShaderFloat(tag, "u_depth", depth)
	end
end

function removePerspective(tag)
	local sprite = sprites[tag]
	if sprite then
		scaleObject(tag, sprite.scale.x, sprite.scale.y, true)
		setProperty(tag .. ".x", sprite.x)
		setProperty(tag .. ".y", sprite.y)
		
		removeSpriteShader(tag)
		
		sprites[tag] = nil
	end
end

function setVanishOffset(x, y)
	if x then vanish_offset.x = tonumber(x) or 0 end
	if y then vanish_offset.y = tonumber(y) or 0 end
end

--

for _, func in pairs({"max"}) do _G[func] = math[func] end

function onUpdatePost()
	local cam = {x = getProperty("camFollowPos.x") + vanish_offset.x, y = getProperty("camFollowPos.y") + vanish_offset.y}

	for tag, sprite in pairs(sprites) do
		local vanish = {x = (cam.x - sprite.x) / sprite.width, y = 1 - (cam.y - sprite.y) / sprite.height}
		local top = {sprite.depth * vanish.x, sprite.depth * (vanish.x - 1) + 1}
		
		if top[2] > 1 then
			scaleObject(tag, sprite.scale.x * (1 + sprite.depth * (vanish.x - 1)), sprite.scale.y * (sprite.depth * vanish.y), true)
		elseif top[1] < 0 then
			scaleObject(tag, sprite.scale.x * (1 - sprite.depth * (vanish.x)), sprite.scale.y * (sprite.depth * vanish.y), true)
			setProperty(tag .. ".x", sprite.x + sprite.width * sprite.depth * vanish.x)
		else
			scaleObject(tag, sprite.scale.x, sprite.scale.y * (sprite.depth * vanish.y), true)
		end
		
		setProperty(tag .. ".y", sprite.y + sprite.height * (1 - sprite.depth * max(vanish.y, 0)))
		
		setShaderFloatArray(tag, "u_top", top)
	end
end