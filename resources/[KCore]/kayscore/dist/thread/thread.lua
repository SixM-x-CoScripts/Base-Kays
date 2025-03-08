CreateThread(function()

    local dostNotremovemoney = {
        ['police'] = true,
        ['ambulance'] = true,
        ['bcso'] = true,
        ['gouvernement'] = true,
    }
    local societyAllMoney = 0

    while true do
        Wait(3600000)

        for k,v in pairs(Society.List) do
            local society = Society:getSociety(v.name)
    
            if not society then return end
    
            if not dostNotremovemoney[v.name] then
                local societyGouvernement = Society:getSociety('gouvernement')
                if v.coffre['accounts'].society > 50000 then
                    societyGouvernement.addSocietyMoney(v.coffre['accounts'].society/100*society.tax)

                    local players = ESX.GetExtendedPlayers('job', v.name)
        
                    for i,p in pairs(players) do
                        TriggerClientEvent('esx:showNotification', p.source, ('💲 Votre société a été taxé de ~r~%s$~s~ par le gouvernement'):format(v.coffre['accounts'].society/100*society.tax))
                    end

                    society.removeSocietyMoney(v.coffre['accounts'].society/100*society.tax)

                else
                    local players = ESX.GetExtendedPlayers('job', 'gouvernement')
    
                    for i,p in pairs(players) do
                        TriggerClientEvent('esx:showNotification', p.source, ('La société ~y~%s~s~ n\'a pas asser de fonds pour être taxé'):format(society.label))
                    end
                end
            end
    
            if dostNotremovemoney[v.name]  then
                if v.name ~= 'gouvernement' then
                    local societyGouvernement = Society:getSociety('gouvernement')
    
                    societyGouvernement.removeSocietyMoney(society.tax)
        
                    society.addSocietyMoney(society.tax)
    
                    local players = ESX.GetExtendedPlayers('job', v.name)
        
                    for i,p in pairs(players) do
                        TriggerClientEvent('esx:showNotification', p.source, ('💲 Votre société a reçue une remise de ~g~%s$~s~ par le gouvernement'):format(society.tax))
                    end
                end
            end
        end

        MySQL.Async.fetchAll('SELECT * FROM blanchiment', {}, function(b)
            for i = 1, #b do
                if b[i].time > 0 then
                    MySQL.Async.execute('UPDATE blanchiment SET time = @time WHERE id = @id', {['@time'] = b[i].time -1, ['@id'] = b[i].id}, function()
                        b[i].time = b[i].time - 1
                        if b[i].time < 1 then
                            MySQL.Async.execute('UPDATE blanchiment SET owner = @owner WHERE id = @id', {['@owner'] = 0, ['@id'] = b[i].id}, function()
                                secured_TriggerClientEvent('kayscore:blanchiment:updateOwner', -1, b[i].id, Blanchiment.data.blanchiment[b[i].id])
                            end)
                        end
                        secured_TriggerClientEvent('kayscore:blanchiment:updateOwner', -1, b[i].id, Blanchiment.data.blanchiment[b[i].id])
                    end)
                end
            end
        end)

MySQL.Async.fetchAll('SELECT * FROM zban', {}, function(r)
    for k,v in pairs(r) do
        if v.perm == 1 or v.perm == true then goto continue end

        if banList[v.identifier] and banList[v.identifier].time and banList[v.identifier].time >= 1 then
            MySQL.Async.execute('UPDATE zban SET time = @time WHERE uniqueid = @uniqueid', {
                ['@uniqueid'] = v.uniqueid,
                ['@time'] = v.time - 1
            }, function()
                banList[v.identifier].time = v.time - 1
            end)
        elseif not banList[v.identifier] then
            print("^1ECHEC DE L'UPDATE DES BAN")
        end

        if tonumber(v.time) == nil or tonumber(v.time) <= 0 then
            if not banList[v.identifier] then
                print("^1ECHEC DE L'UPDATE DES BAN")
            else
                MySQL.Async.execute('DELETE FROM zban WHERE uniqueid = @uniqueid', {
                    ['@uniqueid'] = v.uniqueid,
                })
                banList[v.identifier] = nil
            end
        end
        

        print(('^3Bansystem^0 update du temps de l\'uniqueid ^3%s^0'):format(v.uniqueid))

        ::continue::
    end
end)

        for k,v in pairs(VIP.players) do

            if v.time > 1 then
                VIP.players[k].time -= 1

                MySQL.Async.execute('UPDATE vips SET time = @time WHERE UniqueID = @UniqueID', {
                    ['@UniqueID'] = VIP.players[k].UniqueID,
                    ['@time'] = VIP.players[k].time
                }, function()
                    
                end)
            else
                MySQL.Async.execute('DELETE FROM vips WHERE UniqueID = @UniqueID', {
                    ['@UniqueID'] = v.UniqueID
                }, function()
                    VIP.players[k] = nil
                end)
            end

            local player = ReturnPlayerId(VIP.players[k].UniqueID)

            if player then
                if VIP.players[k] then
                    VIP.data[player.UniqueID] = VIP.players[k]
                    secured_TriggerClientEvent('kayscore:vip:refreshData', player.id, VIP.data[player.UniqueID])
                else
                    VIP.data[xPlayer.UniqueID] ={
                        UniqueID = xPlayer.UniqueID,
                        have = false,
                        time = 0,
                    }
                    TriggerClientEvent('esx:showNotification', player.id, 'Information VIP\n\nVotre '..kayscoreConfigServ.GTACOLOR..'VIP~s~ vien de prendre fin')
                end
            end
        end




        local xPlayers = ESX.GetPlayers()

		for i = 1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

			if xPlayer then
				local society = Society:getSociety(xPlayer.job.name)

				if society then

                    if type(society.coffre['accounts'].society) ~= "table" then
                        if society.coffre['accounts'].society < xPlayer.job.grade_salary then
                            TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), '', 'Votre société n\"a plus d\'argent pour vous payez', 'CHAR_BANK_FLEECA', 9)
                        else
                            society.removeSocietyMoney(xPlayer.job.grade_salary)
                            xPlayer.addAccountMoney('bank', xPlayer.job.grade_salary)
    
                            TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), 'Vous avez recus votre salaire: '..xPlayer.job.grade_salary, 'CHAR_BANK_FLEECA', 9)
                        end
                    end
				else
					TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), _U('received_help', 150), 'CHAR_BANK_FLEECA', 9)
				end
			end
		end
    end
