SetMapName("Kay") 
SetGameType("https://discord.gg/overfa")
function LoadUser(source, identifier)

	local _src = source
	local tasks = {}

	local userData = {
		name = GetPlayerName(source),
		accounts = {},
		job = {},
		job2 = {},
		inventory = {},
		loadout = {}
	}

	table.insert(tasks, function(cb)
		MySQL.Async.fetchAll('SELECT UniqueID, playerName, permission_group, permission_level, accounts, job, job_grade, job2, job2_grade, firstname, lastname, sex, dateofbirth, inventory, loadout, position, rank, kayscorecoins, totalCoins, boutiquereward FROM users WHERE identifier = @identifier', {
			['@identifier'] = identifier
		}, function(result)
			local job, grade = result[1].job, tostring(result[1].job_grade)
			local job2, grade2 = result[1].job2, tostring(result[1].job2_grade)

			if result[1].UniqueID then
				userData.UniqueID = result[1].UniqueID
			else
				userData.UniqueID = 0
			end

			if result[1].playerName then
				userData.playerName = result[1].playerName
			else
				userData.playerName = GetPlayerName(source)
			end

			if result[1].permission_group then
				userData.permission_group = result[1].permission_group
			else
				userData.permission_group = Config.DefaultGroup
			end

			if result[1].kayscorecoins then
				userData.kayscorecoins = result[1].kayscorecoins
			else
				userData.kayscorecoins = 0
			end

			if result[1].totalCoins then
				userData.totalCoins = result[1].totalCoins
			else
				userData.totalCoins = 0
			end

			if result[1].boutiquereward then
				userData.boutiquereward = result[1].boutiquereward
			else
				userData.boutiquereward = false
			end

			if result[1].rank then
				userData.rank = result[1].rank
			else
				userData.rank = 'member'
			end

			if result[1].permission_level ~= nil then
				userData.permission_level = result[1].permission_level
			else
				userData.permission_level = Config.DefaultLevel
			end

			if result[1].firstname ~= nil then
				userData.firstname = result[1].firstname
			else
				userData.firstname = 'Aucun prénom trouvé'
			end

			if result[1].lastname ~= nil then
				userData.lastname = result[1].lastname
			else
				userData.lastname = 'Aucun nom trouvé'
			end

			if result[1].sex ~= nil then
				userData.sex = result[1].sex
			else
				userData.sex = 'TRANS'
			end

			if result[1].dateofbirth ~= nil then
				userData.dateofbirth = result[1].dateofbirth
			else
				userData.dateofbirth = 'Aucune date renseigner'
			end

			if result[1].accounts and result[1].accounts ~= '' then
				local formattedAccounts = json.decode(result[1].accounts) or {}

				for i = 1, #formattedAccounts, 1 do
					if Config.Accounts[formattedAccounts[i].name] == nil then
						print(('[^3WARNING^7] Ignoring invalid account "%s" for "%s"'):format(formattedAccounts[i].name, identifier))
						table.remove(formattedAccounts, i)
					else
						formattedAccounts[i] = {
							name = formattedAccounts[i].name,
							money = formattedAccounts[i].money or 0
						}
					end
				end

				userData.accounts = formattedAccounts
			else
				userData.accounts = {}
			end

			for name, account in pairs(Config.Accounts) do
				local found = false

				for i = 1, #userData.accounts, 1 do
					if userData.accounts[i].name == name then
						found = true
					end
				end

				if not found then
					table.insert(userData.accounts, {
						name = name,
						money = account.starting or 0
					})
				end
			end

			table.sort(userData.accounts, function(a, b)
				return Config.Accounts[a.name].priority < Config.Accounts[b.name].priority
			end)

			if not ESX.DoesJobExist(job, grade) then
				print(('[^3WARNING^7] Ignoring invalid job for %s [job: %s, grade: %s]'):format(identifier, job, grade))
				job, grade = 'unemployed', '0'
			end

			if not ESX.DoesJobExist(job2, grade2) then
				print(('[^3WARNING^7] Ignoring invalid job2 for %s [job: %s, grade: %s]'):format(identifier, job2, grade2))
				job2, grade2 = 'unemployed2', '0'
			end

			local jobObject, gradeObject = ESX.Jobs[job], ESX.Jobs[job].grades[grade]
			local job2Object, grade2Object = ESX.Jobs[job2], ESX.Jobs[job2].grades[grade2]

			userData.job.id = jobObject.id
			userData.job.name = jobObject.name
			userData.job.label = jobObject.label

			userData.job.grade = tonumber(grade)
			userData.job.grade_name = gradeObject.name
			userData.job.grade_label = gradeObject.label
			userData.job.grade_salary = gradeObject.salary


			userData.job.skin_male = {}
			userData.job.skin_female = {}

			if gradeObject.skin_male then
				userData.job.skin_male = json.decode(gradeObject.skin_male)
			end

			if gradeObject.skin_female then
				userData.job.skin_female = json.decode(gradeObject.skin_female)
			end

			userData.job2.id = job2Object.id
			userData.job2.name = job2Object.name
			userData.job2.label = job2Object.label

			userData.job2.grade = tonumber(grade2)
			userData.job2.grade_name = grade2Object.name
			userData.job2.grade_label = grade2Object.label
			userData.job2.grade_salary = grade2Object.salary

			userData.job2.skin_male = {}
			userData.job2.skin_female = {}

			if grade2Object.skin_male then
				userData.job2.skin_male = json.decode(grade2Object.skin_male)
			end

			if grade2Object.skin_female then
				userData.job2.skin_female = json.decode(grade2Object.skin_female)
			end

			if result[1].inventory and result[1].inventory ~= '' and result[1].inventory ~= nil then
				local formattedInventory = json.decode(result[1].inventory) or {}

				for i = 1, #formattedInventory, 1 do
					--print("211 LIGNES SDQD")
						
					if formattedInventory[i] ~= nil then
						--print("FORMATED ITEM >>>>> "..formattedInventory[i].name)
					
					if ESX.Items[formattedInventory[i].name] == nil then
						print(formattedInventory[i].name)
						print(('[^3WARNING^7] Ignoring invalid item "%s" for "%s"'):format(formattedInventory[i].name, identifier))
						table.remove(formattedInventory, i)
					else
						formattedInventory[i] = {
							name = formattedInventory[i].name,
							count = formattedInventory[i].count,
							label = ESX.Items[formattedInventory[i].name].label or 'Undefined',
							weight = ESX.Items[formattedInventory[i].name].weight or 1.0,
							canRemove = ESX.Items[formattedInventory[i].name].canRemove or false,
							unique = ESX.Items[formattedInventory[i].name].unique or false,
							extra = ESX.Items[formattedInventory[i].name].unique and (formattedInventory[i].extra or {}) or nil
						}
					end
				  end
				end

				userData.inventory = formattedInventory
			else
				userData.inventory = {}
			end

			table.sort(userData.inventory, function(a, b)
				return ESX.Items[a.name].label <  ESX.Items[b.name].label
			end)

			if result[1].loadout and result[1].loadout ~= '' then
				local formattedLoadout = json.decode(result[1].loadout) or {}

				for i = 1, #formattedLoadout, 1 do
					if formattedLoadout[i].components == nil then
						formattedLoadout[i].components = {}
					end
				end

				userData.loadout = formattedLoadout
			else
				userData.loadout = {}
			end

			table.sort(userData.loadout, function(a, b)
				local labelA = ESX.GetWeaponLabel(a.name) or "nul weapon"
				local labelB = ESX.GetWeaponLabel(b.name) or "nul weapon"
				return labelA < labelB
			end)			

			if result[1].position and result[1].position ~= '' then
				local formattedPosition = json.decode(result[1].position)
				userData.lastPosition = ESX.Vector(formattedPosition)
			else
				userData.lastPosition = Config.DefaultPosition
			end
			
			cb()
		end)
	end)


	-- Run Tasks
	Async.parallel(tasks, function(results)
		local xPlayer = CreatePlayer(source, identifier, userData)

		ESX.Players[source] = xPlayer
		
		TriggerEvent('esx:playerLoaded', source, xPlayer)

		xPlayer.triggerEvent('esx:playerLoaded', {
			UniqueID = xPlayer.UniqueID,
			firstname = xPlayer.firstname,
			lastname = xPlayer.lastname,
			sex = xPlayer.sex,
			dateofbirth = xPlayer.dateofbirth,
			identifier = xPlayer.identifier,
			accounts = xPlayer.getAccounts(),
			level = xPlayer.getLevel(),
			group = xPlayer.getGroup(),
			job = xPlayer.getJob(),
			job2 = xPlayer.getJob2(),
			inventory = xPlayer.getInventory(),
			loadout = xPlayer.getLoadout(),
			lastPosition = xPlayer.getLastPosition(),
			maxWeight = xPlayer.maxWeight,
			playerName = GetPlayerName(source),
			connected = 1,
			life = '~g~Oui',
		})


		xPlayer.triggerEvent('esx:createMissingPickups', ESX.Pickups)
		xPlayer.triggerEvent('chat:addSuggestions', ESX.CommandsSuggestions)
		TriggerClientEvent('esx:PlayerDataUniqueId', source, xPlayer.UniqueID)
	end)
