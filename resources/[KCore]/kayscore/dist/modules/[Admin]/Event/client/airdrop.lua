-- if EventConfig.AirDropActive == true then
-- local airdrops = {}
-- local cops = {
--     ["police"] = true,
--     ["policecayo"] = true,
--     ["bcso"] = true
-- }
-- local ignoredJobs = {
--     ["ambulance"] = true,
--     ["ambulancenord"] = true,
--     ["ambulancepillbox"] = true,
--     ["ambulancecayo"] = true,
--     ["ambulancesandy"] = true,
--     ["ambulance_eclipse"] = true,
-- }

-- local function spawnAirdropCase(position)
--     local model = GetHashKey('prop_box_wood02a') -- Remplacez 'prop_box_wood02a' par le modèle de la caisse que vous voulez utiliser

--     RequestModel(model)
--     while not HasModelLoaded(model) do
--         Wait(1)
--     end

--     local caseObject = CreateObject(model, position.x, position.y, position.z, true, true, true)
--     PlaceObjectOnGroundProperly(caseObject)
--     FreezeEntityPosition(caseObject, true)
    
--     return caseObject
-- end


-- local function createParticlesAirdrop(id)
--     local airdrop = airdrops[id]
--     if airdrop == nil or airdrop.netId == nil then return end

--     if not HasNamedPtfxAssetLoaded("scr_ba_bb") then
--         RequestNamedPtfxAsset("scr_ba_bb")
--         while not HasNamedPtfxAssetLoaded("scr_ba_bb") do
--             Wait(10)
--         end
--     end

--     UseParticleFxAssetNextCall("scr_ba_bb")

--     local entity = NetworkGetEntityFromNetworkId(airdrop.netId)

--     airdrop.ptfx = StartParticleFxLoopedOnEntity("scr_ba_bb_package_flare", entity, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, false, false, false)
--     RemoveNamedPtfxAsset("scr_ba_bb")
-- end

-- local function removeParticlesAirdrop(id)
--     local airdrop = airdrops[id]
--     if airdrop == nil then return end

--     StopParticleFxLooped(airdrop.ptfx, false)
--     RemoveParticleFx(airdrop.ptfx, true)

--     Wait(500)

--     RemoveParticleFxInRange(airdrop.position.x, airdrop.position.y, airdrop.position.z, 5.0)
--     airdrop.ptfx = nil
-- end

-- local function openAirdrop(id)
--     local airdrop = airdrops[id]
--     if airdrop == nil then
--         print("Airdrop is nil")
--         return
--     end
--     if airdrop.items == nil then
--         print("Airdrop items are nil")
--         return
--     end

--     local menu = RageUI.CreateMenu("Airdrop", "Largage")

--     RageUI.Visible(menu, not RageUI.Visible(menu))

--     while menu do
--         Citizen.Wait(0)
--         RageUI.IsVisible(menu, function()
--             for k,v in pairs(airdrop.items) do
--                 RageUI.Button(("%s (%s)"):format(v[1], v[2]), nil, {RigthLabel = ">>>"}, true, {
--                     onSelected = function()
--                         TriggerServerEvent('events:airdrops:server:claimItem', id, k)
--                     end
--                 })
--             end
--         end)

--         if not RageUI.Visible(menu) then
--             menu = RMenu:DeleteType('menu', true)
--         end
--     end
-- end

-- local function dropCase(id)
--     local airdrop = airdrops[id]
--     if airdrop == nil then return end

--     ESX.ShowNotification("🪂 Le colis a été largué.\n\nRendez-vous sur les lieux avant les flics !")
-- end


-- -- Définition de la fonction SecondsToClock
-- function SecondsToClock(seconds)
--     local hours = math.floor(seconds / 3600)
--     local mins = math.floor((seconds % 3600) / 60)
--     local secs = seconds % 60
--     return string.format("%02d:%02d:%02d", hours, mins, secs)
-- end

