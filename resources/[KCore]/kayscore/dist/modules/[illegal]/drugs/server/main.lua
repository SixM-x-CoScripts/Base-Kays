function kayscoreDrugs.IsOnPoint(playerCoords, points)
    for _, point in ipairs(points) do
        if #(playerCoords - point) < 5.0 then 
            return true
        end
    end
    return false
end

secured_RegisterNetEvent('kayscore:drugs:drugs')
secured_AddEventHandler('kayscore:drugs:drugs', function(item, type)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    local playerCoords = GetEntityCoords(GetPlayerPed(source))

    local validPoints = kayscoreDrugs.Drugs[item][type]
    if not kayscoreDrugs.IsOnPoint(playerCoords, validPoints) then
        DropPlayer(source, "Vous avez été déconnecté pour avoir tenté d'utiliser les triggers sans être sur les points.")
        return
    end

    local count = 0
    local total = 1

    if boost_farm.have(xPlayer.UniqueID) then
        total = total * 2 
    end

    if type == 'recolte' then
        count = math.random(1, 3) * total

        if not xPlayer.canCarryItem(kayscoreDrugs.Items[item][type].name, 1) then 
            TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez de place dans votre inventaire") 
            return 
        end

        xPlayer.addInventoryItem(kayscoreDrugs.Items[item][type].name, count)
        TriggerClientEvent('esx:showNotification', source, ('🌿 Vous avez récolté ~y~+%s~s~ %s'):format(count, kayscoreDrugs.Items[item][type].label))
        sendLog(('Le Joueur (%s - %s) récolte la drogue (x%s - %s)'):format(xPlayer.name, xPlayer.UniqueID, count, kayscoreDrugs.Items[item][type].label), {
            author = 'Drogues',
            fields = {
                {title = 'Player', subtitle = xPlayer.name},
                {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                {title = 'Identifier', subtitle = xPlayer.identifier},
                {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
            },
            channel = 'reco_drogue'
        })
    elseif type == 'traitement' then
        local requiredAmount = 3 * total
        if xPlayer.getInventoryItem(kayscoreDrugs.Items[item]['recolte'].name).count < requiredAmount then 
            TriggerClientEvent('esx:showNotification', source, ('⚠️ Vous ne possédez pas assez de ~y~%s~s~ pour traiter'):format(item)) 
            TriggerClientEvent('framework:stopActivity', source) -- Arrêt du farm côté client
            return 
        end

        if not xPlayer.canCarryItem(kayscoreDrugs.Items[item][type].name, total) then 
            TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez de place dans votre inventaire") 
            return 
        end

        xPlayer.removeInventoryItem(kayscoreDrugs.Items[item]['recolte'].name, requiredAmount)
        xPlayer.addInventoryItem(kayscoreDrugs.Items[item][type].name, total)
        TriggerClientEvent('esx:showNotification', source, ('🌿 ~y~x%s~s~ %s'):format(total, kayscoreDrugs.Items[item][type].label))
        sendLog(('Le Joueur (%s - %s) traite la drogue (x%s - %s)'):format(xPlayer.name, xPlayer.UniqueID, total, kayscoreDrugs.Items[item][type].label), {
            author = 'Drogues',
            fields = {
                {title = 'Player', subtitle = xPlayer.name},
                {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                {title = 'Identifier', subtitle = xPlayer.identifier},
                {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
            },
            channel = 'trait_drogue'
        })
    end
end)

secured_RegisterNetEvent('kayscore:drugs:addTable')
secured_AddEventHandler('kayscore:drugs:addTable', function(table)
    kayscoreDrugs.Items = table
end)
