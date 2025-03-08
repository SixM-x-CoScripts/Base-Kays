-- CreateThread(function()
--     MySQL.Async.execute([[
--         CREATE TABLE IF NOT EXISTS `christmas_calendar` (
--             UniqueID INT(11) NOT NULL,
--             package LONGTEXT NOT NULL
--         )
--     ]])

--     MySQL.Async.fetchAll('SELECT * FROM `christmas_calendar`', {}, function(result)
--         for k,v in pairs(result) do
--             if not Christmas.Calendar.Players[v.UniqueID] then
--                 Christmas.Calendar.Players[v.UniqueID] = {}
--             end

--             Christmas.Calendar.Players[v.UniqueID][tonumber(v.package)] = {UniqueID = v.UniqueID, package = v.package}
--         end
--     end)

--     ESX.RegisterServerCallback('kayscore:christmas:calendar:fetch', function(source, cb)
--         local source = source 
--         local xPlayer = ESX.GetPlayerFromId(source)

--         if not xPlayer then return end

--         local currentDate = os.date("*t", os.time())
--         local currentDayOfMonth = currentDate.day

--         cb(Christmas.Calendar.Players[xPlayer.UniqueID], currentDayOfMonth)
--     end)

--     RegisterNetEvent('kayscore:christmas:calendar:paidPackage', function(packageNumber)
--         local source = source
--         local xPlayer = ESX.GetPlayerFromId(source)

--         if not xPlayer then return end

--         if not Christmas.Calendar.Players[xPlayer.UniqueID] then
--             Christmas.Calendar.Players[xPlayer.UniqueID] = {}
--         end

--         if Christmas.Calendar.Players[xPlayer.UniqueID][packageNumber] then
--             return xPlayer.showNotification('Vous possedez déjà cette récompense')
--         end

--         MySQL.Async.execute('INSERT INTO christmas_calendar (UniqueID, package) VALUES (@UniqueID, @package)', {
--             ['@UniqueID'] = xPlayer.UniqueID,
--             ['@package'] = packageNumber
--         }, function()
--             Christmas.Calendar.Players[xPlayer.UniqueID][packageNumber] = {UniqueID = xPlayer.UniqueID, package = packageNumber}

--             if Christmas.Calendar.Package[packageNumber] then
--                 Christmas.Calendar.Package[packageNumber].reward(source) 
--             end
--         end)
--     end)
-- end)