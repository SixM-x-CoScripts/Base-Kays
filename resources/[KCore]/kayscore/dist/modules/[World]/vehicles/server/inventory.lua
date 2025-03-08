-- local vehiclesInventory = {}
-- local ephemeralInventory = {}
-- local unsavedInventory = {}


-- ------------------------------------------------------------
-- -- FUNCTIONS
-- ------------------------------------------------------------

-- local function getLoadedInventory(vehiclePlate)
--     if type(vehiclePlate) ~= 'string' then print('"getLoadedInventory" Function Error: The vehicle plate passed to the "vehiclePlate" argument is incorrect!') return nil end

--     if vehiclesInventory[vehiclePlate] ~= nil then
--         return vehiclesInventory[vehiclePlate], tonumber(1)

--     elseif ephemeralInventory[vehiclePlate] ~= nil then
--         return ephemeralInventory[vehiclePlate], tonumber(2)

--     else
--         print('"getLoadedInventory" Function Error: The inventory you want to collect is not loaded!')
--         return nil
--     end
-- end


-- local function saveVehiclesInventories()
--     local savedInventories = 0
--     local ephemeralInventoryDeleted = 0

--     for k, v in pairs(unsavedInventory) do
--         local inventory, inventoryType = getLoadedInventory(v)

--         if inventoryType == 2 then
--             table.remove(unsavedInventory, k)
--             ephemeralInventoryDeleted += 1
--         else
--             MySQL.update.await('UPDATE owned_vehicles SET inventory = ? WHERE plate = ?', { json.encode(inventory), v })
--             table.remove(unsavedInventory, k)
--             savedInventories += 1
--         end
--     end

--     print('[COFFRES VEHICULES] ^2'.. savedInventories ..'^7 inventaires de véhicules ont été sauvegardés.')
--     print('[COFFRES VEHICULES] ^1'.. ephemeralInventoryDeleted ..'^7 inventaires de véhicules éphémères ont été abandonnés.')
--     print('[COFFRES VEHICULES] '..'Il reste ^3'.. #unsavedInventory ..'^7 véhicule à sauvegarder.')
-- end

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(15 * 60000)
--         saveVehiclesInventories()
--     end
-- end)


-- local function getVehiclePound(vehiclePlate)
--     if type(vehiclePlate) ~= 'string' then print('"getVehiclePound()" Function Error: The vehicle plate that was passed to the function "vehiclePlate" argument is in an incorrect format!') return nil end

--     local inventory = getLoadedInventory(vehiclePlate)
--     if inventory == nil then print('"getVehiclePound()" Function Error: Impossible to refresh the weight of a vehicle that has not already been loaded!') return nil end
    
--     inventory.pound = 0

--     for k, v in pairs(inventory['items']) do
--         if ESX.GetItem(v.name).weight ~= -1 then
--             inventory.pound += (ESX.GetItem(v.name).weight * v.count)
--         end
--     end

--     return inventory.pound
-- end


-- local function createVehicleInventory(vehicle, ephemeral)
--     if type(vehicle) ~= 'table' then print('"createVehicleInventory" Function Error: The vehicle data passed to the "vehicle" argument is incorrect!') return nil end
--     if type(ephemeral) ~= 'boolean' then print('"createVehicleInventory" Function Error: The ephemeral value passed to the "ephemeral" argument is incorrect!') return nil end

--     inventory = {
--         ['items'] = {},
--         ['weapons'] = {},
--         ['accounts'] = {
--             cash = 0,
--             black_money = 0
--         },
--         vehiclePound = kayscoreVehiclesConfig.Limit.GTA[vehicle.class],
--         pound = 0,
--     }

--     if not ephemeral then
--         vehiclesInventory[vehicle.plate] = inventory
--         return vehiclesInventory[vehicle.plate]
--     else
--         ephemeralInventory[vehicle.plate] = inventory
--         return ephemeralInventory[vehicle.plate]
--     end
-- end


-- local function getVehicleInventory(vehicle)
--     if type(vehicle) ~= 'table' then print('"getVehicleInventory" Function Error: The vehicle data passed to the "vehicle" argument is incorrect!') return nil end
    
