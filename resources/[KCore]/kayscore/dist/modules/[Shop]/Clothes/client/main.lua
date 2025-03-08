-- local zoomOffset     = 0.0
-- local camOffset      = 0.0
-- local heading        = 90.0

-- local myClothes = {}
-- local SelectedClothes = {}

-- local changeTenue = false

-- RegisterNetEvent('kayscore:clotheshop:refreshClothes', function()
--     ESX.TriggerServerCallback('kayscore:clotheshop:getMyClothes', function(data) 
--         myClothes = data
--     end)
-- end)

-- function openClotheShop()
-- 	local menu = RageUI.CreateMenu(" ", _("MENU_DESCRIPTION"))
--     local hautClothe = RageUI.CreateSubMenu(menu, "", _("MENU_DESCRIPTION"))
--     local basClothe = RageUI.CreateSubMenu(menu, "", _("MENU_DESCRIPTION"))
--     local openMyCloackroom = RageUI.CreateSubMenu(menu, "", _("MENU_DESCRIPTION"))
--     local openSelectedClothe = RageUI.CreateSubMenu(openMyCloackroom, "", _("MENU_DESCRIPTION"))

--     local data = Config.Clothes.loadData()

--     local angle2 = 90
--     CreateSkinCam()
--     zoomOffset = 0.6
--     camOffset = 0.65
--     FreezeEntityPosition(Player.playerPed, true)

-- 	RageUI.Visible(menu, not RageUI.Visible(menu))

-- 	while menu do
-- 		Citizen.Wait(0)

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
--             RageUI.Button("Haut", nil, {}, true, {
--                 onSelected = function()

--                 end
--             }, hautClothe)
--             RageUI.Button("Bas", nil, {}, true, {
--                 onSelected = function()

--                 end
--             }, basClothe)
--             RageUI.Line(ESX.Config("r"), ESX.Config("g"), ESX.Config("b"), 255)
--             RageUI.Button("Payer", nil, {RightLabel = ('%s$'):format(Config.Clothes.priceWithoutSave)}, true, {
--                 onSelected = function()
--                     ESX.TriggerServerCallback('kayscore:clotheshop:haveMoney', function(valid)
--                         changeTenue = true
--                         if (valid) then 
--                             TriggerEvent("skinchanger:getSkin", function(skin)
--                                 TriggerServerEvent("esx_skin:save", skin)
--                             end)
--                         end
--                     end)
--                 end
--             })
--             RageUI.Button("Payer et sauvegarder la tenue", nil, {RightLabel = ('%s$'):format(Config.Clothes.priceWithSave)}, true, {
--                 onSelected = function()
--                     ESX.TriggerServerCallback('kayscore:clotheshop:haveMoneySave', function(valid)
--                         if (valid) then
--                             changeTenue = true

--                             local input = ESX.GetTextInput("Nom de votre tenue")
--                             if input == nil then
--                                 return ESX.ShowNotification("~r~Le nom de la tenue ne peut pas être nul")
--                             end

--                             TriggerEvent("skinchanger:getSkin", function(skin)
--                                 TriggerServerEvent("esx_skin:save", skin)

--                                 local tempTableVet = {}

--                                 for k,v in pairs(skin) do
--                                     if Config.Clothes.clotheSave[k] then
--                                         table.insert(tempTableVet, {name = k, number = v})
--                                     end
--                                 end

--                                 TriggerServerEvent('kayscore:clotheshop:saveTenue', tempTableVet, input)
--                             end)

--                         end
--                     end)
--                 end
--             })
--             RageUI.Button("Mes tenue(s)", nil, {}, true, {
--                 onSelected = function()
--                     ESX.TriggerServerCallback('kayscore:clotheshop:getMyClothes', function(data) 
--                         myClothes = data
--                     end)
--                 end
--             }, openMyCloackroom)
--         end)

--         RageUI.IsVisible(openMyCloackroom, function()
--             local tableLenght = ESX.Table.SizeOf(myClothes)
--             if tableLenght >= 1 then
--                 for k,v in pairs(myClothes) do 
--                     RageUI.Button(v.label, nil, {}, true, {
--                         onSelected = function()
--                             SelectedClothes = myClothes[k]
--                         end
--                     }, openSelectedClothe)
--                 end
--             else
--                 RageUI.Separator('Vous n\'avez pas de tenue')
--             end
--         end)

--         RageUI.IsVisible(openSelectedClothe, function()
--             if (SelectedClothes) then 
--                 RageUI.Button('Equiper la tenue', nil, {}, true, {
--                     onSelected = function()
--                         for k,v in pairs(SelectedClothes.data) do 
--                             TriggerEvent('skinchanger:change', v.name, v.number)
--                         end
--                         changeTenue = true
--                         TriggerEvent("skinchanger:getSkin", function(skin)
--                             TriggerServerEvent("esx_skin:save", skin)
--                         end)
--                     end
--                 })
--                 RageUI.Button('Prendre la tenue sur sois', nil, {}, true, {
--                     onSelected = function()
--                         TriggerServerEvent("kayscore:clotheshop:getClothes", SelectedClothes.id)
--                     end
--                 })
--                 RageUI.Button('Renommer la tenue', nil, {}, true, {
--                     onSelected = function()
--                         local input = ESX.GetTextInput("Nom de votre tenue")
--                         if input == nil then
--                             return ESX.ShowNotification("~r~Le nom de la tenue ne peut pas être nul")
--                         end

--                         TriggerServerEvent('kayscore:clotheshop:renameClothe', SelectedClothes.id, input)
--                         RageUI.GoBack()
--                     end
--                 })
--                 RageUI.Button('Supprimer la tenue', nil, {}, true, {
--                     onSelected = function()
--                         TriggerServerEvent('kayscore:clotheshop:deleteClothe', SelectedClothes.id)
--                         RageUI.GoBack()
--                     end
--                 })
--             end
--         end)

