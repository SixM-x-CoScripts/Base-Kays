-- local isDead = false
-- RegisterNetEvent('esx_billing:getBills')
-- AddEventHandler('esx_billing:getBills', function()
-- 	ShowBillsMenu()
-- end)
-- -- function ShowBillsMenu()

-- -- 	ESX.TriggerServerCallback('esx_billing:getBills', function(bills)
-- -- 		ESX.UI.Menu.CloseAll()
-- -- 		local elements = {}

-- -- 		for i=1, #bills, 1 do
-- -- 			table.insert(elements, {
-- -- 				label  = ('%s - <span style="color:red;">%s</span>'):format(bills[i].label, _U('invoices_item', ESX.Math.GroupDigits(bills[i].amount))),
-- -- 				billID = bills[i].id
-- -- 			})
-- -- 		end

-- -- 		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'billing',
-- -- 		{
-- -- 			title    = _U('invoices'),
-- -- 			align    = 'up-left',
-- -- 			elements = elements
-- -- 		}, function(data, menu)
-- -- 			menu.close()

-- -- 			ESX.TriggerServerCallback('esx_billing:payBill', function()
-- -- 				ShowBillsMenu()
-- -- 			end, data.current.billID)
-- -- 		end, function(data, menu)
-- -- 			menu.close()
-- -- 		end)
-- -- 	end)

-- -- end

-- AddEventHandler('esx:onPlayerDeath', function(data)
-- 	isDead = true
-- end)

-- AddEventHandler('playerSpawned', function(spawn)
-- 	isDead = false
-- end)
