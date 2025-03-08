-- RegisterServerEvent('kayscore:weapons:checkItems')
-- AddEventHandler('kayscore:weapons:checkItems', function(item1, item2, cb)
--     local xPlayer = ESX.GetPlayerFromId(source)

--     local hasItem1 = xPlayer.getInventoryItem(item1).count
--     local hasItem2 = xPlayer.getInventoryItem(item2).count

--     if hasItem1 >= Config[item1].amount and hasItem2 >= Config[item2].amount then
--         cb(true)
--     else
--         cb(false)
--     end
-- end)

-- RegisterServerEvent('kayscore:weapons:checkPlayerCategory')
-- AddEventHandler('kayscore:weapons:checkPlayerCategory', function(category, callback)
--     local _source = source
--     local jobName = ESX.GetPlayerFromId(_source).job.name

--     MySQL.Async.fetchAll('SELECT * FROM gangs_new WHERE name = @name AND cat = @cat', {
--         ['@name'] = jobName,
--         ['@cat'] = category
--     }, function(result)
--         local playerInCategory = false
--         if result and #result > 0 then
--             playerInCategory = true
--         end
--         callback(playerInCategory)
--     end)
-- end)

