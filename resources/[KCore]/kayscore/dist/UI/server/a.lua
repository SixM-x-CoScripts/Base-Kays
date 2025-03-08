-- -- Liste des articles autorisés
-- local authorizedItems = {
--     {name = 'Eau', item = 'water', price = 50, type = "item"},
--     {name = 'Pain', item = 'bread', price = 50, type = "item"},
--     {name = 'Téléphone', item = 'phone', price = 500, type = "item"},
--     {name = 'Poing américain', item = 'WEAPON_KNUCKLE', price = 5000, type = "weapon"},
--     {name = 'Batte', item = 'WEAPON_BAT', price = 7000, type = "weapon"},
--     {name = 'Couteau', item = 'WEAPON_KNIFE', price = 5000, type = "weapon"},
--     {name = 'Pétoire', item = 'weapon_snspistol', price = 130000, type = "weapon"},
--     {name = 'Kevlar lourd', item = 'kevlar', price = 3500, type = 'item'},
--     {name = 'Munition 9mm', item = '9mm', price = 50, type = 'item'},
--     {name = 'Munition 12mm', item = '12gauge', price = 75, type = 'item'},
--     {name = 'Munition 5.56mm', item = '556mm', price = 110, type = 'item'},
--     {name = 'Munition 7.62mm', item = '762mm', price = 150, type = 'item'},
--     {name = 'Munition Kal.68', item = '68kal', price = 190, type = 'item'},
--     {name = 'Jumelles', item = 'jumelles', price = 200, type = "item"},
--     {name = 'Pillule d\'oublie', item = 'oblivionPill', price = 350, type = "item"},
--     {name = 'Fil de fer', item = 'wire', price = 250, type = "item"},
--     {name = 'Poste à souder', item = 'soudeuse', price = 2400, type = "item"},
--     {name = 'Ciseaux', item = 'ciseaux', price = 250, type = "item"},
--     {name = 'Nitro', item = 'nitrovehicle', price = 1300, type = "item"},
-- }

-- -- Fonction pour vérifier si un article est autorisé
-- local function isAuthorized(item, type)
--     for _, v in pairs(authorizedItems) do
--         if v.item == item and v.type == type then
--             return true
--         end
--     end
--     return false
-- end

-- secured_RegisterNetEvent('shop:checkoutShop', function(item, quantity, total, typo, label)
--     local source = source
--     local xPlayer = ESX.GetPlayerFromId(source)

--     if not xPlayer then
--         return
--     end

--         local totalPrice = total
--     -- Vérifie si l'article est autorisé
--     if not isAuthorized(item, typo) then
--         TriggerClientEvent('esx:showNotification', source, '~r~Erreur~s~: Cet article n\'est pas disponible')
--         return
--     end

--     -- Assurez-vous que l'article et le type correspondent
--     if typo == 'item' then
--         if item == 'kevlar' and xPlayer.getInventoryItem(item).count >= 1 then 
--             TriggerClientEvent('esx:showNotification', source, 'Vous ne pouvez pas acheter deux kevlar')
--             return
--         end
        
--         if not xPlayer.canCarryItem(item, quantity) then
--             TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez de place dans votre inventaire")
--             return
--         end

--         xPlayer.addInventoryItem(item, quantity)
--         xPlayer.removeAccountMoney('cash', totalPrice)
--         TriggerClientEvent('esx:showNotification', source, ('Vous avez acheté pour ~g~%s$~s~ d\'article(s)'):format(totalPrice))

--     elseif typo == 'weapon' then
--         if xPlayer.hasWeapon(item) then
--             TriggerClientEvent('esx:showNotification', source, 'Vous avez déjà cette arme')
--             return
--         end

--         xPlayer.addWeapon(item, quantity)
--         xPlayer.removeAccountMoney('cash', totalPrice)
--         TriggerClientEvent('esx:showNotification', source, ('Vous avez acheté pour ~g~%s$~s~ d\'article(s)'):format(totalPrice))

--     elseif typo == 'props' then
--         for i = 1, quantity do
--             MySQL.Async.execute('INSERT INTO players_props (UniqueID, data, name) VALUES (@UniqueID, @data, @name)', {
--                 ['@UniqueID'] = xPlayer.getIdentifier(),
--                 ['@data'] = json.encode({label = label, name = item, owner = xPlayer.getIdentifier(), count = 1}),
--                 ['@name'] = item
--             })
--         end
--         xPlayer.removeAccountMoney('cash', totalPrice)
--         TriggerClientEvent('esx:showNotification', source, ('Vous avez acheté pour ~g~%s$~s~ d\'article(s)'):format(totalPrice))
--     else
--         TriggerClientEvent('esx:showNotification', source, '~r~Erreur~s~: Type d\'article invalide')
--         return
--     end
-- end)