-- RegisterNetEvent('events:airdrops:client:start')
-- AddEventHandler('events:airdrops:client:start', function(data)
--     if airdrops[data[1]] ~= nil then
--         ESX.removeBlip(('event_airdrop_%s'):format(data[1]))
--         TriggerEvent('events:airdrops:client:stop', data[1])
--         Wait(2500)
--     end

--     airdrops[data[1]] = {
--         id = data[1],
--         position = vector3(data[2].x, data[2].y, data[2].z),
--         started = true,
--         loopWait = 2000,
--         landing = false,
--         ui = false,
--         blip = nil,
--         openTimer = data[3],
--         zonePosition = data[4]
--     }

--     if not data[5] then
--         ESX.ShowNotification('🪂 Un largage va avoir lieu dans 2 minutes. Préparez-vous et rejoignez la zone.', 25000)
--     end

--     local airdrop = airdrops[data[1]]

--     while not ESXLoaded do Wait(1) end
--     while not ESX.PlayerData do Wait(1) end
--     while not ESX.PlayerData.job do Wait(1) end

--     airdrop.blipzone = AddBlipForRadius(airdrop.zonePosition.x, airdrop.zonePosition.y, airdrop.position.z, 2000.0)
--     SetBlipSprite(airdrop.blipzone, 1)
--     SetBlipColour(airdrop.blipzone, 6)
--     SetBlipAlpha(airdrop.blipzone, 100)

--     updateAirdropsDetector()
--     Wait(500)
--     spawnAirdropCase(airdrop.position)
--     ESX.ShowNotification("🪂 Le colis a atterit !")

--     ESX.addBlips({
--         name = ("event_airdrop_%s"):format(vector3(data[2].x, data[2].y, data[2].z)),
--         label = "Caisse",
--         position = vector3(data[2].x, data[2].y, data[2].z),
--         sprite = 478,
--         display = 4,
--         scale = 1.0,
--         color = 75,
--         disableShortRange = true
--     })

--     airdrop.dropped = true
--     airdrop.landing = true -- Ajoutez cette ligne pour définir landing à true

--     createParticlesAirdrop(vector3(data[2].x, data[2].y, data[2].z))

--     -- Thread pour gérer l'airdrop
--     Citizen.CreateThread(function()
--         while airdrop and airdrop.started do
--             if #(Player.coords - airdrop.position) < 50.0 then
--                 airdrop.loopWait = 0

--                 if not airdrop.ptfx and airdrop.dropped then
--                     createParticlesAirdrop(airdrop.id)
--                 end
--             else
--                 if airdrop.ptfx then
--                     removeParticlesAirdrop(airdrop.id)
--                 end
--             end

--             if #(Player.coords - airdrop.position) < 4.0 then
--                 local currentTimeFormatted = SecondsToClock(airdrop.openTimer)

--                 -- if airdrop.dropped and airdrop.openTimer > 0 then
--                 --     ESX.Game.Utils.DrawText3D(airdrop.position, ("%s"):format(currentTimeFormatted), 1.0, 0)
--                 -- end

--                 if airdrop.landing then
--                     print("Affichage de la notification d'aide")
--                     ESX.ShowHelpNotification('~INPUT_CONTEXT~ pour ouvrir la caisse')
--                     if IsControlJustPressed(1, 51) then
--                         print("Appui sur E détecté")
--                         openAirdrop(airdrop.id)
--                     end
--                 end
--             end

--             Citizen.Wait(airdrop.loopWait)
--         end
--     end)

--     Citizen.CreateThread(function()
--         while airdrop and airdrop.started do
--             if airdrop.dropped and airdrop.openTimer > 0 then
--                 airdrop.openTimer = airdrop.openTimer - 1
--             end
--             Citizen.Wait(1000)
--         end
--     end)
-- end)


-- RegisterNetEvent('events:airdrops:client:stop')
-- AddEventHandler('events:airdrops:client:stop', function(id)
--     local airdrop = airdrops[id]
--     if airdrop == nil then return end

--     if DoesBlipExist(airdrop.blipzone) then
--         RemoveBlip(airdrop.blipzone)
--     end

--     ESX.removeBlip(('event_airdrop_%s'):format(id))

--     airdrop.started = false
--     airdrops[id] = nil

--     stopDetector(id)
-- end)

-- RegisterNetEvent('events:airdrops:client:spawnCase')
-- AddEventHandler('events:airdrops:client:spawnCase', function(id, netId, notification)
--     local airdrop = airdrops[id]
--     if airdrop == nil or netId == nil then return end

--     airdrop.netId = netId

--     if not notification then
--         dropCase(id)
--     end
-- end)

-- RegisterNetEvent('events:airdrop:client:syncDrop')
-- AddEventHandler('events:airdrop:client:syncDrop', function(id, items)
--     local airdrop = airdrops[id]
--     if airdrop == nil then return end

--     airdrop.landing = true
--     airdrop.items = items
-- end)

