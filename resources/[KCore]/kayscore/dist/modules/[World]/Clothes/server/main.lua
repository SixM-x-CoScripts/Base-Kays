-- CreateThread(function()
--     MySQL.Async.execute([[
--         CREATE TABLE IF NOT EXISTS `player_clothes` (
--             `UniqueID` INT(11) PRIMARY KEY,
--             clothes LONGTEXT DEFAULT NULL
--         )
--     ]])

--     MySQL.Async.execute([[
--         CREATE TABLE IF NOT EXISTS `player_inventory_clothes` (
--             `UniqueID` INT(11) PRIMARY KEY,
--             clothes LONGTEXT DEFAULT NULL
--         )
--     ]])

--     local clothes = {}
--     local clothesInventory = {}


--     MySQL.Async.fetchAll('SELECT * FROM `player_clothes`', {}, function(result)

--         if json.encode(result) ~= '[]' then
--             for k,v in pairs(result) do
--                 clothes[v.UniqueID] = json.decode(v.clothes)
--                 --print("Clothes loaded")
--             end
--         end
--     end)

--     MySQL.Async.fetchAll('SELECT * FROM `player_inventory_clothes`', {}, function(result)
--         if json.encode(result) ~= '[]' then
--             for k,v in pairs(result) do
--                 clothesInventory[v.UniqueID] = json.decode(v.clothes)
--             end
--         end
--     end)

--     RegisterNetEvent('refreshPlayerClothes', function()
--         MySQL.Async.fetchAll('SELECT * FROM `player_inventory_clothes`', {}, function(result)
--             if json.encode(result) ~= '[]' then
--                 for k,v in pairs(result) do
--                     clothesInventory[v.UniqueID] = json.decode(v.clothes)
--                 end
--             end
--         end)
--     end)

--     ESX.RegisterServerCallback('kayscore:clotheshop:getMyClothes', function(source, cb)
--         local xPlayer = ESX.GetPlayerFromId(source)

--         if not xPlayer then return end

--         if not clothes[xPlayer.UniqueID] then
--             clothes[xPlayer.UniqueID] = {}
--         end

--         cb(clothes[xPlayer.UniqueID])
--     end)

--     ESX.RegisterServerCallback('kayscore:inventory:getMyClothes', function(source, cb)
--         local xPlayer = ESX.GetPlayerFromId(source)

--         if not xPlayer then return end

--         if not clothesInventory[xPlayer.UniqueID] then
--             clothesInventory[xPlayer.UniqueID] = {}
--         end

--         cb(clothesInventory[xPlayer.UniqueID])
--     end)
--     ESX.RegisterServerCallback('kayscore:inventory:getMyClothesByName', function(source, cb, name)
--         local xPlayer = ESX.GetPlayerFromId(source)
--         print(name)
--         if not xPlayer then return end

--         if not clothesInventory[xPlayer.UniqueID] then
--             clothesInventory[xPlayer.UniqueID] = {}
--             cb(clothesInventory[xPlayer.UniqueID])
--             return
--         end

        
--         for k,v in pairs(clothesInventory[xPlayer.UniqueID]) do
--             if v.label == name then
--                 print(v.label, v.name, v.number, v.number2)
--                 local clothetoEquip = {}
--                 table.insert(clothetoEquip, {
--                     name = v.name,
--                     number = v.number,
--                     number2 = v.number2
--                 })
--                 cb(clothetoEquip)
--             end
--         end
--     end)


--     ESX.RegisterServerCallback('kayscore:clotheshop:haveMoney', function(source, cb)
--         local xPlayer = ESX.GetPlayerFromId(source)

--         if xPlayer.getAccount('bank').money < 10 then
--             cb(false)
--             TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas l'argent nécessaire en banque !")
--         else
--             xPlayer.removeAccountMoney('bank', 10)
--             cb(true)
--         end
--     end)

--     ESX.RegisterServerCallback('kayscore:clotheshop:haveMoneySave', function(source, cb)
--         local xPlayer = ESX.GetPlayerFromId(source)

--         if xPlayer.getAccount('bank').money < 15 then
--             cb(false)
--             TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas l'argent nécessaire en banque !")
--         else
--             xPlayer.removeAccountMoney('bank', 15)
--             cb(true)
--         end
--     end)

--     RegisterNetEvent('kayscore:clotheshop:saveTenue', function(data, t)
--         local source = source
--         local xPlayer = ESX.GetPlayerFromId(source)

--         if not xPlayer then return end

--         MySQL.Async.fetchAll('SELECT * FROM player_clothes WHERE UniqueID = @UniqueID', {
--             ['@UniqueID'] = xPlayer.UniqueID
--         }, function(result)
--             if json.encode(result) == '[]' then
--                 clothes[xPlayer.UniqueID] = {}

--                 table.insert(clothes[xPlayer.UniqueID], {
--                     label = t,
--                     data = data,
--                 })

--                 MySQL.Async.execute('INSERT INTO player_clothes (UniqueID, clothes) VALUES (?,?)', {
--                     xPlayer.UniqueID,
--                     json.encode(clothes[xPlayer.UniqueID])
--                 })
--             else

--                 table.insert(clothes[xPlayer.UniqueID], {
--                     label = t,
--                     data = data,
--                 })

--                 MySQL.Async.execute('UPDATE player_clothes SET clothes = @clothes WHERE UniqueID = @UniqueID', {
--                     ['@UniqueID'] = xPlayer.UniqueID,
--                     ['@clothes'] = json.encode(clothes[xPlayer.UniqueID])
--                 })
--             end
--         end)
--     end)

--     RegisterNetEvent('kayscore:clotheshop:renameClothe', function(name, newName)
--         local source = source
--         local xPlayer = ESX.GetPlayerFromId(source)

--         if not xPlayer then return end

--         for k,v in pairs(clothes[xPlayer.UniqueID]) do
--             if v.label == name then
--                 clothes[xPlayer.UniqueID][k].label = newName
--             end
--         end

--         MySQL.Async.execute('UPDATE player_clothes SET clothes = @clothes WHERE UniqueID = @UniqueID', {
--             ['@UniqueID'] = xPlayer.UniqueID,
--             ['@clothes'] = json.encode(clothes[xPlayer.UniqueID])
--         })
--     end)

--     RegisterNetEvent('kayscore:clotheshop:deleteClothe', function(name, newName)
--         local source = source
--         local xPlayer = ESX.GetPlayerFromId(source)

--         if not xPlayer then return end

--         for k,v in pairs(clothes[xPlayer.UniqueID]) do
--             if v.label == name then
--                 table.remove(clothes[xPlayer.UniqueID], k)
--             end
--         end

--         MySQL.Async.execute('UPDATE player_clothes SET clothes = @clothes WHERE UniqueID = @UniqueID', {
--             ['@UniqueID'] = xPlayer.UniqueID,
--             ['@clothes'] = json.encode(clothes[xPlayer.UniqueID])
--         })
--     end)

--     local equipClothes = {}

--     local elementsInseres = {}

--     local clothesNumber2 = {}
--     local clothesNumber = {}

--     RegisterNetEvent('kayscore:clothesShop:sendClothes', function(name)
--         local source = source
--         local xPlayer = ESX.GetPlayerFromId(source)

--         if not xPlayer then return end

        
--         elementsInseres[xPlayer.UniqueID] = {}
       
--         clothesNumber2[xPlayer.UniqueID] = {}
--         clothesNumber[xPlayer.UniqueID] = {}
        
--         if not clothesInventory[xPlayer.UniqueID] then
--             clothesInventory[xPlayer.UniqueID] = {}
--         end

--         equipClothes[xPlayer.UniqueID] = clothesInventory[xPlayer.UniqueID]

--         MySQL.Async.fetchAll('SELECT * FROM player_inventory_clothes WHERE UniqueID = @UniqueID', {
--             ['@UniqueID'] = xPlayer.UniqueID
--         }, function(result)
--             if json.encode(result) ~= '[]' then
--                 equipClothes[xPlayer.UniqueID] = json.decode(result[1].clothes)
--             end
--          --   print(json.encode(clothes[xPlayer.UniqueID]))

            

--             for k,v in pairs(clothes[xPlayer.UniqueID]) do
--                 if v.label == name then
--                     for i,p in pairs(v.data) do
--                       --  print("DATA ITEM "..p.name, p.number)
--                         local dejaInsere = false
--                         for _, item in ipairs(elementsInseres[xPlayer.UniqueID]) do
--                             if item.name == p.name and item.number == p.number then
--                                 dejaInsere = true
--                                 break
--                             end
--                         end
                        
--                         if not dejaInsere then
--                             local debut, fin = string.find(p.name, '_2')

                            
                           



                        
                        
                         

--                             local nameNumber2 = nil

                    

--                             if not debut then


--                                 if string.find(p.name, '_2') then
--                                     --  print("add variation")
--                                       local nameNumber2 = string.gsub(p.name, '_2', '')
--                                       clothesNumber2[xPlayer.UniqueID][nameNumber2] = p.number 
--                                   end
      
--                                   if string.find(p.name, '_1') then
--                                       if not clothesNumber2[xPlayer.UniqueID][string.gsub(p.name, '_1', '')] then
--                                           --print("HAVE NOT VAR".. p.name, p.number)
--                                           for _, itm in ipairs(v.data) do
--                                               if itm.name == string.gsub(p.name, '_1', '_2')  then
--                                                  -- print("ADDED VARIATION with check >> > "..p.name, itm.number) 
--                                                   clothesNumber2[xPlayer.UniqueID][string.gsub(p.name, '_1', '')] = itm.number
--                                               end
--                                           end
--                                       end
--                                   end
                               
--                                 if clothesNumber2[xPlayer.UniqueID][string.gsub(p.name, '_1', '')] then
--                                    --print('VETEPENT '..p.name, clothesNumber2[xPlayer.UniqueID][string.gsub(p.name, '_1', '')])
--                                 end

    
                               
--                                 table.insert(equipClothes[xPlayer.UniqueID], {
--                                     label = name,
--                                     name = p.name,
--                                     number = p.number,
--                                     number2 = clothesNumber2[xPlayer.UniqueID][string.gsub(p.name, '_1', '')]
--                                 })
--                                 table.insert(elementsInseres[xPlayer.UniqueID], {
--                                     name = p.name,
--                                     number = p.number,
--                                     number2 = clothesNumber2[xPlayer.UniqueID][string.gsub(p.name, '_1', '')]
--                                 })
--                             end
--                         end
--                     end
--                 end
--             end

--             clothesInventory[xPlayer.UniqueID] = equipClothes[xPlayer.UniqueID]

--             if json.encode(result) == '[]' then
--                 MySQL.Async.execute('INSERT INTO player_inventory_clothes (UniqueID, clothes) VALUES (?,?)', {
--                     xPlayer.UniqueID,
--                     json.encode(equipClothes[xPlayer.UniqueID])
--                 })
--             else
--                 MySQL.Async.execute('UPDATE player_inventory_clothes SET clothes = @clothes WHERE UniqueID = @UniqueID', {
--                     ['@UniqueID'] = xPlayer.UniqueID,
--                     ['@clothes'] = json.encode(equipClothes[xPlayer.UniqueID])
--                 })
--             end
--         end)
--     end)

--     RegisterNetEvent('kayscore:paidaccesoires', function(Name, name, accesories)
--         local source = source
--         local xPlayer = ESX.GetPlayerFromId(source)

--         if not xPlayer then return end

--         if equipClothes[xPlayer.UniqueID] then
--             equipClothes[xPlayer.UniqueID] = equipClothes[xPlayer.UniqueID] 
--         else
--             equipClothes[xPlayer.UniqueID] = {}
--         end

--         MySQL.Async.fetchAll('SELECT * FROM player_inventory_clothes WHERE UniqueID = @UniqueID', {
--             ['@UniqueID'] = xPlayer.UniqueID
--         }, function(result)
            
--             if json.encode(result) ~= '[]' then
--                 equipClothes[xPlayer.UniqueID] = json.decode(result[1].clothes)
--             end

--             table.insert(equipClothes[xPlayer.UniqueID], {
--                 label = name,
--                 name = Name,
--                 number = accesories[1],
--                 number2 = accesories[2],
--             })

--             if not clothesInventory[xPlayer.UniqueID] then 
--                 clothesInventory[xPlayer.UniqueID] = {}
--             end

--             clothesInventory[xPlayer.UniqueID] = equipClothes[xPlayer.UniqueID]

--             if json.encode(result) == '[]' then
--                 MySQL.Async.execute('INSERT INTO player_inventory_clothes (UniqueID, clothes) VALUES (?,?)', {
--                     xPlayer.UniqueID,
--                     json.encode(equipClothes[xPlayer.UniqueID])
--                 })
--             else
--                 MySQL.Async.execute('UPDATE player_inventory_clothes SET clothes = @clothes WHERE UniqueID = @UniqueID', {
--                     ['@UniqueID'] = xPlayer.UniqueID,
--                     ['@clothes'] = json.encode(equipClothes[xPlayer.UniqueID])
--                 })
--             end
--         end)
--     end)
-- end)