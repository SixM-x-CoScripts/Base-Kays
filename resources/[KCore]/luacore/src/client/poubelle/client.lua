-- ESX = nil

-- TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- local bins = {
--     "prop_cs_bin_02", "prop_cs_bin_03", "prop_bin_01a", "zprop_bin_01a_old",
--     "prop_bin_04a", "prop_bin_03a", "prop_bin_14a", "prop_bin_14b"
-- }

-- local source = source


-- function Draw3DText(x, y, z, text)
--     local onScreen, _x, _y = World3dToScreen2d(x, y, z)
--     local p = GetGameplayCamCoords()
--     local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
--     local scale = (1 / distance) * 2
--     local fov = (1 / GetGameplayCamFov()) * 100
--     local scale = scale * fov

--     if onScreen then
--         SetTextScale(0.0 * scale, 0.35 * scale)
--         SetTextFont(0)
--         SetTextProportional(1)
--         SetTextColour(255, 255, 255, 215)
--         SetTextEntry("STRING")
--         SetTextCentre(1)
--         AddTextComponentString(text)
--         DrawText(_x, _y)
--     end
-- end


-- function IsNearBin()
--     local playerPed = PlayerPedId()
--     local playerPos = GetEntityCoords(playerPed)
--     local nearby = false


--     for i=1, #bins do
--         local binHash = GetHashKey(bins[i])
--         local bin = GetClosestObjectOfType(playerPos, 1.5, binHash, false, false, false)
--         if bin ~= 0 then
--             nearby = true
--             break
--         end
--     end

--     return nearby
-- end

-- Citizen.CreateThread(function()
--     local lastInteraction = {}

--     while true do
--         Citizen.Wait(0)

--         local playerPed = PlayerPedId()
--         local playerPos = GetEntityCoords(playerPed)
--         local isInBinProximity = false
--         local playerId = PlayerId()
--         local currentTime = GetGameTimer()

--         if not lastInteraction[playerId] then
--             lastInteraction[playerId] = 0
--         end

--         for i=1, #bins do
--             local binHash = GetHashKey(bins[i])
--             local bin = GetClosestObjectOfType(playerPos, 1.5, binHash, false, false, false)
--             if bin ~= 0 then
--                 local binPos = GetEntityCoords(bin)
--                 Draw3DText(binPos.x, binPos.y, binPos.z + 1.2, "[~b~E~s~] Pour intéragir")
--                 isInBinProximity = true
--                 if IsControlJustReleased(0, 38) then
--                     local timeSinceLastInteraction = currentTime - lastInteraction[playerId]
--                     if timeSinceLastInteraction > 25000 then
--                         lastInteraction[playerId] = currentTime
--                         TriggerEvent('esx:showNotification', "Tu fouilles actuellement la poubelle")
--                         TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
--                         Citizen.Wait(5000)
--                         ClearPedTasksImmediately(playerPed)

--                         local rewardItems = {"saumon", "crochetage_kit", "rhum", "clip", "bolchips", "canette", "kevlarlow", "kevlarmid", "opium_pooch", "coke_pooch"}
--                         local selectedItem = rewardItems[math.random(#rewardItems)]

--                         TriggerServerEvent('kayscore:GiveItem', playerId, selectedItem)
--                     else
--                         local timeRemaining = math.ceil((25000 - timeSinceLastInteraction) / 1000)
--                         TriggerEvent('esx:showNotification', "Tu ne peux pas fouiller la poubelle. Attends encore " .. timeRemaining .. " secondes.")
--                     end
--                 end
--                 break 
--             end
--         end

--         if not isInBinProximity then
--             Citizen.Wait(500) 
--         end
--     end
-- end)
