Properties.garage = {
    count = {},
    count2 = {},
    loaded = {},
    loaded2 = {},
    loaded3 = {},
    value1 = {},
    interior = {
        ["garage2"] = {
            label = "Garage 2 places",
            max = 2,
            interior = vector3(179.0916, -1002.121, -98.9999),
            position = {
                {pos = vector3(171.0394, -1003.011, -99.42449), heading = 180.79985046387},
                {pos = vector3(175.1755, -1002.846, -99.42455), heading = 178.6955871582},
            }
        },
        -- ["garage6"] = {
        --     label = "Garage 6 places",
        --     interior = vector3(206.6894, -999.0654, -98.99989),
        --     max = 6,
        --     position = {
        --         {pos = vector3(194.408, -1004.851, -99.42418), heading = 270.47576904297},
        --         {pos = vector3(194.5036, -1001.007, -99.42425), heading = 271.66897583008},
        --         {pos = vector3(194.4164, -997.3073, -99.42166), heading = 270.88955688477},
        --         {pos = vector3(202.9585, -1004.814, -99.42412), heading = 90.237487792969},
        --         {pos = vector3(202.7753, -1000.916, -99.4239), heading = 91.076049804688},
        --         {pos = vector3(202.8017, -996.7482, -99.42432), heading = 92.65860748291},
        --     }
        -- },
        ["garage12"] = {
            label = "Garage 12 places",
            interior = vector3(238.0304, -1004.904, -98.99994),
            max = 12,
            position = {
                {pos = vector3(224.724, -1004.476, -99.5338), heading = 270.46740722656},
                {pos = vector3(224.5646, -1000.681, -99.53409), heading = 269.66558837891},
                {pos = vector3(224.6687, -996.7853, -99.53432), heading = 268.95376586914},
                {pos = vector3(224.3766, -992.6675, -99.53409), heading = 269.87176513672},
                {pos = vector3(224.3437, -988.6862, -99.53403), heading = 270.32437133789},
                {pos = vector3(224.2545, -984.5372, -99.53416), heading = 270.06539916992},
                {pos = vector3(224.0604, -980.564, -99.53407), heading = 271.43188476563},
                {pos = vector3(233.1555, -1000.58, -99.53432), heading = 90.491760253906},
                {pos = vector3(233.1068, -996.5477, -99.53429), heading = 89.491836547852},
                {pos = vector3(233.0708, -992.5869, -99.53405), heading = 89.463066101074},
                {pos = vector3(233.0854, -988.4893, -99.53351), heading = 91.00146484375},
                {pos = vector3(232.8894, -984.677, -99.53422), heading = 91.101722717285},
            }
        },
        ["garage15"] = {
            label = "Garage 15 places",
            interior = vector3(-1065.465, -85.92764, -90.19995),
            max = 15,
            position = {
                {pos = vector3(-1065.432, -66.25438, -99.53397), heading = 358.23248291016},
                {pos = vector3(-1065.635, -74.29845, -99.53375), heading = 0.10303158313036},
                {pos = vector3(-1065.615, -81.19693, -99.53407), heading = 90.554016113281},
                {pos = vector3(-1079.253, -68.16116, -99.53402), heading = 270.97424316406},
                {pos = vector3(-1079.7, -74.7636, -99.534), heading = 179.72177124023},
                {pos = vector3(-1079.62, -83.37579, -99.534), heading = 181.39147949219},
                {pos = vector3(-1065.409, -74.03681, -95.13412), heading = 0.93958550691605},
                {pos = vector3(-1065.528, -66.28987, -95.134), heading = 0.87969946861267},
                {pos = vector3(-1065.528, -81.30987, -95.13416), heading = 90.407981872559},
                {pos = vector3(-1079.672, -74.27692, -95.13392), heading = 359.36486816406},
                {pos = vector3(-1079.759, -82.12307, -95.13363), heading = 359.36520385742},
                {pos = vector3(-1079.549, -68.02269, -95.13411), heading = 270.14105224609},
                {pos = vector3(-1079.71, -68.176, -90.73426), heading = 270.18212890625},
                {pos = vector3(-1079.785, -74.67483, -90.733), heading = 0.36404064297676},
                {pos = vector3(-1079.736, -82.26862, -90.73345), heading = 0.37822380661964},
            }
        },
    },
    self_vehicle = {},
    self_garage = {}
}

