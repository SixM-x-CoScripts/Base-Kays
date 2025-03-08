ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('discordPresence:getUniqueId')
AddEventHandler('discordPresence:getUniqueId', function(_source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    if not xPlayer then
        return
    end
    
    local uniqueId = xPlayer.UniqueID

    if not uniqueId then
        print("Erreur : UniqueID est nil pour la source " .. tostring(_source))
        uniqueId = "Unknown"
    end

    TriggerClientEvent('discordPresence:setUniqueId', _source, uniqueId)
end)