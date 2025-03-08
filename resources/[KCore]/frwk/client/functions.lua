ESX = {}
ESX.PlayerData = {}
ESX.PlayerLoaded = false
ESX.CurrentRequestId = 0
ESX.ServerCallbacks = {}
ESX.TimeoutCallbacks = {}

ESX.UI = {}
ESX.UI.HUD = {}
ESX.UI.HUD.RegisteredElements = {}
ESX.UI.Menu = {}
ESX.UI.Menu.RegisteredTypes = {}
ESX.UI.Menu.Opened = {}

ESX.Game = {}
ESX.Game.Utils = {}

ESX.Scaleform = {}
ESX.Scaleform.Utils = {}

ESX.Streaming = {}

ESX.NOTREMOVEWEAPONS = {
	["WEAPON_COACHGUN"] = true,
	["WEAPON_SHOTGUNK"] = true,
	["WEAPON_VSCO"] = true,
	["WEAPON_BLUERIOT"] = true,
	["WEAPON_BLACKSNIPER"] = true,
	["WEAPON_ANCIENT"] = true,
	["WEAPON_SIG550"] = true,
	["WEAPON_MILITARM4"] = true,
	["WEAPON_BLASTM4"] = true,
	["WEAPON_BLASTAK"] = true,
	["WEAPON_REVOLVERULTRA"] = true,
	["WEAPON_GOLDM"] = true,
	["WEAPON_PREDATOR"] = true,
	["WEAPON_AKORUS"] = true,
	["WEAPON_REDL"] = true,
	["WEAPON_MIDASGUN"] = true,
	["WEAPON_SNAKE"] = true,
	["WEAPON_HELL"] = true,
	["WEAPON_OBLIVION"] = true,
	["WEAPON_TEC9MF"] = true,
	["WEAPON_TEC9MB"] = true,
	["WEAPON_SCARSC"] = true,
	["WEAPON_ALIEN"] = true,
	["WEAPON_MIDGARD"] = true,
	["WEAPON_SPECIALHAMMER"] = true,
	["WEAPON_PENIS"] = true,
	["WEAPON_MAZE"] = true,
	["WEAPON_GUARD"] = true,
	["WEAPON_GRAU"] = true,
	["WEAPON_SCAR17"] = true,
	["WEAPON_M19"] = true,
	["WEAPON_UZILS"] = true,
	["WEAPON_DESERTNIKE"] = true,
	["WEAPON_M4GOLDBEAST"] = true,
	["WEAPON_M4BEAST"] = true,
	["WEAPON_GLOCKDM"] = true,
	["WEAPON_357"] = true,
	["WEAPON_HELLSNIPER"] = true,
	["WEAPON_AKBONE"] = true,
	["WEAPON_SCOM"] = true,
	["WEAPON_AA"] = true,
	["WEAPON_680M"] = true,
	["WEAPON_GUTSLING"] = true,
	["WEAPON_SNAKEU"] = true,
	["WEAPON_SNAKEPER"] = true,
	["WEAPON_SNAKENADE"] = true,
	["WEAPON_ASSAULTRIFLELS"] = true,
	["WEAPON_WOLFKNIFE"] = true,
	["WEAPON_WOLFVERN"] = true,
	["WEAPON_SNIWOLF"] = true,
	["WEAPON_SMG_MK2"] = true,
	["WEAPON_SCARWHITE"] = true,
	["WEAPON_SOVEREIGN"] = true,
	["WEAPON_DIABLO"] = true,
	["WEAPON_SPONGEBOB"] = true,

	["WEAPON_SCARH"] = true,
	["WEAPON_COMPACTAK"] = true,
	["WEAPON_CANDYAXE"] = true,
	["WEAPON_CANDYAXE"] = true,
	["WEAPON_RAINBOWSMASH"] = true,
	["WEAPON_HELLOKITTY"] = true,
	["WEAPON_PATTERN"] = true,
	["WEAPON_SlidePISTOL"] = true,
	["WEAPON_SPONGEPISTOL"] = true,
	["WEAPON_GUSPURPLE"] = true,
	["WEAPON_RGXOPERATOR"] = true,
	["WEAPON_FORTSHOTGUN"] = true,
	["WEAPON_417"] = true,
}

function ESX.DrawMissionText(msg, time)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(msg)
    DrawSubtitleTimed(time and math.ceil(time) or 0, true)
end
function ESX.SetTimeout(msec, cb)
	table.insert(ESX.TimeoutCallbacks, {
		time = GetGameTimer() + msec,
		cb = cb
	})

	return #ESX.TimeoutCallbacks
end

function ESX.ClearTimeout(i)
	ESX.TimeoutCallbacks[i] = nil
end

function ESX.IsPlayerLoaded()
	return ESX.PlayerLoaded
end
function ESX.GetImg(name)
	return  nil
end

function ESX.GetPlayerData()
	return ESX.PlayerData
end

function ESX.SetPlayerData(key, val)
	ESX.PlayerData[key] = val
end

playerInSilence      = false
playerInSilenceVotes      = false

exports('silplyEr', function()
    return playerInSilence
end)

exports('SilVotePly', function()
    return playerInSilenceVotes
end)

exports('DisableNotif', function()
    playerInSilence = false
end)

exports('DisableNotifVote', function()
    playerInSilenceVotes = false
end)

RegisterNetEvent("getter:toggleSilence")
AddEventHandler("getter:toggleSilence", function()
    playerInSilence = not playerInSilence
end)

RegisterNetEvent("ui:disableLogin")
AddEventHandler("ui:disableLogin", function()
    playerInSilence = false
end)

ESX.MuteNotification = function(time)
	playerInSilence = true

	local nextTime = GetGameTimer() + time * 60 * 1000
	Citizen.CreateThread(function()
		while GetGameTimer() < nextTime do
			Citizen.Wait(1000)
		end
		playerInSilence = false
		ESX.ShowNotification("~r~Les notifications seront désormais affichées de nouveau")
	end)
end


-- function ESX.ShowNotification(msg, hudColorIndex)
-- 	--AddTextEntry('esxNotification', msg)
-- 	--BeginTextCommandThefeedPost('esxNotification')
-- 	--if hudColorIndex then ThefeedNextPostBackgroundColor(hudColorIndex) end
-- 	--EndTextCommandThefeedPostTicker(false, true)

-- 	if exports.inv:getOpenInventory() then
-- 		TriggerEvent('kayscore:inventory:notifi', msg)
-- 	else
-- 		exports.bulletin:Send(msg)
-- 	end
-- end

