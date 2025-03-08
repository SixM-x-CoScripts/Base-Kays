mp_pointing = false
keyPressed = false

RegisterCommand('+pointing', function(_,args)
    if not IsPedInAnyVehicle(PlayerPedId(), true) then
        if not IsPedInAnyVehicle(PlayerPedId(), false) and not IsPedSwimming(PlayerPedId()) and not IsPedShooting(PlayerPedId()) and not IsPedClimbing(PlayerPedId()) and not IsPedCuffed(PlayerPedId()) and not IsPedDiving(PlayerPedId()) and not IsPedFalling(PlayerPedId()) and not IsPedJumpingOutOfVehicle(PlayerPedId()) and not IsPedUsingAnyScenario(PlayerPedId()) and not IsPedInParachuteFreeFall(PlayerPedId()) then
            if not keyPressed then
                keyPressed = true
                startPointing()
                mp_pointing = true
                start_pointing()
            else
                stopPointing()
                keyPressed = false
                mp_pointing = false
                animation_pointing = false
            end
        end
    end
end)

RegisterKeyMapping('+pointing', 'Pointer du doigt', 'keyboard', "B")

function startPointing()
    local ped = PlayerPedId()
    RequestAnimDict("anim@mp_point")
    while not HasAnimDictLoaded("anim@mp_point") do
        Wait(0)
    end
    SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
    SetPedConfigFlag(ped, 36, 1)
    Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
    RemoveAnimDict("anim@mp_point")
end

function stopPointing()
    local ped = PlayerPedId()
    Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")
    if not IsPedInjured(ped) then
        ClearPedSecondaryTask(ped)
    end
    if not IsPedInAnyVehicle(ped, 1) then
        SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
    end
    SetPedConfigFlag(ped, 36, 0)
    ClearPedSecondaryTask(PlayerPedId())
end

animation_pointing = false

function start_pointing()
    animation_pointing = true
    Citizen.CreateThread(function()
        while animation_pointing do
            Wait(0)
            if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) and not mp_pointing then
                stopPointing()
            end
            if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) then
                if not IsPedOnFoot(PlayerPedId()) then
                    stopPointing()
                else
                    local ped = PlayerPedId()
                    local camPitch = GetGameplayCamRelativePitch()
                    if camPitch < -70.0 then
                        camPitch = -70.0
                    elseif camPitch > 42.0 then
                        camPitch = 42.0
                    end
                    camPitch = (camPitch + 70.0) / 112.0
    
                    local camHeading = GetGameplayCamRelativeHeading()
                    local cosCamHeading = Cos(camHeading)
                    local sinCamHeading = Sin(camHeading)
                    if camHeading < -180.0 then
                        camHeading = -180.0
                    elseif camHeading > 180.0 then
                        camHeading = 180.0
                    end
                    camHeading = (camHeading + 180.0) / 360.0
    
                    local blocked = 0
                    local nn = 0
    
                    local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
                    local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7);
                    nn,blocked,coords,coords = GetRaycastResult(ray)
    
                    Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Pitch", camPitch)
                    Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Heading", camHeading * -1.0 + 1.0)
                    Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isBlocked", blocked)
                    Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isFirstPerson", Citizen.InvokeNative(0xEE778F8C7E1142E2, Citizen.InvokeNative(0x19CAFA3C87F7C2FF)) == 4)
    
                end
            end
        end
    end)
end

local handsup = false

RegisterCommand('+levermain', function()
    if DoesEntityExist(PlayerPedId()) and not IsEntityDead(PlayerPedId()) then
        if not IsPedInAnyVehicle(PlayerPedId(), false) and not IsPedSwimming(PlayerPedId()) and not IsPedShooting(PlayerPedId()) and not IsPedClimbing(PlayerPedId()) and not IsPedCuffed(plyPed) and not IsPedDiving(PlayerPedId()) and not IsPedFalling(PlayerPedId()) and not IsPedJumpingOutOfVehicle(PlayerPedId()) and not IsPedUsingAnyScenario(PlayerPedId()) and not IsPedInParachuteFreeFall(PlayerPedId()) then
            RequestAnimDict("random@mugging3")

            while not HasAnimDictLoaded("random@mugging3") do
                Citizen.Wait(100)
            end

            if not handsup then
                handsup = true
                TaskPlayAnim(PlayerPedId(), "random@mugging3", "handsup_standing_base", 8.0, -8, -1, 49, 0, 0, 0, 0)
            elseif handsup then
                handsup = false
                ClearPedSecondaryTask(PlayerPedId())
            end
        end
    end
end)

