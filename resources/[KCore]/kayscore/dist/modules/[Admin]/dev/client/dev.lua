

-- DispoVente = false

-- Citizen.CreateThread(function()
--     while true do 
--         if DispoVente then
--             spawnPed()
--             DrawMissionText("~g~Vous êtes a la recherche de client...", 2000)
--         end
--         Wait(1500)
--     end
-- end)

-- local arcosPed = nil

-- local arcosDevMeilleur = {
--     "a_f_m_business_02",
--     "a_f_m_prolhost_01",
--     "a_f_m_bevhills_02",
--     "a_f_y_bevhills_01",
--     "a_f_y_fitness_02",
--     "a_f_y_tourist_02",
-- }

-- function spawnPed()
--     if DoesEntityExist(arcosPed) then 
--     else
--         local ped = arcosDevMeilleur[math.random(1, #arcosDevMeilleur)]
--         RequestModel(ped)
--         while not HasModelLoaded(ped) do
--         Citizen.Wait(0)
--         end
        
--         local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 1.5, 2.5, 0.0))
--         arcosPed = CreatePed(4, ped, x, y, z, -50.0, 0, 1)
--     end
-- end

-- NearestePed = nil
-- local DejaVenduPed = {}

-- Citizen.CreateThread(function()
--     while ESX == nil do
--         Wait(100)
--     end
--     while true do
--         local zone = GetZoneDevant()
--         local ped = ESX.Game.GetClosestPed(zone, {})
--         local model = GetEntityModel(ped)
--         if ped ~= GetPlayerPed(-1) and not IsPedAPlayer(ped) and not IsPedInAnyVehicle(ped, 1) and not IsPedDeadOrDying(ped, 1) then
--             if model ~= GetHashKey("s_f_y_cop_01") and model ~= GetHashKey("S_M_Y_Casino_01") and model ~= GetHashKey("s_m_m_autoshop_02") and model ~= GetHashKey("S_F_Y_Casino_01") and model ~= GetHashKey("a_f_y_femaleagent") and model ~= GetHashKey("s_m_m_dockwork_01")and model ~= GetHashKey("s_m_y_dockwork_01") and model ~= GetHashKey("s_m_y_dealer_01") and model ~= GetHashKey("s_m_y_robber_01") and model ~= GetHashKey("mp_f_boatstaff_01") and model ~= GetHashKey("s_m_y_construct_01") and model ~= GetHashKey("s_m_m_gardener_01") and model ~= GetHashKey("a_f_y_business_02") and model ~= GetHashKey("s_m_y_cop_01") and model ~= GetHashKey("s_m_m_security_01") and model ~= GetHashKey("a_c_boar") and model ~= GetHashKey("a_c_deer") and model ~= GetHashKey("a_c_dolphin") and model ~= GetHashKey("a_c_fish") and model ~= GetHashKey("a_c_hen") and model ~= GetHashKey("a_c_humpback") and model ~= GetHashKey("a_c_husky") and model ~= GetHashKey("a_c_killerwhale") and model ~= GetHashKey("a_c_mtlion") and model ~= GetHashKey("a_c_pig") and model ~= GetHashKey("a_c_poodle") and model ~= GetHashKey("a_c_pug") and model ~= GetHashKey("a_c_rabbit_01") and model ~= GetHashKey("a_c_rat") and model ~= GetHashKey("a_c_retriever") and model ~= GetHashKey("a_c_rhesus") and model ~= GetHashKey("a_c_rottweiler") and model ~= GetHashKey("a_c_seagull") and model ~= GetHashKey("a_c_sharkhammer") and model ~= GetHashKey("a_c_sharktiger") and model ~= GetHashKey("a_c_shepherd") and model ~= GetHashKey("a_c_stingray") and model ~= GetHashKey("a_c_pigeon") and model ~= GetHashKey("a_c_westy") and model ~= GetHashKey("a_c_cat_01") and model ~= GetHashKey("s_m_m_pilot_02") and model ~= GetHashKey("a_c_chickenhawk") and model ~= GetHashKey("a_c_chimp") and model ~= GetHashKey("a_c_chop") and model ~= GetHashKey("a_c_cormorant") and model ~= GetHashKey("a_c_cow") and model ~= GetHashKey("a_c_coyote") and model ~= GetHashKey("a_c_crow") and model ~= GetHashKey("a_c_rat") and model ~= GetHashKey("mp_m_shopkeep_01") and model ~= GetHashKey("mp_m_weapexp_01") and model ~= GetHashKey("csb_burgerdrug") then -- Blacklist des modèles ici, flème de faire une liste
--                 local coords = GetEntityCoords(ped, true)
--                 local distance = ESX.Math.Round(GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1), true), coords, true), 0)
--                 if distance <= 10 then
--                     NearestePed = ped
--                 else
--                     NearestePed = nil
--                 end
--             end
--         end
--         Citizen.Wait(2500)
--     end
-- end)

