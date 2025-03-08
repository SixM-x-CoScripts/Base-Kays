RegisterNetEvent('kayscore:entreprise:Boss_recruterplayer', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromId(target)

    if targetPlayer.getJob().name ~= 'unemployed' then return TriggerClientEvent('esx:showNotification', source, 'La personne est déja dans une entreprise') end

    if targetPlayer then
        targetPlayer.setJob(xPlayer.getJob().name, 0)
    end

    
    TriggerClientEvent('esx:showNotification', source, 'Joueur recruté avec succès')
end)

ESX.RegisterServerCallback('kayscore:vip:getPlates', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local plates = {}

    if xPlayer then
        MySQL.Async.fetchAll('SELECT plate FROM owned_vehicles WHERE owner = @identifier', {
            ['@identifier'] = xPlayer.UniqueID
        }, function(result)
            for _, v in ipairs(result) do
                table.insert(plates, v.plate)
            end
            cb(plates)
        end)
    else
        cb(nil)
    end
end)

ESX.RegisterServerCallback('kayscore:getNumberOfSocieties', function(source, cb)
    MySQL.Async.fetchScalar('SELECT COUNT(*) FROM society_data', {}, function(result)
        local numberOfSocieties = tonumber(result) or 0
        cb(numberOfSocieties)
    end)
end)

RegisterNetEvent('tebex:on-process-checkout-weapon-custom')
AddEventHandler('tebex:on-process-checkout-weapon-custom', function(weaponName, customHash)
    local source = source;
    local CUSTOM = CustomPrice(weaponName, customHash);
    if (source) then
        local xPlayer = ESX.GetPlayerFromId(source)
            xPlayer.addWeaponComponent(weaponName, CUSTOM.name)
        end
end)


RegisterNetEvent('kayscore:vip:changePlate')
AddEventHandler('kayscore:vip:changePlate', function(vehicleNetId, newPlate)
    local xPlayer = ESX.GetPlayerFromId(source)
    local vehicle = NetworkGetEntityFromNetworkId(vehicleNetId)
    
    if DoesEntityExist(vehicle) then
        local ownerIdentifier = GetVehicleOwnerIdentifier(vehicle)

        if ownerIdentifier == xPlayer.UniqueID then
            MySQL.Async.execute('UPDATE owned_vehicles SET plate = @newPlate WHERE plate = @oldPlate', {
                ['@newPlate'] = newPlate,
                ['@oldPlate'] = GetVehicleNumberPlateText(vehicle)
            })
            
            TriggerClientEvent('esx:showNotification', source, '~g~Votre plaque a été changée avec succès.')
            TriggerClientEvent('kayscore:vip:updateVehiclePlate', source, vehicleNetId, newPlate)
        else
            TriggerClientEvent('esx:showNotification', source, '~r~Ce véhicule ne vous appartient pas.')
        end
    else
        TriggerClientEvent('esx:showNotification', source, '~r~Véhicule introuvable.')
    end
end)

