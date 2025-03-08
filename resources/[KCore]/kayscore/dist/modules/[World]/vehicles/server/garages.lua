Garages = {
    my_garage = {
        VehiclesList = {},
        PaidGarage = {},
        VehiclesGroupList = {},
        VehiclesEntrepriseList = {},
        SortedVehicle = {},
        RateLimit = {},
    },

    garage_data = {
        garages = {},
        data = {},
        positions = {},
    },

    fuels = {},

    vehicles = {},
    my_vehicles = {},
}
ESX.RegisterServerCallback('kayscore:vehicles:getCustom', function(source, cb, plate)
    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function(result)
        if result[1] then
            local custom = json.decode(result[1].vehicle)
            cb(custom)
        else
            cb({})
        end

        end)
end)
function Garages:load()
    Wait(2000)

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles', {}, function(result)
        local vehiclesCount = 0

        for k,v in pairs(result) do
            table.insert(Garages.vehicles, v)

            vehiclesCount += 1
        end

    end)
end

function Garages:loadWithPlayerUniqueID(UniqueID)
    Wait(1000)

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner', {
        ['@owner'] = UniqueID
    }, function(result)
        
        for k,v in pairs(Garages.vehicles) do
            if tonumber(v.owner) == tonumber(UniqueID) or tostring(v.owner) == tostring(UniqueID) then
                table.remove(Garages.vehicles, k)
            end
        end

        local vehiclesCount = 0

        for k,v in pairs(result) do
            table.insert(Garages.vehicles, v)

            vehiclesCount += 1
        end

        ESX.toConsole(('^3%s^0 vehicles loaded for player'):format(vehiclesCount))
    end)
end

function Garages:selectALL()

    Wait(2000)

    MySQL.Async.fetchAll('SELECT * FROM garages', {}, function(garage)

        if json.encode(garage) == '[]' then 
            ESX.toConsole('Failed to load garages')
            goto continue
        end

        local garagesCount = 0

        for k,v in pairs(garage) do

            Garages.garage_data.garages[v.id] = {
                id = v.id,
                name = v.name,
                label = v.label,
                type = v.type,

                defaultpos = json.decode(v.defaultpos),
                deletepos = json.decode(v.deletepos),
                spawnpos = json.decode(v.spawnpos),
                headingspawnpos = v.headingspawnpos,
                activeblip = v.activeblip
            }

            garagesCount += 1
        end


        ::continue::
    end)
end

function Garages:CreateVeh(src, nameSpawn, plate, vehicleProperties, position, heading)

    local failed = false

    local vehicleId = CreateVehicle(nameSpawn, position.x , position.y, position.z, heading, true, false)

     if DoesEntityExist(vehicleId) then
         ESX.toConsole(('Failed to spawn %s %s %s %s %s'):format(nameSpawn, plate, vehicleProperties, position, heading))
         return
     end

    local failedAttempt = 0
    while not DoesEntityExist(vehicleId) do
        Citizen.Wait(200) 
        failedAttempt = failedAttempt + 1
        if failedAttempt > 20 then
             ESX.toConsole(('Failed to spawn %s %s %s %s %s'):format(nameSpawn, plate, vehicleProperties, position, heading))

            return
        end

        failed = true
    end

    TaskWarpPedIntoVehicle(src, vehicleId, -1)

    return vehicleId, NetworkGetNetworkIdFromEntity(vehicleId)
end

local sss = {}



ESX.RegisterServerCallback('kayscore:garages:checkIfIsBoutique', function(source, cb, plate)
    local source = source

    --print('plate >>>', plate)

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate', { ['@plate'] = plate }, function(result)
        if result[1] == nil then return cb(false) end

        for k,v in pairs(result) do
           -- print('boutique >>>', v.boutique)
            if v.boutique == 1  or v.boutique then
                cb(true)
            else
                cb(false)
            end
        end
    end)
end)