end

function RegisterUser(source, identifier)
	ESX.DB.DoesUserExist(identifier, function(exists)
		if exists then
			LoadUser(source, identifier)
		else
			ESX.DB.CreateUser(identifier, function()
				LoadUser(source, identifier)
			end)
		end
	end)
end

AddEventHandler('playerDropped', function(reason)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer then
		TriggerEvent('esx:playerDropped', _source, xPlayer, reason)

		ESX.SavePlayer(xPlayer, function()
			ESX.Players[_source] = nil
		end)
	end
end)

RegisterServerEvent('esx:firstJoinProper')
AddEventHandler('esx:firstJoinProper', function()
	local _source = source
	--TriggerEvent("ratelimit", source, "esx:firstJoinProper")

	Citizen.CreateThread(function()
		local identifier = ESX.GetIdentifierFromId(_source)

		if identifier then
			if ESX.GetPlayerFromIdentifier(identifier) then
				DropPlayer(_source, "Impossible de vous identifier, une personne joue déjà avec votre compte Rockstar sur le Serveur.")
				-- RegisterUser(_source, identifier)
			else
				RegisterUser(_source, identifier)
			end
		else
			DropPlayer(_source, "Impossible de vous identifier, merci de réouvrir FiveM.")
		end
	end)
end)