-- Citizen.CreateThread(function()
--     while true do
--         local count = 0
--         local attente = 3000
--         for k,v in ipairs(DejaVenduPed) do
--             local NetPed = NetworkGetEntityFromNetworkId(v)
--             if DoesEntityExist(NetPed) then 
--                 count = count + 1
--                 attente = 1000
--             end
--         end
--         if count == 0 then
--             DejaVenduPed = {}
--             attente = 10000
--         end  
--         Citizen.Wait(attente)
--     end
-- end)


-- Citizen.CreateThread(function()

--     while ESX == nil do
--         Wait(100)
--     end

--     while true do

--         local waitdrogue = 1000
--         for k,v in ipairs(DejaVenduPed) do
--             local NetPed = NetworkGetEntityFromNetworkId(v)
--             if NetPed == NearestePed then 
--                 NearestePed = nil
--             end
--         end

--         if NearestePed ~= nil then
--             if DispoVente == true then
--                 spawnPed()
--                 local ped = NearestePed
--                 local coords = GetEntityCoords(ped, true)
--                 local distance = ESX.Math.Round(GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1), true), coords, true), 0)
--                 if distance <= 5.0 then
--                     waitdrogue = 1
--                     if distance >= 3.0 then
--                         DrawMarker(32, coords.x, coords.y, coords.z+1.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 0, 0, 170, 0, 0, 2, 1, nil, nil, 0)
--                     else
--                         DrawMarker(32, coords.x, coords.y, coords.z+1.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 255, 0, 170, 0, 0, 2, 1, nil, nil, 0)
--                         ESX.ShowHelpNotification('Appuie sur ~INPUT_CONTEXT~ pour intéragir')
--                         if IsControlJustReleased(1, 51) then
--                             local PedNetId = NetworkGetNetworkIdFromEntity(ped)
--                             OpenNpcMenu(PedNetId)
--                         end
--                     end
--                 else
--                     NearestePed = nil
--                 end
--             end
--         end
--         Citizen.Wait(waitdrogue)
--     end
-- end)

-- function GetZoneDevant()
--     local backwardPosition = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 2.0, 0.0)
-- 	return backwardPosition
-- end

-- function VenteWeed(npc)
--     local ped = NetworkGetEntityFromNetworkId(npc)
--     FreezeEntityPosition(ped, true)
--     local random = math.random(1,10)

--     if random <= 8 then
--         local heading = GetEntityHeading(ped)
--         local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.14, 0.0)

        
--         SetEntityHeading(PlayerPedId(), heading - 180.1)
--         SetEntityCoordsNoOffset(PlayerPedId(), coords.x, coords.y, coords.z, 0)
--         Wait(300)
--         while not HasAnimDictLoaded("mp_common") do
--             RequestAnimDict("mp_common")
--             Citizen.Wait(1)
--         end
--         TriggerServerEvent('BLC:Vfjhfdjhkfdhjgdfdf', 'Weed')
--         TaskPlayAnim(GetPlayerPed(-1), "mp_common", "givetake1_a", 2.0, 2.0, -1, 0, 0, false, false, false)
--         TaskPlayAnim(ped, "mp_common", "givetake1_a", 2.0, 2.0, -1, 0, 0, false, false, false)
--         Wait(4500)
--         FreezeEntityPosition(ped, false)
    
--         local NetId = NetworkGetNetworkIdFromEntity(ped)
--         table.insert(DejaVenduPed, NetId)
--         NearestePed = nil

--         DeleteEntity(arcosPed)
--         arcosPed = nil
--     else
--         FreezeEntityPosition(ped, false)
--         ESX.ShowNotification("Non merci, Sa ne m'interesse pas !")
--         TaskCombatPed(ped, GetPlayerPed(-1), 0, 16)

