-- local package = {}
-- local number = 0

-- Christmas.openCalendarMenu = function()
--     local main = RageUI.CreateMenu('', 'Calendrier de Noêl')

--     ESX.TriggerServerCallback('kayscore:christmas:calendar:fetch', function(cb, n)
--         if cb then
--             package = cb
--             number = n
--         else
--             package = {}
--             number = n
--         end
--     end)

--     RageUI.Visible(main, not RageUI.Visible(main))

--     while main do Wait(1)
--         RageUI.IsVisible(main, function()
--             RageUI.Separator('~r~↓ Calendrier de Noêl ↓~s~')
--             for k,v in pairs(Christmas.Calendar.Package) do
--                 RageUI.Separator('🎅🎁🎄')
--                 RageUI.Button(package[k] and '~r~Case du Jour: '.. k or '~g~Case du Jour: '.. k, package[k] and 'Vous possezdez déjà cette récompense', {RightLabel = '→',}, tonumber(number) >= tonumber(k) and not package[k], {
--                     onSelected = function()
--                         KeyboardUtils.use('Taper Y pour valider', function(data)
--                             if data == 'y' or data == 'Y' then
--                                 TriggerServerEvent('kayscore:christmas:calendar:paidPackage', k)

--                                 Wait(500)

--                                 ESX.TriggerServerCallback('kayscore:christmas:calendar:fetch', function(cb, n)
--                                     if cb then
--                                         package = cb
--                                         number = n
--                                     else
--                                         package = {}
--                                         number = n
--                                     end
--                                 end)
--                             end
--                         end)
--                     end
--                 })
--             end
--         end)
--     end
-- end