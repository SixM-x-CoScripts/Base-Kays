VehCoffre = {}
local OwnerVeh = {}
CoffreLoad = false
CoffreLoadNumber = 0

InVehTrunk = {}



RegisterCommand(Config.CommandDeleteTrunk, function(source)
    if source == 0 then
        deletePlate()
    end
end)

function deletePlate()
    local total = 0 
    MySQL.Async.fetchAll("SELECT info, id FROM exodia_trunk", {}, function(trunk)
        if trunk[1] then
            for k, v in pairs(trunk) do 
                local data = json.decode(v.info)
                if OwnerVeh[data.plate] ~= nil then
                else
                    total = total + 1
                    MySQL.Async.fetchAll("DELETE FROM exodia_trunk WHERE id = @id", {
                        ['@id'] = v.id
                    }, function(result)

                    end)
                end
            end
            debugprint("" .. total .. " trunk DELETE from the DB.")
        end
    end)
end

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    MySQL.Async.fetchAll("SELECT * FROM "..vehiclesTable, {}, function(result)
        for k, v in pairs(result) do
            if not OwnerVeh[v[plateVehTable]] then
                OwnerVeh[v[plateVehTable]] = {}
                OwnerVeh[v[plateVehTable]].plate = v[plateVehTable]
                OwnerVeh[v[plateVehTable]].owner = v[idVehTable]
            end
        end
        if Config.AutoDeleteTrunk then 
            deletePlate()
        end
    end)



    MySQL.Async.fetchAll("SELECT * FROM exodia_trunk", {}, function(result)
        for k, v in pairs(result) do
            CoffreLoadNumber = CoffreLoadNumber + 1
            local InfoVeh = json.decode(v.info)
            if not VehCoffre[InfoVeh.plate] then
                VehCoffre[InfoVeh.plate] = {}
                VehCoffre[InfoVeh.plate].id = v.id
                VehCoffre[InfoVeh.plate].infos = InfoVeh
                v.data = json.decode(v.data)
                if v.data ~= nil then
                    if v.data["items"] ~= nil then
                        VehCoffre[InfoVeh.plate].data = v.data
                    else
                        VehCoffre[InfoVeh.plate].data = v.data
                        VehCoffre[InfoVeh.plate].data["weapons"] = {}
                    end
                else
                    VehCoffre[InfoVeh.plate].data = {
                        ["weapons"] = {},
                        ["items"] = {},
                        ["clothes"] = {},
                        ['accounts'] = {}
                    }
                end
            end
        end
        CoffreLoad = true
        debugprint("" .. CoffreLoadNumber .. " trunk updated from the DB.")
    end)


end)




RegisterServerCallback("lgdddd:getChestVehicle", function(source, cb, plate)   

    if VehCoffre[plate] then
        cb({
            dataTrunk = VehCoffre[plate].data, 
            infosTrunk = VehCoffre[plate].infos, 
        })
    else
        cb('nil')
    end

end)

RegisterNetEvent("lgd_inv:TableActuTrunk")
AddEventHandler("lgd_inv:TableActuTrunk", function(plate, bool)
    local source = source 

    if bool then
        if not InVehTrunk[plate] then
            InVehTrunk[plate] = {}
        end

        table.insert(InVehTrunk[plate], source)
    else
        if InVehTrunk[plate] then
            for i, existingSource in ipairs(InVehTrunk[plate]) do
                if existingSource == source then
                    table.remove(InVehTrunk[plate], i)
                    break 
                end
            end
        end
    end
end)

function RefreshTrunk(player)
    for plate, sources in pairs(InVehTrunk) do
        for _, source in ipairs(sources) do
            if player ~= source then
                TriggerClientEvent("lgd_inv:ActuInTrunk", source, plate)
            end
        end
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------


AddEventHandler('onResourceStop', function(resourceName)
    saveTrunk()
end)

  
function saveTrunk()
    debugprint('Backup of vehicle trunks in progress...')

    for k, v in pairs(VehCoffre) do
        MySQL.Sync.execute("UPDATE exodia_trunk set info = @info, data = @data WHERE id = @id", {
            ["@id"] = v.id,
            ["@info"] = json.encode(v.infos),
            ["@data"] = json.encode(v.data)
        })
    end
    debugprint("The vehicle safes have been successfully saved!")