-- RegisterNetEvent('events:airdrops:client:updateItem')
-- AddEventHandler('events:airdrops:client:updateItem', function(id, item, count)
--     local airdrop = airdrops[id]
--     if airdrop == nil or airdrop.items == nil or airdrop.items[item] == nil then return end

--     airdrop.items[item][2] = count

--     if count == 0 then
--         airdrop.items[item] = nil
--     end
-- end)

-- ---------------------

-- local detectorPower = false
-- local detectorBlips = {}

-- local function getNearestAirdrop(positions)
--     local nearestVector = vector3(0.0, 0.0, 0.0)
--     local minDistance = 1000000

--     for k,v in pairs(positions) do
--         local distance = #(Player.coords - v)

--         if distance < minDistance then
--             minDistance = distance
--             nearestVector = v
--         end
--     end
--     return nearestVector
-- end

-- function isDetector()
--     return detectorPower
-- end

-- function updateAirdropsDetector()
--     if detectorPower == false then
--         return 
--     end
    
--     for k,v in pairs(detectorBlips) do 
--         if DoesBlipExist(v) then 
--             RemoveBlip(v)
--             detectorBlips[k] = nil
--         end
--     end

--     local airdrops = getAirdropsPositions()

--     for k, v in pairs(airdrops) do 
--         detectorBlips[k] = AddBlipForCoord(v)
--         SetBlipSprite(detectorBlips[k], 459)
--         SetBlipFlashes(detectorBlips[k], true)
--         SetBlipFlashInterval(detectorBlips[k], 500)
        
--         BeginTextCommandSetBlipName("STRING")
--         AddTextComponentSubstringPlayerName("Signal")
--         EndTextCommandSetBlipName(detectorBlips[k])
--     end
-- end

-- RegisterNetEvent('kayscore:client:detector_case', function()
--     if DoesBlipExist(detectorBlip) then
--         RemoveBlip(detectorBlip)
--     end

--     if detectorPower == true then
--         detectorPower = false

--         for k,v in pairs(detectorBlips) do 
--             if DoesBlipExist(v) then 
--                 RemoveBlip(v)
--                 detectorBlips[k] = nil
--             end
--         end

--         return  ESX.ShowNotification("📡Détecteur de largages désactivé.")
--     end

--     if EventConfig.ItemsToLoot.inAction then
--         return ESX.ShowNotification("Vous effectuez déjà une action.")
--     end

--     EventConfig.ItemsToLoot.inAction = true

--     local airdrops = getTotalAirdrops()
--     if airdrops <= 0 then 
--         ESX.ShowNotification("Aucun largage n'est en cours. Les largages sont a 17h & 23h30.")
--         EventConfig.ItemsToLoot.inAction = false
--         return
--     end

--     local airdrops = getAirdropsPositions()
--     if airdrops == nil then return ESX.ShowNotification("📡Votre detecteur n'est pas assez performant pour détecter un largage.") end

--     ESX.ShowNotification("📡Détecteur de largages activé.")
--     detectorPower = true

--     Citizen.CreateThread(function()
--         for k, v in pairs(airdrops) do 
--             detectorBlips[k] = AddBlipForCoord(v)
--             SetBlipSprite(detectorBlips[k], 459)
--             SetBlipFlashes(detectorBlips[k], true)
--             SetBlipFlashInterval(detectorBlips[k], 500)
            
--             BeginTextCommandSetBlipName("STRING")
--             AddTextComponentSubstringPlayerName("Signal")
--             EndTextCommandSetBlipName(detectorBlips[k])
--         end
    
--         while detectorPower do
--             local airdrops = getAirdropsPositions()
--             local nearestAirdrop = getNearestAirdrop(airdrops)
--             local distance = #(Player.coords - nearestAirdrop)
--             ESX.DrawMissionText(("La caisse est à %s mètres."):format(ESX.Math.Round(distance)), 0)
--             Citizen.Wait(0)
--         end
--     end)

--     EventConfig.ItemsToLoot.inAction = false
-- end)

-- function stopDetector(id)
--     if detectorPower then
--         detectorPower = false
--     end

--     if detectorBlips[id] and DoesBlipExist(detectorBlips[id]) then 
--         RemoveBlip(detectorBlips[id])
--         detectorBlips[id] = nil
--     end
-- end

-- end