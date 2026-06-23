luaDebugMode = true
function onChangePlayerNotes()
	if boyfriendName == 'bf-3d' then
		if inGameOver == false then
			for i=0,4,1 do
				setPropertyFromGroup('playerStrums', i, 'texture', 'noteSkins/3D Notes/NOTE_3D_strumline')
			end
			for i = 0, getProperty('unspawnNotes.length')-1 do
				if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/3D Notes/3D_NOTE_assets'); --Change texture
				end
			end
			setPropertyFromClass('states.PlayState', 'stageUI', 'ui/3D')
	    end
	end

	for i = 0, getProperty('strumLineNotes.length')-1 do
    	setPropertyFromGroup('strumLineNotes', i, 'useRGBShader', false)
	end
end

function onCountdownStarted()
	for i = 0, getProperty('strumLineNotes.length')-1 do
    	setPropertyFromGroup('strumLineNotes', i, 'useRGBShader', false)
	end
	for i = 0, getProperty('opponentStrums.length')-1 do
		setPropertyFromGroup('opponentStrums', i, 'useRGBShader', false)
	end
	for i = 0, getProperty('playerStrums.length')-1 do
		setPropertyFromGroup('playerStrums', i, 'useRGBShader', false)
	end
end

function onSpawnNote(i, d, t, s)
	setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false)
end