function ESX.ShowNotification(msg, texttype, length)
    local convert = {
        ["primary"] = 'info',
        ["police"] = 'SASP',
        ["ambulance"] = 'sams',
    }

    -- Default value for texttype if not provided
    if not texttype then
        texttype = 'info'
    end

    -- Convert texttype if a conversion exists
    if convert[texttype] then
        texttype = convert[texttype]
    end

    -- Default value for length if not provided
    length = length or 5000

    -- Trigger the new notification event
    TriggerEvent('sx-hud:createNotification', msg, length, texttype)
end

function ESX.ShowAdvancedNotification(sender, subject, msg, textureDict, iconType, flash, saveToBrief, hudColorIndex)
    local convert = {
        ["primary"] = 'info',
        ["police"] = 'sasp',
        ["ambulance"] = 'sams',
    }

    -- Default type for notifications
    local texttype = 'info'

    -- Combine sender and subject for the new notification
    local fullTitle = sender .. " - " .. subject

    -- Set a default duration if needed (e.g., 5000 ms)
    local length = 5000

    -- Trigger the new notification event
    TriggerEvent('sx-hud:createNotification', fullTitle .. "\n" .. msg, length, texttype)
end

-- function ESX.ShowAdvancedNotification(sender, subject, msg, textureDict, iconType, flash, saveToBrief, hudColorIndex)
--     -- if saveToBrief == nil then saveToBrief = true end
--     -- AddTextEntry('esxAdvancedNotification', msg)
--     -- BeginTextCommandThefeedPost('esxAdvancedNotification')
--     -- if hudColorIndex then ThefeedNextPostBackgroundColor(hudColorIndex) end
--     -- EndTextCommandThefeedPostMessagetext(textureDict, textureDict, false, iconType, sender, subject)
--     -- EndTextCommandThefeedPostTicker(flash or false, saveToBrief)
	
-- 	if exports.inv:getOpenInventory() then
-- 		TriggerEvent('kayscore:inventory:notifi', msg)
-- 	else
-- 		exports.bulletin:SendAdvanced(msg, sender, subject, textureDict)
-- 	end
-- end

ESX.ShowTimedNotification = function(msg, timeout)
	if playerInSilence then print("Notification manquée: "..msg) return end
	if IsPauseMenuActive() then return end
	exports.bulletin:Send(msg, timeout, nil, true)
end

function ESX.ShowHelpNotification(msg)
	AddTextEntry('esxHelpNotification', msg)
	BeginTextCommandDisplayHelp('esxHelpNotification')
	EndTextCommandDisplayHelp(0, false, true, -1)
end

ESX.ShowHelpNotification = function(msg)
    exports.interact:ShowHelpNotification({
		message = msg,
	})
end

function ESX.TriggerServerCallback(name, cb, ...)
	ESX.ServerCallbacks[ESX.CurrentRequestId] = cb
	_TriggerServerEvent('esx:triggerServerCallback', name, ESX.CurrentRequestId, ...)

	if ESX.CurrentRequestId < 65535 then
		ESX.CurrentRequestId = ESX.CurrentRequestId + 1
	else
		ESX.CurrentRequestId = 0
	end
end

function ESX.ShowNotification(msg, time)
    TriggerEvent('SHOW_NOTIF', msg, "rgb(0, 60, 255)", ESX.GetImg("https://i.ibb.co/FqdDjjBh/blanc.png"), "Informations", "Informations", withaccept, announcement)
end

function ESX.ShowAdvancedNotification(title, subject, msg, banner, timeout, icon)
    TriggerEvent('SHOW_NOTIF', msg, "rgb(0, 60, 255)", ESX.GetImg("https://i.ibb.co/FqdDjjBh/blanc.png"), "Informations", "Informations", withaccept, announcement)
end




function ESX.GetImg(name, item)
    local url = ("https://i.co/FqdDjjBh/blanc.png"):format(name)

    if (item) == true then
        url = ("https://i.ibb.co/FqdDjjBh/blanc.png"):format("box")
    end

    return url
end

function ESX.GetServerName()
	return GetConvar('ServerName', ' ')
end

ESX.UI.HUD.SetDisplay = function(opacity)
	SendNUIMessage({
		action  = 'setHUDDisplay',
		opacity = opacity
	})
end

ESX.UI.HUD.RegisterElement = function(name, index, priority, html, data)
	local found = false

	for i=1, #ESX.UI.HUD.RegisteredElements, 1 do
		if ESX.UI.HUD.RegisteredElements[i] == name then
			found = true
			break
		end
	end

	if found then
		return
	end

	table.insert(ESX.UI.HUD.RegisteredElements, name)

	SendNUIMessage({
		action    = 'insertHUDElement',
		name      = name,
		index     = index,
		priority  = priority,
		html      = html,
		data      = data
	})

	ESX.UI.HUD.UpdateElement(name, data)
end

ESX.UI.HUD.RemoveElement = function(name)
	for i=1, #ESX.UI.HUD.RegisteredElements, 1 do
		if ESX.UI.HUD.RegisteredElements[i] == name then
			table.remove(ESX.UI.HUD.RegisteredElements, i)
			break
		end
	end

	SendNUIMessage({
		action    = 'deleteHUDElement',
		name      = name
	})
end

ESX.UI.HUD.UpdateElement = function(name, data)
	SendNUIMessage({
		action = 'updateHUDElement',
		name   = name,
		data   = data
	})
end

ESX.UI.Menu.RegisterType = function(type, open, close)
	ESX.UI.Menu.RegisteredTypes[type] = {
		open   = open,
		close  = close
	}
end

ESX.UI.Menu.Open = function(type, namespace, name, data, submit, cancel, change, close)
	local menu = {}

	menu.type      = type
	menu.namespace = namespace
	menu.name      = name
	menu.data      = data
	menu.submit    = submit
	menu.cancel    = cancel
	menu.change    = change

	menu.close = function()

		ESX.UI.Menu.RegisteredTypes[type].close(namespace, name)

		for i=1, #ESX.UI.Menu.Opened, 1 do
			if ESX.UI.Menu.Opened[i] ~= nil then
				if ESX.UI.Menu.Opened[i].type == type and ESX.UI.Menu.Opened[i].namespace == namespace and ESX.UI.Menu.Opened[i].name == name then
					ESX.UI.Menu.Opened[i] = nil
				end
			end
		end

		if close ~= nil then
			close()
		end

	end

	menu.update = function(query, newData)

		for i=1, #menu.data.elements, 1 do
			local match = true

			for k,v in pairs(query) do
				if menu.data.elements[i][k] ~= v then
					match = false
				end
			end

			if match then
				for k,v in pairs(newData) do
					menu.data.elements[i][k] = v
				end
			end
		end

	end

	menu.refresh = function()
		ESX.UI.Menu.RegisteredTypes[type].open(namespace, name, menu.data)
	end

	menu.setElement = function(i, key, val)
		menu.data.elements[i][key] = val
	end

	menu.setTitle = function(val)
		menu.data.title = val
	end

	menu.removeElement = function(query)
		for i=1, #menu.data.elements, 1 do
			for k,v in pairs(query) do
				if menu.data.elements[i] then
					if menu.data.elements[i][k] == v then
						table.remove(menu.data.elements, i)
						break
					end
				end

			end
		end
	end

	table.insert(ESX.UI.Menu.Opened, menu)
	ESX.UI.Menu.RegisteredTypes[type].open(namespace, name, data)

	return menu
