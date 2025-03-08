local rob = false
local robbers = {}


secured_RegisterServerEvent('kayscore:bank:braquage:toofar')
secured_AddEventHandler('kayscore:bank:braquage:toofar', function(robb)
	local source = source
	local xPlayers = ESX.GetPlayers()
	rob = false
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' or xPlayer.job.name == 'bcso' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_cancelled_at') .. Banks[robb].nameofbank)
			TriggerClientEvent('kayscore:bank:braquage:killblip', xPlayers[i])
		end
	end
	if(robbers[source])then
		secured_TriggerClientEvent('kayscore:bank:braquage:toofarlocal', source)
		robbers[source] = nil
		TriggerClientEvent('esx:showNotification', source, _U('robbery_has_cancelled') .. Banks[robb].nameofbank)
	end
end)

secured_RegisterServerEvent('kayscore:bank:braquage:rob')
secured_AddEventHandler('kayscore:bank:braquage:rob', function(robb)

	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	
	if Banks[robb] then

		local bank = Banks[robb]

		if (os.time() - bank.lastrobbed) < 600 and bank.lastrobbed ~= 0 then

			TriggerClientEvent('esx:showNotification', source, _U('already_robbed') .. (1800 - (os.time() - bank.lastrobbed)) .. _U('seconds'))
			return
		end


		local cops = 0
		for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' or xPlayer.job.name == 'bcso' then
				cops = cops + 1
			end
		end


		if rob == false then

			if(cops >= 1)then

				rob = true
				for i=1, #xPlayers, 1 do
					local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
					if xPlayer.job.name == 'police' or xPlayer.job.name == 'bcso' then
                        TriggerClientEvent('esx:showNotification', xPlayers[i], _U('rob_in_prog') .. bank.nameofbank)
                        secured_TriggerClientEvent('kayscore:bank:braquage:setblip', xPlayers[i], Banks[robb].position)
					end
				end

				TriggerClientEvent('esx:showNotification', source, _U('started_to_rob') .. bank.nameofbank .. _U('do_not_move'))
				TriggerClientEvent('esx:showNotification', source, _U('alarm_triggered'))
				TriggerClientEvent('esx:showNotification', source, _U('hold_pos'))
				TriggerClientEvent('kayscore:bank:braquage:currentlyrobbing', source, robb)
				Banks[robb].lastrobbed = os.time()
				robbers[source] = robb
				local savedSource = source
				SetTimeout(300000, function()

					if(robbers[savedSource])then

						rob = false
						secured_TriggerClientEvent('kayscore:bank:braquage:robberycomplete', savedSource, job)
						if(xPlayer)then

							xPlayer.addAccountMoney('black_money', bank.reward)
							local xPlayers = ESX.GetPlayers()
							for i=1, #xPlayers, 1 do
								local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
								if xPlayer.job.name == 'police' or xPlayer.job.name == 'bcso' then
										TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_complete_at') .. bank.nameofbank)
										TriggerClientEvent('kayscore:bank:braquage:killblip', xPlayers[i])
										sendLog(('Le Joueur (%s - %s) viens de récupérer (%s$)'):format(xPlayer.name, xPlayer.UniqueID, bank.reward), {
											author = 'Banque',
											fields = {
												{title = 'Player', subtitle = xPlayer.name},
												{title = 'ID Unique', subtitle = xPlayer.UniqueID},
												{title = 'Identifier', subtitle = xPlayer.identifier},
												{title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
											},
											channel = 'end_banque'
										})
								end
							end
						end
					end
				end)
			else
				TriggerClientEvent('esx:showNotification', source, _U('min_two_police'))
			end
		else
			TriggerClientEvent('esx:showNotification', source, _U('robbery_already'))
		end
	end
end)
