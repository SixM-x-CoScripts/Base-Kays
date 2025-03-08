local allCoffres = {}

local function loadCoffre()
    MySQL.Async.fetchAll("SELECT * FROM vCoffre", {}, function(result)
        for k, info in pairs(result) do
            allCoffres[info.id] = json.decode(info.coffre)
        end
    end)
end

RegisterNetEvent("vCoffre:loadCoffre")
AddEventHandler("vCoffre:loadCoffre", function()
    local src = source
    TriggerClientEvent("vCoffre:loadCoffre", src, allCoffres)
end)

Citizen.CreateThread(function()
    loadCoffre()
end)

local ESX = nil

TriggerEvent(Config.option.esxGetter, function(obj) ESX = obj end)

ESX.RegisterServerCallback("vCoffre:playerData", function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb({inventory = xPlayer.inventory, weapons = xPlayer.loadout})
end)

ESX.RegisterServerCallback("vCoffre:coffreItSAMS", function(source, cb, Society)
	TriggerEvent("esx_addoninventory:getSharedInventory", Society, function(inventory)
		cb(inventory.itSAMS)
	end)
end)

ESX.RegisterServerCallback("vCoffre:coffreWeapons", function(source, cb, Society)
    TriggerEvent("esx_datastore:getSharedDataStore", Society, function(weapons)
        cb(weapons.get("weapons"))
    end)
end)

RegisterNetEvent("vCoffre:openMenuCheck")
AddEventHandler("vCoffre:openMenuCheck", function()
    local src = source
    if not Config.option.getAllowed[GetPlayerIdentifiers(src)[Config.option.identifierType]] then
        TriggerClientEvent("vCoffre:serverInterract", src, traduction("not_permission"))
        return
    end
    TriggerClientEvent("vCoffre:openMenu", src)
end)

RegisterNetEvent("vCoffre:validCoffre")
AddEventHandler("vCoffre:validCoffre", function(newCoffre)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if not Config.option.getAllowed[GetPlayerIdentifiers(src)[Config.option.identifierType]] then
        TriggerClientEvent("vCoffre:serverInterract", src, traduction("not_permission"))
        return
    end
    MySQL.Async.execute("INSERT INTO vCoffre (coffre) VALUES (@coffre)", {
        ["coffre"] = json.encode(newCoffre)
    }, function()
        if (newCoffre.coffreName ~= nil) and newCoffre.coffreItem and (newCoffre.addonInventory ~= nil) then
            local result1 = MySQL.Sync.fetchAll('SELECT * FROM addon_inventory WHERE name = @name', {
                ['@name'] = newCoffre.addonInventory
            })
            if result1[1].name then
                TriggerClientEvent("vCoffre:serverInterract", src, traduction("addoniventory_exist"))
            else
                MySQL.Async.execute("INSERT INTO addon_inventory (name, label, shared) VALUES (@name, @label, @shared)", {
                    ["name"] = newCoffre.addonInventory,
                    ["label"] = newCoffre.coffreName,
                    ["shared"] = 1
                })
            end
        end
        if (newCoffre.coffreName ~= nil) and newCoffre.coffreWeapon and (newCoffre.datastore ~= nil) then
            local result2 = MySQL.Sync.fetchAll('SELECT * FROM datastore WHERE name = @name', {
                ['@name'] = newCoffre.datastore
            })
            if result2[1].name then
                TriggerClientEvent("vCoffre:serverInterract", src, traduction("datastore_exist"))
            else
                MySQL.Async.execute("INSERT INTO datastore (name, label, shared) VALUES (@name, @label, @shared)", {
                    ["name"] = newCoffre.datastore,
                    ["label"] = newCoffre.coffreName,
                    ["shared"] = 1
                })
            end
        end
        TriggerClientEvent("vCoffre:serverInterract", src, traduction("creation_succes"))
    end)
end)

