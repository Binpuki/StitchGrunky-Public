function onCreate()
	-- background shit
	makeAnimatedLuaSprite('cascadeFalls','cascadeFalls', -800, -400)
	addAnimationByPrefix('cascadeFalls','dance','cascadeFalls',24,true)
	objectPlayAnimation('cascadeFalls','dance',false)
	setScrollFactor('cascadeFalls', 0.7, 0.7);

	makeAnimatedLuaSprite('mistGrove','mistGrove', 1600, -400)
	addAnimationByPrefix('mistGrove','dance','mistGrove',24,true)
	objectPlayAnimation('mistGrove','dance',false)
	setScrollFactor('mistGrove', 0.7, 0.7);

	makeAnimatedLuaSprite('stabbardsPeak','stabbardsPeak', -1200, -400)
	addAnimationByPrefix('stabbardsPeak','dance','stabbardsPeak',24,true)
	objectPlayAnimation('stabbardsPeak','dance',false)
	setScrollFactor('stabbardsPeak', 0.6, 0.6);

	makeAnimatedLuaSprite('aquarIsle','aquarIsle', 2000, 100)
	addAnimationByPrefix('aquarIsle','dance','aquarIsle',24,true)
	objectPlayAnimation('aquarIsle','dance',false)
	setScrollFactor('aquarIsle', 0.7, 0.7);

	makeAnimatedLuaSprite('volcaniaFactories','volcaniaFactories', -100, -300)
	addAnimationByPrefix('volcaniaFactories','dance','volcaniaFactories',24,true)
	objectPlayAnimation('volcaniaFactories','dance',false)
	setScrollFactor('volcaniaFactories', 0.6, 0.6);

	makeAnimatedLuaSprite('cyCity','cyCity', 1200, -300)
	addAnimationByPrefix('cyCity','dance','cyCity',24,true)
	objectPlayAnimation('cyCity','dance',false)
	setScrollFactor('cyCity', 0.6, 0.6);

	makeAnimatedLuaSprite('splitHell','splitHell', 1000, 100)
	addAnimationByPrefix('splitHell','dance','splitHell',24,true)
	objectPlayAnimation('splitHell','dance',false)
	setScrollFactor('splitHell', 0.7, 0.7);

	makeAnimatedLuaSprite('meltingSun','meltingSun', 400, -500)
	addAnimationByPrefix('meltingSun','dance','meltingSun',24,true)
	objectPlayAnimation('meltingSun','dance',false)
	setScrollFactor('meltingSun', 0.3, 0.3);

	makeLuaSprite('sky', 'sky', -1300, -700);
	setScrollFactor('sky', 1.0, 1.0);

	makeLuaSprite('homeLand', 'homeLand', -700, 100);
	setScrollFactor('homeLand', 0.9, 0.9);

	makeLuaSprite('checkerboard', 'checkerboard', -1300, 600);
	setScrollFactor('checkerboard', 1.0, 1.0);

	makeLuaSprite('clouds', 'clouds', -1450, 400);
	setScrollFactor('clouds',0.7, 0.7);

	makeLuaSprite('glare_stitch', 'glare_stitch', -1300, -500);
	setScrollFactor('glare_stitch', 1.0, 1.0);
	setProperty('glare_stitch.alpha', 0.06)
	setBlendMode('glare_stitch', 'add');
	setProperty('glare_stitch.scale.x', 1.2);
	setProperty('glare_stitch.scale.y', 1.2);

	makeLuaSprite('grad_stitch', 'grad_stitch', -1300, -500);
	setScrollFactor('grad_stitch', 1.0, 1.0);
	setBlendMode('grad_stitch', 'overlay');
	setProperty('grad_stitch.alpha', 0.07)
	setProperty('grad_stitch.scale.x', 1.2);
	setProperty('grad_stitch.scale.y', 1.2);

	--makeLuaSprite('lighting_stitch', 'stages/meltingIslands/lighting_stitch', -1300, -500);
	--setScrollFactor('lighting_stitch', 1.0, 1.0);
	--setBlendMode('lighting_stitch', 'overlay');
	--setProperty('lighting_stitch.alpha', 0.1)
	--setProperty('lighting_stitch.scale.x', 1.2);
	--setProperty('lighting_stitch.scale.y', 1.2);

	--makeLuaSprite('sewIntro', 'openers/sewIntro', -490, 150);
	--setObjectCamera('sewIntro', 'camOther')
	--setScrollFactor('sewIntro', 1.0, 1.0);
	--setProperty('sewIntro.scale.x', 0.5);
	--setProperty('sewIntro.scale.y', 0.5);

	--makeLuaSprite('voiceboxIntro', 'openers/voiceboxIntro', -490, 150);
	--setObjectCamera('voiceboxIntro', 'camOther')
	--setScrollFactor('voiceboxIntro', 1.0, 1.0);
	--setProperty('voiceboxIntro.scale.x', 0.5);
	--setProperty('voiceboxIntro.scale.y', 0.5);

	--makeLuaSprite('seamIntro', 'openers/seamIntro', -480, 150);
	--setObjectCamera('seamIntro', 'camOther')
	--setScrollFactor('seamIntro', 1.0, 1.0);
	--setProperty('seamIntro.scale.x', 0.5);
	--setProperty('seamIntro.scale.y', 0.5);

	addLuaSprite('sky', false);
	addLuaSprite('clouds', false);
	addLuaSprite('aquarIsle', false);
	addLuaSprite('cyCity', false);
	addLuaSprite('splitHell', false);
	addLuaSprite('mistGrove', false);
	addLuaSprite('volcaniaFactories', false);
	addLuaSprite('stabbardsPeak', false);
	addLuaSprite('cascadeFalls', false);
	addLuaSprite('homeLand', false);
	addLuaSprite('checkerboard', false);
	addLuaSprite('meltingSun', false);
	addLuaSprite('grad_stitch', true);
	addLuaSprite('lighting_stitch', true);
	addLuaSprite('glare_stitch', true);
	--addLuaSprite('sewIntro', true);
	--addLuaSprite('voiceboxIntro', true);
	--addLuaSprite('seamIntro', true);
end