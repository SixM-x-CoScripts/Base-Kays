-- accessories = {
--     myData = {},
-- }

-- accessories.position = {
--     vec3(422.568604, -810.367249, 29.490948),
--     vec3(78.270844, -1388.386230, 29.375969),
--     vec3(4491.702148, -4457.594238, 4.235132),
--     vec3(-707.196167, -145.886566, 37.415199),
--     vec3(-170.765808, -305.558380, 39.733337),
--     vec3(-817.068115, -1073.690918, 11.327923),
--     vec3(-1442.928589, -237.759750, 49.821823),
--     vec3(-0.276522, 6511.512695, 31.877676),
--     vec3(129.585938, -215.058411, 54.557682),
--     vec3(1691.743164, 4818.096191, 42.057865),
--     vec3(614.317688, 2753.611084, 42.088215),
--     vec3(1201.102661, 2707.536133, 38.222412),
--     vec3(-1201.206299, -773.039368, 17.317030),
--     vec3(-3166.390625, 1051.801392, 20.863348),
--     vec3(-1096.190796, 2711.276855, 19.107693),
--     --roxwood
--     --vec3(-341.075073, 7212.040039, 6.798151),
-- }


-- RegisterNetEvent('kayscore:accessories:update', function(data)
--     if not (data) then data = {} end
--     accessories.myData = data
-- end)

-- RegisterNetEvent('kayscore:accessories:add', function(index, data)
--     accessories.myData[index] = data
-- end)

-- RegisterNetEvent('kayscore:accessories:delete', function(index)
--     accessories.myData[index] = nil
-- end)

-- RegisterNetEvent('kayscore:accessories:rename', function(index,newLabel)
--     accessories.myData[index].label = newLabel
-- end)

-- local bagList = {}

-- AddEventHandler("kayscore:skinchanger:sendBagConfig", function(data)
--     bagList = data
-- end)

-- Citizen.CreateThread(function()
--     for k,v in pairs(accessories.position) do 
        
        
--             AddZones(("accessories:%s"):format(k), {
--             Position = v,
--             Dist = 10,
--             Public = true,
--             Job = nil,
--             Job2 = nil,
--             GradesJobRequire = false,
--             GradesJob = {},
--             InVehicleDisable = true,
--             Blip = {
--                 Active = false,
--             },
--             ActionText =('Appuyez sur [ %sE~w~ ] pour intéragir'):format(UTILS.COLORCODE),
--             marker = true,
--             Action = function()
--                 TriggerEvent("ui:accessories:open")
--             end
--         })
--             ESX.addBlips({
--             name = ("Magasin d'accessoires %s"):format(k),
--             label = "Magasin d'accessoires",
--             category = nil,
--             position = v,
--             sprite = 102,
--             display = 4,
--             scale = 0.5,
--             color = 18,
--             })
--     end
-- end)

-- local zoomOffset     = 0.0
-- local camOffset      = 0.0
-- local heading        = 90.0

-- function accessories.openMenu()
--     local angle2 = 90
--     CreateSkinCam()
--     zoomOffset = 0.6
--     camOffset = 0.65
--     FreezeEntityPosition(Player.playerPed, true)

--     local menu = RageUI.CreateMenu("", "Magasin de Vetement")
--     local subMenu = RageUI.CreateSubMenu(menu, "", "Magasin de Vetement")

-- 	RageUI.Visible(menu, not RageUI.Visible(menu))

