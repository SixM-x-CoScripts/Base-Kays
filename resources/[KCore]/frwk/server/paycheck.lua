-- ESX.StartPayCheck = function()
-- 	function payCheck()
-- 		local xPlayers = ESX.GetPlayers()

-- 		for i = 1, #xPlayers, 1 do
-- 			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

-- 			if xPlayer then
-- 				local society = exports['kayscore']:getSociety(xPlayer.job.name)

-- 				if society then

-- 					if society.coffre['accounts'].society < xPlayer.job.grade_salary then
-- 						TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), '', 'Votre société n\"a plus d\'argent pour vous payez', 'CHAR_BANK_FLEECA', 9)
-- 					else
-- 						society.removeSocietyMoney(xPlayer.job.grade_salary)
-- 						xPlayer.addAccountMoney('bank', xPlayer.job.grade_salary)

-- 						TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), 'Vous avez recus votre salaire: '..xPlayer.job.grade_salary, 'CHAR_BANK_FLEECA', 9)
-- 					end
-- 				else
-- 					TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), _U('received_help', 150), 'CHAR_BANK_FLEECA', 9)
-- 				end
-- 			end
-- 		end

-- 		SetTimeout(Config.PaycheckInterval, payCheck)
-- 	end

-- 	SetTimeout(Config.PaycheckInterval, payCheck)
-- end

-- CreateThread(function()
-- 	ESX.StartPayCheck()
-- end)