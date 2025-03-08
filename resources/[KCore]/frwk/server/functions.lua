function ESX.SetTimeout(msec, cb)
	local id = ESX.TimeoutCount + 1

	SetTimeout(msec, function()
		if ESX.CancelledTimeouts[id] then
			ESX.CancelledTimeouts[id] = nil
		else
			cb()
		end
	end)

	ESX.TimeoutCount = id
	return id
end

function ESX.ClearTimeout(id)
	ESX.CancelledTimeouts[id] = true
end

ESX.RegisterServerCallback = function(name, cb)

	ESX.ServerCallbacks[name] = cb

end

function ESX.TriggerServerCallback(name, requestId, source, cb, ...)
	if ESX.ServerCallbacks[name] then
		ESX.ServerCallbacks[name](source, cb, ...)
		--print('[ID : '..source.. ' Pseudo : '..GetPlayerName(source).. ' ] use => [' .. name .. '] ')
	else
		print(('[^3WARNING^7] Server callback "%s" does not exist.'):format(name))
	end
end

function ESX.SavePlayer(xPlayer, cb)
	local asyncTasks = {}

	if xPlayer then
		-- User Main
		table.insert(asyncTasks, function(cb)
			local lastCoords = ESX.RoundVector(xPlayer.getLastPosition())

			MySQL.Async.execute('UPDATE users SET accounts = @accounts, playerName = @playerName, permission_group = @permission_group, permission_level = @permission_level, job = @job, job2 = @job2, job_grade = @job_grade, job2_grade = @job2_grade, inventory = @inventory, loadout = @loadout, position = @position, ip = @ip WHERE identifier = @identifier', {
				['@identifier'] = xPlayer.identifier,
				['@playerName'] = xPlayer.getName(),
				['@permission_group'] = xPlayer.group,
				['@permission_level'] = xPlayer.permission_level,
				['@job'] = xPlayer.job.name,
				['@job2'] = xPlayer.job2.name,
				['@job_grade'] = xPlayer.job.grade,
				['@job2_grade'] = xPlayer.job2.grade,
				['@accounts'] = json.encode(xPlayer.getAccounts(true)),
				['@inventory'] = json.encode(xPlayer.getInventory(true)),
				['@loadout'] = json.encode(xPlayer.getLoadout()),
				['@position'] = json.encode({x = lastCoords.x, y = lastCoords.y, z = lastCoords.z}),
				['@ip'] = ESX.getLicense(xPlayer.source)
			}, function(rowsChanged)
				cb()
			end)
		end)

		Async.parallel(asyncTasks, function(results)
			--print(('[^2SAVE^7] %s^7'):format(xPlayer.getName()))
			--xPlayer.showNotification("~b~FlashWord~s~RP~s~ - ~b~Sauvegarde~s~ \nSynchronisation effectuée.")

			if cb then
				cb()
			end
		end)
	else
		if cb then
			cb()
		end
	end
end

