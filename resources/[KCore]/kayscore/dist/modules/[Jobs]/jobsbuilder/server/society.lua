FarmJobs = {
    inService = {}
}

RegisterNetEvent('kayscore:FarmJobs:service', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    -- Récupérer les données du joueur à partir de xPlayer
    local jobName = xPlayer.job.name
    local jobLabel = xPlayer.job.label

    local players = ESX.GetExtendedPlayers('job', jobName)

    if not FarmJobs.inService[xPlayer.identifier] then
        FarmJobs.inService[xPlayer.identifier] = {
            identifier = xPlayer.identifier, -- Utilisez identifier au lieu de UniqueID
            service = true,
            name = xPlayer.getName()
        }

        for k,v in pairs(players) do
            TriggerClientEvent('esx:showNotification', v.source, ('L\'employé ~y~%s~s~ a pris son service'):format(xPlayer.getName()))
        end
    else
        FarmJobs.inService[xPlayer.identifier] = nil
        
        for k,v in pairs(players) do
            TriggerClientEvent('esx:showNotification', v.source, ('L\'employé ~y~%s~s~ a fini son service'):format(xPlayer.getName()))
        end
    end
end)
