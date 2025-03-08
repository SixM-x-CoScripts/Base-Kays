CreateThread(function()

    fishing = {
        players = {}
    }

    MySQL.Async.execute([[
        CREATE TABLE IF NOT EXISTS `player_fishing` (
            UniqueID INT(11) DEFAULT NULL,
            level LONGTEXT DEFAULT 0,
            fishList LONGTEXT DEFAULT NULL,
            permit LONGTEXT DEFAULT NULL
        );
    ]])

    for k,v in pairs(kayscoreConfigServ.Fishing.fishList.FishList) do
        for i,p in pairs(kayscoreConfigServ.Fishing.fishList.FishList[k]) do
            MySQL.Async.fetchAll('SELECT * FROM items WHERE name = @name', {
                ['@name'] = p.name
            }, function(result)
                if json.encode(result) == '[]' then
                    MySQL.Async.execute('INSERT INTO items (name, label, rare, can_remove, weight) VALUES (@name, @label, @rare, @can_remove, @weight)', {
                        ['@name'] = p.name,
                        ['@label'] = p.label,
                        ['@rare'] = 0,
                        ['@can_remove'] = 0,
                        ['@weight'] = 0,
                    })
                end
            end)
        end
    end

    for k,v in pairs(kayscoreConfigServ.Fishing.fishList.FishingRod) do
        MySQL.Async.fetchAll('SELECT * FROM items WHERE name = @name', {
            ['@name'] = v.name
        }, function(result)
            if json.encode(result) == '[]' then
                MySQL.Async.execute('INSERT INTO items (name, label, rare, can_remove, weight) VALUES (@name, @label, @rare, @can_remove, @weight)', {
                    ['@name'] = v.name,
                    ['@label'] = v.label,
                    ['@rare'] = 0,
                    ['@can_remove'] = 0,
                    ['@weight'] = 0,
                })
            end
        end)
    end

    for k,v in pairs(kayscoreConfigServ.Fishing.fishList.FishingLures) do
        MySQL.Async.fetchAll('SELECT * FROM items WHERE name = @name', {
            ['@name'] = v.name
        }, function(result)
            if json.encode(result) == '[]' then
                MySQL.Async.execute('INSERT INTO items (name, label, rare, can_remove, weight) VALUES (@name, @label, @rare, @can_remove, @weight)', {
                    ['@name'] = v.name,
                    ['@label'] = v.label,
                    ['@rare'] = 0,
                    ['@can_remove'] = 0,
                    ['@weight'] = 0,
                })
            end
        end)
    end

    Wait(3000)

    MySQL.Async.fetchAll('SELECT * FROM player_fishing', {}, function(result)

        local count = 0

        for k,v in pairs(result) do
            count += 1

            fishing.players[v.UniqueID] = {
                UniqueID = v.UniqueID,
                level = v.level,
                fishList = json.decode(v.fishList),
                permit = json.decode(v.permit),
            }
        end

    end)



    secured_RegisterNetEvent('kayscoreServ:fishing:rod:paid', function(name, price)
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)

        if not xPlayer then return end

        if xPlayer.getAccount('bank').money < price then
            return(
                TriggerClientEvent('esx:showNotification', source, 'Vous ne possezdez pas assez de sous sur votre compte en banque')
            )
        end
        if not xPlayer.canCarryItem(name, 1) then TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez de place dans votre inventaire") return end
        xPlayer.removeAccountMoney('bank', price)
        xPlayer.addInventoryItem(name, 1)

        TriggerClientEvent('esx:showNotification', source, 'Canne à pêche payée avec succès')

    end)

    ESX.RegisterServerCallback('kayscoreServ:fishing:getInformations', function(source, cb)
        local source = source

        local xPlayer = ESX.GetPlayerFromId(source)

        if not xPlayer then return end

        if not fishing.players[xPlayer.UniqueID] then
            fishing.players[xPlayer.UniqueID] = {
                UniqueID = xPlayer.UniqueID,
                level = 0,
                fishList = {},
                permit = {},
            }

            MySQL.Async.execute('INSERT INTO player_fishing (UniqueID, level, fishList, permit) VALUES (?, ?, ?, ?)', {
                xPlayer.UniqueID,
                0,
                json.encode({}),
                false
            }, function()
            end)
        else
            fishing.players[xPlayer.UniqueID] = fishing.players[xPlayer.UniqueID]
        end

        cb(fishing.players[xPlayer.UniqueID])
    end)

    secured_RegisterNetEvent('kayscoreServ:fishing:permit:paid', function(type, price, type)
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)

        if not xPlayer then return end

        xPlayer.removeAccountMoney('bank', price)

        TriggerClientEvent('esx:showNotification', source, 'Permit de pêche payé avec succès')

        if not fishing.players[xPlayer.UniqueID] then
            fishing.players[xPlayer.UniqueID] = {}
        end

        fishing.players[xPlayer.UniqueID].permit[type] = true

        MySQL.Async.execute('UPDATE player_fishing SET permit = @permit WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = xPlayer.UniqueID,
            ['permit'] = json.encode(fishing.players[xPlayer.UniqueID].permit)
        }, function()

            SetPlayerRoutingBucket(source, xPlayer.UniqueID)

            TriggerClientEvent('kayscoreServ:fishing:permit:startInstruction', source, type)

            if xPlayer.identifier then 
                MySQL.Async.execute('INSERT INTO user_licenses (owner, type) VALUES (@owner, @type)', {
                    ['@owner'] = xPlayer.identifier,
                    ['@type'] = type
                }, function()
                    if xPlayer.name then
                        print(('The player %s (%s) has paid the permit for the activity (Fishing)'):format(xPlayer.name, xPlayer.UniqueID))
                    end
                end)
            end
        end)
    end)

    secured_RegisterNetEvent('kayscoreServ:fishing:permit:finish', function()
        local source = source

        SetPlayerRoutingBucket(source, 0)
    end)

    -- RegisterCommand('removeFishingAccount', function()
    --     MySQL.Async.execute('DELETE FROM player_fishing WHERE UniqueID =  @UniqueID', {
    --         ['@UniqueID'] = 2
    --     })
    -- end)

    CreateThread(function()
        for k,v in pairs(kayscoreConfigServ.Fishing.fishList.FishingRod) do
            ESX.RegisterUsableItem(v.name, function(source)
                local source = source
                local xPlayer = ESX.GetPlayerFromId(source)

                if not xPlayer then return end

                if xPlayer.getInventoryItem(v.name).extra then
                    TriggerClientEvent('kayscoreServ:fishing:zone:start', source, v.name, xPlayer.getInventoryItem(v.name).extra.fish)
                else
                    TriggerClientEvent('kayscoreServ:fishing:zone:start', source, v.name, 0)
                end
            end)
        end
    end)

    secured_RegisterNetEvent('kayscoreServ:fishing:shop:lures:paid', function(price, name, label)
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)

        if not xPlayer then return end

        if xPlayer.getAccount('bank').money < price then
            return(
                TriggerClientEvent('esx:showNotification', source, 'Vous ne possedez pas assez d\'argent sur votre compte en banque')
            )
        end
        if not xPlayer.canCarryItem(name, 1) then TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez de place dans votre inventaire") return end
        xPlayer.removeAccountMoney('bank', price)

        xPlayer.addInventoryItem(name, 1)
    end)
end)