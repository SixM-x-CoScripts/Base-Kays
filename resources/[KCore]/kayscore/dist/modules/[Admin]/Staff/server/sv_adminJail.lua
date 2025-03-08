CreateThread(function()
    MySQL.Async.execute([[
        CREATE TABLE IF NOT EXISTS `player_jails` (
            UniqueID INT(11) PRIMARY KEY,
            time LONGTEXT DEFAULT NULL,
            staff LONGTEXT DEFAULT NULL,
            reason LONGTEXT DEFAULT NULL
        );
    ]])

    MySQL.Async.fetchAll('SELECT * FROM player_jails', {}, function(result)
        for k,v in pairs(result) do
            adminManagement.jails[v.UniqueID] = v

            --ESX.toConsole('Load du jail '..v.UniqueID)
        end
    end)

    AddEventHandler('esx:playerLoaded', function(source, player)
        local source = source

        local xPlayer = ESX.GetPlayerFromId(source)

        if not xPlayer then return end

        local test = false

        for k,v in pairs(adminManagement.jails) do
            if v.UniqueID == xPlayer.UniqueID or tonumber(v.UniqueID) == tonumber(xPlayer.UniqueID) or tostring(v.UniqueID) == tostring(xPlayer.UniqueID) then
                secured_TriggerClientEvent('kayscore:admin:jail:setPlayerInJail', source, xPlayer.UniqueID, adminManagement.jails[xPlayer.UniqueID])

                test = true
            end
        end

        if not test then
            if adminManagement.jails[xPlayer.UniqueID] then
                secured_TriggerClientEvent('kayscore:admin:jail:setPlayerInJail', source, xPlayer.UniqueID, adminManagement.jails[xPlayer.UniqueID])
            end
        end
    end)

  

    secured_RegisterNetEvent('kayscore:admin:jail:remove', function(UniqueID, data)
        local source = source
        adminManagement.jails[tonumber(UniqueID)] = nil

        secured_TriggerClientEvent('kayscore:admin:jail:remove', source, UniqueID)

        MySQL.Async.execute('DELETE FROM player_jails WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = UniqueID
        }, function()

        end)
    end)

    
    RegisterCommand('jail', function(source, args)
        if source ~= 0 then
            local xPlayer = ESX.GetPlayerFromId(source)

            if not xPlayer then return end
    
            if not Config.Staff.HavePermission('COMMANDS', 'JAIL', xPlayer) then return end

            if not adminManagement.Service[xPlayer.UniqueID] then return end
        end

        if args[1] == nil then return end
        if args[2] == nil then return end
        if args[3] == nil then return end

        if adminManagement.jails[args[1]] then return(
            TriggerClientEvent('esx:showNotification', source, 'Le joueur est déjà en jail')
        ) end

        local player = ReturnPlayerId(args[1])

        if source ~= 0 then
            adminManagement.jails[tonumber(args[1])] = {
                UniqueID = args[1],
                time = args[2],
                staff = GetPlayerName(source),
                reason = table.concat(args, " ", 3)
            }
        else
            adminManagement.jails[tonumber(args[1])] = {
                UniqueID = args[1],
                time = args[2],
                staff = 'CONSOLE',
                reason = table.concat(args, " ", 3)
            }
        end

        if source == 0 then
            name = 'Console'
        else
            name = GetPlayerName(source)
        end

        MySQL.Async.execute('DELETE FROM player_jails WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = UniqueID
        }, function()
            if not player then
                MySQL.Async.execute('INSERT INTO player_jails (UniqueID, time, staff, reason) VALUES (?,?,?,?)', {
                    args[1],
                    args[2],
                    name,
                    table.concat(args, " ", 3)
                })
            else
                MySQL.Async.execute('INSERT INTO player_jails (UniqueID, time, staff, reason) VALUES (?,?,?,?)', {
                    player.UniqueID,
                    args[2],
                    name,
                    table.concat(args, " ", 3)
                }, function()
                    secured_TriggerClientEvent('kayscore:admin:jail:setPlayerInJail', player.id, player.UniqueID, adminManagement.jails[tonumber(args[1])])
                end)
            end
        end)

        if source ~= 0 then
            TriggerClientEvent('esx:showNotification', source, 'Joueur mit en jail avec succès')

            if source ~= 0 then
                local xPlayer = ESX.GetPlayerFromId(source)
                sendLog(('Le staff (%s - %s) a mit en jail (%s- %s) pendant (%s minutes)'):format(xPlayer.name, xPlayer.UniqueID, player.name, player.UniqueID, args[2]), {
                    author = 'Jail',
                    fields = {
                        {title = 'Staff', subtitle = xPlayer.name},
                        {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                        {title = 'Identifier', subtitle = xPlayer.identifier},
                        {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                    },
                    channel = 'jail'
                })
            end
        end
    end)

    RegisterCommand('unjail', function(source, args)
        local source = source
        if source ~= 0 then
            local xPlayer = ESX.GetPlayerFromId(source)

            if not xPlayer then return end
    
            if not Config.Staff.HavePermission('COMMANDS', 'JAIL', xPlayer) then return end

            if not adminManagement.Service[xPlayer.UniqueID] then return end
        end

        if args[1] == nil then return end

        argsssss = tonumber(args[1])

        if not adminManagement.jails[argsssss] then return end

        local player = ReturnPlayerId(argsssss)

        if player then
            secured_TriggerClientEvent('kayscore:admin:jail:remove', player.id, argsssss)
        end

        adminManagement.jails[argsssss] = nil

        MySQL.Async.execute('DELETE FROM player_jails WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = args[1]
        }, function()
            if source ~= 0 then
                local xPlayer = ESX.GetPlayerFromId(source)
                sendLog(('Le staff (%s - %s) a unjail (%s- %s)'):format(xPlayer.name, xPlayer.UniqueID, player.name, player.UniqueID), {
                    author = 'Jail',
                    fields = {
                        {title = 'Staff', subtitle = xPlayer.name},
                        {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                        {title = 'Identifier', subtitle = xPlayer.identifier},
                        {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                    },
                    channel = 'jail'
                })
            end
        end)
    end)
end)