RegisterNetEvent('kayscore:garages:sortVehicle', function(vehicles, veh, defaultpos, defautheading, plate, garageid, typee)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if not sss[xPlayer.UniqueID] then
        sss[xPlayer.UniqueID] = {}
    end

    if Garages.my_garage.SortedVehicle[plate] ~= nil then
        if DoesEntityExist(Garages.my_garage.SortedVehicle[plate].vehicleId) then
            return TriggerClientEvent('esx:showNotification', source, 'Ce véhicule est déjà sur la map')
        else
            if typee == 'pound' then
                if not exports['kayscore']:haveVip(xPlayer.UniqueID) then
                    if xPlayer.getAccount('cash').money >= 500 then
                        xPlayer.removeAccountMoney('cash', 500)
                        TriggerClientEvent('esx:showNotification', source, 'Vous avez payé la fourrière ~g~500$~s~')
                    elseif xPlayer.getAccount('bank').money >= 500 then
                        xPlayer.removeAccountMoney('bank', 500)
                        TriggerClientEvent('esx:showNotification', source, 'Vous avez payé la fourrière ~g~500$~s~')
                    else
                        return TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez pas assez d\'argent sur vous ou en banque~s~')
                    end
                else
                    TriggerClientEvent('esx:showNotification', source, 'Vous êtes ~b~Diamond~s~, la fourrière est ~b~gratuite.')
                end
            end
            Garages.my_garage.SortedVehicle[plate] = nil
        end
    end

    sss[xPlayer.UniqueID].vehicleId, sss[xPlayer.UniqueID].netId = Garages:CreateVeh(source, vehicles, plate, veh, vector3(defaultpos.x, defaultpos.y, defaultpos.z), tonumber(defautheading))

    if not Garages.my_garage.SortedVehicle[plate] then
        Garages.my_garage.SortedVehicle[plate] = {}
        Garages.my_garage.SortedVehicle[plate].vehicleId = sss[xPlayer.UniqueID].vehicleId
        Garages.my_garage.SortedVehicle[plate].vehiclePlate = plate
    else
        Garages.my_garage.SortedVehicle[plate].vehicleId = sss[xPlayer.UniqueID].vehicleId
    end

    TriggerClientEvent('kayscore:garages:setvehicleProperties', source, sss[xPlayer.UniqueID].netId, veh, sss[xPlayer.UniqueID].vehicleId, veh.plate)

    TriggerClientEvent('esx:showNotification', source, '✅ Véhicule sorti avec succès')
end)


ESX.RegisterServerCallback('kayscore:garages:checkPlateInMap', function(source, cb, plate)
    if not Garages.my_garage.SortedVehicle[plate] then cb(true) return end

    if Garages.my_garage.SortedVehicle[plate] and DoesEntityExist(Garages.my_garage.SortedVehicle[plate].vehicleId) then
        cb(false)
    else
        cb(true)
    end
end)

RegisterNetEvent('main:garages:syncEntityId', function(plate, entityId)
    Garages.my_garage.SortedVehicle[plate].vehicleId = entityId
end)

function Garages:refresh()
    Wait(500)
    TriggerClientEvent('kayscore:garage:refresh', -1, Garages.garage_data.garages)
end

CreateThread(function()
    Garages:selectALL()
    Garages:load()
end)

RegisterNetEvent('kayscore:garage:load', function()
    local source = source
    Wait(5000)
    TriggerClientEvent('kayscore:garage:refresh', source, Garages.garage_data.garages)
end)

RegisterNetEvent('kayscore:garage:create', function(name, label, type, defaultpos, deletepos, spawnpos, headingspawnpos, activeblip)
    local source = source

    MySQL.Async.execute('INSERT INTO garages (name, label, type, defaultpos, deletepos, spawnpos, headingspawnpos, activeblip) VALUES (@name, @label, @type, @defaultpos, @deletepos, @spawnpos, @headingspawnpos, @activeblip)', {
        ['@name'] = name,
        ['@label'] = label,
        ['@defaultpos'] = json.encode(defaultpos),
        ['@deletepos'] = json.encode(deletepos),
        ['@spawnpos'] = json.encode(spawnpos),
        ['@headingspawnpos'] = headingspawnpos,
        ['@activeblip'] = activeblip,
        ['@type'] = type,
    }, function()
        Garages:selectALL()
        Garages:refresh()
    end)
end)

