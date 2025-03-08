CreateThread(function()

    boost_farm = {
        active = {},
        loaded = false
    }

    MySQL.Async.execute([[
        CREATE TABLE IF NOT EXISTS boost_farm (
            UniqueID INT(11) NOT NULL,
            boost LONGTEXT NOT NULL,
            time LONGTEXT NOT NULL,
            multiplication LONGTEXT NOT NULL,
            PRIMARY KEY (UniqueID)
        )
    ]])

    MySQL.Async.fetchAll('SELECT * FROM boost_farm', {}, function(result)
        for k, v in pairs(result) do
            boost_farm.active[v.UniqueID] = {
                UniqueID = v.UniqueID,
                boost = tonumber(v.boost),
                time = tonumber(v.time),
                multiplication = tonumber(v.multiplication),
            }
        end
        boost_farm.loaded = true
    end)

    function boost_farm.boostFarm(UniqueID)
        return boost_farm.active[UniqueID]
    end
    
    function boost_farm.have(UniqueID)
        if not boost_farm.active[UniqueID] then return false end
        return boost_farm.active[UniqueID].boost > 0
    end

    RegisterNetEvent('kayscore:boost:farm:paid', function(boost, boostTime, price)
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)

        if not xPlayer then return end

        local player = PlayersList:GetPlayerById(source)

        if player:getCoins() < price then
            return
        end
        
        MySQL.Async.fetchAll("SELECT kayscorecoins, totalCoins FROM users WHERE UniqueID = @UniqueID", {
            ['@UniqueID'] = xPlayer.UniqueID
        }, function(result)
            if #result == 0 then return end

            local newpoint = result[1].kayscorecoins - price
            local newTotal = result[1].totalCoins + price

            MySQL.Async.execute('UPDATE users SET kayscorecoins = @newpoint, totalcoins = @newTotal WHERE UniqueID = @UniqueID', {
                ['@newpoint'] = newpoint,
                ['@newTotal'] = newTotal,
                ['@UniqueID'] = xPlayer.UniqueID
            })

            MySQL.Async.execute('INSERT INTO boutique_history (uniqueid, data) VALUES (@uniqueid, @data)', {
                ['@uniqueid'] = xPlayer.UniqueID,
                ['@data'] = ('Vous avez acheté %s pour %s coins'):format(('Boost farm x%s de %s heure(s)'):format(boost, boostTime), price)
            })

            MySQL.Async.execute([[
                INSERT INTO boost_farm (UniqueID, boost, time, multiplication)
                VALUES (@UniqueID, @boost, @time, @multiplication)
                ON DUPLICATE KEY UPDATE boost = boost + VALUES(boost), time = time + VALUES(time), multiplication = multiplication + VALUES(multiplication)
            ]], {
                ['@UniqueID'] = xPlayer.UniqueID,
                ['@boost'] = boost,
                ['@time'] = boostTime,
                ['@multiplication'] = boost
            }, function()
                if boost_farm.active[xPlayer.UniqueID] then
                    boost_farm.active[xPlayer.UniqueID].time = boost_farm.active[xPlayer.UniqueID].time + boostTime
                    boost_farm.active[xPlayer.UniqueID].boost = boost_farm.active[xPlayer.UniqueID].boost + boost
                    boost_farm.active[xPlayer.UniqueID].multiplication = boost_farm.active[xPlayer.UniqueID].multiplication + boost
                else
                    boost_farm.active[xPlayer.UniqueID] = {
                        UniqueID = xPlayer.UniqueID,
                        boost = boost,
                        time = boostTime,
                        multiplication = boost,
                    }
                end
                TriggerClientEvent('kayscore:boutique:boost:load', source, boost_farm.active[xPlayer.UniqueID])
            end)
            sendLog(('Achat boost farm boutique (%s - %s) (%s) (%s)'):format(xPlayer.name, xPlayer.UniqueID, ('Boost farm x%s de %s heure(s)'):format(boost, boostTime), price), {
                author = xPlayer.name,
                fields = {
                    {title = 'Joueur', subtitle = xPlayer.name},
                    {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                    {title = 'Identifier', subtitle = xPlayer.identifier},
                    {title = 'Boost', subtitle = ('Boost farm x%s de %s heure(s)'):format(boost, boostTime)},
                    {title = 'Prix', subtitle = price},
                    {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                },
                channel = 'boost_farm_buy_boutique'
            })
        end)
    end)

    AddEventHandler('esx:playerLoaded', function(source)
        while not boost_farm.loaded do Wait(1) end

        local xPlayer = ESX.GetPlayerFromId(source)
    
        if not xPlayer then return end

        if not boost_farm.active[xPlayer.UniqueID] then
            boost_farm.active[xPlayer.UniqueID] = {
                UniqueID = xPlayer.UniqueID,
                boost = 0,
                time = 0,
                multiplication = 0,
            }
        end

        Wait(5000)

        TriggerClientEvent('kayscore:boutique:boost:load', source, boost_farm.active[xPlayer.UniqueID])
    end)

    RegisterNetEvent('kayscore:boutique:boost:request')
AddEventHandler('kayscore:boutique:boost:request', function()
    local source = source
    while not boost_farm.loaded do Wait(1) end

    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then return end

    if not boost_farm.active[xPlayer.UniqueID] then
        boost_farm.active[xPlayer.UniqueID] = {
            UniqueID = xPlayer.UniqueID,
            boost = 0,
            time = 0,
            multiplication = 0,
        }
    end

    TriggerClientEvent('kayscore:boutique:boost:load', source, boost_farm.active[xPlayer.UniqueID])
end)

    
    CreateThread(function()
        while true do
            Wait(3600000)

            for k, v in pairs(boost_farm.active) do
                if v.boost > 0 then
                    v.time = v.time - 1 

                    if v.time > 0 then
                        MySQL.Async.execute('UPDATE boost_farm SET time = @time, boost = @boost WHERE UniqueID = @UniqueID', {
                            ['@UniqueID'] = v.UniqueID,
                            ['@time'] = v.time,
                            ['@boost'] = v.boost
                        }, function()
                            --ESX.toConsole(('Update Boost FARM for UniqueID ^3%s^0, time left: %s hours'):format(v.UniqueID, v.time))
                            local xPlayer = ESX.GetPlayerFromIdentifier(v.UniqueID)
                            if xPlayer then
                                TriggerClientEvent('kayscore:boutique:boost:load', xPlayer.source, { UniqueID = v.UniqueID, boost = 2, time = v.time, multiplication = 2 })
                            end
                        end)
                    else
                        MySQL.Async.execute('DELETE FROM boost_farm WHERE UniqueID = @UniqueID', {
                            ['@UniqueID'] = v.UniqueID
                        }, function()
                            --ESX.toConsole(('Delete Boost FARM for UniqueID ^3%s^0'):format(v.UniqueID))
                            boost_farm.active[v.UniqueID] = nil
                            local xPlayer = ESX.GetPlayerFromIdentifier(v.UniqueID)
                            if xPlayer then
                                TriggerClientEvent('kayscore:boutique:boost:load', xPlayer.source, { UniqueID = v.UniqueID, boost = 0, time = 0, multiplication = 0 })
                            end
                        end)
                    end
                end
            end
        end
    end)
end)
