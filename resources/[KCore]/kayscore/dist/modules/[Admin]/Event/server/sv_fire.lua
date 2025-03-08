local firesCache = {}

secured_RegisterNetEvent('events:fires:server:start')
secured_AddEventHandler('events:fires:server:start', function(id, position, width)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == "fondateur" or Player.getGroup() == "responsable" or Player.getGroup() == "gerant" then
    ESX.toConsole(id, position, width)
    firesCache[id] = { position = position, width = width }
    secured_TriggerClientEvent('events:fires:client:start', -1, id, position, width)
    end
end)

secured_RegisterNetEvent('events:fires:server:stop')
secured_AddEventHandler('events:fires:server:stop', function(id)
    if firesCache[id] then
        ESX.toConsole(id)
        firesCache[id].delete = true
        secured_TriggerClientEvent('events:fires:client:stop', -1, id)
    end
end)

RegisterCommand('firestart', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == "fondateur" or Player.getGroup() == "responsable" or Player.getGroup() == "gerant" then
    local x, y, z, width = tonumber(args[1]), tonumber(args[2]), tonumber(args[3]), tonumber(args[4])
    if x and y and z and width then
        local id = #firesCache + 1
        secured_TriggerEvent('events:fires:server:start', id, vector3(x, y, z), width)
    else
    end
end
end, true)

RegisterCommand('firestop', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == "fondateur" or Player.getGroup() == "responsable" or Player.getGroup() == "gerant" then
    local id = tonumber(args[1])
    if id and firesCache[id] then
        secured_TriggerEvent('events:fires:server:stop', id)
    else
    end
end
end, true)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        for id, fire in pairs(firesCache) do
            secured_TriggerClientEvent('events:fires:client:start', -1, id, fire.position, fire.width)
        end
    end
end)

secured_RegisterNetEvent('events:fires:server:confirmStop')
secured_AddEventHandler('events:fires:server:confirmStop', function(id)
    fires[id] = nil
end)
