ESX = nil
TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

function OpenShopForPlayer(source, shopType)
    local filteredItems = {}
    for _, item in pairs(Config.Items) do
        if item.shop == shopType then
            table.insert(filteredItems, item)
        end
    end

    TriggerClientEvent('shop:openMenu', source, filteredItems, shopType)
end

RegisterServerEvent('shop:requestItems')
AddEventHandler('shop:requestItems', function(shopType)
    local _source = source
    OpenShopForPlayer(_source, shopType)
end)

RegisterServerEvent('shop:checkMoney')
AddEventHandler('shop:checkMoney', function(data)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local total = tonumber(data.total)
    local items = data.items

    if xPlayer.getMoney() >= total then
        
        for _, item in pairs(items) do
            print('Processing item:', item.itemName, 'Type:', item.type, 'Quantity:', item.quantity)
            
            if item.type == "item" then
                if item.itemName == "boombox" then
                    if exports['kayscore']:haveVip(xPlayer.UniqueID) then
                        xPlayer.removeAccountMoney('cash', total)
                        xPlayer.addInventoryItem("boombox", item.quantity)
                        TriggerClientEvent('shop:checkoutResult', src, true)
                        TriggerClientEvent('esx:showNotification', src, 'Vous avez acheté des articles pour ~g~'..total..'$')
                    else
                        TriggerClientEvent('esx:showNotification', src, "~r~Vous n'êtes pas VIP")
                    end
                else
                    xPlayer.addInventoryItem(item.itemName, item.quantity)
                    xPlayer.removeAccountMoney('cash', total)
                    TriggerClientEvent('shop:checkoutResult', src, true)
                    TriggerClientEvent('esx:showNotification', src, 'Vous avez acheté des articles pour ~g~'..total..'$')
                end
            elseif item.type == "weapon" then
                xPlayer.addWeapon(item.itemName, item.quantity)
                xPlayer.removeAccountMoney('cash', total)
                TriggerClientEvent('shop:checkoutResult', src, true)
                TriggerClientEvent('esx:showNotification', src, 'Vous avez acheté des articles pour ~g~'..total..'$')
            elseif item.type == "props" then
                print('Adding Props:', item.label, 'Quantity:', item.quantity)
                MySQL.Async.execute('INSERT INTO players_props (UniqueID, data, name) VALUES (@UniqueID, @data, @name)', {
                    ['@UniqueID'] = xPlayer.UniqueID,
                    ['@data'] = json.encode({label = item.label, name = item.itemName, owner = xPlayer.UniqueID, count = item.quantity}),
                    ['@name'] = item.itemName
                })
                xPlayer.removeAccountMoney('cash', total)
                TriggerClientEvent('shop:checkoutResult', src, true)
                TriggerClientEvent('esx:showNotification', src, 'Vous avez acheté des articles pour ~g~'..total..'$')

            else
                print('Unknown item type:', item.type)
            end
        end
        
    else
        TriggerClientEvent('shop:checkoutResult', src, false)
        TriggerClientEvent('esx:showNotification', src, 'Vous n\'avez pas assez d\'argent.')
    end
end)