--         local coords = GetEntityCoords(GetPlayerPed(-1), true)
--         FS.TriggerServerEvent("NPCVente:AppelLSPD", coords)

--         local NetId = NetworkGetNetworkIdFromEntity(ped)
--         table.insert(DejaVenduPed, NetId)
--         NearestePed = nil

--         DeleteEntity(arcosPed)
--         arcosPed = nil
--     end
-- end

-- function VenteOpium(npc)
--     local ped = NetworkGetEntityFromNetworkId(npc)
--     FreezeEntityPosition(ped, true)
--     local random = math.random(1,10)

--     if random <= 8 then
--         local pochonBuy = math.random(1,10)
--         local heading = GetEntityHeading(ped)
--         local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.14, 0.0)

        
--         SetEntityHeading(PlayerPedId(), heading - 180.1)
--         SetEntityCoordsNoOffset(PlayerPedId(), coords.x, coords.y, coords.z, 0)
--         Wait(300)
--         while not HasAnimDictLoaded("mp_common") do
--             RequestAnimDict("mp_common")
--             Citizen.Wait(1)
--         end
--         TriggerServerEvent('BLC:Vfjhfdjhkfdhjgdfdf', 'Opium')
--         TaskPlayAnim(GetPlayerPed(-1), "mp_common", "givetake1_a", 2.0, 2.0, -1, 0, 0, false, false, false)
--         TaskPlayAnim(ped, "mp_common", "givetake1_a", 2.0, 2.0, -1, 0, 0, false, false, false)
--         Wait(4500)
--         FreezeEntityPosition(ped, false)
    
--         local NetId = NetworkGetNetworkIdFromEntity(ped)
--         table.insert(DejaVenduPed, NetId)
--         NearestePed = nil
--     else
--         FreezeEntityPosition(ped, false)
--         ESX.ShowNotification("Je ne touche pas a la drogue, Casse toi d'ici ou j'apelle les flics")
--         TaskCombatPed(ped, GetPlayerPed(-1), 0, 16)

--         local coords = GetEntityCoords(GetPlayerPed(-1), true)
--         FS.TriggerServerEvent("NPCVente:AppelLSPD", coords)

--         local NetId = NetworkGetNetworkIdFromEntity(ped)
--         table.insert(DejaVenduPed, NetId)
--         NearestePed = nil
--     end
-- end

-- function VentePochon(npc)
--     local ped = NetworkGetEntityFromNetworkId(npc)
--     FreezeEntityPosition(ped, true)
--     local random = math.random(1,10)

--     if random <= 8 then
--         local pochonBuy = math.random(1,10)
--         local heading = GetEntityHeading(ped)
--         local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.14, 0.0)

        
--         SetEntityHeading(PlayerPedId(), heading - 180.1)
--         SetEntityCoordsNoOffset(PlayerPedId(), coords.x, coords.y, coords.z, 0)
--         Wait(300)
--         while not HasAnimDictLoaded("mp_common") do
--             RequestAnimDict("mp_common")
--             Citizen.Wait(1)
--         end
--         TriggerServerEvent('BLC:Vfjhfdjhkfdhjgdfdf', 'Meth')
--         TaskPlayAnim(GetPlayerPed(-1), "mp_common", "givetake1_a", 2.0, 2.0, -1, 0, 0, false, false, false)
--         TaskPlayAnim(ped, "mp_common", "givetake1_a", 2.0, 2.0, -1, 0, 0, false, false, false)
--         Wait(4500)
--         FreezeEntityPosition(ped, false)
    
--         local NetId = NetworkGetNetworkIdFromEntity(ped)
--         table.insert(DejaVenduPed, NetId)
--         NearestePed = nil
--     else
--         FreezeEntityPosition(ped, false)
--         ESX.ShowNotification("Je ne touche pas a la drogue, Casse toi d'ici ou j'apelle les flics")
--         TaskCombatPed(ped, GetPlayerPed(-1), 0, 16)

--         local coords = GetEntityCoords(GetPlayerPed(-1), true)
--         FS.TriggerServerEvent("NPCVente:AppelLSPD", coords)

--         local NetId = NetworkGetNetworkIdFromEntity(ped)
--         table.insert(DejaVenduPed, NetId)
--         NearestePed = nil
--     end
-- end

-- function VenteCoke(npc)
--     local ped = NetworkGetEntityFromNetworkId(npc)
--     FreezeEntityPosition(ped, true)
--     local random = math.random(1,10)

