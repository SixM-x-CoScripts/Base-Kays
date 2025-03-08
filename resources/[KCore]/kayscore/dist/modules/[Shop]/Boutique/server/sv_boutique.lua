-- secured_RegisterNetEvent('shopBoutique:vehicule', function(vehicleProps, plate_625, price, label, type)
--     local source = source
--     local xPlayer = ESX.GetPlayerFromId(source)

--     if not xPlayer then return end

--     local authorized = false
    
--     MySQL.Async.fetchAll(("SELECT kayscorecoins, totalCoins FROM users WHERE UniqueID = %s"):format(xPlayer.UniqueID) , {}, function (result)
--         if result[1].kayscorecoins >= tonumber(price) then
--             authorized = true
--             local newpoint = result[1].kayscorecoins - price
--             local newTotal = result[1].totalCoins + price

--             MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND name = @name', {
--                 ['@owner'] = xPlayer.UniqueID,
--                 ['@name'] = vehicleProps.model
--             }, function(result)
--                 if #result > 0 then
--                     -- Déclenche une notification disant que le joueur a déjà le véhicule
--                     TriggerClientEvent('esx:showNotification', source, 'Vous avez déjà ce véhicule.')

--                 else
--                     MySQL.Async.execute('INSERT INTO owned_vehicles (owner, state, plate, vehicle, name, label, type, job, garageid, boutique) VALUES (@owner, @state, @plate, @vehicle, @name, @label, @type, @job, @garageid, @boutique)', {
--                         ['@owner']   = xPlayer.UniqueID,
--                         ['@state'] = 1,
--                         ['@plate']   = plate_625,
--                         ['@vehicle'] = json.encode(vehicleProps),
--                         ['@name'] = vehicleProps.model,
--                         ['@label'] = label,
--                         ['@type'] = tostring(type),
--                         ['@job'] = 'unemployed',
--                         ['@garageid'] = type == 'car' and 1 or type == 'boat' and  3 or type == 'aircraft' and 2,
--                         ['boutique'] = 1,
--                     }, function(rowsChange)
--                         TriggerClientEvent('esx:showNotification', xPlayer.source, 'véhicule acheté avec succès.')
--                         MySQL.Async.execute('INSERT INTO boutique_history (uniqueid, data) VALUE (@uniqueid, @data)', {
--                             ['@uniqueid'] = xPlayer.UniqueID,
--                             ['@data'] = ('Vous avez acheté %s pour %s coins'):format(label, price)
--                         }, function()
--                             sendLog(('Achat véhicule boutique (%s - %s) (%s) (%s)'):format(xPlayer.name, xPlayer.UniqueID, vehicleProps.model.. ' | '..label, price), {
--                                 author = xPlayer.name,
--                                 fields = {
--                                     {title = 'Joueur', subtitle = xPlayer.name},
--                                     {title = 'ID Unique', subtitle = xPlayer.UniqueID},
--                                     {title = 'Identifier', subtitle = xPlayer.identifier},
--                                     {title = 'Véhicule', subtitle = vehicleProps.model.. ' | '..label},
--                                     {title = 'Prix', subtitle = price},
--                                     {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
--                                 },
--                                 channel = 'vehicle_buy_boutique'
--                             })
                            
--                             Garages:loadWithPlayerUniqueID(xPlayer.UniqueID)
--                         end)
--                         MySQL.Async.execute(("UPDATE users SET kayscorecoins = '".. newpoint .."' WHERE UniqueID = @UniqueID"), {
--                             ['@UniqueID'] = xPlayer.UniqueID
--                         }, function() 
--                             MySQL.Async.execute(("UPDATE users SET totalcoins = '".. newTotal .."' WHERE UniqueID = @UniqueID"), {
--                                 ['@UniqueID'] = xPlayer.UniqueID
--                             }, function() 
--                                 secured_TriggerClientEvent('boutique:update', source, newpoint, newTotal)
--                             end)
--                         end)
--                     end)
--                 end
--             end)
--         else
--             TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous ne possédez pas les coins nécessaires.')
--         end
--     end)
-- end)


