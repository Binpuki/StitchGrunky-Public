function opponentNoteHit(index, nData, nType, sustain)
	if getPropertyFromClass('ClientPrefs', 'noteSplashes') and not sustain then
		if nData == 0 then
			runHaxeCode('game.spawnNoteSplash('..getPropertyFromGroup('strumLineNotes', 0, 'x')..', '..getPropertyFromGroup('strumLineNotes', 0, 'y')..', 0);')
		elseif nData == 1 then
			runHaxeCode('game.spawnNoteSplash('..getPropertyFromGroup('strumLineNotes', 1, 'x')..', '..getPropertyFromGroup('strumLineNotes', 1, 'y')..', 1);')
		elseif nData == 2 then
			runHaxeCode('game.spawnNoteSplash('..getPropertyFromGroup('strumLineNotes', 2, 'x')..', '..getPropertyFromGroup('strumLineNotes', 2, 'y')..', 2);')
		else
			runHaxeCode('game.spawnNoteSplash('..getPropertyFromGroup('strumLineNotes', 3, 'x')..', '..getPropertyFromGroup('strumLineNotes', 3, 'y')..', 3);')
		end
	end
end