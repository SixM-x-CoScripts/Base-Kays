local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

----------------------------
----------\/Weed/\----------
----------------------------
RegisterServerEvent('netshhh-drugs:weedrecolte')
AddEventHandler('netshhh-drugs:weedrecolte', function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local itemweed = Config.Weed.WeedRecolteItem
    local count = Config.Drogue.RecolteCount
    local labelweed = Config.Weed.WeedRecolteItemLabel
    if xPlayer.getInventoryItem(itemweed, count).count then
        xPlayer.addInventoryItem(itemweed, count)
        TriggerClientEvent('esx:showNotification', _src, 'Vous avez récolté ' .. count .. ' ' .. labelweed)
    else
        TriggerClientEvent('esx:showNotification', _src, 'Vous n\'avez pas assez de place dans votre inventaire')
    end
end)

RegisterServerEvent('netshhh-drugs:weedtraitement')
AddEventHandler('netshhh-drugs:weedtraitement', function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local itemweed_give = Config.Weed.WeedTraitementItem
    local count_give = Config.Drogue.TraitementCount
    local itemweed_remove = Config.Weed.WeedRecolteItem
    local label_itemweed_remove = Config.Weed.WeedRecolteItemLabel
    local count_remove = Config.Drogue.RecolteRemove
    local label_itemweed_give = Config.Weed.WeedTraitementItemLabel
    local countItem = xPlayer.getInventoryItem(itemweed_remove).count

    if xPlayer.getInventoryItem(itemweed_give, count_give).count then
        if countItem >= count_remove then
            xPlayer.removeInventoryItem(itemweed_remove, count_remove)
            xPlayer.addInventoryItem(itemweed_give, count_give)
            TriggerClientEvent('esx:showNotification', _src, "Vous avez traité " .. count_give .. " " .. label_itemweed_give)
        else
            TriggerClientEvent('esx:showNotification', _src, "Vous n'avez pas assez de " .. label_itemweed_remove .. " pour traiter il en faut "..count_remove)
        end
    else
        TriggerClientEvent('esx:showNotification', _src, "Vous n'avez pas assez de place dans votre inventaire")
    end
end)


RegisterServerEvent('netshhh-drugs:weedvente')
AddEventHandler('netshhh-drugs:weedvente', function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local blackMoney	= xPlayer.getAccount('dirtycash')

    local itemweedRequired = Config.Weed.WeedTraitementItem
    local itemweedRequiredLabel = Config.Weed.WeedTraitementItemLabel
    local numberRequired = Config.Drogue.NumberForSell
    local countItem = xPlayer.getInventoryItem(itemweedRequired).count
    local itemVendu = Config.Drogue.VenteCount
    local priceweed = Config.Weed.WeedPriceForSell

    if countItem >= numberRequired then
        xPlayer.removeInventoryItem(itemweedRequired, itemVendu)
        if Config.GiveBlackMoney then
            xPlayer.addAccountMoney('dirtycash', priceweed)
        else
            xPlayer.addMoney(priceweed)
        end
    else
        TriggerClientEvent('esx:showNotification', _src, "Vous n'avez pas assez de " .. itemweedRequiredLabel .. " pour vendre")
    end
end)

-----------------------------
----------\/Opium/\----------
-----------------------------
RegisterServerEvent('netshhh-drugs:opiumrecolte')
AddEventHandler('netshhh-drugs:opiumrecolte', function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local itemOpium = Config.Opium.OpiumRecolteItem
    local count = Config.Drogue.RecolteCount
    local labelOpium = Config.Opium.OpiumRecolteItemLabel
    if xPlayer.getInventoryItem(itemOpium, count).count then
        xPlayer.addInventoryItem(itemOpium, count)
        TriggerClientEvent('esx:showNotification', _src, 'Vous avez récolté ' .. count .. ' ' .. labelOpium)
    else
        TriggerClientEvent('esx:showNotification', _src, 'Vous n\'avez pas assez de place dans votre inventaire')
    end
end)

RegisterServerEvent('netshhh-drugs:opiumtraitement')
AddEventHandler('netshhh-drugs:opiumtraitement', function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local itemOpium_give = Config.Opium.OpiumTraitementItem
    local count_give = Config.Drogue.TraitementCount
    local itemOpium_remove = Config.Opium.OpiumRecolteItem
    local label_item_remove = Config.Opium.OpiumRecolteItemLabel
    local count_remove = Config.Drogue.RecolteRemove
    local label_itemOpium_give = Config.Opium.OpiumTraitementItemLabel
    local countItem = xPlayer.getInventoryItem(itemOpium_remove).count

    if xPlayer.getInventoryItem(itemOpium_give, count_give).count then
        if countItem >= count_remove then
            xPlayer.removeInventoryItem(itemOpium_remove, count_remove)
            xPlayer.addInventoryItem(itemOpium_give, count_give)
            TriggerClientEvent('esx:showNotification', _src, "Vous avez traité " .. count_give .. " " .. label_itemOpium_give)
        else
            TriggerClientEvent('esx:showNotification', _src, "Vous n'avez pas assez d'" .. label_item_remove .. " pour traiter il en faut "..count_remove)
        end
    else
        TriggerClientEvent('esx:showNotification', _src, "Vous n'avez pas assez de place dans votre inventaire")
    end
end)


