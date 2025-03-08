ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



-- Open ID card
RegisterServerEvent('jsfour-idcard:open')
AddEventHandler('jsfour-idcard:open', function(ID, targetID, type)
	print('jsfour-idcard: opusereren')
	local identifier = ESX.GetPlayerFromId(ID).identifier
	local src = source
	local _source 	 = ESX.GetPlayerFromId(targetID).source
	print(_source)
	local show       = false

	MySQL.Async.fetchAll('SELECT firstname, lastname, dateofbirth, sex, height FROM users WHERE identifier = @identifier', {['@identifier'] = identifier},
	function (user)
		if (user[1] ~= nil) then
			MySQL.Async.fetchAll('SELECT type FROM user_licenses WHERE owner = @identifier', {['@identifier'] = identifier},
			function (licenses)
				if type ~= nil then
					for i=1, #licenses, 1 do
						if type == 'driver' then
							if licenses[i].type == 'drive' or licenses[i].type == 'drive_bike' or licenses[i].type == 'drive_boat' or licenses[i].type == 'drive_truck' then
								show = true
							end
						elseif type =='weapon' then
							if licenses[i].type == 'weapon' then
								show = true
							end
						elseif type =='job' then
							if licenses[i].type == 'ambulance' or licenses[i].type == 'ambulancecayo' or licenses[i].type == 'ambulancenord' or licenses[i].type == 'ambulancepillbox' or licenses[i].type == 'autoexotic' or licenses[i].type == 'avocat_soony' or licenses[i].type == 'avocat' or licenses[i].type == 'bahamas' or licenses[i].type == 'SASPN' or licenses[i].type == 'mecano' or licenses[i].type == 'bikeshop' or licenses[i].type == 'boatshop' or licenses[i].type == 'burgershot' or licenses[i].type == 'carshop' or licenses[i].type == 'police' or licenses[i].type == 'dreamworks' or licenses[i].type == 'drusillas' or licenses[i].type == 'dw' or licenses[i].type == 'gouvernement' or licenses[i].type == 'Hayes' or licenses[i].type == 'realestateagent' or licenses[i].type == 'taxi' or licenses[i].type == 'unicorn' or licenses[i].type == 'weazelnews' then
								show = true
							end
						elseif type =='fishing' then
							if licenses[i].type == 'fishing_mer' or licenses[i].type == 'fishing_ocean' or licenses[i].type == 'fishing_douce' then
								show = true
							end
						end
					end
				else
					show = true
				end

				if show then

					local array = {
						user = user,
						licenses = licenses
					}

					TriggerClientEvent('jsfour-idcard:open', _source, array, type)
					TriggerClientEvent('kayscore:id:idcard', src)
				else
					TriggerClientEvent('esx:showNotification', _source, "Vous n'avez pas ce type de licence...")
				end
			end)
		end
	end)
end)

RegisterServerEvent('jsfour-idcard:openNew')
AddEventHandler('jsfour-idcard:openNew', function(ID, targetID, src, type)
	local identifier = targetID
	local source = src

	local show       = false

	MySQL.Async.fetchAll('SELECT firstname, lastname, dateofbirth, sex, height FROM player_idcard WHERE UniqueID = @UniqueID', {['@UniqueID'] = identifier},
	function (user)
		if (user[1] ~= nil) then
			MySQL.Async.fetchAll('SELECT type FROM user_licenses WHERE owner = @identifier', {['@identifier'] = identifier},
			function (licenses)
				if type ~= nil then
					for i=1, #licenses, 1 do
						if type == 'driver' then
							if licenses[i].type == 'drive' or licenses[i].type == 'drive_bike' or licenses[i].type == 'drive_boat' or licenses[i].type == 'drive_truck' then
								show = true
							end
						elseif type =='weapon' then
							if licenses[i].type == 'weapon' then
								show = true
							end
						elseif type =='job' then
							if licenses[i].type == 'ambulance' or licenses[i].type == 'ambulancecayo' or licenses[i].type == 'ambulancenord' or licenses[i].type == 'ambulancepillbox' or licenses[i].type == 'autoexotic' or licenses[i].type == 'avocat_soony' or licenses[i].type == 'avocat' or licenses[i].type == 'bahamas' or licenses[i].type == 'SASPN' or licenses[i].type == 'mecano' or licenses[i].type == 'bikeshop' or licenses[i].type == 'boatshop' or licenses[i].type == 'burgershot' or licenses[i].type == 'carshop' or licenses[i].type == 'police' or licenses[i].type == 'dreamworks' or licenses[i].type == 'drusillas' or licenses[i].type == 'dw' or licenses[i].type == 'gouvernement' or licenses[i].type == 'Hayes' or licenses[i].type == 'realestateagent' or licenses[i].type == 'taxi' or licenses[i].type == 'unicorn' or licenses[i].type == 'weazelnews' then
								show = true
							end
						elseif type =='fishing' then
							if licenses[i].type == 'fishing_mer' or licenses[i].type == 'fishing_ocean' or licenses[i].type == 'fishing_douce' then
								show = true
							end
						end
					end
				else
					show = true
				end

				if show then

					local array = {
						user = user,
						licenses = licenses
					}

					TriggerClientEvent('jsfour-idcard:open', source, array, type)
					TriggerClientEvent('kayscore:id:idcard', source)
				else
					TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas ce type de licence...")
				end
			end)
		end
	end)
end)
RegisterServerEvent('Game:Personal:Server:identity')
AddEventHandler('Game:Personal:Server:identity', function(target)

    local xPlayer = ESX.GetPlayerFromId(source)
	
	if target then xTarget = ESX.GetPlayerFromId(target) end
    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
        ['@identifier'] = xPlayer.identifier
    }, function(result)
        if result[1] then
            TriggerClientEvent('Game:Client:UI:showIdentity', xPlayer.source, { "Prénom*", "Nom*", "Sexe*", "Entreprise*" }, {"~bold~~b~"..result[1].firstname.."~bold~~b~", "~bold~~b~"..result[1].lastname.."~bold~~b~", result[1].sex == "0" and "~bold~~b~Homme~bold~" or "~bold~~b~Femme~bold~", "~bold~~b~"..xPlayer.job.label.."~bold~"}, '~bold~~b~'.. result[1].dateofbirth ..'~bold~~b~', xPlayer.source)
			if target then
            TriggerClientEvent('Game:Client:UI:showIdentity', xTarget.source, { "Prénom*", "Nom*", "Sexe*", "Entreprise*" }, {"~bold~~b~"..result[1].firstname.."~bold~~b~", "~bold~~b~"..result[1].lastname.."~bold~~b~", result[1].sex == "0" and "~bold~~b~Homme~bold~" or "~bold~~b~Femme~bold~", "~bold~~b~"..xPlayer.job.label.."~bold~"}, '~bold~~b~'.. result[1].dateofbirth ..'~bold~', xPlayer.source)
			end
        end
    end)
end)
ESX.RegisterUsableItem('idcard', function(source)
   local _source = source
   local xPlayer = ESX.GetPlayerFromId(_source)
   
   print('use id card '..source)
   
   TriggerClientEvent('montrer:identity', source)
end)