end

ESX.UI.Menu.Close = function(type, namespace, name)
	for i=1, #ESX.UI.Menu.Opened, 1 do
		if ESX.UI.Menu.Opened[i] ~= nil then
			if ESX.UI.Menu.Opened[i].type == type and ESX.UI.Menu.Opened[i].namespace == namespace and ESX.UI.Menu.Opened[i].name == name then
				ESX.UI.Menu.Opened[i].close()
				ESX.UI.Menu.Opened[i] = nil
			end
		end
	end
end

ESX.UI.Menu.CloseAll = function()
	for i=1, #ESX.UI.Menu.Opened, 1 do
		if ESX.UI.Menu.Opened[i] ~= nil then
			ESX.UI.Menu.Opened[i].close()
			ESX.UI.Menu.Opened[i] = nil
		end
	end
end

ESX.UI.Menu.GetOpened = function(type, namespace, name)
	for i=1, #ESX.UI.Menu.Opened, 1 do
		if ESX.UI.Menu.Opened[i] ~= nil then
			if ESX.UI.Menu.Opened[i].type == type and ESX.UI.Menu.Opened[i].namespace == namespace and ESX.UI.Menu.Opened[i].name == name then
				return ESX.UI.Menu.Opened[i]
			end
		end
	end
end

ESX.UI.Menu.GetOpenedMenus = function()
	return ESX.UI.Menu.Opened
end

ESX.UI.Menu.IsOpen = function(type, namespace, name)
	return ESX.UI.Menu.GetOpened(type, namespace, name) ~= nil
end

function ESX.UI.ShowInventoryItemNotification(add, label, count)
	SendNUIMessage({
		action = 'inventoryNotification',
		add = add,
		label = label,
		count = count
	})
end

function ESX.Game.GetPedMugshot(ped)
	if DoesEntityExist(ped) then
		local mugshot = RegisterPedheadshot(ped)

		while not IsPedheadshotReady(mugshot) do
			Citizen.Wait(100)
		end

		return mugshot, GetPedheadshotTxdString(mugshot)
	end
end

function ESX.Game.Teleport(entity, coords, cb)
	if entity ~= nil and entity == 'source' then
		RequestCollisionAtCoord(coords)

		while not HasCollisionLoadedAroundEntity(PlayerPedId()) do
			RequestCollisionAtCoord(coords)
			Citizen.Wait(100)
		end
		SetEntityCoords(PlayerPedId(), coords)
	else
		if DoesEntityExist(entity) then
			RequestCollisionAtCoord(coords)

			while not HasCollisionLoadedAroundEntity(entity) do
				RequestCollisionAtCoord(coords)
				Citizen.Wait(100)
			end
			SetEntityCoords(entity, coords)
		end
	end

	if cb then
		cb()
	end
end

function ESX.Game.DeleteVehicle(vehicle)
	SetEntityAsMissionEntity(vehicle, false, false)
	DeleteVehicle(vehicle)
end

function ESX.Game.DeleteObject(object)
	SetEntityAsMissionEntity(object, false, false)
	DeleteObject(object)
end

function ESX.Game.DeleteEntity(entity)
	SetEntityAsMissionEntity(entity, false, false)
	DeleteEntity(entity)
end

function ESX.Game.SpawnObject(model, coords, cb)
	local model = (type(model) == 'number' and model or GetHashKey(model))

	Citizen.CreateThread(function()
		ESX.Streaming.RequestModel(model)
		local object = CreateObject(model, coords, true, false, true)
		local id = NetworkGetNetworkIdFromEntity(object)

		SetNetworkIdCanMigrate(id, true)
		SetEntityAsMissionEntity(object, false, false)
		SetModelAsNoLongerNeeded(model)

		RequestCollisionAtCoord(coords)

		while not HasCollisionLoadedAroundEntity(object) do
			Citizen.Wait(100)
		end

		if cb then
			cb(object)
		end
	end)
end

function ESX.Game.SpawnLocalObject(model, coords, cb)
	local model = (type(model) == 'number' and model or GetHashKey(model))

	Citizen.CreateThread(function()
		ESX.Streaming.RequestModel(model)
		local object = CreateObject(model, coords, false, false, true)

		SetEntityAsMissionEntity(object, false, false)
		SetModelAsNoLongerNeeded(model)

		RequestCollisionAtCoord(coords)

		while not HasCollisionLoadedAroundEntity(object) do
			Citizen.Wait(100)
		end

		if cb then
			cb(object)
		end
	end)
end



function ESX.Game.SpawnVehicle(modelName, coords, heading, cb)
	local model = (type(modelName) == 'number' and modelName or GetHashKey(modelName))
	local coords = ESX.Vector(coords)

	Citizen.CreateThread(function()
		ESX.Streaming.RequestModel(model)
		local vehicle = CreateVehicle(model, coords, heading, true, false)
		
		local id = NetworkGetNetworkIdFromEntity(vehicle)

		SetNetworkIdCanMigrate(id, true)
		SetEntityAsMissionEntity(vehicle, false, false)
		SetModelAsNoLongerNeeded(model)

		SetVehicleHasBeenOwnedByPlayer(vehicle, true)
		SetVehicleOnGroundProperly(vehicle)
		SetVehicleNeedsToBeHotwired(vehicle, false)
		SetVehRadioStation(vehicle, 'OFF')
		DecorSetInt(plyVeh, 'indicatorLights', 0)

		RequestCollisionAtCoord(coords)

		while not HasCollisionLoadedAroundEntity(vehicle) do
			Citizen.Wait(100)
		end

		if cb then
			cb(vehicle)
		end
	end)
end

