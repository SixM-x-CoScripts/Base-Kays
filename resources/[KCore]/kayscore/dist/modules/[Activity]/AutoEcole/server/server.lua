

-----------------------------------------------> Event acheter code <-----------------------------------------------

secured_RegisterNetEvent("rx:BuyLicense")
secured_AddEventHandler("rx:BuyLicense", function(price)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= price then
        xPlayer.removeAccountMoney('cash', price)
        TriggerClientEvent('esx:showNotification', source, ("[~g~Succès~s~] Vous avez payé ~g~%s$~s~ pour passer le code."):format(price))
        TriggerClientEvent('rx:startExamen', source)
    else
        TriggerClientEvent('esx:showNotification', source, ("[~r~Erreur~s~] Vous n'avez pas assez d'argent il vous manque ~r~%s$~s~."):format(price - xPlayer.getMoney()))
    end
end)

secured_RegisterNetEvent("rx:BuyPermis")
secured_AddEventHandler("rx:BuyPermis", function(price, type)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= price then
        xPlayer.removeAccountMoney('cash', price)
        TriggerClientEvent('esx:showNotification', source, ("[~g~Succès~s~] Vous avez payé ~g~%s$~s~ pour faire l'examen de conduite."):format(price))
        TriggerClientEvent('rx:startPermis', source, type)
    else
        TriggerClientEvent('esx:showNotification', source, ("[~r~Erreur~s~] Vous n'avez pas assez d'argent il vous manque ~r~%s$~s~."):format(price - xPlayer.getMoney()))
    end
end)

-----------------------------------------------> Event License <-----------------------------------------------

secured_RegisterNetEvent("rx:addLicense")
secured_AddEventHandler("rx:addLicense", function(type)
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.execute("INSERT INTO user_licenses (type, owner) VALUES (@type, @owner)", {
        ['@type'] = type,
        ['@owner'] = xPlayer.identifier
    })
end)

ESX.RegisterServerCallback('rx:checkLicense', function(source, cb, target, type)
    CheckLicense(target, type, cb)
end)

function CheckLicense(target, type, cb)
    local identifier = ESX.GetPlayerFromId(target).identifier
    
    MySQL.Async.fetchAll('SELECT COUNT(*) as count FROM user_licenses WHERE type = @type AND owner = @owner', {
        ['@type']  = type,
        ['@owner'] = identifier
    }, function(result)
        if tonumber(result[1].count) > 0 then
            cb(true)
        else
            cb(false)
        end

    end)
end
