local isNearPump = false
local fuelSynced = false
local inBlacklisted = false
local pumpModels = { "prop_gas_pump_1a", "prop_gas_pump_1d", "prop_gas_pump_1b", "prop_gas_pump_1c", "prop_vintage_pump", "prop_gas_pump_old2", "prop_gas_pump_old3" }
local fuelingPlayers = {}

function ManageFuelUsage(vehicle)
	if not DecorExistOn(vehicle, "_FUEL_LEVEL") then
		SetFuel(vehicle, math.random(200, 800) / 10)
	elseif not fuelSynced then
		SetFuel(vehicle, GetFuel(vehicle))

		fuelSynced = true
	end

	if IsVehicleEngineOn(vehicle) then
		if IsPedInAnyHeli(Player.playerPed) then
			SetFuel(vehicle, GetVehicleFuelLevel(vehicle) - VehicleFuelConfig.Fuel.FuelUsage[Round(GetVehicleCurrentRpm(vehicle), 1)] * 1.0 / 10)
		else
			SetFuel(vehicle, GetVehicleFuelLevel(vehicle) - VehicleFuelConfig.Fuel.FuelUsage[Round(GetVehicleCurrentRpm(vehicle), 1)] * (VehicleFuelConfig.Fuel.Classes[GetVehicleClass(vehicle)] or 1.0) / 10)
		end
	end
end

Citizen.CreateThread(function()
	DecorRegister("_FUEL_LEVEL", 1)

	for index = 1, #VehicleFuelConfig.Fuel.Blacklist do
		if type(VehicleFuelConfig.Fuel.Blacklist[index]) == 'string' then
			VehicleFuelConfig.Fuel.Blacklist[GetHashKey(VehicleFuelConfig.Fuel.Blacklist[index])] = true
		else
			VehicleFuelConfig.Fuel.Blacklist[VehicleFuelConfig.Fuel.Blacklist[index]] = true
		end
	end

	for index = #VehicleFuelConfig.Fuel.Blacklist, 1, -1 do
		table.remove(VehicleFuelConfig.Fuel.Blacklist, index)
	end

	while true do
		Citizen.Wait(1000)

		local ped = Player.playerPed

		if IsPedInAnyVehicle(ped) then
			local vehicle = GetVehiclePedIsIn(ped)

			if VehicleFuelConfig.Fuel.Blacklist[GetEntityModel(vehicle)] then
				inBlacklisted = true
			else
				inBlacklisted = false
			end

			if not inBlacklisted and GetPedInVehicleSeat(vehicle, -1) == ped then
				ManageFuelUsage(vehicle)
			end
		else
			if fuelSynced then
				fuelSynced = false
			end

			if inBlacklisted then
				inBlacklisted = false
			end
		end
	end
end)

function GetFuel(vehicle)
	if not DecorExistOn(vehicle, "_FUEL_LEVEL") then
		return GetVehicleFuelLevel(vehicle)
	end

	return DecorGetFloat(vehicle, "_FUEL_LEVEL")
end

exports('getVehicleFuel', function(vehicle)
    return GetFuel(vehicle)
end)

function SetFuel(vehicle, fuel)
	if type(fuel) == 'number' and fuel >= 0 and fuel <= 100 then
		SetVehicleFuelLevel(vehicle, fuel + 0.0)
		DecorSetFloat(vehicle, "_FUEL_LEVEL", GetVehicleFuelLevel(vehicle))
	end
end

function AddFuel(vehicle, fuel)
	if type(fuel) == 'number' and fuel >= 0 then
		local newCount = math.floor(GetFuel(vehicle) + fuel)

		if newCount > 100 then
			newCount = 100
		end

		SetVehicleFuelLevel(vehicle, newCount + 0.0)
		DecorSetFloat(vehicle, "_FUEL_LEVEL", GetVehicleFuelLevel(vehicle))
	end
end


function Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)

	return math.floor(num * mult + 0.5) / mult
end

function CreateBlip(coords)
	local blip = AddBlipForCoord(coords)

	SetBlipSprite(blip, 361)
	SetBlipScale(blip, 0.5)
	SetBlipColour(blip, 1)
	SetBlipDisplay(blip, 4)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Station Essence")
	EndTextCommandSetBlipName(blip)

	return blip
end


Citizen.CreateThread(function()
	for _, gasStationCoords in pairs(VehicleFuelConfig.Fuel.GasStations) do
		CreateBlip(gasStationCoords)
	end
end)
