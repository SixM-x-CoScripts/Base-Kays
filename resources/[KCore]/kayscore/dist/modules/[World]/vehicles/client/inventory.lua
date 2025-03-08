-- function loadDict(dict)
--     while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
-- end
-- local truckStatut = false
-- AddEventHandler("kayscore:truck:enter", function(netId)
--     local entity = NetworkGetEntityFromNetworkId(netId)

--     if not DoesEntityExist(entity) then return end

--     SetCarBootOpen(entity)
--     Wait(1500)
--     SetVehicleDoorShut(entity, 5)
--     AttachEntityToEntity(Player.playerPed, entity, -1, 0.0, -2.2, 0.5, 0.0, 0.0, 0.0, false, false, false, false, 20, true)	

--     loadDict('timetable@floyd@cryingonbed@base')
--     TaskPlayAnim(Player.playerPed, 'timetable@floyd@cryingonbed@base', 'base', 8.0, -8.0, -1, 1, 0, false, false, false)
--     Wait(1000)
--     SetEntityVisible(Player.playerPed, false)
--     truckStatut = true

--     while DoesEntityExist(entity) and truckStatut do
--         if getIsDead() or isRagdoll() or isHostage() or isPiggyBack() then
--             truckStatut = false
--             break
--         end

--         SetEntityCollision(Player.playerPed, false, false)

--         ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour sortir du ~p~coffre")

--         if IsControlJustPressed(1,51) then
--             TriggerEvent("kayscore:vehicle:exitTruck")
--         end

--         if not IsEntityPlayingAnim(Player.playerPed, 'timetable@floyd@cryingonbed@base', 3) then
--             TaskPlayAnim(Player.playerPed, 'timetable@floyd@cryingonbed@base', 'base', 8.0, -8.0, -1, 1, 0, false, false, false)
--         end

--         Wait(0)
--     end

--     SetEntityCollision(Player.playerPed, true, true)
--     DetachEntity(Player.playerPed, true, true)
--     ClearPedTasks(Player.playerPed)
--     SetEntityCoordsNoOffset(Player.playerPed, Player.coords)
--     SetEntityVisible(Player.playerPed, true)
-- end)

-- AddEventHandler("kayscore:vehicle:exitTruck", function()
--     truckStatut = false
-- end)

-- function isInTruck()
--     return truckStatut
-- end

-- Citizen.CreateThread(function ()
--     while GetResourceState("ox_target") ~= "started" do Citizen.Wait(0) end

--     exports.ox_target:addGlobalVehicle({
--         {
--             label = "Entré dans le coffre",
--             icon = "fa-solid fa-car-side",
--             distance = 5.0,
--             bones = 'boot',
--             canInteract = function(entity, distance, coords, name, boneId)
--                 if GetVehicleDoorLockStatus(entity) > 1 then return end
--                 if IsVehicleDoorDamaged(entity, 5) then return end
--                 return #(coords - GetEntityBonePosition_2(entity, boneId)) < 0.9
--             end,
--             onSelect = function(data)
--                 TriggerEvent("kayscore:truck:enter", NetworkGetNetworkIdFromEntity(data.entity))
--             end
--         }
--     })
-- end)



-- -- ------------------------------------------------------------------------
-- -- -- INVENTAIRE
-- -- ------------------------------------------------------------------------






-- -- vehicleInventory = {   
-- --     open = false, 
-- --     List = {'Prendre', 'Déposer'}, 
-- --     Index = 1, 
-- -- }
-- -- local isInCoffre = false

-- -- function openVehicleInventory(vehiclePlate, inventory)
-- --     if type(inventory) ~= 'table' then print('ERROR:') end

-- --     local main = RageUI.CreateMenu('', 'Actions Disponibles')

-- --     local inventoryItems = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
-- --     local inventoryWeapons = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

-- --     local playerInventory = RageUI.CreateSubMenu(inventoryItems, '', 'Actions Disponibles')
-- --     local playerLoadout = RageUI.CreateSubMenu(inventoryWeapons, '', 'Actions Disponibles')

-- --     isInCoffre = true
-- --     local openingPos = GetEntityCoords(PlayerPedId())
    
-- --     RageUI.Visible(main, not RageUI.Visible(main))
-- --     while main do
-- --         Citizen.Wait(1)

