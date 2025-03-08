-- CreateThread(function()
--     for k,v in pairs(BoutiqueConfig['Case']) do
--         ESX.RegisterUsableItem(k, function(source)
--             local xPlayer = ESX.GetPlayerFromId(source)
--             xPlayer.removeInventoryItem(k, 1)
--             secured_TriggerClientEvent('kayscore:OpenCase', source,k)
--         end)
--     end
-- end)

-- RegisterNetEvent('kayscore:boutique:case:buy', function(case, price, count)
--     local source = source
--     local xPlayer = ESX.GetPlayerFromId(source)

--     local authorized = false
--     MySQL.Async.fetchAll(("SELECT kayscorecoins, totalCoins FROM users WHERE UniqueID = %s"):format(xPlayer.UniqueID) , {}, function (result)
--         if result[1].kayscorecoins >= tonumber(price) then
--             authorized = true
--             newpoint = result[1].kayscorecoins - price
--             newTotal = result[1].totalCoins + price
--         end
--     end) 
--     Wait(50)

--     xPlayer.addInventoryItem(case, count)

--     MySQL.Async.execute(("UPDATE users SET kayscorecoins = '".. newpoint .."' WHERE UniqueID = @UniqueID"), {
--         ['@UniqueID'] = xPlayer.UniqueID
--     }, function() 
--     end)
--     MySQL.Async.execute(("UPDATE users SET totalcoins = '".. newTotal .."' WHERE UniqueID = @UniqueID"), {
--         ['@UniqueID'] = xPlayer.UniqueID
--     }, function() 
--         secured_TriggerClientEvent('boutique:update', source, newpoint, newTotal)
--     end)
-- end)