secured_RegisterNetEvent('kayscoreServ:fishing:sell', function(name, label, price, c)
    local source = source
    local player = ESX.GetPlayerFromId(source)

    if not player then return end

    if player.getInventoryItem(name).count < c then
        return(
            TriggerClientEvent('esx:showNotification', source, ('Vous ne possédez pas asser de ~r~%s~s~'):format(label))
        )
    end

    player.removeInventoryItem(name, c)
    player.addAccountMoney('cash', price*c)

    player.showNotification(('Vous avez vendu ~y~x%s %s~s~ pour ~g~%s$~s~'):format(c, label, price*c))
    sendLog(('Le Player (%s - %s) a vendu (%s - %s)'):format(player.name, player.UniqueID, name, c), {
        author = 'Vente Fishing',
        fields = {
            {title = 'Player', subtitle = player.name},
            {title = 'ID Unique', subtitle = player.UniqueID},
            {title = 'Identifier', subtitle = player.identifier},
            {title = "Gain", subtitle = price*c},
        },
        channel = 'vente_fishing'
    })
end)