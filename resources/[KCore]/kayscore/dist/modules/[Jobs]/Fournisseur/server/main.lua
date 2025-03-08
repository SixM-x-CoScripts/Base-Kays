RegisterServerEvent('menu:buyItem')
AddEventHandler('menu:buyItem', function(jobName, itemName, itemLabel, price, data)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == jobName then
        local totalPrice = price * data
        if xPlayer.getAccount('bank').money >= totalPrice then
            if xPlayer.canCarryItem(itemName, data) then
            xPlayer.removeAccountMoney('bank', totalPrice)
            xPlayer.addInventoryItem(itemName, data)
            TriggerClientEvent('esx:showNotification', source, '✔️ Vous avez acheté ~g~' .. itemLabel..' x'..data)
            TriggerClientEvent('esx:showNotification', source, '🚨 Vous avez été débité de ~g~' .. totalPrice .. '$')
            sendLog(('( %s - %s ) Viens d\'acheter ( x%s %s = %s $) pour l\'entreprise ( %s)'):format(xPlayer.name, xPlayer.UniqueID, data, itemLabel, totalPrice, jobName), {
                author = "Fournisseur",
                fields = {
                    {title = 'Joueur', subtitle = xPlayer.name},
                    {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                    {title = 'Identifier', subtitle = xPlayer.identifier},
                    {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                },
                
                channel = 'fournisseur'
            })
        else
            TriggerClientEvent('esx:showNotification', source, '🚨 Vous n\'avez pas assez de place sur vous')
        end
    else
        TriggerClientEvent('esx:showNotification', source, '🚨 Vous n\'avez pas assez d\'argent')
    end
    else
        TriggerClientEvent('esx:showNotification', source, '🚨 Action non autorisée pour votre job')
    end
end)

JobResto = {
    inService = {}
}

RegisterNetEvent('kayscore:JobResto:service', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    -- Récupérer les données du joueur à partir de xPlayer
    local jobName = xPlayer.job.name
    local jobLabel = xPlayer.job.label

    local players = ESX.GetExtendedPlayers('job', jobName)

    if not JobResto.inService[xPlayer.identifier] then
        JobResto.inService[xPlayer.identifier] = {
            identifier = xPlayer.identifier, -- Utilisez identifier au lieu de UniqueID
            service = true,
            name = xPlayer.getName()
        }

        for k,v in pairs(players) do
            TriggerClientEvent('esx:showNotification', v.source, ('L\'employé ~y~%s~s~ a pris son service'):format(xPlayer.getName()))
        end
    else
        JobResto.inService[xPlayer.identifier] = nil
        
        for k,v in pairs(players) do
            TriggerClientEvent('esx:showNotification', v.source, ('L\'employé ~y~%s~s~ a fini son service'):format(xPlayer.getName()))
        end
    end
end)

local lastAnnouncementTime = {}

secured_RegisterServerEvent('monjob:annoncer')
secured_AddEventHandler('monjob:annoncer', function(msg)
    local source = source 
    local xPlayer = ESX.GetPlayerFromId(source) 

    if not xPlayer then
        DropPlayer(source, "Erreur: Impossible de récupérer les données du joueur.")
        return
    end

    local currentTime = os.time()
    local jobName = xPlayer.job.name

    if lastAnnouncementTime[jobName] then
        local timeDiff = currentTime - lastAnnouncementTime[jobName]
        if timeDiff < 600 then
            local remainingTime = 600 - timeDiff
            local remainingMinutes = math.floor(remainingTime / 60)
            local remainingSeconds = remainingTime % 60
            local remainingMessage = ('🚨 Vous devez attendre ~p~%02d minute(s)~s~ et ~p~%02d seconde(s)~s~ avant de faire une nouvelle annonce.'):format(remainingMinutes, remainingSeconds)
            TriggerClientEvent('esx:showNotification', source, remainingMessage)
            return
        end
    end

    lastAnnouncementTime[jobName] = currentTime

    -- Définir le timeout pour vider lastAnnouncementTime[jobName] après 10 minutes
    SetTimeout(600000, function()
        lastAnnouncementTime[jobName] = nil
    end)

    -- Envoi de l'annonce à tous les joueurs
    TriggerClientEvent('esx:showAdvancedNotification', -1, "~b~Entreprise", '~b~'..xPlayer.job.label, '\n~w~'..msg, xPlayer.job.name, 7)
    sendLog(('( %s - %s ) Viens de faire une annonce pour l\'entreprise'):format(xPlayer.name, xPlayer.UniqueID), {
        author = "Annonce entreprise",
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
            {title = "Annonce", subtitle = "\n"..msg},
        },
        channel = 'annonce'
    })
end)
