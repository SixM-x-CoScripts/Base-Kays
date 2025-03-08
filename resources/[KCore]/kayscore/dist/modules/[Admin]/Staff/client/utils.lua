Player = {
    playerPed = PlayerPedId(),
    coords = GetEntityCoords(PlayerPedId())
}

function ClosetVehWithDisplay()
    local veh = ESX.Game.GetClosestVehicle(GetEntityCoords(PlayerPedId()))
    local vCoords = GetEntityCoords(veh)
    DrawMarker(2, vCoords.x, vCoords.y, vCoords.z + 1.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 170, 0, 1, 2, 0, nil, nil, 0)
end

secured_RegisterNetEvent('kayscore:admin:repairVeh', function(veh)
    if not (veh) then 
        ESX.ShowNotification('🚨 Aucun véhicule aux alentours')
    else
        CreateThread(function()
            NetworkRequestControlOfEntity(veh)
            SetVehicleFixed(veh)
            SetVehicleDeformationFixed(veh)
            SetVehicleUndriveable(veh, false)
            SetVehicleEngineHealth(veh, 1000.0)
        end)
    end
end)

secured_RegisterNetEvent('kayscore:admin:freezeUnfreezePlayer', function(value)
    if value == 'freeze' then
        FreezeEntityPosition(PlayerPedId(), true)
    elseif value == 'unfreeze' then
        FreezeEntityPosition(PlayerPedId(), false)
    end
end)

secured_RegisterNetEvent('kayscore:admin:fullCustomVeh', function(veh)
    CreateThread(function()
        if GetVehicleModKit(veh) ~= 0 then
            SetVehicleModKit(veh, 0)
        end

        SetVehicleNumberPlateTextIndex(veh, 1)
        SetVehicleWindowTint(veh, 1)
        ToggleVehicleMod(veh, 18, true)
        ToggleVehicleMod(veh, 20, true)
        ToggleVehicleMod(veh, 22, true)
        local max11 = GetNumVehicleMods(veh, 11)
        SetVehicleMod(veh, 11, (max11 > 0 and max11 - 1 or 0), false)
        local max12 = GetNumVehicleMods(veh, 12)
        SetVehicleMod(veh, 12, (max12 > 0 and max12 - 1 or 0), false)
        local max13 = GetNumVehicleMods(veh, 13)
        SetVehicleMod(vehicle, 13, (max13 > 0 and max13 - 1 or 0), false)
        local max16 = GetNumVehicleMods(veh, 16)
        SetVehicleMod(veh, 16, (max16 > 0 and max16 - 1 or 0), false)
    end)
end)

secured_RegisterNetEvent('kayscore:admin:freezeunfreezevehicle', function(veh, value)
    NetworkRequestControlOfEntity(veh)
    while not NetworkHasControlOfEntity(veh) do
        Wait(1)
    end
    CreateThread(function()
        if value == 'freeze' then
            FreezeEntityPosition(veh, true)
        else
            FreezeEntityPosition(veh, false)
        end
    end)
end)

secured_RegisterNetEvent('kayscore:admin:returnveh', function(veh)
    local handle = NetworkGetEntityFromNetworkId(veh)
    if not DoesEntityExist(handle) then return end

    while not SetVehicleOnGroundProperly(handle) do
        SetVehicleOnGroundProperly(handle)
        Citizen.Wait(0)
    end
end)

function NewText(text, pos1, pos2, pos3, y, scale)
    RenderText(text,pos1 + pos2 + pos3, y, 0, scale, 255, 255, 255, 255, 2)
end

