local JobCustoms = {
    ['mecano'] = true,
    ['lscustom'] = true,
}

RegisterServerEvent('BuyLsCustoms')
AddEventHandler('BuyLsCustoms', function(newVehProps, amount)
	local _src = source
	local xPlayer = ESX.GetPlayerFromId(source)

  
       
     
    local job = xPlayer.job.name
	local societyAccount = nil
    local price = tonumber(amount)

    if JobCustoms[job] then

        local society = Society:getSociety(xPlayer.job.name)

        if not society then return end

        societyAccount = society.getSocietyMoney()



        if societyAccount ~= nil and tonumber(societyAccount) >= price then
            MySQL.Async.execute('UPDATE owned_vehicles SET vehicle = @vehicle WHERE plate = @plate', {
                ['@plate'] = newVehProps.plate,
                ['@vehicle'] = json.encode(newVehProps)
            }, function()
                for k,v in pairs(Garages.vehicles) do
                    if tostring(v.plate) == tostring(newVehProps.plate) then
                        Garages.vehicles[k].vehicle = json.encode(newVehProps)
                    end
                end

                TriggerClientEvent('Mecano:installMod', _src)
                society.removeSocietyMoney(price)
                xPlayer.showNotification("Vous avez ~g~installé~s~ toutes ~g~les modifications~s~.")
                xPlayer.showNotification("Vous avez modifier le véhicule ~g~"..price.."$~s~ on été retiré de l\'entreprise.")
                sendLog(("Le Joueur (%s - %s) viens d'acheter une custom avec la sociéte (%s - %s$)"):format(xPlayer.name, xPlayer.UniqueID, xPlayer.job.name, price), {
                    author = 'Mécano',
                    fields = {
                        {title = 'Player', subtitle = xPlayer.name},
                        {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                        {title = 'Identifier', subtitle = xPlayer.identifier},
                        {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                    },
                    channel = 'mecano_payecustom'
                })
            end)
            -- TriggerClientEvent('Mecano:installMod', _src)
            -- society.removeSocietyMoney(price)
    
            -- xPlayer.showNotification("Vous avez ~g~installé~s~ toutes ~g~les modifications~s~.")
            -- xPlayer.showNotification("Vous avez modifier le véhicule ~g~"..price.."$~s~ on été retiré de l\'entreprise.")
        else
            TriggerClientEvent('CancelLsCustoms', _src)
        end
    end

end)

RegisterNetEvent('Mecano:refreshOwnedVehicle', function(myCar)
    local xPlayer = ESX.GetPlayerFromId(source)

   
    TriggerClientEvent('esx:showNotification', source, 'Les modifications ont bien était appliquées')
    MySQL.Async.execute('UPDATE owned_vehicles SET vehicle = @vehicle WHERE plate = @plate', {
        ['@plate'] = myCar.plate,
        ['@vehicle'] = json.encode(myCar)
    }, function()
        for k,v in pairs(Garages.vehicles) do
            if tostring(v.plate) == tostring(myCar.plate) then
                Garages.vehicles[k].vehicle = json.encode(myCar)
            end
        end
    end)
end)

RegisterServerEvent("kayscore:mechanic:requestPlayerBillsState", function(target_player_source, price)
        local xPlayer = ESX.GetPlayerFromId(source)

        if xPlayer.job.name == "mecano" or xPlayer.job.name == "lscustom" then 
            --     TriggerClientEvent('esx:showNotification', source, 'On ta vue (aie....)')
    --    -- logsACJob.SendLogsACJob('bill', ('%s a tenté de facturer ID: **%s**  (trigger: mechanic:requestPlayerbill)'):format(xPlayer.name, xPlayer.UniqueID))
    --     return 
 

    if (type(target_player_source) ~= "number") then
        return
    end

    local player_source = source
    local player_source_data = ESX.GetPlayerFromId(player_source)
    local target_player_source_data = ESX.GetPlayerFromId(target_player_source)

    if (player_source_data ~= nil and target_player_source_data ~= nil) then

        local player = ESX.GetPlayerFromId(source)

        local society = Society:getSociety(player.job.name)

        if not society then return end

        societyAccount = society.getSocietyMoney()

        if societyAccount < price then
            TriggerClientEvent('esx:showNotification', source, 'La société n\'a pas asser d\'argent')
            TriggerClientEvent('CancelLsCustoms', source)
            return
        end

        TriggerClientEvent('kayscore:mechanic:receivePlayerBillsState', source, true)
        sendLog(("Le Joueur (%s - %s) viens d'envoyer une facture custom par la sociéte (%s - %s$)"):format(xPlayer.name, xPlayer.UniqueID, xPlayer.job.name, price), {
            author = 'Mécano',
            fields = {
                {title = 'Player', subtitle = xPlayer.name},
                {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                {title = 'Identifier', subtitle = xPlayer.identifier},
                {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
            },
            channel = 'mecano_facture'
        })
    end
end
end);

RegisterNetEvent('kayscore:mechanic:patron', function(price)
        local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name == "mecano" or xPlayer.job.name == "lscustom" then 
    --     TriggerClientEvent('esx:showNotification', source, 'On ta vue (aie....)')
    --    -- logsACJob.SendLogsACJob('money', ('%s a tenté de prendre de l\'argent dans la société bennys  ID Unique: **%s**(trigger: patron)'):format(xPlayer.name, xPlayer.UniqueID))
    --     return 
    
    local player = ESX.GetPlayerFromId(source)
    
    local society = Society:getSociety(xPlayer.job.name)

    if not society then return end

    societyAccount = society.getSocietyMoney()

    if societyAccount < price then
        TriggerClientEvent('esx:showNotification', source, 'La société n\'a pas asser d\'argent')
        TriggerClientEvent('CancelLsCustoms', source)
        return
    end

    TriggerClientEvent('kayscore:mechanic:receivePlayerBillsState:patron', source, true)
    sendLog(("Le Joueur (%s - %s) viens de payer une custom avec l'argent de la sociéte (%s - %s$)"):format(xPlayer.name, xPlayer.UniqueID, xPlayer.job.name, price), {
        author = 'Mécano',
        fields = {
            {title = 'Player', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
        },
        channel = 'mecano_paye_patron'
    })
end
end)



RegisterNetEvent('kayscore:caca:neon:paid', function(itemName, count, price)
        local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "mecano" or xPlayer.job.name ~= "lscustom" then return end
    local player = ESX.GetPlayerFromId(source)

    if player == nil then return end

    local society = Society:getSociety(player.job.name)

    if not society then return end
    if not player.canCarryItem(itemName, 1) then TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez de place dans votre inventaire") return end	
    society.removeSocietyMoney(count*price)

    player.addInventoryItem(itemName, count)
end)