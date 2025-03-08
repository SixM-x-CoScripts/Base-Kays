secured_RegisterServerEvent('sDrugs:CheckAndActivateDrugsSell')
secured_AddEventHandler('sDrugs:CheckAndActivateDrugsSell', function()
    local source = source 
    local xPlayer = ESX.GetPlayerFromId(source)
    local hasDrugs = false

    for _, itemData in pairs(kayscoreDrugs.SaleItems) do
        local item = xPlayer.getInventoryItem(itemData.item)
        if item.count > 0 then
            hasDrugs = true
            break
        end
    end

    if hasDrugs then
        secured_TriggerClientEvent('sDrugs:StartDrugsSell', source)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas de drogues.")
    end
end)

secured_RegisterServerEvent("sDrugs:SellDrugs")
secured_AddEventHandler("sDrugs:SellDrugs", function(count)
    local xPlayer = ESX.GetPlayerFromId(source)

    for _, itemData in pairs(kayscoreDrugs.SaleItems) do
        local item = xPlayer.getInventoryItem(itemData.item)
        if item.count >= count then
            xPlayer.removeInventoryItem(itemData.item, count)
            local money = math.random(itemData.minmoney, itemData.maxmoney) * count
            xPlayer.addAccountMoney('black_money', money)

            TriggerClientEvent('esx:showNotification', source, ("Vous avez vendu ~b~%s~s~ pour ~g~$%s~s~."):format(itemData.label, money))
            return
        end
    end

    secured_TriggerClientEvent('sDrugs:DeactivateSell', source)
    TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez plus de drogues.")
end)

ESX.RegisterServerCallback('sDrugs:GetPoliceCount', function(source, cb)
    local policeCount = 0
    local saspnCount = 0

    for _, playerId in ipairs(ESX.GetPlayers()) do
        local xPlayer = ESX.GetPlayerFromId(playerId)
        if xPlayer.job.name == 'police' then
            policeCount = policeCount + 1
        elseif xPlayer.job.name == 'saspn' then
            saspnCount = saspnCount + 1
        end
    end

    cb(policeCount, saspnCount)
end)
