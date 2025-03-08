local Keys = {
	['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
	['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
	['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
	['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
	['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
	['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
	['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
	['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
	['NENTER'] = 201, ['N4'] = 108, ['N5'] = 60, ['N6'] = 107, ['N+'] = 96, ['N-'] = 97, ['N7'] = 117, ['N8'] = 61, ['N9'] = 118
}

piggyBackInProgress = false
local holdingHostageInProgress, beingHeldHostage, holdingHostage = false, false
local takeHostageAnimNamePlaying, takeHostageAnimDictPlaying, takeHostageControlFlagPlaying = '', '', 0

local hostageAllowedWeapons = {
	`WEAPON_PISTOL`,
	`WEAPON_PISTOL_MK2`,
	`WEAPON_COMBATPISTOL`,
	`WEAPON_PISTOL50`,
	`WEAPON_SNSPISTOL`,
	`WEAPON_SNSPISTOL_MK2`,
	`WEAPON_HEAVYPISTOL`,
	`WEAPON_VINTAGEPISTOL`,
	`WEAPON_REVOLVER`,
	`WEAPON_REVOLVER_MK2`,
	`WEAPON_DOUBLEACTION`,
	`WEAPON_APPISTOL`,
	`WEAPON_GLOCK`,
	`WEAPON_NAVYREVOLVER`,
}

function releaseHostage()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

	if closestDistance ~= -1 and closestDistance <= 3 then
		local target = GetPlayerServerId(closestPlayer)

		local lib = 'reaction@shove'
		local anim1 = 'shove_var_a'
		local lib2 = 'reaction@shove'
		local anim2 = 'shoved_back'
		local distans = 0.11
		local distans2 = -0.24
		local height = 0.0
		local spin = 0.0
		local length = 100000
		local controlFlagMe = 120
		local controlFlagTarget = 0
		local animFlagTarget = 1
		local attachFlag = false

		TriggerServerEvent('cmg3_animations:sync', lib, lib2, anim1, anim2, distans, distans2, height, target, length, spin, controlFlagMe, controlFlagTarget, animFlagTarget, attachFlag)
	end
end

function killHostage()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

	if closestDistance ~= -1 and closestDistance <= 3 then
		local target = GetPlayerServerId(closestPlayer)

		local lib = 'anim@gangops@hostage@'
		local anim1 = 'perp_fail'
		local lib2 = 'anim@gangops@hostage@'
		local anim2 = 'victim_fail'
		local distans = 0.11
		local distans2 = -0.24
		local height = 0.0
		local spin = 0.0
		local length = 0.2
		local controlFlagMe = 168
		local controlFlagTarget = 0
		local animFlagTarget = 1
		local attachFlag = false

		TriggerServerEvent('cmg3_animations:sync', lib, lib2, anim1, anim2, distans, distans2, height, target, length, spin, controlFlagMe, controlFlagTarget, animFlagTarget, attachFlag)
	end
end

RegisterCommand('porter', function(source, args)
	if IsPedRagdoll(Player.playerPed) then return end
	if (getIsDead()) then 
		ESX.ShowNotification('Vous ne pouvez pas /porter en étant mort')
		return
	end

	if not GetSafeZone() then
		if not piggyBackInProgress then
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

			if closestDistance ~= -1 and closestDistance <= 3 then
				local target = GetPlayerServerId(closestPlayer)
				local canPiggyBack = ESX.isHandsUp(GetPlayerPed(closestPlayer))
				local waitResult = false

				if not canPiggyBack then 
					waitResult = true 
					ESX.TriggerServerCallback('ambulance:server:getPlayerAlive', function(alive)
						waitResult = false
						canPiggyBack = alive
					end, target)

					while waitResult do 
						Wait(100)
					end	
				end

				if canPiggyBack then
					local lib = 'anim@arena@celeb@flat@paired@no_props@'
					local anim1 = 'piggyback_c_player_a'
					local anim2 = 'piggyback_c_player_b'
					local distans = -0.07
					local distans2 = 0.0
					local height = 0.45
					local length = 100000
					local spin = 0.0
					local controlFlagMe = 49
					local controlFlagTarget = 33
					local animFlagTarget = 1

					TriggerServerEvent('cmg2_animations:sync', lib, anim1, anim2, distans, distans2, height, target, length, spin, controlFlagMe, controlFlagTarget, animFlagTarget)
					piggyBackInProgress = true
					RageUI.setKeyState(21, true)
					RageUI.setKeyState(22, true)
					Citizen.CreateThread(function()
						while piggyBackInProgress do
							ESX.ShowHelpNotification('Appuyez sur ~INPUT_CONTEXT~ pour lâcher le joueur.')

							if IsControlJustPressed(1, 51) then
								piggyBackInProgress = false
								stopLift(Player.playerPed)
							end		

							DisableControlAction(0, 21, true) -- disable sprint
							DisableControlAction(0, 22, true) -- disable jump
							DisableControlAction(0, 73, true) -- disable x

							if GetPedInVehicleSeat(Player.vehicle) == Player.playerPed then
								piggyBackInProgress = false
								stopLift(Player.playerPed)
								ESX.ShowNotification('Vous ne pouvez pas porter en tant que conducteur.')
							end
							Citizen.Wait(1)
						end
					end)
				else
					ESX.ShowNotification('⚠️ Le joueur ne lève pas les mains.')
				end
			end
		else
			RageUI.setKeyState(21, false)
			RageUI.setKeyState(22, false)
			piggyBackInProgress = false
			stopLift(Player.playerPed)
		end
	else
		ESX.ShowNotification('Vous ne pouvez pas utilisez cette commande en Zone Safe')
	end
end, false)


function stopLift(ped)
	ClearPedSecondaryTask(ped)
	DetachEntity(ped, true, false)
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

	if closestDistance ~= -1 and closestDistance <= 3 then
		local target = GetPlayerServerId(closestPlayer)
		TriggerServerEvent('cmg2_animations:stop', target)
	end
end

local BlacklistOtage = {

}

RegisterCommand('otage', function()
	if XNL_CurrentPlayerXP <= 600 then return end
	if IsPedRagdoll(Player.playerPed) then return end
	if (getIsDead()) then 
		ESX.ShowNotification('Vous ne pouvez pas /otage en étant mort')
		return
	end

	if BlacklistOtage[ESX.GetMyIdentifier()] then 
		ESX.ShowNotification('Vous êtes puni de /otage')
		return
	end

	if not GetSafeZone() then
		local currentWeapon = GetSelectedPedWeapon(Player.playerPed)
		local canTakeHostage, foundWeapon = false, false

		ClearPedSecondaryTask(Player.playerPed)
		DetachEntity(Player.playerPed, true, false)

		for i = 1, #hostageAllowedWeapons do
			if currentWeapon == hostageAllowedWeapons[i] then
				canTakeHostage = true
				foundWeapon = hostageAllowedWeapons[i]
			end
		end

		if not foundWeapon then
			for i = 1, #hostageAllowedWeapons do
				if HasPedGotWeapon(Player.playerPed, hostageAllowedWeapons[i], false) then
					if GetAmmoInPedWeapon(Player.playerPed, hostageAllowedWeapons[i]) > 0 then
						canTakeHostage = true
						foundWeapon = hostageAllowedWeapons[i]
						break
					end
				end
			end
		end

		if canTakeHostage then
			if not holdingHostageInProgress then
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				if closestDistance ~= -1 and closestDistance <= 3 then
					local target = GetPlayerServerId(closestPlayer)

					if IsPlayerDead(closestPlayer) then
						ESX.ShowNotification('~r~Action Impossible~s~ : Vous ne pouvez porter ce joueur !')
					else
						if ESX.isHandsUp(GetPlayerPed(closestPlayer)) then
							local lib = 'anim@gangops@hostage@'
							local anim1 = 'perp_idle'
							local lib2 = 'anim@gangops@hostage@'
							local anim2 = 'victim_idle'
							local distans = 0.11
							local distans2 = -0.24
							local height = 0.0
							local spin = 0.0
							local length = 100000
							local controlFlagMe = 49
							local controlFlagTarget = 49
							local animFlagTarget = 50
							local attachFlag = true
	
							SetCurrentPedWeapon(Player.playerPed, foundWeapon, true)
							holdingHostageInProgress = true
							holdingHostage = true
							TriggerServerEvent('cmg3_animations:sync', lib, lib2, anim1, anim2, distans, distans2, height, target, length, spin, controlFlagMe, controlFlagTarget, animFlagTarget, attachFlag)
						else
							ESX.ShowNotification('~r~Action Impossible~s~ : Le joueur doit lever les mains !')
						end
					end
				else
					ESX.ShowNotification('Aucun joueur à proximité !')
				end
			end
		else
			ESX.ShowNotification('Vous avez besoin d\'un pistolet de combat ou un pistolet pour prendre un otage !')
		end
	else
		ESX.ShowNotification('Vous ne pouvez pas utilisez cette commande en Zone Safe')
	end
end)

RegisterNetEvent('cmg2_animations:syncTarget', function(targetId, animationLib, animation2, distans, distans2, height, length, spin, controlFlag, porter)
	local target = GetPlayerFromServerId(targetId)

	if target == PlayerId() or target < 1 then
		return
	end

	local targetPed = GetPlayerPed(target)

	piggyBackInProgress = true
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end

	spin = spin or 180.0

	AttachEntityToEntity(Player.playerPed, targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)

	if controlFlag == nil then
		controlFlag = 0
	end

	TaskPlayAnim(Player.playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)

	Citizen.CreateThread(function()
		while piggyBackInProgress do

			DisableControlAction(0, 21, true) -- disable sprint
			DisableControlAction(0, 24, true) -- disable attack
			DisableControlAction(0, 25, true) -- disable aim
			DisableControlAction(0, 47, true) -- disable weapon
			DisableControlAction(0, 58, true) -- disable weapon
			DisableControlAction(0, 263, true) -- disable melee
			DisableControlAction(0, 264, true) -- disable melee
			DisableControlAction(0, 257, true) -- disable melee
			DisableControlAction(0, 140, true) -- disable melee
			DisableControlAction(0, 141, true) -- disable melee
			DisableControlAction(0, 142, true) -- disable melee
			DisableControlAction(0, 143, true) -- disable melee
			DisableControlAction(0, 75, true) -- disable exit vehicle
			DisableControlAction(27, 75, true) -- disable exit vehicle
			DisableControlAction(0, 22, true) -- disable jump
			DisableControlAction(0, 32, true) -- disable move up
			DisableControlAction(0, 268, true)
			DisableControlAction(0, 33, true) -- disable move down
			DisableControlAction(0, 269, true)
			DisableControlAction(0, 34, true) -- disable move left
			DisableControlAction(0, 270, true)
			DisableControlAction(0, 35, true) -- disable move right
			DisableControlAction(0, 271, true)

			Citizen.Wait(1)
		end
	end)
end)

RegisterNetEvent('cmg2_animations:syncMe', function(animationLib, animation, length, controlFlag, animFlag)
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end

	Citizen.Wait(500)

	if controlFlag == nil then
		controlFlag = 0
	end

	TaskPlayAnim(Player.playerPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)
	Citizen.Wait(length)
end)

RegisterNetEvent('cmg2_animations:cl_stop', function()
	local plyPed = PlayerPedId()
	piggyBackInProgress = false
	ClearPedSecondaryTask(Player.playerPed)
	DetachEntity(Player.playerPed, true, false)
end)

RegisterNetEvent('cmg3_animations:syncTarget', function(target, animationLib, animation2, distans, distans2, height, length, spin, controlFlag, animFlagTarget, attach)
	local plyPed = PlayerPedId()
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))

	if holdingHostageInProgress then
		holdingHostageInProgress = false
	else
		holdingHostageInProgress = true
	end

	beingHeldHostage = true
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end

	if spin == nil then
		spin = 180.0
	end

	if attach then
		AttachEntityToEntity(Player.playerPed, targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
	end
	
	if controlFlag == nil then
		controlFlag = 0
	end

	if animation2 == 'victim_fail' then
		SetEntityHealth(Player.playerPed, 0)
		DetachEntity(Player.playerPed, true, false)
		TaskPlayAnim(Player.playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
		beingHeldHostage = false
		holdingHostageInProgress = false
	elseif animation2 == 'shoved_back' then
		holdingHostageInProgress = false
		DetachEntity(Player.playerPed, true, false)
		TaskPlayAnim(Player.playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
		beingHeldHostage = false
	else
		TaskPlayAnim(Player.playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
	end

	takeHostageAnimNamePlaying = animation2
	takeHostageAnimDictPlaying = animationLib
	takeHostageControlFlagPlaying = controlFlag
end)

RegisterNetEvent('cmg3_animations:syncMe', function(animationLib, animation, length, controlFlag, animFlag)
	local plyPed = PlayerPedId()

	ClearPedSecondaryTask(Player.playerPed)
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end

	if controlFlag == nil then
		controlFlag = 0
	end

	TaskPlayAnim(playerPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)

	takeHostageAnimNamePlaying = animation
	takeHostageAnimDictPlaying = animationLib
	takeHostageControlFlagPlaying = controlFlag

	if animation == 'perp_fail' then
		SetPedShootsAtCoord(Player.playerPed, 0.0, 0.0, 0.0, 0)
		holdingHostageInProgress = false
	elseif animation == 'shove_var_a' then
		Citizen.Wait(900)
		ClearPedSecondaryTask(Player.playerPed)
		holdingHostageInProgress = false
	end
end)

RegisterNetEvent('cmg3_animations:cl_stop', function()
	local plyPed = PlayerPedId()

	holdingHostageInProgress = false
	beingHeldHostage = false
	holdingHostage = false

	ClearPedSecondaryTask(Player.playerPed)
	DetachEntity(Player.playerPed, true, false)
end)

Citizen.CreateThread(function()
	while true do
		if (holdingHostage or beingHeldHostage) and takeHostageAnimDictPlaying ~= '' and takeHostageAnimNamePlaying ~= '' then
			Citizen.Wait(0)
		else
			Wait(1500)
		end

		if (holdingHostage or beingHeldHostage) and takeHostageAnimDictPlaying ~= '' and takeHostageAnimNamePlaying ~= '' then
			while not IsEntityPlayingAnim(PlayerPedId(), takeHostageAnimDictPlaying, takeHostageAnimNamePlaying, 3) do
				TaskPlayAnim(PlayerPedId(), takeHostageAnimDictPlaying, takeHostageAnimNamePlaying, 8.0, -8.0, 100000, takeHostageControlFlagPlaying, 0, false, false, false)
				Citizen.Wait(0)
			end
		end
	end
end)



Citizen.CreateThread(function()
	while true do
		if holdingHostage or beingHeldHostage then
			Wait(0)
		else
			Wait(1500)
		end

		if holdingHostage then
			local plyCoords = GetEntityCoords(Player.playerPed)

			if IsEntityDead(Player.playerPed) then
				holdingHostage = false
				holdingHostageInProgress = false

				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				if closestDistance ~= -1 and closestDistance <= 3 then
					local target = GetPlayerServerId(closestPlayer)
					TriggerServerEvent('cmg3_animations:stop', target)
				end

				Citizen.Wait(100)
				releaseHostage()
			end

			DisableControlAction(0, 24, true) -- disable attack
			DisableControlAction(0, 25, true) -- disable aim
			DisableControlAction(0, 47, true) -- disable weapon
			DisableControlAction(0, 58, true) -- disable weapon
			DisablePlayerFiring(Player.playerPed, true)

			ESX.Game.Utils.DrawText3D(plyCoords, 'Appuyer sur [G] pour relâcher, [H] pour tuer', 0.5)

			if IsDisabledControlJustPressed(0, 47) then
				holdingHostage = false
				holdingHostageInProgress = false

				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				if closestDistance ~= -1 and closestDistance <= 3 then
					local target = GetPlayerServerId(closestPlayer)
					TriggerServerEvent('cmg3_animations:stop', target)
				end

				Citizen.Wait(100)
				releaseHostage()
			elseif IsDisabledControlJustPressed(0, 74) then
				holdingHostage = false
				holdingHostageInProgress = false

				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				if closestDistance ~= -1 and closestDistance <= 3 then
					local target = GetPlayerServerId(closestPlayer)
					TriggerServerEvent('cmg3_animations:stop', target)
				end

				killHostage()
			end
		end

		if beingHeldHostage then
			DisableControlAction(0, 21, true) -- disable sprint
			DisableControlAction(0, 24, true) -- disable attack
			DisableControlAction(0, 25, true) -- disable aim
			DisableControlAction(0, 47, true) -- disable weapon
			DisableControlAction(0, 58, true) -- disable weapon
			DisableControlAction(0, 263, true) -- disable melee
			DisableControlAction(0, 264, true) -- disable melee
			DisableControlAction(0, 257, true) -- disable melee
			DisableControlAction(0, 140, true) -- disable melee
			DisableControlAction(0, 141, true) -- disable melee
			DisableControlAction(0, 142, true) -- disable melee
			DisableControlAction(0, 143, true) -- disable melee
			DisableControlAction(0, 75, true) -- disable exit vehicle
			DisableControlAction(27, 75, true) -- disable exit vehicle
			DisableControlAction(0, 22, true) -- disable jump
			DisableControlAction(0, 32, true) -- disable move up
			DisableControlAction(0, 268, true)
			DisableControlAction(0, 33, true) -- disable move down
			DisableControlAction(0, 269, true)
			DisableControlAction(0, 34, true) -- disable move left
			DisableControlAction(0, 270, true)
			DisableControlAction(0, 35, true) -- disable move right
			DisableControlAction(0, 271, true)
		end
	end
end)



function isPiggyBack()
	return piggyBackInProgress
end

function isHostage()
	if holdingHostage or beingHeldHostage then 
		return true
	else
		return false
	end
end

local isTackling				= false
local isGettingTackled			= false
local tackleLib					= 'missmic2ig_11'
local tackleAnim 				= 'mic_2_ig_11_intro_goon'
local tackleVictimAnim			= 'mic_2_ig_11_intro_p_one'
local lastTackleTime			= 0
local isRagdoll					= false

Citizen.CreateThread(function()
	while true do
		if isRagdoll then 
			Wait(0)
		else
			Wait(1000)
		end
		if isRagdoll then
			SetPedToRagdoll(Player.playerPed, 1000, 1000, 0, 0, 0, 0)
		end
	end
end)

RegisterNetEvent('esx_kekke_tackle:getTackled', function(target)
	isGettingTackled = true
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	RequestAnimDict(tackleLib)
	while not HasAnimDictLoaded(tackleLib) do
		Citizen.Wait(10)
	end
	AttachEntityToEntity(Player.playerPed, targetPed, 11816, 0.25, 0.5, 0.0, 0.5, 0.5, 180.0, false, false, false, false, 2, false)
	TaskPlayAnim(Player.playerPed, tackleLib, tackleVictimAnim, 8.0, -8.0, 3000, 0, 0, false, false, false)
	Citizen.Wait(3000)
	DetachEntity(Player.playerPed, true, false)
	isRagdoll = true
	Citizen.Wait(3000)
	isRagdoll = false
	isGettingTackled = false
end)

RegisterNetEvent('esx_kekke_tackle:playTackle', function()
	RequestAnimDict(tackleLib)
	while not HasAnimDictLoaded(tackleLib) do
		Citizen.Wait(10)
	end
	TaskPlayAnim(Player.playerPed, tackleLib, tackleAnim, 8.0, -8.0, 3000, 0, 0, false, false, false)
	Citizen.Wait(7500)
	isTackling = false
end)

RegisterCommand('tacle', function()
	if getIsDead() then return end
	if GetSafeZone() then ESX.ShowNotification('Vous ne pouvez pas plaquer en Zone Safe') return end
	if IsPedRagdoll(Player.playerPed) then return end

	local closestPlayer, distance = ESX.Game.GetClosestPlayer()

    if not kayscoreConfigServ.Plaquage.whielistJobs[ESX.PlayerData.job.name] then
        return
    end

	if distance ~= -1 and distance <= 3 and not isTackling and not isGettingTackled and not IsPedInAnyVehicle(Player.playerPed) and not IsPedInAnyVehicle(GetPlayerPed(closestPlayer)) then
		isTackling = true

		TriggerServerEvent('esx_kekke_tackle:tryTackle', GetPlayerServerId(closestPlayer))
	end
end)
RegisterKeyMapping(kayscoreConfigServ.Plaquage.Command, 'Plaquer un Joueur', 'keyboard', kayscoreConfigServ.Plaquage.Touche)