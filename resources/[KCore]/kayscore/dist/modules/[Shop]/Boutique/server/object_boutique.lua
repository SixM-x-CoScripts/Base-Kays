-- PlayersList = {}
-- PlayersList.__index = PlayersList
-- PlayersList.List = {}



-- ---------------------------------------------------------------------------------------------
-- -- DEBUT DU SYSTEME DE REROLL SUR LES GAINS DE RECOMPENSES FAIT PAR LEO (LEOXZZY SUR DISCORD)
-- ---------------------------------------------------------------------------------------------

-- local permissionRerollPlayers = {}
-- local BuyersPlayers = {}

-- ------------------------------
-- -- FONCTIONS
-- ------------------------------

-- -- General 
-- local function doesPlayerIsConnected(playerID)
--     if playerID == nil or type(playerID) ~= 'number' then 
--         print('"doesPlayerIsConnected(playerID)" Function Error - The transmitted player ID is equal to nil or is in an incorrect format!')
--         return false
--     end

--     if GetPlayerPing(playerID) == nil or GetPlayerPing(playerID) <= 0 then
--         print('The transmitted player ID returns to an unconnected player!')
--         return false
--     end

--     return true
-- end


-- -- Buyers
-- local function addPlayerToBuyers(playerID, caseID, casePrice)
--     if not doesPlayerIsConnected(playerID) then return end
--     if caseID == nil or type(caseID) ~= 'number' then return print('"addPlayerToBuyers(playerID, caseID, casePrice)" Function Error - The value passed to the "caseID" argument of this function is equal to nil or is in an incorrect format!') end
--     if casePrice == nil or type(casePrice) ~= 'number' then return print('"addPlayerToBuyers(playerID, caseID, casePrice)" Function Error - The value passed to the "casePrice" argument of this function is equal to nil or is in an incorrect format!') end

--     BuyersPlayers[playerID] = {}
--     BuyersPlayers[playerID].caseID = caseID
--     BuyersPlayers[playerID].casePrice = casePrice
-- end

-- local function removePlayerToBuyers(playerID)
--     if not doesPlayerIsConnected(playerID) then return end
--     if BuyersPlayers[playerID] == nil then return print('"removePlayerToBuyers(playerID)" Function Error - Impossible to remove a player from the "Buyers" table if he is not there!') end 

--     BuyersPlayers[playerID] = nil
-- end

-- local function doesPlayerIsBuyer(playerID)
--     if not doesPlayerIsConnected(playerID) then return end
--     if BuyersPlayers[playerID] == nil then return false end

--     return true
-- end

-- local function getBuyerCurrentPurchase(playerID)
--     if not doesPlayerIsConnected(playerID) then return end
--     if not doesPlayerIsBuyer(playerID) then return print('"getBuyerCurrentPurchase(playerID)" Function Error - This player is currently not purchasing a case!') end

--     return BuyersPlayers[playerID]
-- end


-- -- Permission | Functions
-- local function givePermissionToReroll(playerID)
--     if not doesPlayerIsConnected(playerID) then return end
--     if not doesPlayerIsBuyer(playerID) then return end

--     table.insert(permissionRerollPlayers, playerID)
-- end

-- local function removePermissionToReroll(playerID)
--     if not doesPlayerIsConnected(playerID) then return end

--     for k, v in pairs(permissionRerollPlayers) do
--         if playerID == v then
--             return table.remove(permissionRerollPlayers, k)
--         end
--     end

--     print('"removePermissionToReroll(playerID)" Function Error - Impossible to remove Reroll permission from a player who does not have it!')
-- end

-- local function hasPermissionToReroll(playerID)
--     if not doesPlayerIsConnected(playerID) then return end

--     for k, v in pairs(permissionRerollPlayers) do
--         if playerID == v then
--             return true
--         end
--     end

--     return false
-- end


-- function PlayersList:GetPlayerById(source)
--     return PlayersList.List[source]
-- end