RegisterServerEvent('esx:giveInventoryItem')
AddEventHandler('esx:giveInventoryItem', function(target, type, itemName, itemCount)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetPlayer = ESX.GetPlayerFromId(target)

	--TriggerEvent("ratelimit", source, "esx:giveInventoryItem")

	if type == 'item_standard' then
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)

		if itemCount > 0 and sourceItem.count >= itemCount then
			if targetPlayer.canCarryItem(itemName, itemCount) then
				sourceXPlayer.removeInventoryItem(itemName, itemCount)
				targetPlayer.addInventoryItem(itemName, itemCount)

				sourceXPlayer.showAdvancedNotification("Informations", "~y~Inventaire", _U('gave_item', itemCount, ESX.Items[itemName].label, targetPlayer.name), 'icon', 7)
				targetPlayer.showAdvancedNotification("Informations", "~y~Inventaire", _U('received_item', itemCount, ESX.Items[itemName].label, sourceXPlayer.name), 'icon', 7)

				TriggerEvent("esx:giveitemalert", sourceXPlayer.name, targetPlayer.name, itemName, itemCount)
			else
				sourceXPlayer.showAdvancedNotification("Informations", "~y~Inventaire", _U('ex_inv_lim', targetPlayer.name), 'icon', 7)
			end
		else
			sourceXPlayer.showAdvancedNotification("Informations", "~y~Inventaire", _U('imp_invalid_quantity'), 'icon', 7)
		end
	elseif type == 'item_account' then
		if itemCount > 0 and sourcexPlayer.getAccount(itemName).money >= itemCount then
			local accountLabel = ESX.GetAccountLabel(itemName)

			sourcexPlayer.removeAccountMoney(itemName, itemCount)
			targetPlayer.addAccountMoney(itemName, itemCount)

			sourceXPlayer.showAdvancedNotification("Informations", "~y~Portefeuille", _U('gave_account_money', ESX.Math.GroupDigits(itemCount), accountLabel, targetPlayer.name), 'icon', 9)
			targetPlayer.showAdvancedNotification("Informations", "~y~Portefeuille", _U('received_account_money', ESX.Math.GroupDigits(itemCount), accountLabel, sourceXPlayer.name), 'icon', 9)

			TriggerEvent("esx:giveaccountalert", sourceXPlayer.name, targetPlayer.name, itemName, itemCount)
		else
			sourceXPlayer.showAdvancedNotification("Informations", "~y~Portefeuille", _U('imp_invalid_amount'), 'icon', 9)
		end
	elseif type == 'item_weapon' then
		itemName = string.upper(itemName)

		if sourceXPlayer.hasWeapon(itemName) then
			local weaponLabel = ESX.GetWeaponLabel(itemName)

			if not targetPlayer.hasWeapon(itemName) then
				local weaponNum, weapon = sourceXPlayer.getWeapon(itemName)
				itemCount = weapon.ammo

				sourceXPlayer.removeWeapon(itemName)
				targetPlayer.addWeapon(itemName, itemCount)

				if itemCount > 0 then
					sourceXPlayer.showAdvancedNotification("Informations", "~y~Armes", _U('gave_weapon_withammo', weaponLabel, itemCount, targetPlayer.name), 'icon', 7)
					targetPlayer.showAdvancedNotification("Informations", "~y~Armes", _U('received_weapon_withammo', weaponLabel, itemCount, sourceXPlayer.name), 'icon', 7)
				else
					sourceXPlayer.showAdvancedNotification("Informations", "~y~Armes", _U('gave_weapon', weaponLabel, targetPlayer.name), 'icon', 7)
					targetPlayer.showAdvancedNotification("Informations", "~y~Armes", _U('received_weapon', weaponLabel, sourceXPlayer.name), 'icon', 7)

					TriggerEvent("esx:giveweaponalert", sourceXPlayer.name, targetPlayer.name, itemName)
				end
			else
				sourceXPlayer.showAdvancedNotification("Informations", "~y~Armes", _U('gave_weapon_hasalready', targetPlayer.name, weaponLabel), 'icon', 7)
				targetPlayer.showAdvancedNotification("Informations", "~y~Armes", _U('received_weapon_hasalready', sourceXPlayer.name, weaponLabel), 'icon', 7)
			end
		end
	elseif type == 'item_ammo' then
		itemName = string.upper(itemName)

		if sourceXPlayer.hasWeapon(itemName) then
			local weaponNum, weapon = sourceXPlayer.getWeapon(itemName)

			if targetPlayer.hasWeapon(itemName) then
				if weapon.ammo >= itemCount then
					sourceXPlayer.removeWeaponAmmo(itemName, itemCount)
					targetPlayer.addWeaponAmmo(itemName, itemCount)

					sourcexPlayer.showNotification(_U('gave_weapon_ammo', itemCount, weapon.label, targetPlayer.name))
					targetPlayer.showNotification(_U('received_weapon_ammo', itemCount, weapon.label, sourceXPlayer.name))
				end
			else
				sourcexPlayer.showNotification(_U('gave_weapon_noweapon', targetPlayer.name))
				targetPlayer.showNotification(_U('received_weapon_noweapon', sourceXPlayer.name, weapon.label))
			end
		end
	end
