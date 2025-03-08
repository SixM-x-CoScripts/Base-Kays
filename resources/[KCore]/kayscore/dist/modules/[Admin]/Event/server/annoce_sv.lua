secured_RegisterServerEvent("sv_slide:event:annonce")
secured_AddEventHandler("sv_slide:event:annonce", function(input)
    local xPlayers = ESX.GetPlayers()
    local VVxPlayer = ESX.GetPlayerFromId(source)
    if VVxPlayer.getGroup() == 'user' then return end
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent("kayscore:event:annonce", -1, input)
    end
end)