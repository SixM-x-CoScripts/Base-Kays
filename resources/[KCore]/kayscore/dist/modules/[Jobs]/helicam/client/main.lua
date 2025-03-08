local HeliCamActive = false
local HelicamFOV = (helicamCFG.camFOVMax+helicamCFG.camFOVMin)/2
local HeliCameraMode = 0
local HeliTargetedVehicle = nil
local HeliCheckTargetVehicleTimeout = 0
local HeliLight = false
local HeliLightAction = false
local HeliLightsDrawn = {}
local HeliInRappel = false

function IsHeliHighEnoughForCamera(vehicle) 
	return GetEntityHeightAboveGround(vehicle) > math.abs(helicamCFG.camCoords.z)
end

AddEventHandler("player:enteredVehicle", function(vehicle, seat)
    Citizen.CreateThread(function()
        while not ESX do 
            Wait(10)
        end

        if HeliThread ~= nil then return end
		
        local model = GetEntityModel(vehicle)

        if not IsThisModelAHeli(model) then return end
        if not helicamCFG.helicoptersList[model] then return end
        HeliThread = true
        while DoesEntityExist(vehicle) and IsPedInAnyVehicle(Player.playerPed, false) and GetVehiclePedIsIn(Player.playerPed, false) == vehicle and Player.seat == seat do
            
            if not IsThisModelAHeli(model) then
                return
            end

            if GetPedInVehicleSeat(vehicle, 0) == Player.playerPed then
                ESX.ShowHelpNotification(('~INPUT_CONTEXT~ %s la caméra%s%s'):format(HeliCamActive == true and "Eteindre" or "Allumer", HeliCamActive == true and ("\n~INPUT_REPLAY_HIDEHUD~ %s le projecteur"):format(HeliLight == true and "Eteindre" or "Allumer") or '', "\n~INPUT_NEXT_CAMERA~ Changer de vue"))
            end

            if GetPedInVehicleSeat(vehicle, 1) == Player.playerPed or GetPedInVehicleSeat(vehicle, 2) == Player.playerPed and not HeliInRappel then
                ESX.ShowHelpNotification('~INPUT_REPLAY_SHOWHOTKEY~ Descendre en rappel')
            end

            if GetPedInVehicleSeat(vehicle, 0) == Player.playerPed and IsControlJustPressed(0, 51) and IsHeliHighEnoughForCamera(vehicle) and helicamCFG.allowedJobs[ESX.PlayerData.job.name] then -- E : Toggle Helicam
                PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
                HeliCamActive = not HeliCamActive
                if HeliCamActive then
                    StartHelicamThread(vehicle)
                end
            end

            if helicamCFG.helicoptersList[model] and IsControlJustPressed(0, 311) and IsHeliHighEnoughForCamera(vehicle) and not HeliInRappel then
                if GetPedInVehicleSeat(vehicle, -1) == Player.playerPed or GetPedInVehicleSeat(vehicle, 0) == Player.playerPed then
                    ESX.ShowNotification('⚠️Vous ne pouvez pas descendre en rappel depuis cette place')
                else
                    HeliInRappel = true
                    TaskRappelFromHeli(Player.playerPed, 1)
                    Citizen.CreateThread(function()
                        while GetEntityHeightAboveGround(Player.playerPed) > 3.0 do
                            if GetEntitySpeed(vehicle)*3.6 > 25.0 then
                                ClearPedTasksImmediately(Player.playerPed)
                                break
                            end
                            Citizen.Wait(300)
                        end
                        HeliInRappel = false
                    end)
                end
            end

            Citizen.Wait(0)
        end
        HeliThread = nil
    end)
end)

function HeliRotAnglesToVec(rot) -- input vector3
	local z = math.rad(rot.z)
	local x = math.rad(rot.x)
	local num = math.abs(math.cos(x))
	return vector3(-math.sin(z)*num, math.cos(z)*num, math.sin(x))
end

function HeliGetTargetedVehicle(cam, heliEntity)
    local coords = GetCamCoord(cam)
	local forwardVector = HeliRotAnglesToVec(GetCamRot(cam, 2))
	local rayhandle = CastRayPointToPoint(coords, coords+forwardVector*300.0, 10, heliEntity, 0)
	local _, _, _, _, entityHit = GetRaycastResult(rayhandle)
	if entityHit > 0 and IsEntityAVehicle(entityHit) then
		return entityHit
	else
		return nil
	end
