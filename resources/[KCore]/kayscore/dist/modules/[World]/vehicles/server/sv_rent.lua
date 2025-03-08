--[[local rentedVehicles = {}

local function getTimeInSeconds(timeIndex)
    if timeIndex == 1 then
        return 15 * 60
    elseif timeIndex == 2 then
        return 30 * 60
    elseif timeIndex == 3 then
        return 60 * 60
    else
        return 0
    end
end

RegisterServerEvent("kayscore:vehicle:rentVehicle")
AddEventHandler("kayscore:vehicle:rentVehicle", function(rentIndex, vehicleName, timeIndex)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local rentTime = getTimeInSeconds(timeIndex)
    local vehiclePrice = 100
    if xPlayer.getMoney() >= vehiclePrice then
        xPlayer.removeAccountMoney('money', vehiclePrice)
        rentedVehicles[_source] = { vehicle = vehicleName, endTime = os.time() + rentTime }
        TriggerClientEvent("kayscore:vehicle:spawnVehicle", _source, vehicleName)
        Citizen.CreateThread(function()
            Citizen.Wait(rentTime * 1000)
            if rentedVehicles[_source] and rentedVehicles[_source].vehicle == vehicleName then
                TriggerClientEvent("kayscore:vehicle:removeVehicle", _source)
                rentedVehicles[_source] = nil
            end
        end)
    else
        TriggerClientEvent("esx:showNotification", _source, "Vous n'avez pas assez d'argent.")
    end
end)]]--
