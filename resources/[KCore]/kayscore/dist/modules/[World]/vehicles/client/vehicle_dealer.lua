local Concess = {
    inService = false,
}

local MAX_DISTANCE = 10.0 

local VehicleDealer = {
    data = {
        ['motodealer'] = {label = 'Concessionnaire Moto', value = 'motorcycles', type = 'car'},
        ['cardealer'] = {label = 'Concessionnaire Automobile', value = 'car', type = 'car'},
        ['boatdealer'] = {label = 'Concessionnaire Bateau', value = 'boat', type = 'boat'},
        ['airdealer'] = {label = 'Concessionnaire Aérien', value = 'aircraft', type = 'aircraft'}
    },
    
    position = {
        ['motodealer'] = {management = vector3(1232.187012, 2736.754395, 37.962116), actions = vector3(1224.891846, 2733.580322, 37.976719), spawn = vector3(1220.226074, 2723.326416, 38.004379), heading = 255.98992919922, blips = {
            category = nil,
            position = vector3(1220.226074, 2723.326416, 38.004379),
            sprite = 348,
            display = 4,
            scale = 0.5,
            color = 0,
        },

            catalogue = vector3(1229.573364, 2731.523438, 37.971298),
            catalogueSpawn = {pos = vector3(1219.649292, 2731.223145, 37.976734), heading = 273.03732299805}
        },

        ['cardealer'] = {
            management = vector3(-613.9350, -1111.1672, 22.3285), actions = vector3(-613.9223, -1130.0013, 22.3285), spawn = vec3(-595.8538, -1111.8724, 22.1783), heading = 269.5522, blips = {
                category = nil,
                position = vector3(-610.9868, -1124.0439, 25.5666),
                sprite = 225,
                display = 4,
                scale = 0.6,
                color = 0,
            },

            catalogue = {
                vec3(-611.9197, -1121.2926, 22.3377),
                vec3(-612.0458, -1119.3721, 22.3377),
            },
            catalogueSpawn = {
                {pos = vec3(-614.7778, -1116.6006, 22.3561), heading = 227.3141},
                {pos = vec3(-614.8372, -1124.1338, 22.3561), heading = 311.9836},
            },
        },

        ['boatdealer'] = {
            management = vector3(-787.6028, -1350.234, 5.178339), actions = vector3(-805.872131, -1368.619629, 5.178345), spawn = vector3(-856.894348, -1378.569092, -0.474778), heading = 219.56527709961, blips = {
                category = nil,
                position = vector3(-811.447, -1349.703, 5.178345),
                sprite = 410,
                display = 4,
                scale = 0.5,
                color = 0,
            },

            catalogue = vector3(-812.4463, -1359.794, 5.178348),
            catalogueSpawn = {pos = vector3(-814.9863, -1360.8, 5.257283), heading = 202.52919006348}
        },
        ['airdealer'] = {
            management = vector3(-900.6086, -2979.218, 19.8454), actions = vector3(-941.1509, -2954.363, 13.94509), spawn = vector3(-1017.146, -2973.552, 13.94877), heading = 58.533008575439, blips = {
                category = nil,
                position = vector3(-962.8713, -2989.817, 13.94509),
                sprite = 423,
                display = 4,
                scale = 0.5,
                color = 0,
            },

            catalogue = vector3(-956.3844, -2919.216, 13.95992),
            catalogueSpawn = {pos = vec3(-960.748779, -2933.915527, 13.949288), heading = 344.86596679688}
        },
        
    },

    CategorieList = {},
    VehicleListCategorieList = {},

    VehicleIndex = 1,
    VehicleIndexData = {'Sortir', 'Vendre le véhicule'},
    LastVehicle = nil,
    LastVehicle2 = nil,
    Price = 0,
    label = nil,
}

