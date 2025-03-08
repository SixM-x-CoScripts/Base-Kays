-- if GetConvar('ServerName', ' ') == 'EvoLife' then
--     ESX.RegisterServerCallback('exodia:getPhoonne', function(source, cb)
--         local src = source
--         local xPlayer = ESX.GetPlayerFromId(src)
    
--         if not xPlayer.getInventoryItem('phone') then cb(false) return end
--         if xPlayer.getInventoryItem('phone').count < 1 then cb(false) return end
        
--         cb(true)
--     end)
-- end