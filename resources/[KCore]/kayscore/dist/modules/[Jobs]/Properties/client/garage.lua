RegisterNetEvent('kayscore:properties:loadVehicle', function(propertiesData, vehicleData)
    local countSpawn = 1

    for k,v in pairs(vehicleData) do
        local garage = Properties.garage.interior[propertiesData.garageType].position[countSpawn]
        countSpawn = countSpawn + 1

        ESX.Game.SpawnLocalVehicle(v.model, garage.pos, tonumber(garage.heading), function(vehicle)
            lib.setVehicleProperties(vehicle, json.decode(v.data))
            Properties.garage.self_vehicle[vehicle] = vehicle

            SetEntityInvincible(vehicle, true)
        end)
    end

    Properties.garage.isIn = true

    CreateThread(function()

        local scaleform = gtaui.Scaleform("mp_car_stats_01")
        scaleform:load()
        
        local interval = 2000

        while Properties.garage.isIn do
            Wait(interbal)

            interval = 2000

            if not Properties.garage.isIn then
                scaleform = nil
                break
            end

            local ped = Player.playerPed

            if scaleform then

                local closestVeh = ESX.Game.GetClosestVehicle(GetEntityCoords(ped))

                if Properties.garage.self_vehicle[closestVeh] == nil then goto continue end

                local x, y, z = table.unpack(GetEntityCoords(closestVeh))
                local height = GetEntityHeight(closestVeh, x, y, z, true, false)
                local rot = GetGameplayCamRot(0)
                local scale = 0.9
                local size = vector3((15 * 0.8) * scale, (9 * 0.8) * scale, 1 * scale)
                local coords = vector3(x, y, z + 3.4 + height)

                scaleform:draw3D(coords, rot, size)

                local name = ("%s"):format('Informations de votre véhicule')
                local maxSpeed = GetVehicleModelEstimatedMaxSpeed(GetEntityModel(closestVeh)) * 1.25
                local acceleration = GetVehicleModelAcceleration(GetEntityModel(closestVeh)) * 200
                local braking = GetVehicleModelMaxBraking(GetEntityModel(closestVeh)) * 100;
                local traction = GetVehicleModelMaxTraction(GetEntityModel(closestVeh)) * 25

                scaleform:callFunction(
                    "SET_VEHICLE_INFOR_AND_STATS",
                    name,
                    "",
                    "",
                    "Vitesse max",
                    "Accélération",
                    "Frein",
                    "Suspension",
                    maxSpeed,
                    acceleration,
                    braking,
                    traction
                )
            end

            local vehicle = GetVehiclePedIsIn(ped, false)

            if vehicle == 0 then goto continue end

            interval = 1

            local vehCoord = GetEntityCoords(vehicle)

            DrawInstructionBarNotification(vehCoord.x, vehCoord.y, vehCoord.z + 1, 'Appuyez sur [ ~g~E~s~ ] pour sortir le véhicule de votre garage')
            if IsControlJustPressed(0, 54) then
                TriggerServerEvent('kayscore:properties:garage:exitWithVehicle', propertiesData.id, GetVehicleNumberPlateText(vehicle))
            end

            ::continue::
        end
    end)

    TriggerEvent('kayscore:properties:garage:freezeVehicle')
end)

local vehiclesEngine = false

function Properties:openGarageInteriorMenu(propertiesData)
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(maib))
    FreezeEntityPosition(Player.playerPed, true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Checkbox('Véhicules allumés', nil, vehiclesEngine, {}, {
                onChecked = function()
                    vehiclesEngine = true

                    for k,v in pairs(Properties.garage.self_vehicle) do
                        SetVehicleEngineOn(v, true, true, false)
                    end
                end,
                onUnChecked = function()
                    vehiclesEngine = false

                    for k,v in pairs(Properties.garage.self_vehicle) do
                        SetVehicleEngineOn(v, false, false, false)
                    end
                end
            })
            RageUI.WLine()
            RageUI.Button('Sortir du garage', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('kayscore:properties:garage:exit', function(cb)
                        if cb == true then
                            for k,v in pairs(Properties.garage.self_vehicle) do
                                DeleteEntity(v)
                                Properties.garage.self_vehicle[propertiesData.id] = nil
                            end
                            Properties.garage.isIn = false

                            RageUI.CloseAll()
                        end
                    end, propertiesData.id)
                end
            })
        end)

        if not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(Player.playerPed, false)
        end
    end
