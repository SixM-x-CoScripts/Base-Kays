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

function SyncFuel(vehicle, fuel)
    if DoesEntityExist(vehicle) then
        local plate = Entity(vehicle).state.plate
        if plate ~= nil then
            TriggerServerEvent('kayscore:vehicle:syncFuel', plate, {
                fuelLevel = ESX.Math.Round(fuel or GetFuel(vehicle), 1)
            })
        end
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


Citizen.CreateThread(function()
    Wait(5000)
    SendNUIMessage({
        type = "gazStation:setText",
        data = {
            price = "Prix",
            inStock = "Stock Essence",
            card = "Carte",
            cash = "Cash",
            title = "Station Essence",
            litre = "Litre Disponible",
            fillUpToPrice = "Mettre le Litre",
            fillUpToTank = "Mettre le Plein",
        }
    })
end)

AddEventHandler("ui:gazStation:open", function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetPlayerControl(PlayerId(), false, 12)
    SetNuiFocus(true, true)
    SendNuiMessage({ -- work i think
        type = "gazStation:open",
        data = {
            priceL = 10,
            lInVehicle = math.floor(GetVehicleFuelLevel(GetVehiclePedIsIn(PlayerPedId(), true), false)),
            maxVehicleL = 100.0,
            inStock = 4500,
        }
    })
end)

RegisterNuiCallback("gazStation:closeUi", function(data)
    SetNuiFocus(false, false)
    SetPlayerControl(PlayerId(), true, 12)
end)

RegisterNuiCallback("gazStation:fillToPrice", function(data) -- work
    local count = math.floor(data.price/10)
    local method = data.method == "card" and "bank" or "cash"

    SetNuiFocus(false, false)
    SetPlayerControl(PlayerId(), true, 12)
    ESX.TriggerServerCallback("ZgegFramework:gazstation:removeMoney", function(isAllow)
        if isAllow then
            AddFuel(GetVehiclePedIsIn(PlayerPedId(), false), count)
            ESX.ShowNotification("[~r~INFO~s~] Tu as fait le plein !, Tu as payer : ~r~" ..data.price.. "~w~$")
        else
            ESX.ShowNotification("Vous n'avez pas assez d'argent")
        end
    end, data.price, method)
end)

RegisterNUICallback("gazStation:fillToFull", function(data) -- not work
    local count = math.floor(data.price/10)
    local method = data.method == "card" and "bank" or "cash"

    SetNuiFocus(false, false)
    SetPlayerControl(PlayerId(), true, 12)
    ESX.TriggerServerCallback("ZgegFramework:gazstation:removeMoney", function(isAllow)
        if isAllow then
            AddFuel(GetVehiclePedIsIn(PlayerPedId(), false), 100)
            ESX.ShowNotification("[~r~INFO~s~] Tu as fait le plein !, Tu as payer : ~r~" ..data.price.. "~w~$")
        else
            ESX.ShowNotification("Vous n'avez pas assez d'argent")
        end
    end, data.price, method)
end)