end)

RegisterServerEvent('esx:dropInventoryItem')
AddEventHandler('esx:dropInventoryItem', function(type, itemName, itemCount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	--TriggerEvent("ratelimit", source, "esx:dropInventoryItem")

	if type == 'item_standard' then
		if itemCount == nil or itemCount < 1 then
			xPlayer.showAdvancedNotification("Informations", "~y~Inventaire", _U('imp_invalid_quantity'), 'icon', 7)
		else
			local xItem = xPlayer.getInventoryItem(itemName)

			if (itemCount > xItem.count or xItem.count < 1) then
				xPlayer.showAdvancedNotification("Informations", "~y~Inventaire", _U('imp_invalid_quantity'), 'icon', 7)
			else
				xPlayer.removeInventoryItem(itemName, itemCount)

				local pickupLabel = ('~y~%s~s~ [~b~%s~s~]'):format(ESX.Items[itemName].label, itemCount)
				ESX.CreatePickup('item_standard', itemName, itemCount, pickupLabel, _source)
				xPlayer.showAdvancedNotification("Informations", "~y~Inventaire", _U('threw_standard', itemCount, ESX.Items[itemName].label), 'icon', 7)
			end
		end
	elseif type == 'item_account' then
		if itemCount == nil or itemCount < 1 then
			xPlayer.showAdvancedNotification("Informations", "~y~Portefeuille", _U('imp_invalid_amount'), 'icon', 9)
		else
			local account = xPlayer.getAccount(itemName)
			local accountLabel = ESX.GetAccountLabel(itemName)

			if (itemCount > account.money or account.money < 1) then
				xPlayer.showAdvancedNotification("Informations", "~y~Portefeuille", _U('imp_invalid_amount'), 'icon', 9)
			else
				xPlayer.removeAccountMoney(itemName, itemCount)

				local pickupLabel = ('~y~%s~s~ [~g~%s~s~]'):format(accountLabel, _U('locale_currency', ESX.Math.GroupDigits(itemCount)))
				ESX.CreatePickup('item_account', itemName, itemCount, pickupLabel, _source)
				xPlayer.showAdvancedNotification("Informations", "~y~Portefeuille", _U('threw_account', ESX.Math.GroupDigits(itemCount), string.lower(accountLabel)), 'icon', 9)
			end
		end
	elseif type == 'item_weapon' then
		itemName = string.upper(itemName)

		if xPlayer.hasWeapon(itemName) then
			local weaponNum, weapon = xPlayer.getWeapon(itemName)
			xPlayer.removeWeapon(itemName)

			local pickupLabel = ('~y~%s~s~ [~g~%s~s~]'):format(weapon.label, weapon.ammo)
			ESX.CreatePickup('item_weapon', itemName, weapon.ammo, pickupLabel, _source, weapon.components)

			if weapon.ammo > 0 then
				xPlayer.showAdvancedNotification("Informations", "~y~Armes", _U('threw_weapon_ammo', weapon.label, weapon.ammo), 'icon', 7)
			else
				xPlayer.showAdvancedNotification("Informations", "~y~Armes", _U('threw_weapon', weapon.label), 'icon', 7)
			end
		end
	end
end)

RegisterServerEvent('esx:useItem')
AddEventHandler('esx:useItem', function(itemName)
	local xPlayer = ESX.GetPlayerFromId(source)
	local count   = xPlayer.getInventoryItem(itemName).count

	if count > 0 then
		ESX.UseItem(source, itemName)
	-- else
	-- 	TriggerClientEvent("pNotify:SendNotification", source, {
	-- 		text = '<strong class="red-text">การกระทำเป็นไปไม่ได้</strong>',
	-- 		type = "error",
	-- 		timeout = 3000,
	-- 		layout = "bottomCenter",
	-- 		queue = "global"
	-- 	})
	end
end)

-- RegisterServerEvent('esx:useItem')
-- AddEventHandler('esx:useItem', function(itemName, itemData)
-- 	local xPlayer = ESX.GetPlayerFromId(source)
-- 	local xItem = xPlayer.getInventoryItem(itemName)
-- 	local xItem2 = xPlayer.getWeapon(itemName)

-- 	--TriggerEvent("ratelimit", source, "esx:useItem")

-- 	if not itemData.type then itemData.type = 'item_standard' end

-- 	if itemData.type ~= 'item_clothes' then
-- 		if xItem then
-- 			if xItem.count > 0 then
-- 				ESX.UseItem(xPlayer.source, itemName)
-- 			else
-- 				xPlayer.showAdvancedNotification("Informations", "~y~Inventaire", _U('act_imp'), 'icon', 7)
-- 			end	
-- 		end
	
-- 		if xItem2 then
-- 			TriggerClientEvent('kayscore:framework:sortWeapon', source, itemName)
-- 		end
-- 	else
-- 		TriggerClientEvent("esx:changeclothes", source, itemData.id, itemData.id2, itemData.color)

	

-- 		TriggerClientEvent('esx:showNotification', source, 'Vous avez équipez un vêtement')
-- 	end
-- end)

--[[RegisterServerEvent('esx:onPickup')
AddEventHandler('esx:onPickup', function(id)
	local xPlayer = ESX.GetPlayerFromId(source)
	local pickup = ESX.Pickups[id]
	local success

	--TriggerEvent("ratelimit", source, "esx:onPickup")

	if pickup then
		if pickup.type == 'item_standard' then
			if xPlayer.canCarryItem(pickup.name, pickup.count) then
				success = true
				xPlayer.addInventoryItem(pickup.name, pickup.count)
			else
				xPlayer.showNotification(_U('threw_cannot_pickup'))
			end
		elseif pickup.type == 'item_account' then
			success = true
			xPlayer.addAccountMoney(pickup.name, pickup.count)
		elseif pickup.type == 'item_weapon' then
			if xPlayer.hasWeapon(pickup.name) then
				xPlayer.showNotification(_U('threw_weapon_already'))
			else
				success = true
				xPlayer.addWeapon(pickup.name, pickup.count)

				for i = 1, #pickup.components, 1 do
					xPlayer.addWeaponComponent(pickup.name, pickup.components[i])
				end
			end
		end

		if success then
			ESX.Pickups[id] = nil
			TriggerClientEvent('esx:removePickup', -1, id)
		end
	end
end)]]

RegisterServerEvent('esx:positionSaveReady')
AddEventHandler('esx:positionSaveReady', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	--TriggerEvent("ratelimit", source, "esx:positionSaveReady")
	xPlayer.positionSaveReady = true
end)

ESX.RegisterServerCallback('esx:getPlayerData', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	cb({
		identifier = xPlayer.identifier,
		accounts = xPlayer.getAccounts(),
		inventory = xPlayer.getInventory(),
		job = xPlayer.getJob(),
		job2 = xPlayer.getJob2(),
		loadout = xPlayer.getLoadout(),
		lastPosition = xPlayer.getLastPosition()
	})
end)

ESX.RegisterServerCallback('esx:getOtherPlayerData', function(source, cb, target)
	local xPlayer = ESX.GetPlayerFromId(target)

	cb({
		identifier = xPlayer.identifier,
		accounts = xPlayer.getAccounts(),
		inventory = xPlayer.getInventory(),
		job = xPlayer.getJob(),
		job2 = xPlayer.getJob2(),
		loadout = xPlayer.getLoadout(),
		lastPosition = xPlayer.getLastPosition()
	})
end)

ESX.RegisterServerCallback('esx:getActivePlayers', function(source, cb)
	local players = {}

	for k, v in pairs(ESX.Players) do
		table.insert(players, {id = k, name = GetPlayerName(k)})
	end

	cb(players)
end)

ESX.StartDBSync()
ESX.StartPositionSync()

SetRoutingBucketPopulationEnabled(0, false)

RegisterNetEvent('kayscore:framework:savePlayers', function(source)
	ESX.SavePlayers()
end)

RegisterNetEvent('kayscore:restartFrr', function()
	local source = source
	--TriggerEvent("ratelimit", source, "esx:firstJoinProper")

	Citizen.CreateThread(function()
		local identifier = ESX.GetIdentifierFromId(_source)

		if identifier then
			if ESX.GetPlayerFromIdentifier(identifier) then
				DropPlayer(_source, "Impossible de vous identifier, une personne joue déjà avec votre compte Rockstar sur le Serveur.")
				-- RegisterUser(_source, identifier)
			else
				RegisterUser(_source, identifier)
			end
		else
			DropPlayer(_source, "Impossible de vous identifier, merci de réouvrir FiveM.")
		end
	end)
end)


-------------------------------------- AMMo-------------

for item, v in pairs(Config.AmmoPacks) do
    ESX.RegisterUsableItem(item, function(playerId)
        local src = playerId
        local xPlayer = ESX.GetPlayerFromId(src)

        xPlayer.triggerEvent('msk_weaponammoitem:checkAmmo', item, v)
    end)
end

RegisterNetEvent('msk_weaponammoitem:addWeaponAmmo')
AddEventHandler('msk_weaponammoitem:addWeaponAmmo', function(weaponName, item, data)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local hasItem = xPlayer.getInventoryItem(item)
    if not hasItem or hasItem.count == 0 then return end

	if Config.ArmesPerms[weaponName] then return end
    xPlayer.removeInventoryItem(item, 1)
    xPlayer.addInventoryItem(data.item, data.amount)

    local hasAmmo = xPlayer.getInventoryItem(data.item)
    local ammoToAdd = data.amount
    if hasAmmo and hasAmmo.count > 0 then ammoToAdd = ammoToAdd + hasAmmo.count end

    xPlayer.updateWeaponAmmo(weaponName, ammoToAdd)
    SetPedAmmo(GetPlayerPed(xPlayer.source), joaat(weaponName), ammoToAdd)
end)

RegisterNetEvent('msk_weaponammoitem:updateWeaponAmmo')
AddEventHandler('msk_weaponammoitem:updateWeaponAmmo', function(item, weaponName, isShooting)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local hasItem = xPlayer.getInventoryItem(item)
	
	if Config.ArmesPerms[weaponName] then return end
	if xPlayer then
		if hasItem and hasItem.count > 0 then
			if isShooting then
				xPlayer.removeInventoryItem(item, 1)
			end
			
			xPlayer.updateWeaponAmmo(weaponName, hasItem.count)
            SetPedAmmo(GetPlayerPed(xPlayer.source), joaat(weaponName), hasItem.count)
		else
			xPlayer.updateWeaponAmmo(weaponName, 0)
            SetPedAmmo(GetPlayerPed(xPlayer.source), joaat(weaponName), 0)
		end
	end
end)
