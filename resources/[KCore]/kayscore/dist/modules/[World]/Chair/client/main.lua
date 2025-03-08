-- Variables --
local Models = nil
local PolyZones = nil

local metadata = {
	isSitting = false,
	isLaying = false,
	entity = 0,
	poly = false,
	type = nil,
	lastPos = nil,
	targetPos = nil,
	teleportOut = false,
	unregister = false,
	doingTaskGo = false,
	frozen = false,
	plyFrozen = false,
	animation = {},
	scenario = false
}

local sittingScenarios = {
	"WORLD_HUMAN_SEAT_LEDGE", "WORLD_HUMAN_SEAT_LEDGE_EATING", "WORLD_HUMAN_SEAT_STEPS", "WORLD_HUMAN_SEAT_WALL", "WORLD_HUMAN_SEAT_WALL_EATING", "WORLD_HUMAN_SEAT_WALL_TABLET", 
	"PROP_HUMAN_SEAT_ARMCHAIR", "PROP_HUMAN_SEAT_BAR", "PROP_HUMAN_SEAT_BENCH", "PROP_HUMAN_SEAT_BENCH_FACILITY", "PROP_HUMAN_SEAT_BENCH_DRINK", "PROP_HUMAN_SEAT_BENCH_DRINK_FACILITY", 
	"PROP_HUMAN_SEAT_BENCH_DRINK_BEER", "PROP_HUMAN_SEAT_BENCH_FOOD", "PROP_HUMAN_SEAT_BENCH_FOOD_FACILITY", "PROP_HUMAN_SEAT_BUS_STOP_WAIT", "PROP_HUMAN_SEAT_CHAIR", 
	"PROP_HUMAN_SEAT_CHAIR_DRINK", "PROP_HUMAN_SEAT_CHAIR_DRINK_BEER", "PROP_HUMAN_SEAT_CHAIR_FOOD", "PROP_HUMAN_SEAT_CHAIR_UPRIGHT", "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", 
	"PROP_HUMAN_SEAT_COMPUTER", "PROP_HUMAN_SEAT_COMPUTER_LOW", "PROP_HUMAN_SEAT_DECKCHAIR", "PROP_HUMAN_SEAT_DECKCHAIR_DRINK", "PROP_HUMAN_SEAT_MUSCLE_BENCH_PRESS", 
	"PROP_HUMAN_SEAT_MUSCLE_BENCH_PRESS_PRISON", "PROP_HUMAN_SEAT_SEWING", "PROP_HUMAN_SEAT_STRIP_WATCH", "PROP_HUMAN_SEAT_SUNLOUNGER"
}