RegisterNetEvent("vCoffre:setItSAMS")
AddEventHandler("vCoffre:setItSAMS", function(coffreSelected, actionType, itemName, value)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if coffreSelected.job1Acces then
        if xPlayer.getJob().name == coffreSelected.job1Name then
            if actionType == "deposit" then
                TriggerEvent("esx_addoninventory:getSharedInventory", coffreSelected.addonInventory, function(inventory)

                    if xPlayer.getInventoryItem(itemName).count >= value and value > 0 then
                        xPlayer.removeInventoryItem(itemName, value)
                        inventory.addItem(itemName, value)
                        TriggerClientEvent("vCoffre:serverInterract", src, traduction("deposit_good"))
                    else
                        TriggerClientEvent("vCoffre:serverInterract", src, traduction("deposit_not_good"))
                    end
                end)
            elseif actionType == "recup" then
                TriggerEvent("esx_addoninventory:getSharedInventory", coffreSelected.addonInventory, function(inventory)
                    local item = inventory.getItem(itemName)
        
                    if item.count >= value then
                        inventory.removeItem(itemName, value)
                        xPlayer.addInventoryItem(itemName, value)
                        TriggerClientEvent("vCoffre:serverInterract", src, traduction("recup_good"))
                    else
                        TriggerClientEvent("vCoffre:serverInterract", src, traduction("recup_not_good"))
                    end
                end)
            end
        end
    elseif coffreSelected.job2Acces then
        if xPlayer.getJob2().name == coffreSelected.job2Name then
            if actionType == "deposit" then
                TriggerEvent("esx_addoninventory:getSharedInventory", coffreSelected.addonInventory, function(inventory)

                    if xPlayer.getInventoryItem(itemName).count >= value and value > 0 then
                        xPlayer.removeInventoryItem(itemName, value)
                        inventory.addItem(itemName, value)
                        TriggerClientEvent("vCoffre:serverInterract", src, traduction("deposit_good"))
                    else
                        TriggerClientEvent("vCoffre:serverInterract", src, traduction("deposit_not_good"))
                    end
                end)
            elseif actionType == "recup" then
                TriggerEvent("esx_addoninventory:getSharedInventory", coffreSelected.addonInventory, function(inventory)
                    local item = inventory.getItem(itemName)
        
                    if item.count >= value then
                        inventory.removeItem(itemName, value)
                        xPlayer.addInventoryItem(itemName, value)
                        TriggerClientEvent("vCoffre:serverInterract", src, traduction("recup_good"))
                    else
                        TriggerClientEvent("vCoffre:serverInterract", src, traduction("recup_not_good"))
                    end
                end)
            end
        end
    end
end)

RegisterNetEvent("vCoffre:setWeapons")
AddEventHandler("vCoffre:setWeapons", function(coffreSelected, actionType, weapon)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if coffreSelected.job1Acces then
        if xPlayer.getJob().name == coffreSelected.job1Name then
            if actionType == "deposit" then
                if xPlayer.hasWeapon(weapon.name) then
                    TriggerEvent("esx_datastore:getSharedDataStore", coffreSelected.datastore, function(store)
                        local weapons = store.get("weapons") or {}
                        weapon.name = string.upper(weapon.name)
            
                        table.insert(weapons, {
                            name = weapon.name,
                            ammo = weapon.munitions
                        })
            
                        xPlayer.removeWeapon(weapon.name)
                        store.set("weapons", weapons)
            
                        TriggerClientEvent("vCoffre:serverInterract", src, traduction("deposit_good"))
                    end)
                else
                    TriggerClientEvent("vCoffre:serverInterract", src, traduction("deposit_not_good"))
                end
            elseif actionType == "recup" then
                if not xPlayer.hasWeapon(weapon.name) then
                    TriggerEvent("esx_datastore:getSharedDataStore", coffreSelected.datastore, function(store)
                        local weapons = store.get("weapons") or {}
                        weapon.name = string.upper(weapon.name)
            
                        for i = 1, #weapons, 1 do
                            if weapons[i].name == weapon.name and weapons[i].ammo == weapon.munitions then
                                table.remove(weapons, i)
            
                                store.set("weapons", weapons)
                                xPlayer.addWeapon(weapon.name, weapon.munitions)
            
                                TriggerClientEvent("vCoffre:serverInterract", src, traduction("recup_good"))
                                break
                            end
                        end
                    end)
                else
                    TriggerClientEvent("vCoffre:serverInterract", src, traduction("recup_not_good_player_weapon"))
                end
            end
        end
    elseif coffreSelected.job2Acces then
        if xPlayer.getJob2().name == coffreSelected.job2Name then
            if actionType == "deposit" then
                if xPlayer.hasWeapon(weapon.name) then
                    TriggerEvent("esx_datastore:getSharedDataStore", coffreSelected.datastore, function(store)
                        local weapons = store.get("weapons") or {}
                        weapon.name = string.upper(weapon.name)
            
                        table.insert(weapons, {
                            name = weapon.name,
                            ammo = weapon.munitions
                        })
            
                        xPlayer.removeWeapon(weapon.name)
                        store.set("weapons", weapons)
            
                        TriggerClientEvent("vCoffre:serverInterract", src, traduction("recup_good"))
                    end)
                else
                    TriggerClientEvent("vCoffre:serverInterract", src, traduction("recup_not_good"))
                end
            elseif actionType == "recup" then
                if not xPlayer.hasWeapon(weapon.name) then
                    TriggerEvent("esx_datastore:getSharedDataStore", coffreSelected.datastore, function(store)
                        local weapons = store.get("weapons") or {}
                        weapon.name = string.upper(weapon.name)
            
                        for i = 1, #weapons, 1 do
                            if weapons[i].name == weapon.name and weapons[i].ammo == weapon.munitions then
                                table.remove(weapons, i)
            
                                store.set("weapons", weapons)
                                xPlayer.addWeapon(weapon.name, weapon.munitions)
            
                                TriggerClientEvent("vCoffre:serverInterract", src, traduction("recup_good"))
                                break
                            end
                        end
                    end)
                else
                    TriggerClientEvent("vCoffre:serverInterract", src, traduction("recup_not_good_player_weapon"))
                end
            end
        end
    end
end)