--     local principalButton = {
--         {
--             label = 'Masques', 
--             type = 'mask_1', 
--             type2 = 'mask_2',
--             id = 1, 
--             defaultIndex = exports.slide:GetPlayerSkinData('mask_1') or 1,
--             defaultIndex2 = exports.slide:GetPlayerSkinData('mask_2') or 1,
--             zoomOffset = 0.6,
--             camOffset = 0.65,
--             price = 15,
--         },
--         {
--             label = 'Chapeaux',
--             type = 'helmet_1', 
--             type2 = 'helmet_2',
--             id = 0,
--             defaultIndex = exports.slide:GetPlayerSkinData('helmet_1') or 1,
--             defaultIndex2 = exports.slide:GetPlayerSkinData('helmet_2') or 1,
--             zoomOffset = 0.6,
--             camOffset = 0.65,
--             price = 30,
--         },
--         {
--             label = 'Sac',
--             type = 'bags_1',
--             type2 = 'bags_2',
--             id = 5,
--             defaultIndex = exports.slide:GetPlayerSkinData('bags_1') or 1,
--             defaultIndex2 = exports.slide:GetPlayerSkinData('bags_2') or 1,
--             zoomOffset = 0.75,
--             camOffset = 0.15,
--             price = 10,
--         },
--         {
--             label = 'Gilet par balle',
--             type = 'bproof_1',
--             type2 = 'bproof_2',
--             id = 9,
--             defaultIndex = exports.slide:GetPlayerSkinData('bproof_1') or 1,
--             defaultIndex2 = exports.slide:GetPlayerSkinData('bproof_2') or 1,
--             zoomOffset = 0.75,
--             camOffset = 0.15,
--             price = 100,
--         },
--         {
--             label = 'Chaines',
--             type = 'chain_1',
--             type2 = 'chain_2',
--             id = 7,
--             defaultIndex = exports.slide:GetPlayerSkinData('chain_1') or 1,
--             defaultIndex2 = exports.slide:GetPlayerSkinData('chain_2') or 1,
--             zoomOffset = 0.75,
--             camOffset = 0.15,
--             price = 35,
--         },
--         {
--             label = 'Accessoires d\'oreille',
--             type = 'ears_1',
--             type2 = 'ears_2',
--             id = 2,
--             defaultIndex = exports.slide:GetPlayerSkinData('ears_1') or 1,
--             defaultIndex2 = exports.slide:GetPlayerSkinData('ears_2') or 1,
--             zoomOffset = 0.6,
--             camOffset = 0.65,
--             price = 20,
--         },
--         {
--             label = 'Montres',
--             type = 'watches_1',
--             type2 = 'watches_2',
--             id = 6,
--             defaultIndex = exports.slide:GetPlayerSkinData('watches_1') or 1,
--             defaultIndex2 = exports.slide:GetPlayerSkinData('watches_2') or 1,
--             zoomOffset = 0.75,
--             camOffset = 0.15,
--             price = 30,
--         },
--         {
--             label = 'Bracelets',
--             type = 'bracelets_1',
--             type2 = 'bracelets_2',
--             id = 7,
--             defaultIndex = exports.slide:GetPlayerSkinData('bracelets_1') or 1,
--             defaultIndex2 = exports.slide:GetPlayerSkinData('bracelets_2') or 1,
--             zoomOffset = 0.75,
--             camOffset = 0.15,
--             price = 20,
--         },
--         {
--             label = 'Lunettes',
--             type = 'glasses_1',
--             type2 = 'glasses_2',
--             id = 1,
--             defaultIndex = exports.slide:GetPlayerSkinData('glasses_1') or 1,
--             defaultIndex2 = exports.slide:GetPlayerSkinData('glasses_2') or 1,
--             zoomOffset = 0.6,
--             camOffset = 0.65,
--             price = 10,
--         },
--     }

-- 	while menu do
--         Citizen.Wait(0)

--         DisableControlAction(2, 30, true)
--         DisableControlAction(2, 31, true)
--         DisableControlAction(2, 32, true)
--         DisableControlAction(2, 33, true)
--         DisableControlAction(2, 34, true)
--         DisableControlAction(2, 35, true)
--         DisableControlAction(0, 25, true) -- Input Aim
--         DisableControlAction(0, 24, true) -- Input Attack

--         local coords    = Player.coords

--         local angle = heading * math.pi / 180.0
--         local theta = {
--             x = math.cos(angle),
--             y = math.sin(angle)
--         }

--         if (not zoomOffset) then
--             zoomOffset = 0.6
--         end
--         local pos = {
--             x = coords.x + (zoomOffset * theta.x),
--             y = coords.y + (zoomOffset * theta.y)
--         }

--         local angleToLook = heading - 140.0
--         if angleToLook > 360 then
--             angleToLook = angleToLook - 360
--         elseif angleToLook < 0 then
--             angleToLook = angleToLook + 360
--         end

--         angleToLook = angleToLook * math.pi / 180.0
--         local thetaToLook = {
--             x = math.cos(angleToLook),
--             y = math.sin(angleToLook)
--         }

--         local posToLook = {
--             x = coords.x + (zoomOffset * thetaToLook.x),
--             y = coords.y + (zoomOffset * thetaToLook.y)
--         }
--         if not camOffset then
--             camOffset = 0.65
--         end
--         SetCamCoord(cam, pos.x, pos.y, coords.z + camOffset)
--         PointCamAtCoord(cam, posToLook.x, posToLook.y, coords.z + camOffset)
--         DrawMissionText('Appuyez sur '..kayscoreConfigServ.GTACOLOR..'[E]~s~ et ~p~[F]~s~ pour tourner la vue.', 500)

--         if IsControlPressed(0, 51) then
--             angle2 = angle2 - 1
--         elseif IsControlPressed(0, 23) then
--             angle2 = angle2 + 1
--         end

--         if angle2 > 360 then
--             angle2 = angle2 - 360
--         elseif angle2 < 0 then
--             angle2 = angle2 + 360
--         end

--         heading = angle2 + 0.0

--         RageUI.IsVisible(menu, function()
--             for i = 1, #principalButton do 
--                 RageUI.Button(principalButton[i].label, nil, {}, true, {
--                     onSelected = function()
--                         zoomOffset = principalButton[i].zoomOffset
--                         camOffset = principalButton[i].camOffset
--                         selectedSubMenu = principalButton[i].type
--                     end
--                 }, subMenu)
--             end
--         end)

