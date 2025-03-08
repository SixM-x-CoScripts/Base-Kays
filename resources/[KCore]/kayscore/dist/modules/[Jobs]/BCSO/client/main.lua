local timerRenfort2 = true
function bcso_openVestiaire()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Button('Reprendre sa tenue', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                        TriggerEvent('skinchanger:loadSkin', skin)
                    end)
                end
            })
            RageUI.Line()
            for k,v in pairs(kayscorebcso.bcso.cloakroom) do
                RageUI.Button(v.label, nil, {RightLabel = '>>'}, ESX.PlayerData.job.grade >= v.required_grade, {
                    onSelected = function()
                        local model = GetEntityModel(PlayerPedId())
    
                        if model == `mp_m_freemode_01` then
                            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                TriggerEvent('skinchanger:loadClothes', skin, v.Data.homme)
                            end) 
                        elseif model ~= `mp_f_freemode_01` then
                            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                TriggerEvent('skinchanger:loadClothes', skin, v.Data.femme)
                            end) 
                        end
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

RegisterNetEvent('kayscore:police:callDrugsnord', function(data)
    if ESX.PlayerData.job.name ~= 'bcso' then return end
    if not kayscorebcso.bcso.Service then return end
    table.insert(callsDrugs, {
        pos = data.pos
    })

    last[data.pos] = nil

    for k,v in pairs(callsDrugs) do
        if v.pos == data.pos then
            last[data.pos] = k
        end
    end

    ESX.ShowNotification(kayscoreConfigServ.GTACOLOR..'[CENTRAL]~s~\nNouvelle alerte vente de drogue')

    SetTimeout(60000, function()
        table.remove(callsDrugs, last[data.pos])
    end)
end)

