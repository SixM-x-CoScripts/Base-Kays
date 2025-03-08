-- function openSupermarket()
--     local main = RageUI.CreateMenu('', 'Supermarket')

--     RageUI.Visible(main, not RageUI.Visible(main))
--     FreezeEntityPosition(Player.playerPed, true)
--     while main do Wait(1)
--         RageUI.IsVisible(main, function()
--             for k,v in pairs(kayscoreSupermarket) do
--                 RageUI.Button(v.label, nil, {RightLabel = ('~g~%s$~S~'):format(v.price)}, true, {
--                     onSelected = function()
--                         KeyboardUtils.use('Taper B pour payer en banque ou L en liquide', function(data)
--                             TriggerServerEvent('kayscore:supermarket:paidItem', data, v.item, v.price)
--                         end)
--                     end
--                 })
--             end
--         end)

--         if not RageUI.Visible(main) and

--         not RageUI.Visible(main) then
--             main = RMenu:DeleteType('main')
--             FreezeEntityPosition(Player.playerPed, false)
--         end
--     end
-- end

-- function openIphoneShop()
--     Player.playerPed = PlayerPedId()
--     local main = RageUI.CreateMenu('', 'Apple Store')

--     RageUI.Visible(main, not RageUI.Visible(main))
--     FreezeEntityPosition(Player.playerPed, true)
--     while main do Wait(1)
--         RageUI.IsVisible(main, function()
--             RageUI.Button('Téléphone', nil, {RightLabel = ('~g~%s$~S~'):format(350)}, true, {
--                 onSelected = function()
--                     KeyboardUtils.use('Taper B pour payer en banque ou L en liquide', function(data)
--                         TriggerServerEvent('kayscore:supermarket:paidItem', data, 'phone', 350)
--                     end)
--                 end
--             })
--         end)

--         if not RageUI.Visible(main) and

--         not RageUI.Visible(main) then
--             main = RMenu:DeleteType('main')
--             FreezeEntityPosition(Player.playerPed, false)
--         end
--     end
-- end

-- function openArmorie()
--     Player.playerPed = PlayerPedId()
--     local main = RageUI.CreateMenu('', 'Armurerie')