RegisterNetEvent('kayscore:garage:edit', function(id, Table)
    local source = source

    MySQL.Async.execute('UPDATE garages SET name = @name, label = @label, defaultpos = @defaultpos, deletepos = @deletepos, spawnpos = @spawnpos, headingspawnpos = @headingspawnpos, activeblip = @activeblip WHERE id = @id', {['@id'] = id, ['@name'] = Table.name, ['@label'] = Table.label, ['@defaultpos'] = json.encode(Table.defaultpos), ['@deletepos'] = json.encode(Table.deletepos), ['@spawnpos'] = json.encode(Table.spawnpos), ['@headingspawnpos'] = Table.headingspawnpos, ['@activeblip'] = Table.activeblip}, function()
        Garages.garage_data.garages[id] = {
            id = id,
            name = Table.name,
            label = Table.label,
            type = Table.type,

            defaultpos = Table.defaultpos,
            deletepos = Table.deletepos,
            spawnpos = Table.spawnpos,
            headingspawnpos = Table.headingspawnpos,
            activeblip = Table.activeblip
        }
        Wait(100)
        Garages:refresh()
    end)
end)

RegisterNetEvent('kayscore:garages:edit:blips', function(value, id)
    TriggerClientEvent('kayscore:garages:edit:blips', -1, value, id)
end)

ESX.RegisterServerCallback('kayscore:garage:myvehicle', function(source, cb)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    Garages.my_garage.VehiclesList[xPlayer.UniqueID] = {}

    TriggerClientEvent('esx:showNotification', source, 'Récupération des vos véhicules en cours...')

    Wait(400)

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner', { ['@owner'] = xPlayer.getUniqueID() }, function(result)
        for k,v in pairs(result) do
            table.insert(Garages.my_garage.VehiclesList[xPlayer.UniqueID], v)
            Garages.fuels[v.plate] = v.fuel
        end
        cb(Garages.my_garage.VehiclesList[xPlayer.UniqueID])
    end)
end)

ESX.RegisterServerCallback('kayscore:garage:myvehicle_group', function(source, cb)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    Garages.my_garage.VehiclesGroupList[xPlayer.getJob2().name] = {}

    TriggerClientEvent('esx:showNotification', source, 'Récupération des vos véhicules en cours...')

    Wait(400)

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner', { ['@owner'] = xPlayer.getJob2().name}, function(result)
        for k,v in pairs(result) do
            table.insert(Garages.my_garage.VehiclesGroupList[xPlayer.getJob2().name], v)
            Garages.fuels[v.plate] = v.fuel
        end
        cb(Garages.my_garage.VehiclesGroupList[xPlayer.getJob2().name])
    end)
end)

ESX.RegisterServerCallback('kayscore:garage:myvehicle_entreprise', function(source, cb)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    Garages.my_garage.VehiclesEntrepriseList[xPlayer.getJob().name] = {}

    TriggerClientEvent('esx:showNotification', source, 'Récupération des vos véhicules en cours...')

    Wait(400)

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner', { ['@owner'] = xPlayer.getJob().name}, function(result)
        for k,v in pairs(result) do
            table.insert(Garages.my_garage.VehiclesEntrepriseList[xPlayer.getJob().name], v)
            Garages.fuels[v.plate] = v.fuel
        end
        cb(Garages.my_garage.VehiclesEntrepriseList[xPlayer.getJob().name])
    end)
end)



