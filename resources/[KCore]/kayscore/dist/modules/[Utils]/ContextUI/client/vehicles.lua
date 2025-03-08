Citizen.CreateThread(function ()
    while GetResourceState("ox_target") ~= "started" do Citizen.Wait(0) end
    exports.ox_target:addGlobalVehicle({
    {
            label = "Administrations",
            icon = "fa-solid fa-car",
            distance = 5.0,
            canInteract = function ()

                if adminManagement.Service then
                    return true
                end

             --   if ESX.Table.Contains(enterprisePermissions, "addEmployer") or ESX.Table.Contains(enterprisePermissions, "removeEmployer") then
             --       return true
            --    end

                return false
            end,
            openMenu = "admin-option-veh"
        }, {
            menuName = "admin-option-veh",
            label = "Supprimer le véhicule",
            icon = "fa-solid fa-car-side",
            distance = 50.0,
            canInteract = function ()
                if ESX.GetPlayerData()["group"] == "user" then
                    return false
                end

                if not adminManagement.Service then
                    return false
                end

                return true
            end,
            onSelect = function (data)
                secured_TriggerServerEvent("kayscore:admin:delVeh", NetworkGetNetworkIdFromEntity(data.entity))
            end
        },
    {
            menuName = "admin-option-veh",
            label = "Freeze/Unfreeze le véhicule",
            icon = "fa-solid fa-car-side",
            distance = 50.0,
            canInteract = function ()
                if ESX.GetPlayerData()["group"] == "user" then
                    return false
                end

                if not adminManagement.Service then
                    return false
                end

                return true
            end,
            onSelect = function (data)
                if IsEntityPositionFrozen(data.entity) then
                    secured_TriggerServerEvent("kayscore:admin:freezeunfreezevehicle", NetworkGetNetworkIdFromEntity(data.entity), false)
                else
                    secured_TriggerServerEvent("kayscore:admin:freezeunfreezevehicle", NetworkGetNetworkIdFromEntity(data.entity), true)
                end
            end
        },
        {
            menuName = "admin-option-veh",
            label = "Réparer le véhicule",
            icon = "fa-solid fa-car-side",
            distance = 50.0,
            canInteract = function ()
                if ESX.GetPlayerData()["group"] == "user" then
                    return false
                end

                if not adminManagement.Service then
                    return false
                end

                return true
            end,
            onSelect = function (data)
                secured_TriggerServerEvent("kayscore:admin:repairVeh", ESX.Game.GetClosestVehicle(Player.coords))
            end
        },
        {
            menuName = "admin-option-veh",
            label = "Nettoyer le véhicule",
            icon = "fa-solid fa-car-side",
            distance = 50.0,
            canInteract = function ()
                if ESX.GetPlayerData()["group"] == "user" then
                    return false
                end

                if not adminManagement.Service then
                    return false
                end

                return true
            end,
            onSelect = function (data)
                SetVehicleDirtLevel(ESX.Game.GetClosestVehicle(Player.coords), 0)
            end
        },
        {
            menuName = "admin-option-veh",
            label = "Crocheter le véhicule",
            icon = "fa-solid fa-car-side",
            distance = 50.0,
            canInteract = function ()
                if ESX.GetPlayerData()["group"] == "user" then
                    return false
                end

                if not adminManagement.Service then
                    return false
                end

                return true
            end,
            onSelect = function (data)
                local veh = ESX.Game.GetClosestVehicle(Player.coords)
                SetVehicleDoorsLockedForAllPlayers(veh, false)
                SetEntityAsMissionEntity(veh, true, true)
                SetVehicleDoorsLocked(veh, 1)
                SetVehicleHasBeenOwnedByPlayer(veh, true)
            end
        },
        {
            menuName = "admin-option-veh",
            label = "Upgrade le véhicule",
            icon = "fa-solid fa-car-side",
            distance = 50.0,
            canInteract = function ()
                if ESX.GetPlayerData()["group"] == "user" then
                    return false
                end

                if not adminManagement.Service then
                    return false
                end

                return true
            end,
            onSelect = function (data)
                secured_TriggerServerEvent('kayscore:admin:fullCustomVeh', ESX.Game.GetClosestVehicle(Player.coords))
            end
        },
        {
            menuName = "admin-option-veh",
            label = "Essence maximum",
            icon = "fa-solid fa-car-side",
            distance = 50.0,
            canInteract = function ()
                if ESX.GetPlayerData()["group"] == "user" then
                    return false
                end

                if not adminManagement.Service then
                    return false
                end

                return true
            end,
            onSelect = function (data)
                local veh = ESX.Game.GetClosestVehicle(Player.coords)
                AddFuel(GetVehiclePedIsIn(PlayerPedId(), false), 100)
            end
        },
        {
            menuName = "admin-option-veh",
            label = "Retourner le véhicule",
            icon = "fa-solid fa-car-side",
            distance = 50.0,
            canInteract = function ()
                if ESX.GetPlayerData()["group"] == "user" then
                    return false
                end

                if not adminManagement.Service then
                    return false
                end

                return true
            end,
            onSelect = function (data)
                secured_TriggerServerEvent("kayscore:admin:returnveh", NetworkGetNetworkIdFromEntity(data.entity))
            end
        },
    })
end)