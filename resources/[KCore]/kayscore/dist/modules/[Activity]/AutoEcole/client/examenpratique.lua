local CurrentTest = nil
isintestdrive = false
local CurrentTestType = nil
local CurrentCheckPoint = 0
local LastCheckPoint = -1
local CurrentZoneType = nil
local DriveErrors = 0
local IsAboveSpeedLimit = false
local CurrentVehicle = nil
local LastVehicleHealth = nil
local pedddd = nil

function StartDriveTest(type)
    isintestdrive = true
    ESX.Game.SpawnVehicle(kayscoreConfigServ.ConfigAutoEcole.VehicleModels[type], kayscoreConfigServ.ConfigAutoEcole.Zones.VehicleSpawnPoint.Pos, kayscoreConfigServ.ConfigAutoEcole.Zones.VehicleSpawnPoint.Pos.h, function(vehicle)
        ESX.Game.SpawnLocalPed(1, 'a_f_o_ktown_01', vector3(0.0, 0.0, 0.0), 90.0, function(ped)
            pedddd = ped
            CurrentTest = 'drive'
            CurrentTestType = type
            CurrentCheckPoint = 0
            LastCheckPoint = -1
            CurrentZoneType = 'residence'
            DriveErrors = 0
            IsAboveSpeedLimit = false
            CurrentVehicle = vehicle
            LastVehicleHealth = GetEntityHealth(vehicle)
    
            local playerPed = PlayerPedId()
            TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
            SetPedIntoVehicle(ped, vehicle, -2)
        end)
    end)

end

function StopDriveTest(success)
    if success then
        secured_TriggerServerEvent('rx:addLicense', CurrentTestType)
        Notification('[~g~Réussi~s~] Félicitation, vous avez réussi votre permis.')
    else
        Notification('[~r~Échoué~s~] vous avez échouez votre permis.')
    end
    isintestdrive = false
    CurrentTest = nil
    CurrentTestType = nil

    DeleteEntity(pedddd)
end

function SetCurrentZoneType(type)
    CurrentZoneType = type
end

Citizen.CreateThread(function()
    while true do

        Citizen.Wait(0)

        if CurrentTest == 'drive' then
            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)
            local nextCheckPoint = CurrentCheckPoint + 1

            if kayscoreConfigServ.ConfigAutoEcole.CheckPoints[nextCheckPoint] == nil then
                if DoesBlipExist(CurrentBlip) then
                    RemoveBlip(CurrentBlip)
                end

                CurrentTest = nil

                Notification('Test de conduite terminé')

                if DriveErrors < kayscoreConfigServ.ConfigAutoEcole.MaxErrors then
                    StopDriveTest(true)
                else
                    StopDriveTest(false)
                end
            else

                if CurrentCheckPoint ~= LastCheckPoint then
                    if DoesBlipExist(CurrentBlip) then
                        RemoveBlip(CurrentBlip)
                    end

                    CurrentBlip = AddBlipForCoord(kayscoreConfigServ.ConfigAutoEcole.CheckPoints[nextCheckPoint].Pos.x, kayscoreConfigServ.ConfigAutoEcole.CheckPoints[nextCheckPoint].Pos.y, kayscoreConfigServ.ConfigAutoEcole.CheckPoints[nextCheckPoint].Pos.z)
                    SetBlipRoute(CurrentBlip, 1)

                    LastCheckPoint = CurrentCheckPoint
                end

                local distance = GetDistanceBetweenCoords(coords, kayscoreConfigServ.ConfigAutoEcole.CheckPoints[nextCheckPoint].Pos.x, kayscoreConfigServ.ConfigAutoEcole.CheckPoints[nextCheckPoint].Pos.y, kayscoreConfigServ.ConfigAutoEcole.CheckPoints[nextCheckPoint].Pos.z, true)

                if distance <= 100.0 then
                    DrawMarker(1, kayscoreConfigServ.ConfigAutoEcole.CheckPoints[nextCheckPoint].Pos.x, kayscoreConfigServ.ConfigAutoEcole.CheckPoints[nextCheckPoint].Pos.y, kayscoreConfigServ.ConfigAutoEcole.CheckPoints[nextCheckPoint].Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, kayscoreConfigServ.R, kayscoreConfigServ.G, kayscoreConfigServ.B, kayscoreConfigServ.A, false, true, 2, false, false, false, false)
                end

                if distance <= 3.0 then
                    kayscoreConfigServ.ConfigAutoEcole.CheckPoints[nextCheckPoint].Action(playerPed, CurrentVehicle, SetCurrentZoneType)
                    CurrentCheckPoint = CurrentCheckPoint + 1
                end
            end
        else
            -- not currently taking driver test
            Citizen.Wait(500)
        end
    end
end)

-- Speed / Damage control
Citizen.CreateThread(function()
    while true do
        Wait(1000)

        if CurrentTest == 'drive' then

            local playerPed = PlayerPedId()

            if IsPedInAnyVehicle(playerPed, false) then

                local vehicle = GetVehiclePedIsIn(playerPed, false)
                local speed = GetEntitySpeed(vehicle) * kayscoreConfigServ.ConfigAutoEcole.SpeedMultiplier
                local tooMuchSpeed = false

                for k, v in pairs(kayscoreConfigServ.ConfigAutoEcole.SpeedLimits) do
                    if CurrentZoneType == k and speed > v then
                        tooMuchSpeed = true

                        if not IsAboveSpeedLimit then
                            DriveErrors = DriveErrors + 1
                            IsAboveSpeedLimit = true

                            Notification((('Vous roulez trop vite, vitesse limite: ~y~%s~s~ km/h!'):format(v)))
                            Notification(('Erreurs: ~r~%s~s~/%s'):format(DriveErrors, kayscoreConfigServ.ConfigAutoEcole.MaxErrors))
                        end
                    end
                end

                if not tooMuchSpeed then
                    IsAboveSpeedLimit = false
                end

                local health = GetEntityHealth(vehicle)
                if health < LastVehicleHealth then

                    DriveErrors = DriveErrors + 1

                    Notification('~r~Vous avez endommagé votre véhicule.')
                    Notification(('Erreurs: ~r~%s~s~/%s'):format(DriveErrors, kayscoreConfigServ.ConfigAutoEcole.MaxErrors))



                    -- avoid stacking faults
                    LastVehicleHealth = health
                    Citizen.Wait(1500)
                end
            end
        else
            -- not currently taking driver test
            Citizen.Wait(500)
        end
    end
end)