function ESX.SavePlayers(cb)
	local asyncTasks = {}
	local xPlayers = ESX.GetPlayers()

	if #xPlayers > 0 then
		for i = 1, #xPlayers, 1 do
			table.insert(asyncTasks, function(cb)
				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
				ESX.SavePlayer(xPlayer, cb)
			end)
		end

		Async.parallelLimit(asyncTasks, 8, function(results)
			ESX.toConsole(('^1Save^0 => %s players'):format(#xPlayers))

			if cb then
				cb()
			end
		end)
	end
end

function ESX.SyncPosition()
	local xPlayers = ESX.GetPlayers()

	for i = 1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

		if xPlayer then
			local plyPed = GetPlayerPed(xPlayer.source)

			if DoesEntityExist(plyPed) and xPlayer.positionSaveReady then
				local lastCoords = GetEntityCoords(plyPed)

				if lastCoords ~= nil then
					xPlayer.setLastPosition(lastCoords)
				end
			end
		end
	end
end

function ESX.StartDBSync()
	function saveData()
		ESX.SavePlayers()
		SetTimeout(5 * 60 * 1000, saveData)
	end

	SetTimeout(5 * 60 * 1000, saveData)
end

function ESX.StartPositionSync()
	function updateData()
		ESX.SyncPosition()
		SetTimeout(10 * 1000, updateData)
	end

	SetTimeout(5 * 1000, updateData)
end

function ESX.GetPlayers()
	local sources = {}

	for k, v in pairs(ESX.Players) do
		table.insert(sources, k)
	end

	return sources
end

function ESX.GetPlayerFromId(src)
	return ESX.Players[tonumber(src)]
end

function ESX.GetPlayerFromIdentifier(identifier)
	for k, v in pairs(ESX.Players) do
		if v.identifier == identifier then
			return v
		end
	end
end

function ESX.GetPlayerFromUniqueID(UniqueID)
	for k,v in pairs(ESX.Players) do
		if tostring(v.UniqueID) == tostring(UniqueID) then
			return ESX.Players[k]
		end
	end
end

function ESX.GetIdentifierFromId(source, identifier)

	if source == nil or source == 0 then
		return "Invalid"
	end

	identifier = identifier or 'license:'
	local identifiers = GetPlayerIdentifiers(tonumber(source))

	for i = 1, #identifiers, 1 do
		if string.sub(identifiers[i], 1, string.len(identifier)) == identifier then
			return identifiers[i]
		end
	end

	return false
end

function ESX.RegisterUsableItem(item, cb)
	ESX.UsableItemsCallbacks[item] = cb
end

function ESX.UseItem(source, item)
	if ESX.UsableItemsCallbacks[item] then
		ESX.UsableItemsCallbacks[item](source)
	else
		print('[frwk] : ' .. source .. 'tried to use item : ' .. item)
	end
end
function ESX.GetUsableItem(item)
	return ESX.UsableItemsCallbacks[item]
end

function ESX.GetItem(item)
	if ESX.Items[item] then
		return ESX.Items[item]
	end
end

function ESX.GetItemLabel(item)
	if ESX.Items[item] ~= nil then
		return ESX.Items[item].label
	end
end

function ESX.CreatePickup(type, name, count, label, playerId, components)
	local xPlayer = ESX.GetPlayerFromId(playerId)
	local coords = xPlayer.getCoords()

	TriggerEvent("ratelimit", source, "esx:CreatePickup")

	local pickupId = (ESX.PickupId == 65635 and 0 or ESX.PickupId + 1)

	ESX.Pickups[pickupId] = {
		type = type,
		name = name,
		count = count,
		label = label,
		coords = coords
	}

	if type == 'item_weapon' then
		ESX.Pickups[pickupId].components = components
	end

	TriggerClientEvent('esx:createPickup', -1, pickupId, label, coords, type, name, components)
	ESX.PickupId = pickupId
end

function ESX.DoesJobExist(job, grade)
	grade = tostring(grade)

	if job and grade then
		if ESX.Jobs[job] ~= nil and ESX.Jobs[job].grades[grade] ~= nil then
			return true
		end
	end

	return false
end

function ESX.Notifi(source, msg)
	TriggerClientEvent('esx:showNotification', source, msg)
end

function ESX.ChatMessage(source, msg, author, color)
	TriggerClientEvent('chat:addMessage', source, {color = color or {0, 0, 0}, args = {author or 'SYSTEME', msg or ''}})
end

function ESX.DB.CreateUser(identifier, cb)
	local position = json.encode({x = Config.DefaultPosition.x, y = Config.DefaultPosition.y, z = Config.DefaultPosition.z})

	MySQL.Async.execute('INSERT INTO users (identifier, permission_group, permission_level, position) VALUES (@identifier, @permission_group, @permission_level, @position)', {
		identifier = identifier,
		permission_group = Config.DefaultGroup,
		permission_level = Config.DefaultLevel,
		position = position
	}, function()
		if cb then
			cb()
		end
	end)
end

function ESX.DB.UpdateUser(identifier, new, cb)
	Citizen.CreateThread(function()
		local updateString = ''
		local length = ESX.Table.SizeOf(new)
		local cLength = 1

		for k, v in pairs(new) do
			if cLength < length then
				if (type(v) == 'number') then
					updateString = updateString .. "`" .. k .. "` = " .. v .. ","
				else
					updateString = updateString .. "`" .. k .. "` = '" .. v .. "',"
				end
			else
				if (type(v) == 'number') then
					updateString = updateString .. "`" .. k .. "` = " .. v
				else
					updateString = updateString .. "`" .. k .. "` = '" .. v .. "'"
				end
			end

			cLength = cLength + 1
		end

		MySQL.Async.execute('UPDATE users SET ' .. updateString .. ' WHERE `identifier` = @identifier', {identifier = identifier}, function()
			if cb then
				cb(true)
			end
		end)
	end)
end

function ESX.DB.DoesUserExist(identifier, cb)
	MySQL.Async.fetchAll('SELECT * FROM users WHERE `identifier` = @identifier', {identifier = identifier}, function(result)
		if cb then
			if result[1] then
				cb(true)
			else
				cb(false)
			end
		end
	end)
end

function ESX.GetPlayersWithJob(job)
	if job == nil then error('nil job') end

    local xPlayers = {}
    for _, playerId in pairs(ESX.GetPlayers()) do
        local anyXPlayer = ESX.GetPlayerFromId(playerId)
		if anyXPlayer and anyXPlayer.job and anyXPlayer.job.name == job then
			table.insert(xPlayers, anyXPlayer)
        end
	end

	return xPlayers
end

function ESX.GetExtendedPlayers(key, val)
	local xPlayers = {}
	for k, v in pairs(ESX.Players) do
		if key then
			if (key == 'job' and v.job.name == val) or v[key] == val then
				xPlayers[#xPlayers + 1] = v
			end
		else
			xPlayers[#xPlayers + 1] = v
		end
	end
	return xPlayers
end

function ESX.toConsole(data)
	if data == nil then data = 'Unedefined' end
	print(('[^5%s^0] => ' .. data):format("kayscore"))
end

function ESX.GetServerName()
	return GetConvar('ServerName', ' ')
end

function ESX.getLicense(src)
    for k,v in pairs(GetPlayerIdentifiers(src))do
        if string.sub(v, 1, string.len("ip:")) == "ip:" then
            return v
        end
    end
end

function ESX.GetConfig(ConvarName)
	local retval = GetConvar(ConVarName, "")

	print(retval, json.encode(retval))

	local p = promise:new()

	p:resolve(retval)

	return Citizen.Await(p)
end

function ESX.AddItem(name, label, rare, can_remove, weight)
	MySQL.Async.fetchAll('SELECT * FROM items WHERE name = @name', {
		['@name'] = name
	}, function(result)
		if json.encode(result) == "[]" then
			MySQL.Async.execute('INSERT INTO items (name, label, rare, can_remove, weight) VALUES (@name, @label, @rare, @can_remove, @weight)', {
				['@name'] = ('%s'):format(name),
				['@label'] = label,
				['@rare'] = 0,
				['@can_remove'] = 0,
				['@weight'] = weight,
			}, function()
				TriggerEvent('esx:getAllJobs')
			end)
		end
	end)
end


AddEventHandler('esx:playerLoaded', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    MySQL.Async.fetchScalar("SELECT vie FROM users WHERE identifier = @identifier", { 
        ['@identifier'] = xPlayer.identifier
        }, function(vie)
        if (vie ~= nil) then
            TriggerClientEvent('kayscore:viePlayers', playerId, vie)
        end
    end)
end)

RegisterNetEvent('kayscore:SavePlayersData', function(updateVie)
    local xPlayer = ESX.GetPlayerFromId(source)
    if (xPlayer) then 
        MySQL.Async.execute('UPDATE users SET vie = @vie WHERE identifier = @identifier', {
            ['@vie'] = tonumber(updateVie),
            ['@identifier'] = xPlayer.identifier
        }, function(rowsChanged)
        end)
    end
end)

print('discord.gg/SixM discord.gg/CoScripts')