function bcso_openF6()
    local main = RageUI.CreateMenu('', 'Menu Intéractions')
    local interactMenu = RageUI.CreateSubMenu(main, '', 'Menu Intéractions')
    local billMenu = RageUI.CreateSubMenu(interactMenu, '', 'Menu Amendes')
    local fouilleMenu = RageUI.CreateSubMenu(interactMenu, '', 'Menu Fouille')
    local playerAmenderbcso = RageUI.CreateSubMenu(interactMenu, '', 'Actions Disponibles')
    local vehicleMenu = RageUI.CreateSubMenu(main, '', 'Menu Intéractions Véhicule')
    local vehicleInfoWithPlate = RageUI.CreateSubMenu(vehicleMenu, '', 'Menu Intéractions Véhicule')

    local dogMenu  = RageUI.CreateSubMenu(main, '', 'Menu K9')

    local code = RageUI.CreateSubMenu(main, '', 'Menu Codes Radio')

    vehicleInfoWithPlate.Closed = function()
        ClearPedTasks(PlayerPedId())
    end

    RageUI.Visible(main, not RageUI.Visible(main))
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Checkbox('Statut de l\'entreprise', 'Quand cette case est cochée votre ENTREPRISE est notée comme ouverte', Society.List[ESX.PlayerData.job.name].state, {}, {
                onChecked = function()
                    secured_TriggerServerEvent('kayscore:jobs:updateSocietyStatus', true)
                end,
                onUnChecked = function()
                    secured_TriggerServerEvent('kayscore:jobs:updateSocietyStatus', false)
                end
            })
            RageUI.Checkbox('Service bcso', nil, kayscorebcso.bcso.Service, {}, {
                onChecked = function()
                    kayscorebcso.bcso.Service = true
                    TriggerServerEvent('kayscore:bcso:service', kayscorebcso.bcso.Service)
                end,
                onUnChecked = function()
                    kayscorebcso.bcso.Service = false
                    TriggerServerEvent('kayscore:bcso:service', kayscorebcso.bcso.Service)
                end
            })

            if kayscorebcso.bcso.Service then
                                RageUI.Button("Montrer son badge", nil, {}, true, {
                onSelected = function()
                ShowJobBadge(ESX.PlayerData.job.name)
                end
                })
                RageUI.Button('Intéractions Citoyen', nil, {}, true, {
                    onSelected = function()
                    end
                }, interactMenu)
                RageUI.Button('Intéractions Véhicule', nil, {}, true, {
                    onSelected = function()
                    end
                }, vehicleMenu)
                RageUI.Button('Intéractions K9', nil, {}, true, {
                    onSelected = function()
                        
                    end
                }, dogMenu)
                RageUI.Button('Codes Radio', nil, {}, true, {
                    onSelected = function()
                        
                    end
                }, code)
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
            end
        end)

        RageUI.IsVisible(interactMenu, function()
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            RageUI.Button("Carte d'identité", nil, {}, true, {
                onSelected = function()
                    if closestDistance ~= -1 and closestDistance <= 3.0 then
                        TriggerServerEvent('Game:Personal:Server:identity', GetPlayerServerId(closestPlayer), GetPlayerServerId(PlayerId()))
                    else
                        ESX.ShowNotification('~r~Aucun joueur~s~ à proximité')
                    end
			    end
            })
            RageUI.Button('Mettre une amende', nil, {}, true, {
                onSelected = function()
                end
            }, billMenu)
            RageUI.Button('Fouiller', nil, {}, true, {
                onSelected = function()
                    if closestDistance == -1 or closestDistance > 3 then return ESX.ShowNotification('Personne aux alentours') end
                    if ESX.isHandsUp(GetPlayerPed(closestPlayer)) then
                        ESX.TriggerServerCallback('kayscore:bcso:search', function(cb)
                            if not cb then return ESX.ShowNotification('Une erreur est survenue') end
                            if cb then
                                kayscorebcso.bcso.fouille = cb
    
                                RageUI.Visible(fouilleMenu, true)
                            end
                        end, GetPlayerServerId(closestPlayer))
                    else
                        return ESX.ShowNotification('🤚✋La personne doit ~r~lever les mains~s~ pour être fouiller')
                    end
                end
            })
            RageUI.Button('Vérifier les amendes impayé', nil, {}, true, {
                onSelected = function()
                    if closestDistance == -1 or closestDistance > 3 then return ESX.ShowNotification('Personne aux alentours') end

                    playerAmende = {}

                    ESX.TriggerServerCallback('kayscore:police:amendes', function(cb)
                        playerAmende = cb
                        RageUI.Visible(playerAmenderbcso, true)
                    end, GetPlayerServerId(closestPlayer))
                end
            })
            RageUI.Button('Menotter/Demenotter', nil, {}, true, {
                onSelected = function()
                    if closestDistance == -1 or closestDistance > 3 then return ESX.ShowNotification('Personne aux alentours') end
                    TriggerServerEvent('kayscore:bcso:menotter', GetPlayerServerId(closestPlayer))
                end
            })
            RageUI.Button('Escorter', nil, {}, true, {
                onSelected = function()
                    if closestDistance == -1 or closestDistance > 3 then return ESX.ShowNotification('Personne aux alentours') end
                    TriggerServerEvent('kayscore:bcso:escoter', GetPlayerServerId(closestPlayer))
                end
            })
            RageUI.Button('Mettre dans le véhicule', nil, {}, true, {
                onSelected = function()
                    if closestDistance == -1 or closestDistance > 3 then return ESX.ShowNotification('Personne aux alentours') end

                    local playerCoords = GetEntityCoords(PlayerPedId())
                    local vehicle = ESX.Game.GetClosestVehicle(playerCoords)

                    local vehCoords = #(playerCoords-GetEntityCoords(vehicle))

                    if vehCoords > 5 then return ESX.ShowNotification('Aucun véhicule aux alentours') end

                    TriggerServerEvent('kayscore:bcso:playerVehicle', GetPlayerServerId(closestPlayer), vehicle, 'put')
                end
            })
            RageUI.Button('Sortir du véhicule', nil, {}, true, {
                onSelected = function()
                    if closestDistance == -1 or closestDistance > 3 then return ESX.ShowNotification('Personne aux alentours') end

                    local playerCoords = GetEntityCoords(PlayerPedId())
                    local vehicle = ESX.Game.GetClosestVehicle(playerCoords)

                    local vehCoords = #(playerCoords-GetEntityCoords(vehicle))

                    if vehCoords > 5 then return ESX.ShowNotification('Aucun véhicule aux alentours') end

                    TriggerServerEvent('kayscore:bcso:playerVehicle', GetPlayerServerId(closestPlayer), vehicle, 'exit')
                end
            })
            RageUI.Button('Donner le PPA', nil, {}, true, {
                onSelected = function()
                    if closestDistance == -1 or closestDistance > 3 then
                        ESX.ShowNotification('Personne aux alentours')
                        return
                    end
                    
                    exports['sPrompt']:displayRequestttt(
                        kayscoreConfigServ.ServerName,
                        'Êtes-vous sûr de vouloir donner le PPA ?', -- Message de confirmation
                        function() -- oui
                            TriggerServerEvent('kayscore:bcso:ppa', GetPlayerServerId(closestPlayer))
                        end,
                        function() -- non
                            ESX.ShowNotification('Don du PPA annulé')
                        end
                    )
                end
            })
            
        end)
        RageUI.IsVisible(playerAmenderbcso, function()
            for k,v in pairs(playerAmende) do
                RageUI.Button(('%s (%s$)'):format(v.label, v.amount), nil, {}, true, {
                    onSelected = function()
                    end
                })
            end
        end)
        RageUI.IsVisible(billMenu, function()
            RageUI.Button('Amende Personnalisé', nil, {}, true, {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestDistance == -1 or closestDistance > 3 then return ESX.ShowNotification('Personne aux alentours') end
                    KeyboardUtils.use('Montant de l\'amande', function(data)
                        local data = tonumber(data)
                        if data == nil or data <= 0  then return end

                        TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)

                        SetTimeout(10000, function()
                            ClearPedTasks(PlayerPedId())
                            secured_TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_bcso', ('Sheriff (bcso)'), data)
                        end)
                    end)
                end
            })
            RageUI.Button('Rechercher', nil, {RightLabel = kayscorebcso.bcso.bill.Search or ''}, true, {
                onSelected = function()
                    KeyboardUtils.use('Rechercher', function(data)
                        kayscorebcso.bcso.bill.Search = data
                    end)
                end
            })
            if kayscorebcso.bcso.bill.Search then
                RageUI.Button('❌ Arrêter la rechercher', nil, {}, true, {
                    onSelected = function()
                        kayscorebcso.bcso.bill.Search = nil
                    end
                })
            end
            RageUI.Line()
            for k,v in pairs(kayscorebcso.bcso.bill.Data) do
                local buttonName = v.reason
                if kayscorebcso.bcso.bill.Search then
                    if (string.match(string.lower(buttonName), string.lower(kayscorebcso.bcso.bill.Search))) then
                        RageUI.Button(buttonName, nil, {RightLabel = ('~y~%s$~s~'):format(v.price)}, true, {
                            onSelected = function()
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                if closestDistance == -1 or closestDistance > 3 then
                                    ESX.ShowNotification('Personne aux alentours')
                                    return
                                end
                                
                                exports['sPrompt']:displayRequestttt(
                                    kayscoreConfigServ.ServerName,
                                    ('Voulez-vous facturer %s$ à %s ?'):format(v.price, GetPlayerName(closestPlayer)), -- Message de confirmation
                                    function() -- oui
                                        TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
                        
                                        SetTimeout(10000, function()
                                            ClearPedTasks(PlayerPedId())
                                            secured_TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_bcso', 'Sheriff (bcso)', v.price)
                                        end)
                                    end,
                                    function() -- non
                                        ESX.ShowNotification('Facturation annulée')
                                    end
                                )
                            end
                        })
                        
                    end 
                else
                    RageUI.Button(buttonName, nil, {RightLabel = ('~y~%s$~s~'):format(v.price)}, true, {
                        onSelected = function()
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                            if closestDistance == -1 or closestDistance > 3 then
                                ESX.ShowNotification('Personne aux alentours')
                                return
                            end
                            
                            exports['sPrompt']:displayRequestttt(
                                kayscoreConfigServ.ServerName,
                                ('Voulez-vous facturer %s$ à %s ?'):format(v.price, GetPlayerName(closestPlayer)), -- Message de confirmation
                                function() -- oui
                                    secured_TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_bcso', 'Sheriff (bcso)', v.price)
                                end,
                                function() -- non
                                    ESX.ShowNotification('Facturation annulée')
                                end
                            )
                        end
                    })
                    
                end
            end
        end)

        RageUI.IsVisible(vehicleMenu, function()
            RageUI.Button('Rechercher une plaque', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Entrer la plaque', function(data)
                        cbVehicle = {}
                        ESX.TriggerServerCallback('kayscore:bcso:vehicle:searchPlate', function(cb)
                            cbVehicle = cb
                            ExecuteCommand('e tablet2')
                            RageUI.Visible(vehicleInfoWithPlate, true)
                        end, data)
                    end)
                end
            })
            RageUI.Button('Placer le véhicule en fourrière', nil, {}, true, {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local playerCoords = GetEntityCoords(playerPed)
                    local vehicle = ESX.Game.GetClosestVehicle(playerCoords)

                    local vehCoords = #(playerCoords-GetEntityCoords(vehicle))

                    if vehCoords > 5 then return ESX.ShowNotification('Aucun véhicule aux alentours') end

                    ExecuteCommand('e mechanic3')

                    SetTimeout(10000, function()
                        ClearPedTasks(playerPed)
                        TriggerServerEvent('kayscore:Service:delVeh', NetworkGetNetworkIdFromEntity(vehicle))
                    end)
                end
            })
            RageUI.Button('Crocheter le véhicule', nil, {}, true, {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local playerCoords = GetEntityCoords(playerPed)
                    local vehicle = ESX.Game.GetClosestVehicle(playerCoords)

                    local vehCoords = #(playerCoords-GetEntityCoords(vehicle))

                    if vehCoords > 5 then return ESX.ShowNotification('Aucun véhicule aux alentours') end

                    TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)

                    SetTimeout(10000, function()
                        SetVehicleDoorsLocked(vehicle, 1)
                    end)
                end
            })
        end)
        
        RageUI.IsVisible(vehicleInfoWithPlate, function()
            RageUI.Separator(('Plaque du véhicule [%s]'):format(cbVehicle.plate))
            RageUI.Separator(('Propriétaire du véhicule (%s)'):format(cbVehicle.owner))
        end)

        RageUI.IsVisible(fouilleMenu, function()
            local permissionsFouille = {['officier3'] = true, ['officierprincipal'] = true, ['sergent1'] = true, ['sergent2'] = true, ['lieutenant'] = true, ['capitaine'] = true, ['boss'] = true}
            RageUI.Button('Argent Propre', nil, {RightLabel = ('~y~%s$~s~'):format(kayscorebcso.bcso.fouille.cash)}, true, {
                onSelected = function()
                    
                end
            })
            RageUI.Button('Argent Sale', nil, {RightLabel = ('~r~%s$~s~'):format(kayscorebcso.bcso.fouille.black_money)}, true, {
                onSelected = function()
                    KeyboardUtils.use('Quantité', function(data)
                        local data = tonumber(data)

                        if data == nil or data <= 0  then return end

                        if kayscorebcso.bcso.fouille.black_money < data then
                            return ESX.ShowNotification('La personne n\'en possède pas assez')
                        end

                        kayscorebcso.bcso.fouille.black_money -= data

                        TriggerServerEvent('kayscore:bcso:removeMoney', data, kayscorebcso.bcso.fouille.id)
                    end)
                end
            })
            RageUI.Line()
            RageUI.Separator('Inventaire')
            for k,v in pairs(kayscorebcso.bcso.fouille.inventory) do
                RageUI.Button(v.label, nil, {RightLabel = ('~y~x%s~s~'):format(v.count)}, true, {
                    onSelected = function()
                        if not permissionsFouille[ESX.PlayerData.job.grade_name] then return ESX.ShowNotification('~r~Vous n\'avez pas les permissions nécessaires~s~') end

                        KeyboardUtils.use('Quantité', function(data)
                            local data = tonumber(data)

                           kayscorebcso.bcso.fouille.inventory[k].count -= data

                            if kayscorebcso.bcso.fouille.inventory[k].count <= 0 then
                                kayscorebcso.bcso.fouille.inventory[k] = nil
                            end

                            TriggerServerEvent('kayscore:bcso:removeItem', data, v.name, kayscorebcso.bcso.fouille.id, v.label)
                        end)
                    end
                })
            end
            RageUI.Separator('Arme(s)')
            for k,v in pairs(kayscorebcso.bcso.fouille.loadout) do
                RageUI.Button(v.label, nil, {RightLabel = ('Munitions: ~y~x%s~s~'):format(v.ammo)}, not kayscoreConfigServ.PermanantWeapon(v.name), {
                    onSelected = function()
                        if not permissionsFouille[ESX.PlayerData.job.grade_name] then
                            ESX.ShowNotification('~r~Vous n\'avez pas les permissions nécessaires~s~')
                            return
                        end
                        
                        exports['sPrompt']:displayRequestttt(
                            kayscoreConfigServ.ServerName,
                            ('Voulez-vous retirer l\'arme %s à %s ?'):format(v.label, kayscorebcso.bcso.fouille.id), -- Message de confirmation
                            function() -- oui
                                TriggerServerEvent('kayscore:bcso.removeWeapon', v.name, kayscorebcso.bcso.fouille.id, v.label)
                                kayscorebcso.bcso.fouille.loadout[k] = nil
                            end,
                            function() -- non
                                ESX.ShowNotification('Action annulée')
                            end
                        )
                    end
                })
                
            end
        end)

        RageUI.IsVisible(dogMenu, function()
            RageUI.Button("Sortir/Rentrer le chien", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    if not DoesEntityExist(bcsoDog) then
                        RequestModel(351016938)
                        while not HasModelLoaded(351016938) do Wait(0) end
                        bcsoDog = CreatePed(4, 351016938, GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, -0.98), 0.0, true, false)
                        SetEntityAsMissionEntity(bcsoDog, true, true)
                        ESX.ShowNotification('~g~Chien Spawn')
                    else
                        ESX.ShowNotification('~r~Chien Rentrer')
                        DeleteEntity(bcsoDog)
                    end
                end
            })

            RageUI.Button("Demander de s\assoire", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    if DoesEntityExist(bcsoDog) then
                        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(bcsoDog), true) <= 5.0 then
                            if IsEntityPlayingAnim(bcsoDog, "creatures@rottweiler@amb@world_dog_sitting@base", "base", 3) then
                                ClearPedTasks(bcsoDog)
                            else
                                loadDict('rcmnigel1c')
                                TaskPlayAnim(PlayerPedId(), 'rcmnigel1c', 'hailing_whistle_waive_a', 8.0, -8, -1, 120, 0, false, false, false)
                                Wait(2000)
                                loadDict("creatures@rottweiler@amb@world_dog_sitting@base")
                                TaskPlayAnim(bcsoDog, "creatures@rottweiler@amb@world_dog_sitting@base", "base", 8.0, -8, -1, 1, 0, false, false, false)
                            end
                        else
                            ESX.ShowNotification('dog_too_far')
                        end
                    else
                        ESX.ShowNotification('no_dog')
                    end
                end
            })
        end)

        RageUI.IsVisible(code, function()
            RageUI.Separator('Demande de renforts')
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            RageUI.Button('Petite demande de renforts', nil, {}, timerRenfort2, {
                onSelected = function()
                    timerRenfort2 = false
                    Citizen.SetTimeout(120000, function()
                        timerRenfort2 = true
                    end)
                    TriggerServerEvent('kayscore:bcso:renforts', playerCoords, 'petite')
                end
            })
            RageUI.Button('Moyenne demande de renforts', nil, {}, timerRenfort2, {
                onSelected = function()
                    timerRenfort2 = false
                    Citizen.SetTimeout(120000, function()
                        timerRenfort2 = true
                    end)
                    TriggerServerEvent('kayscore:bcso:renforts', playerCoords, 'importante')
                end
            })
            RageUI.Button('Grande demande de renforts', nil, {}, timerRenfort2, {
                onSelected = function()
                    timerRenfort2 = false
                    Citizen.SetTimeout(120000, function()
                        timerRenfort2 = true
                    end)
                    TriggerServerEvent('kayscore:bcso:renforts', playerCoords, 'omgad')
                end
            })
            RageUI.Separator('Codes')
            for k,v in pairs(kayscorebcso.bcso.codes) do
                RageUI.Button(v.buttonName, nil, {}, timerRenfort2, {
                    onSelected = function()
                        timerRenfort2 = false
                        Citizen.SetTimeout(120000, function()
                            timerRenfort2 = true
                        end)
                        TriggerServerEvent('kayscore:bcso:sendCode', v.message)
                    end
                })
            end
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(interactMenu) and not RageUI.Visible(billMenu) and not RageUI.Visible(fouilleMenu) and not RageUI.Visible(vehicleMenu) and not RageUI.Visible(vehicleInfoWithPlate) and not RageUI.Visible(dogMenu) and not RageUI.Visible(code) then
            main = RMenu:DeleteType('main')
        end
    end
end

function bcso_OpenAccueilMenu()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')
    local registerPlaint = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local archives = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local archivesSelected = RageUI.CreateSubMenu(archives, '', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Button('Enregistrer une plainte', nil, {}, true, {
                onSelected = function()
                    
                end
            }, registerPlaint)
            RageUI.Button('Acceder aux archives', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('kayscore:bcso:plainte:get', function(cb)
                        kayscorebcso.bcso.complaint.archives = cb

                        RageUI.Visible(archives, true)
                    end)
                end
            })
        end)

        RageUI.IsVisible(registerPlaint, function()
            RageUI.Button('Date', nil, {RightLabel = kayscorebcso.bcso.complaint.date or ''},  true, {
                onSelected = function()
                    KeyboardUtils.use('Entrer une date', function(data)
                        if data == nil or data == '' then return end
                        kayscorebcso.bcso.complaint.date = data
                    end)
                end
            })
            RageUI.Button('Nom/Prénom de la personne', nil, {RightLabel = kayscorebcso.bcso.complaint.name or ''}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nom/Prénom de la personne', function(data)
                        if data == nil or data == '' then return end
                        kayscorebcso.bcso.complaint.name = data
                    end)
                end
            })
            RageUI.Button('Numéro de téléphone de la personne', nil, {RightLabel = kayscorebcso.bcso.complaint.numberphone or ''}, true , {
                onSelected = function()
                    KeyboardUtils.use('Numéro de téléphonem de la personne', function(data)
                        if data == nil or data == '' then return end
                        kayscorebcso.bcso.complaint.numberphone = data
                    end)
                end
            })
            RageUI.Button('Raison/Description de la plainte', nil, {RightLabel = kayscorebcso.bcso.complaint.reason or ''}, true, {
                onSelected = function()
                    KeyboardUtils.use('Raison/Description de la plainte', function(data)
                        if data == nil or data == '' then return end
                        kayscorebcso.bcso.complaint.reason = data
                    end)
                end
            })
            RageUI.Line()
            RageUI.Button('Confirmer', nil, {}, true, {
                onSelected = function()
                    if kayscorebcso.bcso.complaint.date == nil or kayscorebcso.bcso.complaint.name == nil or kayscorebcso.bcso.complaint.numberphone == nil or kayscorebcso.bcso.complaint.reason == nil then return ESX.ShowNotification('Toutes les informations ne sont pas correctement complétés') end

                    TriggerServerEvent('kayscore:bcso:plainte:register', kayscorebcso.bcso.complaint)
                end
            })
        end)

        RageUI.IsVisible(archives, function()
            for k,v in pairs(kayscorebcso.bcso.complaint.archives) do
                RageUI.Button(('%s - %s'):format(v.id, v.name), v.reason, {}, true, {
                    onSelected = function()
                        kayscorebcso.bcso.complaint.archivesSelected = v
                        RageUI.Visible(archivesSelected, true)
                    end
                })
            end
        end)

        RageUI.IsVisible(archivesSelected, function()
            RageUI.Separator(('Archive %s - %s'):format(kayscorebcso.bcso.complaint.archivesSelected.id, kayscorebcso.bcso.complaint.archivesSelected.name))
            RageUI.Separator(('Nom/Prenom %s'):format(kayscorebcso.bcso.complaint.archivesSelected.name))
            RageUI.Button('Raison de la plainte', kayscorebcso.bcso.complaint.archivesSelected.reason, {}, true, {
                onActive = function()
                    RageUI.Info('Informations', {kayscorebcso.bcso.complaint.archivesSelected.reason}, {})
                end,
                onSelected = function()
                    
                end
            })
            RageUI.Line()
            RageUI.Button('Changer la raison', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nouvelle raison', function(data)
                        if data == nil then return end

                        TriggerServerEvent('kayscore:bcso:plainte:editReason', kayscorebcso.bcso.complaint.archivesSelected.id, data)

                        kayscorebcso.bcso.complaint.archivesSelected.reason = data
                    end)
                end
            })
            RageUI.Button('Supprimer l\'archive', nil, {Color = {BackgroundColor = {255,0,0,100}}}, true, {
                onSelected = function()
                    exports['sPrompt']:displayRequestttt(
                        kayscoreConfigServ.ServerName,
                        'Êtes-vous sûr de vouloir supprimer cette archive ?', -- Message de confirmation
                        function() -- oui
                            TriggerServerEvent('kayscore:bcso:plainte:delete', kayscorebcso.bcso.complaint.archivesSelected.id)
            
                            RageUI.Visible(archivesSelected, false)
                            RageUI.Visible(archives, false)
                            RageUI.Visible(main, true)
                        end,
                        function() -- non
                            ESX.ShowNotification('Action annulée')
                        end
                    )
                end
            })
            
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(registerPlaint) and not RageUI.Visible(playerAmenderbcso) and not RageUI.Visible(archives) and not RageUI.Visible(archivesSelected) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