function Properties.garage:self_vehicle(propertiesID)
    Properties.garage.loaded[propertiesID] = false
    Properties.VehicleProperties[propertiesID] = {}
    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE propertiesID = @propertiesID', {
        ['@propertiesID'] = propertiesID
    }, function(result)
        for k,v in pairs(result) do 
            if v.state == 0 or v.state == false then goto continue end

            vehicle = json.decode(v.vehicle)

            table.insert(Properties.VehicleProperties[propertiesID], {
                all = v,
                model = vehicle.model,
                data = v.vehicle    
            })

            ::continue::
        end

        Properties.garage.loaded[propertiesID]  = true

    end)

    while not Properties.garage.loaded[propertiesID]  do Wait(1) end

    if Properties.garage.loaded[propertiesID]  then
        return true, Properties.VehicleProperties[propertiesID]
    end
end

function Properties.garage:self_vehicle_update(propertiesID, plate, state, vehicleProperties, xPlayer)
    Properties.garage.loaded2[propertiesID] = false
    if vehicleProperties ~= nil then
        MySQL.Async.execute('UPDATE owned_vehicles SET propertiesID = @propertiesID, state = @state, vehicle = @vehicle WHERE plate = @plate', {
            ['@plate'] = plate,
            ['@propertiesID'] = propertiesID,
            ['@state'] = 1,
            ['@vehicle'] = json.encode(vehicleProperties)
        }, function()
            Properties.garage.loaded2[propertiesID] = true
        end)
    else
        MySQL.Async.execute('UPDATE owned_vehicles SET state = @state, propertiesID = @propertiesID WHERE plate = @plate', {
            ['@plate'] = plate,
            ['@state'] = 0,
            ['@propertiesID'] = 0,
        }, function()
            Properties.garage.loaded2[propertiesID] = true
        end)
    end

    while not Properties.garage.loaded2[propertiesID] do Wait(1) end

    if Garages.my_vehicles[xPlayer.UniqueID] then
        for k,v in pairs(Garages.my_vehicles[xPlayer.UniqueID]) do
            if tostring(v.plate) == tostring(plate) then
                v.state = state
            end
        end
    end

    for k,v in pairs(Garages.vehicles) do
        if tostring(v.plate) == tostring(plate) then
            v.state = state

        end
    end

    return true
end

function Properties.garage:self_garage_place(src, owner, propertiesID)
    Properties.garage.value1[propertiesID] = true
    Properties.garage.loaded3[propertiesID] = false
    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE propertiesID = @propertiesID', {
        ['@propertiesID'] = propertiesID
    }, function(result)
        for i=1, #result do
            if i == nil then return end
            if not Properties.garage.interior[Properties.PropertiesList[propertiesID].garageType] then
                TriggerClientEvent('esx:showNotification', src, '🅿️ Votre garage est plein !')
                Properties.garage.value1[propertiesID] = false
                break
            end
            if i >= Properties.garage.interior[Properties.PropertiesList[propertiesID].garageType].max then
                TriggerClientEvent('esx:showNotification', src, '🅿️ Votre garage est plein !')
                Properties.garage.value1[propertiesID] = false
                break
            end

            i += 1
        end

        Properties.garage.loaded3[propertiesID] = true
    end)

    while not Properties.garage.loaded3[propertiesID] do Wait(1) end

    return Properties.garage.value1[propertiesID]
end

