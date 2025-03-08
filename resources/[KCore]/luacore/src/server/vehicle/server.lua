local deleteTimer = 180

CreateThread(function()
    while true do
        Wait(deleteTimer * 60000)
        TriggerClientEvent('chat:addMessage', -1, { color = { 255, 111, 3 }, args = {'', 'Les Vehicules inactif seront supprimé dans 5 minutes'}})
        TriggerClientEvent('esx:showNotification', -1, 'Les Vehicules inactif seront supprimé dans 5 minutes')
        Wait(240000)
        TriggerClientEvent('chat:addMessage', -1, { color = { 255, 0, 0 }, args = {'', 'Les Vehicules inactif seront supprimé dans 1 minutes'}})
        TriggerClientEvent('esx:showNotification', -1, 'Les Vehicules inactif seront supprimé dans 1 minutes')
        Wait(45000)
        TriggerClientEvent('chat:addMessage', -1, { color = { 255, 0, 0 }, args = {'', 'Les Vehicules inactif seront supprimé dans 15 secondes'}})
        TriggerClientEvent('esx:showNotification', -1, 'Les Vehicules inactif seront supprimé dans 15 secondes')
        Wait(15000)
        TriggerClientEvent('chat:addMessage', -1, { color = { 255, 0, 0 }, args = {'', 'Les Vehicules inactif seront supprimé dans 5 secondes'}})
        TriggerClientEvent('esx:showNotification', -1, 'Les Vehicules inactif seront supprimé dans 5 secondes')
        Wait(5000)

        for i, veh in pairs(GetAllVehicles()) do 
            if HasVehicleBeenOwnedByPlayer(veh) then 
                if not isVehicleOccupied(veh) then
                    if GetVehicleDoorLockStatus(veh) == 1 then
                        DeleteEntity(veh)
                    end
                end
            end
        end
        TriggerClientEvent('chat:addMessage', -1, { color = { 255, 111, 3 }, args = {'', 'Tout les vehicules inactif on était supprimé pour tout problèmes /report'}})
        TriggerClientEvent('esx:showNotification', -1, 'Tout les vehicules inactif on était supprimé pour tout problèmes /report')
        RconPrint('tout les vehicules de la map on était supprimé avec succes')
        Wait(10000)
        RconPrint('Le chat vient de se clear automatiquement')
        TriggerClientEvent('chat:clear', -1)
    end
end)

function isVehicleOccupied(veh)
    for seat = -1, 6 do 
        if GetPedInVehicleSeat(veh, seat) ~= 0 then 
            return true 
        end
    end
    return false 
end
