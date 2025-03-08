Citizen.CreateThread(function()
	while ESX == nil do Wait(1) end
	    AddZones('jardinier_chef', {
        Position = vector3(-1347.153, 113.2117, 56.37377),
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
        	TriggerEvent("openJardinierBossMenu")
        end
    })
end)

local ZoneDeSpawn = vector3(-1336.57, 118.70, 56.51)

AddEventHandler("openJardinierBossMenu", function()
	local menu = RageUI.CreateMenu('', 'Intéraction')

    RageUI.Visible(menu, not RageUI.Visible(menu))
    
    while menu do
        Citizen.Wait(0)
        RageUI.IsVisible(menu, function()
			if not AuTravailleJardinier then
				RageUI.Button("Demander à travailler sur le Golf", nil, {}, true, {
					onSelected = function()
						RageUI.CloseAll()
						local spawnRandom = vector3(ZoneDeSpawn.x + math.random(1, 15), ZoneDeSpawn.y + math.random(1, 15), ZoneDeSpawn.z)
						StartTravailleJardinier()
					end
				})
			else
				RageUI.Button("Arreter de travailler", nil, {}, true, {
					onSelected = function()
						AuTravailleJardinier = false
					end
				})
			end
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
        end
    end
end)

RegisterNetEvent("jobs_civil:jardinierStart", function()
	StartTravailleJardinier()
end)

RegisterNetEvent("jobs_civil:jardinierStop", function()
	AuTravailleJardinier = false
end)