RegisterNetEvent('kayscore:bcso:renforts', function(coords, raison)
    if ESX.PlayerData.job.name == 'bcso' or ESX.PlayerData.job.name == 'bcsosandy' then
    if not kayscorebcso.bcso.Service then return end
    if raison == 'petite' then
        PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
        PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
        ESX.ShowAdvancedNotification('Centrale bcso', kayscoreConfigServ.GTACOLOR..'Demande de renfort', 'Demande de renfort demandé.\nRéponse : ~g~CODE-2\n~w~Importance : ~g~Légère.', 'CHAR_CALL911', 0)
        Wait(1000)
        PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
        color = 2
    elseif raison == 'importante' then
        PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
        PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
        ESX.ShowAdvancedNotification('Centrale bcso', kayscoreConfigServ.GTACOLOR..'Demande de renfort', 'Demande de renfort demandé.\nRéponse : ~g~CODE-3\n~w~Importance : ~p~Importante.', 'CHAR_CALL911', 0)
        Wait(1000)
        PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
        color = 47
    elseif raison == 'omgad' then
        PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
        PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
        PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", 1)
        ESX.ShowAdvancedNotification('Centrale bcso', kayscoreConfigServ.GTACOLOR..'Demande de renfort', 'Demande de renfort demandé.\nRéponse : ~g~CODE-99\n~w~Importance : ~r~URGENTE !\nDANGER IMPORTANT', 'CHAR_CALL911', 0)
        Wait(1000)
        PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
        PlaySoundFrontend(-1, "FocusOut", "HintCamSounds", 1)
        color = 1
    end
    local blipId = AddBlipForCoord(coords)
    SetBlipSprite(blipId, 161)
    SetBlipScale(blipId, 1.2)
    SetBlipColour(blipId, color)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Demande renfort')
    EndTextCommandSetBlipName(blipId)
    Wait(80 * 1000)
    RemoveBlip(blipId)
    end
end)

