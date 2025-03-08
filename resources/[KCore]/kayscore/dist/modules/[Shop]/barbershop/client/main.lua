Citizen.CreateThread(function()
    while ESX == nil do Wait(1) end

    local positions = {
        {pos = vector3(216.77,-1545.06,29.28)}
    }

    for k,v in pairs(positions) do
        AddZones(("makeup_%s"):format(k), {
            Position = vector3(v.pos.x, v.pos.y, v.pos.z+0.60),
            Dist = 10,
            Public = true,
            Job = nil,
            Job2 = nil,
            GradesJobRequire = false,
            GradesJob = {},
            InVehicleDisable = true,
            Blip = {
                Active = false,
            },
            ActionText =('Appuyez sur [ %sE~w~ ] pour intéragir'):format(UTILS.COLORCODE),
            marker = true,
            Action = function()
                TriggerEvent('ui:makeup:open')
            end
        })

        ESX.addBlips({
            name = ("Salon de Maquillage %s"):format(k),
            label = 'Salon de Maquillage',
            category = nil,
            position = vector3(v.pos.x, v.pos.y, v.pos.z),
            sprite = 71,
            display = 4,
            scale = 0.5,
            color = 21,
        })
    end
end)

Citizen.CreateThread(function()
    while ESX == nil do Wait(1) end

    local positions = {
        {pos = vector3(-814.3, -183.8, 37.0)},
        {pos = vector3(136.8, -1708.4, 28.0)},
        {pos = vector3(-1282.6, -1116.8, 6.0)},
        {pos = vector3(1931.5, 3729.7, 32.0)},
        {pos = vector3(1212.8, -472.9, 65.0)},
        {pos = vector3(-32.9, -152.3, 56.0)},
        {pos = vector3(-278.1, 6228.5, 31.0)}
    }

    for k,v in pairs(positions) do
        AddZones(("barbershop_%s"):format(k), {
            Position = vector3(v.pos.x, v.pos.y, v.pos.z+0.60),
            Dist = 10,
            Public = true,
            Job = nil,
            Job2 = nil,
            GradesJobRequire = false,
            GradesJob = {},
            InVehicleDisable = true,
            Blip = {
                Active = false,
            },
            ActionText =('Appuyez sur [ %sE~w~ ] pour intéragir'):format(UTILS.COLORCODE),
            marker = true,
            Action = function()
                TriggerEvent('ui:hairs:open')
            end
        })

        ESX.addBlips({
            name = ("Salon de Coiffure %s"):format(k),
            label = 'Salon de Coiffure',
            category = nil,
            position = vector3(v.pos.x, v.pos.y, v.pos.z),
            sprite = 71,
            display = 4,
            scale = 0.5,
            color = 21,
        })
    end
end)