-- userData = {}

-- function PlayersList:addPlayer(src, data)
--     local self = setmetatable({}, PlayersList)

--     self.source = src
--     self.identifier = data.identifier
--     self.uniqueid = data.uniqueid
--     self.coins = data.coins
--     self.usedCoins = data.usedCoins
--     self.boutiqueHistory = ''
--     self.reward = data.boutiquereward

--     PlayersList.List[self.source] = self 
    
--     return self
-- end

-- function PlayersList:getIdentifier()
--     return self.identifier
-- end

-- function PlayersList:getCoins()
--     return self.coins
-- end

-- function PlayersList:getUsedCoins()
--     return self.usedCoins
-- end

-- function PlayersList:setCoins(value)
--     self.coins = self.coins + value

--     MySQL.Async.execute('UPDATE users SET kayscorecoins = @coins WHERE UniqueID = @UniqueID', {
--         ['@UniqueID'] = self.uniqueid,
--         ['@coins'] = self.coins
--     })
-- end

-- function PlayersList:setUsedCoins(value)
--     self.usedCoins = self.usedCoins + value
-- end
-- function PlayersList:removeCoins(value)
--     if not value then return end

--     self.coins = self.coins - value

--     MySQL.Async.execute('UPDATE users SET kayscorecoins = @kayscorecoins WHERE UniqueID = @UniqueID', {
--         ["@UniqueID"] = self.uniqueid,
--         ["@kayscorecoins"] = self.coins
--     }, function()
        
--     end)
-- end

-- function PlayersList:addUsedCoins(value)
--     if not value then return end

--     self.usedCoins = self.usedCoins + value

--     MySQL.Async.execute("UPDATE users SET totalcoins = @totalcoins WHERE UniqueID = @UniqueID", {
--         ["@UniqueID"] = self.uniqueid,
--         ["@totalcoins"] = self.usedCoins
--     }, function()
        
--     end)
-- end

-- function PlayersList:getUniqueId()
--     return self.uniqueid
-- end

-- function PlayersList:boutiqueHistory()
--     return self.boutiqueHistory
-- end

-- function PlayersList:getRecompense()
--     return self.reward
-- end

-- AddEventHandler('esx:playerLoaded', function(source, xPlayer)
--     local source = source
--     local xPlayer = ESX.GetPlayerFromId(source)

--     if not xPlayer then return end

--     MySQL.Async.fetchAll('SELECT * FROM boutique_reward WHERE UniqueID = @UniqueID', {
--         ['@UniqueID'] = xPlayer.UniqueID
--     }, function(result)
--         userData.identifier = xPlayer.identifier
--         userData.coins = xPlayer.kayscorecoins
--         userData.usedCoins = xPlayer.totalCoins
--         userData.uniqueid = xPlayer.UniqueID
--         if json.encode(result) == "[]" then
--             userData.boutiquereward = false
--         else
--             userData.boutiquereward = true
--         end

--         if xPlayer.boutiquereward == true or xPlayer.boutiquereward == 1 then
--             userData.boutiquereward = true
--         end

--         PlayersList:addPlayer(source, userData)
--         local player = PlayersList:GetPlayerById(source)

--         secured_TriggerClientEvent('boutique:update', source, player:getCoins(), player:getUsedCoins(), userData.boutiquereward)
--     end)
-- end)

