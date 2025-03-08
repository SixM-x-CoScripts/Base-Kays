_LIVRAISONS = {
    inLivraisons = false,

    myLivraisons = {},
    levels = 0,
    gains = 0,
    totalLivraisons = 0,
    time = 600,
    vehicle = {},

    vehicleEntity = {},
    blipsEntity = {},
    interval = 0,

    RandomZone, x, y, z = nil, nil, nil, nil,

    Action = function()
        secured_TriggerServerEvent('kayscore:livraisons:dest')
        secured_TriggerServerEvent('kayscore:livraisons:setNewLiv')
    end
}
TimerLivr = true

function _LIVRAISONS.Info(Title, RightText, LeftText)
    local LineCount = #RightText >= #LeftText and #RightText or #LeftText
    if Title ~= nil then
        RenderText("~h~" .. Title .. "~h~", 1350 + 20 + 100, 605, 0, 0.34, 255, 255, 255, 255, 0)
    end
    if RightText ~= nil then
        RenderText(table.concat(RightText, "\n"), 1350 + 20 + 100, 635, 0, 0.28, 255, 255, 255, 255, 0)
    end
    if LeftText ~= nil then
        RenderText(table.concat(LeftText, "\n"), 1350 + 432 + 100, 635, 0, 0.28, 255, 255, 255, 255, 2)
    end
    RenderRectangle(1350 + 10 + 100, 600, 432, Title ~= nil and 50 + (LineCount * 20) or ((LineCount + 1) * 20), 0, 0, 0, 160)
end

function _LIVRAISONS.stop()
    _LIVRAISONS.inLivraisons = false
    _LIVRAISONS.time = 600

    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:loadSkin', skin)

        for k, v in pairs(_LIVRAISONS.blipsEntity) do
            RemoveBlip(v)
            SetBlipRoute(v, 0)
        end

        for k, v in pairs(_LIVRAISONS.vehicleEntity) do
            DeleteEntity(v)
        end
    end)
end

local positions = {
    { pos = vector3(959.2705078125, -1696.7489013672, 29.47169303894), heading = 167.05740356445 },
    { pos = vector3(963.889, -1696.733, 29.59146), heading = 167.05740356445 },
    { pos = vector3(967.539, -1696.896, 29.50144), heading = 167.70121765137 },
}

local coords = vector3(959.2705078125, -1696.7489013672, 29.47169303894)

