CreateThread(function()
    
    local zonesNames = {
        ['douce'] = 'Eau Douce',
        ['mer'] = 'Eau de Mer',
        ['ocean'] = 'Eau Profonde'
    }

    sellFishingMenu = function()
        local main = RageUI.CreateMenu('', 'Vente de Poissons')

        RageUI.Visible(main, not RageUI.Visible(main))
        FreezeEntityPosition(Player.playerPed, true)
        while main do Wait(1)
            RageUI.IsVisible(main, function()
                for k,v in pairs(kayscoreConfigServ.Fishing.fishList.FishList) do
                    for i,p in pairs(ESX.GetPlayerData().inventory) do
                        for _, a in pairs(kayscoreConfigServ.Fishing.fishList.FishList[k]) do
                            if tostring(p.name) == tostring(a.name) then
                                if p.count > 0 then
                                    RageUI.Button(('%s (%s)'):format(p.name, p.count), nil, {RightLabel = (''..kayscoreConfigServ.GTACOLOR..'%s~s~ ~g~%s~s~ →'):format(zonesNames[k], a.price)}, true, {
                                        onSelected = function()
                                            KeyboardUtils.use('Quantité à vendre', function(data)
                                                local data = tonumber(data)

                                                if data == nil then return end

                                                secured_TriggerServerEvent('kayscoreServ:fishing:sell', a.name, a.label, a.price, data)
                                            end)
                                        end
                                    })
                                end
                            end
                        end
                    end
                end
            end)

            if not RageUI.Visible(main) then
                main = RMenu:DeleteType('main')
                FreezeEntityPosition(Player.playerPed, false)
            end
        end
    end

    _PEDS.addPed('fishing_sell', {
        model = 'a_m_y_smartcaspat_01',
        position = kayscoreConfigServ.Fishing.PosSell,
        heading = 156.52093505859,
        scenario = {
            active = true,
            name = 'WORLD_HUMAN_CLIPBOARD',
            count = 0,
        },
        weapon = {
            active = false,
            weaponName = '',
        },
        floatingText = {
            active = true,
            text = 'Acheteur de Poisson',
            color = 34,
        },
    })
    AddZones("fishing_sell", {
        Position = kayscoreConfigServ.Fishing.PosSell,
        Dist = 10,
        Public = true,
        Job = nil,
        Job2 = nil,
        GradesJobRequire = false,
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = true,
            Position = kayscoreConfigServ.Fishing.PosSell,
            BlipId = 317,
            Color = 2,
            Scale = 0.6,
            Text = 'Acheteur de Poisson'
        },
        ActionText =('Appuyez sur [ %sE~w~ ] pour intéragir'):format(UTILS.COLORCODE),
        marker = false,
        Action = function()
            sellFishingMenu()
        end
    })
end)