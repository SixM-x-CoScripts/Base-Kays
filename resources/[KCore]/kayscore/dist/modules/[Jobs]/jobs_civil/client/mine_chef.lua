Citizen.CreateThread(function()
	while ESX == nil do Wait(1) end
	    AddZones('mine_chef', {
        Position = vector3(2831.114, 2798.104, 57.57753),
        Dist = 10,
        Public = true,
        Job = nil,
        Job2 = nil,
        GradesJobRequire = false,
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = false,
            -- Position = vector3(2745.4719238281, 3477.0629882813, 55.671112060547),
            -- BlipId = 605,
            -- Color = 46,
            -- Scale = 0.6,
            -- Text = '[SERVICE] Supermarché'
        },
        ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
        Action = function()
        	TriggerEvent("openMineBossMenu")
        end
    })
end)

local zoneSpawn = vector3(2824.71, 2790.705, 57.69398)

AddEventHandler("openMineBossMenu", function()
	local menu = RageUI.CreateMenu('', 'Intéraction')

    RageUI.Visible(menu, not RageUI.Visible(menu))
    
    while menu do
        Citizen.Wait(0)
        RageUI.IsVisible(menu, function()
			if not AuTravaillemine then
				RageUI.Button("Demander à travailler sur la Mine", nil, {}, true, {
					onSelected = function()
						RageUI.CloseAll()
						StartTravaillemine()
					end
				})
			else
				RageUI.Button("Arreter de travailler", nil, {}, true, {
					onSelected = function()
						AuTravaillemine = false
                        endwork()
					end
				})
			end
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
        end
    end
end)

RegisterNetEvent("jobs_civil:mineStart", function()
	StartTravaillemine()
end)

RegisterNetEvent("jobs_civil:mineStop", function()
	AuTravaillemine = false
	endwork()
end)

--RMenu.Add('mine', 'main', RageUI.CreateMenu("Mine", " "))
--RMenu.Get('mine', 'main'):SetSubtitle(kayscoreConfigServ.GTACOLOR.."Manager de la Mine")
--RMenu.Get('mine', 'main').EnableMouse = false
--RMenu.Get('mine', 'main').Closed = function()
--	RenderScriptCams(false, true, 1500, true, true)
--	DestroyCam(cam, true)
--end
--
--local vehicle
--
--Citizen.CreateThread(function()
--	while true do
--		Citizen.Wait(0)
--		local distance = #(GetEntityCoords(PlayerPedId()) - zone.Mine)
--
--		if distance <= 3.0 then
--			ESX.ShowHelpNotification("Appuyer sur ~p~E~w~ pour parler avec la personne.")
--
--			if IsControlJustPressed(0, 51) and distance <= 3.0 then
--				RageUI.Visible(RMenu.Get('mine', 'main'), true)
--				CreateCamera()
--			end
--		end
--	end
--end)
--
--RageUI.CreateWhile(1.0, nil, nil, function()
--	RageUI.IsVisible(RMenu.Get('mine', 'main'), true, true, true, function()
--		if not AuTravaillemine then
--			RageUI.Button("Demander à travailler sur la Mine", nil, {}, true, function(Hovered, Active, Selected)
--				if (Selected) then
--					RageUI.Popup({message = "Alors comme ça tu veux bosser à la ~g~mine~w~ ? Très bien, met un casque et prends tes outils ! Je te préviens c'est pas pour les petite fiottes !"})
--
--					RageUI.Visible(RMenu.Get('mine', 'main'), false)
--					RenderScriptCams(false, true, 1500, true, true)
--					DestroyCam(cam, true)
--					AuTravaillemine = true
--
--					TriggerEvent('::{korioz#0110}::skinchanger:getSkin', function(skin)
--						local clothesSkin = {
--							['bags_1'] = 0, ['bags_2'] = 0,
--							['tshirt_1'] = 59, ['tshirt_2'] = 0,
--							['torso_1'] = 56, ['torso_2'] = 0,
--							['arms'] = 30,
--							['pants_1'] = 31, ['pants_2'] = 0,
--							['shoes_1'] = 25, ['shoes_2'] = 0,
--							['mask_1'] = 0, ['mask_2'] = 0,
--							['bproof_1'] = 0, ['bproof_2'] = 0,
--							['helmet_1'] = 0, ['helmet_2'] = 0
--						}
--
--						TriggerEvent('::{korioz#0110}::skinchanger:loadClothes', skin, clothesSkin)
--					end)
--
--					if not ESX.Game.IsSpawnPointClear(vector3(2843.07, 2784.61, 59.94), 6.0) then
--						local veh = ESX.Game.GetClosestVehicle(vector3(2843.07, 2784.61, 59.94))
--						RemoveObj(veh)
--					end
--
--					ESX.Game.SpawnVehicle(`sadler`, vector3(2843.07, 2784.61, 59.94), 59.14, function(veh)
--						SetVehicleOnGroundProperly(veh)
--						vehicle = veh
--					end)
--
--					StartTravaillemine()
--				end
--			end)
--		else
--			RageUI.Button("Arreter de travailler", nil, {}, true, function(Hovered, Active, Selected)
--				if (Selected) then
--					RageUI.Popup({message = "Haha ! Tu stop déja ! Allez prends ta paye feignant ! Merci de ton aide, revient quand tu veux."})
--
--					RageUI.Visible(RMenu.Get('mine', 'main'), false)
--					RenderScriptCams(false, true, 1500, true, true)
--					DestroyCam(cam, true)
--					AuTravaillemine = false
--					endwork()
--					RemoveObj(NetworkGetNetworkIdFromEntity(vehicle))
--
--					ESX.TriggerServerCallback('::{korioz#0110}::ZGEG_skin:getPlayerSkin', function(skin, jobSkin)
--						local isMale = skin.sex == 0
--
--						TriggerEvent('::{korioz#0110}::skinchanger:loadDefaultModel', isMale, function()
--							ESX.TriggerServerCallback('::{korioz#0110}::ZGEG_skin:getPlayerSkin', function(skin)
--								TriggerEvent('::{korioz#0110}::skinchanger:loadSkin', skin)
--								TriggerEvent('::{korioz#0110}::ZGEG:restoreLoadout')
--							end)
--						end)
--					end)
--				end
--			end)
--		end
--	end, function()
--	end)
--end)