end

RegisterCommand(Config.saveTrunkCommand, function(source)
    if (source == 0) then
        saveTrunk()
    end
end, false)

CreateThread(function()
    while true do
        Wait(Config.savingTimer * 60 * 1000) --1mn
        saveTrunk()
    end
end)





-----------------------------------------------------------------------------------------------------------------------------------------------------------
-- RegisterNetEvent("lgd:takeInTrunk")
-- AddEventHandler("lgd:takeInTrunk", function(id, plate, max)
--     local source = source
--     local xPlayer = GetPlayerFromId(source)

--     MySQL.Async.execute("UPDATE exodia_clothes SET identifier = @identifier, trunk = @trunk WHERE id = @id", {
--         ["@identifier"] = GetPlayerLicense(xPlayer),
--         ["@trunk"] = 100,
--         ["@id"] = id
--     })

--     --   TriggerClientEvent("RefreshVehChest", source, plate, max)
--     sendToDiscordWithSpecialURL(
--         "🧥 T Item",
--         "\n\n``🔢``ID Unique: ``["..source.."] | "..xPlayer.getName().."``\n``💿``Licence: ``"..GetPlayerLicense(xPlayer).."``\n``💬``Action: `` take clothes "..id.." ``\n``🚗``Plate ``"..plate.."``", 
--         webhooks['takeInTrunk'].color, 
--         webhooks['takeInTrunk'].webhook
--     )
-- end)