function _LIVRAISONS.openLivraisonsMenu()
    ESX.TriggerServerCallback('kayscore:livraisons:getLivraisons', function(cb)
        _LIVRAISONS.levels = cb.levels[ESX.PlayerData.UniqueID]
        _LIVRAISONS.gains = cb.gains[ESX.PlayerData.UniqueID]
        _LIVRAISONS.totalLivraisons = cb.totalLivraisons[ESX.PlayerData.UniqueID]
        _LIVRAISONS.vehicle = cb.vehicle[ESX.PlayerData.UniqueID]
    end)

    local main = RageUI.CreateMenu('Livraisons', 'Livraisons Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do
        Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Button(('Votre expérience: %s/500'):format(_LIVRAISONS.levels), nil, { RightLabel = "" }, true, {})
            RageUI.Button(('Vos gains de livraisons: %s/3000$'):format(_LIVRAISONS.gains), nil, { RightLabel = "" }, true, {})
            RageUI.Button(('Vos livraisons effectuées: %s'):format(_LIVRAISONS.totalLivraisons), nil, { RightLabel = "" }, true, {})
            RageUI.Button(('Véhicule de service: %s'):format(table.concat(_LIVRAISONS.vehicle, ", ") or 'Lapin'), nil, { RightLabel = "" }, true, {})
            RageUI.Button('Commencer l\'activité livraison de nourriture', nil, {}, not _LIVRAISONS.inLivraisons, {
                onSelected = function()
                    KeyboardUtils.use('Taper Y pour valider', function(data)
                        if data == 'y' or data == 'Y' then
                            local attempts = 0
                            local notifs = false

                            local function r()
                                Wait(10)
                                attempts = attempts + 1

                                if not ESX.Game.IsSpawnPointClear(coords, 2) then
                                    coords = positions[math.random(1, #positions)].pos
                                end

                                if attempts > 10 then
                                    if not notifs then
                                        notifs = true
                                        ESX.ShowNotification('~r~Vous devez attendre qu\'une place se libère pour que votre véhicule sorte~s~')
                                    end
                                    return false
                                end

                                return ESX.Game.IsSpawnPointClear(coords, 2) or r()
                            end

                            if r() then
                                secured_TriggerServerEvent('kayscore:livraisons:startFoodUber')

                                local model = GetEntityModel(PlayerPedId())
                                if model == `mp_m_freemode_01` then -- homme
                                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                        TriggerEvent('skinchanger:loadClothes', skin, {
                                            ['tshirt_1'] = 15, ['tshirt_2'] = 0,
                                            ['torso_1'] = 772, ['torso_2'] = 0,
                                            ['arms'] = 19,
                                            ['pants_1'] = 43, ['pants_2'] = 0,
                                            ['shoes_1'] = 111, ['shoes_2'] = 0,
                                            ['bags_1'] = 44, ['bags_2'] = 0,
                                            ['helmet_1'] = -1, ['helmet_2'] = 0,
                                        })
                                    end)
                                elseif model == `mp_f_freemode_01` then -- femme
                                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                        TriggerEvent('skinchanger:loadClothes', skin, {
                                            ['tshirt_1'] = 26, ['tshirt_2'] = 0,
                                            ['torso_1'] = 166, ['torso_2'] = 1,
                                            ['arms'] = 19,
                                            ['pants_1'] = 1, ['pants_2'] = 1,
                                            ['shoes_1'] = 25, ['shoes_2'] = 0,
                                            ['bags_1'] = 44, ['bags_2'] = 0,
                                            ['helmet_1'] = -1, ['helmet_2'] = 0,
                                        })
                                    end)
                                end
                            end
                        end
                    end)
                end
            })

            if _LIVRAISONS.inLivraisons then
                RageUI.Button('Arrêter l\'activité de livraison', nil, {}, true, {
                    onSelected = function()
                        _LIVRAISONS.inLivraisons = false
                        _LIVRAISONS.stop()
                        ESX.ShowNotification('🚨 Tu as arrêter l\'activité de livraison, ton expérience a bien été enregistré dans nos fichiers !')
                    end
                })
            end
        end)

        if not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

secured_RegisterNetEvent('kayscore:livraisons:startFoodUber', function(levels, gains, totalLivraisons, vehicle)
    _LIVRAISONS.levels = levels
    _LIVRAISONS.gains = gains
    _LIVRAISONS.totalLivraisons = totalLivraisons
    _LIVRAISONS.vehicle = vehicle
    _LIVRAISONS.inLivraisons = true

    ESX.Game.SpawnVehicle(table.concat(_LIVRAISONS.vehicle), coords, 175.13415527344, function(vehicle)
        _LIVRAISONS.vehicleEntity[ESX.PlayerData.UniqueID] = vehicle
    end)

    CreateThread(function()
        while _LIVRAISONS.inLivraisons do
            Wait(1)

            exports['ui']:drawInfo('Informations Livraisons', {
                { title = 'Expérience', subtitle = _LIVRAISONS.levels .. '/500' },
                { title = 'Gains', subtitle = _LIVRAISONS.gains .. '$' },
                { title = 'Livraisons effectuées', subtitle = _LIVRAISONS.totalLivraisons },
                { title = 'Véhicule de service', subtitle = table.concat(_LIVRAISONS.vehicle, ", ") },
                { title = 'Temps restant', subtitle = _LIVRAISONS.time .. ' secondes' },
            })

            if not _LIVRAISONS.inLivraisons then
                for k, v in pairs(_LIVRAISONS.vehicleEntity) do
                    DeleteEntity(v)
                end
                exports['ui']:hideInfo()
                break
            end
        end
    end)

    CreateThread(function()
        while _LIVRAISONS.inLivraisons do
            Wait(1000)
            _LIVRAISONS.time = _LIVRAISONS.time - 1

            if _LIVRAISONS.time <= 0 then
                ESX.ShowNotification('🤬 Tu fais quoi ? ~y~30~s~ points ont été enlevés de ton expérience !')
                _LIVRAISONS.stop()
                break
            end
        end
    end)
end)

