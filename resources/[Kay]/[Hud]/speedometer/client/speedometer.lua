-- if IS_RDR2 then return end
-- local showHud = true
-- local currentHud = false

-- function HideSpeedometer(_showHud)
-- 	showHud = not _showHud
-- end

-- CreateThread(function()
-- 	while true do
-- 		local playerPed = PlayerPedId()
-- 		local vehicle = GetVehiclePedIsIn(playerPed)

-- 		if vehicle > 0 and showHud and GetPedInVehicleSeat(vehicle, -1) == playerPed then
--             local fuelLevel = Entity(vehicle).state.fuelLevel or 0
--             local maxInTank = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fPetrolTankVolume')

--             if fuelLevel > maxInTank then fuelLevel = maxInTank end

--             currentHud = true
--             SendReactMessage('setSpeedometer', {
--                 km = math.ceil((Entity(vehicle).state.mileage or 0)/1000),
--                 fuel = maxInTank ~= 0 and math.ceil((fuelLevel / maxInTank) * 100) or nil,
--                 speed = math.ceil(GetEntitySpeed(vehicle) * 3.6)
--             })
-- 		else
-- 			if currentHud then
-- 				currentHud = false
--                 SendReactMessage('setSpeedometer', nil)
-- 			end
-- 			Wait(1000)
-- 		end

-- 		Wait(100)
-- 	end
-- end)

if IS_RDR2 then return end
local showHud = true
local currentHud = false

function HideSpeedometer(_showHud)
	showHud = not _showHud
end

local vehicleMileage = {}
local previousCoords = {}

function GetVehicleIdentifier(vehicle)
    return GetVehicleNumberPlateText(vehicle)
end

CreateThread(function()
    while true do
        Wait(1000)

        local playerPed = PlayerPedId()
        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local vehicleId = GetVehicleIdentifier(vehicle)
            local coords = GetEntityCoords(vehicle)

            if previousCoords[vehicleId] then
                local distance = #(coords - previousCoords[vehicleId]) / 1000

                if not vehicleMileage[vehicleId] then
                    vehicleMileage[vehicleId] = 0
                end

                vehicleMileage[vehicleId] = vehicleMileage[vehicleId] + distance
            end

            previousCoords[vehicleId] = coords
        end
    end
end)

function GetVehicleMileage(vehicle)
    local vehicleId = GetVehicleIdentifier(vehicle)
    return vehicleMileage[vehicleId] or 0
end

CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed)

        if vehicle > 0 and showHud and GetPedInVehicleSeat(vehicle, -1) == playerPed then
            local fuelLevel = GetVehicleFuelLevel(vehicle)
            local maxInTank = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fPetrolTankVolume')

            if fuelLevel > maxInTank then fuelLevel = maxInTank end

            local vehicleId = GetVehicleIdentifier(vehicle)
            local coords = GetEntityCoords(vehicle)

            if previousCoords[vehicleId] then
                local distance = #(coords - previousCoords[vehicleId]) / 1000 

                if not vehicleMileage[vehicleId] then
                    vehicleMileage[vehicleId] = 0
                end

                vehicleMileage[vehicleId] = vehicleMileage[vehicleId] + distance
            end

            previousCoords[vehicleId] = coords

            currentHud = true
            SendReactMessage('setSpeedometer', {
                km = math.ceil(GetVehicleMileage(vehicle)),
                fuel = maxInTank ~= 0 and math.ceil((fuelLevel / maxInTank) * 100) or nil,
                speed = math.ceil(GetEntitySpeed(vehicle) * 3.6)
            })
        else
            if currentHud then
                currentHud = false
                SendReactMessage('setSpeedometer', nil)
            end
            Wait(1000)
        end

        Wait(100)
    end
end)