function ESX.Game.SpawnLocalVehicle(modelName, coords, heading, cb)
	local model = (type(modelName) == 'number' and modelName or GetHashKey(modelName))
	coords = ESX.Vector(coords)

	Citizen.CreateThread(function()
		ESX.Streaming.RequestModel(model)
		local vehicle = CreateVehicle(model, coords, heading, false, false)

		SetEntityAsMissionEntity(vehicle, false, false)
		SetModelAsNoLongerNeeded(model)

		SetVehicleHasBeenOwnedByPlayer(vehicle, true)
		SetVehicleOnGroundProperly(vehicle)
		SetVehicleNeedsToBeHotwired(vehicle, false)
		SetVehRadioStation(vehicle, 'OFF')

		RequestCollisionAtCoord(coords)

		while not HasCollisionLoadedAroundEntity(vehicle) do
			Citizen.Wait(100)
		end

		if cb then
			cb(vehicle)
		end
	end)
end

function ESX.Game.IsVehicleEmpty(vehicle)
	local passengers = GetVehicleNumberOfPassengers(vehicle)
	local driverSeatFree = IsVehicleSeatFree(vehicle, -1)
	return passengers == 0 and driverSeatFree
end

function ESX.Game.GetObjects()
	local objects = {}

	for object in EnumerateObjects() do
		table.insert(objects, object)
	end

	return objects
end

function ESX.Game.GetClosestObject(filter, coords)
	local objects = ESX.Game.GetObjects()
	local closestDistance, closestObject = -1, -1

	if type(filter) == 'string' then
		if filter ~= '' then
			filter = {filter}
		end
	end

	if coords == nil then
		coords = GetEntityCoords(PlayerPedId(), false)
	end

	for i = 1, #objects, 1 do
		local foundObject = false

		if filter == nil or (type(filter) == 'table' and #filter == 0) then
			foundObject = true
		else
			local objectModel = GetEntityModel(objects[i])

			for j = 1, #filter, 1 do
				if objectModel == GetHashKey(filter[j]) then
					foundObject = true
					break
				end
			end
		end

		if foundObject then
			local objectCoords = GetEntityCoords(objects[i], false)
			local distance = #(objectCoords - coords)

			if closestDistance == -1 or closestDistance > distance then
				closestObject = objects[i]
				closestDistance = distance
			end
		end
	end

	return closestObject, closestDistance
end

function ESX.Game.GetAllPlayers()
	local clientPlayers = false

	ESX.TriggerServerCallback('esx:getActivePlayers', function(players)
		clientPlayers = players
	end)

	while not clientPlayers do
		Citizen.Wait(100)
	end

	return clientPlayers
end

function ESX.Game.GetPlayers()
	local activePlayers = GetActivePlayers()
	local players = {}

	for i = 1, #activePlayers, 1 do
		local ped = GetPlayerPed(activePlayers[i])

		if DoesEntityExist(ped) then
			table.insert(players, activePlayers[i])
		end
	end

	return players
end

function ESX.Game.GetClosestPlayer(coords)
	local players = ESX.Game.GetPlayers()
	local closestDistance, closestPlayer = -1, -1
	local usePlayerPed, playerId = false, 0

	if coords == nil then
		usePlayerPed = true
		playerId = PlayerId()
		coords = GetEntityCoords(PlayerPedId(), false)
	end

	for i = 1, #players, 1 do
		if not usePlayerPed or (usePlayerPed and players[i] ~= playerId) then
			local targetPed = GetPlayerPed(players[i])
			local targetCoords = GetEntityCoords(targetPed, false)
			local distance = #(targetCoords - coords)

			if closestDistance == -1 or closestDistance > distance then
				closestPlayer = players[i]
				closestDistance = distance
			end
		end
	end

	return closestPlayer, closestDistance
end

function ESX.Game.GetClosestPlayerInRadius(coords,radius)
	local players = ESX.Game.GetPlayers()
	local MyPlayersTable = {}

	if not (coords) then return end
	if not (radius) then return end

	for i =1, #players do 
		local targetPed = GetPlayerPed(players[i])
		local targetCoords = GetEntityCoords(targetPed, false)
		local distance = #(targetCoords - coords)

		if distance <= radius then 
			table.insert(MyPlayersTable, {id = GetPlayerServerId(players[i])})
		end
	end
	return MyPlayersTable
end

function ESX.Game.GetPlayersServerIdsInArea(coords, maxDistance, includePlayer)
	local players = {}
    for _, player in pairs(ESX.Game.GetPlayersInArea(coords, maxDistance, includePlayer)) do
        table.insert(players, GetPlayerServerId(player))
    end
    return players
end

function ESX.Game.GetPlayersInArea(coords, area)
	local players = ESX.Game.GetPlayers()
	local playersInArea = {}

	if coords == nil then
		coords = GetEntityCoords(PlayerPedId(), false)
	end

	for i = 1, #players, 1 do
		local target = GetPlayerPed(players[i])
		local targetCoords = GetEntityCoords(target, false)
		local distance = #(targetCoords - coords)

		if distance <= area then
			table.insert(playersInArea, players[i])
		end
	end

	return playersInArea
end

function ESX.Game.GetVehicles()
	local vehicles = {}

	for vehicle in EnumerateVehicles() do
		table.insert(vehicles, vehicle)
	end

	return vehicles
end

function ESX.Game.GetClosestVehicle(coords)
	local vehicles = ESX.Game.GetVehicles()
	local closestDistance, closestVehicle = -1, -1

	if coords == nil then
		coords = GetEntityCoords(PlayerPedId(), false)
	end

	for i = 1, #vehicles, 1 do
		local vehicleCoords = GetEntityCoords(vehicles[i], false)
		local distance = #(vehicleCoords - coords)

		if closestDistance == -1 or closestDistance > distance then
			closestVehicle, closestDistance = vehicles[i], distance
		end
	end

	return closestVehicle, closestDistance
end

function ESX.Game.GetVehiclesInArea(coords, area)
	local vehicles       = ESX.Game.GetVehicles()
	local vehiclesInArea = {}

	for i=1, #vehicles, 1 do
		local vehicleCoords = GetEntityCoords(vehicles[i])
		local distance      = GetDistanceBetweenCoords(vehicleCoords, coords.x, coords.y, coords.z, true)

		if distance <= area then
			table.insert(vehiclesInArea, vehicles[i])
		end
	end

	return vehiclesInArea
end

function ESX.Game.GetVehiclesInArea2(coords, area)
	local vehicles = ESX.Game.GetVehicles()
	local vehiclesInArea = {}

	if coords == nil then
		coords = GetEntityCoords(PlayerPedId(), false)
	end

	for i = 1, #vehicles, 1 do
		local vehicleCoords = GetEntityCoords(vehicles[i], false)
		local distance = #(vehicleCoords - coords)

		if distance <= area then
			table.insert(vehiclesInArea, vehicles[i])
		end
	end

	return vehiclesInArea
end

function ESX.Game.GetVehicleInDirection()
	local playerPed = PlayerPedId()
	local playerCoords = GetEntityCoords(playerPed, false)
	local inDirection = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 5.0, 0.0)
	local rayHandle = StartShapeTestRay(playerCoords, inDirection, 10, playerPed, 0)
	local numRayHandle, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(rayHandle)

	if hit == 1 and GetEntityType(entityHit) == 2 then
		return entityHit
	end

	return nil
