VIP = {
    players = {},
    data = {}
}

function VIP.haveVip(UniqueID)
    if VIP.data[UniqueID] then
        return VIP.data[UniqueID].have
    else
        return false
    end
end

exports('haveVip', function(UniqueID)
    return VIP.haveVip(UniqueID)
end)


Citizen.CreateThread(function()
    MySQL.Async.fetchAll('SELECT * FROM vips', {}, function(result)
        for k,v in pairs(result) do
            VIP.players[v.UniqueID] = {
                UniqueID = v.UniqueID,
                have = true,
                time = v.time,
                money = v.money
            }
        end

        -- while true do
        --     Wait(3600000)
        --     for k,v in pairs(VIP.players) do

        --         if v.time > 1 then
        --             VIP.players[k].time -= 1

        --             MySQL.Async.execute('UPDATE vips SET time = @time WHERE UniqueID = @UniqueID', {
        --                 ['@UniqueID'] = VIP.players[k].UniqueID,
        --                 ['@time'] = VIP.players[k].time
        --             }, function()
                        
        --             end)
        --         else
        --             MySQL.Async.execute('DELETE FROM vips WHERE UniqueID = @UniqueID', {
        --                 ['@UniqueID'] = v.UniqueID
        --             }, function()
        --                 VIP.players[k] = nil
        --             end)
        --         end

        --         local player = ReturnPlayerId(VIP.players[k].UniqueID)

        --         if player then
        --             if VIP.players[k] then
        --                 VIP.data[player.UniqueID] = VIP.players[k]
        --                 TriggerClientEvent('kayscore:vip:refreshData', player.id, VIP.data[player.UniqueID])
        --             else
        --                 VIP.data[xPlayer.UniqueID] ={
        --                     UniqueID = xPlayer.UniqueID,
        --                     have = false,
        --                     time = 0,
        --                 }
        --                 TriggerClientEvent('esx:showNotification', player.id, 'Information VIP\n\nVotre ~p~VIP~s~ vien de prendre fin')
        --             end
        --         end
        --     end
        -- end
    end)

    CreateThread(function()
        while true do
            Wait(1800000)

            for k,v in pairs(VIP.players) do
                local player = {}
                player[k] = ReturnPlayerId(v.UniqueID)

                if player[k] then
                    local xPlayer = ESX.GetPlayerFromId(player[k].id)

                    if xPlayer then
                        xPlayer.addAccountMoney('bank', 1500)

                        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Information VIP\n\nVous avez reçus ~p~1 500$~s~ sur votre compte en banque')
                    end
                end
            end
        end
    end)
end)

AddEventHandler('esx:playerLoaded', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    if not VIP.players[xPlayer.UniqueID] then
        VIP.data[xPlayer.UniqueID] = {
            UniqueID = xPlayer.UniqueID,
            have = false,
            time = 0,
            money = false,
        }
    else
        VIP.data[xPlayer.UniqueID] = VIP.players[xPlayer.UniqueID]
        secured_TriggerClientEvent('kayscore:vip:refreshData', source, VIP.data[xPlayer.UniqueID])
    end
end)

secured_AddEventHandler('kayscore:admin:restart', function()
    local source = source

    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if not VIP.players[xPlayer.UniqueID] then
        VIP.data[xPlayer.UniqueID] = {
            UniqueID = xPlayer.UniqueID,
            have = false,
            time = 0,
            money = false,
        }
    else
        VIP.data[xPlayer.UniqueID] = VIP.players[xPlayer.UniqueID]
        secured_TriggerClientEvent('kayscore:vip:refreshData', source, VIP.data[xPlayer.UniqueID])
    end
end)

RegisterNetEvent('kayscore:vip:recieveMoney')
AddEventHandler('kayscore:vip:recieveMoney', function()
    local src = source  
    if not src then
        --print("Erreur : Source est nil.")
        return
    end

    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer then
        local uniqueID = xPlayer.UniqueID  
        if exports['kayscore']:haveVip(uniqueID) then
            MySQL.Async.fetchScalar('SELECT money FROM vips WHERE UniqueID = @UniqueID', {
                ['@UniqueID'] = uniqueID
            }, function(currentMoney)
                if currentMoney == 1 then
                    TriggerClientEvent('esx:showNotification', src, 'Vous avez déjà récupéré votre argent VIP.')
                else
                    MySQL.Async.execute('UPDATE vips SET money = @money WHERE UniqueID = @UniqueID', {
                        ['@UniqueID'] = uniqueID,
                        ['@money'] = 1
                    }, function()
                        VIP.players[uniqueID].money = 1
                        VIP.data[uniqueID] = VIP.players[uniqueID]
                        TriggerClientEvent('kayscore:vip:refreshData', src, VIP.data[uniqueID])
                        xPlayer.addAccountMoney('cash', 100000)
                        TriggerClientEvent('esx:showNotification', src, 'Vous venez de récupérer ~g~100.000$')
                    end)
                end
            end)
        else
            TriggerClientEvent('esx:showNotification', src, "Vous n'avez pas le VIP")
        end
    else
        --print("Joueur non trouvé pour l'ID source: " .. tostring(src))
    end
end)


