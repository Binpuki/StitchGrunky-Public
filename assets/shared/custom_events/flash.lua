function onEvent(name, value1, value2)
   if name == 'flash' then
    makeAnimatedLuaSprite('flash','flash', -10, -170)
	addAnimationByPrefix('flash','flash light','flash ah my eyes', 30, false)
	addLuaSprite('flash', true);
	scaleObject('flash', 0.83, 0.83);

    setLuaSpriteCamera('flash', 'camHUD')
    setPropertyLuaSprite('flash', 'alpha', 1)

    objectPlayAnimation('flash','flash light',true)
   end
end
