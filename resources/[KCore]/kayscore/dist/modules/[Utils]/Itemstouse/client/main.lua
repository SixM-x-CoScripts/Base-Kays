RegisterNetEvent('useNitro')
AddEventHandler('useNitro', function()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    local timeout = GetGameTimer() + 10000
    while GetGameTimer() < timeout do
        Citizen.Wait(0)
        local vehicleSpeed =  GetEntitySpeed(vehicle) * 3.6
        if vehicleSpeed < 100 then
            SetVehicleCheatPowerIncrease(vehicle, 4.0)
        elseif vehicleSpeed < 180 then
            SetVehicleCheatPowerIncrease(vehicle, 3.0)
        else
            SetVehicleCheatPowerIncrease(vehicle, 2.0)
        end
    end
end)

RegisterNetEvent('nitroEffect')
AddEventHandler('nitroEffect', function(netId)
    if not NetworkDoesEntityExistWithNetworkId(netId) then
        return
    end
    local vehicle = NetworkGetEntityFromNetworkId(netId)
    if not DoesEntityExist(vehicle) or not HasModelLoaded(GetEntityModel(vehicle)) then
        return
    end

    local nitroEffect = false
    if GetVehiclePedIsIn(PlayerPedId(), false) == vehicle then
        nitroEffect = true
        NitroScreenEffect(true)
    end

    local particles = {}
    SetVehicleBoostActive(vehicle, true)
    for _, exhaust in pairs(NitroVehicle.Exhausts) do
        Citizen.CreateThread(function()
            local bone = GetEntityBoneIndexByName(vehicle, exhaust)
            if bone > 0 then
                local ptfxAsset = 'core'
                ESX.Streaming.RequestNamedPtfxAsset(ptfxAsset)
                UseParticleFxAssetNextCall(ptfxAsset)
                local particle = StartParticleFxLoopedOnEntityBone('sp_fire_trail_plane', vehicle, 0.0, 0.0, 0.0, 90.0, 0.0, 0.0, bone, 1.0, true, true, true)
                table.insert(particles, particle)

                local ptfxAsset = 'veh_xs_vehicle_mods'
                ESX.Streaming.RequestNamedPtfxAsset(ptfxAsset)
                UseParticleFxAssetNextCall(ptfxAsset)
                local particle = StartParticleFxLoopedOnEntityBone('veh_nitrous', vehicle, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, bone, 1.0, true, true, true)
                table.insert(particles, particle)
            end
        end)
    end

    Citizen.Wait(10000)

    for _, particle in pairs(particles) do
        StopParticleFxLooped(particle, 1)
    end
    SetVehicleBoostActive(vehicle, false)

    if nitroEffect then
        NitroScreenEffect(false)
    end
end)

function NitroScreenEffect(enabled)
    if enabled then
        StopScreenEffect('RaceTurbo')
        StartScreenEffect('RaceTurbo', 0, false)
        SetTimecycleModifier('rply_motionblur')
        ShakeGameplayCam('SKY_DIVING_SHAKE', 0.25)
    else
        StopGameplayCamShaking(true)
        SetTransitionTimecycleModifier('default', 0.35)
    end
end

RegisterCommand('nitroVehicle', function(source,args)
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if (vehicle ~= 0) then 
        TriggerServerEvent('kayscore:useNitro', NetworkGetNetworkIdFromEntity(vehicle))
    end
end)
RegisterKeyMapping('nitroVehicle', 'Activer Nitro Véhicule', 'keyboard', 'O')


RegisterNetEvent('kayscore:useciseaux', function()
    if not GetSafeZone() then
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        local Ply = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
        local prop_name = "p_cs_scissors_s"

        if closestPlayer ~= -1 and closestDistance <= 3.0 then

            ExecuteCommand('me utilise des ciseaux')
            ciseau = CreateObject(GetHashKey("p_cs_scissors_s"), x, y, z,  true,  true, true)
            AttachEntityToEntity(ciseau, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 28422), -0.0, 0.03, 0.03, 0, -270.0, -20.0, true, true, false, true, 1, true)
            ESX.Streaming.RequestAnimDict('misshair_shop@barbers', function()
                TaskPlayAnim(Ply, 'misshair_shop@barbers', 'keeper_idle_b', 2.0, 2.0, 10000, 48, 0, false, false, false)
            end)
            Wait(10000)
            DeleteObject(ciseau)
            TriggerServerEvent('kayscore:haircut', GetPlayerServerId(closestPlayer))
            ciseau = CreateObject(GetHashKey("p_cs_scissors_s"), x, y, z,  false,  false, false)
        else
            ESX.ShowNotification('✂️ ~r~Impossible~s~~n~personne a proximité de vous.')
        end
    else
        ESX.ShowNotification('✂️ Vous ne pouvez pas couper les cheveux de quelqu\'un en Zone Safe')
    end
end)

RegisterNetEvent('kayscore:haircut', function()
    TriggerEvent('skinchanger:change', 'hair_1', 0)
    TriggerEvent('skinchanger:getSkin', function(skin)
        TriggerServerEvent('esx_skin:save', skin)
    end)
end)