function GetVehicleOwnerIdentifier(vehicle)
    local plate = GetVehicleNumberPlateText(vehicle)
    local result = MySQL.Sync.fetchAll('SELECT owner FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    })
    
    if result[1] then
        return result[1].owner
    else
        return nil
    end
end

RegisterNetEvent('kayscore:entreprise:Boss_virerplayer', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromId(target)

    if targetPlayer.getJob().name ~= xPlayer.getJob().name then return TriggerClientEvent('esx:showNotification', source, 'La personne n\'est pas dans votre entreprise') end

    if targetPlayer then
        targetPlayer.setJob('unemployed', 0)
    end

    
    TriggerClientEvent('esx:showNotification', source, 'Joueur viré avec succès')
end)
ESX.RegisterServerCallback('boss:GetPlayerInfo', function(source, cb, target)
	local xPlayer = ESX.GetPlayerFromId(target)
	-- print(target)
	local GetPlayerInfo = {
		name            = GetPlayerName(target),
		joblabel        = xPlayer.job.label,
		jobgradelabel   = xPlayer.job.grade_label,
		jobgrade        = xPlayer.job.grade,
		jobgradename    = xPlayer.job.grade_name,
		job2label       = xPlayer.job2.label,
		job2gradelabel  = xPlayer.job2.grade_label,
		job2grade       = xPlayer.job2.grade,
		job2gradename   = xPlayer.job2.grade_name,
		inventory       = xPlayer.inventory,
		loadout         = xPlayer.loadout,
		accounts        = xPlayer.accounts,
		money           = xPlayer.getMoney(),
		bank 	        = xPlayer.getAccount('bank').money,
		blackmoney      = xPlayer.getAccount('black_money').money,
		steamid 	    = xPlayer.identifier,
	}
	cb(GetPlayerInfo)
end)

RegisterServerEvent('boss:Boss_recruterplayer')
AddEventHandler('boss:Boss_recruterplayer', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local sourceJob = sourceXPlayer.getJob()

	if sourceJob.grade_name == 'boss' then
		local targetXPlayer = ESX.GetPlayerFromId(target)

		targetXPlayer.setJob(sourceJob.name, 1)
        TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "Vous avez recruté "..targetXPlayer.name)
		TriggerClientEvent('esx:showNotification', target, "Vous avez été embauché par "..sourceXPlayer.name)
		
	end
end)
RegisterServerEvent('boss:Boss_promouvoirplayer')
AddEventHandler('boss:Boss_promouvoirplayer', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local sourceJob = sourceXPlayer.getJob()

	if sourceJob.grade_name == 'boss' then
		local targetXPlayer = ESX.GetPlayerFromId(target)
		local targetJob = targetXPlayer.getJob()

		if sourceJob.name == targetJob.name then
			local newGrade = tonumber(targetJob.grade) + 1

			if newGrade ~= getMaximumGrade(targetJob.name) then
				targetXPlayer.setJob(targetJob.name, newGrade)
                TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "Vous avez promu "..targetXPlayer.name)
				TriggerClientEvent('esx:showNotification', target, "Vous avez été promu par "..sourceXPlayer.name)
				
			else
                TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "Vous devez demande au gouvernement")
			
			end
		else
            TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "La personne n'est pas dans votre entreprise")
			
		end
	else
        TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "Vous n'avez pas l'autorisation")
		
	end
end)
RegisterServerEvent('boss:Boss_destituerplayer')
AddEventHandler('boss:Boss_destituerplayer', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local sourceJob = sourceXPlayer.getJob()

	if sourceJob.grade_name == 'boss' then
		local targetXPlayer = ESX.GetPlayerFromId(target)
		local targetJob = targetXPlayer.getJob()

		if sourceJob.name == targetJob.name then
			local newGrade = tonumber(targetJob.grade) - 1

			if newGrade >= 0 then
				targetXPlayer.setJob(targetJob.name, newGrade)
                TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "Vous avez retrogradé "..targetXPlayer.name)
				TriggerClientEvent('esx:showNotification', target, "Vous avez été retrogradé par "..sourceXPlayer.name)
				
			else
                TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "Vous ne pouvez pas retrograder d'avantage.")
				
			end
		else
            TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "La personne n'est pas dans votre entreprise")
			
		end
	else
        TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "Vous n'avez pas l'autorisation")
	
	end
end)
RegisterServerEvent('boss:Boss_virerplayer')
AddEventHandler('boss:Boss_virerplayer', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local sourceJob = sourceXPlayer.getJob()

	if sourceJob.grade_name == 'boss' then
		local targetXPlayer = ESX.GetPlayerFromId(target)
		local targetJob = targetXPlayer.getJob()

		if sourceJob.name == targetJob.name then
			targetXPlayer.setJob('unemployed', 0)
            TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "Vous été viré "..targetXPlayer.name)
            
			TriggerClientEvent('esx:showNotification', target, "Vous avez été viré par "..sourceXPlayer.name)
			
		else
            
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Le joueur n\'es pas dans votre entreprise.')
		end
	else
        TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "Vous n'avez pas l'autorisation")
	end
end)

