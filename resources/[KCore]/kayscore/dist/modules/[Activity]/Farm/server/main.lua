-- RegisterNetEvent('kayscore:farm:farm', function(item, type)
--     local source = source
--     local xPlayer = ESX.GetPlayerFromId(source)

--     if (not xPlayer) then return end

--     local count = 0

--     if type == 'recolte' then
--         if (xPlayer) then
--             count = math.random(1, 3)
--             if not xPlayer.canCarryItem(Config_Farm.Items[item][type], 1) then TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez de place dans votre inventaire") return end
--             xPlayer.addInventoryItem(Config_Farm.Items[item][type].name, count)
    
--             TriggerClientEvent('esx:showNotification', source, ('🌿 Vous avez récolté ~y~+%s~s~ %s'):format(count, Config_Farm.Items[item][type].label))
--         end
--     elseif type == 'traitement' then
--         if (xPlayer) then
--             if xPlayer.getInventoryItem(Config_Farm.Items[item]['recolte'].name).count < 3 then return TriggerClientEvent('esx:showNotification', source, ('⚠️ Vous ne possédez pas asser de ~y~%s~s~ pour traiter'):format(item)) end
--             if not xPlayer.canCarryItem(Config_Farm.Items[item][type].name, 1) then TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez de place dans votre inventaire") return end
--             xPlayer.removeInventoryItem(Config_Farm.Items[item]['recolte'].name, 3)
--             xPlayer.addInventoryItem(Config_Farm.Items[item][type].name, 1)

--             TriggerClientEvent('esx:showNotification', source, ('🌿 ~y~x%s~s~ %s'):format(1, Config_Farm.Items[item][type].label))
--         end
--     end
-- end)

-- RegisterNetEvent('kayscore:farm:sell', function(count, itemName, price, itemLabel)
--     local source = source
--     local xPlayer = ESX.GetPlayerFromId(source)

--     if not xPlayer then return end

--     if xPlayer.getInventoryItem(itemName).count < count then
--         return
--     end

--     local society = Society:getSociety(xPlayer.job.name)

--     if not society then return end

--     xPlayer.removeInventoryItem(itemName, count)

--     local pricePlayer =  math.random(100, 110)
--     local totalPlayer = pricePlayer*count

--     local priceSociety = math.random(250, 350)
--     local totalSociety = priceSociety*count

--     xPlayer.addAccountMoney('bank', totalPlayer)
--     society.addSocietyMoney(totalSociety)

--     TriggerClientEvent('esx:showNotification', source, ('Vous avez vendu ~y~x%s~s~ %s\nVotre société a gagnée ~p~%s$~s~\nVous avez gagné ~g~%s$~s~'):format(count, itemLabel, totalSociety, totalPlayer))
--     sendLog(('Le Player (%s - %s) a vendu (%s- %s)'):format(xPlayer.name, xPlayer.UniqueID, itemName, count), {
--         author = 'Vente Farm',
--         fields = {
--             {title = 'Player', subtitle = xPlayer.name},
--             {title = 'ID Unique', subtitle = xPlayer.UniqueID},
--             {title = 'Identifier', subtitle = xPlayer.identifier},
--             {title = "Gain", subtitle = totalSociety},
--         },
--         channel = 'VenteFarm'
--     })
-- end)