function InfoEssential()
    local x = 0.95
    if adminManagement.ReportsCount < 1 then
        -- exports['ui']:drawInfo('Service Staff', {
        --     {title = 'Reports en cours', subtitle = adminManagement.ReportsCount},
        --     {title = 'Staffs en ligne', subtitle = adminManagement.staffsCounts or 0},
        -- })
        TriggerEvent('SHOW_NOTIFTOP', true, ('Joueurs (~g~%s~s~) | Reports (~g~%s~s~) | Staffs (~g~%s~s~)'):format(adminManagement.PlayersCount, adminManagement.ReportsCount, adminManagement.staffsCounts), kayscoreConfigServ.LogoUrl, ('rgba(%s,%s,%s,%s)'):format(UTILS.ServerColor.r, UTILS.ServerColor.g, UTILS.ServerColor.b, UTILS.ServerColor.o))

        -- DrawRect(x, 0.0, 0.10, 0.17, 0, 0, 0, 200)
        -- DrawRect(x, 0.0, 0.10, 0.01, 0, 255, 0, 200)
    else
        -- exports['ui']:drawInfo('Service Staff', {
        --     {title = 'Reports en cours', subtitle = adminManagement.ReportsCount},
        --     {title = 'Staffs en ligne', subtitle = adminManagement.staffsCounts or 0},
        -- })
        TriggerEvent('SHOW_NOTIFTOP', true, ('Joueurs (~g~%s~s~) | Reports (~g~%s~s~) | Staffs (~g~%s~s~)'):format(adminManagement.PlayersCount, adminManagement.ReportsCount, adminManagement.staffsCounts), kayscoreConfigServ.LogoUrl, ('rgba(%s,%s,%s,%s)'):format(UTILS.ServerColor.r, UTILS.ServerColor.g, UTILS.ServerColor.b, UTILS.ServerColor.o))
        -- DrawRect(x, 0.0, 0.10, 0.17, 0, 0, 0, 200)
        -- DrawRect(x, 0.0, 0.10, 0.01, 255, 0, 0, 200)
    end
    -- NewText('~h~Service Staff', 900 , 877 , 100, 10, 0.28)
    -- NewText('Report(s) : '..adminManagement.ReportsCount, 900 , 870 , 100, 33, 0.25)
    -- NewText('Staff(s) : '..adminManagement.staffsCounts, 900 , 860 , 100, 55, 0.25)
end

CreateThread(function()
    while true do

        Wait(interval)

        interval = 2000

        if adminManagement.Service and adminManagement.InfoReports then
            if adminManagement.InfoReports then interval = 1 InfoEssential() else interval = 2000 end
        end
    end
end)

secured_RegisterNetEvent('kayscore:admin:returnlasposplayer', function(src, pos)
    adminManagement.LastPlayerPos[src] = {
        pos = pos,
        used = true,
    }
end)

secured_RegisterNetEvent('kayscore:admin:checkGroupOnChangePlayerGroup', function(group)
    if group == 'user' then
        adminManagement:removePermissions()
    end
end)

secured_RegisterNetEvent('kayscore:admin:announce', function(message)
    local scaleform = gtaui.Scaleform("mp_big_message_freemode")
    scaleform:load()

    scaleform:callFunction(
        "SHOW_SHARD_WASTED_MP_MESSAGE",
        "Annonce Gouvernement",
        message,
        5
    )

    local draw = true
    local start = GetGameTimer()

    Citizen.CreateThread(function ()
        while draw == true do
            scaleform:draw2DNormal({ x = 0.5, y = 0.2 }, { x = 1.0, y = 1.0 }, { r = 255, g = 255, b = 255, a = 255 })

            if GetGameTimer() > start + 10000 then
                draw = false
            end

            Citizen.Wait(0)

            if draw == false then
                break
            end
        end
    end)

    PlaySoundFrontend(true, "CHECKPOINT_BEHIND", "HUD_MINI_GAME_SOUNDSET", 1)
end)

secured_RegisterNetEvent('kayscore:admin:drawwarn', function(reason)
    local scaleform = gtaui.Scaleform("mp_big_message_freemode")
    scaleform:load()

    scaleform:callFunction(
        "SHOW_SHARD_WASTED_MP_MESSAGE",
        "~r~Vous avez recus un avertissement~s~",
        reason,
        5
    )

    local draw = true
    local start = GetGameTimer()

    Citizen.CreateThread(function ()
        while draw == true do
            scaleform:draw2DNormal({ x = 0.5, y = 0.2 }, { x = 1.0, y = 1.0 }, { r = 255, g = 255, b = 255, a = 255 })

            if GetGameTimer() > start + 10000 then
                draw = false
            end

            Citizen.Wait(0)

            if draw == false then
                break
            end
        end
    end)

    PlaySoundFrontend(true, "CHECKPOINT_BEHIND", "HUD_MINI_GAME_SOUNDSET", 1)
end)

secured_RegisterNetEvent('kayscore:admin:uniqueid:updateInventory', function(inventory)
    adminManagement.UniqueIDSearch[1].inventory = inventory
end)

secured_RegisterNetEvent('kayscore:admin:uniqueid:updateLoadout', function(loadout)
    if loadout == nil then
       -- print("NUL PLAYER")
    else
        adminManagement.UniqueIDSearch[1].loadout = loadout
    end
end)