RegisterKeyMapping('+levermain', 'Lever les mains', 'keyboard', 'x')
ragodoll = false
local IsRagdollPut = false
local canRagdoll = true

RegisterCommand('+ragdoll', function()
    if exports['kayscore']:geIsDead() then return end
    if not canRagdoll then return end
    if not DoesEntityExist(PlayerPedId()) and IsEntityDead(PlayerPedId()) then return end
    if not IsPedInAnyVehicle(PlayerPedId(), false) and not IsPedSwimming(PlayerPedId()) and not IsPedShooting(PlayerPedId()) and not IsPedClimbing(PlayerPedId()) and not IsPedCuffed(plyPed) and not IsPedDiving(PlayerPedId()) and not IsPedFalling(PlayerPedId()) and not IsPedJumpingOutOfVehicle(PlayerPedId()) and not IsPedUsingAnyScenario(PlayerPedId()) and not IsPedInParachuteFreeFall(PlayerPedId()) then

    IsRagdollPut = not IsRagdollPut
    while IsRagdollPut do
        Wait(0)
        local entityAlpha = GetEntityAlpha(Player.playerPed)
        if entityAlpha < 100 then
            Citizen.Wait(0)
        else
            if IsRagdollPut and IsControlJustReleased(1, 22) or IsRagdollPut and IsControlJustReleased(1, 51) then
                ragodoll = false
                IsRagdollPut = not IsRagdollPut
                break
            end
            if IsRagdollPut then
                SetPedRagdollForceFall(Player.playerPed)
                ResetPedRagdollTimer(Player.playerPed)
                SetPedToRagdoll(Player.playerPed, 1000, 1000, 3, 0, 0, 0)
                ResetPedRagdollTimer(Player.playerPed)
                ragodoll = true
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ ou ~INPUT_JUMP~ pour ~p~vous relever~w~.")
                end
            end
        end    
    end
end, false)

RegisterKeyMapping('+ragdoll', 'S\'endormir / se réveiller', 'keyboard', 'j')

function CanRagdoll (state)
    canRagdoll = state
end

exports('CanRagdoll', CanRagdoll)

function isRagdoll()
    if imKoWithMelee then
        return true
    end

    if IsRagdollPut then 
        return true 
    end

    return false
end

RegisterNetEvent('kayscore:vip:updateVehiclePlate')
AddEventHandler('kayscore:vip:updateVehiclePlate', function(vehicleNetId, newPlate)
    local vehicle = NetworkGetEntityFromNetworkId(vehicleNetId)
    if DoesEntityExist(vehicle) then
        SetVehicleNumberPlateText(vehicle, newPlate)
    else
        ESX.ShowNotification("~r~Erreur : le véhicule est introuvable.")
    end
end)

RegisterCommand('noir', function()
    noir = not noir
    if noir then 
        DisplayRadar(false) 
        TriggerEvent('kayscore:zzhud:update', false)
    end
    while noir do
        if not HasStreamedTextureDictLoaded('revolutionbag') then
            RequestStreamedTextureDict('revolutionbag')
            while not HasStreamedTextureDictLoaded('revolutionbag') do
                Citizen.Wait(50)
            end
        end

        DrawSprite('revolutionbag', 'cinema', 0.5, 0.5, 1.0, 1.0, 0.0, 255, 255, 255, 255)
        Citizen.Wait(0)
    end
    DisplayRadar(true)
    TriggerEvent('kayscore:zzhud:update', true)
    SetStreamedTextureDictAsNoLongerNeeded('revolutionbag')
end)

local crouched = false
local GUI = {}
GUI.Time = 0

