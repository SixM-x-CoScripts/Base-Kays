-- local craftingMenu = RageUI.CreateMenu('Craft d\'armes', 'Sélectionnez une arme à crafter')

-- local weaponCategories = {
--     gangs = 'Gangs',
--     mc = 'Motorcycle Clubs',
--     orga = 'Organisations',
--     mafia = 'Mafia',
--     cartel = 'Cartel'
-- }

-- local selectedCategory = nil

-- function IsPlayerInCategory(category, callback)
--     TriggerServerEvent('kayscore:weapons:checkPlayerCategory', category, function(playerInCat)
--         callback(playerInCat)
--     end)
-- end


-- function openCraftingMenu()
--     selectedCategory = nil
--     RageUI.Visible(craftingMenu, not RageUI.Visible(craftingMenu))
--     while craftingMenu do
--         Citizen.Wait(0)
--         RageUI.IsVisible(craftingMenu, function()
--             for cat, label in pairs(weaponCategories) do
--                 IsPlayerInCategory(cat, function(playerInCat)
--                     if playerInCat then
--                         RageUI.Button(label, nil, {}, true, {
--                             onSelected = function()
--                                 selectedCategory = cat
--                             end
--                         })
--                     end
--                 end)
--             end

--             if selectedCategory then
--                 for weaponName, weaponData in pairs(Config.Weapons[selectedCategory]) do
--                     RageUI.Button(weaponData.label, nil, {}, true, {
--                         onSelected = function()
--                             -- Vérifier si le joueur possède les items nécessaires
--                             TriggerServerEvent('kayscore:weapons:checkItems', weaponData.item1, weaponData.item2, function(hasItems)
--                                 if hasItems then
--                                     -- Craft de l'arme
--                                     TriggerServerEvent('kayscore:weapons:craftWeapon', weaponName, weaponData.item1, weaponData.item2)
--                                 else
--                                     ESX.ShowNotification('Vous n\'avez pas assez d\'objets pour crafter cette arme.')
--                                 end
--                             end)
--                         end
--                     })
--                 end
--             end
--         end)

--         if not RageUI.Visible(craftingMenu) then
--             break
--         end
--     end
-- end


-- RegisterCommand('craftarmes', function()
--     openCraftingMenu()  -- Appel de la fonction pour ouvrir le menu de craft d'armes
-- end, false)

