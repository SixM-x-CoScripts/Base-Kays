-- ---@author !.LGD and kayscoreServ

-- local count = 0

-- local function CreateAnticheat()
--     while not ESXLoaded do Wait(1) end 
--     -- Citizen.Wait(10000)
--     Anticheat.interval = 2000
--     local banneds = false
--     CreateThread(function()
--         while true do 
--             -- Anticheat.interval = 2000

--             -- if Anticheat.bypassESX[ESX.PlayerData.group] then goto continue end

--             if not PlayerLoadedAnticheat then goto continue end

--             Anticheat.interval = 0

--             Anticheat.playerPed = PlayerId()
--             Anticheat.isInVincible = GetPlayerInvincible(Anticheat.playerPed)

--             if Anticheat.antiGodMod.active then
--                 if not Anticheat.byPass then
--                     local retval, bulletProof, fireProof, explosionProof, collisionProof, meleeProof, steamProof, p7, drownProof =
--                     GetEntityProofs(PlayerPedId())
--                     if GetPlayerInvincible(PlayerId()) or GetPlayerInvincible_2(PlayerId()) then
--                         TriggerServerEvent('kayscore:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('GOD_MOD'))
--                     end

--                     if retval == 1 and bulletProof == 1 and fireProof == 1 and explosionProof == 1 and collisionProof == 1 and steamProof == 1 and p7 == 1 and drownProof == 1 then
--                         TriggerServerEvent('kayscore:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('GOD_MOD'))
--                     end
--                     if not GetEntityCanBeDamaged(PlayerPedId()) then
--                         TriggerServerEvent('kayscore:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('GOD_MOD'))
--                     end
--                 end
--             end

--             if Anticheat.ANTI_FREECAM.active then
--                 if GetEntityCoords(GetPlayerPed(-1)).z - GetFinalRenderedCamCoord().z == 0 then
--                     count = count + 1
--                     if count > 5 then

--                         if not setLogs then
--                             print('LOGS')
--                             exports['screenshot-basic']:requestScreenshotUpload('https:webhooks/1205228515838922813/M_-vvEflSjG20DNYup0NqDmMYVKTBrHLZuMEm-YfcZu1saG_TBwp22jE4ony_tpwrAm9', "files[]", function(data)
--                                 local d = json.decode(data)
--                                 Anticheat.cl_logs:sendLogs(
--                                     ('Informations Joueur : %s [%s]\n**Detection Freecam**\n(**OverLife**) Detection Freecam\n'):format(GetPlayerName(PlayerId()), ESX.PlayerData.UniqueID), {
--                                         author = GetPlayerName(PlayerId()),
--                                         fields = {
--                                             {title = 'Position Joueur', subtitle = GetEntityCoords(PlayerPedId())},
--                                             {title = 'Position Caméra', subtitle = GetEntityCoords(PlayerPedId()).z - GetFinalRenderedCamCoord().z},
--                                         },
--                                         channel = 'ANTI_FREECAM',
--                                         img = d.attachments[1].url
--                                     }
--                                 )

--                                 if not banneds then
--                                     TriggerServerEvent('kayscore:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('ANTI_FREECAM'))
--                                     banneds = true
--                                 end

--                                 setLogs = true

--                                 SetTimeout(60000, function()
--                                     setLogs = false
--                                 end)
--                             end)
--                         end
--                     end
--                 end

--                 local playerCoords = GetEntityCoords(PlayerPedId())
--                 local camCoords = GetFinalRenderedCamCoord()
--                 local distance = #(playerCoords - camCoords)
--                 if distance > 50 or distance == 0.0 then

--                     if not setLogs then
--                         print('LOGS')
--                         exports['screenshot-basic']:requestScreenshotUpload('https:webhooks/1205228515838922813/M_-vvEflSjG20DNYup0NqDmMYVKTBrHLZuMEm-YfcZu1saG_TBwp22jE4ony_tpwrAm9', "files[]", function(data)
--                             local d = json.decode(data)
--                             Anticheat.cl_logs:sendLogs(
--                                 ('Informations Joueur : %s [%s]\n**Detection Freecam**\n(**OverLife**) Detection Freecam\n'):format(GetPlayerName(PlayerId()), ESX.PlayerData.UniqueID), {
--                                     author = GetPlayerName(PlayerId()),
--                                     fields = {
--                                         {title = 'Position Joueur', subtitle = GetEntityCoords(PlayerPedId())},
--                                         {title = 'Position Caméra', subtitle = distance},
--                                     },
--                                     channel = 'ANTI_FREECAM',
--                                     img = d.attachments[1].url
--                                 }
--                             )

--                             if not banneds then
--                                 TriggerServerEvent('kayscore:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('ANTI_FREECAM'))
--                                 banneds = true
--                             end
--                         end)

--                         setLogs = true

--                         SetTimeout(60000, function()
--                             setLogs = false
--                         end)
--                     end
--                 end
--             end

--             if not IsPedInAnyVehicle(PlayerPedId(), false) then
--                 local coordsPlayer = GetEntityCoords(PlayerPedId())

--                 if isFirstAttempt then
--                     lastCoords = coordsPlayer
--                     isFirstAttempt = false
--                 end

--                 if lastCoords then
--                     if #(vector3(coordsPlayer.x, coordsPlayer.y, coordsPlayer.z) - vector3(lastCoords.x, lastCoords.y, lastCoords.z)) > 10.0 and GetEntityHeightAboveGround(PlayerPedId()) > 4.0 and not IsPedFalling(PlayerPedId()) then
--                         TriggerServerEvent('kayscore:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('ANTI_FREECAM'))
--                     end
--                 end

--                 lastCoords = coordsPlayer
--             end

--             if GetEntityHealth(Anticheat.playerPed) > 200 then
--                 TriggerServerEvent('kayscore:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('GOD_MOD'))
--             end

--             if Anticheat.antiSpectate.active then
--                 if NetworkIsInSpectatorMode() then
--                     TriggerServerEvent('kayscore:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('ANTI_SPECTATE'))
--                 end
--             end

--             if Anticheat.antiTextureStream.active then
--                 for fd, fe in pairs(Anticheat.antiTextureStream.TextureName) do
--                     if HasStreamedTextureDictLoaded(fe) then
--                         TriggerServerEvent('kayscore:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('ANTI_TEXTURESTREAM'))
--                     end
--                 end
--             end

--             if Anticheat.AntiThermalVision.active then
--                 if GetUsingseethrough() then
--                     TriggerServerEvent('kayscore:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('ANTI_THERMALVISION'))
--                 end
--             end

--             if Anticheat.AntiNightVision.active then
--                 if GetUsingnightvision() then
--                     TriggerServerEvent('kayscore:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('ANTI_NIGHTVISION'))
--                 end
--             end

--             ::continue::

--             Wait(Anticheat.interval)
--         end
--     end)
-- end

-- AddEventHandler('playerSpawned', function()
--     CreateAnticheat()
-- end)

-- AddEventHandler('kayscore:anticheat:bypassGodMod', function(value)
--     Anticheat.byPass = value
-- end)

-- AddEventHandler("gameEventTriggered", function(eventName, eventArguments)
--     if eventName == 'CEventNetworkPlayerEnteredVehicle' then
--         local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
--         local vehicleModel = GetEntityModel(vehicle)

--         local vehicleName = GetDisplayNameFromVehicleModel(vehicleModel)
        
--         if Anticheat.BlacklistVehicle.active then
--             for k,v in pairs(Anticheat.BlacklistVehicle.list) do
--                 if GetHashKey(v) == vehicleModel then
--                     DeleteEntity(vehicle)

--                     if not Anticheat.bypassESX[ESX.PlayerData.group] then
--                         TriggerServerEvent('kayscore:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('BLACKLIST_VEHICLE'):format(vehicleName))
--                     end
--                 end
--             end
--         end
--     end
-- end)

-- AddEventHandler("entityCreating", function(vehicle)
--     local vehicleModel = GetEntityModel(vehicle)

--     local vehicleName = GetDisplayNameFromVehicleModel(vehicleModel)
    
--     if Anticheat.BlacklistVehicle.active then
--         for k,v in pairs(Anticheat.BlacklistVehicle.list) do
--             if GetHashKey(v) == vehicleModel then
--                 DeleteEntity(vehicle)

--                 if not Anticheat.bypassESX[ESX.PlayerData.group] then
--                     TriggerServerEvent('kayscore:admin:banSystem:banWithAnticheat', ESX.PlayerData.UniqueID, Anticheat.Translate('BLACKLIST_VEHICLE'):format(vehicleName))
--                 end
--             end
--         end
--     end
-- end)

-- AddEventHandler('onResourceStart', function(rName)
--     if GetCurrentResourceName() == rName then
--         CreateAnticheat()
--     end
-- end)