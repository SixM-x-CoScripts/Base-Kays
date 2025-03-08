AuTravaillemine = false

local WorkerChillPos = {
	{
		pos = vector3(2577.66, 2728.97, 41.81),
		Heading = 354.73
	},
	{
		pos = vector3(2575.42, 2721.18, 41.81),
		Heading = 126.40
	},
	{
		pos = vector3(2572.69, 2720.55, 41.84),
		Heading = 255.41
	},
	{
		pos = vector3(2577.47, 2730.42, 41.81),
		Heading = 182.91
	}
}

local object = {
	`csx_rvrbldr_meda_`,
	`csx_rvrbldr_medb_`,
	`csx_rvrbldr_medc_`,
	`csx_rvrbldr_medd_`,
	`csx_rvrbldr_mede_`,
	`csx_rvrbldr_smla_`,
	`csx_rvrbldr_smlb_`,
	`csx_rvrbldr_smlc_`,
	`csx_rvrbldr_smld_`,
	`csx_rvrbldr_smle_`
}

local zoneZoche = vector3(2953.14, 2787.65, 41.49)

Citizen.CreateThread(function()
	while ESX == nil do
		Citizen.Wait(10)
	end

	ESX.Game.SpawnLocalPed(2, `s_m_y_construct_01`, zone.Mine, 117.68, function(ped)
		FreezeEntityPosition(ped, true)
		TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)
		SetEntityInvincible(ped, true)
		SetBlockingOfNonTemporaryEvents(ped, true)
	end)

	for k, v in ipairs(WorkerChillPos) do
		ESX.Game.SpawnLocalPed(2, `s_m_y_construct_01`, v.pos, v.Heading, function(ped)
			FreezeEntityPosition(ped, true)
			TaskStartScenarioInPlace(ped, "WORLD_HUMAN_AA_COFFEE", 0, true)
			SetEntityInvincible(ped, true)
			SetBlockingOfNonTemporaryEvents(ped, true)
		end)
	end
end)

function StartTravaillemine()
	RequestAnimDict("melee@large_wpn@streamed_core")
	AuTravaillemine = true

	Citizen.CreateThread(function()
		while AuTravaillemine do
			EnAction = false
			local zoneRandom = vector3(zoneZoche.x + math.random(-15.0, 15.0), zoneZoche.y + math.random(-15.0, 15.0), zoneZoche.z)
			local model = object[math.random(1, #object)]
			local done = false
			TriggerServerEvent("jobs_civil:mineSetPoint", zoneRandom)

			local object = CreateObject(model, zoneRandom, false)

			PlaceObjectOnGroundProperly(object)
			local pos = GetEntityCoords(object)

			SetEntityCoords(object, vector3(pos.x, pos.y, pos.z - 0.5), false, false, false, false)
			FreezeEntityPosition(object, true)
			SetEntityDrawOutline(object, true)
			SetEntityDrawOutlineColor(255, 255, 255, 255)
			SetEntityDrawOutlineShader(1)

			blipMine = AddBlipForEntity(object)

			SetBlipSprite(blipMine, 618)
			SetBlipColour(blipMine, 5)
			SetBlipScale(blipMine, 0.5)

			roche, done = object, true

			while not done do
				Citizen.Wait(0)
			end

			while not EnAction and AuTravaillemine do
				Citizen.Wait(1)
				local dst = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(roche))

				if dst <= 3.0 and AuTravaillemine then
					ESX.ShowHelpNotification("~INPUT_CONTEXT~ pour travailler")

					if IsControlJustPressed(0, 51) and dst <= 3.0 then
						RemoveBlip(blipMine)
						EnAction = true
						TaskPlayAnim(PlayerPedId(), 'melee@large_wpn@streamed_core', 'ground_attack_on_spot', 8.0, 8.0, -1, 1, 0, 0, 0, 0)
						local done = false
						
						local object = CreateObject(`prop_tool_pickaxe`, GetEntityCoords(PlayerPedId()), false)
						
						AttachEntityToEntity(object, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.18, -0.02, -0.02, 350.0, 100.00, 140.0, true, true, false, true, 1, true)
						pickaxe, done = object, true

						while not done do
							Citizen.Wait(0)
						end

						drawBar(10000, 'Travail en cours', function()
					--	Wait(10000)
						PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
						DeleteEntity(pickaxe)
						DeleteEntity(roche)
						ClearPedTasksImmediately(PlayerPedId())
						TriggerServerEvent("jobs_civil:chantierReward")
						end)
						break
					end
				end
			end

			RemoveBlip(blipMine)
			DeleteEntity(pickaxe)
			DeleteEntity(roche)
		end

		RemoveBlip(blipMine) 
		DeleteEntity(pickaxe)
		DeleteEntity(roche)
	end)
end

function endwork()
	RemoveBlip(blipMine) 
	DeleteEntity(pickaxe)
	DeleteEntity(roche)
end