end

function ESX.Game.IsSpawnPointClear(coords, radius)
	local vehicles = ESX.Game.GetVehiclesInArea(coords, radius)
	return #vehicles == 0
end

function ESX.Game.GetPeds(ignoreList)
	local ignoreList = ignoreList or {}
	local peds = {}

	for ped in EnumeratePeds() do
		local found = false

		for j = 1, #ignoreList, 1 do
			if ignoreList[j] == ped then
				found = true
			end
		end

		if not found then
			table.insert(peds, ped)
		end
	end

	return peds
end

function ESX.Game.GetClosestPed(coords, ignoreList)
	ignoreList = ignoreList or {}
	local peds = ESX.Game.GetPeds(ignoreList)
	local closestDistance, closestPed = -1, -1

	if coords == nil then
		coords = GetEntityCoords(PlayerPedId(), false)
	end

	for i = 1, #peds, 1 do
		local pedCoords = GetEntityCoords(peds[i], false)
		local distance = #(pedCoords - coords)

		if closestDistance == -1 or closestDistance > distance then
			closestPed = peds[i]
			closestDistance = distance
		end
	end

	return closestPed, closestDistance
end

function ESX.Game.SpawnPed(pedType, modelName, coords, heading, cb)
	local model = (type(modelName) == 'number' and modelName or GetHashKey(modelName))

	Citizen.CreateThread(function()
		ESX.Streaming.RequestModel(model)
		local ped = CreatePed(pedType, model, coords, heading, true, false)
		local id = NetworkGetNetworkIdFromEntity(ped)

		SetNetworkIdCanMigrate(id, true)
		SetEntityAsMissionEntity(ped, false, false)
		SetModelAsNoLongerNeeded(model)

		RequestCollisionAtCoord(coords)

		--while not HasCollisionLoadedAroundEntity(ped) do
		--	Citizen.Wait(100)
		--end

		if cb then
			cb(ped)
		end
	end)
end

function ESX.Game.SpawnLocalPed(pedType, modelName, coords, heading, cb)
	local model = (type(modelName) == 'number' and modelName or GetHashKey(modelName))

	Citizen.CreateThread(function()
		ESX.Streaming.RequestModel(model)
		local ped = CreatePed(pedType, model, coords, heading, false, false)

		SetEntityAsMissionEntity(ped, false, false)
		SetModelAsNoLongerNeeded(model)

		RequestCollisionAtCoord(coords)

		--while not HasCollisionLoadedAroundEntity(ped) do
		--	Citizen.Wait(100)
		--end

		if cb then
			cb(ped)
		end
	end)
end

function ESX.Game.SpawnLocalPedAsync (pedType, model, coords, heading)
	local p = promise.new()

	ESX.Game.SpawnLocalPed(pedType, model, coords, heading, function (ped)
		p:resolve(ped)
	end)

	return Citizen.Await(p)
end

function ESX.Game.GetVehicleProperties(vehicle)
	if not DoesEntityExist(vehicle) then return {} end

	local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
	local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
	local extras = {}

	for id = 0, 12 do
		if DoesExtraExist(vehicle, id) then
			extras[tostring(id)] = IsVehicleExtraTurnedOn(vehicle, id) == 1
		end
	end

	return {
		model = GetEntityModel(vehicle),

		plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle)),
		plateIndex = GetVehicleNumberPlateTextIndex(vehicle),

		bodyHealth = ESX.Math.Round(GetVehicleBodyHealth(vehicle), 1),
		engineHealth = ESX.Math.Round(GetVehicleEngineHealth(vehicle), 1),

		fuelLevel = ESX.Math.Round(GetVehicleFuelLevel(vehicle), 1),
		dirtLevel = ESX.Math.Round(GetVehicleDirtLevel(vehicle), 1),
		color1 = colorPrimary,
		color2 = colorSecondary,

		pearlescentColor = pearlescentColor,
		wheelColor = wheelColor,

		wheels = GetVehicleWheelType(vehicle),
		windowTint = GetVehicleWindowTint(vehicle),
		xenonColor = GetVehicleXenonLightsColour(vehicle),

		neonEnabled = {
			IsVehicleNeonLightEnabled(vehicle, 0),
			IsVehicleNeonLightEnabled(vehicle, 1),
			IsVehicleNeonLightEnabled(vehicle, 2),
			IsVehicleNeonLightEnabled(vehicle, 3)
		},

		neonColor = table.pack(GetVehicleNeonLightsColour(vehicle)),
		extras = extras,
		tyreSmokeColor = table.pack(GetVehicleTyreSmokeColor(vehicle)),

		modSpoilers = GetVehicleMod(vehicle, 0),
		modFrontBumper = GetVehicleMod(vehicle, 1),
		modRearBumper = GetVehicleMod(vehicle, 2),
		modSideSkirt = GetVehicleMod(vehicle, 3),
		modExhaust = GetVehicleMod(vehicle, 4),
		modFrame = GetVehicleMod(vehicle, 5),
		modGrille = GetVehicleMod(vehicle, 6),
		modHood = GetVehicleMod(vehicle, 7),
		modFender = GetVehicleMod(vehicle, 8),
		modRightFender = GetVehicleMod(vehicle, 9),
		modRoof = GetVehicleMod(vehicle, 10),

		modEngine = GetVehicleMod(vehicle, 11),
		modBrakes = GetVehicleMod(vehicle, 12),
		modTransmission = GetVehicleMod(vehicle, 13),
		modHorns = GetVehicleMod(vehicle, 14),
		modSuspension = GetVehicleMod(vehicle, 15),
		modArmor = GetVehicleMod(vehicle, 16),

		modTurbo = IsToggleModOn(vehicle, 18),
		modSmokeEnabled = IsToggleModOn(vehicle, 20),
		modXenon = IsToggleModOn(vehicle, 22),

		modFrontWheels = GetVehicleMod(vehicle, 23),
		modBackWheels = GetVehicleMod(vehicle, 24),

		modPlateHolder = GetVehicleMod(vehicle, 25),
		modVanityPlate = GetVehicleMod(vehicle, 26),
		modTrimA = GetVehicleMod(vehicle, 27),
		modOrnaments = GetVehicleMod(vehicle, 28),
		modDashboard = GetVehicleMod(vehicle, 29),
		modDial = GetVehicleMod(vehicle, 30),
		modDoorSpeaker = GetVehicleMod(vehicle, 31),
		modSeats = GetVehicleMod(vehicle, 32),
		modSteeringWheel = GetVehicleMod(vehicle, 33),
		modShifterLeavers = GetVehicleMod(vehicle, 34),
		modAPlate = GetVehicleMod(vehicle, 35),
		modSpeakers = GetVehicleMod(vehicle, 36),
		modTrunk = GetVehicleMod(vehicle, 37),
		modHydrolic = GetVehicleMod(vehicle, 38),
		modEngineBlock = GetVehicleMod(vehicle, 39),
		modAirFilter = GetVehicleMod(vehicle, 40),
		modStruts = GetVehicleMod(vehicle, 41),
		modArchCover = GetVehicleMod(vehicle, 42),
		modAerials = GetVehicleMod(vehicle, 43),
		modTrimB = GetVehicleMod(vehicle, 44),
		modTank = GetVehicleMod(vehicle, 45),
		modWindows = GetVehicleMod(vehicle, 46),
		modLivery = GetVehicleLivery(vehicle)
	}
