-- if EventConfig.AirDropActive == true then
-- local airdrops = {}

-- local function createAirdrop(id, position, openTimer, zonePosition, notify)
--     airdrops[id] = {
--         id = id,
--         position = position,
--         openTimer = openTimer,
--         zonePosition = zonePosition,
--         items = {},
--     }

--     for _, item in ipairs(EventConfig.AirdropItems) do
--         airdrops[id].items[item.name] = {item.name, item.count}
--     end

--     TriggerClientEvent('events:airdrops:client:start', -1, {id, position, openTimer, zonePosition, notify})
-- end

-- RegisterCommand('airdrop', function(source, args, rawCommand)
-- 	local xPlayer = ESX.GetPlayerFromId(source)
-- 	if xPlayer.getGroup() == "fondateur" or Player.getGroup() == "responsable" or Player.getGroup() == "gerant" then
--         local id = math.random(1000, 9999)
--         local position = xPlayer.getCoords(true)
--         local openTimer = 300
--         local zonePosition = {x = position.x, y = position.y, z = position.z}
--         local notify = true

--         createAirdrop(id, position, openTimer, zonePosition, notify)
--     else
--         ESX.toConsole('tentative de drop')
--     end
-- end, false)

-- RegisterNetEvent('events:airdrops:server:updateItem')
-- AddEventHandler('events:airdrops:server:updateItem', function(id, item, count)
--     local airdrop = airdrops[id]
--     if airdrop then
--         airdrop.items[item] = {item, count}
--         TriggerClientEvent('events:airdrops:client:updateItem', -1, id, item, count)
--     end
-- end)

-- RegisterNetEvent('events:airdrops:server:caseOnGround')
-- AddEventHandler('events:airdrops:server:caseOnGround', function(id)
--     local airdrop = airdrops[id]
--     if airdrop then
--         TriggerClientEvent('events:airdrops:client:caseOnGround', -1, id, false)
--     end
-- end)

-- RegisterNetEvent('events:airdrops:server:spawnCase')
-- AddEventHandler('events:airdrops:server:spawnCase', function(id, netId)
--     local airdrop = airdrops[id]
--     if airdrop then
--         airdrop.netId = netId
--         TriggerClientEvent('events:airdrops:client:spawnCase', -1, id, netId, false)
--     end
-- end)

-- RegisterNetEvent('events:airdrops:server:removeAirdrop')
-- AddEventHandler('events:airdrops:server:removeAirdrop', function(id)
--     if airdrops[id] then
--         airdrops[id] = nil
--         TriggerClientEvent('events:airdrops:client:stop', -1, id)
--     end
-- end)

-- RegisterNetEvent('events:airdrops:server:claimItem')
-- AddEventHandler('events:airdrops:server:claimItem', function(id, itemKey)
--     local src = source
--     local xslide = ESX.GetPlayerFromId(src)
--     local airdrop = airdrops[id]

--     if airdrop and airdrop.items[itemKey] then
--         local item = airdrop.items[itemKey]
--         local itemName = item[1]
--         local itemCount = item[2]

--         if itemCount > 0 then
--             xslide.addInventoryItem(itemName, itemCount)
--             airdrop.items[itemKey] = nil
--             TriggerClientEvent('events:airdrops:client:updateItem', -1, id, itemKey, 0)
--         end
--     end
-- end)
-- end