CreateThread(function()


    fishing = {
        player = {},

        isIntPermitInstruction = false,

        permit = {
            ['fishing_mer'] = 'Permis d\'eau de Mer',
            ['fishing_ocean'] = 'Permis d\'eau profonde',
            ['fishing_douce'] = 'Permis d\'eau Douce'
        }
    }

    local fPlayerData = {}

    local permitt = {}

    local openFishingShopMenu = function()
        local main = RageUI.CreateMenu('', 'Magasin de Pêche')
        local fishingrod = RageUI.CreateSubMenu(main, '', 'Magasin de Pêche')
        local fishingappat = RageUI.CreateSubMenu(main, '', 'Magasin de Pêche')
    
        RageUI.Visible(main, not RageUI.Visible(main))
        FreezeEntityPosition(Player.playerPed, true)
    
        if not fishing.player[Player.UniqueID] then
            ESX.TriggerServerCallback('kayscoreServ:fishing:getInformations', function(cb)
                if not cb then return end
    
                if not fishing.player[Player.UniqueID] then
                    fishing.player[Player.UniqueID] = cb
                end
            end)
        end
    
        while not fishing.player[Player.UniqueID] do Wait(1) end
    
        fPlayerData = fishing.player[Player.UniqueID]
    
        permitt = {}
    
        if type(fPlayerData.permit) == 'table' then
            for k,v in pairs(fPlayerData.permit) do
                table.insert(permitt, kayscoreConfigServ.Fishing.fishList.permit[k])
            end
        end
    
        while not fPlayerData do Wait(1) end
    
        while main do Wait(1)
            RageUI.IsVisible(main, function()
                RageUI.Separator(('XP: ~y~%s~s~'):format(fishing.player[Player.UniqueID].level))
                if fPlayerData.permit then
                    if json.encode(fPlayerData.permit) == '[]' then
                        RageUI.Separator('~r~Vous ne possédez aucun permis de pêche~s~')
                    else
                        if type(fPlayerData.permit) == 'table' then
                            RageUI.Separator('↓ ~g~Permis possédé(s)~s~ ↓')
                            RageUI.Separator(('%s'):format(table.concat(permitt, ', \n')))
                            RageUI.Separator('')
                            RageUI.Separator('')
                        end
                    end
    
                    RageUI.Button('Cannes à pêche', nil, {RightLabel = '→'}, true, {
                        onSelected = function()
                            -- Actions à exécuter lors de la sélection
                        end
                    }, fishingrod)
    
                    RageUI.Button('Appâts', nil, {RightLabel = '→'}, true, {
                        onSelected = function()
                            -- Actions à exécuter lors de la sélection
                        end
                    }, fishingappat)
    
                    RageUI.WLine()
    
                    for k,v in ipairs(kayscoreConfigServ.Fishing.fishList.permit) do
                        if type(fPlayerData.permit) == 'table' then
                            if not fPlayerData.permit['fishing_'..v.name] then
                                RageUI.Button(('Payer le permis de Pêche "%s"'):format(v.label), nil, {RightBadge = RageUI.BadgeStyle.star, RightLabel = ('~g~%s$~s~'):format(ESX.Math.GroupDigits(v.price))}, true, {
                                    onSelected = function()
                                        exports['sPrompt']:displayRequestttt(
                                            kayscoreConfigServ.ServerName,
                                            ('Payer le permis de Pêche "%s" ?'):format(v.label),
                                            function() -- Oui
                                                local playerMoney = 0
                                                local a = true
                                                
                                                for i,p in pairs(ESX.PlayerData.accounts) do
                                                    if p.name == 'bank' then
                                                        if p.money < v.price then 
                                                            a = false
                                                            ESX.ShowNotification('~r~Vous n\'avez pas l\'argent requis sur votre compte en banque~s~')
                                                            return
                                                        end
                                                    end
                                                end
    
                                                if not a then return end
    
                                                RageUI.CloseAll()
                                                secured_TriggerServerEvent('kayscoreServ:fishing:permit:paid', v.name, v.price, v.type)
                                            end,
                                            function() -- Non
                                                ESX.ShowNotification("Vous avez annulé l'action")
                                            end
                                        )
                                    end
                                })
                            end
                        end
                    end
                end
            end)

            RageUI.IsVisible(fishingrod, function()
                for k,v in ipairs(kayscoreConfigServ.Fishing.fishList.FishingRod) do
                    if not v.boutique then
                        RageUI.Button(v.label, nil, {RightLabel = ('~g~%s$~s~'):format(v.price)}, true, {
                            onSelected = function()
                                exports['sPrompt']:displayRequestttt(
                                    kayscoreConfigServ.ServerName,
                                    ('Acheter la canne à pêche "%s" pour %s$ ?'):format(v.label, v.price),
                                    function() -- Oui
                                        secured_TriggerServerEvent('kayscoreServ:fishing:rod:paid', v.name, tonumber(v.price))
                                    end,
                                    function() -- Non
                                        ESX.ShowNotification("Vous avez annulé l'achat de la canne à pêche")
                                    end
                                )
                            end
                        })
                    else
                        RageUI.Button(v.label, 'Disponible dans la boutique (F3)', {RightBadge = RageUI.BadgeStyle.Star, RightLabel = kayscoreConfigServ.GTACOLOR .. v.price}, true, {
                            onSelected = function()
                                ESX.ShowNotification('Disponible dans la boutique (F3)')
                            end
                        })
                    end
                end
            end)
            

            RageUI.IsVisible(fishingappat, function()
                for k,v in pairs(kayscoreConfigServ.Fishing.fishList.FishingLures) do
                    RageUI.Button(v.label, nil, {RightLabel = ('~g~%s~s~'):format(v.price)}, true, {
                        onSelected = function()
                            secured_TriggerServerEvent('kayscoreServ:fishing:shop:lures:paid', tonumber(v.price), v.name, v.label)
                        end
                    })
                end
            end)

            if not RageUI.Visible(main) and not RageUI.Visible(fishingrod) and not RageUI.Visible(fishingappat) then
                main = RMenu:DeleteType('main')
                FreezeEntityPosition(Player.playerPed, false)
            end
        end
    end

    RegisterNetEvent('kayscoreServ:fishing:permit:startInstruction', function(type)
        fishing.player[Player.UniqueID].permit[type] = true

        DoScreenFadeOut(1000)

        Wait(1500)

        SetEntityCoords(Player.playerPed, vector3(-1612.391, 5262.571, 3.974104))
        SetEntityHeading(Player.playerPed, 27.659385681152)

        DoScreenFadeIn(2000)

        TaskStartScenarioInPlace(Player.playerPed, 'WORLD_HUMAN_STAND_FISHING')

        local hasFish = false

        CreateThread(function()

            kayscoreConfigServ.Fishing.fishList.isIntPermitInstruction = true
            Player.playerPed = PlayerPedId()

            exports['ui']:drawInfo('Instructions de Pêche', kayscoreConfigServ.Fishing.fishList.informations.Instructions)

            CreateThread(function()
                while kayscoreConfigServ.Fishing.fishList.isIntPermitInstruction do
                    Player.coords = GetEntityCoords(Player.playerPed)
                    Wait(1)
                    DrawInstructionBarNotification(Player.coords.x, Player.coords.y, Player.coords.z, '[~r~E~s~] pour mouliner [~r~A~s~] pour laisser partir le poisson')

                    DrawTextPrice('Vous êtes entrain de passer le permit de pêche')
                end
    
            end)


            Wait(6000)

            ESX.ShowNotification('Nouveau poisson au bout de la ligne... ~r~Vous pouvez mouliner~s~')

            Wait(500)

            kayscoreConfigServ.Fishing.fishList.isIntPermitInstruction = false

            local isKeyPressed = false
            local keyPressedTime = 0
            local elapsedTime;

            kayscoreConfigServ.Fishing.fishList.isIntPermitInstruction = true

            while kayscoreConfigServ.Fishing.fishList.isIntPermitInstruction do
                Player.coords = GetEntityCoords(Player.playerPed)
                Wait(1)

                if IsControlPressed(0, 54) then
                    if not isKeyPressed then
                        isKeyPressed = true
                        keyPressedTime = GetGameTimer()

                        drawBar(5000, ('Moulinage en cours (%s)'):format('5 secondes'), function()
                        end)
                    end
                else
                    if isKeyPressed  then
                        isKeyPressed = false
                        elapsedTime = GetGameTimer() - keyPressedTime
                        if elapsedTime >= 5000 then
                            if elapsedTime >= 5000 then
                                ESX.ShowNotification('Vous avez récupérer le poisson (Exemple)')
                                -- hideBar()
                                exports['ui']:hideInfo()
                                ClearPedTasks(Player.playerPed)
                                ESX.ShowNotification('~g~Vous venez de confirmer votre permit de "Pêche"~s~')
                                secured_TriggerServerEvent('kayscoreServ:fishing:permit:finish')
                                kayscoreConfigServ.Fishing.fishList.isIntPermitInstruction = false
                                break
                            end
                        else
                            ESX.ShowNotification('Vous avez arrêté de mouliner, le poisson est partie ! ~r~Ressayer encore~s~')
                            hasFish = false
                            -- hideBar()
                        end
                    end
                end
            end
        end)
    end)


    _PEDS.addPed('fishing_shop', {
        model = 'g_m_y_pologoon_02',
        position = kayscoreConfigServ.Fishing.marketPosition,
        heading = 296.18948364258,
        scenario = {
            active = true,
            name = 'WORLD_HUMAN_VALET',
            count = 0,
        },
        weapon = {
            active = false,
            weaponName = 'weapon_assaultrifle',
        },
        floatingText = {
            active = true,
            text = 'Pêcheur Expert',
            color = 0,
        },
    })
    AddZones('fishing_shop', {
        Position = kayscoreConfigServ.Fishing.PosShop,
        Dist = 10,
        Public = true,
        Job = nil,
        Job2 = nil,
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = true,
            Position = kayscoreConfigServ.Fishing.PosShop,
            BlipId = 317,
            Color = 2,
            Scale = 0.6,
            Text = 'Magasin de Pêche'
        },
        marker = true,
        ActionText =('Appuyez sur [ %sE~w~ ] pour intéragir'):format(UTILS.COLORCODE),
        Action = function()
            openFishingShopMenu()
        end
    })
end)