end

function ESX.Game.SetVehicleProperties(vehicle, props)
    if not DoesEntityExist(vehicle) then
        return
    end
    local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
    local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
    SetVehicleModKit(vehicle, 0)

    if props.tyresCanBurst ~= nil then
        SetVehicleTyresCanBurst(vehicle, props.tyresCanBurst)
    end

    if props.plate ~= nil then
        SetVehicleNumberPlateText(vehicle, props.plate)
    end
    if props.plateIndex ~= nil then
        SetVehicleNumberPlateTextIndex(vehicle, props.plateIndex)
    end
    if props.bodyHealth ~= nil then
        SetVehicleBodyHealth(vehicle, props.bodyHealth + 0.0)
    end
    if props.engineHealth ~= nil then
        SetVehicleEngineHealth(vehicle, props.engineHealth + 0.0)
    end
    if props.tankHealth ~= nil then
        SetVehiclePetrolTankHealth(vehicle, props.tankHealth + 0.0)
    end
    if props.fuelLevel ~= nil then
        SetVehicleFuelLevel(vehicle, props.fuelLevel + 0.0)
    end
    if props.dirtLevel ~= nil then
        SetVehicleDirtLevel(vehicle, props.dirtLevel + 0.0)
    end
    if props.customPrimaryColor ~= nil then
        SetVehicleCustomPrimaryColour(vehicle, props.customPrimaryColor[1], props.customPrimaryColor[2], props.customPrimaryColor[3])
    end
    if props.customSecondaryColor ~= nil then
        SetVehicleCustomSecondaryColour(vehicle, props.customSecondaryColor[1], props.customSecondaryColor[2], props.customSecondaryColor[3])
    end
    if props.color1 ~= nil then
        SetVehicleColours(vehicle, props.color1, colorSecondary)
    end
    if props.color2 ~= nil then
        SetVehicleColours(vehicle, props.color1 or colorPrimary, props.color2)
    end
    if props.pearlescentColor ~= nil then
        SetVehicleExtraColours(vehicle, props.pearlescentColor, wheelColor)
    end

    if props.interiorColor ~= nil then
        SetVehicleInteriorColor(vehicle, props.interiorColor)
    end

    if props.dashboardColor ~= nil then
        SetVehicleDashboardColor(vehicle, props.dashboardColor)
    end

    if props.wheelColor ~= nil then
        SetVehicleExtraColours(vehicle, props.pearlescentColor or pearlescentColor, props.wheelColor)
    end
    if props.wheels ~= nil then
        SetVehicleWheelType(vehicle, props.wheels)
    end
    if props.windowTint ~= nil then
        SetVehicleWindowTint(vehicle, props.windowTint)
    end

    if props.neonEnabled ~= nil then
        SetVehicleNeonLightEnabled(vehicle, 0, props.neonEnabled[1])
        SetVehicleNeonLightEnabled(vehicle, 1, props.neonEnabled[2])
        SetVehicleNeonLightEnabled(vehicle, 2, props.neonEnabled[3])
        SetVehicleNeonLightEnabled(vehicle, 3, props.neonEnabled[4])
    end

    if props.extras ~= nil then
        for extraId, enabled in pairs(props.extras) do
            SetVehicleExtra(vehicle, tonumber(extraId), enabled and 0 or 1)
        end
    end

    if props.neonColor ~= nil then
        SetVehicleNeonLightsColour(vehicle, props.neonColor[1], props.neonColor[2], props.neonColor[3])
    end
    if props.xenonColor ~= nil then
        SetVehicleXenonLightsColor(vehicle, props.xenonColor)
    end
    if props.customXenonColor ~= nil then
        SetVehicleXenonLightsCustomColor(vehicle, props.customXenonColor[1], props.customXenonColor[2], props.customXenonColor[3])
    end
    if props.modSmokeEnabled ~= nil then
        ToggleVehicleMod(vehicle, 20, true)
    end
    if props.tyreSmokeColor ~= nil then
        SetVehicleTyreSmokeColor(vehicle, props.tyreSmokeColor[1], props.tyreSmokeColor[2], props.tyreSmokeColor[3])
    end
    if props.modSpoilers ~= nil then
        SetVehicleMod(vehicle, 0, props.modSpoilers, false)
    end
    if props.modFrontBumper ~= nil then
        SetVehicleMod(vehicle, 1, props.modFrontBumper, false)
    end
    if props.modRearBumper ~= nil then
        SetVehicleMod(vehicle, 2, props.modRearBumper, false)
    end
    if props.modSideSkirt ~= nil then
        SetVehicleMod(vehicle, 3, props.modSideSkirt, false)
    end
    if props.modExhaust ~= nil then
        SetVehicleMod(vehicle, 4, props.modExhaust, false)
    end
    if props.modFrame ~= nil then
        SetVehicleMod(vehicle, 5, props.modFrame, false)
    end
    if props.modGrille ~= nil then
        SetVehicleMod(vehicle, 6, props.modGrille, false)
    end
    if props.modHood ~= nil then
        SetVehicleMod(vehicle, 7, props.modHood, false)
    end
    if props.modFender ~= nil then
        SetVehicleMod(vehicle, 8, props.modFender, false)
    end
    if props.modRightFender ~= nil then
        SetVehicleMod(vehicle, 9, props.modRightFender, false)
    end
    if props.modRoof ~= nil then
        SetVehicleMod(vehicle, 10, props.modRoof, false)
    end

    if props.modRoofLivery ~= nil then
        SetVehicleRoofLivery(vehicle, props.modRoofLivery)
    end

    if props.modEngine ~= nil then
        SetVehicleMod(vehicle, 11, props.modEngine, false)
    end
    if props.modBrakes ~= nil then
        SetVehicleMod(vehicle, 12, props.modBrakes, false)
    end
    if props.modTransmission ~= nil then
        SetVehicleMod(vehicle, 13, props.modTransmission, false)
    end
    if props.modHorns ~= nil then
        SetVehicleMod(vehicle, 14, props.modHorns, false)
    end
    if props.modSuspension ~= nil then
        SetVehicleMod(vehicle, 15, props.modSuspension, false)
    end
    if props.modArmor ~= nil then
        SetVehicleMod(vehicle, 16, props.modArmor, false)
    end
    if props.modTurbo ~= nil then
        ToggleVehicleMod(vehicle, 18, props.modTurbo)
    end
    if props.modXenon ~= nil then
        ToggleVehicleMod(vehicle, 22, props.modXenon)
    end
    if props.modFrontWheels ~= nil then
        SetVehicleMod(vehicle, 23, props.modFrontWheels, props.modCustomFrontWheels)
    end
    if props.modBackWheels ~= nil then
        SetVehicleMod(vehicle, 24, props.modBackWheels, props.modCustomBackWheels)
    end
    if props.modPlateHolder ~= nil then
        SetVehicleMod(vehicle, 25, props.modPlateHolder, false)
    end
    if props.modVanityPlate ~= nil then
        SetVehicleMod(vehicle, 26, props.modVanityPlate, false)
    end
    if props.modTrimA ~= nil then
        SetVehicleMod(vehicle, 27, props.modTrimA, false)
    end
    if props.modOrnaments ~= nil then
        SetVehicleMod(vehicle, 28, props.modOrnaments, false)
    end
    if props.modDashboard ~= nil then
        SetVehicleMod(vehicle, 29, props.modDashboard, false)
    end
    if props.modDial ~= nil then
        SetVehicleMod(vehicle, 30, props.modDial, false)
    end
    if props.modDoorSpeaker ~= nil then
        SetVehicleMod(vehicle, 31, props.modDoorSpeaker, false)
    end
    if props.modSeats ~= nil then
        SetVehicleMod(vehicle, 32, props.modSeats, false)
    end
    if props.modSteeringWheel ~= nil then
        SetVehicleMod(vehicle, 33, props.modSteeringWheel, false)
    end
    if props.modShifterLeavers ~= nil then
        SetVehicleMod(vehicle, 34, props.modShifterLeavers, false)
    end
    if props.modAPlate ~= nil then
        SetVehicleMod(vehicle, 35, props.modAPlate, false)
    end
    if props.modSpeakers ~= nil then
        SetVehicleMod(vehicle, 36, props.modSpeakers, false)
    end
    if props.modTrunk ~= nil then
        SetVehicleMod(vehicle, 37, props.modTrunk, false)
    end
    if props.modHydrolic ~= nil then
        SetVehicleMod(vehicle, 38, props.modHydrolic, false)
    end
    if props.modEngineBlock ~= nil then
        SetVehicleMod(vehicle, 39, props.modEngineBlock, false)
    end
    if props.modAirFilter ~= nil then
        SetVehicleMod(vehicle, 40, props.modAirFilter, false)
    end
    if props.modStruts ~= nil then
        SetVehicleMod(vehicle, 41, props.modStruts, false)
    end
    if props.modArchCover ~= nil then
        SetVehicleMod(vehicle, 42, props.modArchCover, false)
    end
    if props.modAerials ~= nil then
        SetVehicleMod(vehicle, 43, props.modAerials, false)
    end
    if props.modTrimB ~= nil then
        SetVehicleMod(vehicle, 44, props.modTrimB, false)
    end
    if props.modTank ~= nil then
        SetVehicleMod(vehicle, 45, props.modTank, false)
    end
    if props.modWindows ~= nil then
        SetVehicleMod(vehicle, 46, props.modWindows, false)
    end

    if props.modLivery ~= nil then
        SetVehicleMod(vehicle, 48, props.modLivery, false)
        SetVehicleLivery(vehicle, props.modLivery)
    end

    if props.windowsBroken ~= nil then
        for k, v in pairs(props.windowsBroken) do
            if v then
                RemoveVehicleWindow(vehicle, tonumber(k))
            end
        end
    end

    if props.doorsBroken ~= nil then
        for k, v in pairs(props.doorsBroken) do
            if v then
                SetVehicleDoorBroken(vehicle, tonumber(k), true)
            end
        end
    end

    if props.tyreBurst ~= nil then
        for k, v in pairs(props.tyreBurst) do
            if v then
                SetVehicleTyreBurst(vehicle, tonumber(k), true, 1000.0)
            end
        end
    end
