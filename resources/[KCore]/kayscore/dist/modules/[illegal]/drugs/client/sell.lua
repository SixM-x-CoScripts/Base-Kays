-- inSellDrugs = {
--     ped = nil,
--     blips = nil,

--     peds = {}
-- }

-- PedsSellDrugs = {
--     "g_m_y_ballaeast_01",
--     "cs_barry",
--     "s_m_o_busker_01",
--     "s_m_y_dealer_01",
--     "cs_floyd",
--     "u_m_m_jesus_01",
--     "ig_old_man1a",
--     "ig_ramp_gang",
--     "a_m_m_stlat_02"
-- }

-- DrgusList = {
--     "Pochon de Weed",
--     "Pochon de Coke",
--     "Pochon de Hashish"
-- }

-- DrugsListData = {
--     ["Pochon de Weed"] = "weed_pooch",
--     ["Pochon de Coke"] = "coke_pooch",
--     ["Pochon de Hashish"] = "hashish_pooch"
-- }

-- drugsIndex = 1

-- atempPed = false

-- function sendPhoneMessage(app, title, message)
--     ESX.ShowAdvancedNotification(title, "", mmessage)
--     -- exports["lb-phone"]:SendNotification({
--     --     app = app,
--     --     title = title,
--     --     content = message,
--     -- })
-- end

-- function RequestAndWaitDict(dictName) -- Request une animation (dict)
-- 	if dictName and DoesAnimDictExist(dictName) and not HasAnimDictLoaded(dictName) then
-- 		RequestAnimDict(dictName)
-- 		while not HasAnimDictLoaded(dictName) do Citizen.Wait(100) end
-- 	end
-- end
-- function RequestAndWaitModel(modelName) -- Request un modèle de véhicule
-- 	if modelName and IsModelInCdimage(modelName) and not HasModelLoaded(modelName) then
-- 		RequestModel(modelName)
-- 		while not HasModelLoaded(modelName) do Citizen.Wait(100) end
-- 	end
-- end

-- function setNewDestination()
--     function relaunch()
--         ESX.TriggerServerCallback('kayscore:drugs:sell:getItem', function(cbb)
--             if cbb == true then 
--                 RemoveBlip(inSellDrugs.blip)
--                 SetBlipRoute(inSellDrugs.blip, 0)
--                 setNewDestination()
--             else
--                 ESX.ShowNotification('Vous devez posséder un téléphone pour vendre de la ~r~drogue~s~')
--             end
--         end, DrugsListData[DrgusList[drugsIndex]])
--     end