-- --         if #(GetEntityCoords(PlayerPedId()) - openingPos) > 5 then
-- --             RageUI.CloseAll()
-- --             isInCoffre = false
-- --         end

-- --         RageUI.IsVisible(main, function()
-- --             inventoryData = inventory

-- --             if inventoryData ~= nil then
-- --                 RageUI.Separator(vehiclePlate)
-- --                 RageUI.Separator(('Poids ~y~%s/%s KG~s~'):format(inventoryData.pound, inventoryData.vehiclePound))
                
-- --                 RageUI.List(('Argent propre ~g~%s$~s~'):format(inventoryData['accounts'].cash), vehicleInventory.List, vehicleInventory.Index, nil, {}, true, {
-- --                     onListChange = function(Index)
-- --                         vehicleInventory.Index = Index
-- --                     end,
-- --                     onSelected = function(Index)
-- --                         KeyboardUtils.use('Quantité', function(data)
-- --                             local data = tonumber(data)
-- --                             if data == nil or data <= 0 then return end

-- --                             if Index == 1 then
-- --                                 if inventoryData['accounts'].cash < data then return ESX.ShowNotification("Il n'y a pas assez d'argent dans le coffre pour retirer cette somme !") end
-- --                                 secured_TriggerServerEvent('L-VehiclesInventory:ActionsMoney', vehiclePlate, 'remove', 'cash', inventoryData['accounts'].cash, data)
-- --                             elseif Index == 2 then
-- --                                 secured_TriggerServerEvent('L-VehiclesInventory:ActionsMoney', vehiclePlate, 'deposit', 'cash', inventoryData['accounts'].cash, data)
-- --                             end
-- --                         end)
-- --                     end
-- --                 })
-- --                 RageUI.List(('Argent sale ~r~%s$~s~'):format(inventoryData['accounts'].black_money), vehicleInventory.List, vehicleInventory.Index, nil, {}, true, {
-- --                     onListChange = function(Index)
-- --                         vehicleInventory.Index = Index
-- --                     end,
-- --                     onSelected = function(Index)
-- --                         KeyboardUtils.use('Quantité', function(data)
-- --                             local data = tonumber(data)
-- --                             if data == nil or data <= 0 then return end

-- --                             if Index == 1 then
-- --                                 if inventoryData['accounts'].black_money < data then return ESX.ShowNotification("Il n'y a pas assez d'argent sale dans le coffre pour retirer cette somme !") end
-- --                                 secured_TriggerServerEvent('L-VehiclesInventory:ActionsMoney', vehiclePlate, 'remove', 'black_money', inventoryData['accounts'].black_money, data)
-- --                             elseif Index == 2 then
-- --                                 secured_TriggerServerEvent('L-VehiclesInventory:ActionsMoney', vehiclePlate, 'deposit', 'black_money', inventoryData['accounts'].black_money, data)
-- --                             end
-- --                         end)
-- --                     end
-- --                 })

-- --                 RageUI.WLine()

-- --                 RageUI.Button('Item(s)', nil, {}, true, {}, inventoryItems)
-- --                 RageUI.Button('Arme(s)', nil, {}, true, {}, inventoryWeapons)

-- --             end
-- --         end)

-- --         RageUI.IsVisible(inventoryItems, function()
-- --             inventoryData = inventory

-- --             RageUI.Button('Déposer un objet', nil, {}, true, {}, playerInventory)
-- --             RageUI.WLine()
            
-- --             for k, v in pairs(inventoryData['items']) do
-- --                 RageUI.Button(('%s [~y~x%s~s~]'):format(v.label, v.count), nil, {RightLabel = '>>'}, true, {
-- --                     onSelected = function()
-- --                         KeyboardUtils.use('Quantité', function(data)
-- --                             local data = tonumber(data)
-- --                             if data == nil or data <= 0 then return end

-- --                             if v.count < data then return ESX.ShowNotification("Il n'y en a pas assez dans le coffre.") end
-- --                             secured_TriggerServerEvent('L-VehiclesInventory:RemoveItem', vehiclePlate, v, data)
-- --                         end)
-- --                     end
-- --                 })
-- --             end
-- --         end)

