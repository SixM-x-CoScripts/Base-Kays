local eventsCacheKeys = {}

secured_RegisterNetEvent('events:vehiclesTemporary:server:start')
secured_AddEventHandler('events:vehiclesTemporary:server:start', function(id, position, zonePosition, vehicleModel)
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == "fondateur" or xPlayer.getGroup() == "responsable" or xPlayer.getGroup() == "gerant" then
    eventsCacheKeys[id] = {
        position = position,
        zonePosition = zonePosition,
        vehicleModel = vehicleModel
    }

    secured_TriggerClientEvent('events:vehiclesTemporary:client:start', -1, id, position, zonePosition, vehicleModel)
    end
end)

secured_RegisterNetEvent('events:vehiclesTemporary:server:stop')
secured_AddEventHandler('events:vehiclesTemporary:server:stop', function(id)
    if eventsCacheKeys[id] == nil then 
        return 
    end
    eventsCacheKeys[id] = nil 
    secured_TriggerClientEvent('events:vehiclesTemporary:client:stop', -1, id)
end)

secured_RegisterNetEvent('events:vehiclesTemporary:server:get')
secured_AddEventHandler('events:vehiclesTemporary:server:get', function(id)
    local src = source
    if eventsCacheKeys[id] then
        local vehicleModel = eventsCacheKeys[id].vehicleModel
        local xPlayer = ESX.GetPlayerFromId(src)
        local tempPlate = "TEMP"..math.random(1000, 9999)

        MySQL.Async.execute('INSERT INTO owned_vehicles (owner, vehicle, plate) VALUES (@owner, @vehicle, @plate)', {
            ['@owner'] = xPlayer.UniqueID,
            ['@vehicle'] = json.encode({model = GetHashKey(vehicleModel), plate = tempPlate}),
            ['@plate'] = tempPlate
        }, function(rowsChanged)
            if rowsChanged > 0 then
                TriggerClientEvent('esx:showNotification', src, 'Vous avez récupéré les clés du véhicule spécial.')
                secured_TriggerEvent('events:vehiclesTemporary:server:stop', id)
            else
                TriggerClientEvent('esx:showNotification', src, 'Erreur lors de l\'ajout du véhicule.')
            end
        end)
    end
end)

RegisterCommand('eventvehiclestart', function(source, args, rawCommand)
    local x, y, z, heading = tonumber(args[1]), tonumber(args[2]), tonumber(args[3]), tonumber(args[4])
    local zoneX, zoneY, zoneZ = tonumber(args[5]), tonumber(args[6]), tonumber(args[7])
    local vehicleModel = args[8]
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == "fondateur" or xPlayer.getGroup() == "responsable" or xPlayer.getGroup() == "gerant" then
        if x and y and z and heading and zoneX and zoneY and zoneZ and vehicleModel then
            local id = math.random(1000)
            secured_TriggerEvent('events:vehiclesTemporary:server:start', id, {pos = vector3(x, y, z), heading = heading, marker = vector3(zoneX, zoneY, zoneZ)}, vector3(zoneX, zoneY, zoneZ), vehicleModel)
        else
        end
    end
end, true)

RegisterCommand('eventvehiclestop', function(source, args, rawCommand)
    local id = tonumber(args[1])
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == "fondateur" or xPlayer.getGroup() == "responsable" or xPlayer.getGroup() == "gerant" then
        if id and eventsCacheKeys[id] then
            secured_TriggerEvent('events:vehiclesTemporary:server:stop', id)
        else
        end
    end
end, true)