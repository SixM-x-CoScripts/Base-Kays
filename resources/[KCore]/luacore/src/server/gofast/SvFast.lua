
local GoFast = {}
local CanProgramming = true
-- local reward = math.random(21000, 31000)



ESX.RegisterServerCallback('checkDisponibility', function(source, cb)
    if CanProgramming then
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent('StartGoFast')
AddEventHandler('StartGoFast', function()
    if not CanProgramming then
       DropPlayer(source, 'tentative de cration de gofast cheat');
        return
    end
    GoFast[source] = {
        hasStarted = true
    }
    CanProgramming = false
    Citizen.SetTimeout(1000*60*30, function()
        CanProgramming = true
    end)
end)

secured_RegisterNetEvent("kayscore:CacaGofast") 
secured_AddEventHandler("kayscore:CacaGofast", function(reward)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    if reward > 31000 then
        DropPlayer(_src, "Tentative give Gofast")
    elseif reward < 21000 then
        DropPlayer(_src, "Tentative give Gofast")
    else
        xPlayer.addAccountMoney('black_money', reward)
        TriggerClientEvent('esx:showNotification', xPlayer.source, "Félicitation vous avez reçu : ~g~"..reward.."$" )
    end
end)

 