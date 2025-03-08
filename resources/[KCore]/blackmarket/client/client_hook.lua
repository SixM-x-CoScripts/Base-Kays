if XMR.Framework == "qb" then
    QBCore = exports["qb-core"]:GetCoreObject()
else
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end



Notify = function(text)
    if XMR.Framework == "qb" then
        return QBCore.Functions.Notify(text)
    else
        return ESX.ShowNotification(text)
    end
end