--     RageUI.Visible(main, not RageUI.Visible(main))
--     FreezeEntityPosition(Player.playerPed, true)
--     while main do Wait(1)
--         RageUI.IsVisible(main, function()
--             for k,v in pairs(kayscoreArmorie.weapons) do
--                 RageUI.Button(v.label, nil, {RightLabel = ('~g~%s$~S~'):format(v.price)}, true, {
--                     onSelected = function()
--                         KeyboardUtils.use('Taper B pour payer en banque ou L en liquide', function(data)
--                             TriggerServerEvent('kayscore:supermarket:paidWeapon', data, v.weapon, v.price)
--                         end)
--                     end
--                 })
--             end
--             RageUI.Line()
--             RageUI.Button('Chargeur 9mm', nil, {RightLabel = ('~g~%s$~S~'):format(50)}, true, {
--                 onSelected = function()
--                     KeyboardUtils.use('Quantité', function(count)
--                         local count = tonumber(count)
--                         if not count then return end

--                         CreateThread(function()
--                             KeyboardUtils.use('Taper B pour payer en banque ou L en liquide', function(data)
--                                 TriggerServerEvent('kayscore:supermarket:paidWeapon', data, '9mm', 50*count, count)
--                             end)
--                         end)
--                     end)
--                 end
--             })
--             RageUI.Button('Chargeur 12mm', nil, {RightLabel = ('~g~%s$~S~'):format(75)}, true, {
--                 onSelected = function()
--                     KeyboardUtils.use('Quantité', function(count)
--                         local count = tonumber(count)
--                         if not count then return end

--                         CreateThread(function()
--                             KeyboardUtils.use('Taper B pour payer en banque ou L en liquide', function(data)
--                                 TriggerServerEvent('kayscore:supermarket:paidWeapon', data, '12gauge', 75*count, count)
--                             end)
--                         end)
--                     end)
--                 end
--             })
--             RageUI.Button('Chargeur 5.56mm', nil, {RightLabel = ('~g~%s$~S~'):format(110)}, true, {
--                 onSelected = function()
--                     KeyboardUtils.use('Quantité', function(count)
--                         local count = tonumber(count)
--                         if not count then return end

--                         CreateThread(function()
--                             KeyboardUtils.use('Taper B pour payer en banque ou L en liquide', function(data)
--                                 TriggerServerEvent('kayscore:supermarket:paidWeapon', data, '556mm', 110*count, count)
--                             end)
--                         end)
--                     end)
--                 end
--             })
--             RageUI.Button('Chargeur 7.62mm', nil, {RightLabel = ('~g~%s$~S~'):format(150)}, true, {
--                 onSelected = function()
--                     KeyboardUtils.use('Quantité', function(count)
--                         local count = tonumber(count)
--                         if not count then return end

--                         CreateThread(function()
--                             KeyboardUtils.use('Taper B pour payer en banque ou L en liquide', function(data)
--                                 TriggerServerEvent('kayscore:supermarket:paidWeapon', data, '762mm', 150*count, count)
--                             end)
--                         end)
--                     end)
--                 end
--             })
--             RageUI.Button('Chargeur Kal.68', nil, {RightLabel = ('~g~%s$~S~'):format(190)}, true, {
--                 onSelected = function()
--                     KeyboardUtils.use('Quantité', function(count)
--                         local count = tonumber(count)
--                         if not count then return end

--                         CreateThread(function()
--                             KeyboardUtils.use('Taper B pour payer en banque ou L en liquide', function(data)
--                                 TriggerServerEvent('kayscore:supermarket:paidWeapon', data, '68kal', 190*count, count)
--                             end)
--                         end)
--                     end)
--                 end
--             })
--             RageUI.Button('Kevlar', nil, {RightLabel = ('~g~%s$~S~'):format(3500)}, true, {
--                 onSelected = function()
--                     KeyboardUtils.use('Taper B pour payer en banque ou L en liquide', function(data)
--                         TriggerServerEvent('kayscore:supermarket:paidWeapon', data, 'kevlar', 3500)
--                     end)
--                 end
--             })
--             RageUI.Separator('~y~VIP ZONE~s~')
--             RageUI.Button('Pistolet (Beretta)', nil, {RightLabel = ('~g~%s$~S~'):format(1800000)}, true, {
--                 onSelected = function()
--                     if not VIP.haveVip() then return ESX.ShowNotification('Vous devez possedez le ~p~VIP~s~') end
--                     KeyboardUtils.use('Taper B pour payer en banque ou L en liquide', function(data)
--                         TriggerServerEvent('kayscore:supermarket:paidWeapon', data, 'weapon_pistol', 180000)
--                     end)
--                 end
--             })
--         end)

--         if not RageUI.Visible(main) and

--         not RageUI.Visible(main) then
--             main = RMenu:DeleteType('main')
--             FreezeEntityPosition(Player.playerPed, false)
--         end
--     end
-- end

-- function openShop()
--     Player.playerPed = PlayerPedId()
--     local main = RageUI.CreateMenu('', 'Magazin')

--     RageUI.Visible(main, not RageUI.Visible(main))
--     FreezeEntityPosition(Player.playerPed, true)
--     while main do Wait(1)
--         RageUI.IsVisible(main, function()
--             RageUI.Button('Eau', nil, {RightLabel = ('~g~%s$~S~'):format(50)}, true, {
--                 onSelected = function()
--                     KeyboardUtils.use('Quantité', function(count)
--                         local count = tonumber(count)
--                         if not count then return end

--                         CreateThread(function()
--                             KeyboardUtils.use('Taper B pour payer en banque ou L en liquide', function(data)
--                                 TriggerServerEvent('kayscore:supermarket:paidItem', data, 'water', 50*count, count)
--                             end)
--                         end)
--                     end)
--                 end
--             })
--             RageUI.Button('Pain', nil, {RightLabel = ('~g~%s$~S~'):format(50)}, true, {
--                 KeyboardUtils.use('Quantité', function(count)
--                     local count = tonumber(count)
--                     if not count then return end

--                     CreateThread(function()
--                         KeyboardUtils.use('Taper B pour payer en banque ou L en liquide', function(data)
--                             TriggerServerEvent('kayscore:supermarket:paidItem', data, 'bread', 50*count, count)
--                         end)
--                     end)
--                 end)
--             })
--         end)

--         if not RageUI.Visible(main) and

--         not RageUI.Visible(main) then
--             main = RMenu:DeleteType('main')
--             FreezeEntityPosition(Player.playerPed, false)
--         end
--     end
-- end

local last = 0
local rentedVehicles = {}