-- secured_RegisterNetEvent('boutique:load', function()
--     local source = source
--     local xPlayer = ESX.GetPlayerFromId(source)

--     if not xPlayer then return end

--     MySQL.Async.fetchAll('SELECT * FROM boutique_reward WHERE UniqueID = @UniqueID', {
--         ['@UniqueID'] = xPlayer.UniqueID
--     }, function(result)
--         userData.identifier = xPlayer.identifier
--         userData.coins = xPlayer.kayscorecoins
--         userData.usedCoins = xPlayer.totalCoins
--         userData.uniqueid = xPlayer.UniqueID
--         if json.encode(result) == "[]" then
--             userData.boutiquereward = false
--         else
--             userData.boutiquereward = true
--         end

--         if xPlayer.boutiquereward == true or xPlayer.boutiquereward == 1 then
--             userData.boutiquereward = true
--         end

--         PlayersList:addPlayer(source, userData)
--         local player = PlayersList:GetPlayerById(source)

--         secured_TriggerClientEvent('boutique:update', source, player:getCoins(), player:getUsedCoins(), userData.boutiquereward)
--     end)
-- end)

-- local isServer = false

-- RegisterCommand('sendCoins', function(source, args)
--     local source = source

--     if args[1] == nil or tonumber(args[2]) == nil then 
--         return print('^1ERROR: Invalid arguments^0') 
--     end

--     local targetUniqueId = args[1]
--     local coinsToAdd = tonumber(args[2])
--     local xPlayer = ESX.GetPlayerFromId(source)

--     if source ~= 0 and xPlayer and xPlayer.getGroup() ~= 'fondateur' then 
--         return DropPlayer(source, 'Tu joue à quoi PELO ??????????')
--     end

--     local function updateCoins(identifier, coins)
--         MySQL.Async.execute('UPDATE users SET kayscorecoins = @kayscorecoins WHERE identifier = @identifier', {
--             ['@identifier'] = identifier,
--             ['@kayscorecoins'] = coins
--         }, function(rowsChanged)
--             if rowsChanged > 0 then
--                 print('^5ID UNIQUE ' .. targetUniqueId .. ' A RECU '..coinsToAdd..'^0')
--                 sendLog(('Achat coins boutique (CONSOLE (GIVE) - %s) (%s) '):format(identifier, coinsToAdd), {
--                     author = 'CONSOLE',
--                     fields = {
--                         {title = 'Joueur', subtitle = 'CONSOLE (GIVE)'},
--                         {title = 'ID Unique', subtitle = targetUniqueId},
--                         {title = 'Identifier', subtitle = identifier},
--                         {title = 'Coins', subtitle = coinsToAdd},
--                         {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")}
--                     },
--                     channel = 'coins_buy_boutique'
--                 })
--             else
--                 print('^1ERROR: Failed to update coins for identifier: ' .. identifier .. '^0')
--             end
--         end)
--     end

--     MySQL.Async.fetchAll('SELECT * FROM users WHERE UniqueID = @UniqueID OR identifier = @identifier', {
--         ['@UniqueID'] = targetUniqueId,
--         ['@identifier'] = targetUniqueId
--     }, function(result)
--         if result[1] then
--             local user = result[1]
--             local newCoins = user.kayscorecoins + coinsToAdd
--             updateCoins(user.identifier, newCoins)
--         else
--             print('^1ERROR: ID UNIQUE INTROUVABLE: ' .. targetUniqueId .. '^0')
--         end
--     end)
-- end)


-- secured_RegisterNetEvent('kayscore:boutique:sendReward', function()
--     local source = source
--     local xPlayer = ESX.GetPlayerFromId(source)

--     local player = PlayersList:GetPlayerById(source)

--     if player.reward == true or player.reward == 1 then
--         DropPlayer(source, 'Tentative de Cheat avec la récompense Boutique !')

--         return
--     end

--     MySQL.Async.execute('INSERT INTO boutique_reward (UniqueID) VALUES (@UniqueID)', {
--         ['@UniqueID'] = xPlayer.UniqueID,
--     }, function()
--         player.reward = true 

--         player:setCoins(500)

--         secured_TriggerClientEvent('boutique:update', xPlayer.source, player:getCoins(), player:getUsedCoins(), player:getRecompense())

--         TriggerClientEvent('esx:showNotification', source, 'Vous venez de récupéré votre cadeau de la boutique ~p~(500 coins)~s~')
--     end)
-- end)

-- secured_RegisterNetEvent('kayscore:boutique:paidCase', function(case_id)
--     local source = source

--     local player = PlayersList:GetPlayerById(source)
--     local xPlayer = ESX.GetPlayerFromId(source)

--     if not xPlayer then return end

--     if not BoutiqueConfig["Case"][case_id] then return end

--     if player:getCoins() < BoutiqueConfig["Case"][case_id].price then
--         TriggerClientEvent('esx:showNotification', source, "~r~Vous ne possedez pas les points requis~s~")
--         return
--     end

--     MySQL.Async.execute('INSERT INTO boutique_history (uniqueid, data) VALUE (@uniqueid, @data)', {
--         ['@uniqueid'] = xPlayer.UniqueID,
--         ['@data'] = ('Vous avez acheté %s pour %s coins'):format(BoutiqueConfig["Case"][case_id].label, BoutiqueConfig["Case"][case_id].price)
--     }, function()
--         player:removeCoins(BoutiqueConfig["Case"][case_id].price)
--         player:addUsedCoins(BoutiqueConfig["Case"][case_id].price)

--         secured_TriggerClientEvent('boutique:update', xPlayer.source, player:getCoins(), player:getUsedCoins(), player:getRecompense())

--         secured_TriggerClientEvent('kayscore:boutique:openCase', source, case_id)
--         addPlayerToBuyers(source, case_id, BoutiqueConfig["Case"][case_id].price)
--     end)
-- end)

-- secured_RegisterNetEvent('kayscore:giveBoutiqueReward', function(reward, props, case_id)
--     local source = source
--     local xPlayer = ESX.GetPlayerFromId(source)

--     if not xPlayer then return end

--     if reward.type == 'vehicle' then
--         local vvvvv = reward.vehicle
--         MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND label = @label', {
--             ['@owner'] = xPlayer.UniqueID,
--             ['@label'] = reward.label
--         }, function(result)
--             if #result > 0 then
--                 local player = PlayersList:GetPlayerById(source)
--                 if player then
--                     player:setCoins(BoutiqueConfig["Case"][case_id].price)
--                     secured_TriggerClientEvent('boutique:update', source, player:getCoins(), player:getUsedCoins(), player:getRecompense())
--                 end
--                 TriggerClientEvent('esx:showNotification', source, 'Vous avez déjà ce véhicule. Vous avez récupéré vos coins.')
--             else
--                 -- Envoie la notification avant d'ajouter le véhicule
--                 TriggerClientEvent('esx:showNotification', source, 'Vous avez gagné ~g~'..reward.label)
--                 MySQL.Async.execute('INSERT INTO owned_vehicles (owner, state, plate, vehicle, name, label, type, job, garageid, boutique) VALUES (@owner, @state, @plate, @vehicle, @name, @label, @type, @job, @garageid, @boutique)', {
--                     ['@owner'] = xPlayer.UniqueID,
--                     ['@state'] = 1,
--                     ['@plate'] = props.plate,
--                     ['@vehicle'] = json.encode(props),
--                     ['@name'] = props.model,
--                     ['@label'] = reward.label,
--                     ['@type'] = tostring(vvvvv),
--                     ['@job'] = 'unemployed',
--                     ['@garageid'] = vvvvv == 'car' and 1 or vvvvv == 'boat' and 3 or vvvvv == 'aircraft' and 2,
--                     ['@boutique'] = 1,
--                 }, function()
--                     Garages:loadWithPlayerUniqueID(xPlayer.UniqueID)
--                 end)
--             end
--         end)
--     elseif reward.type == 'weapon' then
--         if xPlayer.hasWeapon(reward.name) then
--             local player = PlayersList:GetPlayerById(source)
--             if player then
--                 player:setCoins(BoutiqueConfig["Case"][case_id].price)
--                 secured_TriggerClientEvent('boutique:update', source, player:getCoins(), player:getUsedCoins(), player:getRecompense())
--             end
--             TriggerClientEvent('esx:showNotification', source, 'Vous avez déjà cette arme. Vous avez récupéré vos coins.')
--         else
--             xPlayer.addWeapon(reward.name, 255)
--             TriggerClientEvent('esx:showNotification', source, 'Vous avez gagné ~g~'..reward.label)
--         end
--     elseif reward.type == 'item' then
--         local inventoryItem = xPlayer.getInventoryItem(reward.name)
--         if inventoryItem.count > 0 then
--             TriggerClientEvent('esx:showNotification', source, 'Vous avez déjà cet item. Vous avez récupéré vos coins.')
--             local player = PlayersList:GetPlayerById(source)
--             if player then
--                 player:setCoins(BoutiqueConfig["Case"][case_id].price)
--                 secured_TriggerClientEvent('boutique:update', source, player:getCoins(), player:getUsedCoins(), player:getRecompense())
--             end
--         else
--             xPlayer.addInventoryItem(reward.name, reward.count)
--             TriggerClientEvent('esx:showNotification', source, 'Vous avez gagné ~g~'..reward.label)
--         end
--     elseif reward.type == 'coins' then 
--         local player = PlayersList:GetPlayerById(source)
--         if player then
--             player:setCoins(reward.count)
--             secured_TriggerClientEvent('boutique:update', source, player:getCoins(), player:getUsedCoins(), player:getRecompense())
--             TriggerClientEvent('esx:showNotification', source, 'Vous avez gagné ~g~'..reward.count..' NevaCoins')
--         end
--     elseif reward.type == 'money' then
--         xPlayer.addAccountMoney('cash', reward.count)
--         TriggerClientEvent('esx:showNotification', source, 'Vous avez gagné ~g~'..reward.count..'$')
--     end
-- end)