function getMaximumGrade(jobname)
    local queryDone, queryResult = false, nil

    MySQL.Async.fetchAll('SELECT * FROM job_grades WHERE job_name = @jobname ORDER BY `grade` DESC ;', {
        ['@jobname'] = jobname
    }, function(result)
        queryDone, queryResult = true, result
    end)

    while not queryDone do
        Wait(10)
    end

    if queryResult[1] then
        return queryResult[1].grade
    end

    return nil
end

--- job2
RegisterServerEvent('boss:Boss_recruterplayer2')
AddEventHandler('boss:Boss_recruterplayer2', function(target, grade2)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local sourceJob2 = sourceXPlayer.getJob2()

	if sourceJob2.grade_name == 'boss' then
		local targetXPlayer = ESX.GetPlayerFromId(target)

		targetXPlayer.setgroup(sourceJob2.name, 1)
        TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "Vous avez recruté "..targetXPlayer.name)
		TriggerClientEvent('esx:showNotification', target, "Vous avez été embauché par "..sourceXPlayer.name)
	end
end)
RegisterServerEvent('boss:Boss_promouvoirplayer2')
AddEventHandler('boss:Boss_promouvoirplayer2', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local sourceJob2 = sourceXPlayer.getJob2()

	if sourceJob2.grade_name == 'boss' then
		local targetXPlayer = ESX.GetPlayerFromId(target)
		local targetJob2 = targetXPlayer.getJob2()

		if sourceJob2.name == targetJob2.name then
			local newGrade = tonumber(targetJob2.grade) + 1

			if newGrade ~= getMaximumGrade(targetJob2.name) then
				targetXPlayer.setgroup(targetJob2.name, newGrade)

                TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "Vous avez promu "..targetXPlayer.name)
				TriggerClientEvent('esx:showNotification', target, "Vous avez été promu par "..sourceXPlayer.name)
				
			else
                TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "Vous devez demande au gouvernement")
			
			end
		else
            TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "La personne n'est pas dans votre entreprise")
			
		end
	else
        TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "Vous n'avez pas l'autorisation")
	end
end)
RegisterServerEvent('boss:Boss_destituerplayer2')
AddEventHandler('boss:Boss_destituerplayer2', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local sourceJob2 = sourceXPlayer.getJob2()

	if sourceJob2.grade_name == 'boss' then
		local targetXPlayer = ESX.GetPlayerFromId(target)
		local targetJob2 = targetXPlayer.getJob2()

		if sourceJob2.name == targetJob2.name then
			local newGrade = tonumber(targetJob2.grade) - 1

			if newGrade >= 0 then
				targetXPlayer.setgroup(targetJob2.name, newGrade)

                TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "Vous avez retrogradé "..targetXPlayer.name)
				TriggerClientEvent('esx:showNotification', target, "Vous avez été retrogradé par "..sourceXPlayer.name)
				
			else
                TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "Vous ne pouvez pas retrograder d'avantage.")
				
			end
		else
            TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "La personne n'est pas dans votre entreprise")
			
		end
	else
        TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "Vous n'avez pas l'autorisation")
	end
end)
RegisterServerEvent('boss:Boss_virerplayer2')
AddEventHandler('boss:Boss_virerplayer2', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local sourceJob2 = sourceXPlayer.getJob2()

	if sourceJob2.grade_name == 'boss' then
		local targetXPlayer = ESX.GetPlayerFromId(target)
		local targetJob2 = targetXPlayer.getJob2()

		if sourceJob2.name == targetJob2.name then
			targetXPlayer.setgroup('unemployed2', 0)
            TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "Vous été viré "..targetXPlayer.name)
            
			TriggerClientEvent('esx:showNotification', target, "Vous avez été viré par "..sourceXPlayer.name)
			
		else
            
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Le joueur n\'es pas dans votre entreprise.')
		end
	else
        TriggerClientEvent('esx:showNotification', sourceXPlayer.source, "Vous n'avez pas l'autorisation")
	end
