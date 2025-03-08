-- ESX.HUD_Inventory = {
--     players = {}
-- }

-- ESX.HUD_Inventory.getPlayerInventoryFromUniqueID = function(UniqueID)
--     if HUD_Inventory.players[UniqueID] == nil then return(print('Erreur l\'ors de la requête de recherche du joueur dans le tableau')) end

--     return HUD_Inventory.players[UniqueID]
-- end

-- ESX.CreateInventory = function(id, UniqueID, identifier, inventoryType, maxWeight, items, loadout, accounts)
--     if id == nil then return end
--     if UniqueID == nil then return end
--     if identifier == nil then return end
--     if inventoryType == nil then return end
--     if maxWeight == nil then return end
--     if items == nil then return end
--     if loadout == nil then return end
--     if accounts == nil then return end

--     local self = {
--         id = id,
--         UniqueID = UniqueID,
--         identifier = identifier,
--         type = inventoryType,
--         maxWeight = maxWeight,
--         items = items,
--         loadout = loadout,
--         accounts = accounts,
--         weight = weight,
--     }

--     ESX.HUD_Inventory.players[UniqueID] = self

-- 	self.triggerEvent = function(eventName, ...)
-- 		TriggerClientEvent(eventName, self.source, ...)
-- 	end

--     self.getItem = function(name, identifier)
--         if name== nil then return end

--         if type(self.items) ~= "table" then return end

--         local returnErrorTable = {
--             name = name,
--             count = 0,
--             label = ESX.Items[name].label or 'Undefined',
--             weight = ESX.Items[name].weight or 1.0,
--             canRemove = ESX.Items[name].canRemove or false,
--             unique = ESX.Items[name].unique or false,
--             extra = ESX.Items[name].unique and {} or nil
--         }

--         if ESX.Items[name] == nil then
--             return returnErrorTable, false
--         end

--         for k,v in pairs(self.items) do

--             if v == nil or type(v) ~= "table" then goto continue end
--             if not ESX.Items[v.name] then goto continue end

--             if v.name == name and (not identifier or (ESX.Items[name].unique and v.extra.identifier == identifier)) then
--                 return v, k
--             end

--             ::continue::
--         end

-- 		return
--         returnErrorTable, false
--     end

--     self.addItem = function(name, number, metadata)
--         if name == nil then return end
--         if number == nil then return end

--         if type(self.items) ~= "table" then return end

--         if ESX.Items[name] == nil then return end
        
--         local hasItem = {
--             have = false,
--             count = 0
--         }

--         for k,v in pairs(self.items) do
--             if tostring(v.name) == tostring(name) then
--                 hasItem.have = true
--                 hasItem.count = count
--                 return
--             end
--         end

--         table.insert(self.items, {
--             name = name,
--             count = hasItem.count + count,
--             label = ESX.Items[name].label or 'Undefined',
--             weight = ESX.Items[name].weight or 1.0,
--             canRemove = ESX.Items[name].canRemove or false,
--             unique = metadata or {},
--             extra = metadata or {},
--         })

--         TriggerEvent('esx:onAddInventoryItem', self.source, item)
--         self.triggerEvent('esx:addInventoryItem', item)
--     end

--     self.removeItem = function(name, number)
--         if name == nil then return end
--         if number == nil then return end

--         if type(self.items) ~= "table" then return end

--         if ESX.Items[name] == nil then return end

--         local hasItem = {
--             have = false,
--             count = 0,
--         }

--         for k,v in pairs(self.items) do
--             if tostring(v.name) == name then
--                 hasItem.have = true
--                 hasItem.count = count
--                 return
--             end
--         end

--         if hasItem.count < number then
--             return
--         end

--         for k,v in pairs(self.items) do
--             if tostring(v.name) == tostring(name) then
--                 self.items[k].count -= number

--                 if self.items[k].count < 1 then
--                     table.remove(self.items, k)
--                     TriggerEvent('esx:onAddInventoryItem', self.source, self.getItem(name))
--                     self.triggerEvent('esx:addInventoryItem', self.getItem(name))
--                     break
--                 else
--                     TriggerEvent('esx:onUpdateItemCount', self.source, false, v.name, self.items[k].count)
--                     self.triggerEvent('esx:updateItemCount', false, v.name, self.items[k].count)
--                     break
--                 end
--             end
--         end

--         return
--     end

--     self.hasWeapon = function(weaponName)
--         if weaponName == nil then return end

--         if type(self.loadout) ~= "table" then return end

--         for k,v in pairs(self.loadout) do
--             if tostring(v.name) == tostring(weaponName) then
--                 return true
--             end
--         end

--         return
--     end

--     self.getWeapon = function(weaponName)
--         if weaponName == nil then return end

--         if type(self.loadout) ~= "table" then return end

