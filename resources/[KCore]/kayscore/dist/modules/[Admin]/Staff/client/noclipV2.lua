local breakSpeed = 10.0;

RegisterCommand("wnoclip", function(source, args, rawCommand)
    if not adminManagement.Service then return end
        if Config.Staff.HavePermission('Modules', 'noClip') then 
            if adminManagement.NoClip == true then
                ToggleNoClipMode()
                adminManagement.NoClip = false
            else
                ToggleNoClipMode()
                adminManagement.NoClip = true

            end
        end
end)

RegisterKeyMapping('wnoclip', 'Noclip', 'keyboard', Config.Staff.NoClip.touchewnoclip)


function ToggleNoClipMode()
    return NoClip(not adminManagement.NoClip)
end

local NoClipSpeedMax = Config.Staff.NoClip.vitessespeednoclip
local normalSpeed = Config.Staff.NoClip.vitessenormalnoclip

function NoClip(bool)
    if (adminManagement.NoClip == false) then
        
        noClippingEntity = PlayerPedId();
        
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false);
            if IsPedDrivingVehicle(PlayerPedId(), veh) then
                noClippingEntity = veh;
            end
        end
        
        local isVeh = IsEntityAVehicle(noClippingEntity);
        
        adminManagement.NoClip = bool;
        SetUserRadioControlEnabled(not adminManagement.NoClip);
        
        if (adminManagement.NoClip) then
            SetEntityAlpha(noClippingEntity, 51, 0)
            CreateThread(function()
                    
                    local clipped = noClippingEntity
                    local pPed = PlayerPedId();
                    local isClippedVeh = isVeh;
                    
                    SetInvincible(true, clipped);
                    
                    if not isClippedVeh then
                        ClearPedTasksImmediately(pPed)
                    end
                    
                    while adminManagement.NoClip do
                        Wait(0);
                        
                        FreezeEntityPosition(clipped, true);
                        SetEntityCollision(clipped, false, false);
                        
                        SetEntityVisible(clipped, false, false);
                        SetLocalPlayerVisibleLocally(true);
                        SetEntityAlpha(clipped, 51, false)
                        
                        SetEveryoneIgnorePlayer(pPed, true);
                        SetPoliceIgnorePlayer(pPed, true);
                        
                        input = vector3(GetControlNormal(0, 30), GetControlNormal(0, 31), (IsControlAlwaysPressed(1, 38) and 1) or ((IsControlAlwaysPressed(1, 44) and -1) or 0))
                        speed = ((IsControlAlwaysPressed(1, 21) and NoClipSpeedMax) or normalSpeed) * ((isClippedVeh and 2.75) or 1)
                        
                        SetEntityRotation(noClippingEntity, GetGameplayCamRot(0), 0, false)
                        local forward, right, up, c = GetEntityMatrix(noClippingEntity);
                        previousVelocity = Lerp(previousVelocity, (((right * input.x * speed) + (up * -input.z * speed) + (forward * -input.y * speed))), Timestep() * breakSpeed);
                        c = c + previousVelocity
                        SetEntityCoords(noClippingEntity, c - offset, true, true, true, false)
                    
                    end
                    Wait(0);
                    
                    FreezeEntityPosition(clipped, false);
                    SetEntityCollision(clipped, true, true);
                    
                    SetEntityVisible(clipped, true, false);
                    SetLocalPlayerVisibleLocally(true);
                    ResetEntityAlpha(clipped);
                    
                    SetEveryoneIgnorePlayer(pPed, false);
                    SetPoliceIgnorePlayer(pPed, false);
                    ResetEntityAlpha(clipped);
                    
                    Wait(500);
                    
                    if isClippedVeh then
                        while (not IsVehicleOnAllWheels(clipped)) and not adminManagement.NoClip do
                            Wait(0);
                        end
                        while not adminManagement.NoClip do
                            Wait(0);
                            if IsVehicleOnAllWheels(clipped) then
                                return SetInvincible(false, clipped);
                            end
                        end
                    else
                        if (IsPedFalling(clipped) and math.abs(1 - GetEntityHeightAboveGround(clipped)) > eps) then
                            while (IsPedStopped(clipped) or not IsPedFalling(clipped)) and not adminManagement.NoClip do
                                Wait(0);
                            end
                        end
                        while not adminManagement.NoClip do
                            Wait(0);
                            if (not IsPedFalling(clipped)) and (not IsPedRagdoll(clipped)) then
                                return SetInvincible(false, clipped);
                            end
                        end
                    end
            end)
        else
            ResetEntityAlpha(noClippingEntity)
        end
    end
end

function getCamDirection()
    local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId())
    local pitch = GetGameplayCamRelativePitch()
    local coords = vector3(-math.sin(heading * math.pi / 180.0), math.cos(heading * math.pi / 180.0), math.sin(pitch * math.pi / 180.0))
    local len = math.sqrt((coords.x * coords.x) + (coords.y * coords.y) + (coords.z * coords.z))
    
    if len ~= 0 then
        coords = coords / len
    end
    
    return coords
end

local eps = 0.01
local speed = 0.5
local input = vector3(0, 0, 0)
local previousVelocity = vector3(0, 0, 0)
local breakSpeed = 10.0;
local offset = vector3(0, 0, 1);
local noClippingEntity = PlayerPedId();
function ToggleNoClipMode()
    return NoClip(not adminManagement.NoClip)