RegisterCommand('+accroupir', function() 
RequestAnimSet("move_ped_crouched")

    while not HasAnimSetLoaded("move_ped_crouched") do 
        Citizen.Wait(100)
    end 

    if crouched == true then 
        ResetPedMovementClipset(PlayerPedId(), 0)
        crouched = false 
    elseif crouched == false then
        SetPedMovementClipset(PlayerPedId(), "move_ped_crouched", 0.25)
        crouched = true 
    end 

    GUI.Time = GetGameTimer()
end)
RegisterKeyMapping('+accroupir', 'S\'accroupir', 'keyboard', 'Z')

Citizen.CreateThread(function()
    while not ESX do Wait(1) end

    local value = GetResourceKvpString('preference_walk')

    if value == "move_m@multiplayer" then
        SetResourceKvp("preference_walk", "Defaultmale")
    elseif value == "move_f@multiplayer" then
        SetResourceKvp("preference_walk", "Defaultfemale")
    end

    if value == nil then
        local default = BasicDefault['male']

        if GetEntityModel(PlayerPedId()) == `mp_f_freemode_01` then
            default = BasicDefault['girl'] -- 3 SEC
        end
        setNewWalkStyle(default)
    else
        setNewWalkStyle(value)
    end
end)

function setNewWalkStyle(newWalk)
    SetResourceKvp('preference_walk', newWalk)
    return newWalk
end

function getWalkStyle()
    return GetResourceKvpString('preference_walk')
end

function RequestWalking(set)
    RequestAnimSet(set)
    while not HasAnimSetLoaded(set) do
        
      Citizen.Wait(1)
    end
end

function StartWykzWalkezjdhajzehdaz()
    
    local walkstyle = getWalkStyle()
    for k,v in pairs(Config.Personalmenu.WalkStyle) do
        if k == walkstyle then
            RequestWalking(v[1])
            SetPedMovementClipset(PlayerPedId(),v[1],0.2)
            RemoveAnimSet(v[1])
        end
    end
end

Citizen.CreateThread(function()
    local playerModel = GetEntityModel(PlayerPedId())
	while playerModel == `player_zero` or playerModel == `player_one` or playerModel == `a_m_y_stbla_02` do
		playerModel = GetEntityModel(PlayerPedId())
		Citizen.Wait(100)
	end
    RestoreWalk()
end)

function RestoreWalk()
    local name = GetResourceKvpString("preference_walk")

    if name and name ~= '' then
        StartWykzWalkezjdhajzehdaz()
    else
        ResetPedMovementClipset(PlayerPedId())
    end
end

Citizen.CreateThread(function()
    while not ESX do Wait(1) end
    
    local value = GetResourceKvpString(("%s:weaponTint"):format(kayscoreConfigServ.ServerName))

    if value == nil then
        setWeaponTint(0)
    else
        setWeaponTint(value)
    end
end)

function setWeaponTint(weaponTint)
    SetResourceKvp(("%s:weaponTint"):format(kayscoreConfigServ.ServerName), weaponTint)
    SetPedWeaponTintIndex(Player.playerPed, Player.weapon, tonumber(weaponTint))
    return value
end

function getWeaponTint(name)
    return tonumber(GetResourceKvpString(("%s:weaponTint"):format(kayscoreConfigServ.ServerName)))
end

AddEventHandler('kayscore:utils:changeweapon', function(weaponHash)
    while not ESX do Wait(10) end
    if weaponHash == `WEAPON_UNARMED` then return end
    if not VIP.haveVip() then return end

    local count = GetWeaponTintCount(weaponHash)

    for i = 0, count do 
        if i == getWeaponTint() then
            SetPedWeaponTintIndex(Player.playerPed, weaponHash, i)
        end
    end
end)

local kvpData = "Slide"