--         RageUI.IsVisible(subMenu, function()
--             for i = 1, #principalButton do 
--                 if selectedSubMenu == principalButton[i].type then
--                     local numData = 0
--                     if principalButton[i].type == 'mask_1' or principalButton[i].type == 'bags_1' or principalButton[i].type == 'chain_1' or principalButton[i].type == 'bproof_1' then
--                         numData = GetNumberOfPedDrawableVariations(Player.playerPed, principalButton[i].id) - 1
--                     else
--                         numData = GetNumberOfPedPropDrawableVariations(Player.playerPed, principalButton[i].id) - 1
--                     end

--                     local temporyData = {}
--                     for p = 0, numData do 
--                         table.insert(temporyData, p)
--                     end
--                     if principalButton[i].defaultIndex == 0 then principalButton[i].defaultIndex = 1 end

--                     local desc = 'Entrer pour définir un chiffre manuellement'

--                     if principalButton[i].type == 'bags_1' then
--                         local bagData = bagList[IsMale()][principalButton[i].defaultIndex-1]
--                         desc = ('Entrer pour définir un chiffre manuellement\nCe sac vous fait gagner %skg'):format(bagData == nil and 0 or bagData.weight)
--                     end

--                     RageUI.List(('%s #%s'):format(principalButton[i].label, principalButton[i].defaultIndex), temporyData, principalButton[i].defaultIndex, desc, {}, true, {
--                         onListChange = function(Index)
--                             principalButton[i].defaultIndex = Index
--                             TriggerEvent('skinchanger:change', principalButton[i].type, principalButton[i].defaultIndex-1)
--                         end,
--                         onSelected = function(Index)
--                             local input = ESX.GetNumberInput("Définir le nombre")
--                             if input == nil then
--                                 input = 0
--                             end

--                             if input < 0 or input > numData then
--                                 ESX.ShowNotification(("Vous devez mettre un chiffre entre (%s & %s)"):format(0, numData))
--                                 input = 0
--                             end

--                             if input ~= 0 then
--                                 principalButton[i].defaultIndex = input + 1
--                                 TriggerEvent("skinchanger:change", principalButton[i].type, input)
--                             end
--                         end
--                     })
--                     local numData
--                     if principalButton[i].type == 'mask_1' or principalButton[i].type == 'bags_1' or principalButton[i].type == 'chain_1' or principalButton[i].type == 'bproof_1' then
--                         numData = GetNumberOfPedTextureVariations(Player.playerPed, principalButton[i].id, principalButton[i].defaultIndex) - 1
--                     else
--                         numData = GetNumberOfPedPropTextureVariations(Player.playerPed, principalButton[i].id, principalButton[i].defaultIndex) - 1
--                     end

--                     local temporyData = {}
--                     for _ = 0, numData do 
--                         table.insert(temporyData, _)
--                     end
--                     if principalButton[i].defaultIndex2 == 0 then principalButton[i].defaultIndex2 = 1 end
--                     RageUI.List(('Couleur %s #%s'):format(principalButton[i].label, principalButton[i].defaultIndex2), temporyData, principalButton[i].defaultIndex2, nil, {}, true, {
--                         onListChange = function(Index)
--                             principalButton[i].defaultIndex2 = Index
--                             TriggerEvent('skinchanger:change', principalButton[i].type2, principalButton[i].defaultIndex2-1)
--                         end,
--                     })
--                     RageUI.Button("Acheter l'accessoire", nil, {RightLabel = ('%s$'):format(principalButton[i].price)}, true, {
--                         onSelected = function()
--                             local data = {data = {{name = principalButton[i].type, number = principalButton[i].defaultIndex-1}, {name = principalButton[i].type2, number = principalButton[i].defaultIndex2-1}}}
--                             if principalButton[i].type == "mask_1" then
--                                 data.type = "mask"
--                             elseif principalButton[i].type == "helmet_1" then
--                                 data.type = "hat"
--                             elseif principalButton[i].type == "bags_1" then
--                                 data.type = "bag"
--                             elseif principalButton[i].type == "bproof_1" then
--                                 data.type = "gillet"
--                             elseif principalButton[i].type == "chain_1" then
--                                 data.type = "neck"
--                             elseif principalButton[i].type == "ears_1" then
--                                 data.type = "ear"
--                             elseif principalButton[i].type == "watches_1" then
--                                 data.type = "watch"
--                             elseif principalButton[i].type == "bracelets_1" then
--                                 data.type = "bracelet"
--                             elseif principalButton[i].type == "glasses_1" then
--                                 data.type = "glasses"
--                             end
                            
--                             TriggerServerEvent("kayscore:buyAccessories", data)
--                         end
--                     })
--                 end
--             end
--         end)
        
-- 		if not RageUI.Visible(menu) and not RageUI.Visible(subMenu) then
--             DeleteSkinCam()
--             FreezeEntityPosition(Player.playerPed, false)
--             TriggerEvent("esx:refreshSkin")
-- 			menu = RMenu:DeleteType('menu', true)
-- 		end
-- 	end
-- end

-- function IsMale(ped)
--     return GetEntityModel(PlayerPedId()) == GetHashKey("mp_m_freemode_01")
-- end