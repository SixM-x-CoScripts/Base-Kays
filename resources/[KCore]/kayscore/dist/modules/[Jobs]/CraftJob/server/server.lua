RegisterServerEvent('craft:craftItem')
RegisterServerEvent('craft:verifitem')

AddEventHandler('craft:craftItem', function(job, craftItem, ingredients)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == job then
        local hasAllItems = true
        for _, ingredient in ipairs(ingredients) do
            local item = xPlayer.getInventoryItem(ingredient.item)
            if not item or item.count < ingredient.count then
                hasAllItems = false
                break
            end
        end

        if hasAllItems then
            for _, ingredient in ipairs(ingredients) do
                xPlayer.removeInventoryItem(ingredient.item, ingredient.count)
            end
            xPlayer.addInventoryItem(craftItem, 1)
            TriggerClientEvent('esx:showNotification', source, 'Vous avez crafté ~g~' .. craftItem)
            sendLog(("Le Joueur (%s - %s) viens de craft l'item (x1 - %s)"):format(xPlayer.name, xPlayer.UniqueID, xPlayer.job.name, craftItem), {
                author = 'Craft Job',
                fields = {
                    {title = 'Player', subtitle = xPlayer.name},
                    {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                    {title = 'Identifier', subtitle = xPlayer.identifier},
                    {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                },
                channel = 'craft_job'
            })
        else
            TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez pas tous les items nécessaires')
        end
    else
        TriggerClientEvent('esx:showNotification', source, 'Action non autorisée pour votre job')
    end
end)

AddEventHandler('craft:verifitem', function(job, craftItem, ingredients)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == job then
        local hasAllItems = true
        for _, ingredient in ipairs(ingredients) do
            local item = xPlayer.getInventoryItem(ingredient.item)
            if not item or item.count < ingredient.count then
                hasAllItems = false
                break
            end
        end
        if not hasAllItems then
            TriggerClientEvent('craft:insufficientItems', source)
        else
            TriggerClientEvent('craft:startCrafting', source, job, craftItem, ingredients)
        end
    else
        TriggerClientEvent('esx:showNotification', source, 'Action non autorisée pour votre job')
    end
end)