RegisterNetEvent('kayscore:properties:garage:enter', function(p, UniqueID)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then
        -- print("Erreur: xPlayer est nil")
        return
    end

    local garageLoaded, garage = Properties.garage:self_vehicle(p)

    if garageLoaded then
        if not Properties.PropertiesList[p] then
            -- print("Erreur: PropertiesList pour "..tostring(p).." est nil")
            return
        end

        if not Properties.PropertiesList[p].players then
            -- print("Erreur: players dans PropertiesList pour "..tostring(p).." est nil")
            return
        end

        if not Properties.PropertiesList[p].players[tostring(xPlayer.UniqueID)] then
            Properties:addPlayer(source, p)
            Properties:updatePlayers(UniqueID, p, true)
            Properties:DbPlayerSync(p)
        end

        Properties.garage.count[xPlayer.UniqueID] = 0

        TriggerClientEvent('kayscore:properties:loadVehicle', source, Properties.PropertiesList[p], garage)

        local garageType = Properties.PropertiesList[p].garageType
        if not Properties.garage.interior[garageType] then
            -- print("Erreur: interior pour garageType "..tostring(garageType).." est nil")
            return
        end

        local interior = Properties.garage.interior[garageType].interior
        if not interior then
            -- print("Erreur: interior est nil")
            return
        end

        TriggerClientEvent('kayscore:properties:teleport', source, vector3(interior.x, interior.y, interior.z))
    else
        -- print("Erreur: garageLoaded est false ou garage est nil")
    end
end)

RegisterNetEvent('kayscore:properties:garage:exitWithVehicle', function(p, plate)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    Properties.garage.count[xPlayer.UniqueID] += 1

    if Properties.garage.count[xPlayer.UniqueID] > 1 then
        return
    end

    local garageLoaded, garage = Properties.garage:self_vehicle_update(p, plate,0,nil, xPlayer)

    if garageLoaded then
        MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate', {
            ['@plate'] = plate
        }, function(result)

            Properties:addPlayer(source, 0)

            local veh = json.decode(result[1].vehicle)

            TriggerClientEvent('kayscore:properties:garage:exitWithVehicle', source, p, result[1].vehicle, veh.model)

            Wait(5000)
    
            TriggerClientEvent('esx:showNotification', source, ('🚗 Vous avez sorti le véhicule ~y~%s~s~ de votre garage'):format(result[1].label))
    
            Properties.VehicleProperties[p] = {}

            Properties:updatePlayers(xPlayer.UniqueID,p, false)
            Properties:DbPlayerSync(p)
        end)
    end
end)

ESX.RegisterServerCallback('kayscore:properties:garage:rentVehicle', function(source, cb, propertiesID, plate, vehicleProperties)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function(result)

        if json.encode(result) == '[]' then TriggerClientEvent('esx:showNotification', '❌ Ce véhicule ne vous apartient pas') return cb(false) end

        if result[1] == nil then TriggerClientEvent('esx:showNotification', '❌ Ce véhicule ne vous apartient pas') return cb(false) end

        if tonumber(result[1].owner) ~= xPlayer.UniqueID or result[1] == nil then TriggerClientEvent('esx:showNotification', '❌ Ce véhicule ne vous apartient pas') return cb(false) end

        local garage_place = Properties.garage:self_garage_place(source, xPlayer.UniqueID, propertiesID)

        if garage_place == false then return end

        local garageLoaded, garage = Properties.garage:self_vehicle_update(propertiesID,plate,1,vehicleProperties, xPlayer)

        Properties.garage:self_vehicle_update(propertiesID,plate,1,vehicleProperties, xPlayer)

        if garageLoaded then
            cb(true)

            SetTimeout(5000, function()
                Properties.garage.count2[xPlayer.UniqueID] = 0
            end)
        end
    end)
end)

ESX.RegisterServerCallback('kayscore:properties:garage:exit', function(source, cb, propertiesID)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if Properties.PropertiesList[propertiesID].players[tostring(xPlayer.UniqueID)] then
        Properties.PropertiesList[propertiesID].players[tostring(xPlayer.UniqueID)] = false

        Properties:addPlayer(source, 0)

        Properties:updatePlayers(xPlayer.UniqueID,propertiesID, false)
        Properties:DbPlayerSync(propertiesID)

        cb(true)

        TriggerClientEvent('kayscore:properties:teleport', source, vector3(Properties.PropertiesList[propertiesID].garagePos.x,Properties.PropertiesList[propertiesID].garagePos.y,Properties.PropertiesList[propertiesID].garagePos.z))
    end
end)