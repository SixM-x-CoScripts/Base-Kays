function CreatePlayer(source, identifier, userData)
    local self = {}

	self.source = source
	self.UniqueID = userData.UniqueID
    self.character_id = userData.UniqueID
	self.identifier = identifier
	self.name = userData.name
	self.group = userData.permission_group
	self.permission_level = userData.permission_level
	self.accounts = userData.accounts
	self.job = userData.job
	self.job2 = userData.job2
	self.inventory = userData.inventory
	self.loadout = userData.loadout
	self.lastPosition = userData.lastPosition
	self.maxWeight = Config.MaxWeight
	self.firstname = userData.firstname
	self.lastname = userData.lastname
	self.sex = userData.sex
	self.dateofbirth = userData.dateofbirth
	self.life = userData.life
	self.playerName = userData.playerName
	self.positionSaveReady = false
    self.kayscorecoins = userData.kayscorecoins
    self.totalCoins = userData.totalCoins
    self.boutiquereward = userData.boutiquereward

    function self.triggerEvent(eventName, ...)
        TriggerClientEvent(eventName, self.source, ...)
    end
    
    function self.chatMessage (msg, author, color)
        self.triggerEvent('chat:addMessage', {color = color or {0, 0, 0}, args = {author or 'SYSTEME', msg or ''}})
    end
    
    function self.kick(reason)
        DropPlayer(self.source, reason)
    end
    
    function self.set(key, value)
        self[key] = value
    end
    
    function self.get(key)
        return self[key]
    end
    
    function self.getLevel()
        return self.permission_level
    end
    function self.updateWeaponAmmo(weaponName, ammoCount)
        local _, weapon = self.getWeapon(weaponName)

        if weapon then
            weapon.ammo = ammoCount
        end
    end
    function self.setLevel(level)
        local lastLevel = permission_level
    
        if type(level) == "number" then
            self.permission_level = level
    
            TriggerEvent('esx:setLevel', self.source, self.permission_level, lastLevel)
            self.triggerEvent('esx:setLevel', self.permission_level, lastLevel)
        end
    end
    
    function self.getGroup()
        return self.group
    end
    
    function self.setGroup(newGroup)
        if self.source == nil then return end
        if ESX.Groups[newGroup] ~= true or ESX.Groups[newGroup] == nil then
            return print(('[^3WARNING^7] La fonction :setGroup() est invalide pour la license "%s" id %s'):format(self.identifier, self.source))
        end
        self.group = newGroup
        TriggerEvent('esx:setGroup', self.source, self.group)
        self.triggerEvent('esx:setGroup', self.group)
    end
    
    function self.getAccount(accountName)
        for i = 1, #self.accounts, 1 do
            if self.accounts[i].name == accountName then
                return self.accounts[i]
            end
        end
    end
    
    function self.getAccounts(minimal)
        if minimal then
            local minimalAccounts = {}
    
            for i = 1, #self.accounts, 1 do
                table.insert(minimalAccounts, {
                    name = self.accounts[i].name,
                    money = self.accounts[i].money
                })
            end
    
            return minimalAccounts
        else
            return self.accounts
        end
    end
    
    function self.setMoney(money)
        money = ESX.Math.Check(ESX.Math.Round(money))
    
        if money > 0 then
            local account = self.getAccount('cash')
    
            if account then
                local newMoney = ESX.Math.Check(account.money + money)
                account.money = newMoney
                self.triggerEvent('esx:setAccountMoney', account)
            end
        end
    end
    
    function self.getMoney()
        for i = 1, #self.accounts, 1 do
            if self.accounts[i].name == 'cash' then
                return self.accounts[i].money
            end
        end
    end
    
    function self.setBankBalance(money)
        money = ESX.Math.Check(ESX.Math.Round(money))
    
        if money > 0 then
            local account = self.getAccount('bank')
    
            if account then
                local newMoney = ESX.Math.Check(account.money + money)
                account.money = newMoney
                self.triggerEvent('esx:setAccountMoney', account)
            end
        end
    end
    
    function self.getBank()
        for i = 1, #self.accounts, 1 do
            if self.accounts[i].name == 'bank' then
                return self.accounts[i]
            end
        end
    end
    
    function self.getInventory(minimal)
        if minimal then
            local minimalInventory = {}
    
            for i = 1, #self.inventory, 1 do
                table.insert(minimalInventory, {
                    name = self.inventory[i].name,
                    count = self.inventory[i].count,
                    extra = ESX.Items[self.inventory[i].name].unique and self.inventory[i].extra or nil
                })
            end
    
            return minimalInventory
        else
            return self.inventory
        end
    end
    
    function self.getIdentifier()
        return self.identifier
    end
    
    function self.getUniqueID()
        return self.UniqueID
    end
    
    function self.getLoadout()
        return self.loadout
    end
    
    function self.getJob()
        return self.job
    end
    
    function self.getJob2()
        return self.job2
    end
    
    function self.getName()
        return self.name
    end
    
    function self.setName(name)
        self.name = name
    end
    
    function self.getCoords()
        local coords = GetEntityCoords(GetPlayerPed(self.source))
    
        if type(coords) ~= 'vector3' or ((coords.x >= -1.0 and coords.x <= 1.0) and (coords.y >= -1.0 and coords.y <= 1.0) and (coords.z >= -1.0 and coords.z <= 1.0)) then
            coords = self.getLastPosition()
        end
    
        return coords
    end
    
    function self.getLastPosition()
        return self.lastPosition
    end
    
    function self.setLastPosition(coords)
        self.lastPosition = coords
    end
    
    function self.setAccountMoney(accountName, money)
        money = ESX.Math.Check(ESX.Math.Round(money))
    
        if money >= 0 then
            local account = self.getAccount(accountName)
    
            if account then
                account.money = money
                self.triggerEvent('esx:setAccountMoney', account)
            end
        end
    end
    
    function self.addAccountMoney(accountName, money)
        money = ESX.Math.Check(ESX.Math.Round(money))
    
        if money > 0 then
            local account = self.getAccount(accountName)
    
            if account then
                local newMoney = ESX.Math.Check(account.money + money)
                account.money = newMoney
                self.triggerEvent('esx:setAccountMoney', account)
            end
        end
    end
    
    function self.removeAccountMoney(accountName, money)
        money = ESX.Math.Check(ESX.Math.Round(money))
    
        if money > 0 then
            local account = self.getAccount(accountName)
    
            if account then
                local newMoney = ESX.Math.Check(account.money - money)
                account.money = newMoney
                self.triggerEvent('esx:setAccountMoney', account)
            end
        end
    end
    
    function self.hasInventoryItem(name)
        for i = 1, #self.inventory, 1 do
            if self.inventory[i].name == name then
                return true
            end
        end
    
        return false
    end
    
    function self.getInventoryItem(name, identifier)
        if ESX.Items[name] == nil then return end
    
        for i = 1, #self.inventory, 1 do
            if self.inventory[i].name == name and (not identifier or (ESX.Items[name].unique and self.inventory[i].extra.identifier == identifier)) then
                return self.inventory[i], i
            end
        end
    
        return {
            name = name,
            count = 0,
            label = ESX.Items[name].label or 'Undefined',
            weight = ESX.Items[name].weight or 1.0,
            canRemove = ESX.Items[name].canRemove or false,
            unique = ESX.Items[name].unique or false,
            extra = ESX.Items[name].unique and {} or nil
        }, false
    end
    
    function self.updateItemMetadata(name, metadata)
        if ESX.Items[name] == nil then return end
    
        for i = 1, #self.inventory, 1 do
            if self.inventory[i].name == name then
                TriggerEvent('esx:onRemoveInventoryItem', self.source, self.inventory[i])
                self.triggerEvent('esx:removeInventoryItem', self.inventory[i])
                self.inventory[i].extra = metadata
                TriggerEvent('esx:onAddInventoryItem', self.source, self.inventory[i])
                self.triggerEvent('esx:addInventoryItem', self.inventory[i])
    
                return
            end
        end
    end
    
    function self.addInventoryItem(name, count, extra)
        if ESX.Items[name] == nil then return end
        count = ESX.Math.Round(count)
        if count < 1 then return end
    
        local item, itemIndex = self.getInventoryItem(name, false)
    
        if ESX.Items[name].unique then
            local item = {
                name = name,
                count = 1,
                label = ESX.Items[name].label or 'Undefined',
                weight = ESX.Items[name].weight or 1.0,
                canRemove = ESX.Items[name].canRemove or false,
                unique = ESX.Items[name].unique or false,
                extra = extra or {}
            }
    
            table.insert(self.inventory, item)
            TriggerEvent('esx:onAddInventoryItem', self.source, item)
            self.triggerEvent('esx:addInventoryItem', item)
    
        else
            if item and itemIndex then
                local newCount = item.count + count
    
                if newCount > 0 then
                    item.count = newCount
                    TriggerEvent('esx:onUpdateItemCount', self.source, true, item.name, newCount)
                    self.triggerEvent('esx:updateItemCount', true, item.name, newCount)
        
                end
            else
                local item = {
                    name = name,
                    count = count,
                    label = ESX.Items[name].label or 'Undefined',
                    weight = ESX.Items[name].weight or 1.0,
                    canRemove = ESX.Items[name].canRemove or false,
                    unique = ESX.Items[name].unique or false,
                    extra = extra or {}
                }
    
                table.insert(self.inventory, item)
                TriggerEvent('esx:onAddInventoryItem', self.source, item)
                self.triggerEvent('esx:addInventoryItem', item)
    
            end
        end
    end
    
    function self.removeInventoryItem(name, count, identifier)
        -- if type(name) ~= 'string' then return end
        -- if type(count) ~= 'number' then return end
        if ESX.Items[name] == nil then return end
        count = ESX.Math.Round(count)
        if count < 1 then return end
    
        local item, itemIndex = self.getInventoryItem(name, identifier)
    
        if item and itemIndex then
            if ESX.Items[name].unique then
                table.remove(self.inventory, itemIndex)
                TriggerEvent('esx:onRemoveInventoryItem', self.source, item)
                self.triggerEvent('esx:removeInventoryItem', item)
    
            else
                local newCount = item.count - count
    
                if newCount > 0 then
                    item.count = newCount
                    TriggerEvent('esx:onUpdateItemCount', self.source, false, item.name, newCount)
                    self.triggerEvent('esx:updateItemCount', false, item.name, newCount)
        
                else
                    table.remove(self.inventory, itemIndex)
                    TriggerEvent('esx:onRemoveInventoryItem', self.source, item)
                    self.triggerEvent('esx:removeInventoryItem', item)
        
                end
            end
        end
    end
    
    function self.setInventoryItem(name, count, identifier)
        local item = self.getInventoryItem(name, identifier)
    
        if item and count >= 0 then
            count = ESX.Math.Round(count)
    
            if count > item.count then
                self.addInventoryItem(item.name, count - item.count)
            else
                self.removeInventoryItem(item.name, item.count - count)
            end
        end
    end
    
    function self.getWeight()
        local inventoryWeight = 0
    
        for i = 1, #self.inventory, 1 do
            inventoryWeight = inventoryWeight + (self.inventory[i].count * self.inventory[i].weight)
        end
    
        return inventoryWeight
    end
    
    function self.canCarryItem(name, count)
        local currentWeight, itemWeight = self.getWeight(), ESX.Items[name].weight
        local newWeight = currentWeight + (itemWeight * count)
    
        return newWeight <= self.maxWeight
    end
    
    function self.canSwapItem(firstItem, firstItemCount, testItem, testItemCount)
        local firstItemObject = self.getInventoryItem(firstItem)
    
        if firstItemObject.count >= firstItemCount then
            local weightWithoutFirstItem = ESX.Math.Round(self.getWeight() - (ESX.Items[firstItem].weight * firstItemCount))
            local weightWithTestItem = ESX.Math.Round(weightWithoutFirstItem + (ESX.Items[testItem].weight * testItemCount))
    
            return weightWithTestItem <= self.maxWeight
        end
    
        return false
    end
    
    function self.addWeapon(weaponName, ammo)
        if type(weaponName) ~= 'string' then return end
        ammo = tonumber(ammo)
        weaponName = string.upper(weaponName)
        local weaponLabel = ESX.GetWeaponLabel(weaponName)
    
        local HaveLoadout = false

        for k,v in pairs(self.loadout) do
            if v.name == weaponName then
                HaveLoadout = true

                return ESX.Notifi(self.source, "Vous possedez déjà cette Arme !")
            end
        end

        if not HaveLoadout then
            table.insert(self.loadout, {
                name = weaponName,
                ammo = ammo,
                label = weaponLabel,
                components = {},
                id = #self.loadout
            })    

            self.triggerEvent('esx:addWeapon', weaponName, ammo)
        end
        
        -- self.triggerEvent('esx:addWeapon', weaponName, ammo)
    end
    
    function self.addWeaponComponent(weaponName, weaponComponent)
        if type(weaponName) ~= 'string' then return end
        if type(weaponComponent) ~= 'string' then return end
        weaponName = string.upper(weaponName)
        weaponComponent = string.lower(weaponComponent)
        local loadoutNum, weapon = self.getWeapon(weaponName)
    
        if weapon then
            local component = ESX.GetWeaponComponent(weaponName, weaponComponent)
    
            if component then
                if not self.hasWeaponComponent(weaponName, weaponComponent) then
                    table.insert(self.loadout[loadoutNum].components, weaponComponent)
                    self.triggerEvent('esx:addWeaponComponent', weaponName, weaponComponent)
                end
            end
        end
    end
    
    function self.showNotification(message)
        return ESX.Notifi(self.source, message)
    end
    
    function self.addWeaponAmmo(weaponName, ammoCount)
        if type(weaponName) ~= 'string' then return end
        weaponName = string.upper(weaponName)
        local loadoutNum, weapon = self.getWeapon(weaponName)
    
        if weapon then
            weapon.ammo = weapon.ammo + ammoCount
            self.triggerEvent('esx:setWeaponAmmo', weaponName, weapon.ammo)
        end
    end
    
    function self.removeWeapon(weaponName, ammo, isAdmin)
        -- if isAdmin then goto continue end

        -- if ESX.NOTREMOVEWEAPONS[weaponName] then return end

        -- ::continue::

        if type(weaponName) ~= 'string' then return end
        weaponName = string.upper(weaponName)
        
        for k,v in pairs(self.loadout) do
            if v.name == weaponName then
                
                for i,p in pairs(v.components) do
                    self.removeWeaponComponent(weaponName, self.loadout[k].components[i])
                end

                table.remove(self.loadout, k)
                self.triggerEvent('esx:removeWeapon', weaponName, ammo)
            end
        end

        -- local attemp = 0
    
        -- for i = 1, #self.loadout, 1 do
    
        --     if attemp == 1 then return end
    
        --     if self.loadout[i].name == weaponName then
        --         attemp = 1
        --         weaponLabel = self.loadout[i].label
    
        --         for j = 1, #self.loadout[i].components, 1 do
        --             self.removeWeaponComponent(weaponName, self.loadout[i].components[j])
        --         end
    
        --         table.remove(self.loadout, i)
        --         self.triggerEvent('esx:removeWeapon', weaponName, ammo)
        --         break
        --     end
        -- end
    end
    
    function self.removeWeaponComponent(weaponName, weaponComponent)
        if type(weaponName) ~= 'string' then return end
        if type(weaponComponent) ~= 'string' then return end
        weaponName = string.upper(weaponName)
        weaponComponent = string.lower(weaponComponent)
        local loadoutNum, weapon = self.getWeapon(weaponName)
    
        if weapon then
            local component = ESX.GetWeaponComponent(weaponName, weaponComponent)
    
            if component then
                if self.hasWeaponComponent(weaponName, weaponComponent) then
                    for i = 1, #self.loadout[loadoutNum].components, 1 do
                        if self.loadout[loadoutNum].components[i] == weaponComponent then
                            table.remove(self.loadout[loadoutNum].components, i)
                            break
                        end
                    end
    
                    self.triggerEvent('esx:removeWeaponComponent', weaponName, weaponComponent)
                end
            end
        end
    end
    
    function self.removeWeaponAmmo(weaponName, ammoCount)
        if type(weaponName) ~= 'string' then return end
        weaponName = string.upper(weaponName)
        local loadoutNum, weapon = self.getWeapon(weaponName)
    
        if weapon then
            weapon.ammo = weapon.ammo - ammoCount
            self.triggerEvent('esx:setWeaponAmmo', weaponName, weapon.ammo)
        end
    end
    
    function self.hasWeaponComponent(weaponName, weaponComponent)
        if type(weaponName) ~= 'string' then return end
        if type(weaponComponent) ~= 'string' then return end
        weaponName = string.upper(weaponName)
        weaponComponent = string.lower(weaponComponent)
        local loadoutNum, weapon = self.getWeapon(weaponName)
    
        if weapon then
            for i = 1, #weapon.components, 1 do
                if weapon.components[i] == weaponComponent then
                    return true
                end
            end
    
            return false
        else
            return false
        end
    end
    
    function self.hasWeapon(weaponName)
        for i=1, #self.loadout, 1 do
    
            if self.loadout[i].name == weaponName then
    
                return true
    
            end
    
        end
    
        return false
    end
    
    function self.getWeapon(weaponName)
        weaponName = weaponName
    
        for i = 1, #self.loadout, 1 do
            if self.loadout[i].name == weaponName then
                return i, self.loadout[i]
            end
        end
    
        return
    end
    
    function self.setJob(job, grade)
        grade = tostring(grade)
        local lastJob = json.decode(json.encode(self.job))
    
        if ESX.DoesJobExist(job, grade) then
            local jobObject, gradeObject = ESX.Jobs[job], ESX.Jobs[job].grades[grade]
    
            self.job.id = jobObject.id
            self.job.name = jobObject.name
            self.job.label = jobObject.label
    
            self.job.grade = tonumber(grade)
            self.job.grade_name = gradeObject.name
            self.job.grade_label = gradeObject.label
            self.job.grade_salary = gradeObject.salary
    
            if gradeObject.skin_male then
                self.job.skin_male = json.decode(gradeObject.skin_male)
            else
                self.job.skin_male = {}
            end
    
            if gradeObject.skin_female then
                self.job.skin_female = json.decode(gradeObject.skin_female)
            else
                self.job.skin_female = {}
            end
    
            TriggerEvent('esx:setJob', self.source, self.job, lastJob)
            self.triggerEvent('esx:setJob', self.job)
        else
            print(('[^3WARNING^7] Ignoring invalid :setJob() usage for "%s"'):format(self.identifier))
        end
    end
    
    function self.setgroup(job2, grade2)
        grade2 = tostring(grade2)
        local lastJob2 = json.decode(json.encode(self.job2))
    
        if ESX.DoesJobExist(job2, grade2) then
            local job2Object, grade2Object = ESX.Jobs[job2], ESX.Jobs[job2].grades[grade2]
    
            self.job2.id = job2Object.id
            self.job2.name = job2Object.name
            self.job2.label = job2Object.label
    
            self.job2.grade = tonumber(grade2)
            self.job2.grade_name = grade2Object.name
            self.job2.grade_label = grade2Object.label
            self.job2.grade_salary = grade2Object.salary
    
            if grade2Object.skin_male ~= nil then
                self.job2.skin_male = json.decode(grade2Object.skin_male)
            else
                self.job.skin_male = {}
            end
    
            if grade2Object.skin_female ~= nil then
                self.job2.skin_female = json.decode(grade2Object.skin_female)
            else
                self.job.skin_female = {}
            end
    
            TriggerEvent('esx:setgroup', self.source, self.job2, lastJob2)
            self.triggerEvent('esx:setgroup', self.job2)
        else
            print(('[^3WARNING^7] Ignoring invalid :setJob() usage for "%s"'):format(self.identifier))
        end
    end
    
    function self.setMaxWeight(newWeight)
        newWeight = ESX.Math.Round(newWeight)
    
        if newWeight > 0 then
            self.maxWeight = newWeight
            self.triggerEvent('esx:setMaxWeight', self.maxWeight)
        end
    end
    
    function self.showAdvancedNotification(title, subject, msg, icon, iconType, hudColorIndex)
        self.triggerEvent('esx:showAdvancedNotification', title, subject, msg, icon, iconType, hudColorIndex)
    end
    
    function self.showHelpNotification(msg)
        self.triggerEvent('esx:showHelpNotification', msg)
    end
    
    function self.setSalaryJob(salaire)
        self.job.grade_salary = salaire
    end

	ESX.Players[self.source] = self

	return self
end