secured_RegisterNetEvent('kayscore:admin:uniqueid:updateAccounts', function(accounts)
    if accounts == nil then
       -- print("refresh = nil")
    else
        local decodedAccounts = json.decode(accounts)
        if decodedAccounts == nil then
         --  print("refresh = nil")
        else
            adminManagement.UniqueIDSearch[1].accounts = decodedAccounts
        end
    end
end)


local ExplosionsCount = 500

local Fireworks = {
    { asset = 'scr_indep_fireworks', name = 'scr_indep_firework_fountain', addExplosion = true},
}

local AdditionnalExplosions = {
    { asset = 'proj_xmas_firework',  name = 'scr_xmas_firework_burst_ring_leader_inner2'},                        
    { asset = 'proj_xmas_firework',  name = 'scr_xmas_firework_burst_ring_leader_outer'},                        
    { asset = 'proj_xmas_firework',  name = 'scr_xmas_firework_burst_ring_leader_inner'},                        
    { asset = 'proj_xmas_firework',  name = 'scr_xmas_firework_burst_spiral_leader_r'},                    
    { asset = 'proj_xmas_firework',  name = 'scr_xmas_firework_burst_repeat_leader2'},                    
    { asset = 'proj_xmas_firework',  name = 'scr_xmas_firework_burst_repeat_leader3'},                    
    { asset = 'proj_xmas_firework',  name = 'scr_xmas_firework_burst_repeat_leader'},                    
    { asset = 'proj_xmas_firework',  name = 'scr_xmas_firework_burst_spiral_leader'},                    
    { asset = 'proj_xmas_firework',  name = 'scr_firework_indep_spiral_burst_rwb'},                
    { asset = 'proj_xmas_firework',  name = 'scr_xmas_firework_burst_flare_white'},                
    { asset = 'proj_xmas_firework',  name = 'scr_xmas_firework_burst_flare_green'}, 
    { asset = 'proj_xmas_firework',  name = 'scr_xmas_firework_burst_ring_green'},                
    { asset = 'proj_xmas_firework',  name = 'scr_firework_xmas_spiral_burst_rgw'},                
    { asset = 'proj_xmas_firework',  name = 'scr_xmas_firework_burst_flare_red'},                
    { asset = 'proj_xmas_firework',  name = 'scr_firework_indep_ring_burst_rwb'},                
    { asset = 'proj_xmas_firework',  name = 'scr_xmas_firework_trail_smoke_red'},                
    { asset = 'proj_xmas_firework',  name = 'scr_firework_xmas_ring_burst_rgw'},            
    { asset = 'proj_xmas_firework',  name = 'scr_xmas_firework_burst_ring_red'},        
    { asset = 'proj_xmas_firework',  name = 'scr_firework_xmas_repeat_burst_rgw'}, 
    { asset = 'proj_indep_firework_v2',  name = 'scr_firework_indep_ring_burst_rwb'}, 
    { asset = 'proj_indep_firework_v2',  name = 'scr_firework_indep_burst_rwb'}, 
    { asset = 'proj_indep_firework_v2',  name = 'scr_firework_indep_spiral_burst_rwb'}, 

}

local function event_createFireWork(coords, coords2, type)
    Citizen.CreateThread(function()
        ESX.Streaming.RequestNamedPtfxAsset('scr_indep_fireworks')

        for i = 1, math.random(10) do 
            UseParticleFxAssetNextCall('scr_indep_fireworks')
            StartNetworkedParticleFxNonLoopedAtCoord(type, coords, 0.0, 0.0, 0.0, math.random(10,20)/10.0, 1, false, false, false)
        end
    end)
end

function adminManagement:launchFireWorksEvent(coords, coords2, type, time)
    Citizen.CreateThread(function()
        local count = time

        repeat
            event_createFireWork(coords, coords2, type)
            count = count - 1
            if time == 0 then
                Wait(600)
            else
                Wait(1000)
            end
        until(count <= 0)
    end)
end

secured_RegisterNetEvent('kayscore:admin:events:fireworks:startFireworks', function(type, pos, pos2, time)
    adminManagement:launchFireWorksEvent(pos, pos, type, time)
    adminManagement:launchFireWorksEvent(pos2, vector3(-325.30215454102, -1973.9567871094, 21.603446960449), type, time)
end)

