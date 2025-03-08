local event = {}
local props = {}
local on = false

secured_RegisterNetEvent('kayscore:autoEvent:start', function(data)
    ESX.addBlips({
        name = ('event_van_%s'):format(data.position),
        label = 'Fourgon Blindé',
        position = data.position,
        sprite = 67,
        display = 4,
        scale = 1.0,
        color = 75,
        type = "blip_events",
        disableShortRange = true
    })

    ESX.Game.SpawnLocalVehicle(GetHashKey('stockade'), data.position, 90.0, function(vehicle)
        event[data.position] = {
            entity = vehicle,
            on = true,
            interval = 2000,
            time = 300,
            drawNotification = function(msg, coords)
                ESX.ShowFloatingHelpNotification(msg, coords)
            end
        }
        
        Wait(2000)
        FreezeEntityPosition(vehicle, true)
        SetVehicleEngineOn(vehicle, false, false, false)
        SetVehicleDoorsLocked(vehicle, true)

        CreateThread(function()
            while event[data.position].on do
                Wait(event[data.position].interval)
                event[data.position].interval = 1000

                local playerCoords = GetEntityCoords(PlayerPedId())
                local dist = #(playerCoords - data.position)

                event[data.position].time = event[data.position].time - 1

                if dist > 25 then
                    exports['ui']:hideInfo()
                else
                    local vehicleHealth = GetEntityHealth(vehicle)
                    local finalHealth = vehicleHealth * 1000

                    exports['ui']:drawInfo('Informations Van', {
                        {title = 'Temps', subtitle = tostring(event[data.position].time)},
                        {title = 'Dégats', subtitle = tostring(finalHealth)},
                    })

                    if finalHealth <= 0 then
                        secured_TriggerServerEvent('kayscore:autoEvent:broke', data)
                        event[data.position].on = false
                        exports['ui']:hideInfo()
                    elseif event[data.position].time <= 0 then
                        secured_TriggerServerEvent('kayscore:autoEvent:stop', data.position)
                    end
                end

                if not event[data.position].on then
                    break
                end
            end
        end)

        CreateThread(function()
            while event[data.position].on do
                Wait(event[data.position].interval)
                event[data.position].interval = 2000

                local playerCoords = GetEntityCoords(PlayerPedId())
                local dist = #(playerCoords - data.position)

                if dist <= 15 then
                    event[data.position].interval = 1
                    event[data.position].drawNotification('Casser le véhicule !', data.position)
                end

                if not event[data.position].on then
                    break
                end
            end
        end)
    end)
end)

secured_RegisterNetEvent('kayscore:autoEvent:broke', function(data)
    secured_TriggerServerEvent('kayscore:autoEvent:secondBroke', data)
end)

secured_RegisterNetEvent('kayscore:autoEvent:secondBroke', function(data)
    for k, v in pairs(data.reward) do
        ESX.Game.SpawnLocalObject('prop_large_gold_alt_c', vector3(v.pos.x, v.pos.y, v.pos.z - 0.98), function(obj)
            FreezeEntityPosition(obj, true)
            table.insert(props, {
                obj = obj,
                coords = GetEntityCoords(obj),
                money = v.money
            })
        end)
    end

    on = true

    CreateThread(function()
        local interval = 2000
        while on do
            Wait(interval)
            interval = 2000

            for k, v in pairs(props) do
                local playerCoords = GetEntityCoords(PlayerPedId())
                local objCoords = v.coords
                local dist = #(playerCoords - vector3(objCoords.x, objCoords.y, objCoords.z))

                if dist <= 2 then
                    interval = 1
                    DrawInstructionBarNotification(objCoords.x, objCoords.y, objCoords.z, '[E] pour ramasser les lingôts')

                    if IsControlJustPressed(0, 54) then
                        ExecuteCommand("e pickup")
                        secured_TriggerServerEvent('kayscore:autoEvent:take', v.obj, k, v.money)
                    end
                end
            end

            if not on then
                break
            end
        end
    end)

    CreateThread(function()
        local interval2 = 2000
        while on do
            Wait(interval2)
            interval2 = 2000

            local playerCoords = GetEntityCoords(PlayerPedId())
            local dst = #(playerCoords - data.position)

            if dst > 25 then
                exports['ui']:hideInfo()
            else
                interval2 = 1

                exports['ui']:drawInfo('Informations Van', {
                    {title = 'Objets restants', subtitle = tostring(#props)},
                })

                if #props <= 0 then
                    ExecuteCommand("e pickup")
                    secured_TriggerServerEvent('kayscore:autoEvent:stop', data.position)
                end
            end

            if not on then
                break
            end
        end
    end)
end)

secured_RegisterNetEvent('kayscore:autoEvent:take', function(obj, k)
    for i, v in pairs(props) do
        if i == k then
            DeleteObject(v.obj)
            table.remove(props, i)
            break
        end
    end

    DeleteObject(obj)

    if #props <= 0 then
        on = false
    end
end)

secured_RegisterNetEvent('kayscore:autoEvent:stop', function(position)
    exports['ui']:hideInfo()
    DeleteEntity(event[position].entity)
    ESX.removeBlip(("event_van_%s"):format(position))
    event[position] = nil
end)