ESX.RegisterServerCallback("kayscore:garage:getType", function(source, cb, plate, properties)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate', { ['@plate'] = plate }, function(result)
        for k,v in pairs(result) do
            if tonumber(v.owner) == xPlayer.UniqueID or v.owner == xPlayer.getJob().name or v.owner == xPlayer.getJob2().name or v.owner == xPlayer.UniqueID or tostring(v.owner) == tostring(xPlayer.UniqueID) or v.owner == tostring(xPlayer.UniqueID) or tonumber(v.owner) == tonumber(xPlayer.UniqueID) then
                for k,v in pairs(result) do
                    if v.type == 'car' then
                        cb('car')
                    elseif v.type == 'boat' then
                        cb('boat')
                    elseif v.type == 'aircraft' then
                        cb( 'aircraft')
                    end
                end
            else
                cb(false)
            end
        end
    end)
end)
RegisterNetEvent('kayscore:garages:my_vehicles:setmygroup', function(plate, job)
    local source = source

    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end
    MySQL.Async.execute('UPDATE owned_vehicles SET owner = @owner WHERE plate = @plate', {
        ['@plate'] = plate,
        ['@owner'] = job
    }, function()
        TriggerClientEvent('esx:showNotification', source, 'Votre véhicule a bien été attribué à votre group illégal')
    end)
end)

RegisterNetEvent('kayscore:garages:my_vehicles:setmyentreprise', function(plate, job)
    local source = source

    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end
    MySQL.Async.execute('UPDATE owned_vehicles SET owner = @owner WHERE plate = @plate', {
        ['@plate'] = plate,
        ['@owner'] = job
    }, function()
        TriggerClientEvent('esx:showNotification', source, 'Votre véhicule a bien été attribué à votre entreprise')
    end)
end)

RegisterNetEvent('kayscore:garage:state', function(plate, value, type, id, properties)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if value then
        if Garages.my_garage.SortedVehicle[plate] then
            Garages.my_garage.SortedVehicle[plate] = nil
        end
    end

    if properties ~= false then
        if value then
            MySQL.Async.execute('UPDATE owned_vehicles SET state = @state, garageid = @garageid, propertiesID = @propertiesID, vehicle = @vehicle WHERE plate = @plate', {
                ['@state'] = value,
                ['@plate'] = plate,
                ['@garageid'] = id,
                ['@propertiesID'] = 0,
                ['@vehicle'] = json.encode(properties)
            }, function()
                for k,v in pairs(Garages.vehicles) do
                    if tostring(v.plate) == tostring(plate) then
                        if Garages.vehicles[k] then
                            Garages.vehicles[k].state = value
                            Garages.vehicles[k].garageid = id
                            Garages.vehicles[k].vehicle = json.encode(properties)
                        end
                    end
                end
                 local owner = nil
                 for k,v in pairs(Garages.vehicles) do
                     if tostring(v.plate) == tostring(plate) then
                        owner = v.owner
                     end
                 end
                 Garages:loadWithPlayerUniqueID(owner)
            end)
        else
            MySQL.Async.execute('UPDATE owned_vehicles SET state = @state, garageid = @garageid, propertiesID = @propertiesID, vehicle = @vehicle WHERE plate = @plate', {
                ['@state'] = value,
                ['@plate'] = plate,
                ['@garageid'] = id,
                ['@propertiesID'] = 0,
                ['@vehicle'] = json.encode(properties)
            }, function()
                for k,v in pairs(Garages.vehicles) do
                    if tostring(v.plate) == tostring(plate) then
                        if Garages.vehicles[k] then
                            Garages.vehicles[k].state = value
                            Garages.vehicles[k].garageid = id
                            Garages.vehicles[k].vehicle = json.encode(properties)
                        end
                    end
                end
                 local owner = nil
                 for k,v in pairs(Garages.vehicles) do
                     if tostring(v.plate) == tostring(plate) then
                         owner = v.owner
                     end
                end
                 Garages:loadWithPlayerUniqueID(owner)
            end)
        end
    else
        if value then
            MySQL.Async.execute('UPDATE owned_vehicles SET state = @state, garageid = @garageid, propertiesID = @propertiesID WHERE plate = @plate', {
                ['@state'] = value,
                ['@plate'] = plate,
                ['@garageid'] = id,
                ['@propertiesID'] = 0,
            }, function()
                for k,v in pairs(Garages.vehicles) do
                    if tostring(v.plate) == tostring(plate) then
                        if Garages.vehicles[k] then
                            Garages.vehicles[k].state = value
                            Garages.vehicles[k].garageid = id
                            Garages.vehicles[k].vehicle = json.encode(properties)
                        end
                    end
                end
                 local owner = nil
                 for k,v in pairs(Garages.vehicles) do
                     if tostring(v.plate) == tostring(plate) then
                         owner = v.owner
                     end
                 end
                 Garages:loadWithPlayerUniqueID(owner)
            end)
        else
            MySQL.Async.execute('UPDATE owned_vehicles SET state = @state, garageid = @garageid, propertiesID = @propertiesID WHERE plate = @plate', {
                ['@state'] = value,
                ['@plate'] = plate,
                ['@garageid'] = id,
                ['@propertiesID'] = 0,
            }, function()
                for k,v in pairs(Garages.vehicles) do
                    if tostring(v.plate) == tostring(plate) then
                        if Garages.vehicles[k] then
                            Garages.vehicles[k].state = value
                            Garages.vehicles[k].garageid = id
                            Garages.vehicles[k].vehicle = json.encode(properties)
                        end
                    end
                end
                 local owner = nil
                 for k,v in pairs(Garages.vehicles) do
                     if tostring(v.plate) == tostring(plate) then
                         owner = v.owner
                     end
                 end
                 Garages:loadWithPlayerUniqueID(owner)
            end)
        end
    end
end)

