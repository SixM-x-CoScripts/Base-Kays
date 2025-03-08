taxi = {
    Service = {},
    Appelles = {},
    IsDead = {},

    Employeds = {}
}
RegisterServerEvent('Ouvre:taxi')
AddEventHandler('Ouvre:taxi', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "taxi" then return end
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Taxi', 'Annonce', 'Le taxi est désormais ~p~Ouvert~s~!', 'CHAR_TAXI', 8)
	end
end)

RegisterServerEvent('Ferme:taxi')
AddEventHandler('Ferme:taxi', function()
	local _source = source
		local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "taxi" then return end
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Taxi', 'Annonce', 'Le taxi est désormais ~r~Fermer~s~!', 'CHAR_TAXI', 8)
	end
end)
RegisterNetEvent("taxi:FinishMission")
AddEventHandler("taxi:FinishMission", function(bonus)
    local xPlayer = ESX.GetPlayerFromId(source)
    local society = Society:getSociety(xPlayer.job.name)
    if xPlayer.job.name ~= "taxi" then
        --TriggerEvent("AC:Violations", 24, "Event: taxi:FinishMission job: "..xPlayer.job.name, source)
        return
    end

    local gain = math.random(50,150)
    xPlayer.addAccountMoney('cash', gain)
    society.addSocietyMoney(gain*2)


    TriggerClientEvent('esx:showNotification',  source, "Vous avez terminé votre mission.\nGain: ~p~"..gain.."~s~€\nGain entreprise: ~p~".. tostring(gain * 2) .."~s~$", "CHAR_TAXI", 5000, "danger")
end)
RegisterNetEvent('kayscore:taxi:service', function()
	local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "taxi" then return end
    local xPlayerName = ('%s %s'):format(xPlayer.firstname, xPlayer.lastname)

    taxi.Service[xPlayer.UniqueID] = not taxi.Service[xPlayer.UniqueID]
    
    TriggerClientEvent('kayscore:taxi:service', source, taxi.Service[xPlayer.UniqueID])
   

    if taxi.Service[xPlayer.UniqueID] then
        taxi.Employeds[xPlayer.UniqueID] = {
            name = xPlayer.name
        }
        TriggerClientEvent('kayscore:taxi:addEmployed', -1, xPlayer.UniqueID, taxi.Employeds[xPlayer.UniqueID])

        LogsJobFunc.SendLogsService('taxi', ('*%s* a pris son service taxi'):format(xPlayerName), 'prise')
        -- print("sended logs")
    else
        taxi.Service[xPlayer.UniqueID] = nil
        TriggerClientEvent('kayscore:taxi:removeEmployed', -1, xPlayer.UniqueID)
        LogsJobFunc.SendLogsService('taxi', ('*%s* a quitter son service taxi'):format(xPlayerName), 'quit')

    end
end)



RegisterNetEvent('kayscore:taxi:call', function(playerCoords)
	local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "taxi" then return end

    if taxi.Appelles[xPlayer.UniqueID] then return end

    taxi.Appelles[xPlayer.UniqueID] = {
        name = xPlayer.name,
        UniqueID = xPlayer.UniqueID,
        position = playerCoords,
        take = false
    }

    local xxxxxxx = ESX.GetExtendedPlayers('job', 'taxi')

    for k,v in pairs(xxxxxxx) do
        TriggerClientEvent('kayscore:taxi:addCall', v.source, xPlayer.UniqueID, taxi.Appelles[xPlayer.UniqueID])

        if taxi.Service[v.UniqueID] then
            TriggerClientEvent('esx:showNotification', v.source, '📞 Un nouvel appelle a été recus #'..xPlayer.UniqueID)
        end
    end


end)

RegisterNetEvent('kayscore:taxi:takeAppel', function(k)
    	local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "taxi" then return end

    taxi.Appelles[k].take = true

    local xxxxxxx = ESX.GetExtendedPlayers('job', 'taxi')

    for i,v in pairs(xxxxxxx) do

       TriggerClientEvent('kayscore:taxi:updateCall', i, k, taxi.Appelles[k])

        if taxi.Service[v.UniqueID] then
            TriggerClientEvent('esx:showNotification', k, ('📞 %s a pris en charge l\'appel '..i):format(GetPlayerName(source)))
        end
    end

    TriggerClientEvent('kayscore:taxi:takeMyCall', source, k)

    if not ReturnPlayerId(taxi.Appelles[k].UniqueID) then return end

    TriggerClientEvent('esx:showNotification', ReturnPlayerId(taxi.Appelles[k].UniqueID).id, '🚑 Un médecin est en route !')

end)

RegisterNetEvent('kayscore:taxi:closeAppel', function(k)
    	local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "taxi" then return end
    if taxi.Appelles[k] ~= nil then
        taxi.Appelles[k] = nil
    end

    TriggerClientEvent('kayscore:taxi:removeCall', -1, k)

    local players = ESX.GetExtendedPlayers('job', 'taxi')

    for k,v in pairs(players) do
        if taxi.Service[v.UniqueID] then
            TriggerClientEvent('esx:showNotification', k, ('📞 %s a terminé l\'appel '..k):format(GetPlayerName(source)))
        end
    end
end)



-- RegisterNetEvent('kayscore:taxi:moneyBoss', function(society, amount, action)
-- 	local xPlayer = ESX.GetPlayerFromId(source)

--     if xPlayer.job.name ~= "taxi" then return end

--     local society = Society:getSociety(xPlayer.job.name)

--     if not society then return end
    

--     if action == 'deposit' then
--         if xPlayer.getAccount('bank').money < amount then return TriggerClientEvent('esx:showNotification', source, 'Votre solde bancaire n\'est pas assez élevé') end

--         society.addMoney(amount)
--         xPlayer.removeAccountMoney('bank', amount)

--         TriggerClientEvent('esx:showNotification', source, ('Vous avez déposé ~y~%s$~s~'):format(amount))

--         -- TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
--         --     account.addMoney(amount)
--         --     xPlayer.removeAccountMoney('bank', amount)
    
--         --     TriggerClientEvent('esx:showNotification', source, ('Vous avez déposez ~y~%s$~s~'):format(amount))
--         -- end)
--     elseif action == 'remove' then
--         society.removeSocietyMoney(amount)
--         xPlayer.addAccountMoney('bank', amount)

--         TriggerClientEvent('esx:showNotification', source, ('Vous avez pris ~y~%s$~s~'):format(amount))

--         -- TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
--         --     if account.money < amount then return TriggerClientEvent('esx:showNotification', source, 'Il n\'y a pas assez d\'argent dans le coffre') end
--         --     account.removeMoney(amount)
--         --     xPlayer.addAccountMoney('bank', amount)
    
--         --     TriggerClientEvent('esx:showNotification', source, ('Vous avez pris ~y~%s$~s~'):format(amount))
--         -- end)
--     end
-- end)