RegisterServerEvent('netshhh-drugs:opiumvente')
AddEventHandler('netshhh-drugs:opiumvente', function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local blackMoney	= xPlayer.getAccount('dirtycash')

    local itemOpiumRequired = Config.Opium.OpiumTraitementItem
    local itemOpiumRequiredLabel = Config.Opium.OpiumTraitementItemLabel
    local numberRequired = Config.Drogue.NumberForSell
    local countItem = xPlayer.getInventoryItem(itemOpiumRequired).count
    local itemVendu = Config.Drogue.VenteCount
    local priceOpium = Config.Opium.OpiumPriceForSell

    if countItem >= numberRequired then
        xPlayer.removeInventoryItem(itemOpiumRequired, itemVendu)
        if Config.GiveBlackMoney then
            xPlayer.addAccountMoney('dirtycash', priceOpium)
        else
            xPlayer.addMoney(priceOpium)
        end
    else
        TriggerClientEvent('esx:showNotification', _src, "Vous n'avez pas assez de " .. itemOpiumRequiredLabel .. " pour vendre")
    end
end)

----------------------------
----------\/Meth/\----------
----------------------------
RegisterServerEvent('netshhh-drugs:methrecolte')
AddEventHandler('netshhh-drugs:methrecolte', function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local itemMeth = Config.Meth.MethRecolteItem
    local count = Config.Drogue.RecolteCount
    local labelMeth = Config.Meth.MethRecolteItemLabel
    if xPlayer.getInventoryItem(itemMeth, count).count then
        xPlayer.addInventoryItem(itemMeth, count)
        TriggerClientEvent('esx:showNotification', _src, 'Vous avez récolté ' .. count .. ' ' .. labelMeth)
    else
        TriggerClientEvent('esx:showNotification', _src, 'Vous n\'avez pas assez de place dans votre inventaire')
    end
end)

RegisterServerEvent('netshhh-drugs:methtraitement')
AddEventHandler('netshhh-drugs:methtraitement', function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local itemMeth_give = Config.Meth.MethTraitementItem
    local count_give = Config.Drogue.TraitementCount
    local itemMeth_remove = Config.Meth.MethRecolteItem
    local label_item_remove = Config.Meth.MethRecolteItemLabel
    local count_remove = Config.Drogue.RecolteRemove
    local label_itemMeth_give = Config.Meth.MethTraitementItemLabel
    local countItem = xPlayer.getInventoryItem(itemMeth_remove).count

    if xPlayer.getInventoryItem(itemMeth_give, count_give).count then
        if countItem >= count_remove then
            xPlayer.removeInventoryItem(itemMeth_remove, count_remove)
            xPlayer.addInventoryItem(itemMeth_give, count_give)
            TriggerClientEvent('esx:showNotification', _src, "Vous avez traité " .. count_give .. " " .. label_itemMeth_give)
        else
            TriggerClientEvent('esx:showNotification', _src, "Vous n'avez pas assez d'" .. label_item_remove .. " pour traiter il en faut "..count_remove)
        end
    else
        TriggerClientEvent('esx:showNotification', _src, "Vous n'avez pas assez de place dans votre inventaire")
    end
end)


RegisterServerEvent('netshhh-drugs:methvente')
AddEventHandler('netshhh-drugs:methvente', function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local blackMoney	= xPlayer.getAccount('dirtycash')

    local itemMethRequired = Config.Meth.MethTraitementItem
    local itemMethRequiredLabel = Config.Meth.MethTraitementItemLabel
    local numberRequired = Config.Drogue.NumberForSell
    local countItem = xPlayer.getInventoryItem(itemMethRequired).count
    local itemVendu = Config.Drogue.VenteCount
    local priceMeth = Config.Meth.MethPriceForSell

    if countItem >= numberRequired then
        xPlayer.removeInventoryItem(itemMethRequired, itemVendu)
        if Config.GiveBlackMoney then
            xPlayer.addAccountMoney('dirtycash', priceMeth)
        else
            xPlayer.addMoney(priceMeth)
        end
    else
        TriggerClientEvent('esx:showNotification', _src, "Vous n'avez pas assez de " .. itemMethRequiredLabel .. " pour vendre")
    end
end)