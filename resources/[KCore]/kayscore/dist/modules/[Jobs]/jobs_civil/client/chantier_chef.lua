Citizen.CreateThread(function()
	while ESX == nil do Wait(1) end
	    AddZones('chantier_zone', {
        Position = vector3(-510.4909, -1001.595, 23.5505),
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
            TriggerEvent("openChantierBossMenu")
        end
    })
end)

AddEventHandler("openChantierBossMenu", function()
	local menu = RageUI.CreateMenu('', 'Intéraction')

    RageUI.Visible(menu, not RageUI.Visible(menu))
    
    while menu do
        Citizen.Wait(0)
        RageUI.IsVisible(menu, function()
			if not AuTravailleChantier then
				RageUI.Button("Demander à travailler sur le Chantier", nil, {}, true, {
					onSelected = function()
						RageUI.CloseAll()
						StartTravailleChantier()
					end
				})
			else
				RageUI.Button("Arreter de travailler", nil, {}, true, {
					onSelected = function()
						AuTravailleChantier = false
					end
				})
			end
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
        end
    end
end)

RegisterNetEvent("jobs_civil:chantierStart", function()
	StartTravailleChantier()
end)

RegisterNetEvent("jobs_civil:chantierStop", function()
	AuTravailleChantier = false
end)