-- --         RageUI.IsVisible(playerInventory, function()
-- --             pInventory = ESX.GetPlayerData().inventory

-- --             for k, v in pairs(pInventory) do
-- --                 RageUI.Button(('%s [~y~x%s~s~]'):format(v.label, v.count), nil, {RightLabel = '>>'}, true, {
-- --                     onSelected = function()
-- --                         KeyboardUtils.use('Quantité', function(data)
-- --                             local data = tonumber(data)
-- --                             if data == nil or data <= 0 then return end

-- --                             if v.count < data then return ESX.ShowNotification("Vous n'en possédez pas assez.") end
-- --                             secured_TriggerServerEvent('L-VehiclesInventory:DepositItem', vehiclePlate, v, data)
-- --                         end)
-- --                     end
-- --                 })
-- --             end
-- --         end)

-- --         RageUI.IsVisible(inventoryWeapons, function()
-- --             inventoryData = inventory

-- --             RageUI.Button('Déposer une arme', nil, {}, true, {}, playerLoadout)
-- --             RageUI.WLine()
            
-- --             for k, v in pairs(inventoryData['weapons']) do
-- --                 RageUI.Button(('%s [~r~%s~s~]'):format(v.label, v.ammo), nil, {RightLabel = '>>'}, true, {
-- --                     onSelected = function()
-- --                         if kayscoreConfigServ.PermanantWeapon(v.name) then return end

-- --                         KeyboardUtils.use('Tapez Y pour valider', function(data)
-- --                             if data == 'y' or data == 'Y' then
-- --                                 secured_TriggerServerEvent('L-VehiclesInventory:RemoveWeapon', vehiclePlate, v, k) 
-- --                             end
-- --                         end)
-- --                     end
-- --                 })
-- --             end
-- --         end)

-- --         RageUI.IsVisible(playerLoadout, function()
-- --             pLoadout = ESX.GetPlayerData().loadout

-- --             for k, v in pairs(pLoadout) do
-- --                 RageUI.Button(('%s [~r~%s~s~]'):format(v.label, v.ammo), nil, {RightLabel = '>>'}, true, {
-- --                     onSelected = function()
-- --                         if kayscoreConfigServ.PermanantWeapon(v.name) then return end

-- --                         KeyboardUtils.use('Tapez Y pour valider', function(data)
-- --                             if data == 'y' or data == 'Y' then
-- --                                 secured_TriggerServerEvent('L-VehiclesInventory:AddWeapon', vehiclePlate, v)
-- --                             end
-- --                         end)
-- --                     end
-- --                 })
-- --             end
-- --         end)

-- --         if not RageUI.Visible(main) and not RageUI.Visible(inventoryItems) and not RageUI.Visible(inventoryWeapons) and not RageUI.Visible(playerInventory) and not RageUI.Visible(playerLoadout) then
-- --             main = RMenu:DeleteType('main')
-- --             isInCoffre = false
-- --         end
-- --     end
-- -- end

-- -- RegisterNetEvent('L-VehiclesInventory:OpenInventoryAnswer', function(vehiclePlate, inventory)
-- --     openVehicleInventory(vehiclePlate, inventory)
-- -- end)


-- -- Citizen.CreateThread(function()
-- --     while ESX == nil do Citizen.Wait(0) end

-- --     function openVehicleTrunk()
-- --         if getIsDead() or truckStatut or isInCoffre then return end
        
-- --         local pPed = PlayerPedId()
-- --         local pCoords = GetEntityCoords(pPed)
-- --         local vehicle = lib.getClosestVehicle(pCoords, 10.0, true)

-- --         if vehicle == nil then return end
-- --         if IsPedSittingInAnyVehicle(pPed) then return ESX.ShowNotification("Vous ne pouvez pas faire cela dans un véhicule!") end
        
-- --         TriggerServerEvent('L-VehiclesInventory:OpenInventoryRequest', GetVehicleNumberPlateText(vehicle), GetVehicleClass(vehicle))
-- --     end
    
-- --     RegisterCommand('coffrevehicle', function() openVehicleTrunk() end)
-- --     RegisterKeyMapping('coffrevehicle', "Ouvrir le coffre d'un véhicule.", 'keyboard', 'L')
-- -- end)