end

AddEventHandler('kayscore:properties:loadVehicle', function(propertiesData, vehicleData)
    while not Properties.garage.isIn do Wait(1) end
    Properties.garage.WaitNearby = 2000
    while Properties.garage.isIn do
        Wait(interbal)
        Properties.garage.WaitNearby = 2000

        local garageExit = #(GetEntityCoords(PlayerPedId())-vector3(Properties.garage.interior[propertiesData.garageType].interior.x, Properties.garage.interior[propertiesData.garageType].interior.y, Properties.garage.interior[propertiesData.garageType].interior.z))

        if garageExit > 15 then goto continue end

        Properties.garage.WaitNearby = 1
        
        DrawMarker(25, Properties.garage.interior[propertiesData.garageType].interior.x, Properties.garage.interior[propertiesData.garageType].interior.y, Properties.garage.interior[propertiesData.garageType].interior.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)

        if garageExit <= 1 then
            DrawInstructionBarNotification(Properties.garage.interior[propertiesData.garageType].interior.x, Properties.garage.interior[propertiesData.garageType].interior.y, Properties.garage.interior[propertiesData.garageType].interior.z, "Appuyez sur [ ~g~E~w~ ] pour intéragir (garage exit)")
            if IsControlJustPressed(0, 54) then
                Properties:openGarageInteriorMenu(propertiesData)
            end
        end

        ::continue::
    end
end)

RegisterNetEvent('kayscore:properties:garage:exitWithVehicle', function(propertiesId, vehicleProperties, vehicleModel)
    DoScreenFadeOut(1300)

    Wait(2300)
    
    Properties.garage.isIn = false
    
    for k,v in pairs(Properties.garage.self_vehicle) do
        DeleteEntity(v)
        Properties.garage.self_vehicle[k] = nil
    end

    SetEntityCoords(PlayerPedId(), vector3(Properties.PropertiesList[propertiesId].garageSpawn.x, Properties.PropertiesList[propertiesId].garageSpawn.y, Properties.PropertiesList[propertiesId].garageSpawn.z))

    ESX.Game.SpawnVehicle(vehicleModel, vector3(Properties.PropertiesList[propertiesId].garageSpawn.x, Properties.PropertiesList[propertiesId].garageSpawn.y, Properties.PropertiesList[propertiesId].garageSpawn.z), tonumber(Properties.PropertiesList[propertiesId].garageRotation), function(vehicle2)
        lib.setVehicleProperties(vehicle2, json.decode(vehicleProperties))

        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle2, -1)
    end)

    DoScreenFadeIn(1300)
end)

AddEventHandler('onResourceStop', function(r)
    for k,v in pairs(Properties.garage.self_vehicle) do
        DeleteEntity(v)
        Properties.garage.self_vehicle[k] = nil
    end
end)

AddEventHandler('kayscore:properties:garage:freezeVehicle', function()
    Wait(5000)

    for k,v in pairs(Properties.garage.self_vehicle) do
        FreezeEntityPosition(v, true)
    end
end)

local count = 0

function Properties:openGarageMenu(k)
    count += 1

    if count > 1 then
        count = 0
        return
    end
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        ESX.TriggerServerCallback('kayscore:properties:garage:rentVehicle', function(cb)
            if cb == false then return ESX.ShowNotification('🚗 Ce véhicule ne vous appartient pas !') end

            if cb then
                ESX.ShowNotification('🚗 Véhicule rangé dans votre garage avec succès')

                TriggerServerEvent('kayscore:properties:garage:enter', k, ESX.PlayerData.UniqueID)

                DeleteEntity(GetVehiclePedIsIn(ped, false))

                RageUI.Visible(main, false)
            end
        end, k, GetVehicleNumberPlateText(GetVehiclePedIsIn(ped, false)), lib.getVehicleProperties(GetVehiclePedIsIn(ped, false)))
    else
        TriggerServerEvent('kayscore:properties:garage:enter', k, ESX.PlayerData.UniqueID)
        RageUI.Visible(main, false)
    end
end