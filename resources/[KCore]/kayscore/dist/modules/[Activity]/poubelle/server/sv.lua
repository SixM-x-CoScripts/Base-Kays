-- RegisterServerEvent("ESXFramework:garbage:deleteItem")
-- AddEventHandler("ESXFramework:garbage:deleteItem", function(itemName, itemMetadata, quantity)
--     local _source = source

--     -- Vérifier si l'objet existe dans l'inventaire du joueur
--     local player = ESX.GetPlayerFromId(_source)
--     local item = player.getInventoryItem(itemName)

--     if item ~= nil and item.count >= quantity then
--         if not kayscoreConfigServ.PermanentItem[itemName] then
--         player.removeInventoryItem(itemName, 1)

--         -- Exemple de notification côté serveur pour indiquer que l'objet a été supprimé
--         print(("L'objet %s a été supprimé, quantité : %s"):format(itemName, 1))
--     else
--         -- Si l'objet n'existe pas ou si la quantité est insuffisante, envoyer une notification au joueur
--         TriggerClientEvent('esx:showNotification', _source, "Vous n'avez pas suffisamment de cet objet.")
--         end
--     end
-- end)

-- RegisterServerEvent("ESXFramework:garbage:deleteWeapon")
-- AddEventHandler("ESXFramework:garbage:deleteWeapon", function(weaponIndex)
--     local _source = source

--     -- Récupérer le joueur qui a déclenché l'événement
--     local player = ESX.GetPlayerFromId(_source)

--     -- Vérifier si l'index de l'arme est valide
--     if weaponIndex and player then
--         -- Récupérer les armes du joueur
--         local weapons = player.getLoadout()

--         -- Vérifier si l'arme existe à l'index donné
--         if weapons and weapons[weaponIndex] then
--             local weaponName = weapons[weaponIndex].name
--             if not kayscoreConfigServ.PermanantWeapon[weaponName] then

--             player.removeWeapon(weaponName)

--             -- Exemple de notification côté serveur pour indiquer que l'arme a été supprimée
--             print(("L'arme %s a été jetée dans une poubelle"):format(weaponName))
--         else
--             -- Si l'arme n'existe pas, envoyer une notification au joueur
--             TriggerClientEvent('esx:showNotification', _source, "Cette arme n'existe pas.")
--         end
--     else
--         -- Si l'index de l'arme ou le joueur est invalide, envoyer une notification au joueur
--         TriggerClientEvent('esx:showNotification', _source, "Une erreur est survenue.")
--         end
-- end
-- end)