RegisterNetEvent("lgd:actionClothTrunk")
AddEventHandler("lgd:actionClothTrunk", function(action, vehicle, data)
    local xPlayer = GetPlayerFromId(source)
    local VerifExistPlate = VehCoffre[vehicle.plate] ~= nil and true or false
    if Config.JustOwnerVehicle then 
        local VehNoOwner = OwnerVeh[vehicle.plate] ~= nil and true or false

        if VehNoOwner then
            if GetPlayerLicense(xPlayer) == OwnerVeh[vehicle.plate].owner then
                OwnerofVeh = true
            else
                OwnerofVeh = false
            end
        end
        if not OwnerofVeh then
            showNotification(xPlayer, Locales[Config.Language]['trunk_no_owner'], 'error')
            return
        end
    end

    if action == "deposit" then

        if not VerifExistPlate then
            local CreateVeh = CreateVehToBdd(vehicle.plate, vehicle.class)
            if CreateVeh then
                local VerifWeigt = tonumber(VehCoffre[vehicle.plate].infos.weight) + tonumber(data.weight) <= VehCoffre[vehicle.plate].infos.maxweight and true or false
                if VerifWeigt then
                    VehCoffre[vehicle.plate].data["clothes"][data.id] = {}
                    VehCoffre[vehicle.plate].data["clothes"][data.id].id = data.id
                    VehCoffre[vehicle.plate].data["clothes"][data.id].name = data.type
                    VehCoffre[vehicle.plate].data["clothes"][data.id].label = data.label
                    VehCoffre[vehicle.plate].data["clothes"][data.id].weight = tonumber(data.weight)
                    VehCoffre[vehicle.plate].data["clothes"][data.id].count = 1
                    VehCoffre[vehicle.plate].infos.weight = tonumber(VehCoffre[vehicle.plate].infos.weight) + tonumber(data.weight)

                    showNotification(xPlayer, (Locales[Config.Language]['trunk_deposit_label']):format(data.label), 'success')
                end
            end
        else
            local VerifWeigt = tonumber(VehCoffre[vehicle.plate].infos.weight) + tonumber(data.weight) <= VehCoffre[vehicle.plate].infos.maxweight and true or false
            if VerifWeigt then
                VehCoffre[vehicle.plate].data["clothes"][data.id] = {}
                VehCoffre[vehicle.plate].data["clothes"][data.id].id = data.id
                VehCoffre[vehicle.plate].data["clothes"][data.id].name = data.type
                VehCoffre[vehicle.plate].data["clothes"][data.id].label = data.label
                VehCoffre[vehicle.plate].data["clothes"][data.id].weight = tonumber(data.weight)
                VehCoffre[vehicle.plate].data["clothes"][data.id].count = 1
                VehCoffre[vehicle.plate].infos.weight = tonumber(VehCoffre[vehicle.plate].infos.weight) + tonumber(data.weight)
                showNotification(xPlayer, (Locales[Config.Language]['trunk_deposit_label']):format(data.label), 'success')
            else
                showNotification(xPlayer, Locales[Config.Language]['trunk_weight_max'], 'error')
            end
        end
        MySQL.Async.execute("UPDATE exodia_clothes SET identifier = @identifier WHERE id = @id", {
            ["@identifier"] = vehicle.plate,
            ["@id"] = data.id
        })
        RefreshTrunk(source)
    elseif action == 'remove' then 

        if VehCoffre[vehicle.plate].data["clothes"][data.id] ~= nil then
            VehCoffre[vehicle.plate].infos.weight = tonumber(VehCoffre[vehicle.plate].infos.weight) - tonumber(data.weight)
            showNotification(xPlayer, (Locales[Config.Language]['trunk_remove_label']):format(data.label), 'success')
            VehCoffre[vehicle.plate].data["clothes"][data.id] = nil
            MySQL.Async.execute("UPDATE exodia_clothes SET identifier = @identifier WHERE id = @id", {
                ["@identifier"] = GetPlayerLicense(xPlayer),
                ["@id"] = data.id
            })
        else
        end
        RefreshTrunk(source)
    end


    -- local source = source 
    -- local xPlayer = GetPlayerFromId(source)
    -- MySQL.Async.execute("UPDATE exodia_clothes SET identifier = @identifier, trunk = @trunk WHERE id = @id", {
    --     ["@identifier"] = nil,
    --     ["@trunk"] = plate,
    --     ["@id"] = id
    -- })
    sendToDiscordWithSpecialURL(
        "🧥 Trunk Clothes",
        "\n\n``🔢``ID : ``["..source.."] | "..xPlayer.getName().."``\n``💿``Licence: ``"..GetPlayerLicense(xPlayer).."``\n``💬``Action: `` "..action.." clothes "..data.label.." ``\n``🚗``Plate ``"..vehicle.plate.."``", 
        webhooks['putInCoffre'].color, 
        webhooks['putInCoffre'].webhook
    )
end)


-----------------------------------------------------------------------------------------------------------------------------------------------------------





CreateVehToBdd = function(plate, class)
    local xPlayer = GetPlayerFromId(source)
    local NewId = math.random(0, 999999)
    local Infos = {
        plate = plate,
        maxweight = Config.WeightVehicle[class],
        weight = 0
    }
    VehCoffre[plate] = {}
    VehCoffre[plate].plate = plate
    VehCoffre[plate].id = NewId
    VehCoffre[plate].infos = Infos
    VehCoffre[plate].data = {
        ["weapons"] = {},
        ["items"] = {},
        ["clothes"] = {},
        ['accounts'] = {}
    }
    MySQL.Async.execute("INSERT INTO exodia_trunk (info, id) VALUES (@info, @id)", {
        ["@info"] = json.encode(Infos),
        ["@id"] = NewId
    })
    return true
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------