-- Functions --
function LoadAnimDict(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(10)
	end
end

local function GetAmountOfSeats(model)
	return #Models[model].sit.seats
end

local function GetNearbyPeds()
	local handle, ped = FindFirstPed()
	local success = false
	local peds = {}
	repeat
		peds[#peds+1] = ped
		success, ped = FindNextPed(handle)
	until not success
	EndFindPed(handle)
	return peds
end

local function GetDifference(num1, num2)
	if num1 > num2 then
		return num1 - num2
	else
		return num2 - num1
	end
end

local function HandleLooseEntity(entity)
	if not IsEntityPositionFrozen(entity) then
		if not NetworkGetEntityIsNetworked(entity) then
			NetworkRegisterEntityAsNetworked(entity)
			metadata.unregister = true
		end
		NetworkRequestControlOfEntity(entity)
		FreezeEntityPosition(entity, true)
		metadata.frozen = true
	end
end

local function UnhandleLooseEntity(entity)
	if metadata.frozen then
		FreezeEntityPosition(entity, false)
		if metadata.unregister then
			NetworkUnregisterNetworkedEntity(entity)
			metadata.unregister = false
		end
		metadata.frozen = false
	end
end

local function HeadingToRotation(heading)
    local rotation = heading
    if rotation > 180.0 then
        rotation = 180.0 - GetDifference(rotation, 180.0)
        rotation = rotation*-1 
    end
    return rotation
end

local function GetOffsetFromCoordsInWorldCoords(position, rotation, offset)
	local rotX, rotY, rotZ = math.rad(rotation.x), math.rad(rotation.y), math.rad(rotation.z)
	local matrix = {}

    matrix[1] = {}
    matrix[1][1] = math.cos(rotZ) * math.cos(rotY) - math.sin(rotZ) * math.sin(rotX) * math.sin(rotY)
    matrix[1][2] = math.cos(rotY) * math.sin(rotZ) + math.cos(rotZ) * math.sin(rotX) * math.sin(rotY)
    matrix[1][3] = -math.cos(rotX) * math.sin(rotY)
    matrix[1][4] = 1

    matrix[2] = {}
    matrix[2][1] = -math.cos(rotX) * math.sin(rotZ)
    matrix[2][2] = math.cos(rotZ) * math.cos(rotX)
    matrix[2][3] = math.sin(rotX)
    matrix[2][4] = 1

    matrix[3] = {}
    matrix[3][1] = math.cos(rotZ) * math.sin(rotY) + math.cos(rotY) * math.sin(rotZ) * math.sin(rotX)
    matrix[3][2] = math.sin(rotZ) * math.sin(rotY) - math.cos(rotZ) * math.cos(rotY) * math.sin(rotX)
    matrix[3][3] = math.cos(rotX) * math.cos(rotY)
    matrix[3][4] = 1

    matrix[4] = {}
    matrix[4][1], matrix[4][2], matrix[4][3] = position.x, position.y, position.z
    matrix[4][4] = 1

    local x = offset.x * matrix[1][1] + offset.y * matrix[2][1] + offset.z * matrix[3][1] + matrix[4][1]
    local y = offset.x * matrix[1][2] + offset.y * matrix[2][2] + offset.z * matrix[3][2] + matrix[4][2]
    local z = offset.x * matrix[1][3] + offset.y * matrix[2][3] + offset.z * matrix[3][3] + matrix[4][3]

    return vector3(x, y, z)
end

local function IsEntityPlayingAnyLayAnim(entity)
	local checked = {}
	for type, settings in pairs(Config_Chair.Chair.LayTypes) do
		local anim = settings.animation
		if not checked[anim.dict] then
			if IsEntityPlayingAnim(entity, anim.dict, anim.name, 3) then
				return true
			else
				checked[anim.dict] = true
			end
		end
	end
	return false
end

local function IsPedSitting(ped)
	local checked = {}
	for index, scenario in pairs(sittingScenarios) do
		if IsPedUsingScenario(ped, scenario) then
			return true
		end
	end
	return false
end

local function IsSeatAvailable(coords, action)
	local playerPed = GetPlayerPed(-1)
	for index, ped in pairs(GetNearbyPeds()) do
		if ped ~= playerPed then
			local dist = #(GetEntityCoords(ped)-coords)
			if dist < 1.35 then
				if action == 'sit' then
					if IsEntityPlayingAnyLayAnim(ped) or dist < 0.55 then
						return false
					end
				elseif action == 'lay' then
					if IsEntityPlayingAnyLayAnim(ped) or IsPedSitting(ped) then
						return false
					end
				end
			end
		end
	end
	return true
end

local function SeatSort(a, b)
    return a.dist < b.dist
end

local function SortSeatsByDistance(seatCoords, seatHeading, seatOffsets, raycast)
    local seats = {}
    local coords = GetEntityCoords(GetPlayerPed(-1))
	local rotation = vector3(0.0, 0.0, HeadingToRotation(seatHeading))

	if raycast and Config_Chair.Chair.Target and Config_Chair.Chair.UseTargetingCoords then
		local flag = -1
		local hit, endCoords, entityHit, entityType = false, nil, nil, nil
		if Config_Chair.Chair.Target == 'qtarget' then
			hit, endCoords, entityHit, entityType = exports.qtarget.raycast(flag)
		else
			hit, endCoords, entityHit, entityType = exports['qb-target']:RaycastCamera(flag)
		end

		if endCoords and endCoords ~= vector3(0.0, 0.0, 0.0) then
			coords = endCoords
		end
	end

    for k, v in pairs(seatOffsets) do
        seats[k] = {}
        seats[k].coords = GetOffsetFromCoordsInWorldCoords(seatCoords, rotation, v)
        seats[k].dist = #(coords-seats[k].coords)
		seats[k].offset = v
    end
    table.sort(seats, SeatSort)

    return seats
end

local function GetAvailableSeat(seatCoords, seatHeading, seats, raycast)
	local coords = nil
    local offset = nil
	local heading = nil
	local sortedSeats = SortSeatsByDistance(seatCoords, seatHeading, seats, raycast)

	for index, data in pairs(sortedSeats) do
		if IsSeatAvailable(data.coords, 'sit') then
			offset = data.offset
			coords = data.coords
			heading = seatHeading

			heading = heading + offset.w
			if heading > 360.0 then
				heading = heading - 360.0
			end
			break
		end
	end

	return coords, offset, heading
end

local function LeaveSeat(clearTask, clearTaskImmediately, waitIfAttached)
	metadata.isSitting = false
	metadata.isLaying = false
	metadata.scenario = false

	if metadata.plyFrozen then
		SetEntityCollision(GetPlayerPed(-1), true, false)
		FreezeEntityPosition(GetPlayerPed(-1), false)
		metadata.plyFrozen = false
	end

	if metadata.entity ~= 0 then 
		UnhandleLooseEntity(metadata.entity)
		metadata.entity = 0
	end

	if clearTask or clearTaskImmediately then
		if waitIfAttached then
			-- Wait until the person is no longer attached to another ped (aka. getting escorted or carried).
			Citizen.CreateThread(function()
				while true do
					if not IsEntityAttachedToAnyPed(GetPlayerPed(-1)) then
						break
					end
					Citizen.Wait(200)
				end
				ClearPedTasksImmediately(GetPlayerPed(-1))
			end)
		elseif clearTask then
			ClearPedTasks(GetPlayerPed(-1))
		else
			ClearPedTasksImmediately(GetPlayerPed(-1))
		end
	end
end

local function StopSitting()
	if metadata.lastPos and (Config_Chair.Chair.AlwaysTeleportOutOfSeat or Config_Chair.Chair.TeleportToLastPosWhenNoRoute or Config_Chair.Chair.SitTypes[metadata.type].teleportOut or metadata.teleportOut) then
		ClearPedTasksImmediately(GetPlayerPed(-1))
		SetEntityCoords(GetPlayerPed(-1), vector3(metadata.lastPos.x, metadata.lastPos.y, metadata.lastPos.z-0.95))
	end
	LeaveSeat(true, false, false)
end

local function GetScenario(type)
	local list = Config_Chair.Chair.SitTypes[type].scenarios
	if not list then return false end

	local scenarios = {}
	local index = 0
	for row, scenario in pairs(list) do
		index = index + 1
		scenarios[index] = scenario
	end
	local random = math.floor(math.random(100, index*100)/100 + 0.5)
	return scenarios[random]
end

local function IsPlayerDoingAnyAction()
	if IsPedUsingScenario(GetPlayerPed(-1), metadata.scenario) or metadata.isSitting or metadata.isLaying then
		return true
	else
		return false
	end
end

local function SitOnSeat(data)
	metadata.entity = data.entity
	metadata.poly = data.poly
	metadata.type = data.sit.type

    local seat = data.sit
	local settings = Config_Chair.Chair.SitTypes[seat.type]
	local seatCoords = nil
	local seatHeading = nil

	if not settings then
		print("^3Warning: No settings were set for type^2", seat.type, "^3 in Config_Chair.Chair.SitTypes, the default settings were used instead!")
		seat.type = 'default'
		settings = Config_Chair.Chair.SitTypes['default']
	end

	if data.entity then 
		local rot = GetEntityRotation(data.entity)
		local xRot = rot.x
		local yRot = rot.y

		if xRot < 0.0 then xRot = xRot*-1 end
		if yRot < 0.0 then yRot = yRot*-1 end

		local tilt = xRot + yRot
		if tilt > Config_Chair.Chair.MaxTilt then
			ESX.ShowNotification(Config_Chair.Chair.Lang.TooTilted)
			return
		end

		seatCoords = GetEntityCoords(data.entity)
		seatHeading = GetEntityHeading(data.entity)
	else
		seatCoords = seat.seats[1].xyz
		seatHeading = 0
	end

	local coords, offset, heading = GetAvailableSeat(seatCoords, seatHeading, seat.seats, data.raycast)
    if coords == nil then
		local model = GetEntityModel(data.entity)
        if model ~= 0 and GetAmountOfSeats(model) ~= 1 then
			ESX.ShowNotification(Config_Chair.Chair.Lang.NoAvailable)
        else
            ESX.ShowNotification(Config_Chair.Chair.Lang.Occupied)
        end
        return
    end

    if offset == nil or heading == nil then
        ESX.ShowNotification(Config_Chair.Chair.Lang.NoAvailable)
		print('^1Error: Either offset or heading was nil!', offset, heading)
        return
    end

	local playerPed = GetPlayerPed(-1)
	local lastPos = GetEntityCoords(playerPed)

	metadata.teleportOut = false
	metadata.lastPos = nil
	if Config_Chair.Chair.AlwaysTeleportOutOfSeat or settings.teleportOut or seat.teleportOut then
		metadata.teleportOut = true
		metadata.lastPos = lastPos
	end

	-- If we are already sitting then leave the current seat first, however if we are attempting to sit on the current seat then stop sitting.
	if metadata.isSitting or metadata.isLaying then
		if #(coords-lastPos) < 0.2 then
			StopSitting()
			return
		else
			if metadata.teleportOut then
				LeaveSeat(false, true, false)
			else
				LeaveSeat(true, false, false)
				Citizen.Wait(2000)
			end
			metadata.entity = data.entity
		end
	end

	metadata.isLaying = false
	metadata.scenario = GetScenario(seat.type)
	metadata.animation = {}

	ClearPedTasks(playerPed)
	if data.entity ~= 0 then
		HandleLooseEntity(data.entity)
	end

	local timeout = settings.timeout
	local skipGoStraightTask = settings.skipGoStraightTask
	local prevDist = #(coords.xy - GetEntityCoords(playerPed).xy)
	local dist = prevDist
	local teleport = Config_Chair.Chair.AlwaysTeleportToSeat or seat.teleportIn or settings.teleportIn
	local breakCounter = 0
	local tick = 0

	if not teleport and not skipGoStraightTask then
		local rotation = HeadingToRotation(heading)
		local gotoCoords = GetOffsetFromCoordsInWorldCoords(coords, vector3(0.0, 0.0, rotation), vector3(0.0, 0.695, 0.0))
		TaskGoStraightToCoord(playerPed, gotoCoords, 1, timeout*500, heading, 0.15)
		metadata.doingTaskGo = true

		while true do
			Citizen.Wait(500)
			if not metadata.doingTaskGo then
				return
			end

			local playerCoords = GetEntityCoords(playerPed)
			dist = #(gotoCoords.xy - playerCoords.xy)
			tick = tick + 1

			if dist < prevDist then 
				lastPos = playerCoords 
				prevDist = dist
			end

			local diff = GetDifference(dist, prevDist)
			local taskStatus = GetScriptTaskStatus(playerPed, "SCRIPT_TASK_GO_STRAIGHT_TO_COORD") 

			if taskStatus == 0 or taskStatus == 7 then
				break
			elseif tick > timeout then
				break
			elseif dist > prevDist+0.1 and dist > 0.85 then
				breakCounter = breakCounter + 1
			elseif diff <= 0.085 and dist < Config_Chair.Chair.MaxInteractionDist and dist > 0.05 and tick > 1 then
				breakCounter = breakCounter + 1
			else
				breakCounter = breakCounter - 1
				if breakCounter < 0 then
					breakCounter = 0
				end
			end

			if breakCounter > 2 and seat.type ~= "sunlounger" then
				break
			end
		end
		teleport = dist > 0.5 or false
		tick = 0
	end

	if metadata.scenario then
		metadata.targetPos = coords
		TaskStartScenarioAtPosition(playerPed, metadata.scenario, coords.x, coords.y, coords.z, heading, -1, false, teleport)

		while true do
			Citizen.Wait(500)
			local playerCoords = GetEntityCoords(playerPed)
			dist = #(coords.xy - playerCoords.xy)
			tick = tick + 1

			local taskStatus = GetScriptTaskStatus(playerPed, "SCRIPT_TASK_START_SCENARIO_AT_POSITION") --0xBE86C566
			if taskStatus == 0 or taskStatus == 7 then
				break
			elseif IsPedUsingScenario(playerPed, metadata.scenario) and dist < 0.40 then
				metadata.isSitting = true
				break
			elseif tick > timeout then
				break
			elseif not IsPedUsingScenario(playerPed, metadata.scenario) then
				break
			end
		end
	else
		local animation = settings.animation
		if animation.offset then
			coords = coords+animation.offset.xyz
			heading = heading+animation.offset.w

			metadata.targetPos = coords
		end

		SetEntityCollision(playerPed, false, false)
		FreezeEntityPosition(playerPed, true)
		SetEntityCoords(playerPed, coords)
		SetEntityHeading(playerPed, heading)

		LoadAnimDict(animation.dict)
		TaskPlayAnim(playerPed, animation.dict, animation.name, 2.0, 2.0, -1, 1, 0, false, false, false)
		RemoveAnimDict(animation.dict)
		metadata.plyFrozen = true
		metadata.isSitting = true
		metadata.animation = animation
	end

	metadata.doingTaskGo = false
	if metadata.isSitting then
		Citizen.Wait(350)
		TriggerEvent('sit:helpTextThread', 'isSitting')
		TriggerEvent('sit:checkThread', 'isSitting')
	elseif dist <= 2.0 then
		TaskStartScenarioAtPosition(playerPed, metadata.scenario, coords.x, coords.y, coords.z, heading, -1, false, true)
		metadata.lastPos = lastPos
		metadata.isSitting = true

		Citizen.Wait(350)
		TriggerEvent('sit:helpTextThread', 'isSitting')
		TriggerEvent('sit:checkThread', 'isSitting')
	else
		LeaveSeat(true, false, false)
	end
end

local function CanPlayerReachSeat(destination, entity)
	local ped = GetPlayerPed(-1)
	local coords = GetEntityCoords(ped)
	local start = vector3(coords.x, coords.y, coords.z+0.25)
	local rayHandle = StartShapeTestLosProbe(start, destination, -1, ped, 0)
	while true do
		Citizen.Wait(0)
		local result, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(rayHandle)
		if result ~= 1 then
			if GetEntityType(entityHit) ~= 1 then
				local dist = #(endCoords-destination)
				if (dist < 0.5 or endCoords.x == 0.0) or entityHit == entity then
					return true
				else
					return false
				end
			else
				rayHandle = StartShapeTestLosProbe(GetEntityCoords(entityHit), destination, -1, entityHit, 0)
			end
		end
	end
end

local function SitOnClosestSeat()
	local coords = GetEntityCoords(GetPlayerPed(-1))
    local chair = {
		entity = 0,
		dist = Config_Chair.Chair.MaxDetectionDist
	}

    for model, data in pairs(Models) do
		if data.sit then
			local newChair = GetClosestObjectOfType(coords.x, coords.y, coords.z, Config_Chair.Chair.MaxDetectionDist, model, false, true, true)
			if newChair ~= 0 then
				local dist = #(GetEntityCoords(newChair) - coords)
				if dist < chair.dist then
					chair.entity = newChair
					chair.dist = dist
				end
			end
		end
    end

	for group, data in pairs(PolyZones) do
		if data.enabled then
			if not data.radius or (#(data.center.xy - coords.xy) < data.radius) then
				for name, info in pairs(data.polys) do
					if info.sit then
						for indexName, seat in pairs(info.sit.seats) do
							local dist = #(seat.xyz - coords) 
							if dist < chair.dist then
								chair.name = name
								chair.group = group
								chair.dist = dist
							end
						end
					end
				end
			end
		end
	end

	if chair.name ~= nil then
		local seat = PolyZones[chair.group].polys[chair.name]
		local destination = seat.poly.center or seat.sit.seats[1].xyz

		if seat.sit.skipSeeCheck or CanPlayerReachSeat(destination, 0) then
			SitOnSeat({entity = 0, poly = chair.name, sit = { type = seat.sit.type, teleportIn = seat.sit.teleportIn, seats = seat.sit.seats }, raycast = false})
		else
			ESX.ShowNotification(Config_Chair.Chair.Lang.CannotReachSeat)
		end
	elseif chair.entity ~= 0 then
		local skipSeeCheck = Models[GetEntityModel(chair.entity)].sit.skipSeeCheck
		if skipSeeCheck or CanPlayerReachSeat(GetEntityCoords(chair.entity), chair.entity) then
			SitOnSeat({entity = chair.entity, poly = false, sit = Models[GetEntityModel(chair.entity)].sit, raycast = false})
		else
			ESX.ShowNotification(Config_Chair.Chair.Lang.CannotReachSeat)
		end
	else
		ESX.ShowNotification(Config_Chair.Chair.Lang.NoFound)
	end
end

local function LayDownOnBed(data)
	metadata.isSitting = false
	metadata.plyFrozen = true
	metadata.scenario = false
	metadata.teleportOut = false
	metadata.entity = data.entity
	metadata.type = data.bed.type

    local bed = data.bed
	local bedCoords = nil
	local bedHeading = nil

	if data.entity then 
		local rot = GetEntityRotation(data.entity)
		local xRot = rot.x
		local yRot = rot.y

		if xRot < 0.0 then xRot = xRot*-1 end
		if yRot < 0.0 then yRot = yRot*-1 end

		local tilt = xRot + yRot
		if tilt > Config_Chair.Chair.MaxTilt then
			ESX.ShowNotification(Config_Chair.Chair.Lang.TooTilted)
			return
		end

		bedCoords = GetEntityCoords(data.entity)
		bedHeading = GetEntityHeading(data.entity)
	else
		bedCoords = bed.seats[1].xyz
		bedHeading = 0
	end

	local coords, offset, heading = GetAvailableSeat(bedCoords, bedHeading, bed.seats, data.raycast)
    if coords == nil then
		local model = GetEntityModel(data.entity)
        if Config_Chair.Chair.SitTypes[bed.type] and GetAmountOfSeats(model) ~= 1 then
			ESX.ShowNotification(Config_Chair.Chair.Lang.NoAvailable)
        else
            ESX.ShowNotification(Config_Chair.Chair.Lang.Occupied)
        end
        return
    end

    if offset == nil or heading == nil then
        ESX.ShowNotification(Config_Chair.Chair.Lang.NoAvailable)
		print('^1Error: Either offset or heading was nil!', offset, heading)
        return
    end

	if not IsSeatAvailable(coords, 'lay') then
		ESX.ShowNotification(Config_Chair.Chair.Lang.OccupiedLay)
		return
	end

	local playerPed = GetPlayerPed(-1)
	if Config_Chair.Chair.AlwaysTeleportOutOfSeat or Config_Chair.Chair.LayTypes[bed.type].teleportOut or bed.teleportOut then
		metadata.teleportOut = true
		metadata.lastPos = GetEntityCoords(playerPed)
	end

	local animation = nil
	if Config_Chair.Chair.LayTypes[bed.type] then
		animation = Config_Chair.Chair.LayTypes[bed.type].animation
	else
		print("^3Warning: No animation settings were set for type^2", bed.type, "^3 in Config_Chair.Chair.LayTypes, the default animation settings were used instead!")
		animation = Config_Chair.Chair.LayTypes['default'].animation
	end

	metadata.animation = animation
	if animation.offset then
		coords = GetOffsetFromCoordsInWorldCoords(coords, vector3(0.0, 0.0, HeadingToRotation(heading)), animation.offset.xyz)
		heading = heading+animation.offset.w
		if heading > 360 then 
			heading = heading - 360 
		end
	end

	LoadAnimDict(animation.dict)
	ClearPedTasksImmediately(playerPed)
	SetEntityCollision(playerPed, false, false)
	FreezeEntityPosition(playerPed, true)
	SetEntityCoords(playerPed, coords)
	SetEntityHeading(playerPed, heading)

	TaskPlayAnim(playerPed, animation.dict, animation.name, 2.0, 2.0, -1, 1, 0, false, false, false)
	RemoveAnimDict(animation.dict)

	metadata.isLaying = true
	metadata.targetPos = coords
	TriggerEvent('sit:helpTextThread', 'isLaying')
	TriggerEvent('sit:checkThread', 'isLaying')
end

local function LayDownOnClosestBed()
	local coords = GetEntityCoords(GetPlayerPed(-1))
    local bed = {
		entity = 0,
		dist = Config_Chair.Chair.MaxDetectionDist
	}

	for model, data in pairs(Models) do
		if data.lay then
			local newBed = GetClosestObjectOfType(coords.x, coords.y, coords.z, Config_Chair.Chair.MaxDetectionDist, model, false, true, true)
			if newBed ~= 0 then
				local dist = #(GetEntityCoords(newBed) - coords)
				if dist < bed.dist then
					bed.entity = newBed
					bed.dist = dist
				end
			end
		end
    end

	for group, data in pairs(PolyZones) do
		if data.enabled then
			if not data.radius or (#(data.center.xy - coords.xy) < data.radius) then
				for name, info in pairs(data.polys) do
					if info.lay then
						local dist = #(info.lay.seats[1].xyz - coords) 
						if dist < bed.dist then
							bed.name = name
							bed.group = group
							bed.dist = dist
						end
					end
				end
			end
		end
	end

	if bed.name ~= nil then
		local seat = PolyZones[bed.group].polys[bed.name]
		local destination = seat.poly.center or seat.sit.seats[1].xyz

		if seat.lay.skipSeeCheck or CanPlayerReachSeat(destination, 0) then
			LayDownOnBed({entity = 0, bed = seat.lay, raycast = false})
		else
			ESX.ShowNotification(Config_Chair.Chair.Lang.CannotReachBed)
		end
	elseif bed.entity ~= 0 then
		local skipSeeCheck = Models[GetEntityModel(bed.entity)].lay.skipSeeCheck
		if skipSeeCheck or CanPlayerReachSeat(GetEntityCoords(bed.entity), bed.entity) then
			LayDownOnBed({entity = bed.entity, bed = Models[GetEntityModel(bed.entity)].lay, raycast = false})
		else
			ESX.ShowNotification(Config_Chair.Chair.Lang.CannotReachBed)
		end
	else
		ESX.ShowNotification(Config_Chair.Chair.Lang.NoBedFound)
	end
end

local function GetUpFromBed()
	local clearTask = true
	metadata.isLaying = false

	if metadata.teleportOut then
		ClearPedTasksImmediately(GetPlayerPed(-1))
		SetEntityCoords(GetPlayerPed(-1), vector3(metadata.lastPos.x, metadata.lastPos.y, metadata.lastPos.z-0.95))
		clearTask = false
	elseif Config_Chair.Chair.LayTypes[metadata.type].exitAnim ~= false then
		local direction = "m_getout_r"
		if metadata.type ~= "layside" then
			if GetGameplayCamRelativeHeading() < 0 then
				direction = "m_getout_l"
			end
		end

		LoadAnimDict("savem_default@")
		TaskPlayAnim(GetPlayerPed(-1), "savem_default@", direction, 1.0, 1.0, 3000, 0, 0, false, false, false)
		RemoveAnimDict("savem_default@")
		Citizen.Wait(1400)
		clearTask = false
	end
	metadata.animation = {}
	LeaveSeat(clearTask, false, false)
	ExecuteCommand('hidehud')
	DisplayRadar(true)
end

local function StopCurrentAction()
	if IsPedUsingScenario(GetPlayerPed(-1), metadata.scenario) or metadata.isSitting then
		StopSitting()
	elseif metadata.isLaying then
		GetUpFromBed()
	elseif metadata.doingTaskGo then
		metadata.doingTaskGo = false
		LeaveSeat(true, false, false)
	end
end

local function SetupLocalization()
	AddTextEntry("sit_getup_keyboard", string.format(Config_Chair.Chair.Lang.GetUp, "~INPUT_BA1F4C6D~"))
    AddTextEntry("sit_getup_controller", string.format(Config_Chair.Chair.Lang.GetUp, "~INPUT_6ED7AA10~"))
end

local function SetupBeds()
	local models = {}
    local index = 0
    for model, data in pairs(Models) do
		if data.lay then
			index = index + 1
			models[index] = model
		end
    end

	exports.ox_target:addModel(models, {
		icon = Config_Chair.Chair.Targeting.LayIcon,
		label = "S'allonger",
        distance = 5.0,
		onSelect = function (data)
			TriggerEvent("chair:lay", data.entity)
		end
	})
end

local function SetupSeats()
	local models = {}
	local index = 0
    for model, data in pairs(Models) do
		if data.sit then
			index = index + 1
			models[index] = model
		end
    end

	exports.ox_target:addModel(models, {
		icon = Config_Chair.Chair.Targeting.LayIcon,
		label = "S'asseoir",
        distance = 5.0,
		onSelect = function (data)
			TriggerEvent("chair:sit", data.entity)
		end
	})
end

AddEventHandler("chair:sit", function (entity)
	if metadata.isSitting or metadata.isLaying then
		if entity == metadata.entity then
			SitOnSeat({entity = entity, poly = false, sit = Models[GetEntityModel(entity)].sit, raycast = true})
		else
			StopSitting()
		end
	else
		local model = GetEntityModel(entity)
		local skipSeeCheck = Models[model].sit.skipSeeCheck
		if skipSeeCheck or CanPlayerReachSeat(GetEntityCoords(entity), entity) then
			SitOnSeat({entity = entity, poly = false, sit = Models[model].sit, raycast = true})
		else
			ESX.ShowNotification(Config_Chair.Chair.Lang.CannotReachSeat)
		end
	end
end)

AddEventHandler("chair:lay", function (entity)
	if metadata.isLaying then
		GetUpFromBed()
	else
		ExecuteCommand('hudsplitstop')
		DisplayRadar(false)
		local model = GetEntityModel(entity)
		local skipSeeCheck = Models[model].lay.skipSeeCheck
		if skipSeeCheck or CanPlayerReachSeat(GetEntityCoords(entity), entity) then
			LayDownOnBed({entity = entity, bed = Models[model].lay, raycast = true})
		else
			ESX.ShowNotification(Config_Chair.Chair.Lang.CannotReachBed)
		end
	end
end)

-- Initialization --
Citizen.CreateThread(function()
	Models = Config_Chair.Chair.Models
	PolyZones = Config_Chair.Chair.PolyZones

	SetupBeds()
	SetupSeats()

	-- Set up localization
	SetupLocalization()

    -- Chat command tooltip
	if Config_Chair.Chair.AddChatSuggestions then
    	TriggerEvent('chat:addSuggestion', '/sit', Config_Chair.Chair.Lang.ChatHelpTextSit)
		TriggerEvent('chat:addSuggestion', '/lay', Config_Chair.Chair.Lang.ChatHelpTextLay)
	end
end)

-- Commands --
RegisterCommand("sit", function(source, args, rawCommand)
	if IsPlayerDoingAnyAction() then
		StopCurrentAction()
	else
    	SitOnClosestSeat()
	end
end, false)

RegisterCommand("lay", function(source, args, rawCommand)
	if IsPlayerDoingAnyAction() then
		StopCurrentAction()
	else
		LayDownOnClosestBed()
	end
end, false)

-- KeyMapping --

RegisterKeyMapping('sit', "S'assoir sur une chaise", 'keyboard', '/')

RegisterKeyMapping('getup', Config_Chair.Chair.Lang.KeyMappingKeyboard, 'keyboard', Config_Chair.Chair.DefaultKey)
RegisterCommand('getup', function()
	StopCurrentAction()
end, false)

RegisterKeyMapping('standup', Config_Chair.Chair.Lang.KeyMappingController, 'PAD_ANALOGBUTTON', Config_Chair.Chair.DefaultPadAnalogButton)
RegisterCommand('standup', function()
	StopCurrentAction()
end, false)

function DrawNiceText(x, y, sc, text, font, op)
    SetTextFont(font)
    SetTextScale(sc, sc)
    SetTextColour(255, 255, 255, op)
    SetTextJustification(0)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

-- Events/Threads --
AddEventHandler('sit:helpTextThread', function(type)
	Citizen.CreateThread(function()
		while metadata[type] do
			if IsUsingKeyboard(1) then
				if metadata.isLaying then
				SetTimecycleModifier("glasses_black")
				DrawNiceText(0.5, 0.5, 0.6, "Vous dormez, déconnectez, changez de personnage ou réveillez-vous.", 8, 255)
				end
				DisplayHelpTextThisFrame("sit_getup_keyboard")
			else
				DisplayHelpTextThisFrame("sit_getup_controller")
			end
			Citizen.Wait(0)
		end
	end)
end)

AddEventHandler('sit:checkThread', function(type)
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(500)
			if not metadata[type] then
				break
			end

			-- Distance and animation check
			local playerPed = GetPlayerPed(-1)
			local playerPos = GetEntityCoords(playerPed)
			local distance = #(playerPos.xy - metadata.targetPos.xy)
			local distZ = playerPos.z - metadata.targetPos.z - 1.25
			if distZ > 0.0 then
				distance = distance + distZ
			end

			if distance > 0.5 or (metadata.scenario and not IsPedUsingScenario(playerPed, metadata.scenario) or (metadata.animation and metadata.animation.dict and not IsEntityPlayingAnim(playerPed, metadata.animation.dict, metadata.animation.name, 3))) or IsEntityDead(playerPed) then
				local clearTask = true
				if IsEntityDead(playerPed) then
					clearTask = false
				end

				LeaveSeat(clearTask, false, true)
				break
			end
		end
	end)
end)

-- Debugging --
if Config_Chair.Chair.Debugmode then
	local debugging = true
	local function DrawText3D(coords, text, rgb)
		SetTextColour(rgb.r, rgb.g, rgb.b, 255)
		SetTextScale(0.0, 0.35)
		SetTextFont(4)
		SetTextDropshadow(0, 0, 0, 0, 55)
		SetTextDropShadow()
		SetTextOutline()
		SetTextCentre(true)
		SetTextProportional(1)
		SetTextEdge(2, 0, 0, 0, 150)

		-- Diplay the text
		BeginTextCommandDisplayText("STRING")
		AddTextComponentSubstringPlayerName(text)
		SetDrawOrigin(coords, 0)
		EndTextCommandDisplayText(0.0, 0.0)
		ClearDrawOrigin()
		DrawRect(coords.x, coords.y, 1.0, 1.0, 230, 230, 230, 255)
	end
	
	local function GetDebugEntities(playerPed)
		local playerCoords = GetEntityCoords(playerPed)
		local handle, entity = FindFirstObject()
		local success = nil
		local objects = {}
		repeat
			local pos = GetEntityCoords(entity)
			local distance = #(playerCoords- pos)
			if distance < 8.0 then
				objects[#objects+1] = {pos = pos, entity = entity}
			end
	
			success, entity = FindNextObject(handle)
		until not success
		EndFindObject(handle)
		return objects
	end

	local function DebugIsSeatAvailable(coords, action)
		local playerPed = GetPlayerPed(-1)
		for index, ped in pairs(GetNearbyPeds()) do
			local dist = #(GetEntityCoords(ped)-coords)
			if dist < 1.35 then
				if action == 'sit' then
					if IsEntityPlayingAnyLayAnim(ped) or dist < 0.55 then
						return false
					end
				elseif action == 'lay' then
					if IsEntityPlayingAnyLayAnim(ped) or IsPedSitting(ped) then
						return false
					end
				end
			end
		end
		return true
	end

	-- A debug thread, the messiest shit I've ever made.
	local function StartDebuging()
		local playerPed = GetPlayerPed(-1)
		local playerCoords = GetEntityCoords(playerPed)
		local toDisplay = {}
		local sitColor = {r=255, g=255, b=255}
		local layColor = {r=150, g=150, b=150}

		Citizen.CreateThread(function()
			while debugging do 
				local globalIndex = 0
				playerPed = GetPlayerPed(-1)
				playerCoords = GetEntityCoords(playerPed)
				toDisplay = {}

				local entites = GetDebugEntities(playerPed)
				for k, info in pairs(entites) do
					local model = GetEntityModel(info.entity)
					local data = Models[model]
					if data then
						if data.sit then
							for seatIndex, seat in pairs(data.sit.seats) do
								local subName = "sit: "..model
								if #data.sit.seats > 1 then
									subName = subName.." ("..seatIndex..")"
								end
								local heading = GetEntityHeading(info.entity)
								local coords = GetOffsetFromCoordsInWorldCoords(info.pos, vector3(0.0, 0.0, HeadingToRotation(heading)), seat.xyz)
								local newHeading = heading + seat.w
								if newHeading > 360 then
									newHeading = newHeading - 360 
								end
	
								local color = sitColor
								if not DebugIsSeatAvailable(coords.xyz, 'sit') then
									color = {r=200, g=0, b=0}
								end
								globalIndex = globalIndex + 1 
								toDisplay[globalIndex] = { vector4(coords.xyz, newHeading), subName, color}
							end
						end

						if data.lay then
							for seatIndex, seat in pairs(data.lay.seats) do
								local subName = "lay: "..model
								if #data.lay.seats > 1 then
									subName = subName.." ("..seatIndex..")"
								end
								local heading = GetEntityHeading(info.entity)
								local coords = GetOffsetFromCoordsInWorldCoords(info.pos, vector3(0.0, 0.0, HeadingToRotation(heading)), vector3(seat.x, seat.y, seat.z + 0.25)) -- allways show lays 0.25 units above their actual location to stop overlaps
								local newHeading = heading + seat.w
								if newHeading > 360 then
									newHeading = newHeading - 360 
								end

								local color = layColor
								if not DebugIsSeatAvailable(coords.xyz, 'lay') then
									color = {r=200, g=0, b=0}
								end
								globalIndex = globalIndex + 1 
								toDisplay[globalIndex] = {vector4(coords.xyz, newHeading), subName, color}
							end
						end
					end
				end

				for group, data in pairs(PolyZones) do
					if data.enabled then
						for name, info in pairs(data.polys) do
							if info.sit then
								for index, coords in pairs(info.sit.seats) do
									if #(playerCoords-coords.xyz) < 8.0 then
										local subName = "sit: "..name
										if #info.sit.seats > 1 then
											subName = subName.." ("..index..")"
										end
										local color = sitColor
										if not DebugIsSeatAvailable(coords.xyz, 'sit') then
											color = {r=200, g=0, b=0}
										end
										globalIndex = globalIndex + 1 
										toDisplay[globalIndex] = {coords, subName, color}
									end
								end
							end
							if info.lay then
								for index, coords in pairs(info.lay.seats) do
									if #(playerCoords-coords.xyz) < 8.0 then
										local subName = "lay: "..name
										if #info.lay.seats > 1 then
											subName = subName.." ("..index..")"
										end
										local layCoords = vector4(GetOffsetFromCoordsInWorldCoords(coords, vector3(0.0, 0.0, HeadingToRotation(coords.w)), vector3(0.0, 0.0, 0.25)), coords.w)
										local color = layColor
										if not DebugIsSeatAvailable(layCoords.xyz, 'lay') then
											color = {r=200, g=0, b=0}
										end
										globalIndex = globalIndex + 1 
										toDisplay[globalIndex] = {layCoords, subName, color}
									end
								end
							end
						end
					end
				end
				Citizen.Wait(1000)
			end
		end)

		Citizen.CreateThread(function()
			while debugging do 
				for index, data in pairs(toDisplay) do
					DrawText3D(data[1].xyz, data[2], data[3])
				end
				Citizen.Wait(0)
			end
		end)

		Citizen.CreateThread(function()
			while debugging do 
				for index, data in pairs(toDisplay) do
					if data[1].w ~= nil then
						DrawLine(data[1].xyz, GetOffsetFromCoordsInWorldCoords(data[1].xyz, vector3(0.0, 0.0, HeadingToRotation(data[1].w)), vector3(0.0, 0.50, 0.0)), 255, 0, 0, 200)
						DrawLine(data[1].xyz, GetOffsetFromCoordsInWorldCoords(data[1].xyz, vector3(0.0, 0.0, HeadingToRotation(data[1].w)), vector3(0.0, 0.00, 0.20)), 255, 0, 0, 200)
					end
				end
				Citizen.Wait(0)
			end
		end)
	end

	RegisterKeyMapping('sit:debug', 'sit Debuging', 'keyboard', 'G')
	RegisterCommand('sit:debug', function(source, args, rawCommand)
		debugging = not debugging
		if debugging then
			StartDebuging()
		end
	end, false)

	local function GetAverage(table)
		local sum = 0
		for key, value in pairs(table) do
			sum = sum + value
		end
		return sum / #table
	end

	-- Not a true "center", as it calculates the average of all the points, but it's good enough for our purpose.
	RegisterCommand('sit:getcenter', function(source, args, rawCommand)
		local group = args[1] 
		if PolyZones[group] then
			local xPoints = {}
			local yPoints = {}
			local zPoints = {}
	
			local index = 0
			for k, v in pairs(PolyZones[group].polys) do
				index = index + 1
				xPoints[index] = (v.poly.center and v.poly.center.x) or (v.sit and v.sit.seats[1].x) or (v.lay and v.lay.seats[1].x)
				yPoints[index] = (v.poly.center and v.poly.center.y) or (v.sit and v.sit.seats[1].y) or (v.lay and v.lay.seats[1].y)
				zPoints[index] = (v.poly.center and v.poly.center.z) or (v.sit and v.sit.seats[1].z) or (v.lay and v.lay.seats[1].z)
			end
	
			local average = vector3(GetAverage(xPoints), GetAverage(yPoints), GetAverage(zPoints))
			print('average "center":', average)
		else
			print(group, 'is not a valid poly group!')
		end
	end, false)

	RegisterCommand('sit:getfarthestdist', function(source, args, rawCommand)
		local group = args[1] 
		if PolyZones[group] and PolyZones[group].center then
			local center = PolyZones[group].center
			local farthest = {
				dist = 0,
				name = 'error'
			}
	
			for name, data in pairs(PolyZones[group].polys) do
				local pos = data.poly.center or (data.sit and data.sit.seats[1].xyz) or (data.lay and data.lay.seats[1].xyz)
				local distance = #(center-pos)
				if distance > farthest.dist then
					farthest.dist = distance
					farthest.name = name
				end
			end
	
			print(farthest.name, farthest.dist)
		else
			print(group, 'is not a valid poly group!')
		end
	end, false)

	-- Load poly groups (only on your client)
	RegisterCommand('sit:loadGroup', function(source, args, rawCommand)
		local group = args[1] 
		if PolyZones[group] and PolyZones[group].center then
			PolyZones[group].enabled = true
			SetupPolyZones()
		else
			print(group, 'is not a valid poly group!')
		end
	end, false)

	-- Unload poly groups (only on your client)
	RegisterCommand('sit:unloadGroup', function(source, args, rawCommand)
		local group = args[1] 
		if PolyZones[group] and PolyZones[group].center then
			PolyZones[group].enabled = false
			for name, info in pairs(PolyZones[group].polys) do
				exports[Config_Chair.Chair.Target]:RemoveZone(name)
			end
		else
			print(group, 'is not a valid poly group!')
		end
	end, false)

	StartDebuging()
end