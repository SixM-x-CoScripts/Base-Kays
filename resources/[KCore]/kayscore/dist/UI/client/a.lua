-- Products = {}

-- function open_ui()
-- 	TriggerEvent('kayscore:openNuiShop', 'Ammu-Nation')
-- end
-- exports('copyData', function(...)
-- 	SendNUIMessage({
-- 		type = 'copy',
-- 		coords = ...
-- 	})
-- end)
-- exports('openUI', function(type)
-- 	TriggerEvent('kayscore:openNuiShop', type)
-- end)

-- function openUI(type)
--     TriggerEvent('kayscore:openNuiShop', type)
-- end

-- function close_ui()
--   	TriggerScreenblurFadeOut(1000)
-- 	SendNUIMessage({action = "close"})
-- 	SetNuiFocus(false, false)

-- 	InMenu = false
-- end

-- RegisterNetEvent('kayscore:openNuiShop', function(typeShop)
-- 	local getInformationsShop = Products[typeShop]

-- 	if not getInformationsShop then return end

-- 	local products = {}

-- 	for k,v in pairs(getInformationsShop) do 
-- 		table.insert(products, {id= k, name = v.name, price = v.price, item = v.item, type = v.type, image = v.image})
-- 	end

-- 	TriggerScreenblurFadeIn(0.1)
-- 	SendNUIMessage({action = 'open', content = { products = products }})
-- 	SetNuiFocus(true, true)

-- 	InMenu = true
-- end)

-- RegisterNUICallback("checkout",function(data)
-- 	--if IsInInterface() then return end
--     secured_TriggerServerEvent('shop:checkoutShop', data.item, data.quantity, data.total, data.type, data.name)
-- end)

-- RegisterNUICallback("CloseUISHOP",function()
-- 	--if IsInInterface() then return end
--     close_ui()
-- end)

-- exports('addItem', function(name, table)
--     print(name, table)
--     Products[name] = table
-- end)

-- function addItem(name, table)
--     Products[name] = table
-- end