ESX.RegisterServerCallback('kayscore:garage:paidPound', function(source, cb)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getAccount('cash').money >= 500 then
        xPlayer.removeAccountMoney('cash', 500)
        TriggerClientEvent('esx:showNotification', source, 'Vous avez payer la fourrière ~g~500$~s~')
        cb(true)
    elseif xPlayer.getAccount('bank').money >= 500 then
        xPlayer.removeAccountMoney('bank', 500)
        TriggerClientEvent('esx:showNotification', source, 'Vous avez payer la fourrière ~g~500$~s~')
        cb(true)
    else
        cb(false)
        return TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez pas assez d\'argent sur vous ou en bank~s~')
    end
end)

RegisterNetEvent('kayscore:garage:delete', function(id)
    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE garageid = @garageid', {['@garageid'] = id}, function(result)
        for k,v in pairs(result) do
            MySQL.Async.execute('UPDATE owned_vehicles SET garageid = @garageid WHERE plate = @plate', {['@garageid'] = 1, ['@plate'] = v.plate}, function()
            end)
        end
    end)
    MySQL.Async.execute('DELETE FROM garages WHERE id = @id', { ['@id'] = id }, function()
        Garages.garage_data.garages[id] = nil
        Wait(100)
        Garages:refresh()
    end)
end)

ESX.RegisterServerCallback('kayscore:garage:getInfoPlayer', function(source, cb, uniqueid)
    if source == nil and cb == nil and uniqueid == nil then goto continue end
    local source = source
    local UniqueIdInfo = {}

    MySQL.Async.fetchAll('SELECT * FROM users WHERE UniqueID = @UniqueID', { ['@UniqueID'] = uniqueid}, function(rs)
        if rs[1] == nil then return TriggerClientEvent('esx:showNotification', source, ('Aucun joueurs portant l\'uniqueID %s n\'a pue être trouvé'):format(uniqueid)) end

        MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner', { ['@owner'] = uniqueid }, function(result)
            if result[1] == nil then return TriggerClientEvent('esx:showNotification', source, ('Aucun joueurs portant l\'uniqueID %s n\'a pue être trouvé'):format(uniqueid)) end

            for i,p in pairs(result) do
                p.ownerName = rs[1].playerName or '**Invalid**'
                table.insert(UniqueIdInfo, p)
            end

            cb(UniqueIdInfo)
        end)
    end)

    ::continue::
