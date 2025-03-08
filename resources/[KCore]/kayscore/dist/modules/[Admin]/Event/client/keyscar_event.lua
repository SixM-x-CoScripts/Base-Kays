local eventsClientsK = {}
local eventVehicles = {}

secured_RegisterNetEvent('events:vehiclesTemporary:client:start', function(id, position, zonePosition, vehicleModel)
    ESX.ShowNotification("Un véhicule spécial a été repéré. Rends toi sur les lieux pour récupérer les clés.")
    eventsClientsK[id] = {
        position = position.pos,
        heading = position.heading, 
        zonePosition = zonePosition,
        vehicleModel = vehicleModel
    }

    local formatName = ('temporary_vehicles_%s'):format(id)

    ESX.addBlips({
        name = formatName,
        label = "Véhicule Spécial",
        category = nil,
        position = position.pos,
        sprite = 326,
        display = 4,
        scale = 1.1,
        color = 59,
        type = "blip_events",
    })

    AddZones(formatName, {
        Position = position.pos,
        Dist = 10,
        Public = true,
        Job = nil,
        Job2 = nil,
        GradesJobRequire = false,
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = false,
        },
        ActionText =('Appuyez sur [ %sE~w~ ] pour intéragir'):format(EventConfig.GTACOLOR),
        marker = false,
        Action = function()
            secured_TriggerServerEvent("events:vehiclesTemporary:server:get", id)
        end
    })

    _PEDS.addPed(formatName, {
        model = 'a_m_y_mexthug_01',
        position = position.pos,
        heading = position.heading,
        scenario = {
            active = true,
            name = "WORLD_HUMAN_CLIPBOARD",
            count = 0,
        },
        
        weapon = {
            active = false,
            weaponName = 'weapon_musket',
        },

        floatingText = {
            active = true,
            text = 'Chasse Véhicule',
            color = 4,
        },
    })

    local vehicleHash = GetHashKey(vehicleModel)
    RequestModel(vehicleHash)
    while not HasModelLoaded(vehicleHash) do
        Wait(1)
    end
    local vehicle = CreateVehicle(vehicleHash, position.pos.x + 2.0, position.pos.y + 2.0, position.pos.z, position.heading, false, false)
    SetVehicleDoorsLocked(vehicle, 2)
    SetVehicleUndriveable(vehicle, true)
    SetEntityAsMissionEntity(vehicle, true, true)

    eventVehicles[id] = vehicle
end)

secured_RegisterNetEvent('events:vehiclesTemporary:client:stop', function(id)
    if eventsClientsK[id] == nil then 
        return 
    end

    local formatName = ('temporary_vehicles_%s'):format(id)

    eventsClientsK[id] = nil 
    RemoveZones(formatName)
    _PEDS.removePed(formatName)
    ESX.removeBlip(formatName)
    if eventVehicles[id] then
        DeleteVehicle(eventVehicles[id])
        eventVehicles[id] = nil
    end
end)