end)
RegisterServerEvent("kayscore:job:leave")
AddEventHandler("kayscore:job:leave", function()
    local source = source 
	local targetXPlayer = ESX.GetPlayerFromId(source)
	targetXPlayer.setJob('unemployed', 0)
end)
RegisterServerEvent("kayscore:job2:leave")
AddEventHandler("kayscore:job2:leave", function()
    local source = source 
	local targetXPlayer = ESX.GetPlayerFromId(source)
	targetXPlayer.setgroup('unemployed', 0)
end)
RegisterNetEvent('TheGoAt:::::entreprise:Boss_virerplayer', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromId(target)

    if targetPlayer.getJob().name ~= xPlayer.getJob().name then return TriggerClientEvent('esx:showNotification', source, 'La personne n\'est pas dans votre entreprise') end

    if targetPlayer then
        targetPlayer.setJob('unemployed', 0)
    end

    
    TriggerClientEvent('esx:showNotification', source, 'Joueur viré avec succès')
end)
RegisterNetEvent('main:entreprise:Boss_promouvoirplayer', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromId(target)

    if targetPlayer.getJob().name ~= xPlayer.getJob().name then return TriggerClientEvent('esx:showNotification', source, 'La personne n\'est pas dans votre entreprise') end

    if targetPlayer then
        targetPlayer.setJob(xPlayer.getJob().name, targetPlayer.getJob().grade + 1)
    end

    TriggerClientEvent('esx:showNotification', source, 'Joueur promue avec succès')
end)

RegisterNetEvent('kayscore:entreprise:Boss_destituerplayer', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromId(target)

    if targetPlayer.getJob().name ~= xPlayer.getJob().name then return TriggerClientEvent('esx:showNotification', source, 'La personne n\'est pas dans votre entreprise') end

    if targetPlayer then
        targetPlayer.setJob(xPlayer.getJob().name, targetPlayer.getJob().grade - 1)
    end

    TriggerClientEvent('esx:showNotification', source, 'Joueur destitué avec succès')
end)

local table = {}

RegisterNetEvent('kayscore:personalmenu:getpropspropss', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll('SELECT * FROM players_props WHERE UniqueID = @UniqueID', {
        ['@UniqueID'] = xPlayer.UniqueID
    }, function(result)
        table[xPlayer.UniqueID] = {}
        for k,v in pairs(result) do
            v.data = json.decode(v.data)
            if not table[xPlayer.UniqueID][v.data.name] then
                table[xPlayer.UniqueID][v.data.name] = {
                    label = v.data.label,
                    name = v.data.name,
                    owner = v.data.owner,
                    id = v.id,
                    count = 1
                }
            else
                table[xPlayer.UniqueID][v.data.name].count += 1
            end
        end

        TriggerClientEvent('kayscore:recieveProps', source, table[xPlayer.UniqueID])
    end)
end)

RegisterNetEvent('kayscore:bill:pay', function(v)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if xPlayer.getAccount('bank').money < tonumber(v.amount) then
        TriggerClientEvent('esx:showNotification', source, "Vous ne possezdez pas les fonds néccéssaire")
        return
    end

    local society = Society:getSociety(v.target)

    if not society then return end

    sendLog(('Paiment facture société (%s - %s) Data (%s- %s) Type (%s) (Coffre)'):format(xPlayer.name, xPlayer.UniqueID, society.name, society.label, type), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = 'Prix de la facture', subtitle = v.amount},
            {title = 'Nouvelle somme dans le coffre', subtitle = ('%s$'):format(society.coffre['accounts']['society'])},
            {title = 'Type', subtitle = 'society'},
            {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
        },
        channel = 'society_deposit_money'
    })

    xPlayer.removeAccountMoney('bank', v.amount)
    society.addSocietyMoney(v.amount)

    MySQL.Async.execute('DELETE from billing WHERE id = @id', {
        ['@id'] = v.id
    }, function(rowsChanged)

    end)

    TriggerClientEvent('esx:showNotification', source, ('Vous avez payé une facture d\'un montant de ~y~%s$~s~'):format(v.amount))

    local players = ESX.GetExtendedPlayers('job', society.name)

    for k,p in pairs(players) do
        if tostring(p.identifier) == tostring(v.sender) then
            TriggerClientEvent('esx:showNotification', p.source, ('Une nouvelle personne vient de payer une facture d\'un montant de ~y~%s$~s~'):format(v.amount))
        end
    end
end)