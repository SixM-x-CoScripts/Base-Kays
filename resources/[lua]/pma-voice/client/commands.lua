local wasProximityDisabledFromOverride = false
disableProximityCycle = false
RegisterCommand('setvoiceintent', function(source, args)
	if GetConvarInt('voice_allowSetIntent', 1) == 1 then
		local intent = args[1]
		if intent == 'speech' then
			MumbleSetAudioInputIntent(`speech`)
		elseif intent == 'music' then
			MumbleSetAudioInputIntent(`music`)
		end
		LocalPlayer.state:set('voiceIntent', intent, true)
	end
end)

-- TODO: Better implementation of this?
RegisterCommand('vol', function(_, args)
	if not args[1] then return end
	setVolume(tonumber(args[1]))
end)

exports('setAllowProximityCycleState', function(state)
	type_check({state, "boolean"})
	disableProximityCycle = state
end)

function setProximityState(proximityRange, isCustom)
	local voiceModeData = Cfg.voiceModes[mode]
	MumbleSetTalkerProximity(proximityRange + 0.0)
	LocalPlayer.state:set('proximity', {
		index = mode,
		distance = proximityRange,
		mode = isCustom and "Custom" or voiceModeData[2],
	}, true)
	sendUIMessage({
		-- JS expects this value to be - 1, "custom" voice is on the last index
		voiceMode = isCustom and #Cfg.voiceModes or mode - 1
	})
end

exports("overrideProximityRange", function(range, disableCycle)
	type_check({range, "number"})
	setProximityState(range, true)
	if disableCycle then
		disableProximityCycle = true
		wasProximityDisabledFromOverride = true
	end
end)

exports("clearProximityOverride", function()
	local voiceModeData = Cfg.voiceModes[mode]
	setProximityState(voiceModeData[1], false)
	if wasProximityDisabledFromOverride then
		disableProximityCycle = false
	end
end)

RegisterCommand('cycleproximity', function()
	-- Proximity is either disabled, or manually overwritten.
	if GetConvarInt('voice_enableProximityCycle', 1) ~= 1 or disableProximityCycle then return end
	local newMode = mode + 1

	-- If we're within the range of our voice modes, allow the increase, otherwise reset to the first state
	if newMode <= #Cfg.voiceModes then
		mode = newMode
	else
		mode = 1
	end

	if  not showDist then
		showDist = 1
		Citizen.SetTimeout(1500, function()
			if showDist > 1 then
				showDist = showDist - 1
			else
				showDist = false
			end
		end)

		Citizen.CreateThread(function()
			while showDist do 
				Wait(0)
				local coords = GetEntityCoords(PlayerPedId(), 0)
				DrawMarker(1, coords.x, coords.y, coords.z - 1.0, 0, 0, 0, 0, 0, 0, Cfg.voiceModes[mode][1], Cfg.voiceModes[mode][1], 0.5, 11, 118, 254, 255, 0, 0, 2, 0, 0, 0, 0)
			end
		end)
	else
		showDist = showDist + 1
		Citizen.SetTimeout(1500, function()
			if showDist > 1 then
				showDist = showDist - 1
			else
				showDist = false
			end
		end)
	end

	setProximityState(Cfg.voiceModes[mode][1], false)
	TriggerEvent('pma-voice:setTalkingMode', mode)
end, false)
if gameVersion == 'fivem' then
	RegisterKeyMapping('cycleproximity', 'Cycle Proximity', 'keyboard', 'F3')
end

RegisterCommand('forceWisper', function()
    if GetConvarInt('voice_enableProximity', 1) ~= 1 then return end
	if playerMuted then return end

	local voiceMode = 1
	local newMode = voiceMode + 1

	voiceMode = (newMode <= #Cfg.voiceModes and newMode) or 1
	local voiceModeData = Cfg.voiceModes[voiceMode]
	MumbleSetTalkerProximity(voiceModeData[1] + 0.0)
	mode = voiceMode
	LocalPlayer.state:set('proximity', {
		index = voiceMode,
		distance =  voiceModeData[1],
		mode = voiceModeData[2],
	}, true)
	-- make sure we update the UI to the latest voice mode
	SendNUIMessage({
		voiceMode = voiceMode - 1
	})
	TriggerEvent('pma-voice:setTalkingMode', voiceMode)
end)

RegisterCommand("hideRadio", function(source,args,raw)
	sendUIMessage({
		-- JS expects this value to be - 1, "custom" voice is on the last index
		showRadio = false
	})
end)

RegisterCommand("showRadio", function(source,args,raw)
	sendUIMessage({
		-- JS expects this value to be - 1, "custom" voice is on the last index
		showRadio = true
	})
end)

--table.insert(Cfg.voiceModes, {60.0, "Megaphone"})
 
exports("setMegaphone", function(bool, value)
	if bool then
		mode = #Cfg.voiceModes
		setProximityState(Cfg.voiceModes[mode][1], false)
		TriggerEvent('pma-voice:setTalkingMode', mode)
	else
		mode = value
		setProximityState(Cfg.voiceModes[value][1], false)
		TriggerEvent('pma-voice:setTalkingMode', value)
	end
end)

exports("getMegaphone", function()
	return mode
end)