end

function ESX.Game.Utils.DrawText3D(coords, text, size, font)
	local camCoords = GetGameplayCamCoords()
	local distance = #(coords - camCoords)

	if not size then
		size = 1
	end

	if not font then
		font = 0
	end

	local scale = (size / distance) * 2
	local fov = (1 / GetGameplayCamFov()) * 100
	scale = scale * fov

	SetTextScale(0.0 * scale, 0.55 * scale)
	SetTextFont(font)
	SetTextColour(255, 255, 255, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)

	SetDrawOrigin(coords, 0)
	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(0.0, 0.0)
	ClearDrawOrigin()
end

RegisterNetEvent('esx:serverCallback')
AddEventHandler('esx:serverCallback', function(requestId, ...)
	ESX.ServerCallbacks[requestId](...)
	ESX.ServerCallbacks[requestId] = nil
end)

RegisterNetEvent('esx:showNotification')
AddEventHandler('esx:showNotification', ESX.ShowNotification)

RegisterNetEvent('esx:showAdvancedNotification')
AddEventHandler('esx:showAdvancedNotification', ESX.ShowAdvancedNotification)

RegisterNetEvent('esx:showHelpNotification')
AddEventHandler('esx:showHelpNotification', ESX.ShowHelpNotification)

-- SetTimeout
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		local currTime = GetGameTimer()

		for i = 1, #ESX.TimeoutCallbacks, 1 do
			if ESX.TimeoutCallbacks[i] then
				if currTime >= ESX.TimeoutCallbacks[i].time then
					ESX.TimeoutCallbacks[i].cb()
					ESX.TimeoutCallbacks[i] = nil
				end
			end
		end
	end
