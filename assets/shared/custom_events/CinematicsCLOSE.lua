-- Created by RamenDominoes (Feel free to credit or not I don't really care)
--Not bad for my first event created... I think

start = 0

finish = 0



function onCreate()
	

	--THE TOP BAR
	makeLuaSprite('UpperBar', 'empty', 0, -530)
	makeGraphic('UpperBar', 1500, 600, '000000')
	setObjectCamera('UpperBar', 'hud')
	addLuaSprite('UpperBar', false)


	--THE BOTTOM BAR
	makeLuaSprite('LowerBar', 'empty', 0, 650)
	makeGraphic('LowerBar', 1500, 600, '000000')
	setObjectCamera('LowerBar', 'hud')
	addLuaSprite('LowerBar', false)

end

function onUpdate()

	if start == 1 then
	
	doTweenY('Cinematics1', 'UpperBar', -530, 0.5, 'Linear')
	doTweenY('Cinematics2', 'LowerBar', 650, 0.5, 'Linear')
	doTweenAlpha('AlphaTween1', 'healthBarBG', 0, 0.25)
	doTweenAlpha('AlphaTween2', 'healthBar', 0, 0.25)
	doTweenAlpha('AlphaTween3', 'scoreTxt', 0, 0.25)
	doTweenAlpha('AlphaTween4', 'iconP1', 0, 0.25)
	doTweenAlpha('AlphaTween5', 'iconP2', 0, 0.25)
	doTweenAlpha('AlphaTween6', 'timeBar', 0, 0.25)
	doTweenAlpha('AlphaTween7', 'timeBarBG', 0, 0.25)
	doTweenAlpha('AlphaTween8', 'timeTxt', 0, 0.25)
	doTweenAlpha('AlphaTween8', 'timeTxt', 0, 0.25)
	noteTweenAlpha('noteTween0', 0, 0, 0.75, 'circIn')
	noteTweenAlpha('noteTween1', 1, 0, 0.75, 'circIn')
	noteTweenAlpha('noteTween2', 2, 0, 0.75, 'circIn')
	noteTweenAlpha('noteTween3', 3, 0, 0.75, 'circIn')
	noteTweenAlpha('noteTween4', 4, 0, 0.75, 'circIn')
	noteTweenAlpha('noteTween5', 5, 0, 0.75, 'circIn')
	noteTweenAlpha('noteTween6', 6, 0, 0.75, 'circIn')
	noteTweenAlpha('noteTween7', 7, 0, 0.75, 'circIn')

	end

	if finish == 2 then
	
	doTweenY('Cinematics1', 'UpperBar', 0, 0.5, 'Linear')
	doTweenY('Cinematics2', 'LowerBar', 330, 0.5, 'Linear')
	
	end

function onEvent(name,value1,value2)
	if name == 'CinematicsCLOSE' then
		start = tonumber(value1)
		finish = tonumber(value2)
		end
	
	end

end