--     ESX.ShowNotification('💊 Vous êtes à la recherche de client...')
--     Wait(8000)
--     local data = kayscoreDrugs.sell.Position[math.random(1, #kayscoreDrugs.sell.Position)]

--     local callCop = kayscoreDrugs.sell.CallCop[math.random(1,10)]
--     local source = source
--     local position = GetPlayerLocation(source)  

--     if callCop then
--         if IsInNorthZone(position) then
--             TriggerClientEvent('kayscore:police:drugs:callcopnord', source, data)
--         elseif IsInSouthZone(position) then
--             TriggerClientEvent('kayscore:police:drugs:callcop', source, data)
--         else
--             -- Autre action si nécessaire
--         end
--     end

--     ESX.Game.SpawnPed(2, PedsSellDrugs[math.random(1, #PedsSellDrugs)], vector3(data.pos.x, data.pos.y, data.pos.z-1), 90.0, function(ped)
--         inSellDrugs.peds[ped] = ped
--         SetEntityInvincible(ped, true)
--         SetBlockingOfNonTemporaryEvents(ped, true)
--         TaskStartScenarioInPlace(ped, 'PROP_HUMAN_STAND_IMPATIENT', 0, true)

--         local cCreatee = CreateObject(GetHashKey('hei_prop_heist_cash_pile'), 0, 0, 0, true)
--         AttachEntityToEntity(cCreatee, ped, GetPedBoneIndex(pPed, 57005), 0.13, 0.02, 0.0, -90.0, 0, 0, 1, 1, 0, 1, 0, 1)

--         SetPedTalk(ped)
--         PlayAmbientSpeech1(ped, 'GENERIC_HI', 'SPEECH_PARAMS_STANDARD')

--         sendPhoneMessage("Twitter", ("Message d\'un toxicomane"):format(DrgusList[drugsIndex]), '💊 '..data.message)

--         local blip = AddBlipForCoord(data.pos.x, data.pos.y, data.pos.z)
--         SetBlipSprite(blip, 51)
--         SetBlipDisplay(blip, 4)
--         SetBlipScale(blip, 0.5)
--         SetBlipColour(blip, 2)
--         SetBlipAsShortRange(blip, true)
--         BeginTextCommandSetBlipName("STRING")
--         AddTextComponentString('[ILLEGAL] Vente de drogue')
--         EndTextCommandSetBlipName(blip)
--         SetBlipRoute(blip, 1)
--         SetBlipRouteColour(blip, 2)
--         inSellDrugs.blip = blip

--         atempPed = true

--         CreateThread(function()
--             FreezeEntityPosition(ped, true)
--             local interval = 2000
--             while atempPed do
--                 Wait(interval)

--                 interval = 2000

--                 local dist = #(GetEntityCoords(PlayerPedId()) - vector3(data.pos.x, data.pos.y, data.pos.z))

--                 if dist > 2 then goto continue end

--                 interval = 1

--                 FreezeEntityPosition(ped, true) 

--                 DrawInstructionBarNotification(data.pos.x, data.pos.y, data.pos.z + 0.25, "Appuyez sur [ ~g~E~w~ ] pour vendre la drogue")
--                 if IsControlJustPressed(0, 54) then
--                     if Player.isInVehicle then 
--                         ESX.ShowNotification('Vous ne pouvez pas vendre en étant dans un véhicule') 
--                     else
--                         SetPedTalk(ped)
--                         PlayAmbientSpeech1(ped, 'GENERIC_HI', 'SPEECH_PARAMS_STANDARD')

--                         atempPed = false
--                         ClearPedTasksImmediately(ped)

--                         local pPed = PlayerPedId()

--                         RequestAndWaitDict("mp_common")
--                         RequestAndWaitModel(props)
--                         RequestAndWaitModel('hei_prop_heist_cash_pile')

--                         SetTimeout(1000, function()
--                             local cCreate = CreateObject(GetHashKey('ng_proc_drug01a002'), 0, 0, 0, true)
--                             AttachEntityToEntity(cCreate, pPed, GetPedBoneIndex(pPed, 57005), 0.13, 0.02, 0.0, -90.0, 0, 0, 1, 1, 0, 1, 0, 1)
--                             TaskPlayAnim(pPed, 'mp_common', 'givetake1_a', 8.0, 8.0, -1, 0, 1, false, false, false)
                            
--                             SetTimeout(2000, function()
--                                 if cCreate then 
--                                     DeleteEntity(cCreate)
--                                 end
--                                 local oCreate = CreateObject(GetHashKey('hei_prop_heist_cash_pile'), 0, 0, 0, true)
--                                 AttachEntityToEntity(oCreate, ped, GetPedBoneIndex(ped, 57005), 0.13, 0.02, 0.0, -90.0, 0, 0, 1, 1, 0, 1, 0, 1)
--                                 TaskPlayAnim(ped, 'mp_common', 'givetake1_a', 8.0, 8.0, -1, 0, 1, false, false, false)
            
--                                 SetTimeout(2000, function()
--                                     inSellDrugs.ped = ped
--                                     PlaySoundFrontend(-1, "Bomb_Disarmed", "GTAO_Speed_Convoy_Soundset", 0)
            
--                                     ClearPedTasks(ped)
--                                     ClearPedTasks(pPed)
                    
--                                     if oCreate then 
--                                         TaskWanderStandard(ped, 10.0, 10)
--                                         DeleteEntity(oCreate)
--                                     end
            
--                                     TriggerServerEvent('kayscore:drugs:sell', DrugsListData[DrgusList[drugsIndex]])
            
--                                     FreezeEntityPosition(inSellDrugs.ped, false)
--                                     SetEntityInvincible(inSellDrugs.ped, false)
--                                     ClearPedTasks(inSellDrugs.ped)
                                     
--                                     SetTimeout(2000, function()
--                                         -- TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING_POT", 0, true)
--                                         relaunch()
--                                     end)
--                                 end)
--                             end)
--                         end)
--                     end
--                 end

--                 ::continue::
--             end
--         end)
--     end)
-- end


-- function stopVente()
--     atempPed = false
--     RemoveBlip(inSellDrugs.blip)
--     SetBlipRoute(inSellDrugs.blip, 0)
--     FreezeEntityPosition(inSellDrugs.ped, false)
--     SetEntityInvincible(inSellDrugs.ped, false)
--     ClearPedTasks(inSellDrugs.ped)
-- end

-- function openSellMenu()
--     if GetSafeZone() then return ESX.ShowNotification('❌ Vous ne pouvez pas vendre de la drogue en SafeZone') end

--     local main = RageUI.CreateMenu('', 'Actions Disponibles')

--     RageUI.Visible(main, not RageUI.Visible(main))
--     while main do Wait(1)
--         RageUI.IsVisible(main, function()
--             -- print(DrugsListData[DrgusList[drugsIndex]])
--             if kayscoreDrugs.sell.InSell then
--                 RageUI.Separator(('~r~Ventre de drogue (%s)~s~'):format(DrgusList[drugsIndex]))
--             else
--                 RageUI.Separator('~r~Ventre de drogue~s~')
--             end
--             RageUI.List('Type de drogue', DrgusList, drugsIndex, nil, {}, not kayscoreDrugs.sell.InSell, {
--                 onListChange = function(Index, Items)
--                     if kayscoreDrugs.sell.InSell then return end

--                     drugsIndex = Index
--                 end
--             })
--             RageUI.Checkbox('Vente de drogue', nil, kayscoreDrugs.sell.InSell, {}, {
--                 onChecked = function()
--                     ESX.TriggerServerCallback('kayscore:drugs:sell:getPhone', function(cb)
--                         if not cb then return ESX.ShowNotification('Vous devez posséder un téléphone pour vendre de la ~r~drogue~s~') end

--                         -- if exports["lb-phone"]:GetAirplaneMode() then return ESX.ShowNotification('Vous ne pouvez pas vendre de la drogue avec le mode avion activé') end

--                         ESX.TriggerServerCallback('kayscore:drugs:sell:getItem', function(cbb)
--                             if not cbb then return end

--                             kayscoreDrugs.sell.InSell = true
    
--                             sendPhoneMessage("Twitter", ("💊 Vente de pochon de %s"):format(DrgusList[drugsIndex]), "Tu viens de lancer une session de vente de drogue")
        
--                             setNewDestination()
--                         end, DrugsListData[DrgusList[drugsIndex]])

--                     end)
--                 end,
--                 onUnChecked = function()
--                     kayscoreDrugs.sell.InSell = false

--                     sendPhoneMessage("Twitter", ("💊 Vente de pochon de %s"):format(DrgusList[drugsIndex]), "Tu viens d\'arrêter ta session de vente de drogue")

--                     stopVente()
--                 end
--             })
--         end)

--         if not RageUI.Visible(main) then
--             main = RMenu:DeleteType('main')
--         end
--     end
-- end

-- RegisterNetEvent('kayscore:drugs:stop', function()
--     stopVente()
-- end)

-- blackListedRole = {
--     ['police'] = true,
--     ['bcso'] = true,
--     ['ambulance'] = true,
--     ['gouvernement'] = true
-- }


-- -- RegisterCommand('sell_drugs', function()
-- --     if blackListedRole[ESX.GetPlayerData().job.name] then return ESX.ShowNotification('~r~Vous ne pouvez pas vendre de la drogue en étant dans une entreprise public~s~') end

-- --     openSellMenu()
-- -- end)
-- -- RegisterKeyMapping('sell_drugs', '💊 Menu vente de drogue', 'keyboard', 'F11')

-- AddEventHandler('onResourceStop', function()
--     for k,v in pairs(inSellDrugs.peds) do
--         DeleteEntity(v)
--     end
-- end)

-- -- Définissez les marqueurs carrés pour la zone nord et la zone sud
-- local northMarkerMinX = -4747  -- Coordonnée X minimale du carré nord
-- local northMarkerMaxX = 4761  -- Coordonnée X maximale du carré nord
-- local northMarkerMinY = -53  -- Coordonnée Y minimale du carré nord
-- local northMarkerMaxY = 2690  -- Coordonnée Y maximale du carré nord

-- local southMarkerMinX = -4747  -- Coordonnée X minimale du carré sud
-- local southMarkerMaxX = 4111  -- Coordonnée X maximale du carré sud
-- local southMarkerMinY = -172  -- Coordonnée Y minimale du carré sud
-- local southMarkerMaxY = 2691  -- Coordonnée Y maximale du carré sud

-- -- Fonction pour déterminer si la position est dans la zone nord
-- function IsInNorthZone(position)
--     if position.x >= northMarkerMinX and position.x <= northMarkerMaxX and
--        position.y >= northMarkerMinY and position.y <= northMarkerMaxY then
--         return true
--     else
--         return false
--     end
-- end

-- -- Fonction pour déterminer si la position est dans la zone sud
-- function IsInSouthZone(position)
--     if position.x >= southMarkerMinX and position.x <= southMarkerMaxX and
--        position.y >= southMarkerMinY and position.y <= southMarkerMaxY then
--         return true
--     else
--         return false
--     end
-- end

-- function GetPlayerLocation(playerId)
--     local xPlayer = ESX.GetPlayerFromId(playerId)

--     if xPlayer then
--         local playerPed = xPlayer.getPed()

--         if playerPed then
--             local coords = GetEntityCoords(playerPed)
--             return coords
--         else
--             print(("Player %s ped is nil!"):format(playerId))
--         end
--     else
--         print(("Player %s is nil!"):format(playerId))
--     end

--     return nil
-- end
