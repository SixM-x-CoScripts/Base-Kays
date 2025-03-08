

RegisterServerEvent("kayscore:gouv:annonce")
AddEventHandler("kayscore:gouv:annonce", function(input)
    local xPlayers = ESX.GetPlayers()
    local VVxPlayer = ESX.GetPlayerFromId(source)
    if VVxPlayer.job.name ~= "gouvernement" and VVxPlayer.getGroup() == 'user' then return end
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        
        TriggerClientEvent("vUI:weazelnews:sendMsg", -1, input, 10000, 'gouv')
    end
end)