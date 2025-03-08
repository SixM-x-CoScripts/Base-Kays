-- function GetCurrentWeight()
-- 	local currentWeight = 0
-- 	for i = 1, #ESX.PlayerData.inventory, 1 do
-- 		if ESX.PlayerData.inventory[i].count > 0 then
-- 			currentWeight = currentWeight + (ESX.PlayerData.inventory[i].weight * ESX.PlayerData.inventory[i].count)
-- 		end
-- 	end
-- 	return currentWeight
-- end

-- function currentWeight()
-- 	return GetCurrentWeight()
-- end



-- function garbageOpenMenu()
--     FreezeEntityPosition(PlayerPedId(), true)
--     bloquertouchejojo = true
--     ESX.ShowNotification('[~r~INFO~w~] Pour cesser de fouiller dans la poubelle, veuillez retirer vos mains de celle-ci !')
--     local menu = RageUI.CreateMenu('Poubelle', "Actions disponibles")
--     RageUI.Visible(menu, true)
    
--     local menuOpened = true -- Ajout d'une variable pour suivre l'état du menu

--     while true do
--         Citizen.Wait(0)

--         RageUI.IsVisible(menu, function()

--             ESX.PlayerData = ESX.GetPlayerData()

--             RageUI.Separator(("%s / %s"):format(currentWeight(), ESX.PlayerData.maxWeight))
--             RageUI.Separator("Objet(s)")

--             for _, v in pairs(ESX.PlayerData.inventory) do
--                 -- Vérifie si l'objet est contribuable
--                 -- if not ESX.ItemPerm(v.name) then return end
                
--                 if v.count > 0 then
--                     RageUI.Button(("%s (%s)"):format(v.label, v.count),
--                         "Si vous mettez un objet dans une poubelle, il disparaîtra définitivement",
--                         { RightBadge = RageUI.BadgeStyle.Alert },
--                         true,
--                         {
--                             onSelected = function ()
--                                 KeyboardUtils.use('Appuyez sur Y pour valider', function(data)
--                                     if data == 'y' or data == 'Y' then
--                                         TriggerServerEvent("ESXFramework:garbage:deleteItem", v.name, v.metadata, 1)
--                                         ExecuteCommand("me jette quelque chose dans une poubelle")
--                                         RageUI.CloseAll()
--                                         Citizen.Wait(500)
--                                         garbageOpenMenu()
--                                     else
--                                         ESX.ShowNotification('Vous n\'avez rien jeté!')
--                                     end
--                                 end)
--                             end
--                         }
--                     )
--                 end
--             end
            

--             RageUI.Separator("Arme(s)")

--             for i = 1, #ESX.PlayerData.loadout, 1 do
--                 --if not ESX.ArmesPerms(weapon.name) then return end
--                 local weapon = ESX.PlayerData.loadout[i]

--                 RageUI.Button(("%s"):format(weapon.label),
--                     "Si vous mettez un objet dans une poubelle il disparaitra définitivement",
--                     { RightBadge = RageUI.BadgeStyle.Alert }, true,
--                     {
--                         onSelected = function ()
--                             TriggerServerEvent("ESXFramework:garbage:deleteWeapon", i)
--                             ExecuteCommand("me jete quelque chose dans une poubelle")
--                             RageUI.CloseAll() -- Fermer le menu après la suppression
--                             Citizen.Wait(500) -- Attendre un court instant
--                             garbageOpenMenu() -- Réouvrir le menu
--                         end
--                     }
--                 )
--             end

--         end)

--         if not RageUI.Visible(menu) then
--             if menuOpened then -- Vérifie si le menu est fermé
--                 FreezeEntityPosition(PlayerPedId(), false) -- Unfreeze le personnage
--                 bloquertouchejojo = false
--                 menuOpened = false -- Marque le menu comme fermé
--             end
--             break
--         end
--     end
-- end



-- --AddEventHandler("esx:garbage:open", garbageOpenMenu)