--     if vehiclesInventory[vehicle.plate] == nil and ephemeralInventory[vehicle.plate] == nil then 
--         local response = MySQL.query.await('SELECT `plate`, `inventory` FROM `owned_vehicles` WHERE `plate` = ? LIMIT 1', { vehicle.plate })
    
--         if response[1] == nil or response[1].inventory == nil then
--             local bool = nil
--             if response[1] == nil then bool = true elseif response[1].inventory == nil then bool = false end

--             local inventory = createVehicleInventory(vehicle, bool) 
--             if type(inventory) ~= 'table' then return nil end
--         else
--             vehiclesInventory[vehicle.plate] = json.decode(response[1].inventory)
--         end
--     end

--     if ephemeralInventory[vehicle.plate] ~= nil then
--         return ephemeralInventory[vehicle.plate]
--     end

--     return vehiclesInventory[vehicle.plate]
-- end


-- local function doesPlayerConnected(playerID)
--     if (type(playerID) ~= 'number' or playerID == 0) or GetPlayerPing(playerID) <= 0 then
--         return false
--     end

--     return true
-- end


-- local function canOpenVehicleTrunk(playerID)
--     if not doesPlayerConnected(playerID) then return end

--     local pCoords = GetEntityCoords(GetPlayerPed(playerID))
--     local vehicleEntity, vCoords = lib.getClosestVehicle(pCoords, 6.0)

--     if vehicleEntity == nil or vCoords == nil then TriggerClientEvent('esx:showNotification', playerID, "Aucun véhicule aux alentours!") return nil end
--     if #(pCoords - vCoords) > 2.0 then TriggerClientEvent('esx:showNotification', playerID, "Vous êtes trop loin du véhicule pour consulter le contenu du coffre. Rapprochez-vous!") return nil end
--     if GetVehicleDoorLockStatus(vehicleEntity) ~= 0 then TriggerClientEvent('esx:showNotification', playerID, "Ce véhicule est fermé!") return nil end
    
--     local vehicle = {
--         entity = vehicleEntity,
--         plate = GetVehicleNumberPlateText(vehicleEntity)
--     }

--     return vehicle
-- end



-- ------------------------------------------------------------
-- -- EVENTS
-- ------------------------------------------------------------

-- RegisterNetEvent('L-VehiclesInventory:OpenInventoryRequest', function(vehiclePlate, vehicleClass)
--     local source = source

--     local vehicle = canOpenVehicleTrunk(source)
--     if type(vehicle) ~= 'table' then return end
--     vehicle.class = vehicleClass

--     local inventory = getVehicleInventory(vehicle)
--     TriggerClientEvent('L-VehiclesInventory:OpenInventoryAnswer', source, vehiclePlate, inventory)
-- end)