end)

ESX.RegisterServerCallback('kayscore:garage:getInfoEntreprise', function(source, cb, uniqueid)
    local source = source
    local UniqueIdInfo = {}

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner', { ['@owner'] = uniqueid }, function(result)
        for i,p in pairs(result) do
            table.insert(UniqueIdInfo, p)
        end

        cb(UniqueIdInfo)
    end)
end)

RegisterNetEvent('kayscore:garages:renamemy_vehicle', function(plate, newName)
    local source = source

    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    MySQL.Async.execute('UPDATE owned_vehicles SET label = @label WHERE plate = @plate', {
        ['@plate'] = plate,
        ['@label'] = newName
    }, function()
        TriggerClientEvent('esx:showNotification', source, '✅ Véhicule renommer avec succès')
    end)

    if Garages.my_vehicles[xPlayer.UniqueID] then
        for k,v in pairs(Garages.my_vehicles[xPlayer.UniqueID]) do
            if tostring(v.plate) == tostring(plate) or v.plate == plate then
                Garages.my_vehicles[xPlayer.UniqueID][k].label = newName
            end
        end
    end

    for k,v in pairs(Garages.vehicles) do
        if tostring(v.plate) == tostring(plate) or v.plate == plate then
            Garages.vehicles[k].label = newName
        end
    end
end)

RegisterNetEvent('kayscore:garages:attribuevehiculetosociety', function(plate, label, type, vehicleProps, s)
    local source = source

    MySQL.Async.execute('INSERT INTO owned_vehicles (owner, state, plate, vehicle, label, type, job, garageid, boutique) VALUES (@owner, @state, @plate, @vehicle, @label, @type, @job, @garageid, @boutique)', {
        ['@owner'] = s,
        ['@state'] = 1,
        ['@plate']  = plate,
        ['@vehicle'] = json.encode(vehicleProps),
        ['@label'] = label,
        ['@type'] = type,
        ['@job'] = 'unemployed',
        ['@garageid'] = type == 'car' and 1 or type == 'boat' and  3 or type == 'aircraft' and 2,
        ['@boutique'] = 0,
    }, function()
        TriggerClientEvent('esx:showNotification', source, ('✅ Véhicule attribué à ~r~%s~s~ avec succès'):format(s))

        Garages:load()
        Garages:refresh()
    end) 
end)

RegisterNetEvent('kayscore:garages:delVeh', function(plate)
    local source = source

    MySQL.Async.execute('DELETE FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function()
        TriggerClientEvent('esx:showNotification', source, 'Véhicule supprimé avec succès')

        for k,v in pairs(Garages.vehicles) do
            if tostring(v.plate) == tostring(plate) then
                table.remove(Garages.vehicles, k)
            end
        end
    end)
end)

local token = 0
AddEventHandler('esx:PlayerLoaded', function(source)

    token = Math.random(100000, 999999)
    TriggerClientEvent('kayscore:garage:retreive:token', source)
end)

RegisterNetEvent('kayscore:garages:fix:neon', function (vehicle, clToken)
    local source = source

    if clToken == token then
        local plate = vehicle.plate

        MySQL.Async.execute('UPDATE owned_vehicles SET vehicle = @vehicle WHERE plate = @plate', {
            ['@vehicle'] = vehicle,
            ['@plate'] = plate
        }, function()
            TriggerClientEvent('esx:showNotification', source, 'Néon modifié avec succès')
        end)
    else
      --  TriggerClientEvent('esx:showNotification', source, "T'essaye de cheat ?")
    end
end)