function bcso_OpenWeaponMenu()
    local main = RageUI.CreateMenu('', 'Actions Disponibles', nil, nil, "shopui_title_gunclub", "shopui_title_gunclub")

    RageUI.Visible(main, not RageUI.Visible(main))
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            for k,v in pairs(kayscorebcso.bcso.weapons) do
                RageUI.Button(v.label, nil, {RightLabel = '>>'}, ESX.PlayerData.job.grade >= v.required_grade, {
                    onSelected = function()
                        TriggerServerEvent('kayscore:bcso:giveweapon', v.name)
                    end
                })
            end
        end)

        if not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
        end
    end
end

RegisterCommand('F6_bcso', function()
    if ESX.PlayerData.job.name == 'bcso' or ESX.PlayerData.job.name == 'bcsosandy' then

    bcso_openF6()
    end
end)
RegisterKeyMapping('F6_bcso', 'Menu Intéractions bcso', 'keyboard', 'F6')

RegisterNetEvent('kayscore:bcso:menotter', function()

    kayscorebcso.bcso.HandCuffed = not kayscorebcso.bcso.HandCuffed
    local playerPed = GetPlayerPed(-1)

    Citizen.CreateThread(function()

        
        if kayscorebcso.bcso.HandCuffed then

            RequestAnimDict('mp_arresting')
            while not HasAnimDictLoaded('mp_arresting') do
                Citizen.Wait(100)
            end

            TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)

            while kayscorebcso.bcso.HandCuffed == true do
                Wait(0)
                SetPedCanBeDraggedOut(GetPlayerPed(-1), false)
                DisableControlAction(27, 75, true) -- Désactive le bouton de sortie (INPUT_VEH_EXIT)
                DisableControlAction(0, 23, true) -- Désactive le bouton de sortie (INPUT_ENTER)
                DisableControlAction(2, 37, true)
                SetEnableHandcuffs(playerPed, true)
                SetPedCanPlayGestureAnims(playerPed, false)
                FreezeEntityPosition(playerPed,  true)
                DisableControlAction(0, 75, true)
                DisableControlAction(1, 75, true)
                DisableControlAction(0, 24, true) -- Attack
                DisableControlAction(0, 257, true) -- Attack 2
                DisableControlAction(0, 25, true) -- Aim
                DisableControlAction(0, 263, true) -- Melee Attack 1
                DisableControlAction(0, 37, true) -- Select Weapon
                DisableControlAction(0, 47, true)  -- Disable weapon
                RageUI.setKeyState(21, true)
	            RageUI.setKeyState(22, true)
            end

        else
            ClearPedSecondaryTask(playerPed)
            SetEnableHandcuffs(playerPed, false)
            SetPedCanPlayGestureAnims(playerPed,  true)
            FreezeEntityPosition(playerPed, false)
            RageUI.setKeyState(21, false)
            ExecuteCommand(('walk %s'):format(getWalkStyle()))
	        RageUI.setKeyState(22, false)
        end
    end)