--     if random <= 6 then
--         local cokeBuy = math.random(1,15)
--         local heading = GetEntityHeading(ped)
--         local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.14, 0.0)

        
--         SetEntityHeading(PlayerPedId(), heading - 180.1)
--         SetEntityCoordsNoOffset(PlayerPedId(), coords.x, coords.y, coords.z, 0)
--         Wait(300)
--         while not HasAnimDictLoaded("mp_common") do
--             RequestAnimDict("mp_common")
--             Citizen.Wait(1)
--         end
--         TriggerServerEvent('BLC:Vfjhfdjhkfdhjgdfdf', 'Coke')
--         TaskPlayAnim(GetPlayerPed(-1), "mp_common", "givetake1_a", 2.0, 2.0, -1, 0, 0, false, false, false)
--         TaskPlayAnim(ped, "mp_common", "givetake1_a", 2.0, 2.0, -1, 0, 0, false, false, false)
--         Wait(4500)
--         FreezeEntityPosition(ped, false)

--         local NetId = NetworkGetNetworkIdFromEntity(ped)
--         table.insert(DejaVenduPed, NetId)
--         NearestePed = nil
--     else
--         FreezeEntityPosition(ped, false)
--         ESX.ShowNotification("Non merci, Sa ne m'interesse pas !")
--         TaskCombatPed(ped, GetPlayerPed(-1), 0, 16)
--         local coords = GetEntityCoords(GetPlayerPed(-1), true)
--         FS.TriggerServerEvent("NPCVente:AppelLSPD", coords)

--         local NetId = NetworkGetNetworkIdFromEntity(ped)
--         table.insert(DejaVenduPed, NetId)
--         NearestePed = nil
--     end
-- end

-- RegisterNetEvent("NPCVente:AffichageAppel", function(coords)
--     PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
--     PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", 1)
--     ESX.ShowNotification("LSPD CENTRAL", "~p~Vente de drogue", "Des suspects ont vu des gens vendre de la drogue.", "CHAR_CHAT_CALL", 8)

--     local blip = AddBlipForCoord(coords)
--     SetBlipSprite(blip, 51)
--     SetBlipScale(blip, 0.85)
--     SetBlipColour(blip, 47)
--     SetBlipShrink(blip, true)

--     local blipZone = AddBlipForCoord(coords)
--     SetBlipSprite(blipZone, 161)
--     SetBlipScale(blipZone, 3.0)
--     SetBlipColour(blipZone, 1)
--     SetBlipShrink(blipZone, true)


--     Wait(1000)
--     PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
--     PlaySoundFrontend(-1, "FocusOut", "HintCamSounds", 1)

--     Citizen.Wait(60*1000)
--     RemoveBlip(blip)
--     RemoveBlip(blipZone)
-- end)

-- function openVenteDrogue(npc)
-- 	local menu = RageUI.CreateMenu("", "Vente de drogue en cours...")

--     RageUI.Visible(menu, not RageUI.Visible(menu))

-- 	while menu do
-- 		Citizen.Wait(5)
--         RageUI.IsVisible(menu, function()
--             RageUI.Button('Vendre de la Weed', nil, {}, true, {onSelected = function()
--                 RageUI.CloseAll()
--                 VenteWeed(npc)
--             end});
--             RageUI.Button('Vendre de la cocaÎne', nil, {}, true, {onSelected = function()
--                 RageUI.CloseAll()
--                 VenteCoke(npc)
--             end});
--             RageUI.Button('Vendre de la méthamphétamine', nil, {}, true, {onSelected = function()
--                 RageUI.CloseAll()
--                 VentePochon(npc)
--             end});
--             RageUI.Button('Vendre de l\'opium', nil, {}, true, {onSelected = function()
--                 RageUI.CloseAll()
--                 VenteOpium(npc)
--             end});
--         end)

--         if not RageUI.Visible(menu) then
--             menu = RMenu:DeleteType('menu', true)
--         end
--     end
-- end

-- local TargetNpc = nil
-- local count = 0

-- function OpenNpcMenu(npc)
--     openVenteDrogue(npc)
--     Wait(100)
--     PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", 1)
--     local ped = NetworkGetEntityFromNetworkId(npc)
--     TaskTurnPedToFaceEntity(ped, GetPlayerPed(-1), 5000)
--     TargetNpc = npc
-- end