end

function HeliCamHandleVehicleInfo(cam, heliEntity)
    if HeliCheckTargetVehicleTimeout < GetGameTimer() then
        HeliCheckTargetVehicleTimeout = GetGameTimer() + 2000
        local target = HeliGetTargetedVehicle(cam, heliEntity)
        if target and not HeliTargetedVehicle or (target and target ~= HeliTargetedVehicle) then
            PlaySoundFrontend(-1, "Close", "DLC_H3_Tracker_App_Sounds", false)
        end
        HeliTargetedVehicle = target
    end

    if DoesEntityExist(HeliTargetedVehicle) then
        local vehicle = HeliTargetedVehicle
        local model = GetEntityModel(vehicle)
		local vehname = GetLabelText(GetDisplayNameFromVehicleModel(model))
		local speed = GetEntitySpeed(vehicle)*3.6
		SetTextFont(0)
		SetTextProportional(1)
		SetTextScale(0.0, 0.49)
		SetTextColour(255, 255, 255, 255)
		SetTextDropshadow(0, 0, 0, 0, 255)
		SetTextEdge(1, 0, 0, 0, 255)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry("STRING")
		AddTextComponentString("Vitesse: " .. math.ceil(speed) .. " Km/h" .. "\nVéhicule: " .. vehname) -- .. "\nPlate: " .. ESX.Math.Trim(plate))
		DrawText(0.85, 0.8)
    end
end

