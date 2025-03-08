--[[CreateThread(function()
    ESX.RegisterServerCallback('kayscore:fuel:getmoney', function(source, cb, data)
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)

        if xPlayer == nil then cb(false) return end

        if xPlayer.getAccount('bank').money < 50*data then cb(false) TriggerClientEvent('esx:showNotification', source, 'Vous ne possedez pas les fonds requis sur votre compte en banque') return end

        xPlayer.removeAccountMoney('bank', 50*data)

        cb(true)

        TriggerClientEvent('esx:showNotification', source, ('Vous avez payé ~g~%sL~s~ pour ~g~%s$~s~ en banque'):format(data, 50*data))
    end)
end)]]--