Citizen.CreateThread(function()
    while not ESX do Wait(1) end
    
    Wait(10000)

    for k, v in pairs(Config.WeaponsBinds) do
        local value = GetResourceKvpString(('%s:weaponKeybinds:%s'):format(kvpData, v.id))
        local value2 = GetResourceKvpString(('%s:weaponKeybinds:%s:label'):format(kvpData, v.id))


        if value == nil or value2 == nil then
            TriggerEvent("kayscore:inventory:sendSlots2", k, {label = v.weaponLabel, name = v.weapon})
            setWeaponKeybind(k, v.weapon, v.weaponLabel)
        else
            -- print('Loading saved weapon for slot', k)
            TriggerEvent("kayscore:inventory:sendSlots2", k, {label = value2, name = value})
            setWeaponKeybind(k, value, value2)
        end
    end
end)

function setWeaponKeybind(name, weaponHash, weaponLabel)
    SetResourceKvp(('%s:weaponKeybinds%s'):format(kvpData, name), weaponHash)
    SetResourceKvp(('%s:weaponKeybinds%s:label'):format(kvpData, name), weaponLabel)
    --TriggerEvent("kayscore:inventory:sendSlots2", name, weaponHash)
    return {weapon = weaponHash, label = weaponLabel}
end

function getWeaponKeybind(name)
    local value = GetResourceKvpString(('%s:weaponKeybinds%s'):format(kvpData, name))
    local value2 = GetResourceKvpString(('%s:weaponKeybinds%s:label'):format(kvpData, name))
    return {weapon = value, label = value2}
end
Citizen.CreateThread(function()
    while #Config.WeaponsBinds ~= 5 do print("wait", #Config.WeaponsBinds) Wait(100) end

    for i = 1, #Config.WeaponsBinds do
        RegisterCommand('weaponKeyBinds'..Config.WeaponsBinds[i].id, function()
            local keyboardData = getWeaponKeybind(Config.WeaponsBinds[i].id)
    
            if tonumber(keyboardData.weapon) == `WEAPON_UNARMED` then return end
            if #ESX.PlayerData.loadout <= 0 then return end
    
            BlockWeaponWheelThisFrame()
            HudWeaponWheelIgnoreSelection()
            HudWeaponWheelIgnoreControlInput()
            
            local gameTimer = GetGameTimer()
    
            Citizen.CreateThread(function ()
                while GetGameTimer() - gameTimer < 1000 do
                    Citizen.Wait(1)
                    BlockWeaponWheelThisFrame()
                    HudWeaponWheelIgnoreSelection()
                    HudWeaponWheelIgnoreControlInput()
                    HideHudComponentThisFrame(19)
                end
            end)
    
            Wait(200)
    
            local loadout = ESX.PlayerData.loadout
            local components = {}
    
            for _, weapon in pairs(loadout) do
                if weapon.name ~= keyboardData.weapon then goto continue end
                if weapon.metadata == nil or weapon.metadata.components == nil then goto continue end
                if ESX.Table.SizeOf(weapon.metadata.components) == 0 then goto continue end
    
                for _, component in pairs(weapon.metadata.components) do
                    if ESX.Table.Contains(components, component) then goto continue2 end
    
                    table.insert(components, component)
    
                    ::continue2::
                end
    
                ::continue::
            end
    
            for k,v in pairs(ESX.PlayerData.loadout) do
                if v.name ==  keyboardData.weapon then
                    if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey(v.name) then
                        local _, weaponData = ESX.GetWeapon(v.name)
                        if weaponData.components ~= nil then
                            for _, v2 in pairs(weaponData.components) do
                                RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey(v.name), v2.hash)
                            end
                        end
    
                        SetCurrentPedWeapon(PlayerPedId(), `WEAPON_UNARMED`, true)
                    else
                        for _, v2 in pairs(components) do
                            local componentHash = ESX.GetWeaponComponent(v.name, v2).hash
                            GiveWeaponComponentToPed(PlayerPedId(), GetHashKey(v.name), componentHash)
                        end
    
                        SetCurrentPedWeapon(PlayerPedId(), v.name, true)
                    end
                end
            end
        end)
        RegisterKeyMapping('weaponKeyBinds'..Config.WeaponsBinds[i].id,  "Raccourci Arme %s", Config.WeaponsBinds[i].id, 'keyboard', Config.WeaponsBinds[i].bind)
    end
end)