-- 		RageUI.IsVisible(hautClothe, function()
--             for i = 1, #data do 
--                 if data[i].type == 'haut' then 
--                     data[i].indexList = {}
--                     local numData = data[i].valeur()
--                     for p = 1, numData do 
--                         table.insert(data[i].indexList, p)
--                     end

--                     RageUI.List(data[i].label, data[i].indexList, data[i].index, 'Entrer pour définir un chiffre manuellement', {}, true, {
--                         onActive = function()
--                             zoomOffset = data[i].zoomOffset
--                             camOffset = data[i].camOffset
--                         end,
--                         onListChange = function(Index)
--                             data[i].index = Index
--                             if (data[i].index2) then 
--                                 data[data[i].index2].index = 1
--                                 TriggerEvent('skinchanger:change', data[i].indexName, 0)
--                             end
--                             TriggerEvent('skinchanger:change', data[i].skinchanger, data[i].index-1)
--                         end,
--                         onSelected = function(Index)
--                             local input = ESX.GetNumberInput("Définir le nombre")
--                             if input == nil then
--                                 input = 0
--                             end

--                             if input < 0 or input > numData then 
--                                 ESX.ShowNotification(('Vous devez mettre un chiffre entre (%s & %s)'):format(0, numData))
--                                 input = 0
--                             end

--                             if input ~= 0 then
--                                 data[i].index = input
--                                 TriggerEvent('skinchanger:change', data[i].skinchanger, data[i].index - 1)
--                             end
--                         end
--                     })
--                 end
--             end
-- 		end)

--         RageUI.IsVisible(basClothe, function()
--             for i = 1, #data do 
--                 if data[i].type == 'bas' then 
--                     data[i].indexList = {}
--                     local numData = data[i].valeur()
--                     for p = 1, numData do 
--                         table.insert(data[i].indexList, p)
--                     end

--                     RageUI.List(data[i].label, data[i].indexList, data[i].index, 'Entrer pour définir un chiffre manuellement', {}, true, {
--                         onActive = function()
--                             zoomOffset = data[i].zoomOffset
--                             camOffset = data[i].camOffset
--                         end,
--                         onListChange = function(Index)
--                             data[i].index = Index
--                             if (data[i].index2) then 
--                                 data[data[i].index2].index = 1
--                                 TriggerEvent('skinchanger:change', data[i].indexName, 0)
--                             end
--                             TriggerEvent('skinchanger:change', data[i].skinchanger, data[i].index-1)
--                         end,
--                         onSelected = function(Index)
--                             local input = ESX.GetNumberInput("Définir le nombre")
--                             if input == nil then
--                                 input = 0
--                             end

--                             if input < 0 or input > numData then 
--                                 ESX.ShowNotification(('Vous devez mettre un chiffre entre (%s & %s)'):format(0, numData))
--                                 input = 0
--                             end

--                             if input ~= 0 then
--                                 data[i].index = input
--                                 TriggerEvent('skinchanger:change', data[i].skinchanger, data[i].index - 1)
--                             end
--                         end
--                     })
--                 end
--             end
--         end)

-- 		if not RageUI.Visible(menu) and not RageUI.Visible(hautClothe) and not RageUI.Visible(openMyCloackroom) and not RageUI.Visible(openSelectedClothe) and not RageUI.Visible(basClothe) then
--             DeleteSkinCam()
--             FreezeEntityPosition(Player.playerPed, false)
--             if changeTenue == false then
--                 TriggerEvent("esx:refreshSkin")
--             end
--             changeTenue = false
-- 			menu = RMenu:DeleteType('menu', true)
-- 		end
-- 	end
-- end

-- Citizen.CreateThread(function()
--     while ESX == nil do Wait(1000) end

--     local positions = {

--         --rooxwood
--      --   vec3(-332.654755, 7209.468750, 6.798149),
--     }
--         for k,v in pairs(positions) do
--         AddZones(("clotheshop_%s"):format(k), {
--             Position = vector3(v.x, v.y, v.z+0.60),
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
--                 TriggerEvent("ui:clotheshop:open")
--             end
--         })
--             ESX.addBlips({
--             name = ("Magasin de Vêtement %s"):format(k),
--             label = 'Magasin de Vêtement',
--             category = nil,
--             position = vector3(v.x, v.y, v.z+0.60),
--             sprite = 73,
--             display = 4,
--             scale = 0.5,
--             color = 17,
--         })
--     end
-- end)