-- secured_RegisterNetEvent('L-VehiclesInventory:DepositItem', function(vehiclePlate, itemData, count)
--     local source = source
--     local xPlayer = ESX.GetPlayerFromId(source)
--     if not xPlayer then return end

--     local inventory, inventoryType = getLoadedInventory(vehiclePlate)
    
--     if inventory == nil then return print('"L-VehiclesInventory:DepositItem" Event Error: Unable to place an item in a vehicle inventory that has not been loaded.') end
    
--     if xPlayer.getInventoryItem(itemData.name).count < count then return end
--     xPlayer.removeInventoryItem(itemData.name, count)

--     local vehiclePound = getVehiclePound(vehiclePlate)
--     if vehiclePound == nil then return print('"L-VehiclesInventory:DepositItem" Event Error: An error occurred while retrieving the vehicle poud!') end

--     vehiclePound += ESX.GetItem(itemData.name).weight * count
--     if vehiclePound > inventory.vehiclePound then return TriggerClientEvent('esx:showNotification', source, "Il n'y a pas assez de place dans le véhicule.") end

--     inventory.pound = vehiclePound

--     if inventory['items'][itemData.name] then
--         inventory['items'][itemData.name].count += count
--     else
--         inventory['items'][itemData.name] = {
--             name = itemData.name,
--             label = itemData.label,
--             count = count,
--         }
--     end

--     if inventoryType == 1 then
--         vehiclesInventory[vehiclePlate] = inventory
--     elseif inventoryType == 2 then
--         ephemeralInventory[vehiclePlate] = inventory
--     end

--     table.insert(unsavedInventory, vehiclePlate)
--     TriggerClientEvent('L-VehiclesInventory:OpenInventoryAnswer', source, vehiclePlate, inventory)

--     sendLog(("Dépot d'objet(s) dans un vehicule (%s - %s) Plaque (%s) (Coffre)"):format(xPlayer.name, xPlayer.UniqueID, vehiclePlate), {
--         author = xPlayer.name,
--         fields = {
--             {title = 'Joueur', subtitle = xPlayer.name},
--             {title = 'ID Unique', subtitle = xPlayer.UniqueID},
--             {title = 'Identifier', subtitle = xPlayer.identifier},
--             {title = 'Item Déposé / Qauntité', subtitle = ('%s / %s'):format(itemData.name, count)},
--             {title = 'Plaque', subtitle = vehiclePlate},
--             {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
--         },
--         channel = 'garage_depot'
--     })

--     TriggerClientEvent('esx:showNotification', source, ('Vous avez déposé ~y~x%s %s~s~ dans le coffre du véhicule'):format(count, itemData.label))
-- end)


-- secured_RegisterNetEvent('L-VehiclesInventory:RemoveItem', function(vehiclePlate, itemData, count)
--     local source = source
--     local xPlayer = ESX.GetPlayerFromId(source)
--     if not xPlayer then return end

--     local inventory, inventoryType = getLoadedInventory(vehiclePlate)

--     if inventory == nil then return print('"L-VehiclesInventory:RemoveItem" Event Error: Unable to remove an item in a vehicle inventory that has not been loaded.') end
--     if inventory['items'][itemData.name] == nil then return TriggerClientEvent('esx:showNotification', source, 'Cet item n\'est plus dans le coffre!') end

--     inventory['items'][itemData.name].count -= count
--     if inventory['items'][itemData.name].count <= 0 then inventory['items'][itemData.name] = nil end

--     local vehiclePound = getVehiclePound(vehiclePlate)
--     inventory.pound = vehiclePound

--     xPlayer.addInventoryItem(itemData.name, count)

--     if inventoryType == 1 then
--         vehiclesInventory[vehiclePlate] = inventory
--     elseif inventoryType == 2 then
--         ephemeralInventory[vehiclePlate] = inventory
--     end

--     table.insert(unsavedInventory, vehiclePlate)
--     TriggerClientEvent('L-VehiclesInventory:OpenInventoryAnswer', source, vehiclePlate, inventory)
    
--     sendLog(("Prise d'objet dans un vhicule (%s - %s) Plaque (%s) (Coffre)"):format(xPlayer.name, xPlayer.UniqueID, vehiclePlate), {
--         author = xPlayer.name,
--         fields = {
--             {title = 'Joueur', subtitle = xPlayer.name},
--             {title = 'ID Unique', subtitle = xPlayer.UniqueID},
--             {title = 'Identifier', subtitle = xPlayer.identifier},
--             {title = 'Item pris / Qauntité', subtitle = ('%s / %s'):format(itemData.name, count)},
--             {title = 'Plaque', subtitle = vehiclePlate},
--             {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
--         },
--         channel = 'garage_prendre'
--     })

--     TriggerClientEvent('esx:showNotification', source, ('Vous avez pris ~y~x%s %s~s~ dans le coffre du véhicule'):format(count, itemData.label))
-- end)


-- secured_RegisterNetEvent('L-VehiclesInventory:AddWeapon', function(vehiclePlate, weaponData)
--     local source = source
--     local xPlayer = ESX.GetPlayerFromId(source)
    
--     if not xPlayer then return end

--     local inventory, inventoryType = getLoadedInventory(vehiclePlate)

--     if inventory == nil then
--         print('"L-VehiclesInventory::addWeapon" Event Error: Unable to place a weapon in a vehicle inventory that has not been loaded.')
--         return
--     end

--     -- Dépôt de l'arme dans le coffre du véhicule
--     inventory['weapons'][#inventory['weapons'] + 1] = {
--         number = #inventory['weapons'] + 1,  -- Numéro de l'arme dans le coffre
--         name = weaponData.name,
--         label = weaponData.label,
--         ammo = weaponData.ammo
--     }

--     -- Retrait de l'arme du joueur
--     xPlayer.removeWeapon(weaponData.name)

--     -- Mise à jour de l'inventaire du véhicule
--     if inventoryType == 1 then
--         vehiclesInventory[vehiclePlate] = inventory
--     elseif inventoryType == 2 then
--         ephemeralInventory[vehiclePlate] = inventory
--     end

--     -- Ajout du véhicule à la liste des inventaires non sauvegardés
--     table.insert(unsavedInventory, vehiclePlate)

--     -- Notification au joueur et mise à jour de l'inventaire client
--     TriggerClientEvent('L-VehiclesInventory:OpenInventoryAnswer', source, vehiclePlate, inventory)
--     TriggerClientEvent('esx:showNotification', source, ('Vous avez déposé ~y~x%s %s~s~ dans le coffre du véhicule'):format(1, weaponData.label))

--     -- Envoi des logs
--     sendLog(("Dépôt d'une arme dans un véhicule (%s - %s) Plaque (%s) (Coffre)"):format(xPlayer.name, xPlayer.UniqueID, vehiclePlate), {
--         author = xPlayer.name,
--         fields = {
--             {title = 'Joueur', subtitle = xPlayer.name},
--             {title = 'ID Unique', subtitle = xPlayer.UniqueID},
--             {title = 'Identifier', subtitle = xPlayer.identifier},
--             {title = 'Arme', subtitle = weaponData.label},
--             {title = 'Plaque', subtitle = vehiclePlate},
--             {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
--         },
--         channel = 'veh_depot_arme'
--     })
-- end)

 

-- secured_RegisterNetEvent('L-VehiclesInventory:RemoveWeapon', function(vehiclePlate, weaponData, weaponId)
--     local source = source
--     local xPlayer = ESX.GetPlayerFromId(source)
--     if not xPlayer then return end

--     -- Vérifie si le joueur possède déjà l'arme dans son inventaire
--     if xPlayer.hasWeapon(weaponData.name) then
--         TriggerClientEvent('esx:showNotification', source, 'Vous possédez déjà cette arme.')
--         return
--     end

--     local inventory, inventoryType = getLoadedInventory(vehiclePlate)

--     if inventory == nil then
--         print('"L-VehiclesInventory:RemoveWeapon" Event Error: Unable to remove an weapon in a vehicle inventory that has not been loaded.')
--         return
--     end

--     if inventory['weapons'][weaponId] == nil then
--         TriggerClientEvent('esx:showNotification', source, 'Cette arme n\'est plus dans le coffre!')
--         return
--     end

--     -- Retrait de l'arme du coffre du véhicule
--     inventory['weapons'][weaponId] = nil

--     -- Ajout de l'arme au joueur
--     xPlayer.addWeapon(weaponData.name, weaponData.ammo)

--     -- Mise à jour de l'inventaire du véhicule
--     if inventoryType == 1 then
--         vehiclesInventory[vehiclePlate] = inventory
--     elseif inventoryType == 2 then
--         ephemeralInventory[vehiclePlate] = inventory
--     end

--     -- Ajout du véhicule à la liste des inventaires non sauvegardés
--     table.insert(unsavedInventory, vehiclePlate)

--     -- Notification au joueur et mise à jour de l'inventaire client
--     TriggerClientEvent('L-VehiclesInventory:OpenInventoryAnswer', source, vehiclePlate, inventory)
--     TriggerClientEvent('esx:showNotification', source, ('Vous avez pris ~y~x%s %s~s~ dans le coffre du véhicule'):format(1, weaponData.label))

--     -- Envoi des logs
--     sendLog(("Retrait d'une arme dans un véhicule (%s - %s) Plaque (%s) (Coffre)"):format(xPlayer.name, xPlayer.UniqueID, vehiclePlate), {
--         author = xPlayer.name,
--         fields = {
--             {title = 'Joueur', subtitle = xPlayer.name},
--             {title = 'ID Unique', subtitle = xPlayer.UniqueID},
--             {title = 'Identifier', subtitle = xPlayer.identifier},
--             {title = 'Arme', subtitle = weaponData.label},
--             {title = 'Plaque', subtitle = vehiclePlate},
--             {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
--         },
--         channel = 'veh_retire_arme'
--     })
-- end)



-- secured_RegisterNetEvent('L-VehiclesInventory:ActionsMoney', function(vehiclePlate, action, type, money, count)
--     local source = source
--     local xPlayer = ESX.GetPlayerFromId(source)
--     if not xPlayer then return end

--     local inventory, inventoryType = getLoadedInventory(vehiclePlate)
--     print(inventoryType)

--     if inventory == nil then return print('"L-VehiclesInventory:ActionsMoney" Event Error: Unable to perfom action money in a vehicle inventory that has not been loaded.') end

--     local labelData = { ['cash'] = 'D\'argent Prope', ['black_money'] = 'D\'argent Sale' }

--     if action == 'remove' then
--         if inventory['accounts'][type] < count then return TriggerClientEvent('esx:showNotification', source, "Il n'y a pas assez d'argent dans le coffre pour retirer cette somme !") end
        
--         inventory['accounts'][type] -= count
--         xPlayer.addAccountMoney(type, count)

--         if inventoryType == 1 then
--             vehiclesInventory[vehiclePlate] = inventory
--         elseif inventoryType == 2 then
--             ephemeralInventory[vehiclePlate] = inventory
--         end

--         table.insert(unsavedInventory, vehiclePlate)
--         TriggerClientEvent('L-VehiclesInventory:OpenInventoryAnswer', source, vehiclePlate, inventory)

--         TriggerClientEvent('esx:showNotification', source, ('Vous avez pris ~y~x%s %s~s~ dans le coffre du véhicule'):format(count, labelData[type]))

--         sendLog(('Take argent Dans un vehicule (%s - %s) Plaque (%s) (Coffre)'):format(xPlayer.name, xPlayer.UniqueID, plate), {
--             author = xPlayer.name,
--             fields = {
--                 {title = 'Joueur', subtitle = xPlayer.name},
--                 {title = 'ID Unique', subtitle = xPlayer.UniqueID},
--                 {title = 'Identifier', subtitle = xPlayer.identifier},
--                 {title = 'Argent', subtitle = ('%s %s'):format(count, labelData[type])},
--                 {title = 'Plaque', subtitle = plate},
--                 {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
--             },
--             channel = 'veh_retire_argent'
--         })

--     elseif action == 'deposit' then
--         if xPlayer.getAccount(type).money < count then return TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d'argent pour déposer cette somme dans le coffre !") end

--         xPlayer.removeAccountMoney(type, count)
--         inventory['accounts'][type] += count

--         if inventoryType == 1 then
--             vehiclesInventory[vehiclePlate] = inventory
--         elseif inventoryType == 2 then
--             ephemeralInventory[vehiclePlate] = inventory
--         end

--         table.insert(unsavedInventory, vehiclePlate)
--         TriggerClientEvent('L-VehiclesInventory:OpenInventoryAnswer', source, vehiclePlate, inventory)

--         TriggerClientEvent('esx:showNotification', source, ('Vous avez déposé ~y~x%s %s~s~ dans le coffre du véhicule'):format(count, labelData[type]))
        
--         sendLog(('Depot argent Dans un vehicule (%s - %s) Plaque (%s) (Coffre)'):format(xPlayer.name, xPlayer.UniqueID, plate), {
--             author = xPlayer.name,
--             fields = {
--                 {title = 'Joueur', subtitle = xPlayer.name},
--                 {title = 'ID Unique', subtitle = xPlayer.UniqueID},
--                 {title = 'Identifier', subtitle = xPlayer.identifier},
--                 {title = 'Argent', subtitle = ('%s %s'):format(count, labelData[type])},
--                 {title = 'Plaque', subtitle = plate},
--                 {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
--             },
--             channel = 'veh_depot_argent'
--         })
--     end
-- end)