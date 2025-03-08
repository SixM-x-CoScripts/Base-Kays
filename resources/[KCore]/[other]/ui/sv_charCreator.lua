ESX = nil
TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)


RegisterNetEvent('esx_skin:save')
AddEventHandler('esx_skin:save', function(skin)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier
    local skinData = json.encode(skin)

    MySQL.Async.execute('UPDATE users SET skin = @skin WHERE identifier = @identifier', {
        ['@skin'] = skinData,
        ['@identifier'] = identifier
    }, function(rowsChanged)
        if rowsChanged > 0 then
            -- print(('Player %s skin data saved successfully'):format(identifier))
        else
            -- print(('Failed to save skin data for player %s'):format(identifier))
        end
    end)
end)

RegisterNetEvent("ui:charCreator:finish")
AddEventHandler("ui:charCreator:finish", function(data, skin)
    local src = source
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local first_name = data.first_name
    local name = data.name
    local dob = data.dob
    local sex = data.sex
    local Taille = data.height


    MySQL.Async.execute("UPDATE users SET firstname = @firstname, lastname = @lastname, dateofbirth = @dateofbirth, sex = @sex, height = @height WHERE identifier = @identifier", {
        ['@firstname'] = first_name,
        ['@lastname'] = name,
        ['@dateofbirth'] = dob,
        ['@sex'] = sex,
        ['@identifier'] = xPlayer.identifier,
        ["@height"] = Taille
    })
    TriggerClientEvent("esx:charCreator:finish", xPlayer.source)
end)

RegisterNetEvent("SetBucket")
AddEventHandler("SetBucket", function(number)
    local _src = source
    SetPlayerRoutingBucket(_src, number)
end)

ESX.RegisterServerCallback('ZgegFramework:gazstation:removeMoney', function(source, cb, price, method)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerMoney

    if method == "bank" then
        playerMoney = xPlayer.getAccount('bank').money
    elseif method == "cash" then
        playerMoney = xPlayer.getMoney()
    end

    if playerMoney >= price then
        if method == "bank" then
            xPlayer.removeAccountMoney('bank', price)
        elseif method == "cash" then
            xPlayer.removeAccountMoney('cash', price)
        end
        cb(true)
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('MakeUP:removeMoney', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerMoney = xPlayer.getAccount('bank').money

    if playerMoney >= 50 then
        xPlayer.removeAccountMoney('bank', 50)
        cb(true)
    else
        cb(false)
    end
end)

