-- CreateThread(function()
--     RegisterNetEvent('kayscore:casino:coin:paid', function(price, q)
--         local source = source
--         local player = ESX.GetPlayerFromId(source)
        
--         if player == nil then return end
        
--         if xPlayer.getAccount('bank').money < price then return TriggerClientEvent('esx:showNotification', source, 'Vous ne possedez pas les fonds suffisants sur votre compte en banque') end

--         xPlayer.removeAccountMoney("bank", price)
--         player.addInventoryItem('jeton', q)
--     end)

--     RegisterNetEvent('kayscore:casino:coin:remove', function(price, q)
--         local source = source
--         local player = ESX.GetPlayerFromId(source)
        
--         if player == nil then return end
        
--         if player.getInventoryItem('jeton').money < q then return TriggerClientEvent('esx:showNotification', source, 'Vous ne possedez pas les jestons requis') end

--         xPlayer.addAccountMoney("bank", price)
--         player.removeInventoryItem('jeton', q)
--     end)
-- end)