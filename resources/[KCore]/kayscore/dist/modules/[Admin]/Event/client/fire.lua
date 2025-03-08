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
                    secured_TriggerServerEvent('events:fires:server:confirmStop', k)
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

