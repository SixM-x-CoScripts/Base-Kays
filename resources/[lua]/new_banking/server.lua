--================================================================================================
--==                                VARIABLES - DO NOT EDIT                                     ==
--================================================================================================
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('bank:deposit')
AddEventHandler('bank:deposit', function(amount)
	local _source = source
	
	local xPlayer = ESX.GetPlayerFromId(_source)
	if amount == nil or amount <= 0 or amount > xPlayer.getMoney() then
		TriggerClientEvent('bank:result', _source, "error", "Montant invalide.")
	else
		xPlayer.removeAccountMoney('cash', amount)
		xPlayer.addAccountMoney('bank', tonumber(amount))
		TriggerClientEvent('bank:result', _source, "success", "Dépot effectué.")
	end
end)


RegisterServerEvent('bank:withdraw')
AddEventHandler('bank:withdraw', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local base = 0
	amount = tonumber(amount)
	base = xPlayer.getAccount('bank').money
	if amount == nil or amount <= 0 or amount > base then
		TriggerClientEvent('bank:result', _source, "error", "Montant invalide.")
	else
		xPlayer.removeAccountMoney('bank', amount)
		xPlayer.addAccountMoney('cash', amount)
		TriggerClientEvent('bank:result', _source, "success", "Retrait effectué.")
	end
end)

RegisterServerEvent('bank:balance')
AddEventHandler('bank:balance', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	balance = xPlayer.getAccount('bank').money
	TriggerClientEvent('currentbalance1', _source, balance)
end)


RegisterServerEvent('bank:transfer')
AddEventHandler('bank:transfer', function(to, amountt)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local zPlayer = ESX.GetPlayerFromUniqueID(to)
	local balance = 0

	amountt = tonumber(amountt)

	if not xPlayer or not amountt or amountt <= 0 then
		TriggerClientEvent('bank:result', _source, "error", "Montant invalide.")
		return
	end

	if not zPlayer and source ~= 0 then
		if xPlayer.getAccount('bank').money >= amountt then
			MySQL.Async.fetchAll('SELECT * FROM users WHERE UniqueID = @identifier', {['@identifier'] = to}, function(result)
				if result[1] ~= nil then
					account = json.decode(result[1].accounts)
					for k,v in pairs(account) do
						if v.name == "bank" then
							account[k].money = account[k].money + amountt
						end
					end
					xPlayer.removeAccountMoney('bank', amountt)
					MySQL.Async.execute('UPDATE users SET accounts = @accounts WHERE UniqueID = @identifier', {['@accounts'] = json.encode(account), ['@identifier'] = to})
					TriggerClientEvent('bank:result', _source, "success", "Transfert effectué.")
					return
				end
			end)
		else
			TriggerClientEvent('bank:result', _source, "error", "Vous n'avez pas assez d'argent en banque.")
		end
	else
		if not zPlayer then
			TriggerClientEvent('bank:result', _source, "error", "Destinataire introuvable.")
			return
		end

		balance = xPlayer.getAccount('bank').money

		if tonumber(_source) == tonumber(to) then
			TriggerClientEvent('bank:result', _source, "error", "Vous ne pouvez pas faire de transfert à vous même.")
		else
			if balance < amountt then
				TriggerClientEvent('bank:result', _source, "error", "Vous n'avez pas assez d'argent en banque.")
			else
				xPlayer.removeAccountMoney('bank', amountt)
				zPlayer.addAccountMoney('bank', amountt)
				TriggerClientEvent('bank:result', _source, "success", "Transfert effectué.")
				zPlayer.showNotification("Vous avez reçu un transfert de "..amountt.."~p~$")
			end
		end
	end
end)