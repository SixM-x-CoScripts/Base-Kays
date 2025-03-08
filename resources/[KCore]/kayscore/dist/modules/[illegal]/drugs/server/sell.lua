-- ESX.RegisterServerCallback('kayscore:drugs:sell:getPhone', function(source, cb)
--     cb(true)
-- end)

-- ESX.RegisterServerCallback('kayscore:drugs:sell:getItem', function(source, cb, drugsName)
--     local source = source
--     local xPlayer = ESX.GetPlayerFromId(source)

--     if not xPlayer then return cb(false) end

--     if not xPlayer.getInventoryItem(drugsName) then TriggerClientEvent('esx:showNotification', source, ('Vous devez posséder aux minimums ~r~5 pochons de drogue')) cb(false) return end

--     if xPlayer.getInventoryItem(drugsName).count >= 5 then
--         cb(true)
--     else
--         TriggerClientEvent('esx:showNotification', source, ('Vous devez posséder aux minimums ~r~5 pochons de drogue'))
--         cb(false)
--         return
--     end
-- end)


-- RegisterNetEvent('kayscore:drugs:sell', function(drugsName)
--     local source = source
--     local xPlayer = ESX.GetPlayerFromId(source)

--     if not xPlayer then return end

--     if xPlayer.getInventoryItem(drugsName).count < 5 then TriggerClientEvent('esx:showNotification', source, ('Vous devez posséder aux minimums ~r~5 pochons de drogue')) TriggerClientEvent('kayscore:drugs:stop', source) return end

--         drugsCount = math.random(kayscoreDrugs.sell.Drugs[drugsName].min, kayscoreDrugs.sell.Drugs[drugsName].max)*boost_farm.boostFarm(xPlayer.UniqueID).boost
--         drugsPrice = math.random(kayscoreDrugs.sell.Drugs[drugsName].minPrice, kayscoreDrugs.sell.Drugs[drugsName].maxPrice)*drugsCount*boost_farm.boostFarm(xPlayer.UniqueID).boost


--     if xPlayer.getInventoryItem(drugsName).count < drugsCount then
--         drugsCount = xPlayer.getInventoryItem(drugsName).count
--         drugsPrice = math.random(kayscoreDrugs.sell.Drugs[drugsName].minPrice, kayscoreDrugs.sell.Drugs[drugsName].maxPrice)*drugsCount
--     end

--     xPlayer.removeInventoryItem(drugsName, drugsCount)
--     xPlayer.addAccountMoney('black_money', drugsPrice)

--     TriggerClientEvent('esx:showNotification', source, ('Vous avez vendu ~y~x%s~s~ de ~y~%s~s~ pour ~r~%s$ d\'argent sale~s~'):format(drugsCount, kayscoreDrugs.sell.Drugs[drugsName].label, drugsPrice))
-- end)

-- RegisterNetEvent('kayscore:police:drugs:callcop', function(data)
--     local players = ESX.GetExtendedPlayers('job', 'police')

--     for k,v in pairs(players) do
--         TriggerClientEvent('kayscore:police:callDrugs', v.source, data)
--     end
-- end)

-- RegisterNetEvent('kayscore:police:drugs:callcopnord', function(data)
--     local players = ESX.GetExtendedPlayers('job', 'bcso')

--     for k,v in pairs(players) do
--         TriggerClientEvent('kayscore:police:callDrugsnord', v.source, data)
--     end
-- end)