-- ESX = nil

-- TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)




-- RegisterServerEvent('kayscore:GiveItem')
-- AddEventHandler('kayscore:GiveItem', function(playerId, selectedItem)
--     local _source = source
--     local xPlayer = ESX.GetPlayerFromId(_source)

--     local sacPoubelle = xPlayer.getInventoryItem('sac_poubelle')
--     if sacPoubelle.count > 0 then
--         if math.random(1, 2) == 1 then
--             xPlayer.removeInventoryItem('sac_poubelle', 1)
--             TriggerClientEvent('esx:showNotification', _source, kayscoreConfigServ.GTACOLOR..'SlideRP Message~w~ \n Votre sac poubelle est déchirée')
--         end
        
--         xPlayer.addInventoryItem(selectedItem, 1)
--         TriggerClientEvent('esx:showNotification', _source, kayscoreConfigServ.GTACOLOR..'SlideRP Message~w~ \n Bien joué, tu as trouvé un objet dans cette poubelle ~g~1x item ' .. selectedItem)
--     else
--         TriggerClientEvent('esx:showNotification', _source, kayscoreConfigServ.GTACOLOR..'SlideRP Message~w~ \n Vous avez besoin de sac poubelle pour faire cela')
--     end
-- end)



-- -- farm poubelle

-- RegisterServerEvent('kayscore:Givesac')
-- AddEventHandler('kayscore:Givesac', function()
--     local _source = source
--     local xPlayer = ESX.GetPlayerFromId(_source)

--     if math.random(1, 5) == 1 then
--         xPlayer.addInventoryItem('sac_poubelle', 1)
--         TriggerClientEvent('esx:showNotification', _source, kayscoreConfigServ.GTACOLOR..'SlideRP Message~w~ \n Tu as reçu ~g~1x Sac Poubelle ')
--     else
--         TriggerClientEvent('esx:showNotification', _source, kayscoreConfigServ.GTACOLOR..'SlideRP Message~w~ \n Tu n\'as rien trouvé ')
--     end
-- end)