RegisterCommand('addVip', function(source, args)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if source ~= 0 then
        if not Config.Staff.HavePermission('VIP', 'ADD', xPlayer) then return end
    end

    args[1] = tonumber(args[1])
    args[2] = tonumber(args[2])

    if args[1] == nil then return end
    if args[2] == nil then return end

    if not VIP.players[args[1]] then 
        VIP.players[args[1]] = {
            UniqueID = args[1],
            have = true,
            time = args[2]
        }

        MySQL.Async.execute('INSERT INTO vips (UniqueID, time, money) VALUES (@UniqueID, @time, @money)', {
            ['@UniqueID'] = args[1],
            ['@time'] = args[2],
            ['@money'] = false
        }, function()
            sendLog(('Ajout VIP (ID - %s) (%s heures)'):format(args[1], args[2]), {
                author = xPlayer.name,
                fields = {
                    {title = 'ID Unique', subtitle = args[1]},
                    {title = 'Temps VIP', subtitle = args[2]},
                },
                channel = 'vip_management'
            })
        end)

        local player = ReturnPlayerId(args[1])

        if player then
            VIP.data[player.UniqueID] = VIP.players[args[1]]
            secured_TriggerClientEvent('kayscore:vip:refreshData', player.id, VIP.data[player.UniqueID])
        end
    else
        if source ~= 0 then
            return TriggerClientEvent('esx:showNotification', source, 'Le joueur possède déjà le '..kayscoreConfigServ.GTACOLOR..'VIP~s~')
        else
            return print('Le joueur possède déjà le VIP')
        end
    end
end)


secured_RegisterNetEvent('kayscore:vip:buy')
secured_AddEventHandler('kayscore:vip:buy', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    local vipCost = 1250
    local vipDuration = 720 

    local player = PlayersList:GetPlayerById(source)

    if player:getCoins() < vipCost then
        TriggerClientEvent('esx:showNotification', source, "~r~Vous ne possédez pas les points requis~s~")
        return
    end

    if not VIP.players[xPlayer.UniqueID] then
        VIP.players[xPlayer.UniqueID] = {
            UniqueID = xPlayer.UniqueID,
            have = true,
            time = vipDuration 
        }

        MySQL.Async.execute('INSERT INTO vips (UniqueID, time, money) VALUES (@UniqueID, @time, @money)', {
            ['@UniqueID'] = xPlayer.UniqueID,
            ['@time'] = vipDuration,
            ['@money'] = false
        }, function()
            local player = ReturnPlayerId(xPlayer.UniqueID)
            if player then
                VIP.data[player.UniqueID] = VIP.players[xPlayer.UniqueID]
                secured_TriggerClientEvent('kayscore:vip:refreshData', player.id, VIP.data[player.UniqueID])
            end
        end)

        player:removeCoins(vipCost)
        player:addUsedCoins(vipCost)

        MySQL.Async.execute('INSERT INTO boutique_history (uniqueid, data) VALUE (@uniqueid, @data)', {
            ['@uniqueid'] = xPlayer.UniqueID,
            ['@data'] = ('Vous avez acheté VIP 1 mois pour %s coins'):format(vipCost)
        }, function()
            secured_TriggerClientEvent('boutique:update', xPlayer.source, player:getCoins(), player:getUsedCoins(), player:getRecompense())
            TriggerClientEvent('esx:showNotification', source, 'Vous avez acheté ~g~VIP 1 mois~s~ pour ' .. vipCost .. ' coins.')
        end)

    else
        TriggerClientEvent('esx:showNotification', source, 'Vous possédez déjà le ~g~VIP~s~.')
    end
end)

