-- CreateThread(function()
--     function openCoinMenu()
--         local main = RageUI.CreateMenu('', 'Actions Disponibles')

--         RageUI.Visible(main, not RageUI.Visible(main))
--         FreezeEntityPosition(Player.playerPed, true)
--         while main do Wait(1)
--             RageUI.IsVisible(main, function()
--                 RageUI.WLine()
--                 RageUI.Button('Achter des jetons (Banque)', nil, {RightLabel = '~g~500$~s~/1', RightBadge = RageUI.BadgeStyle.Star}, true, {
--                     onSelected = function()
--                         PassKeyboardUtils.use('Quantité', function(data)
--                             local data = tonumber(data)

--                             if data == nil then return end

--                             TriggerServerEvent('kayscore:casino:coin:paid', 5009*data, data)
--                         end)
--                     end
--                 })
--                 RageUI.Button('Echanger des jetons', nil, {RightLabel = '~g~500~s~/1'}, true, {
--                     onSelected = function()
--                         PassKeyboardUtils.use('Quantité', function(data)
--                             local data = tonumber(data)

--                             if data == nil then return end

--                             TriggerServerEvent('kayscore:casino:coin:remove', 5009*data, data)
--                         end)
--                     end
--                 })
--                 RageUI.WLine()
--             end)

--             if not RageUI.Visible(main) then
--                 main = RMenu:DeleteType('main')
--                 FreezeEntityPosition(Player.playerPed, false)
--             end
--         end
--     end

--     print('TEST')

--     AddZones('jetons_casino', {
--         Position = vector3(959.0144, 25.24402, 76.99128),
--         Dist = 10,
--         Public = true,
--         Job = nil,
--         Job2 = nil,
--         GradesJob = {},
--         InVehicleDisable = true,
--         Blip = {
--             Active = false,
--         },
--         ActionText =('Appuyez sur [ %sE~w~ ] pour intéragir'):format(UTILS.COLORCODE),
--         Action = function()
--             openCoinMenu()
--         end
--     })
-- end)