-- RegisterNetEvent('kayscore:FreezePlayer', function(target)
--     if IsEntityPositionFrozen(NetworkGetEntityFromNetworkId(target)) then
--         TriggerClientEvent('kayscore:freeze', target, false)
--     else
--         TriggerClientEvent('kayscore:freeze', target, true)
--     end
-- end)

ESX.RegisterServerCallback('kayscore:getTargetId', function(source, cb, target)
    local xPlayer = ESX.GetPlayerFromId(target)
    if xPlayer then
        local targetId = xPlayer.UniqueID
        cb(targetId)
    else
        cb(nil)
    end
end)