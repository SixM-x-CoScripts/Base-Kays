CreateThread(function()
    MySQL.Async.execute([[
        CREATE TABLE IF NOT EXISTS player_idcard (
            UID LONGTEXT NOT NULL,
            UniqueID LONGTEXT NOT NULL,
            firstname LONGTEXT NOT NULL,
            lastname LONGTEXT NOT NULL,
            dateofbirth LONGTEXT NOT NULL,
            sex LONGTEXT NOT NULL,
            height LONGTEXT NOT NULL
        );
    ]])

    ESX.RegisterServerCallback('kayscore:identity_card:getCard', function(source, cb)
        local source = source
        local player = ESX.GetPlayerFromId(source)

        if not player then return end

        MySQL.Async.fetchAll('SELECT * FROM player_idcard WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = player.identifier
        }, function(result)
            if json.encode(result) == '[]' then
                cb(true)
            else
                cb(false)
            end
        end)
    end)

    ESX.RegisterServerCallback('kayscore:identity_card:getCardInfo', function(source, cb)
        local xPlayer = ESX.GetPlayerFromId(source)
        local identifier = xPlayer.getIdentifier()
    
        MySQL.Async.fetchAll('SELECT firstname, lastname, dateofbirth, sex, height FROM users WHERE identifier = @identifier', {
            ['@identifier'] = identifier
        }, function(result)
            if result[1] then
                local identity = {
                    firstname = result[1].firstname or nil,
                    lastname = result[1].lastname or nil,
                    dateofbirth = result[1].dateofbirth or nil,
                    sex = result[1].sex or nil,
                    height = 180
                }
                cb(identity)
            else
                cb({
                    firstname = nil,
                    lastname = nil,
                    dateofbirth = nil,
                    sex = nil,
                    height = nil
                })
            end
        end)
    end)

    RegisterNetEvent('kayscore:identity_card:create', function(SaveInfo)
        local source = source
        local player = ESX.GetPlayerFromId(source)

        if not player then return end

        MySQL.Async.execute('INSERT INTO player_idcard (UID, UniqueID, firstname, lastname, dateofbirth, sex, height) VALUES (@UID, @UniqueID, @firstname, @lastname, @dateofbirth, @sex, @height)', {
            ['@UID'] = player.UniqueID,
            ['@UniqueID'] = player.identifier,
            ['@firstname'] = SaveInfo.firstname,
            ['@lastname'] = SaveInfo.lastname,
            ['@dateofbirth'] = SaveInfo.dateofbirth,
            ['@sex'] = SaveInfo.sex,
            ['@height'] = 180
        }, function()

            --local item = ESX.AddItem(('player_idcard_%s'):format(player.UniqueID), SaveInfo.firstname.. ' '.. SaveInfo.lastname, 0, 0, 0.1)

            --while not item do Wait(1) end

            player.addInventoryItem("idcard", 1)

            MySQL.Async.fetchAll('SELECT * FROM player_idcard', {}, function(result)
                for k,v in pairs(result) do
                    ESX.RegisterUsableItem(('player_idcard_%s'):format(v.UID), function(source)
                        local source = source
        
                        TriggerEvent('jsfour-idcard:openNew', source, v.UniqueID, source)
                    end)
                end
            end)
        end)
    end)

    MySQL.Async.fetchAll('SELECT * FROM player_idcard', {}, function(result)
        for k,v in pairs(result) do
            ESX.RegisterUsableItem(('player_idcard_%s'):format(v.UID), function(source)
                local source = source

                TriggerEvent('jsfour-idcard:openNew', source, v.UniqueID, source)
            end)
        end
    end)
end)