end)

function sendLog(title, data, cb)
    local dsc = {}

    for k,v in ipairs(data.fields) do
        table.insert(dsc, ('**%s:** %s %s'):format(v.title,v.subtitle,'\n'))
    end


    if data.img then
        setLogs = {
            {
                ["color"] = '751358',
    
                ['author'] = {
                    ['name'] = data.author,
                    ['icon_url'] = UTILS.LOGOURL
                },

                ["image"] = {
                    ["url"] = data.img,
                },
    
                ['title'] = title,
    
                ['description'] = table.concat(dsc),
    
                ["footer"] = {
    
                    ["text"] = os.date("%x %X %p"),
    
                },
            }
        }
    else
        setLogs = {
            {
                ["color"] = '751358',
    
                ['author'] = {
                    ['name'] = data.author,
                    ['icon_url'] = UTILS.LOGOURL
                },
    
                ['title'] = title,
    
                ['description'] = table.concat(dsc),
    
                ["footer"] = {
    
                    ["text"] = os.date("%x %X %p"),
    
                },
            }
        }
    end

    PerformHttpRequest(Config_Logs[data.channel] , function(err, text, headers) end, 'POST', json.encode({username = name, embeds = setLogs}), { ['Content-Type'] = 'application/json' })

    if cb then
        cb()
    end
end

exports('sendLog', function(title, data, cb)
    sendLog(title, data, cb)
end)

RegisterNetEvent('kayscore:deadlogs:send', function(killer)
    local source = source
    local player = ESX.GetPlayerFromId(source)
    local killerPlayer = ESX.GetPlayerFromId(killer)

    if not killerPlayer then
        killerPlayer = {
            name = "Inconnue",
            UniqueID = "Inconnue",
        }
    end

    sendLog(('Nouvelle Mort (%s - %s) Tueur (%s- %s) )'):format(killerPlayer.name, killerPlayer.UniqueID, player.name, player.UniqueID), {
        author = player.name,
        fields = {
            {title = 'Joueur', subtitle = killerPlayer.name},
            {title = 'ID Unique', subtitle = killerPlayer.UniqueID},
            {title = 'Identifier', subtitle = killerPlayer.identifier},
            {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
        },
        channel = 'dead_logs'
    })
end)

AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local source = source
    local identifiers = GetPlayerIdentifiers(source)

    local playerName = GetPlayerName(source)
    local playerIdentifier = nil;

    for k,v in pairs(identifiers) do
        if string.find(v, "license") then
            playerIdentifier = v
            break
        end
    end

    sendLog(('Nouvelle Connection (%s - %s)'):format(source, playerName), {
        author = ("Connection de %s"):format(playerName),
        fields = {
            {title = 'Joueur', subtitle = playerName},
            {title = 'ID de Connection', subtitle = source},
            {title = 'Identifier', subtitle = playerIdentifier},
            {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
        },
        channel = 'playerConnecting'
    })
end)

AddEventHandler('esx:playerDropped', function(eventSrc, xPlayer)
    sendLog(('Nouvelle Deconnection (%s - %s)'):format(xPlayer.UniqueID, xPlayer.name), {
        author = ("Deconnection de %s"):format(xPlayer.name),
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID', subtitle = eventSrc},
            {title = "ID Unique", subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = "Discord", subtitle = ESX.GetIdentifierFromId(eventSrc, "discord:")},
        },
        channel = 'playerDropped'
    })
end)

exports('sv_GetWeaponPerm', function(name)
    return kayscoreConfigServ.PermanantWeapon[name]
end)