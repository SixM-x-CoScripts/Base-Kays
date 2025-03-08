---@class Blanchiment
Blanchiment = {
    admin = {

    },

    data = {
        blanchiment = {}
    }
}

function Blanchiment:Init()
    Wait(2000)

    MySQL.Async.fetchAll('SELECT * FROM blanchiment', {}, function(b)

        local bCount = 0

        for k,v in pairs(b) do
            Blanchiment.data.blanchiment[v.id] = {
                owner = v.owner,
                name = v.name,
                label = v.label,
                pos = json.decode(v.pos),
                percent = tonumber(v.percent),
                time = v.time,
            }

            bCount += 1
        end

    end)
end

CreateThread(function()
    Blanchiment:Init()
end)

function Blanchiment:refresh()
    Wait(500)
    TriggerClientEvent('kayscore:blanchiment:refresh', -1, Blanchiment.data.blanchiment)
end

secured_RegisterNetEvent('kayscore:blanchiment:init', function()
    Blanchiment:refresh()
end)

secured_RegisterNetEvent('kayscore:blanchiment:create', function(name, label, pos)
    local source = source

    MySQL.Async.execute('INSERT INTO blanchiment (owner, name, label, pos) VALUES (@owner, @name, @label, @pos)', {
        ['@owner'] = 0,
        ['@name'] = name,
        ['@label'] = label,
        ['@pos'] = json.encode(pos)
    }, function()
        Blanchiment:Init()
        Blanchiment:refresh()
    end)
end)

secured_RegisterNetEvent('kayscore:blanchiment:paid', function(time, price, percent, type, id)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    local price = tonumber(price)
    local paidType;

    if type == 1 then
        paidType =  'cash'
    else
        paidType = 'bank'
    end

    if xPlayer.getAccount(paidType).money < price then return TriggerClientEvent('esx:showNotification', source, '⛔ Vous ne possédez pas assez de sous !') end

    xPlayer.removeAccountMoney(paidType, price)

    MySQL.Async.execute('UPDATE blanchiment SET owner = @owner, percent = @percent, time = @time WHERE id = @id', {
        ['@owner'] = xPlayer.UniqueID,
        ['@id'] = id,
        ['@percent'] = percent == 1 and 0.40 or percent == 2 and 0.30 or percent == 3 and 0.20 or percent == 4 and 0.10,
        ['@time'] = time == 1 and 12 or time == 2 and 24 or time == 3 and 48
    }, function()
        Blanchiment.data.blanchiment[id].owner = xPlayer.UniqueID
        Blanchiment.data.blanchiment[id].percent = percent == 1 and 0.40 or percent == 2 and 0.30 or percent == 3 and 0.20 or percent == 4 and 0.10
        Blanchiment.data.blanchiment[id].time = time == 1 and 12 or time == 2 and 24 or time == 3 and 48

        secured_TriggerClientEvent('kayscore:blanchiment:updateOwner', -1, id, Blanchiment.data.blanchiment[id])

        TriggerClientEvent('esx:showNotification', source, ('✅ Batiment acheté pour un total de ~g~%s$~s~'):format(price))
        sendLog(('Le Joueur (%s - %s) a acheter un batiment de blanchiment pour (%s$)'):format(xPlayer.name, xPlayer.UniqueID, price), {
            author = 'Blanchiment',
            fields = {
                {title = 'Player', subtitle = xPlayer.name},
                {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                {title = 'Identifier', subtitle = xPlayer.identifier},
                {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
            },
            channel = 'achat_blanchiment'
        })
    end)
end)

secured_RegisterNetEvent('kayscore:blanchiment:washMoney', function(amount, percent, OwnerID)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getAccount('black_money').money < amount then return TriggerClientEvent('esx:showNotification', source, '⛔ Vous ne possédez pas assez d\'argent sale !') end
        if xPlayer.UniqueID ~= OwnerID then 
            TriggerClientEvent('esx:showNotification', source, '⛔ Vous n\'êtes pas le propriétaire de ce batiment (bouge de la on ta cramé) !') 
            logsACJob.SendLogsACJob('blanchi', ('%s a tenté de blanchir de l\'argent sale sans être le propriétaire du batiment \n ID: **%s**'):format(xPlayer.name, xPlayer.UniqueID))
            return
        end

    xPlayer.removeAccountMoney('black_money', amount)

    local total = 0

    local percentage = percent == 0.1 and 90 or percent == 0.2 and 80 or percent == 0.3 and 70 or percent == 0.4 and 60

    total = amount/100*percentage

    xPlayer.addAccountMoney('cash', total)

    TriggerClientEvent('esx:showNotification', source, ('💸 Vous avez blanchie ~g~%s$~s~ d\'argent sale, et reçus ~g~%s$~s~ d\'argent propre (Liquide)'):format(amount, total))
    sendLog(("Le Joueur (%s - %s) a viens de blanchir (%s$) pour recevoir (%s$) d'argent sale"):format(xPlayer.name, xPlayer.UniqueID, amount, total), {
        author = 'Blanchiment',
        fields = {
            {title = 'Player', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
        },
        channel = 'blanchi_blanchiment'
    })
end)

secured_RegisterNetEvent('kayscore:blanchiment:removeOwner', function(id)
    local source = source
    MySQL.Async.execute('UPDATE blanchiment SET owner = @owner WHERE id = @id', {['@owner'] = 0, ['@id'] = id}, function()
        Blanchiment.data.blanchiment[id].owner = 0
        secured_TriggerClientEvent('kayscore:blanchiment:updateOwner', -1, id, Blanchiment.data.blanchiment[id])
        TriggerClientEvent('esx:showNotification', source, '✅ Location rendue avec succès')
    end)
end)

secured_RegisterNetEvent('kayscore:blanchiment:delete', function(id)
    local source = source

    MySQL.Async.execute('DELETE FROM blanchiment WHERE id = @id', {['@id'] = id}, function()
        Blanchiment.data.blanchiment[id] = nil
        Blanchiment:refresh()
    end)
end)

-- CreateThread(function()
--     while true do
--         Wait(3600000)

--         MySQL.Async.fetchAll('SELECT * FROM blanchiment', {}, function(b)
--             for i = 1, #b do
--                 if b[i].time > 0 then
--                     MySQL.Async.execute('UPDATE blanchiment SET time = @time WHERE id = @id', {['@time'] = b[i].time -1, ['@id'] = b[i].id}, function()
--                         b[i].time = b[i].time - 1
--                         if b[i].time < 1 then
--                             MySQL.Async.execute('UPDATE blanchiment SET owner = @owner WHERE id = @id', {['@owner'] = 0, ['@id'] = b[i].id}, function()
--                                 TriggerClientEvent('kayscore:blanchiment:updateOwner', -1, b[i].id, Blanchiment.data.blanchiment[b[i].id])
--                             end)
--                         end
--                         TriggerClientEvent('kayscore:blanchiment:updateOwner', -1, b[i].id, Blanchiment.data.blanchiment[b[i].id])
--                     end)
--                 end
--             end
--         end)
--     end
-- end)