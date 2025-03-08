--Citizen.CreateThread(function ()
--    while ESX == nil do Citizen.Wait(500) end
--    while ESX.RegisterClientCallback == nil do Citizen.Wait(500) end
--
--    ESX.RegisterClientCallback("bmx:chooseColor", function ()
--       local p = promise.new()
--
--        local color = ESX.GetColorPickerInput("Couleur du BMX")
--        p:resolve(color)

--        return Citizen.Await(p)
--    end)
--end)

RegisterNetEvent('bmx:useBmx', function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    RequestModel('bmx')
    while not HasModelLoaded('bmx') do
        Wait(500)
    end
    local bmx = CreateVehicle('bmx', coords.x, coords.y, coords.z, GetEntityHeading(playerPed), true, false)
    local networkID = NetworkGetNetworkIdFromEntity(bmx)
    SetNetworkIdCanMigrate(networkID, true)
    SetEntityAsMissionEntity(bmx, true, false)
    TriggerServerEvent("bmx:removeBmx")
    TriggerEvent('esx:showNotification', "Vous avez fait apparaître un BMX.")
end)

Citizen.CreateThread(function()
    while GetResourceState("ox_target") ~= "started" do
        Citizen.Wait(0)
    end

    exports.ox_target:addGlobalVehicle({
        label = "Ranger le BMX",
        icon = "fa-solid fa-car-side",
        name = "mechanic_bmx_on",
        distance = 3.0,
        canInteract = function(entity)
            local model = GetEntityModel(entity)
            return model == GetHashKey("bmx")
        end,
        onSelect = function(data)
            TriggerServerEvent("bmx:addBmx")
            exports.ox_target:removeEntity(NetworkGetNetworkIdFromEntity(data.entity))
            DeleteEntity(data.entity)
        end
    })
end)