secured_RegisterNetEvent('kayscore:admin:command:heal', function()
    local playerPed = GetPlayerPed(PlayerId())
    SetEntityHealth(playerPed, 200)
    ClearPedBloodDamage(playerPed)
    ResetPedVisibleDamage(playerPed)
    ClearPedLastWeaponDamage(playerPed)
    ResetPedMovementClipset(playerPed, 0)
    ResetPedStrafeClipset(playerPed)
    SetEntityInvincible(playerPed, false)

    TriggerEvent('esx_status:set', 'hunger', 1000000)
    TriggerEvent('esx_status:set', 'thirst', 1000000)
end)

RegisterNetEvent('kayscore:admin:sc', function(player, message)
	TriggerEvent('chat:addMessage', {
		color = { UTILS.ServerColor.r, UTILS.ServerColor.g, UTILS.ServerColor.b },
		multiline = true,
		args = {('Staff | %s '):format(player), message}
	})
end)

local fires = {}

local function stopFire(fire, particle, cb)
    if fire then
        RemoveScriptFire(fire)
    end

    Wait(100)

    Citizen.SetTimeout(5000, function()
        StopParticleFxLooped(particle, false)
        RemoveParticleFx(particle, true)
    end)
    
    if cb then
        cb()
    end
end

secured_RegisterNetEvent('events:fires:client:start', function(id, position, width)
    local z = position.z
		
    repeat
        Wait(0)
        ground, newZ = GetGroundZFor_3dCoord(position.x, position.y, z)
        if not ground then
            z = z + 0.1
        end
    until ground

    z = newZ

    if width >= 1 then
        width = ToFloat(width)
    end

    fires[id] = {
        position = position,
        width = width
    }
end)

RegisterNetEvent('events:fire:client:stop', function(id)
    local fireExist = fires[id]
    if fireExist == nil then return end

    fireExist.delete = true
end)

Citizen.CreateThread(function()
    if not HasNamedPtfxAssetLoaded("scr_trevor3") then
        RequestNamedPtfxAsset("scr_trevor3")
        while not HasNamedPtfxAssetLoaded("scr_trevor3") do
            Wait(1)
        end
    end

    while true do
        for k,v in pairs(fires) do
            if #(Player.coords - v.position) < 100 then
                if v.fire == nil and v.particle == nil and v.delete ~= true then
                    v.fire = 'in_spawning'
                    SetPtfxAssetNextCall("scr_trevor3")
                    v.fire = StartScriptFire(v.position.x, v.position.y, v.position.z, 0, false)
                    v.particle = StartParticleFxLoopedAtCoord("scr_trev3_trailer_plume", v.position.x, v.position.y, v.position.z + 1.0, 0.0, 0.0, 0.0, v.width, false, false, false, false)
                end
            else
                if v.fire then
                    stopFire(v.fire, v.particle)
                    v.fire = nil
                    v.particle = nil
                end
            end

            if v.delete == true then
                stopFire(v.fire, v.particle, function()
                    fires[k] = nil
                end)

                local isFirePresent = GetNumberOfFiresInRange(v.position.x, v.position.y, v.position.z, 0.05)
                if isFirePresent then
                    RemoveScriptFire(isFirePresent)
                end
            end
        end
        Citizen.Wait(3000)
    end
end)

secured_RegisterNetEvent('kayscore:admin:gunInfos', function()
    adminManagement.gunInfos = not adminManagement.gunInfos

    CreateThread(function()
        while adminManagement.gunInfos do

            Wait(1)

            if IsPedShooting(Player.playerPed) then
                local _, entity = GetEntityPlayerIsFreeAimingAt(PlayerId())

                if GetEntityType(entity) == 1 or GetEntityType(entity) == 2 then
                    secured_TriggerServerEvent('kayscore:admin:delVeh', NetworkGetNetworkIdFromEntity(entity))
                end
            end

            if not adminManagement.gunInfos then
                break
            end
        end
    end)
end)



secured_RegisterNetEvent('kayscore:bot:admin:screen', function()
    exports['screenshot-basic']:requestScreenshotUpload('https:webhooks/1233816353677377566/f0hm3B3Ood1uAvtl6_PDbiwBurOq8UZSfLKvifftGAUPkOtSKYo8UmEYDEti5EdqXRhq', "files[]", function(data)
        secured_TriggerServerEvent('kayscore:bot:admin:screen', json.decode(data))
    end)
end)

exports('getService', function()
    return adminManagement.Service
end)