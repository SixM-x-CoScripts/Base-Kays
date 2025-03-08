--[[CreateThread(function()
    exports.ox_target:addModel(FuelConfig.pumpModels, {
        {
            distance = 2,
            onSelect = function()
                local vehicle = GetVehiclePedIsIn(Player.playerPed, false)

                if vehicle ~= 0 then return ESX.ShowNotification('Vous devez être hors du véhicule') end

                local input = lib.inputDialog('Informations', {
                    {type = 'number', label = 'Littres (100 Max)', description = nil, icon = 'hashtag'},
                })

                if input[1] > 100 then return end
                if input[1] < 1 then return end

                if GetVehicleFuelLevel(vehicle) >= 100 then return ESX.ShowNotification('Le réservoir du véhicule est plein') end

                local f = GetVehicleFuelLevel(vehicle) + input[1]

                print(f, GetVehicleFuelLevel(vehicle))

                if f > 100 then return ESX.ShowNotification(('Vous ne pouvez pas mettre plus de ~g~100L~s~ dans le réservoir\nLittre dans le réservoir: ~g~%sL~s~'):format(GetVehicleFuelLevel(vehicle))) end

                ESX.TriggerServerCallback('kayscore:fuel:getmoney', function(cb)
                    if cb then
                        local vehicle = lib.getClosestVehicle(Player.coords, 5, false)

                        AddFuel(vehicle, GetVehicleFuelLevel(vehicle) + input[1])
                    end
                end, input[1])
            end,
            icon = "fas fa-gas-pump",
            label = "Remplir le réservoir du véhicule (50$/L)",
            canInteract = function(entity)
                local vehicle = lib.getClosestVehicle(Player.coords, 5, false)

                if vehicle == nil then return false end

                return true
            end
        },
    })
end)]]--