-- secured_RegisterNetEvent('kayscore:weapon:paid', function(price, name)
--     local source = source
--     local xPlayer = ESX.GetPlayerFromId(source)

--     if not xPlayer then return end

--     local player = PlayersList:GetPlayerById(source)

--     MySQL.Async.execute('INSERT INTO boutique_history (uniqueid, data) VALUE (@uniqueid, @data)', {
--         ['@uniqueid'] = xPlayer.UniqueID,
--         ['@data'] = ('Vous avez acheté %s pour %s coins'):format(name, price)
--     }, function()
--         MySQL.Async.execute(("UPDATE users SET kayscorecoins = '".. player:getCoins() - price .."' WHERE UniqueID = @UniqueID"), {
--             ['@UniqueID'] = xPlayer.UniqueID
--         }, function() 
--         end)
--         MySQL.Async.execute(("UPDATE users SET totalcoins = '".. player:getUsedCoins() + price  .."' WHERE UniqueID = @UniqueID"), {
--             ['@UniqueID'] = xPlayer.UniqueID
--         }, function() 
--         end)


--         if xPlayer.hasWeapon(name) then
--             TriggerClientEvent('esx:showNotification', source, 'Vous avez déjà cette arme. Vous avez récupéré vos coins.')
--             local player = PlayersList:GetPlayerById(source)

--             if player then
--                 player:setCoins(price)
--                 secured_TriggerClientEvent('boutique:update', source, player:getCoins(), player:getUsedCoins(), player:getRecompense())
--             end
--         else
--             TriggerClientEvent('esx:showNotification', source, "Vous venez d'acheter l'arme")
--         xPlayer.addWeapon(name, 255)
--         secured_TriggerClientEvent('boutique:update', xPlayer.source, player:getCoins() - price, player:getUsedCoins() + price, player:getRecompense())

--         end
--     end)
-- end)

-- CreateThread(function()
--     MySQL.Async.execute([[
--         CREATE TABLE IF NOT EXISTS `boutique_reward` (
--             UniqueID INT(11) DEFAULT NULL
--         );
--     ]])
-- end)