end)

function ESX.ItemPerm(item) 
	if Config.ItemPerm[item] then
		return true 
	else 
		return false
	end
end

function ESX.ArmesPerms(weapon)
	if Config.ArmesPerms[weapon] then
		return true 
	else 
		return false
	end
end

Citizen.CreateThread(function()
	Wait(1500)
	TriggerServerEvent('xPlayer.GetMyIdentifier')
end)

local MyIdentifier = {}
RegisterNetEvent('xPlayer.GetMyIdentifier', function(identifier)
	MyIdentifier = identifier
end)

function ESX.GetMyIdentifier()
	return MyIdentifier
end

function ESX.TsE(eventName, ...)
	TriggerServerEvent(eventName, ...)
end

function ESX.isJail()
	return playerInJail
end

function ESX.hasWeapon(name)
	for _, weapon in pairs(ESX.PlayerData.loadout) do
        if weapon.name == name then
            return true
        end
    end
    return false
end

function ESX.BanPlayer(reason, ...)
	local text = reason:format(...)
	TriggerServerEvent('anticheat:banPlayer', text)
end

function ESX.ShowFloatingHelpNotification(msg, coords)
	if coords == nil then return print('EROOR COORDS IS NIL FOR FUNCTION ShowFloatingHelpNotification') end
	if coords then
		AddTextEntry('esxFloatingHelpNotification', msg)
		SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
		BeginTextCommandDisplayHelp('esxFloatingHelpNotification')
		EndTextCommandDisplayHelp(2, false, false, -1)
		SetFloatingHelpTextWorldPosition(1, table.unpack(coords))
	end
end

function ESX.isHandsUp(playerPed)
	return IsEntityPlayingAnim(playerPed, 'random@mugging3', 'handsup_standing_base', 3) or IsEntityPlayingAnim(playerPed, 'missminuteman_1ig_2', 'handsup_base', 3)
end

ESX.UsableItemsCallbacks = {}

function ESX.GetUsableItem(item)
	print(item, ESX.UsableItemsCallbacks[item])
	return ESX.UsableItemsCallbacks[item]
end


RegisterNetEvent('kayscore:frammework:recieveItemsUsable', function(name)
	ESX.UsableItemsCallbacks = name
end)

function ESX.Config(ConvarName)
	local retval = GetConvar(ConVarName, "")

	local p = promise:new()

	p:resolve(retval)

	return Citizen.Await(p)
end
function ESX.GetColorPickerInput (title, default)
	default = default ~= nil and default or "#eb4034"

	local input = lib.inputDialog(title, {
		{ type = 'color', label = title, format = "hex", default = '#eb4034' }
	})

	if input == nil or input[1] == nil or input[1] == "" then
		return { r = 0, g = 0, b = 0, a = 255 }
	end

	local value = input[1]

	if value == nil or type(value) ~= "string" then
		return { r = 0, g = 0, b = 0, a = 255 }
	end

	value = value:gsub("#", "")

    local r = tonumber(value:sub(1, 2), 16)
    local g = tonumber(value:sub(3, 4), 16)
    local b = tonumber(value:sub(5, 6), 16)

	return { r = r, g = g, b = b, a = a }
end

function ESX.GetDateInput (title)
	local input = lib.inputDialog(
		title,
		{
			{ type = "date", label = title, default = true, format = "DD/MM/YYYY" }
		},
        { allowCancel = true }
	)

	if input == nil or input[1] == nil or input[1] == "" then
		return nil
	end

	return input[1]
end

function ESX.ConfirmDialog (title, content)
	local input = lib.alertDialog({
		header = title,
		content = content,
		centered = true,
		cancel = true
	})

	if input == "confirm" then
		return true
	end

	return false
end
function ESX.GetTextInput (title)
	local input = lib.inputDialog(
		title,
		{
			{ type = "input", label = title }
		},
		{ allowCancel = true }
	)

	if input == nil or input[1] == nil or #input[1] == 0 or input[1] == "" then
		return nil
	end

	return input[1]
end
function ESX.getAccountMoney(account)
    for k,v in pairs(ESX.PlayerData.accounts) do
        if v.name == account then
            return ESX.Math.GroupDigits(v.money)
        end
    end

    return 0
end
function ESX.GetNumberInput (title, min, max, default)
	min = min ~= nil and min or 0
	max = max ~= nil and max or 100000000000

	local input = lib.inputDialog(
        title,
        {
            { type = "number", label = title, min = min, max = max, default = default }
        },
        { allowCancel = true }
    )

	if input == nil then
		return nil
	end

	local value = tonumber(input[1])

	if (value == nil) or type(value) ~= "number" then
		return nil
	end

	if input == nil or input[1] == nil or input[1] == "" then
		return nil
	end

    return input[1]
end
function ESX.GetTextareaInput (title)
	local input = lib.inputDialog(
		title,
		{
			{ type = "textarea", label = title, autosize = true }
		},
		{ allowCancel = true }
	)

	if input == nil or input[1] == nil or #input[1] == 0 or input[1] == "" then
		return nil
	end

	return input[1]
end


local HealthCache = 200
local ArmorCache = 0
local HealthLoaded = false
local ArmorLoaded = false

RegisterNetEvent('kayscore:viePlayers')
AddEventHandler('kayscore:viePlayers', function(vie)
    while not ESXLoaded do Wait(1) end
    Wait(2000)
    if not HealthLoaded then 
        if vie <= 99 then
            SetEntityHealth(PlayerPedId(), HealthCache)
            HealthLoaded = true
            print('^4Vie chargée')
        else
            SetEntityHealth(PlayerPedId(), tonumber(vie))
            HealthCache = tonumber(vie)
            HealthLoaded = true
            print('^4Vie chargée')
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(30000)
        local currentHealth = GetEntityHealth(PlayerPedId())
        local currentArmor = GetPedArmour(PlayerPedId())

        if not HealthLoaded or currentHealth ~= HealthCache then
            HealthCache = currentHealth
            HealthLoaded = true
            TriggerServerEvent('kayscore:SavePlayersData', currentHealth, currentArmor)
        end

        if not ArmorLoaded or currentArmor ~= ArmorCache then
            ArmorCache = currentArmor
            ArmorLoaded = true
            TriggerServerEvent('kayscore:SavePlayersData', currentHealth, currentArmor)
        end
    end
end)