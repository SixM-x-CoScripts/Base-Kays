local ItemFarm = {
    steellingo = 'L\'ingot D\'acier',
    treatedsteel = 'L\'ingot D\'acier Traité'
}

local function hasBoost(xPlayer)
    return boost_farm.have(xPlayer.UniqueID) and boost_farm.boostFarm(xPlayer.UniqueID).multiplication or 1
end

secured_RegisterNetEvent('kayscore:activitys:pickUpItem', function(item)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if (xPlayer) then
        local multiplier = hasBoost(xPlayer)
        local total = math.random(1, 5 - math.random(1, 3)) * multiplier

        if not xPlayer.canCarryItem(item, total) then 
            TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez de place dans votre inventaire")
            return
        end

        xPlayer.addInventoryItem(item, total)
        TriggerClientEvent('esx:showNotification', source, ('📦 ~y~+%s~s~ %s'):format(total, ItemFarm[item]))
        
        sendLog(("Le joueur (%s - %s) a récolté (+%s %s)"):format(xPlayer.name, xPlayer.UniqueID, total, ItemFarm[item]), {
            author = xPlayer.name,
            fields = {
                {title = 'Joueur', subtitle = xPlayer.name},
                {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                {title = 'Identifier', subtitle = xPlayer.identifier},
                {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
            },
            channel = 'reco_acier'
        })
    end
end)

secured_RegisterNetEvent('kayscore:activitys:traitementItem', function(item, itemt)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if (xPlayer) then
        local multiplier = hasBoost(xPlayer)
        local requiredAmount = 3

        if xPlayer.getInventoryItem(item).count < requiredAmount then
            return TriggerClientEvent('esx:showNotification', source, ('🚨 Vous ne disposez pas de suffisamment de %s'):format(ItemFarm[item]))
        end

        if not xPlayer.canCarryItem(itemt, requiredAmount) then 
            TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez de place dans votre inventaire")
            return
        end

        xPlayer.removeInventoryItem(item, requiredAmount)
        xPlayer.addInventoryItem(itemt, multiplier)
        
        TriggerClientEvent('esx:showNotification', source, ('📦 ~y~+%s~s~ %s'):format(multiplier, ItemFarm[itemt]))
        sendLog(("Le joueur (%s - %s) a traité (+%s %s)"):format(xPlayer.name, xPlayer.UniqueID, multiplier, ItemFarm[itemt]), {
            author = xPlayer.name,
            fields = {
                {title = 'Joueur', subtitle = xPlayer.name},
                {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                {title = 'Identifier', subtitle = xPlayer.identifier},
                {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
            },
            channel = 'trait_acier'
        })
    end
end)

secured_RegisterNetEvent('kayscore:activitys:venteItem', function(item)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if (xPlayer) then
        if xPlayer.getInventoryItem(item).count < 1 then 
            return TriggerClientEvent('esx:showNotification', source, ('🚨 Vous ne disposez pas de suffisamment de %s'):format(ItemFarm[item]))
        end

        local total = math.random(10, 30)

        xPlayer.removeInventoryItem(item, 1)
        xPlayer.addAccountMoney('cash', total)

        TriggerClientEvent('esx:showNotification', source, ('💲 Vous avez vendu ~y~x%s~s~ %s pour %s$'):format(1, ItemFarm[item], total))
        sendLog(('Le joueur (%s - %s) a vendu (%s - items)'):format(xPlayer.name, xPlayer.UniqueID, item), {
            author = 'Vente Activities',
            fields = {
                {title = 'Joueur', subtitle = xPlayer.name},
                {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                {title = 'Identifier', subtitle = xPlayer.identifier},
                {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
            },
            channel = 'vente_acier'
        })
    end
end)
