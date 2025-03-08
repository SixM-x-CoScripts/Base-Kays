function kayscoreCraftWeapons:openMoltenSteel()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')
    local count = false

    ESX.TriggerServerCallback('kayscore:getIem', function(cb)
        count = cb
        -- print('Callback slide:getIem:', cb)
    end)

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(Player.playerPed, true)
    
    while main do
        Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Separator('Acier à fondre')
            RageUI.Line()
            for k,v in pairs(ESX.GetPlayerData().inventory) do
                if v.name ~= 'treatedsteel' then goto continue end

                RageUI.Button(v.label, nil, {RightLabel = '~r~Quantité(s): '..v.count}, not kayscoreCraftWeapons.fond, {
                    onSelected = function()
                        KeyboardUtils.use('Quantité à fondre', function(data)
                            local data = tonumber(data)
                            if data == nil or data < 10 then return end
                            if data > v.count then return ESX.ShowNotification('Vous n\'en possédez pas assez') end
                            if data >= 50 then return ESX.ShowNotification('Il n\'y a pas assez de place dans le bac') end

                            kayscoreCraftWeapons.loadpercent = 0.0
                            kayscoreCraftWeapons.count = 0.00006

                            kayscoreCraftWeapons.count = kayscoreCraftWeapons.count * (50 / data)

                            kayscoreCraftWeapons.fond = true

                            kayscoreCraftWeapons.fondCount = data
                        end)
                    end
                })

                if kayscoreCraftWeapons.fond then
                    RageUI.PercentagePanel(kayscoreCraftWeapons.loadpercent, "Fonte des métaux en cours (~y~" .. math.floor(kayscoreCraftWeapons.loadpercent * 100) .. "%~s~)", "", "", function(a, percent) end)
                    if kayscoreCraftWeapons.loadpercent < 1.0 then
                        kayscoreCraftWeapons.loadpercent = kayscoreCraftWeapons.loadpercent + kayscoreCraftWeapons.count
                    else
                        kayscoreCraftWeapons.loadpercent = 0
                        kayscoreCraftWeapons.fond = false

                        secured_TriggerServerEvent('kayscore:craft:fond', kayscoreCraftWeapons.fondCount)
                    end
                end

                ::continue::
            end

            if not count then
                RageUI.Separator('~r~Vous ne possédez pas d\'acier traité')
            end
        end)

        if not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(Player.playerPed, false)
        end
    end
end


function kayscoreCraftWeapons:getQuantityMoneyWithItemPrice(price)
    ESX.PlayerData = ESX.GetPlayerData()
    for k,v in pairs(ESX.PlayerData.accounts) do
        if v.name == 'black_money' then
            if v.money < tonumber(price) then return false end
        end
    end

    return true
end

function kayscoreCraftWeapons:setPlayerAnim()
    Player.playerPed = PlayerPedId()
end

function kayscoreCraftWeapons:getInvenotryItem(item)
    ESX.PlayerData = ESX.GetPlayerData()
    for k,v in pairs(ESX.PlayerData.inventory) do
        if v.name ~= item then
            return v
        end
    end
end

function kayscoreCraftWeapons:openCraftWeapons()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(Player.playerPed, true)

    while main do
        Wait(1)
        RageUI.IsVisible(main, function()
            for k,v in pairs(kayscoreCraftWeapons.Weapons) do
                local buttonName = ('%s'):format(v.label)
                RageUI.Button(buttonName, nil, {RightLabel = ('~g~%s$~s~'):format(v.price)}, not kayscoreCraftWeapons.crafting, {
                    onActive = function()
                        RageUI.Info('Informations de la création', {
                            'Prix',
                            'Acier fondu nécessaire',
                            'Fil de fer nécessaire',
                            'Outil requis',
                            'Temps de la création'
                        },
                        {
                            v.price..' $',
                            v.acierFondue..' L',
                            v.filFer..' cm',
                            'Soudeuse',
                            v.time..' minutes'
                        })
                    end,
                    onSelected = function()
                        local access = false
                        ESX.TriggerServerCallback('kayscore:getItem2', function(cb1)
                            if cb1 then
                                ESX.TriggerServerCallback('kayscore:getItem3', function(cb2)
                                    if cb2 then
                                        access = true
                                        -- print('Access granted')
                                    else
                                        ESX.ShowNotification('Vous ne possédez pas assez de fil de fer.')
                                    end
                                end, 'wire')
                            else
                                ESX.ShowNotification('Vous ne possédez pas assez d\'acier fondu.')
                            end
                        end, 'melted_steel')

                        Wait(500)

                        if not access then return end

                        if not kayscoreCraftWeapons:getQuantityMoneyWithItemPrice(v.price) then
                            return ESX.ShowNotification('Vous n\'avez pas l\'argent nécessaire')
                        end

                        kayscoreCraftWeapons.crafting = true

                        secured_TriggerServerEvent('kayscore:weapons:paid', v.price, v.acierFondue, v.filFer)
                        CreateThread(function()
                            RageUI.CloseAll()
                            while kayscoreCraftWeapons.crafting do
                                Wait(10000)
                                v.time = v.time - 1
                                if v.time <= 0 then
                                    kayscoreCraftWeapons.crafting = false
                                    secured_TriggerServerEvent('kayscore:weapons:give', v.name, v.label)
                                end
                            end
                        end)
                    end
                })
            end
        end)

        if not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(Player.playerPed, false)
        end
    end
end




local loadede = false
local tt = {}

secured_RegisterNetEvent('kayscore:weapons:load', function(table)
    tt = table
    loadede = true
end)

CreateThread(function()
    local permi
    while not ESXLoaded do Wait(1) end
    while not loadede do Wait(1) end
    AddZones('fonderie', {
        Position = vector3(1084.9197998047, -2002.4211425781, 31.402545928955),
        Dist = 10,
        Public = false,
        Job = tt,
        Job2 = tt,
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = true,
            Position = vector3(1084.9197998047, -2002.4211425781, 31.402545928955),
            BlipId = 253,
            Color = 1,
            Scale = 0.5,
            Text = 'Fonderie'
        },
        ActionText =('Appuyez sur [ %sE~w~ ] pour intéragir'):format(UTILS.COLORCODE),
        Action = function()
            kayscoreCraftWeapons:openMoltenSteel()
        end
    })
    AddZones('craft_weapons', {
        Position = vector3(1014.667175, 2905.561035, 41.386265),
        Dist = 10,
        Public = false,
        Job = tt,
        Job2 = tt,
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = true,
            Position = vector3(1015.645, 2905.471, 41.36798),
            BlipId = 784,
            Color = 1,
            Scale = 0.5,
            Text = 'Craft D\'arme'
        },
        marker = false,
        ActionText =('Appuyez sur [ %sE~w~ ] pour intéragir'):format(UTILS.COLORCODE),
        Action = function()
            kayscoreCraftWeapons:openCraftWeapons()
        end
    })
    _PEDS.addPed('craft_weapons', {
        model = 'csb_talcc',
        position = vector3(978.7681, 2909.357, 41.45187),
        heading = 187.49645996094,
        scenario = {
            active = false,
            name = 'WORLD_HUMAN_CLIPBOARD',
            count = 0,
        },
        weapon = {
            active = true,
            weaponName = 'weapon_assaultrifle',
        },
        floatingText = {
            active = true,
            text = 'Nay',
            color = 34,
        },
    })
end)