-- secured_RegisterNetEvent('kayscore:fishing:boutique:buyRod', function(name, price)
--     local source = source
--     local xPlayer = ESX.GetPlayerFromId(source)

--     if not xPlayer then return end

--     xPlayer.addInventoryItem(name, 1)

--     MySQL.Async.fetchAll(("SELECT kayscorecoins, totalCoins FROM users WHERE UniqueID = %s"):format(xPlayer.UniqueID) , {}, function (result)
--         if result[1].kayscorecoins >= tonumber(price) then
--             authorized = true
--             newpoint = result[1].kayscorecoins - price
--             newTotal = result[1].totalCoins + price
--         end
--     end) 

--     Wait(50)

--     if not authorized then return end

--     sendLog(('Achat canne à pêche boutique (%s - %s) (%s) (%s)'):format(xPlayer.name, xPlayer.UniqueID, "Canne à pêche en aliage Or et Carbonne", price), {
--         author = xPlayer.name,
--         fields = {
--             {title = 'Joueur', subtitle = xPlayer.name},
--             {title = 'ID Unique', subtitle = xPlayer.UniqueID},
--             {title = 'Identifier', subtitle = xPlayer.identifier},
--             {title = 'Véhicule', subtitle = "Canne à pêche en aliage Or et Carbonne"},
--             {title = 'Prix', subtitle = price},
--             {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
--         },
--         channel = 'vehicle_buy_boutique'
--     })
--     MySQL.Async.execute('INSERT INTO boutique_history (uniqueid, data) VALUE (@uniqueid, @data)', {
--         ['@uniqueid'] = xPlayer.UniqueID,
--         ['@data'] = ('Vous avez acheté %s pour %s coins'):format(name, price)
--     }, function()
--     end)
--     MySQL.Async.execute(("UPDATE users SET kayscorecoins = '".. newpoint .."' WHERE UniqueID = @UniqueID"), {
--         ['@UniqueID'] = xPlayer.UniqueID
--     }, function() 
--     end)
--     MySQL.Async.execute(("UPDATE users SET totalcoins = '".. newTotal .."' WHERE UniqueID = @UniqueID"), {
--         ['@UniqueID'] = xPlayer.UniqueID
--     }, function() 
--     end)
--     secured_TriggerClientEvent('boutique:update', source, newpoint, newTotal)
-- end)

ESX.RegisterServerCallback('boutique:verifierplaquedispo', function (source, cb, plate)
    MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function (result)
        cb(result[1] ~= nil)
    end)
end)

-- VehiclesBoutique = {}


-- AddEventHandler("esx:playerLoaded", function(source, xPlayer)
--     local source = source

--     secured_TriggerClientEvent('kayscore:boutique:recieveboutique', source, VehiclesBoutique)
-- end)

-- RegisterNetEvent('kayscore:staff:boutique:addvehicle', function(name, label, price, type)
--     VehiclesBoutique = {}
--     MySQL.Async.execute('INSERT INTO vehicles_boutique (name, label, price, type) VALUES (@name, @label, @price, @type)', {
--         ['@name'] = name,
--         ['@label'] = label,
--         ['@price'] = price,
--         ['@type'] = type,
--     }, function()
--         MySQL.Async.fetchAll('SELECT * FROM vehicles_boutique', {}, function(result)
--             for k,v in pairs(result) do
--                 table.insert(VehiclesBoutique, {
--                     label = v.label,
--                     spawnName = v.name,
--                     price = v.price,
--                     type = v.type
--                 })
--             end

--             secured_TriggerClientEvent('kayscore:boutique:recieveboutique', -1, VehiclesBoutique)
--         end)
--     end)
-- end)

-- RegisterNetEvent('kayscore:staff:boutique:removevehicle', function(name)
--     VehiclesBoutique = {}
--     MySQL.Async.execute('DELETE FROM vehicles_boutique WHERE name = @name', {
--         ['@name'] = name,
--     }, function()
--         MySQL.Async.fetchAll('SELECT * FROM vehicles_boutique', {}, function(result)
--             for k,v in pairs(result) do
--                 table.insert(VehiclesBoutique, {
--                     label = v.label,
--                     spawnName = v.name,
--                     price = v.price,
--                     type = v.type,
--                 })
--             end

--             secured_TriggerClientEvent('kayscore:boutique:recieveboutique', -1, VehiclesBoutique)
--         end)
--     end)
-- end)

-- CreateThread(function()
--     MySQL.Async.execute([[
--         CREATE TABLE IF NOT EXISTS vehicles_boutique (
--             name LONGTEXT DEFAULT NULL,
--             label LONGTEXT DEFAULT NULL,
--             price INT(11) DEFAULT NULL
--         );
--     ]])

--     MySQL.Async.fetchAll('SELECT * FROM vehicles_boutique', {}, function(result)
--         for k,v in pairs(result) do
--             table.insert(VehiclesBoutique, {
--                 label = v.label,
--                 spawnName = v.name,
--                 price = v.price,
--                 type = v.type,
--             })
--         end
--     end)
-- end)