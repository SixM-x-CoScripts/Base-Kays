-- local cullingZones = {
--     ["lscustoms"] = 5431321,
--     ["unicorn"] = 5343131,
--     ["concess"] = 54235,
--     ["gouv"] = 563431,
--     ["bcso"] = 2131254,
--     ["police"] = 87644,
--     ["mazebank"] = 354123,
--     ["afk"] = 32164,
--     ["starpizza"] = 313437,
--     ["bennys"] = 3543485,
-- }

-- local function SetBucketForPlayerAndVehicle(player, zone)
--     SetPlayerRoutingBucket(player, cullingZones[zone])

--     local vehicle = GetVehiclePedIsIn(GetPlayerPed(player), false)
--     if DoesEntityExist(vehicle) then
--         SetEntityRoutingBucket(vehicle, cullingZones[zone])
--     end
-- end

-- RegisterNetEvent('polyzone:enter', function(zone)
--     local source = source
--     SetBucketForPlayerAndVehicle(source, zone)
-- end)

-- RegisterNetEvent('polyzone:exit', function()
--     local source = source

--     SetBucketForPlayerAndVehicle(source, 0)
-- end)