function StartHelicamThread(vehicle)
    SetTimecycleModifier("heliGunCam")
    SetTimecycleModifierStrength(0.2)
    local scaleform = RequestScaleformMovie("HELI_CAM")
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(50)
    end

    local cam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA", true)
    AttachCamToEntity(cam, vehicle, helicamCFG.camCoords.x, helicamCFG.camCoords.y, helicamCFG.camCoords.z, true)
    SetCamRot(cam, 0.0, 0.0, GetEntityHeading(vehicle))
    SetCamFov(cam, helicamCFG.camFOV)
    RenderScriptCams(true, false, 0, 1, 0)
    PushScaleformMovieFunction(scaleform, "SET_CAM_LOGO")
    PushScaleformMovieFunctionParameterInt(ESX.PlayerData.job.name == 'police' and 1 or 0) -- 0 for nothing, 1 for LSPD logo
    PopScaleformMovieFunctionVoid()

    HeliCameraMode = 0
    local canChangeCameraMode = ESX.PlayerData.job.name == 'weazelnews' or false
    local canViewVehicleInfo = ESX.PlayerData.job.name == 'police' or  ESX.PlayerData.job.name == 'bcso'

    Citizen.CreateThread(function()
        while HeliCamActive and DoesEntityExist(vehicle) and Player.vehicle == vehicle and not IsEntityDead(Player.playerPed) and not IsEntityDead(vehicle) do

            -- Hide HUD
            HideHudAndRadarThisFrame()

            -- CameraMode
            if canChangeCameraMode and IsControlJustPressed(0, 0) then
                HeliCameraMode = HeliCameraMode == 1 and 0 or HeliCameraMode + 1
            end

            if IsControlJustPressed(0, 74) then -- Light
                if HeliLightAction == false then
                    if HeliLight then
                        HeliLight = false
                        TriggerServerEvent('helicopters:server:stopSpotlight', NetworkGetNetworkIdFromEntity(vehicle))
                    else 
                        canUseSpotlight(cam, vehicle)
                    end
                else
                    ESX.ShowNotification("⚠️Vous etes déja en train d'allumer le projecteur")
                end
            end

            -- Rotation
            local rightAxisX = GetControlNormal(0, 220)
            local rightAxisY = GetControlNormal(0, 221)
            local rotation = GetCamRot(cam, 2)
            local newZ = rotation.z - rightAxisX*helicamCFG.camMoveSpeed*(HelicamFOV+0.1)
            local newX = math.max(math.min(20.0, rotation.x - rightAxisY*helicamCFG.camMoveSpeed*(HelicamFOV+0.1)), -89.5) -- Clamping at top (cant see top of heli) and at bottom (doesn't glitch out in -90deg)
            SetCamRot(cam, newX, 0.0, newZ, 2)

            -- Zoom
            DisableControlAction(0, 81, true)
            DisableControlAction(0, 82, true)
            if IsControlPressed(0, 241) then -- Scrollup
                HelicamFOV = math.max(HelicamFOV - helicamCFG.camFOVZoom, helicamCFG.camFOVMin)
                SetCamFov(cam, HelicamFOV)
            end
            if IsControlPressed(0, 242) then -- ScrollDown
                HelicamFOV = math.min(HelicamFOV + helicamCFG.camFOVZoom, helicamCFG.camFOVMax)
                SetCamFov(cam, HelicamFOV)
            end

            -- Scaleform
            PushScaleformMovieFunction(scaleform, "SET_ALT_FOV_HEADING")
            PushScaleformMovieFunctionParameterFloat(GetEntityCoords(vehicle).z)
            PushScaleformMovieFunctionParameterFloat((1.0/(helicamCFG.camFOVMax-helicamCFG.camFOVMin))*(HelicamFOV-helicamCFG.camFOVMin))
            PushScaleformMovieFunctionParameterFloat(GetCamRot(cam, 2).z)
            PopScaleformMovieFunctionVoid()

            if HeliCameraMode == 0 then
                DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
            end

            if canViewVehicleInfo then
                HeliCamHandleVehicleInfo(cam, vehicle)
            end

            Citizen.Wait(0)
        end

        if HeliLight then
            HeliLight = false
            TriggerServerEvent('helicopters:server:stopSpotlight', NetworkGetNetworkIdFromEntity(vehicle))
        end

        HeliLightAction = false

        TriggerServerEvent('helicopters:server:stopSpotlight', NetworkGetNetworkIdFromEntity(vehicle))
        ClearTimecycleModifier()
        RenderScriptCams(false, false, 0, 1, 0)
        SetScaleformMovieAsNoLongerNeeded(scaleform)
        DestroyCam(cam, false)
    end)
end

function canUseSpotlight(cam, vehicle)
    HeliLightAction = true 
    ESX.ShowNotification('📽️ Allumage des projecteurs..')
    Citizen.SetTimeout(2500, function()
        ESX.TriggerServerCallback('helicopters:server:requestSpotlight', function(canUse)
            if canUse then
                HeliLight = true
                StartHeliLightSyncThread(cam, vehicle)
            end
            HeliLightAction = false
        end, NetworkGetNetworkIdFromEntity(vehicle))
    end)
end

function StartHeliLightSyncThread(cam, heliEntity)
    local lastSyncTimer = 0
    local oldCamRot = vector3(0.0, 0.0, 0.0)

    Citizen.CreateThread(function()
        while HeliLight do
            local camRot = GetCamRot(cam, 2)
            local camRotVar = #(camRot - oldCamRot)
            oldCamRot = camRot
            local now = GetGameTimer()
            if camRotVar > 10.0 and (lastSyncTimer + helicamCFG.lightSyncDelay/2) < now or lastSyncTimer + helicamCFG.lightSyncDelay < now then
                local duration = now - lastSyncTimer
                lastSyncTimer = now
                local closePlayersServerIds = ESX.Game.GetPlayersServerIdsInArea(GetEntityCoords(heliEntity), helicamCFG.lightSyncRadius, true)
                TriggerServerEvent('helicopters:server:useSpotlight', closePlayersServerIds, NetworkGetNetworkIdFromEntity(heliEntity), RotAnglesToVec(camRot))
            end
            Citizen.Wait(1000)
        end        
    end)
end

RegisterNetEvent('helicopters:client:stopSpotlightThread', function()
    HeliLight = false
    HeliLightAction = false
end)


RegisterNetEvent('helicopters:client:useSpotlight')
AddEventHandler('helicopters:client:useSpotlight', function(netId, camRot, vehiclePosition)
    if not NetworkDoesEntityExistWithNetworkId(netId) then
        return
    end

    local vehicle = NetworkGetEntityFromNetworkId(netId)
    if not DoesEntityExist(vehicle) or not IsThisModelAHeli(GetEntityModel(vehicle)) then
        return
    end

    if #(Player.coords - vehiclePosition) > 500 then return end

    HeliLightsDrawn[netId] = {
        rotation = camRot,
        entity = vehicle,
        cooldown = 5000
    }
end)

RegisterNetEvent('helicopters:client:stopSpotlight', function(netId)
    HeliLightsDrawn[netId] = nil
end)

Citizen.CreateThread(function()
    local loopWait = 2500
    
    while not ESX do 
        Wait(10)
    end

    while true do
        if ESX.Table.SizeOf(HeliLightsDrawn) > 0 then
            loopWait = 0
        else
            loopWait = 2500
        end

        Citizen.Wait(loopWait)

        for k,v in pairs(HeliLightsDrawn) do
            if v.entity == nil or not DoesEntityExist(v.entity) then
                HeliLightsDrawn[k] = nil
                goto continue
            end

            if GetPedInVehicleSeat(v.entity, 0) == nil then
                HeliLightsDrawn[k] = nil
                goto continue
            end

            local door = GetEntityBoneIndexByName(v.entity, "door_dside_f")
            local windscreen = GetEntityBoneIndexByName(v.entity, "windscreen")
            local coords = GetWorldPositionOfEntityBone(v.entity, door)
            local windowCoords = GetWorldPositionOfEntityBone(v.entity, windscreen)
            local direct = vector3(v.rotation.x, v.rotation.y, v.rotation.z)
            
            DrawSpotLight(coords.x, windowCoords.y, coords.z, direct.x, direct.y, direct.z, 255, 255, 255, 300.0, 1.0, 4.0, 25.0, 1.0)
            
            ::continue::
        end
    end
end)


local VehicleAttached = false
local vehCargobob = ""
AddEventHandler("gameEventTriggered", function(eventName, eventArguments)
    if eventName == 'CEventNetworkPlayerEnteredVehicle' then 
        local entityId = eventArguments[2]
        if DoesEntityExist(entityId) then 
            local entityModel = GetEntityModel(entityId)

            if not Helicopters.CargobobsList[entityModel] then
                return
            end

            local instructions = SetupInstructionalButtons({ {key = 38, label = 'Déployer l\'aimant'}, {key = 311, label = 'Activer l\'aimant'} })
            vehCargobob = entityId
            while DoesEntityExist(entityId) and GetPedInVehicleSeat(entityId, -1) == Player.playerPed do

                DrawScaleformMovieFullscreen(instructions, 255, 255, 255, 255, 0)
                DisableControlAction(0, 103, true)
        
                if IsControlJustPressed(0, 311) and DoesCargobobHavePickupMagnet(entityId) then
                    if VehicleAttached then
                        instructions = SetupInstructionalButtons({ {key = 38, label = 'Déployer l\'aimant'}, {key = 311, label = 'Activer l\'aimant'} })
                        SetCargobobPickupMagnetActive(entityId, false)
                        SetCargobobPickupMagnetStrength(entityId, 0.0)
                        VehicleAttached = false
                    else
                        local hookCoords = GetCargobobHookPosition(entityId)
                        local vehicle = GetClosestVehicle2(hookCoords, 10.0, false, Helicopters.CargobobsList, true)
                        if not DoesEntityExist(vehicle) then
                            ESX.ShowNotification("Il n'y a pas de véhicule près de l'aimant")
                        else
                            instructions = SetupInstructionalButtons({ {key = 38, label = 'Déployer l\'aimant'}, {key = 311, label = 'Désactiver l\'aimant'} })
                            SetCargobobPickupMagnetActive(entityId, true)
                            SetCargobobPickupMagnetStrength(entityId, 1.5)
                            VehicleAttached = true
                        end
                    end     
                end
        
                Citizen.Wait(0)
            end
            vehCargobob = ""
        end
    end
end)

RegisterCommand("activeMagnetCargobob", function(source,args)
    if vehCargobob == "" then return end
    
    if (DoesEntityExist(vehCargobob)) then 
        if GetPedInVehicleSeat(vehCargobob, -1) == Player.playerPed then 
            if not DoesCargobobHavePickupMagnet(vehCargobob) then 
                CreatePickUpRopeForCargobob(vehCargobob, 1)
                SetCargobobPickupMagnetActive(vehCargobob, false)
                SetCargobobPickupMagnetEffectRadius(vehCargobob, 0.0)
                SetCargobobPickupMagnetPullStrength(vehCargobob, 0.0)
                SetCargobobPickupMagnetStrength(vehCargobob, 0.0)
                SetCargobobPickupMagnetReducedFalloff(vehCargobob, 0.0)
            end
        end
    end
end)
RegisterKeyMapping('activeMagnetCargobob', 'Activer l\'aimant du Cargobob', 'keyboard', 'E')