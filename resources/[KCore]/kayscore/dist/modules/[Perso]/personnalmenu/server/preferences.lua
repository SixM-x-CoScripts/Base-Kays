CreateThread(function()
    MySQL.Async.execute([[
        CREATE TABLE IF NOT EXISTS `perso_preferences` (
            UniqueID INT(11) DEFAULT NULL,
            data LONGTEXT DEFAULT NULL
        );
    ]])
    
    local playersPreferences = {}

    MySQL.Async.fetchAll('SELECT * FROM perso_preferences', {}, function(result)
        for k,v in pairs(result) do
            playersPreferences[v.UniqueID] = {}

            for i,p in pairs(json.decode(v.data)) do
               -- print(p)
                playersPreferences[v.UniqueID][p.name] = p
            end
        end
    end)

    AddEventHandler('esx:playerLoaded', function(source, player)
        local source = source
        local player = ESX.GetPlayerFromId(source)

        if not player then return end

        if not playersPreferences[player.UniqueID] then
            playersPreferences[player.UniqueID] = {}

            MySQL.Async.execute('INSERT INTO perso_preferences (UniqueID, data) VALUES (@UniqueID, @data)', {
                ['@UniqueID'] = player.UniqueID,
                ['@data'] = json.encode(playersPreferences[player.UniqueID])
            })
        end

        TriggerClientEvent('kayscore:preferences:recieve', source, playersPreferences[player.UniqueID])
    end)



    RegisterNetEvent('kayscore:preferences:add', function(preferName)
        local source = source
        local player = ESX.GetPlayerFromId(source)

        if not player then return end

        if not playersPreferences[player.UniqueID] then
            playersPreferences[player.UniqueID] = {}

            MySQL.Async.execute('INSERT INTO perso_preferences (UniqueID, data) VALUES (@UniqueID, @data)', {
                ['@UniqueID'] = player.UniqueID,
                ['@data'] = json.encode(playersPreferences[player.UniqueID])
            })
        end

        if not playersPreferences[player.UniqueID][preferName] then
            playersPreferences[player.UniqueID][preferName] = {
                name = preferName,
                active = false,
            }
        end

        for k,v in pairs(playersPreferences[player.UniqueID]) do
            if v.name == preferName then
                playersPreferences[player.UniqueID][k].active = true
            end
        end

        MySQL.Async.execute('UPDATE perso_preferences SET data = @data WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = player.UniqueID,
            ['@data'] = json.encode(playersPreferences[player.UniqueID])
        })

        TriggerClientEvent('kayscore:preferences:recieve', source, playersPreferences[player.UniqueID])
    end)

    RegisterNetEvent('kayscore:preferences:remove', function(preferName)
        local source = source
        local player = ESX.GetPlayerFromId(source)

        if not playersPreferences[player.UniqueID] then
            playersPreferences[player.UniqueID] = {}

            MySQL.Async.execute('INSERT INTO perso_preferences (UniqueID, data) VALUES (@UniqueID, @data)', {
                ['@UniqueID'] = player.UniqueID,
                ['@data'] = json.encode(playersPreferences[player.UniqueID])
            })
        end

        if not player then return end

        if not playersPreferences[player.UniqueID] then
            playersPreferences[player.UniqueID] = {}

            MySQL.Async.execute('INSERT INTO perso_preferences (UniqueID, data) VALUES (@UniqueID, @data)', {
                ['@UniqueID'] = player.UniqueID,
                ['@data'] = json.encode(playersPreferences[player.UniqueID])
            })
        end

        if not playersPreferences[player.UniqueID][preferName] then
            playersPreferences[player.UniqueID][preferName] = {
                name = preferName,
                active = false,
            }
        end

        for k,v in pairs(playersPreferences[player.UniqueID]) do
            if v.name == preferName then
                playersPreferences[player.UniqueID][k].active = false
            end
        end


        MySQL.Async.execute('UPDATE perso_preferences SET data = @data WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = player.UniqueID,
            ['@data'] = json.encode(playersPreferences[player.UniqueID])
        })

        TriggerClientEvent('kayscore:preferences:recieve', source, playersPreferences[player.UniqueID])
    end)
end)