end)

local isEscort = false
local playerSRCEscorte = nil
RegisterNetEvent("kayscore:bcso:escoter", function(player)
    isEscort = not isEscort
    playerSRCEscorte = tonumber(player)
    if isEscort then
        Citizen.CreateThread(function()
            local pPed = GetPlayerPed(-1)
            while isEscort do
                Wait(1)
                pPed = GetPlayerPed(-1)
                local targetPed = GetPlayerPed(GetPlayerFromServerId(playerSRCEscorte))
    
                if not IsPedSittingInAnyVehicle(targetPed) then
                    AttachEntityToEntity(pPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                else
                    isEscort = false
                    DetachEntity(pPed, true, false)
                end
    
                if IsPedDeadOrDying(targetPed, true) then
                    isEscort = false
                    DetachEntity(pPed, true, false)
                end
            end
            DetachEntity(pPed, true, false)
        end)
    end
end)

RegisterNetEvent('kayscore:bcso:playerVehicle', function(veh, value)
    local playerPed = PlayerPedId()
    if value == 'put' then
        CreateThread(function()
            local coords = GetEntityCoords(playerPed)

            if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

                local vehicle = ESX.Game.GetClosestVehicle(coords)

                if DoesEntityExist(vehicle) then

                    local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
                    local freeSeat = nil

                    for i=maxSeats - 1, 0, -1 do
                        if IsVehicleSeatFree(vehicle,  i) then
                            freeSeat = i
                            break
                        end
                    end

                    if freeSeat ~= nil then
                        TaskWarpPedIntoVehicle(playerPed,  vehicle,  freeSeat)
                    end

                end
            end
        end)
    elseif value == 'exit' then
        CreateThread(function()
            TaskLeaveAnyVehicle(PlayerPedId(), 0.0, 0.0)
        end)
    end
end)

CreateThread(function()
    while not ESXLoaded do Wait(1) end
    -- AddZones('cloakroom_bcso', {
    --     Position = kayscorebcso.bcso.Position.cloakroom,
    --     Dist = 10,
    --     Public = false,
    --     Job = {['bcso'] = true},
    --     Job2 = {['bcso'] = true},
    --     GradesJob = {},
    --     InVehicleDisable = true,
    --     Blip = {
    --         Active = false,
    --     },
    --     marker = true,
    --     ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
    --     Action = function()
    --         bcso_openVestiaire()
    --     end
    -- })
    AddZones('accueil_bcsosandy', {
        Position = kayscorebcso.bcso.Position.accueilsandy,
        Dist = 10,
        Public = false,
        Job = {['bcsosandy'] = true},
        Job2 = {['bcsosandy'] = true},
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = false,
        },
        marker = true,
        ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
        Action = function()
            bcso_OpenAccueilMenu()
        end
    })
    AddZones('accueil_bcso', {
        Position = kayscorebcso.bcso.Position.accueil,
        Dist = 10,
        Public = false,
        Job = {['bcso'] = true},
        Job2 = {['bcso'] = true},
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = false,
        },
        marker = true,
        ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
        Action = function()
            bcso_OpenAccueilMenu()
        end
    })
    AddZones('weapons_menu_bcsosandy', {
        Position = kayscorebcso.bcso.Position.armorysandy,
        Dist = 10,
        Public = false,
        Job = {['accueilsandy'] = true},
        Job2 = {['accueilsandy'] = true},
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = false,
        },
        marker = true,
        ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
        Action = function()
            bcso_OpenWeaponMenu()
        end
    })
    AddZones('weapons_menu_bcso', {
        Position = kayscorebcso.bcso.Position.armory,
        Dist = 10,
        Public = false,
        Job = {['bcso'] = true},
        Job2 = {['bcso'] = true},
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = false,
        },
        marker = true,
        ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
        Action = function()
            bcso_OpenWeaponMenu()
        end
    })
end)

RegisterNetEvent('kayscore:bcso:sendCode', function()
    if ESX.PlayerData.job.name == 'bcso' or ESX.PlayerData.job.name == 'bcsosandy' then
    if not kayscorebcso.bcso.Service then return end
    PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
    PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
    PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", 1)
    end
end)