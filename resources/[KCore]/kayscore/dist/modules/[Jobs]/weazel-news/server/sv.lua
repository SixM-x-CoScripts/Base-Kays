secured_RegisterServerEvent("Jrn:annonce")
secured_AddEventHandler("Jrn:annonce", function(input)
    local xPlayers = ESX.GetPlayers()
    local VVxPlayer = ESX.GetPlayerFromId(source)
    if VVxPlayer.job.name ~= "weazelnews" and VVxPlayer.getGroup() == 'user' then return end
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        sendLog(('Le joueurs (%s - %s) a envoyé une notification annonce, message : (%s)'):format(VVxPlayer.name, VVxPlayer.identifier, input), {
            author = 'Annonce Weazle Gouv',
            fields = {
                {title = 'Joueurs', value = VVxPlayer.name},
                {title = 'ID Unique', value = VVxPlayer.identifier},
                {title = 'Message', value = input},
                {title = 'Job', value = 'Journaliste'}
            },
            channel = 'AnnonceGouvwezaele'
        })
        TriggerClientEvent("ui:weazelnews:sendMsg", -1, input, 10000, 'Journaliste')
    end
end)