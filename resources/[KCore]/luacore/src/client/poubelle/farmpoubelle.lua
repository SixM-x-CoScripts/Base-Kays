-- -- client/main.lua
-- local coordsList = {
--     vector3(942.055969, -2186.808350, 30.552704),
--     vector3(943.961426, -2178.538086, 30.551609),
--     vector3(949.468811, -2179.418457, 30.551582)
-- }
-- local currentCoord = coordsList[math.random(#coordsList)]
-- local prop
-- local isInteracting = false

-- function DrawText3D(x, y, z, text)
--     local onScreen,_x,_y=World3dToScreen2d(x,y,z)
--     local px,py,pz=table.unpack(GetGameplayCamCoords())
--     local distance = GetDistanceBetweenCoords(x, y, z, px, py, pz, false)
    
--     if distance <= 6 then
--         SetTextScale(0.35, 0.35)
--         SetTextFont(4)
--         SetTextProportional(1)
--         SetTextColour(255, 255, 255, 215)
--         SetTextEntry("STRING")
--         SetTextCentre(true)
--         AddTextComponentString(text)
--         SetDrawOrigin(x,y,z, 0)
--         DrawText(0.0, 0.0)
--         local factor = (string.len(text)) / 370
--         DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
--         ClearDrawOrigin()
--     end
-- end

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(0)
--         local playerCoords = GetEntityCoords(PlayerPedId())
--         local dist = #(playerCoords - currentCoord)

--         if dist < 5.0 then
--             if not DoesEntityExist(prop) then
--                 prop = CreateObject(GetHashKey("prop_big_bag_01"), currentCoord.x, currentCoord.y, currentCoord.z, false, true, true)
--                 SetEntityInvincible(prop, true) -- Make the prop invincible
--                 FreezeEntityPosition(prop, true) -- Freeze the prop's position
--                 PlaceObjectOnGroundProperly(prop) -- Ensure the prop is correctly placed on the ground
--             end
            
--             DrawText3D(currentCoord.x, currentCoord.y, currentCoord.z + 1.0, "[~b~E~s~] Pour intéragir")
--             if IsControlJustReleased(0, 38) and not isInteracting then -- E key
--                 isInteracting = true
--                 TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
--                 Citizen.Wait(5000)
--                 ClearPedTasksImmediately(PlayerPedId())

--                 TriggerServerEvent('kayscore:Givesac')

--                 DeleteObject(prop)
--                 isInteracting = false
--                 Citizen.Wait(500) -- Petite pause avant de changer de position

--                 -- Select a new random coordinate for the prop
--                 currentCoord = coordsList[math.random(#coordsList)]
--             end
--         else
--             if DoesEntityExist(prop) then
--                 DeleteObject(prop)
--             end
--         end
--     end
-- end)
