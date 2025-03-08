RegisterNetEvent("kayscore:pay")
AddEventHandler("kayscore:pay", function(price, playerTatoos)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xMoney = xPlayer.getAccount('cash').money

    if xMoney >= price then
        xPlayer.removeAccountMoney('cash', price)
        TriggerClientEvent("kayscore:buyCallback", _src, true)
        performDbUpdate(playerTatoos, _src)
        TriggerClientEvent('esx:showNotification', _src, "Paiement réussi, tatouage acheté.")
    else
        TriggerClientEvent("kayscore:buyCallback", _src, false)
        TriggerClientEvent('esx:showNotification', _src, "Paiement échoué, fonds insuffisants (cash).")
    end
end)

function getAllLicenseTattoo(source)
    for k,v in pairs(GetPlayerIdentifiers(source))do
    end
end

function getPlayerLicenseTattoo(source)
    getAllLicenseTattoo(source)
    for k,v in pairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("license:")) == "license:" then
            return v
        end
    end
end


RegisterNetEvent("kayscore:payClean")
AddEventHandler("kayscore:payClean", function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xMoney = xPlayer.getAccount('cash').money
    if xMoney >= 50000 then
        xPlayer.removeAccountMoney('cash', 50000)
        performDbClear(_src)

        TriggerClientEvent("kayscore:clean", _src, 1)
        TriggerClientEvent('esx:showNotification', _src, "Paiement réussi, vous avez payé 50000$ depuis votre compte bancaire.")
    else
        TriggerClientEvent("kayscore:clean", _src, 0)
        TriggerClientEvent('esx:showNotification', _src, "Paiement échoué, fonds insuffisants.")
    end
end)

RegisterNetEvent("kayscore:requestPlayerTatoos")
AddEventHandler("kayscore:requestPlayerTatoos", function()
    local _src = source
    local license = getPlayerLicenseTattoo(_src)
    local result = nil
    MySQL.Async.fetchAll("SELECT * FROM `playerstattoos` WHERE identifier = @identifier", {['@identifier'] = license}, function(rslt)
        if rslt[1] ~= nil then
            result = rslt[1].tattoos
        else
            result = nil
        end
    end)
    Citizen.Wait(150)
    TriggerClientEvent("kayscore:tatoesCallback", _src, result)

end)

function performDbUpdate(playerTatoos,_src)
    local license = getPlayerLicenseTattoo(_src)
    local tattoos = json.encode(playerTatoos)
    MySQL.Async.fetchAll("SELECT * FROM `playerstattoos` WHERE identifier = @identifier", {['@identifier'] = license}, function(rslt)
        if rslt[1] ~= nil then
            MySQL.Async.execute("UPDATE `playerstattoos` SET tattoos = @tat WHERE identifier = @identifier",
            {['@identifier'] = license,['@tat'] = tattoos},
            function(insertId)
            end
        )
        else
            MySQL.Async.insert("INSERT INTO `playerstattoos` (`identifier`, `tattoos`) VALUES (@license, @tat)",
                {['@license'] = license,['@tat'] = tattoos},
                function(insertId)
                end
            )
        end
    end)
end

function performDbClear(_src)
    local license = getPlayerLicenseTattoo(_src)
    MySQL.Async.fetchAll("SELECT * FROM `playerstattoos` WHERE identifier = @identifier", {['@identifier'] = license}, function(rslt)
        if rslt[1] ~= nil then
            MySQL.Async.execute("DELETE FROM `playerstattoos` WHERE identifier = @identifier",
            {['@identifier'] = license},
            function(insertId)
                
            end
        )
        end
    end)
end