function VehicleDealer:openConcessMenu(job)
    local main = nil
    if job == 'boatdealer' then
        main = RageUI.CreateMenu('', 'Actions Disponibles')
    elseif job == 'cardealer' then
        main = RageUI.CreateMenu('', 'Actions Disponibles')
    elseif job == 'motodealer' then
        main = RageUI.CreateMenu('', 'Actions Disponibles')
    elseif job == 'airdealer' then
        main = RageUI.CreateMenu('', 'Actions Disponibles')
    end
    local categorieList = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local vehicleListWithCategorie = RageUI.CreateSubMenu(categorieList, '', 'Actions Disponibles')

    vehicleListWithCategorie.Closed = function()
        DeleteEntity(VehicleDealer.LastVehicle)
    end

    RageUI.Visible(main, not RageUI.Visible(main))
    -- FreezeEntityPosition(PlayerPedId(), true)
    while main do 
        Wait(1)
        -- Vérification de la distance
        local playerPed = PlayerPedId()
        local playerPos = GetEntityCoords(playerPed)
        local dx = playerPos.x - VehicleDealer.position[job].actions.x
        local dy = playerPos.y - VehicleDealer.position[job].actions.y
        local dz = playerPos.z - VehicleDealer.position[job].actions.z
        local distance = math.sqrt(dx * dx + dy * dy + dz * dz)

        if distance > MAX_DISTANCE then
            ESX.ShowNotification("Vous vous êtes trop éloigné du point de vente.")
            RageUI.CloseAll()
            main = nil
            DeleteEntity(VehicleDealer.LastVehicle)
            return
        end

        RageUI.IsVisible(main, function()
            RageUI.Button('Liste des catégories', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('kayscore:vehicle_dealer:sendCategorieList', function(cb)
                        if cb then
                            VehicleDealer.CategorieList = cb

                            RageUI.Visible(categorieList, true)
                        end
                    end, VehicleDealer.data[job].value)
                end
            })
        end)

        RageUI.IsVisible(categorieList, function()
            for k,v in pairs(VehicleDealer.CategorieList) do
                RageUI.Button(('%s %s'):format('Catégorie', v.label), nil, {RightLabel = '>'}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback('kayscore:vehicle_dealer:sendVehicleWithCategorie', function(cb)
                            if cb then
                                VehicleDealer.VehicleListCategorieList = cb
                                RageUI.Visible(vehicleListWithCategorie, true)
                            end
                        end, v.name)
                    end
                })
            end
        end)

        RageUI.IsVisible(vehicleListWithCategorie, function()
            for k,v in pairs(VehicleDealer.VehicleListCategorieList) do
                RageUI.List(('%s'):format(v.name), VehicleDealer.VehicleIndexData, VehicleDealer.VehicleIndex, nil, {}, true, {
                    onActive = function()
                        RageUI.Info('Informations Véhicule', {'Prix d\'usine', 'Prix à la vente'}, {('~y~%s$~s~'):format(ESX.Math.GroupDigits(v.price/100*100)), ('~y~%s$~s~'):format(ESX.Math.GroupDigits(v.price/100*135))})
                    end, 
                    onListChange = function(Index)
                        VehicleDealer.VehicleIndex = Index
                    end,
                    onSelected = function()
                        if VehicleDealer.VehicleIndex == 1 then
                            DeleteEntity(VehicleDealer.LastVehicle)

                            Wait(500)

                            if not ESX.Game.IsSpawnPointClear(VehicleDealer.position[job].spawn, 2) then
                                CreateThread(function()
                                    ESX.Game.DeleteVehicle(VehicleDealer.LastVehicle)
                                end)

                                return
                            end 

                            Wait(500)

                            ESX.Game.SpawnVehicle(v.model, VehicleDealer.position[job].spawn, VehicleDealer.position[job].heading, function(vehicle)
                                FreezeEntityPosition(vehicle, true)
                                SetVehicleColours(vehicle, 255, 255)
                                VehicleDealer.LastVehicle = vehicle
                                VehicleDealer.LastVehicle2 = v.model
                                VehicleDealer.Price = tonumber(v.price)
                                VehicleDealer.label = v.name
                            end)
                        elseif VehicleDealer.VehicleIndex == 2 then
                            if VehicleDealer.LastVehicle == nil then return ESX.ShowNotification('Aucun véhicule de sortie') end
                            local player, distance = ESX.Game.GetClosestPlayer()
                            if distance == -1 or distance > 3 then return ESX.ShowNotification('Aucun joueur proche') end

                            ESX.ShowNotification('~g~Facture envoyée avec succès~s~')
                            
                                
                            ESX.TriggerServerCallback('kayscore:vehicle_dealer:sendBill', function(cb)

                            end, v.price, v.price, GetPlayerServerId(player))
                        end
                    end
                })
            end
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(categorieList) and not RageUI.Visible(vehicleListWithCategorie) then
            main = RMenu:DeleteType('main')
            DeleteEntity(VehicleDealer.LastVehicle)
        end
    end
end

secured_RegisterNetEvent('kayscore:vehicle_dealer:spawnVehicle', function(player)
    CreateThread(function()
        ESX.Game.DeleteVehicle(VehicleDealer.LastVehicle)

        secured_TriggerServerEvent('kayscore:admin:delVeh', VehicleDealer.LastVehicle)

        Wait(1000)

        VehicleDealer.LastVehicle = nil
        ESX.Game.SpawnVehicle(VehicleDealer.LastVehicle2, VehicleDealer.position[ESX.PlayerData.job.name].spawn, VehicleDealer.position[ESX.PlayerData.job.name].heading, function(vehicle)
            VehicleDealer.LastVehicle2 = nil

            local plate = GeneratePlate()
            local veh = lib.getVehicleProperties(vehicle)
            veh.plate = plate
            SetVehicleNumberPlateText(vehicle, plate)

            local vehicleData = { 
                vehicle = veh,
                plate = veh.plate,
                label = VehicleDealer.label,
                price = VehicleDealer.Price,
                type = VehicleDealer.data[ESX.PlayerData.job.name].type
            }

            secured_TriggerServerEvent('kayscore:vehicle_dealer:sendVehicleKey', player, vehicleData)
        end)

        ESX.ShowNotification('💲 La personne a bien payé la ~g~facture~s~')
    end)
end)

function VehicleDealer:openIntercationMenu(job)
    local main = nil
    if job == 'boatdealer' then
        main = RageUI.CreateMenu('', 'Actions Disponibles')
    elseif job == 'cardealer' then
        main = RageUI.CreateMenu('', 'Actions Disponibles')
    elseif job == 'motodealer' then
        main = RageUI.CreateMenu('', 'Actions Disponibles')
    elseif job == 'airdealer' then
        main = RageUI.CreateMenu('', 'Actions Disponibles')
    end
    
    RageUI.Visible(main, not RageUI.Visible(main))
    
    while main do 
        Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Checkbox('Statut de l\'entreprise', 'Quand cette case est cochée votre ENTREPRISE est notée comme ouverte', Society.List[ESX.PlayerData.job.name].state, {}, {
                onChecked = function()
                    secured_TriggerServerEvent('kayscore:jobs:updateSocietyStatus', true)
                end,
                onUnChecked = function()
                    secured_TriggerServerEvent('kayscore:jobs:updateSocietyStatus', false)
                end
            })
            
            RageUI.Checkbox('Service', nil, Concess.inService, {}, {
                onChecked = function()
                    Concess.inService = true
                    TriggerServerEvent('kayscore:concess:service')
                end,
                onUnChecked = function()
                    Concess.inService = false
                    TriggerServerEvent('kayscore:concess:service')
                end
            })
            
            if Concess.inService then
                RageUI.Button('Faire une facture', nil, {}, true, {
                    onSelected = function()
                        local player, distance = ESX.Game.GetClosestPlayer()
                        if distance == -1 or distance > 3 then 
                            return ESX.ShowNotification('Personne aux alentours') 
                        end
                        
                        KeyboardUtils.use('Montant', function(data)
                            local data = tonumber(data)
                            if data == nil or data <= 0 then return end
                            secured_TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), ('society_%s'):format(job), VehicleDealer.data[job].label, data)
                        end)
                    end
                })
                
                RageUI.Line()
                
                RageUI.Button('Faire une annonce personnaliser', nil, {}, true, {
                    onSelected = function()
                        local jobName = ESX.PlayerData.job.name
                        KeyboardUtils.use('Contenu', function(msg)
                            if msg == nil then return end
                            secured_TriggerServerEvent('monjob:annoncer', msg, jobName)
                        end)
                    end
                })
            end -- Fermeture du if Concess.inService
        end) -- Fermeture de RageUI.IsVisible
        
        if not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
        end
    end -- Fermeture du while main
