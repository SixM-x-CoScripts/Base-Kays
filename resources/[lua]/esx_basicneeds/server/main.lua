ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

CreateThread(function()
    for k, v in pairs(Config.Items) do
        ESX.RegisterUsableItem(k, function(source)
            local xPlayer = ESX.GetPlayerFromId(source)
            if v.remove then
                xPlayer.removeInventoryItem(k, 1)
            end
            if v.type == "food" then
                local itemLabel = ESX.GetItemLabel(k)
                TriggerClientEvent("esx_status:add", source, "hunger", v.status)
                TriggerClientEvent('esx_basicneeds:onUse', source, v.type, v.prop, v.anim)
                xPlayer.showNotification(('Tu viens de manger ~g~%s'):format(itemLabel))
            elseif v.type == "drink" then
                local itemLabel = ESX.GetItemLabel(k)
                TriggerClientEvent("esx_status:add", source, "thirst", v.status)
                TriggerClientEvent('esx_basicneeds:onUse', source, v.type, v.prop, v.anim)
                xPlayer.showNotification(('Tu viens de boire ~g~%s'):format(itemLabel))
            elseif v.type == "fooddrink" then
                local itemLabel = ESX.GetItemLabel(k)
                TriggerClientEvent("esx_status:add", source, "thirst", v.status)
                TriggerClientEvent("esx_status:add", source, "hunger", v.status)
                TriggerClientEvent('esx_basicneeds:onUse', source, v.type, v.prop, v.anim)
                xPlayer.showNotification(('Tu viens de boire ~g~%s'):format(itemLabel))
            else
                -- print(string.format('^1[ERROR]^0 %s has no correct type defined.', k))
            end
        end)
    end
end)

AddEventHandler('txAdmin:events:healedPlayer', function(eventData)
    if GetInvokingResource() ~= "monitor" or type(eventData) ~= "table" or type(eventData.id) ~= "number" then
        return
    end

    TriggerClientEvent('esx_basicneeds:healPlayer', eventData.id)
end)