end
function IsControlAlwaysPressed(inputGroup, control) return IsControlPressed(inputGroup, control) or IsDisabledControlPressed(inputGroup, control) end
function IsControlAlwaysJustPressed(inputGroup, control) return IsControlJustPressed(inputGroup, control) or IsDisabledControlJustPressed(inputGroup, control) end
function Lerp(a, b, t) return a + (b - a) * t end
function IsPedDrivingVehicle(ped, veh)
    return ped == GetPedInVehicleSeat(veh, -1);
end
function SetInvincible(val, id)
    SetEntityInvincible(id, val)
    return SetPlayerInvincible(id, val)
end

function NoClip(bool)
    if (adminManagement.NoClip == false) then
        
        noClippingEntity = PlayerPedId();
        
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false);
            if IsPedDrivingVehicle(PlayerPedId(), veh) then
                noClippingEntity = veh;
            end
        end
        
        local isVeh = IsEntityAVehicle(noClippingEntity);
        
        adminManagement.NoClip = bool;
        SetUserRadioControlEnabled(not adminManagement.NoClip);
        
        if (adminManagement.NoClip) then
            SetEntityAlpha(noClippingEntity, 51, 0)
            CreateThread(function()
                    
                    local clipped = noClippingEntity
                    local pPed = PlayerPedId();
                    local isClippedVeh = isVeh;

                    
                    SetInvincible(true, clipped);

                    if not isClippedVeh then
                        ClearPedTasksImmediately(pPed)
                    end
                    
                    while adminManagement.NoClip do
                        Wait(0);
                        
                        FreezeEntityPosition(clipped, true);
                        
                        SetEntityCollision(clipped, false, false);
                        SetEntityAlpha(entity, 255, false)
                        SetEntityVisible(clipped, false, false);
                        SetLocalPlayerVisibleLocally(true);
                        SetEntityAlpha(clipped, 51, false)
                        
                        SetEveryoneIgnorePlayer(pPed, true);
                        SetPoliceIgnorePlayer(pPed, true);

                        SetPoliceIgnorePlayer(playerPed, false)
                        FreezeEntityPosition(entity, false)
                        SetEntityCollision(entity, true, true)
                        SetEntityVisible(entity, true, false)

                        
                        input = vector3(GetControlNormal(0, 30), GetControlNormal(0, 31), (IsControlAlwaysPressed(1, 38) and 1) or ((IsControlAlwaysPressed(1, 44) and -1) or 0))
                        speed = ((IsControlAlwaysPressed(1, 21) and NoClipSpeedMax) or normalSpeed) * ((isClippedVeh and 2.75) or 1)
                        
                        SetEntityRotation(noClippingEntity, GetGameplayCamRot(0), 0, false)
                        local forward, right, up, c = GetEntityMatrix(noClippingEntity);
                        previousVelocity = Lerp(previousVelocity, (((right * input.x * speed) + (up * -input.z * speed) + (forward * -input.y * speed))), Timestep() * breakSpeed);
                        c = c + previousVelocity
                        SetEntityCoords(noClippingEntity, c - offset, true, true, true, false)
                    
                    end
                    Wait(0);
                    
                    FreezeEntityPosition(clipped, false);
                    SetEntityCollision(clipped, true, true);

                    SetEntityVisible(clipped, true, false);
                    SetLocalPlayerVisibleLocally(true);
                    ResetEntityAlpha(clipped);
                    
                    SetEveryoneIgnorePlayer(pPed, false);
                    SetPoliceIgnorePlayer(pPed, false);
                    ResetEntityAlpha(clipped);

                    
                    Wait(500);
                    
                    if isClippedVeh then
                        while (not IsVehicleOnAllWheels(clipped)) and not adminManagement.NoClip do
                            Wait(0);
                        end
                        while not adminManagement.NoClip do
                            Wait(0);
                            if IsVehicleOnAllWheels(clipped) then
                                return SetInvincible(false, clipped);
                            end
                        end
                    else
                        if (IsPedFalling(clipped) and math.abs(1 - GetEntityHeightAboveGround(clipped)) > eps) then
                            while (IsPedStopped(clipped) or not IsPedFalling(clipped)) and not adminManagement.NoClip do
                                Wait(0);
                            end
                        end
                        while not adminManagement.NoClip do
                            Wait(0);
                            if (not IsPedFalling(clipped)) and (not IsPedRagdoll(clipped)) then
                                return SetInvincible(false, clipped);
                            end
                        end
                    end
            end)
        else
            ResetEntityAlpha(noClippingEntity)
        end
    end
end

function ResetNoClipState(entity, playerPed)
    SetEntityAlpha(entity, 255, false)
    SetEntityInvincible(entity, false)
    SetEveryoneIgnorePlayer(playerPed, false)
    SetPoliceIgnorePlayer(playerPed, false)
    FreezeEntityPosition(entity, false)
    SetEntityCollision(entity, true, true)
    SetEntityVisible(entity, true, false)
end

function IsControlAlwaysPressed(inputGroup, control)
    return IsControlPressed(inputGroup, control) or IsDisabledControlPressed(inputGroup, control)
end

function IsPedDrivingVehicle(ped, veh)
    return ped == GetPedInVehicleSeat(veh, -1)
end