RegisterNetEvent('kayscore:livraisons:setDestination', function(value)
    for k, v in pairs(_LIVRAISONS.blipsEntity) do
        RemoveBlip(v)
        SetBlipRoute(v, 0)
    end

    _LIVRAISONS.RandomZone = kayscoreConfigServ.Activity.Livraisons.Market[math.random(1, #kayscoreConfigServ.Activity.Livraisons.Market)]
    _LIVRAISONS.x, _LIVRAISONS.y, _LIVRAISONS.z = _LIVRAISONS.RandomZone.x, _LIVRAISONS.RandomZone.y, _LIVRAISONS.RandomZone.z

    local blip = AddBlipForCoord(_LIVRAISONS.x, _LIVRAISONS.y, _LIVRAISONS.z)
    SetBlipSprite(blip, 8)
    SetBlipColour(blip, 70)
    SetBlipScale(blip, 0.6)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Livraison')
    EndTextCommandSetBlipName(blip)
    SetBlipRoute(blip, true)
    _LIVRAISONS.blipsEntity[blip] = blip

    if value ~= 'start' then
        _LIVRAISONS.time = 600
        ESX.ShowNotification(('🧭 Votre livraison vient de vous rapporter ~g~%s$~s~\nUne nouvelle position a été définie sur ton GPS ! Tu as 10 minutes pour livrer la marchandise'):format(_LIVRAISONS.gains))
    end

    if value == 'start' then
        ESX.ShowNotification('🧭 Un véhicule de service t\'a été fourni, une position a été ajoutée sur ton GPS ! Prends le véhicule et rends-toi là-bas pour livrer la marchandise. Tu as ~y~10 minutes~s~')
        CreateThread(function()
            while _LIVRAISONS.inLivraisons do
                _LIVRAISONS.interval = 2000
                local ped = PlayerPedId()
                local pedCoords = GetEntityCoords(ped)
                local dist = #(pedCoords - vector3(_LIVRAISONS.x, _LIVRAISONS.y, _LIVRAISONS.z))
                local vehicle = GetVehiclePedIsIn(ped, false)
                local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))

                -- Vérifiez si le véhicule est correct
                    -- Vérifiez la distance
                    if dist <= 30 then
                        _LIVRAISONS.interval = 1
                        -- Ajoutez des points de débogage pour vérifier les valeurs


                        -- Dessinez le marker
                        DrawMarker(25, _LIVRAISONS.x, _LIVRAISONS.y, _LIVRAISONS.z - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(kayscoreConfigServ.R), tonumber(kayscoreConfigServ.G), tonumber(kayscoreConfigServ.B), 255, false, false, 2, false, false, false, false)

                        -- Vérifiez la distance pour afficher la notification
                        if dist < 2.5 then
                            DrawInstructionBarNotification(_LIVRAISONS.x, _LIVRAISONS.y, _LIVRAISONS.z, "Appuyez sur [ ~g~E~w~ ] pour livrer")
                            if IsControlJustPressed(0, 51) then
                                if not TimerLivr then return end
                                TimerLivr = false
                                _LIVRAISONS.Action()
                                Citizen.SetTimeout(10000, function()
                                    TimerLivr = true
                                end)
                            end
                    end
                end

                if not _LIVRAISONS.inLivraisons then
                    _LIVRAISONS.stop()
                    break
                end

                Wait(_LIVRAISONS.interval)
            end
        end)
        
        CreateThread(function()
            while _LIVRAISONS.inLivraisons do
                Wait(1000)
                _LIVRAISONS.time = _LIVRAISONS.time - 1

                if _LIVRAISONS.time <= 0 then
                    ESX.ShowNotification('🤬 Tu fais quoi ? ~y~30~s~ points ont été enlevés de ton expérience !')
                    _LIVRAISONS.stop()
                    break
                end
            end
        end)
    end
end)