function DrawTextFixed(x, y, text)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextScale(0.45, 0.45)
    SetTextColour(255, 255, 255, 215)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

function openLocation(type, h)
    Player.playerPed = PlayerPedId()
    local main = RageUI.CreateMenu('', 'Location')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(Player.playerPed, true)
    
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            for k,v in pairs({
                'Faggio',
                'Bmx',
                'Panto',
            }) do
                RageUI.Button(v, "Le temps de location est de 15min !", {RightLabel = '~g~50$~s~'}, true, {
                    onSelected = function()
                        local currentime = GetGameTimer()
                        if currentime - last >= 120000 then
                            exports['sPrompt']:displayRequest(
                                kayscoreConfigServ.ServerName,
                                'Confirmez-vous la location du véhicule pour 50$ ?',
                                function() -- Oui
                                    ESX.TriggerServerCallback('kayscore:getMoney', function(hasMoney)
                                        if hasMoney then
                                            ESX.ShowNotification('💲 Vous avez payé ~g~50$~s~')
                                            ESX.Game.SpawnVehicle(v, type, h, function(vehicle)
                                                last = GetGameTimer()
                                                local vehicleId = NetworkGetNetworkIdFromEntity(vehicle)
                                                rentedVehicles[vehicleId] = {
                                                    vehicle = vehicle,
                                                    rentTime = GetGameTimer()
                                                }
                                                Citizen.CreateThread(function()
                                                    while rentedVehicles[vehicleId] do
                                                        Wait(0)
                                                        local playerPed = PlayerPedId()
                                                        local playerVeh = GetVehiclePedIsIn(playerPed, false)
                                                        if playerVeh == vehicle then
                                                            local remainingTime = 900000 - (GetGameTimer() - rentedVehicles[vehicleId].rentTime)
                                                            if remainingTime <= 0 then
                                                                ESX.ShowNotification('⏰ Le temps de location est écoulé. Le véhicule va être supprimé.')
                                                                DeleteEntity(vehicle)
                                                                rentedVehicles[vehicleId] = nil
                                                                break
                                                            else
                                                                local minutes = math.floor(remainingTime / 60000)
                                                                local seconds = math.floor((remainingTime % 60000) / 1000)
                                                                local timeText = ('%sTemps restant: %02d:%02d'):format(kayscoreConfigServ.GTACOLOR, minutes, seconds)
                                                                DrawTextFixed(0.9, 0.82, timeText)
                                                            end
                                                        end
                                                    end
                                                end)
                                            end)
                                        else
                                            ESX.ShowNotification('💲 ~r~Vous n\'avez pas assez d\'argent~s~')
                                        end
                                    end)
                                end,
                                function() -- Non
                                    ESX.ShowNotification("Achat annulé")
                                end
                            )
                        else
                            local tempderemain = 120000 - (currentime - last)
                            ESX.ShowNotification(('🕒 Veuillez patienter ~r~%d secondes~s~ avant de racheter un véhicule'):format(math.ceil(tempderemain / 1000)))
                        end
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

Citizen.CreateThread(function()
    while true do
        Wait(1000)
        for vehicleId, data in pairs(rentedVehicles) do
            if GetGameTimer() - data.rentTime >= 900000 then
                ESX.ShowNotification('⏰ Le temps de location est écoulé. Le véhicule va être supprimé.')
                DeleteEntity(data.vehicle)
                rentedVehicles[vehicleId] = nil
            end
        end
    end
end)

CreateThread(function()
    while not ESXLoaded do Wait(1) end
    -- AddZones('supermarket', {
    --     Position = kayscoreConfigServ.LegalShops.SuperMarket,
    --     Dist = 10,
    --     Public = true,
    --     Job = nil,
    --     Job2 = nil,
    --     GradesJob = {},
    --     InVehicleDisable = true,
    --     Blip = {
    --         Active = true,
    --         Position = kayscoreConfigServ.LegalShops.SuperMarket,
    --         BlipId = 605,
    --         Color = 46,
    --         Scale = 0.5,
    --         Text = 'Supermarché/IKEA'
    --     },
    --     ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
    --     Action = function()
    --         openUI('supermarket')
    --     end
    -- })

    -- _PEDS.addPed('supermarket', {
    --     model = 'csb_talcc',
    --     position = vector3(2749.48, 3483.425, 55.66621),
    --     heading = 74.422637939453,
    --     scenario = {
    --         active = false,
    --         name = 'WORLD_HUMAN_CLIPBOARD',
    --         count = 0,
    --     },
    --     weapon = {
    --         active = false,
    --         weaponName = 'weapon_musket',
    --     },
    --     floatingText = {
    --         active = true,
    --         text = 'Shokapik',
    --         color = 34,
    --     },
    -- })

    -- AddZones('apple_store', {
    --     Position = vector3(149.6046, -232.9334, 54.424),
    --     Dist = 10,
    --     Public = true,
    --     Job = nil,
    --     Job2 = nil,
    --     GradesJob = {},
    --     InVehicleDisable = true,
    --     Blip = {
    --         Active = true,
    --         Position = vector3(149.6046, -232.9334, 54.424),
    --         BlipId = 459,
    --         Color = 46,
    --         Scale = 0.8,
    --         Text = 'Apple Store'
    --     },
    --     ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
    --     Action = function()
    --         openUI('applestore')
    --     end
    -- })

    -- _PEDS.addPed('apple_store', {
    --     model = 'csb_talcc',
    --     position = vector3(148.7701, -234.561, 54.424),
    --     heading = 341.12155151367,
    --     scenario = {
    --         active = true,
    --         name = 'WORLD_HUMAN_CLIPBOARD',
    --         count = 0,
    --     },
    --     weapon = {
    --         active = false,
    --         weaponName = 'weapon_musket',
    --     },
    --     floatingText = {
    --         active = true,
    --         text = 'Zeno',
    --         color = 34,
    --     },
    -- })

    for k,v in pairs(kayscoreArmorie.Pos) do
        AddZones('armuerie_pos_'..k, {
            Position = vector3(v.x, v.y, v.z),
            Dist = 10,
            Public = true,
            Job = nil,
            Job2 = nil,
            GradesJob = {},
            InVehicleDisable = true,
            Blip = {
                Active = true,
                Position = vector3(v.x, v.y, v.z),
                BlipId = 110,
                Color = 1,
                Scale = 0.5,
                Text = 'Armurerie'
            },
            ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
            Action = function()
                exports['shop']:OpenShop('ammunation')
            end
        })
    end

    for k,v in pairs(kayscoreArmorie.AmmuPed) do
        _PEDS.addPed("armuerie_ped_"..k, {
            model = 'csb_talcc',
            position = vector3(v.x, v.y, v.z+1),
            heading = v.a,
            scenario = {
                active = false,
                name = 'WORLD_HUMAN_CLIPBOARD',
                count = 0,
            },
            weapon = {
                active = true,
                weaponName = 'weapon_advancedrifle',
            },
            floatingText = {
                active = true,
                text = 'Pascale',
                color = 34,
            },
        })
    end

    --[[for k,v in pairs(kayscoreShop) do
        AddZones("shop_pos_"..k, {
            Position = vector3(v.x, v.y, v.z),
            Dist = 10,
            Public = true,
            Job = nil,
            Job2 = nil,
            GradesJob = {},
            InVehicleDisable = true,
            Blip = {
                Active = false,
                -- Position = vector3(v.x, v.y, v.z),
                -- BlipId = 110,
                -- Color = 1,
                -- Scale = 0.8,
                -- Text = '24/7'
            },
            ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
            Action = function()
                openUI('market')
            end
        })
    end]]--

    for k,v in pairs(kayscoreLocation) do
        AddZones("location_pos_"..k, {
            Position = vector3(v.x, v.y, v.z),
            Dist = 10,
            Public = true,
            Job = nil,
            Job2 = nil,
            GradesJob = {},
            InVehicleDisable = true,
            marker = false,
            Blip = {
                Active = true,
                Position = vector3(v.x, v.y, v.z),
                BlipId = 280,
                Color = 2,
                Scale = 0.5,
                Text = 'Location'
            },
            ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
            Action = function()
                openLocation(v.s, v.h)
            end
        })
    end

    for k,v in pairs(kayscoreLocationPed) do
        _PEDS.addPed("location_ped_"..k, {
            model = 'csb_talcc',
            position = vector3(v.x, v.y, v.z),
            heading = v.heading,
            scenario = {
                active = true,
                name = 'WORLD_HUMAN_CLIPBOARD',
                count = 0,
            },
            weapon = {
                active = false,
                weaponName = 'weapon_advancedrifle',
            },
            floatingText = {
                active = true,
                text = 'Floyd',
                color = 34,
            },
        })
    end
end)