--         for k,v in pairs(self.loadout) do
--             if tostring(v.name) == tostring(weaponName) then
--                 return k, self.loadout[k]
--             end
--         end

--         return
--     end

--     self.addWeapon = function(weaponName, ammo)
--         if weaponName == nil then return end
--         if ammo == nil then return end

--         if type(self.loadout) ~= "table" then return end

--         ammo = tonumber(ammo)
--         weaponName = string.upper(weaponName)
-- 		local weaponLabel = ESX.GetWeaponLabel(weaponName)

--         table.insert(self.loadout, {
-- 			name = weaponName,
-- 			ammo = ammo,
-- 			label = weaponLabel,
-- 			components = {},
-- 			id = #self.loadout
-- 		})

-- 		self.triggerEvent('esx:addWeapon', weaponName, ammo)

--         return
--     end

--     self.removeWeapon = function(weaponName, ammo)
--         if weaponName == nil then return end
--         if ammo == nil then return end

--         if type(self.loadout) ~= "table" then return end
        
--         if type(weaponName) ~= 'string' then return end
-- 		weaponName = string.upper(weaponName)

--         local attemp = 0

--         for k,v in pairs(self.loadout) do

--             if v.name == weaponName then

--                 if attemp == 1 then return end

--                 attemp = 1

--                 weaponLabel = self.loadout[k].label

--                 for i,p in pairs(self.loadout[k].components) do
--                     self.removeWeaponComponent(weaponName, self.loadout[k].components[i])
--                 end

--                 table.remove(self.loadout, k)
            
--                 self.triggerEvent('esx:removeWeapon', weaponName, ammo)
-- 				break
--             end
--         end
--     end

--     self.removeWeaponComponent = function(weaponName, weaponComponent)
-- 		if type(weaponName) ~= 'string' then return end
-- 		if type(weaponComponent) ~= 'string' then return end
-- 		weaponName = string.upper(weaponName)
-- 		weaponComponent = string.lower(weaponComponent)
-- 		local loadoutNum, weapon = self.getWeapon(weaponName)

-- 		if weapon then
-- 			local component = ESX.GetWeaponComponent(weaponName, weaponComponent)

-- 			if component then
-- 				if self.hasWeaponComponent(weaponName, weaponComponent) then
-- 					for i = 1, #self.loadout[loadoutNum].components, 1 do
-- 						if self.loadout[loadoutNum].components[i] == weaponComponent then
-- 							table.remove(self.loadout[loadoutNum].components, i)
-- 							break
-- 						end
-- 					end

-- 					self.triggerEvent('esx:removeWeaponComponent', weaponName, weaponComponent)
-- 				end
-- 			end
-- 		end
-- 	end

--     self.addWeaponComponent = function(weaponName, weaponComponent)
-- 		if type(weaponName) ~= 'string' then return end
-- 		if type(weaponComponent) ~= 'string' then return end
-- 		weaponName = string.upper(weaponName)
-- 		weaponComponent = string.lower(weaponComponent)
-- 		local loadoutNum, weapon = self.getWeapon(weaponName)

-- 		if weapon then
-- 			local component = ESX.GetWeaponComponent(weaponName, weaponComponent)

-- 			if component then
-- 				if not self.hasWeaponComponent(weaponName, weaponComponent) then
-- 					table.insert(self.loadout[loadoutNum].components, weaponComponent)
-- 					self.triggerEvent('esx:addWeaponComponent', weaponName, weaponComponent)
-- 				end
-- 			end
-- 		end
-- 	end

--     self.addWeaponAmmo = function(weaponName, ammoCount)
-- 		if type(weaponName) ~= 'string' then return end
-- 		weaponName = string.upper(weaponName)
-- 		local loadoutNum, weapon = self.getWeapon(weaponName)

-- 		if weapon then
-- 			weapon.ammo = weapon.ammo + ammoCount
-- 			self.triggerEvent('esx:setWeaponAmmo', weaponName, weapon.ammo)
-- 		end
-- 	end

-- 	self.removeWeaponAmmo = function(weaponName, ammoCount)
-- 		if type(weaponName) ~= 'string' then return end
-- 		weaponName = string.upper(weaponName)
-- 		local loadoutNum, weapon = self.getWeapon(weaponName)

-- 		if weapon then
-- 			weapon.ammo = weapon.ammo - ammoCount
-- 			self.triggerEvent('esx:setWeaponAmmo', weaponName, weapon.ammo)
-- 		end
-- 	end

--     return self
-- end

-- RegisterCommand('getPlayerNewInventory', function(source)
--     local source = source

--     local xPlayer = ESX.GetPlayerFromId(source)

--     if not xPlayer then return end

--     local player = ESX.CreateInventory(source, xPlayer.UniqueID, xPlayer.identifier, 'hud_inventory', 50, xPlayer.inventory, xPlayer.loadout, xPlayer.accounts)

--     print(player, json.encode(player))
-- end)