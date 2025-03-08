local ESX = exports['frwk']:getSharedObject()

local function LoadElevators()
    local elevators = {}
    MySQL.Async.fetchAll("SELECT * FROM elevators", {}, function(result)
        for _, elevator in ipairs(result) do
            MySQL.Async.fetchAll("SELECT * FROM elevator_floors WHERE elevator_id = @elevator_id", {
                ['@elevator_id'] = elevator.id
            }, function(floors)
                elevators[elevator.id] = {
                    name = elevator.name,
                    floors = floors
                }
            end)
        end
    end)
    return elevators
end

local Elevators = LoadElevators()

RegisterServerEvent('elevator:createElevator')
AddEventHandler('elevator:createElevator', function(name, floors)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    -- if xPlayer.getGroup() ~= 'admin' and xPlayer.getGroup() ~= 'superadmin' then
    --     xPlayer.showNotification("Vous n'avez pas les permissions nécessaires.")
    --     return
    -- end

    MySQL.Async.insert('INSERT INTO elevators (name) VALUES (@name)', {
        ['@name'] = name
    }, function(elevatorId)
        for _, floor in ipairs(floors) do
            MySQL.Async.insert('INSERT INTO elevator_floors (elevator_id, floor_name, x, y, z) VALUES (@elevator_id, @floor_name, @x, @y, @z)', {
                ['@elevator_id'] = elevatorId,
                ['@floor_name'] = floor.name,
                ['@x'] = floor.x,
                ['@y'] = floor.y,
                ['@z'] = floor.z
            })
        end
        Elevators[elevatorId] = {name = name, floors = floors}
        xPlayer.showNotification("Ascenseur créé avec succès!")
        TriggerClientEvent('elevator:syncElevators', -1, Elevators)
    end)
end)

RegisterServerEvent('elevator:requestSync')
AddEventHandler('elevator:requestSync', function()
    local _source = source
    TriggerClientEvent('elevator:syncElevators', _source, Elevators)
end)

ESX.RegisterServerCallback('elevator:deleteElevator', function(source, cb, elevatorId)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    -- if xPlayer.getGroup() ~= 'admin' and xPlayer.getGroup() ~= 'superadmin' then
    --     cb(false)
    --     return
    -- end

    MySQL.Async.execute('DELETE FROM elevators WHERE id = @id', {
        ['@id'] = elevatorId
    }, function(rowsChanged)
        if rowsChanged > 0 then
            MySQL.Async.execute('DELETE FROM elevator_floors WHERE elevator_id = @elevator_id', {
                ['@elevator_id'] = elevatorId
            })
            Elevators[elevatorId] = nil
            TriggerClientEvent('elevator:syncElevators', -1, Elevators)
            cb(true)
        else
            cb(false)
        end
    end)
end)

RegisterServerEvent('elevator:renameElevator')
AddEventHandler('elevator:renameElevator', function(elevatorId, newName)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    -- if xPlayer.getGroup() ~= 'admin' and xPlayer.getGroup() ~= 'superadmin' then
    --     xPlayer.showNotification("Vous n'avez pas les permissions nécessaires.")
    --     return
    -- end

    MySQL.Async.execute('UPDATE elevators SET name = @name WHERE id = @id', {
        ['@name'] = newName,
        ['@id'] = elevatorId
    }, function(rowsChanged)
        if rowsChanged > 0 then
            if Elevators[elevatorId] then
                Elevators[elevatorId].name = newName
                TriggerClientEvent('elevator:syncElevators', -1, Elevators)
                xPlayer.showNotification("Ascenseur renommé avec succès ;")
            end
        else
            xPlayer.showNotification("Erreur lors du renommage de l'ascenseur ")
        end
    end)
end)