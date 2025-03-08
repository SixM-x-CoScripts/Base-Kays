-- local activeEventsEggs = {}

-- RegisterServerEvent('kayscore:event:easter:startEvent')
-- AddEventHandler('kayscore:event:easter:startEvent', function(easter)
--     local source = source
--     local xPlayer = ESX.GetPlayerFromId(source)

--     if xPlayer.getGroup() == "fondateur" or xPlayer.getGroup() == "responsable" or xPlayer.getGroup() == "gerant" then
--         if not xPlayer then
--             ESX.toConsole("Erreur: joueur non trouvé pour l'ID " .. tostring(source))
--             return
--         end

--         if EventConfig.EggsEvent.active then
--             local eventId = #activeEventsEggs + 1
--             activeEventsEggs[eventId] = {
--                 id = eventId,
--                 zoneName = easter.zoneName,
--                 positionZone = easter.positionZone,
--                 positions = easter.positions,
--                 players = {}
--             }
--             for i, position in ipairs(easter.positions) do
--                 if not position.x or not position.y or not position.z then
--                     ESX.toConsole("Erreur: position invalide pour l'événement de Pâques à l'index " .. i)
--                     return
--                 end
--             end
--             ESX.toConsole("Démarrage de l'événement de Pâques avec les données suivantes:")
--             ESX.toConsole("Zone Name:", easter.zoneName)
--             ESX.toConsole("Position Zone:", json.encode(easter.positionZone))
--             ESX.toConsole("Positions:", json.encode(easter.positions))
--             TriggerClientEvent('kayscore:event:easter:startEvent', -1, activeEventsEggs[eventId])
--             TriggerClientEvent('esx:showNotification', -1, 'Un nouvel event de Pâques a commencé: ' .. easter.zoneName)
--         end
--     end
-- end)

-- RegisterServerEvent('event:event:easter:foundBear')
-- AddEventHandler('event:event:easter:foundBear', function(bearIndex)
--     local source = source
--     local xPlayer = ESX.GetPlayerFromId(source)
    
--     if not xPlayer then
--         ESX.toConsole("Erreur: joueur non trouvé pour l'ID " .. tostring(source))
--         return
--     end

--     for eventId, eventData in pairs(activeEventsEggs) do
--         if eventData.positions[bearIndex] then
--             xPlayer.addInventoryItem('easter_bear', 1)
--             TriggerClientEvent('esx:showNotification', source, 'Vous avez trouvé une peluche de Pâques!')
--             table.remove(eventData.positions, bearIndex)
--             if #eventData.positions == 0 then
--                 TriggerClientEvent('kayscore:event:easter:stopEvent', -1)
--                 TriggerClientEvent('esx:showNotification', -1, 'Toutes les peluches de Pâques ont été trouvées!')
--                 activeEventsEggs[eventId] = nil
--             end
--             break
--         end
--     end
-- end)

-- RegisterServerEvent('egghunt:server:getRewards')
-- AddEventHandler('egghunt:server:getRewards', function()
--     local source = source
--     local xPlayer = ESX.GetPlayerFromId(source)
    
--     if not xPlayer then
--         ESX.toConsole("Erreur: joueur non trouvé pour l'ID " .. tostring(source))
--         return
--     end

--     if xPlayer.getInventoryItem('easter_bear').count >= 50 then
--         xPlayer.removeInventoryItem('easter_bear', 50)
--         xPlayer.addInventoryItem('CoinsEggs', 1)
--         TriggerClientEvent('esx:showNotification', source, 'Félicitations! Vous avez trouvé les 50 œufs et gagné 1 Golden Eggs!')
--     else
--         TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez pas assez de peluches de Pâques.')
--     end
-- end)

-- RegisterServerEvent('kayscore:event:easter')
-- AddEventHandler('kayscore:event:easter', function(itemKey)
--     local source = source
--     local xPlayer = ESX.GetPlayerFromId(source)
--     local item = EventConfig.EggsEvent.shop[itemKey]

--     if not xPlayer then
--         ESX.toConsole("Erreur: joueur non trouvé pour l'ID " .. tostring(source))
--         return
--     end

--     if not item then
--         ESX.toConsole("Erreur: article non trouvé pour la clé " .. tostring(itemKey))
--         return
--     end

--     if xPlayer.getInventoryItem('CoinsEggs').count >= 1 then
--         xPlayer.removeInventoryItem('CoinsEggs', 1)
--         if item.type == 'money' then
--             xPlayer.addMoney(item.amount)
--         elseif item.type == 'vehicle' then
--             TriggerClientEvent('esx:spawnVehicle', source, item.name)
--         elseif item.type == 'item' then
--             xPlayer.addInventoryItem(item.name, 1)
--         end
--         TriggerClientEvent('esx:showNotification', source, 'Vous avez acheté ' .. item.label .. ' pour ' .. item.price .. '$')
--     else
--         TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez pas assez de Golden Eggs.')
--     end
-- end)

-- RegisterServerEvent('kayscore:event:easter:stopEvent')
-- AddEventHandler('kayscore:event:easter:stopEvent', function()
--     TriggerClientEvent('kayscore:event:easter:stopEvent', -1)
--     activeEventsEggs = {}
-- end)