secured_RegisterNetEvent('kayscore:vip:renew')
secured_AddEventHandler('kayscore:vip:renew', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    local vipCost = 1250
    local vipDuration = 720 

    local player = PlayersList:GetPlayerById(source)

    if player:getCoins() < vipCost then
        TriggerClientEvent('esx:showNotification', source, "~r~Vous ne possédez pas les points requis~s~")
        return
    end

    MySQL.Async.fetchAll('SELECT * FROM vips WHERE UniqueID = @UniqueID', {
        ['@UniqueID'] = xPlayer.UniqueID
    }, function(result)
        if #result > 0 then
            local newTime = result[1].time + vipDuration
            MySQL.Async.execute('UPDATE vips SET time = @time WHERE UniqueID = @UniqueID', {
                ['@UniqueID'] = xPlayer.UniqueID,
                ['@time'] = newTime
            }, function()
                if VIP.players[xPlayer.UniqueID] then
                    VIP.players[xPlayer.UniqueID].time = newTime
                else
                    VIP.players[xPlayer.UniqueID] = {
                        UniqueID = xPlayer.UniqueID,
                        have = true,
                        time = newTime
                    }
                end

                VIP.data[xPlayer.UniqueID] = VIP.players[xPlayer.UniqueID]
                secured_TriggerClientEvent('kayscore:vip:refreshData', source, VIP.data[xPlayer.UniqueID])

                player:removeCoins(vipCost)
                player:addUsedCoins(vipCost)

                MySQL.Async.execute('INSERT INTO boutique_history (uniqueid, data) VALUE (@uniqueid, @data)', {
                    ['@uniqueid'] = xPlayer.UniqueID,
                    ['@data'] = ('Vous avez renouvelé VIP pour 1 mois pour %s coins'):format(vipCost)
                }, function()
                    secured_TriggerClientEvent('boutique:update', xPlayer.source, player:getCoins(), player:getUsedCoins(), player:getRecompense())
                    TriggerClientEvent('esx:showNotification', source, 'Vous avez renouvelé ~g~VIP 1 mois~s~ pour ' .. vipCost .. ' coins.')
                end)
            end)
        else
            TriggerClientEvent('esx:showNotification', source, 'Vous ne possédez pas encore le ~g~VIP~s~. Achetez-le d\'abord.')
        end
    end)
end)


RegisterCommand('removeVIP', function(source, args)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if source ~= 0 then
        if not Config.Staff.HavePermission('VIP', 'REMOVE', xPlayer) then return end
    end

    args[1] = tonumber(args[1])

    if args[1] == nil then return end

    if not VIP.players[args[1]] then return end

    VIP.players[args[1]] = nil

    MySQL.Async.execute('DELETE FROM vips WHERE UniqueID = @UniqueID', {
        ['@UniqueID'] = args[1]
    }, function()
        local player = ReturnPlayerId(args[1])

        if player then
            VIP.data[player.UniqueID] = {
                UniqueID = args[1],
                have = false,
                time = 0
            }

            secured_TriggerClientEvent('kayscore:vip:refreshData', player.id, VIP.data[player.UniqueID])

            TriggerClientEvent('esx:showNotification', player.id, 'Information VIP\n\nVotre '..kayscoreConfigServ.GTACOLOR..'VIP~s~ vient de prendre fin')

            sendLog(('Suppression VIP (%s)'):format(args[1]), {
                author = xPlayer.name,
                fields = {
                    {title = 'ID Unique', subtitle = args[1]},
                    {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                },
                channel = 'vip_management'
            })
        end
    end)
end)

RegisterCommand('addVipTime', function(source, args)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if source ~= 0 then
        if not Config.Staff.HavePermission('VIP', 'ADD', xPlayer) then return end
    end

    args[1] = tonumber(args[1])
    args[2] = tonumber(args[2])

    if args[1] == nil then return end
    if args[2] == nil then return end

    if not VIP.players[args[1]] then return end

    MySQL.Async.execute('UPDATE vips SET time = @time WHERE UniqueID = @UniqueID', {
        ['@UniqueID'] = args[1],
        ['@time'] = VIP.players[args[1]].time + args[2]
    }, function()
        VIP.players[args[1]].time += args[2]

        local player = ReturnPlayerId(args[1])

        if player then
            secured_TriggerClientEvent('kayscore:vip:refreshData', player.id, VIP.data[player.UniqueID])
        end
    end)
end)

secured_RegisterNetEvent('kayscore:vip:animals:setName', function(entityID, name)
    secured_TriggerClientEvent('kayscore:animals:setName', -1, entityID, name)
end)

secured_RegisterNetEvent('kayscore:vip:animals:editName', function(entityID, newName)
    secured_TriggerClientEvent('kayscore:vip:animals:editName', -1, entityID, newName)
end)

secured_RegisterNetEvent('kayscore:vip:animals:removeName', function(entityID)
    secured_TriggerClientEvent('kayscore:vip:animals:removeName', -1, entityID)
end)

secured_RegisterNetEvent('kayscore:entits:setCoords', function(ped, coords)
    secured_TriggerClientEvent('kayscore:en:sertcoords', -1, ped, coords)
end)

secured_RegisterNetEvent('kayscore:ips:animals:createPed', function(coords, entityName)
    local source = source

    secured_TriggerClientEvent('kayscore:vip:animals:sort', source, coords, entityName)
end)