RegisterNetEvent("lgdddd:actionItem", function(plate, class, action, count, name)
    local xPlayer = GetPlayerFromId(source)
    local VerifExistPlate = VehCoffre[plate] ~= nil and true or false
    if Config.JustOwnerVehicle then 
        local VehNoOwner = OwnerVeh[plate] ~= nil and true or false

        if VehNoOwner then
            if GetPlayerLicense(xPlayer) == OwnerVeh[plate].owner then
                OwnerofVeh = true
            else
                OwnerofVeh = false
            end
        end
        if not OwnerofVeh then
            showNotification(xPlayer, Locales[Config.Language]['trunk_no_owner'], 'error')
            return
        end
    end
    
    -- Vérification pour s'assurer que count est supérieur à 0
    count = tonumber(count)
    if count <= 0 then
        showNotification(xPlayer, Locales[Config.Language]['invalid_quantity'], 'error')
        return
    end

    local InfoItem = GetItem(xPlayer, name)

    if action == "deposit" then
        if InfoItem.count >= tonumber(count) then
            if not VerifExistPlate then
                local CreateVeh = CreateVehToBdd(plate, class)
                if CreateVeh then
                    local VerifWeigt = tonumber(VehCoffre[plate].infos.weight) + tonumber(InfoItem.weight * count) <= VehCoffre[plate].infos.maxweight and true or false
                    if VerifWeigt then
                        VehCoffre[plate].data["items"][InfoItem.name] = {}
                        VehCoffre[plate].data["items"][InfoItem.name].name = InfoItem.name
                        VehCoffre[plate].data["items"][InfoItem.name].label = InfoItem.label
                        VehCoffre[plate].data["items"][InfoItem.name].weight = tonumber(InfoItem.weight * count)
                        VehCoffre[plate].data["items"][InfoItem.name].count = tonumber(count)
                        VehCoffre[plate].infos.weight = tonumber(VehCoffre[plate].infos.weight) + tonumber(InfoItem.weight * count)
                        RemoveItem(xPlayer, name, count)
                    exports['sunny']:sendLog(("Dépot d'objet(s) dans un vehicule non joueur (%s - %s) Plaque (%s) (Coffre)"):format(xPlayer.name, xPlayer.UniqueID, plate), {
                        author = xPlayer.name,
                        fields = {
                            {title = 'Joueur', subtitle = xPlayer.name},
                            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                            {title = 'Identifier', subtitle = xPlayer.identifier},
                            {title = 'Item Déposé / Qauntité', subtitle = ('%s / %s'):format(InfoItem.label, count)},
                            {title = 'Plaque', subtitle = plate},
                            {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                        },
                        channel = 'garage_depot'
                    })
                        showNotification(xPlayer, (Locales[Config.Language]['trunk_deposit']):format(count, InfoItem.label), 'success')
                    else
                        showNotification(xPlayer, Locales[Config.Language]['trunk_weight_max'], 'error')
                    end
                end
            else
                local VerifWeigt = tonumber(VehCoffre[plate].infos.weight) + tonumber(InfoItem.weight * count) <= VehCoffre[plate].infos.maxweight and true or false
                if VerifWeigt then
                    if VehCoffre[plate].data["items"][InfoItem.name] then
                        VehCoffre[plate].data["items"][InfoItem.name].weight = VehCoffre[plate].data["items"][InfoItem.name].weight + tonumber(InfoItem.weight * count)
                        VehCoffre[plate].data["items"][InfoItem.name].count = VehCoffre[plate].data["items"][InfoItem.name].count + tonumber(count)
                        VehCoffre[plate].infos.weight = tonumber(VehCoffre[plate].infos.weight) + tonumber(InfoItem.weight * count)
                    else
                        VehCoffre[plate].data["items"][InfoItem.name] = {}
                        VehCoffre[plate].data["items"][InfoItem.name].name = InfoItem.name
                        VehCoffre[plate].data["items"][InfoItem.name].label = InfoItem.label
                        VehCoffre[plate].data["items"][InfoItem.name].weight = tonumber(InfoItem.weight * count)
                        VehCoffre[plate].data["items"][InfoItem.name].count = tonumber(count)
                        VehCoffre[plate].infos.weight = tonumber(VehCoffre[plate].infos.weight) + tonumber(InfoItem.weight * count)
                    end
                    RemoveItem(xPlayer, name, count)
                    exports['sunny']:sendLog(("Dépot d'objet(s) dans un vehicule (%s - %s) Plaque (%s) (Coffre)"):format(xPlayer.name, xPlayer.UniqueID, plate), {
                        author = xPlayer.name,
                        fields = {
                            {title = 'Joueur', subtitle = xPlayer.name},
                            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                            {title = 'Identifier', subtitle = xPlayer.identifier},
                            {title = 'Item Déposé / Qauntité', subtitle = ('%s / %s'):format(InfoItem.label, count)},
                            {title = 'Plaque', subtitle = plate},
                            {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                        },
                        channel = 'garage_depot'
                    })
                    showNotification(xPlayer, (Locales[Config.Language]['trunk_deposit']):format(count, InfoItem.label), 'success')
                else
                    showNotification(xPlayer, Locales[Config.Language]['trunk_weight_max'], 'error')
                end
            end
        else
            debugprint("BAN " .. source)
        end
        RefreshTrunk(source)
    elseif action == "remove" then
        if GetWeightPlayer(xPlayer, InfoItem.name, count) then
            if VehCoffre[plate].data["items"][InfoItem.name] ~= nil then
                if VehCoffre[plate].data["items"][InfoItem.name].count >= tonumber(count) then
                    VehCoffre[plate].data["items"][InfoItem.name].count = VehCoffre[plate].data["items"][InfoItem.name].count - tonumber(count)
                    VehCoffre[plate].data["items"][InfoItem.name].weight = VehCoffre[plate].data["items"][InfoItem.name].weight - tonumber(InfoItem.weight * count)
                    VehCoffre[plate].infos.weight = tonumber(VehCoffre[plate].infos.weight) - tonumber(InfoItem.weight * count)

                    showNotification(xPlayer, (Locales[Config.Language]['trunk_remove']):format(count, InfoItem.label), 'success')
                    AddItem(xPlayer, InfoItem.name, count)
                    exports['sunny']:sendLog(("Retrait d'objet dans un véhicule (%s - %s) Plaque (%s) (Coffre)"):format(xPlayer.name, xPlayer.UniqueID, plate), {
                        author = xPlayer.name,
                        fields = {
                            {title = 'Joueur', subtitle = xPlayer.name},
                            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                            {title = 'Identifier', subtitle = xPlayer.identifier},
                            {title = 'Item pris / Qauntité', subtitle = ('%s / %s'):format(InfoItem.label, count)},
                            {title = 'Plaque', subtitle = plate},
                            {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                        },
                        channel = 'garage_prendre'
                    })
                    if VehCoffre[plate].data["items"][InfoItem.name].count == 0 then
                        VehCoffre[plate].data["items"][InfoItem.name] = nil
                    end
                else
                    showNotification(xPlayer, Locales[Config.Language]['trunk_error_number_item'], 'error')
                end
            else
                debugprint("BAN " .. source)
            end
        else
            showNotification(xPlayer, Locales[Config.Language]['trunk_weight_player_max'], 'error')
        end
        RefreshTrunk(source)
    end
end)


RegisterNetEvent("lgdddd:actionsWeapon", function(action, vehicle, data)
    local xPlayer = GetPlayerFromId(source)
    local VerifExistPlate = VehCoffre[vehicle.plate] ~= nil and true or false
    if Config.JustOwnerVehicle then 
        local VehNoOwner = OwnerVeh[vehicle.plate] ~= nil and true or false

        if VehNoOwner then
            if GetPlayerLicense(xPlayer) == OwnerVeh[vehicle.plate].owner then
                OwnerofVeh = true
            else
                OwnerofVeh = false
            end
        end
        if not OwnerofVeh then
            showNotification(xPlayer, Locales[Config.Language]['trunk_no_owner'], 'error')
            return
        end
    end
    
    local InfoWeapon = getWeapon(xPlayer, data.name)
    if action == "deposit" then
        if InfoWeapon then
            if not VerifExistPlate then
                local CreateVeh = CreateVehToBdd(vehicle.plate, vehicle.class)
                if CreateVeh then
                    if Config.WeaponWeight[data.name] == nil then
                        Config.WeaponWeight[data.name] = Config.WeaponDefaultWeight
                    end
                    local VerifWeigt = tonumber(VehCoffre[vehicle.plate].infos.weight) + tonumber(Config.WeaponWeight[data.name]) <= VehCoffre[vehicle.plate].infos.maxweight and true or false
                    if VerifWeigt then
                        if not VehCoffre[vehicle.plate].data["weapons"][data.name] then
                            VehCoffre[vehicle.plate].data["weapons"][data.name] = {}
                            VehCoffre[vehicle.plate].data["weapons"][data.name].name = data.name
                            VehCoffre[vehicle.plate].data["weapons"][data.name].ammo = data.amount
                            VehCoffre[vehicle.plate].data["weapons"][data.name].label = data.label
                            VehCoffre[vehicle.plate].data["weapons"][data.name].weight = tonumber(Config.WeaponWeight[data.name])
                            VehCoffre[vehicle.plate].data["weapons"][data.name].count = 1
                            VehCoffre[vehicle.plate].infos.weight = tonumber(VehCoffre[vehicle.plate].infos.weight) + tonumber(Config.WeaponWeight[data.name])
                        end
                        removeWeapon(xPlayer, data.name)
                        exports['sunny']:sendLog(("Dépôt d'une arme dans un véhicule non joueur (%s - %s) Plaque (%s) (Coffre)"):format(xPlayer.name, xPlayer.UniqueID, vehicle.plate), {
                            author = xPlayer.name,
                            fields = {
                                {title = 'Joueur', subtitle = xPlayer.name},
                                {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                                {title = 'Identifier', subtitle = xPlayer.identifier},
                                {title = 'Arme', subtitle = data.label},
                                {title = 'Plaque', subtitle = vehicle.plate},
                                {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                            },
                            channel = 'veh_depot_arme'
                        })
                        showNotification(xPlayer, (Locales[Config.Language]['trunk_deposit_label']):format(data.label), 'success')
                    else
                        showNotification(xPlayer, Locales[Config.Language]['trunk_weight_max'], 'error')
                    end
                end
            else
                if Config.WeaponWeight[data.name] == nil then
                    Config.WeaponWeight[data.name] = Config.WeaponDefaultWeight
                end
                local VerifWeigt = tonumber(VehCoffre[vehicle.plate].infos.weight) + tonumber(Config.WeaponWeight[data.name]) <= VehCoffre[vehicle.plate].infos.maxweight and true or false
                if VerifWeigt then
                    if VehCoffre[vehicle.plate].data["weapons"][data.name] then
                        VehCoffre[vehicle.plate].data["weapons"][data.name].weight = VehCoffre[vehicle.plate].data["weapons"][data.name].weight + tonumber(Config.WeaponWeight[data.name])
                        VehCoffre[vehicle.plate].data["weapons"][data.name].count = VehCoffre[vehicle.plate].data["weapons"][data.name].count + 1
                        VehCoffre[vehicle.plate].infos.weight = tonumber(VehCoffre[vehicle.plate].infos.weight) + tonumber(Config.WeaponWeight[data.name])
                    else
                        VehCoffre[vehicle.plate].data["weapons"][data.name] = {}
                        VehCoffre[vehicle.plate].data["weapons"][data.name].name = data.name
                        VehCoffre[vehicle.plate].data["weapons"][data.name].ammo = data.amount
                        VehCoffre[vehicle.plate].data["weapons"][data.name].label = data.label
                        VehCoffre[vehicle.plate].data["weapons"][data.name].weight = tonumber(Config.WeaponWeight[data.name])
                        VehCoffre[vehicle.plate].data["weapons"][data.name].count = 1
                        VehCoffre[vehicle.plate].infos.weight = tonumber(VehCoffre[vehicle.plate].infos.weight) + tonumber(Config.WeaponWeight[data.name])
                    end
                    removeWeapon(xPlayer, data.name)
                    exports['sunny']:sendLog(("Dépôt d'une arme dans un véhicule (%s - %s) Plaque (%s) (Coffre)"):format(xPlayer.name, xPlayer.UniqueID, vehicle.plate), {
                        author = xPlayer.name,
                        fields = {
                            {title = 'Joueur', subtitle = xPlayer.name},
                            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                            {title = 'Identifier', subtitle = xPlayer.identifier},
                            {title = 'Arme', subtitle = data.label},
                            {title = 'Plaque', subtitle = vehicle.plate},
                            {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                        },
                        channel = 'veh_depot_arme'
                    })
                    showNotification(xPlayer, (Locales[Config.Language]['trunk_deposit_label']):format(data.label), 'success')
                else
                    showNotification(xPlayer, Locales[Config.Language]['trunk_weight_max'], 'error')
                end
            end

        end
        RefreshTrunk(source)
    elseif action == "remove" then
        -- if GetWeightPlayer(xPlayer, name, count) then

            if VehCoffre[vehicle.plate].data["weapons"][data.name] ~= nil then
                VehCoffre[vehicle.plate].data["weapons"][data.name].count = VehCoffre[vehicle.plate].data["weapons"][data.name].count - 1
                VehCoffre[vehicle.plate].data["weapons"][data.name].weight = VehCoffre[vehicle.plate].data["weapons"][data.name].weight - tonumber(Config.WeaponWeight[data.name])
                VehCoffre[vehicle.plate].infos.weight = tonumber(VehCoffre[vehicle.plate].infos.weight) - tonumber(Config.WeaponWeight[data.name])
                addWeapon(xPlayer, data.name, VehCoffre[vehicle.plate].data["weapons"][data.name].ammo)
                exports['sunny']:sendLog(("Retrait d'une arme dans un véhicule (%s - %s) Plaque (%s) (Coffre)"):format(xPlayer.name, xPlayer.UniqueID, vehicle.plate), {
                    author = xPlayer.name,
                    fields = {
                        {title = 'Joueur', subtitle = xPlayer.name},
                        {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                        {title = 'Identifier', subtitle = xPlayer.identifier},
                        {title = 'Arme', subtitle = data.label},
                        {title = 'Plaque', subtitle = vehicle.plate},
                        {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                    },
                    channel = 'veh_retire_arme'
                })
                showNotification(xPlayer, (Locales[Config.Language]['trunk_remove_label']):format(data.label), 'success')
                VehCoffre[vehicle.plate].data["weapons"][data.name] = nil

            else
                debugprint("BAN " .. source)
            end
        -- else
        --     showNotification(xPlayer, Locales[Config.Language]['trunk_weight_player_max'])
        -- end
        RefreshTrunk(source)
    end
end)



RegisterNetEvent("lgdddd:actionsAccount", function(action, vehicle, data)
    local xPlayer = GetPlayerFromId(source)
    local VerifExistPlate = VehCoffre[vehicle.plate] ~= nil and true or false

        -- Vérification pour s'assurer que count est supérieur à 0
        data.count = tonumber(data.count)
        if data.count <= 0 then
            showNotification(xPlayer, Locales[Config.Language]['invalid_quantity'], 'error')
            return
        end

    if Config.JustOwnerVehicle then 
        local VehNoOwner = OwnerVeh[vehicle.plate] ~= nil and true or false

        if VehNoOwner then
            if GetPlayerLicense(xPlayer) == OwnerVeh[vehicle.plate].owner then
                OwnerofVeh = true
            else
                OwnerofVeh = false
            end
        end
        if not OwnerofVeh then
            showNotification(xPlayer, Locales[Config.Language]['trunk_no_owner'], 'error')
            return
        end
    end
    if action == "deposit" then
        if getAccount(xPlayer, data.type) >= tonumber(data.count) then
            if not VerifExistPlate then
                local CreateVeh = CreateVehToBdd(vehicle.plate, vehicle.class)
                if CreateVeh then
                    if  VehCoffre[vehicle.plate].data["accounts"][data.type] ~= nil then
                        VehCoffre[vehicle.plate].data["accounts"][data.type] = VehCoffre[vehicle.plate].data["accounts"][data.type] + tonumber(data.count)
                    else
                        VehCoffre[vehicle.plate].data["accounts"][data.type] = {}
                        VehCoffre[vehicle.plate].data["accounts"][data.type].count = tonumber(data.count)
                    end
                    -- if VehCoffre[vehicle.plate].data["accounts"][data.type] then
                    --     VehCoffre[vehicle.plate].data["accounts"][data.type] =
                    --     VehCoffre[vehicle.plate].data["accounts"][data.type] + tonumber(data.count)
                    -- end
                    removeMoney(xPlayer, data.type, data.count)
                    exports['sunny']:sendLog(('Depot argent Dans un vehicule non joueur (%s - %s) Plaque (%s) (Coffre)'):format(xPlayer.name, xPlayer.UniqueID, vehicle.plate), {
                    author = xPlayer.name,
                    fields = {
                        {title = 'Joueur', subtitle = xPlayer.name},
                        {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                        {title = 'Identifier', subtitle = xPlayer.identifier},
                        {title = 'Argent', subtitle = ('%s %s'):format(data.count, data.type)},
                        {title = 'Plaque', subtitle = vehicle.plate},
                        {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                    },
                    channel = 'veh_depot_argent'
                })
                    showNotification(xPlayer, (Locales[Config.Language]['trunk_deposit']):format(data.count, data.label), 'success')
                end
            else
                if VehCoffre[vehicle.plate].data["accounts"][data.type] ~= nil then
                    VehCoffre[vehicle.plate].data["accounts"][data.type].count = VehCoffre[vehicle.plate].data["accounts"][data.type].count + tonumber(data.count)
                else
                    VehCoffre[vehicle.plate].data["accounts"][data.type] = {}
                    VehCoffre[vehicle.plate].data["accounts"][data.type].count = tonumber(data.count)
                end
                removeMoney(xPlayer, data.type, data.count)
                exports['sunny']:sendLog(('Depot argent Dans un vehicule (%s - %s) Plaque (%s) (Coffre)'):format(xPlayer.name, xPlayer.UniqueID, vehicle.plate), {
                    author = xPlayer.name,
                    fields = {
                        {title = 'Joueur', subtitle = xPlayer.name},
                        {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                        {title = 'Identifier', subtitle = xPlayer.identifier},
                        {title = 'Argent', subtitle = ('%s %s'):format(data.count, data.type)},
                        {title = 'Plaque', subtitle = vehicle.plate},
                        {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                    },
                    channel = 'veh_depot_argent'
                })
                showNotification(xPlayer, (Locales[Config.Language]['trunk_deposit']):format(data.count, data.label), 'success')
            end
        else
            showNotification(xPlayer, Locales[Config.Language]['trunk_error_number_item'], 'error')
        end
        RefreshTrunk(source)
    elseif action == "remove" then

        if VehCoffre[vehicle.plate].data["accounts"][data.type].count >= tonumber(data.count) then
            VehCoffre[vehicle.plate].data["accounts"][data.type].count = VehCoffre[vehicle.plate].data["accounts"][data.type].count - tonumber(data.count)
            if VehCoffre[vehicle.plate].data["accounts"][data.type].count == 0 then
                VehCoffre[vehicle.plate].data["accounts"][data.type].count = 0
            end
            addMoney(xPlayer, data.type, data.count)
            exports['sunny']:sendLog(("Retrait d'argent dans un vehicule (%s - %s) Plaque (%s) (Coffre)"):format(xPlayer.name, xPlayer.UniqueID, vehicle.plate), {
                author = xPlayer.name,
                fields = {
                    {title = 'Joueur', subtitle = xPlayer.name},
                    {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                    {title = 'Identifier', subtitle = xPlayer.identifier},
                    {title = 'Argent', subtitle = ('%s %s'):format(data.count, data.type)},
                    {title = 'Plaque', subtitle = vehicle.plate},
                    {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                },
                channel = 'veh_retire_argent'
            })
            showNotification(xPlayer, (Locales[Config.Language]['trunk_remove']):format(data.count, data.label), 'success')
        else
            showNotification(xPlayer, Locales[Config.Language]['trunk_error_number'], 'error')
        end
        RefreshTrunk(source)

    end
end)