end

local catalogueSearch = nil
local catalogueVehiclesList = {}

function VehicleDealer:openCatalogue(job, position)
    catalogueVehicleList = {}
    catalogueSearch = nil
    local main = nil
    if job == 'boatdealer' then
        main = RageUI.CreateMenu('', 'Actions Disponibles')
    elseif job == 'cardealer' then
        main = RageUI.CreateMenu('', 'Actions Disponibles')
    elseif job == 'motodealer' then
        main = RageUI.CreateMenu('', 'Actions Disponibles')
    elseif job == 'airdealer' then
        main = RageUI.CreateMenu('', 'Actions Disponibles')
    end

    local vehiclesList = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    ESX.TriggerServerCallback('kayscore:vehicle_dealer:sendCategorieList', function(cb)
        if cb then
            VehicleDealer.CategorieList = cb
        end
    end, VehicleDealer.data[job].value)

    while json.encode(VehicleDealer.CategorieList) == '[]' do Wait(1) end
    
    if position == nil then
        position = VehicleDealer.position[job].catalogueSpawn.pos
    end
    RageUI.Visible(main, not RageUI.Visible(main))
    -- FreezeEntityPosition(PlayerPedId(), true)
    while main do 
        Wait(1)
        -- Vérification de la distance
        local playerPed = PlayerPedId()
        local playerPos = GetEntityCoords(playerPed)
        local dx = playerPos.x - position.x
        local dy = playerPos.y - position.y
        local dz = playerPos.z - position.z
        local distance = math.sqrt(dx * dx + dy * dy + dz * dz)

        if distance > MAX_DISTANCE then
            ESX.ShowNotification("Vous vous êtes trop éloigné du point de vente.")
            RageUI.CloseAll()
            main = nil
            DeleteEntity(VehicleDealer.LastVehicle)
            return
        end

        RageUI.IsVisible(main, function()
            RageUI.Button('Rechercher le nom d\'un véhicule', nil, {RightLabel = catalogueSearch and catalogueSearch}, true, {
                onSelected = function()
                    KeyboardUtils.use('Entrez le nom du véhicule', function(data)
                        if data == nil or data == '' then return end

                        catalogueSearch = data

                        ESX.TriggerServerCallback('kayscore:vehicle_dealer:catalogue:sendVehicleList', function(cb)
                            if cb then
                                catalogueVehiclesList = cb
                            end
                        end)
                    end)
                end
            })
            if catalogueSearch then
                RageUI.Button('❌ Stopper la recherche', nil, {}, true, {
                    onSelected = function()
                        catalogueSearch = nil
                    end
                })
            end
            RageUI.WLine()
            if catalogueSearch then
                for k,v in pairs(catalogueVehiclesList) do
                    if string.match(string.lower(v.name), string.lower(catalogueSearch)) or string.match(string.lower(v.model), string.lower(catalogueSearch)) then 
                        RageUI.List(('%s (%s)'):format(v.name, v.model), {'Sortir le véhicule'}, VehicleDealer.VehicleIndex, nil, {RightLabel = ('%s$'):format(ESX.Math.GroupDigits(v.price))}, true, {
                            onListChange = function(Index)
                                VehicleDealer.VehicleIndex = Index
                            end,
                            
                            onSelected = function()
                                if VehicleDealer.VehicleIndex == 1 then
                                    DeleteEntity(VehicleDealer.LastVehicle)
        
                                    Wait(500)
        
                                    if not ESX.Game.IsSpawnPointClear(position, 2) then
                                        CreateThread(function()
                                            ESX.Game.DeleteVehicle(VehicleDealer.LastVehicle)
                                        end)
        
                                        return
                                    end 
        
                                    Wait(500)
        
                                    ESX.Game.SpawnLocalVehicle(v.model, position, 90.0, function(vehicle)
                                        FreezeEntityPosition(vehicle, true)
                                        SetVehicleColours(vehicle, 255, 255)
                                        VehicleDealer.LastVehicle = vehicle
                                        VehicleDealer.LastVehicle2 = v.model
                                        VehicleDealer.Price = tonumber(v.price)
                                        VehicleDealer.label = v.name
                                    end)
                                end
                            end
                        })
                    end
                end
            else
                for k,v in pairs(VehicleDealer.CategorieList) do
                    RageUI.Button(('%s %s'):format('Catégorie', v.label), nil, {RightLabel = '>'}, true, {
                        onSelected = function()
                            ESX.TriggerServerCallback('kayscore:vehicle_dealer:sendVehicleWithCategorie', function(cb)
                                if cb then
                                    VehicleDealer.VehicleListCategorieList = cb
                                    RageUI.Visible(vehiclesList, true)
                                end
                            end, v.name)
                        end
                    })
                end
            end
        end)

        RageUI.IsVisible(vehiclesList, function()
            for k,v in pairs(VehicleDealer.VehicleListCategorieList) do
                RageUI.List(('%s'):format(v.name), {'Sortir le véhicule'}, VehicleDealer.VehicleIndex, nil, {RightLabel = ('~y~%s$~s~'):format(ESX.Math.GroupDigits(v.price/100*135))}, true, {
                    onActive = function()

                        if VehicleDealer.LastVehicle then
                            SetEntityHeading(VehicleDealer.LastVehicle , GetEntityHeading(VehicleDealer.LastVehicle)+0.2)
                        end
                    end, 
                    onListChange = function(Index)
                        VehicleDealer.VehicleIndex = Index
                    end,
                    onSelected = function()
                        if VehicleDealer.VehicleIndex == 1 then
                            DeleteEntity(VehicleDealer.LastVehicle)

                            Wait(500)

                            if not ESX.Game.IsSpawnPointClear(position, 2) then
                                CreateThread(function()
                                    ESX.Game.DeleteVehicle(VehicleDealer.LastVehicle)
                                end)

                                return
                            end 

                            Wait(500)

                            ESX.Game.SpawnLocalVehicle(v.model, position, 90.0, function(vehicle)
                                FreezeEntityPosition(vehicle, true)
                                SetVehicleColours(vehicle, 255, 255)
                                VehicleDealer.LastVehicle = vehicle
                                VehicleDealer.LastVehicle2 = v.model
                                VehicleDealer.Price = tonumber(v.price)
                                VehicleDealer.label = v.name
                            end)
                        end
                    end
                })
            end
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(vehiclesList) then
            main = RMenu:DeleteType('main')
            DeleteEntity(VehicleDealer.LastVehicle)
        end
    end
end


CreateThread(function()
    while not ESXLoaded do Wait(1) end

    for k,v in pairs(VehicleDealer.data) do
        RegisterCommand(k, function()
            if ESX.PlayerData.job.name == k then
                VehicleDealer:openIntercationMenu(k)
            end
        end)

        RegisterKeyMapping(k, ('Menu Concess (%s)'):format(v.label),'keyboard', 'F6')

        AddZones(k, {
            Position = VehicleDealer.position[k].actions,
            Dist = 10,
            Public = false,
            Job = {[k] = true},
            Job2 = {},
            GradesJob = {},
            InVehicleDisable = true,
            Blip = {},
            ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
            Action = function()
                VehicleDealer:openConcessMenu(k)
            end
        })
        -- AddZones(k..'_boss', {
        --     Position = VehicleDealer.position[k].management,
        --     Dist = 10,
        --     Public = false,
        --     Job = {[k] = true},
        --     Job2 = {},
        --     GradesJob = {['boss'] = true},
        --     GradesJobRequire = true,
        --     InVehicleDisable = true,
        --     Blip = {},
        --     ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
        --     Action = function()
        --         VehicleDealer:openBossMenu(k)
        --     end
        -- })
    end

   -- for k,v in pairs(VehicleDealer.data) do
    --    if VehicleDealer.position[k] == nil then goto continue end

     --   ESX.addBlips({
     --       name = ("%s"):format(k),
    --        label = v.label,
    ---        category = nil,
    ----        position = VehicleDealer.position[k].blips.position,
    --        sprite = VehicleDealer.position[k].blips.sprite,
    ---        display = VehicleDealer.position[k].blips.display,
   --         scale = VehicleDealer.position[k].blips.scale,
    --        color = VehicleDealer.position[k].blips.color,
    --    })

    --    ::continue::
 --   end

    for k,v in pairs(VehicleDealer.data) do
        if type(VehicleDealer.position[k].catalogue) == "table" then
            for i,p in pairs(VehicleDealer.position[k].catalogue) do
                AddZones('c_'..i, {
                    Position = p,
                    Dist = 10,
                    Public = true,
                    Job = nil,
                    Job2 = nil,
                    GradesJob = nil,
                    InVehicleDisable = true,
                    Blip = {},
                    ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
                    Action = function()
                        VehicleDealer:openCatalogue(k, VehicleDealer.position[k].catalogueSpawn[i].pos)
                    end
                })
            end
        else
            AddZones('c_'..k, {
                Position = VehicleDealer.position[k].catalogue,
                Dist = 10,
                Public = true,
                Job = nil,
                Job2 = nil,
                GradesJob = nil,
                InVehicleDisable = true,
                Blip = {},
                ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
                Action = function()
                    VehicleDealer:openCatalogue(k)
                end
            })
        end
    end
end)

RegisterNetEvent('kayscore:vehicle_dealer:sendBill', function(vendeur, price2, price)
    ESX.ShowNotification(('Vous avez recus une facture (~y~%s$~s~)\n\n~g~Y~s~ pour accepter\n~r~N~s~ pour refuser'):format(ESX.Math.GroupDigits(price/100*135)))

    CreateThread(function()
        local time = 20000
        while time > 0 do 
            Wait(1)

            if IsControlJustPressed(0, 246) then
                time = 0
                secured_TriggerServerEvent('kayscore:vehicle_dealer_paybill', vendeur, price, price2)
                break
            end

            if IsControlJustPressed(0, 306) then
                time = 0
                TriggerServerEvent('kayscore:vehicle_dealer_refuseBill', vendeur)
                break
            end

            time -= 1

            if time <= 0 then
                break
            end
        end
    end)
end)
