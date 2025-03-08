RegisterNetEvent('kayscore:acceuil:sendAnnounce', function(job, message)
    local players = ESX.GetExtendedPlayers('job', job)

    for k,v in pairs(players) do
        TriggerClientEvent('esx:showNotification', v.source, message)
        TriggerClientEvent('soundjob:playSound', v.source)
    end
end)