RegisterNetEvent("kayscore:waitingForPlaque")
AddEventHandler("kayscore:waitingForPlaque", function()
    Citizen.Wait(8000)
    waitingForPlaque = false
    ClearPedTasks(GetPlayerPed(-1))
end)

LSPD = {
    VehiculeSortie = {},
    playerItem = {},
    FineLister = {},
    playerWeapon = {},
    playerBlackMoney = {},
    RadarPlaced = {},
    Radar = {},
    SaisieActif = {},
    quantity = {},
    LoadoutActif = {},
    VehList = {},
    ZonesCam = {"Place des cubes", "Quartiers", "Pacifique banque"},
    inServicePolice = false,
    MenuLSPD = false,
    sServiceInfos = false,
    GarageLSPD = false,
    Extra = false,
    GestPlainte = false,
    Helico = false,
    GarageShop = false,
    PlainteActif = false,
    VestiaireLSPD = false,
    Camera = false,
    Saisie = false,
    AmmuLSPD = false,
    Index = 1,
    IndexFine = 1,
    Matricule = 1,
    IndexCustom = 1,
    ChangerCam = 1,
    ZonesCamIndex = 1,
    selecQuantity = 1,
    MyMatricule = "Aucun",
    VehiculeInfos = nil,
    ObjetSaisie = {
        [1] = {"weed","weed_pochon","coke","coke_pochon","meth","meth_pochon","opium","opium_pochon","lsd","lsd_pochon","cokeq","cokeq_pochon","weedq1","weddq_pochon","medoc","resine","resine_pochon","ipad","airpods","jouer","tvsamsmung","ordip","iphonex","chrgportable","cgnvidia","montreluxe"},
        [2] = {"WEAPON_DAGGER", "WEAPON_MACHETE", "WEAPON_BOTTLE", "WEAPON_CROWBAR", "WEAPON_HATCHET", "WEAPON_KNUCKLE", "WEAPON_WRENCH", "WEAPON_BATTLEAXE", "WEAPON_POOLCUE", "WEAPON_PISTOL","WEAPON_VINTAGEPISTOL","WEAPON_HEAVYPISTOL","WEAPON_DOUBLEACTION","WEAPON_MICROSMG","WEAPON_MACHINEPISTOL","WEAPON_MINISMG","WEAPON_COMBATPDW","WEAPON_ASSAULTSMG","WEAPON_SAWNOFFSHOTGUN","WEAPON_DBSHOTGUN","WEAPON_BULLPUPSHOTGUN","WEAPON_AUTOSHOTGUN","WEAPON_BULLPUPRIFLE","WEAPON_SPECIALCARBINE","WEAPON_COMPACTRIFLE","WEAPON_GUSENBERG","WEAPON_MOLOTOV","WEAPON_FLARE","WEAPON_ASSAULTRIFLE"},
    }
}

local timerRenfort = true
function Police_openVestiaire()
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
            RageUI.WLine()
            for k,v in pairs(kayscoreLSPD.Police.cloakroom) do
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

function radar(value)
    if value == true then
        local playerPed = PlayerPedId()
    else

    end
end

exports('getLSPDSERVICE', function()
    return kayscoreLSPD.Police.Service
end)

local CallsTable = {}
function Police_openF6()
    local main = RageUI.CreateMenu('', 'Menu Intéractions')
    local interactMenu = RageUI.CreateSubMenu(main, '', 'Menu Intéractions')
    local billMenu = RageUI.CreateSubMenu(interactMenu, '', 'Menu Amendes')
    local fouilleMenu = RageUI.CreateSubMenu(interactMenu, '', 'Menu Fouille')
    local vehicleMenu = RageUI.CreateSubMenu(main, '', 'Menu Intéractions Véhicule')
    local vehicleInfoWithPlate = RageUI.CreateSubMenu(vehicleMenu, '', 'Menu Intéractions Véhicule')
    local dogMenu = RageUI.CreateSubMenu(main, '', 'Menu K9')
    local code = RageUI.CreateSubMenu(main, '', 'Menu Codes Radio')
    local AppelTakeMenu = RageUI.CreateSubMenu(main, "", "Alerte Drogues")
    local playerAmender = RageUI.CreateSubMenu(interactMenu, '', 'Actions Disponibles')
    local drugsAlerte = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    
    local cbVehicle = {}
    local CallsTable = {}
    local CallInfo = {coords = {}, raison = '', id = nil}
    local timerRenfort = true

    vehicleInfoWithPlate.Closed = function()
        ClearPedTasks(PlayerPedId())
    end

    RageUI.Visible(main, not RageUI.Visible(main))
    
    while true do
        Wait(1)
        
        RageUI.IsVisible(main, function()
            ESX.TriggerServerCallback('kayscore:appelRetreive:job', function(calls)
                CallsTable = calls
            end)
            RageUI.Checkbox('Statut de l\'entreprise', 'Quand cette case est cochée votre ENTREPRISE est notée comme ouverte', Society.List[ESX.PlayerData.job.name].state, {}, {
                onChecked = function()
                    secured_TriggerServerEvent('kayscore:jobs:updateSocietyStatus', true)
                end,
                onUnChecked = function()
                    secured_TriggerServerEvent('kayscore:jobs:updateSocietyStatus', false)
                end
            })
            RageUI.Checkbox('Service SASP', nil, kayscoreLSPD.Police.Service, {}, {
                onChecked = function()
                    kayscoreLSPD.Police.Service = true
                    TriggerServerEvent('kayscore:LSPD:service')
                end,
                onUnChecked = function()
                    kayscoreLSPD.Police.Service = false
                    TriggerServerEvent('kayscore:LSPD:service')
                end
            })
    
            if kayscoreLSPD.Police.Service then
                RageUI.Button("Montrer son badge", nil, {}, true, {
                    onSelected = function()
                        ShowJobBadge(ESX.PlayerData.job.name)
                    end
                })
                RageUI.Button('Intéractions avec une personne', nil, {}, true, {}, interactMenu)
                RageUI.Button('Intéractions avec un véhicule', nil, {}, true, {}, vehicleMenu)
                -- RageUI.Button('Intéractions K9', nil, {}, true, {}, dogMenu)
                RageUI.Button('Codes', nil, {}, true, {}, code)
                RageUI.Button("Alertes", nil, {RightLabel = ("%s appels"):format(#CallsTable)}, true, {
                    onSelected = function()
                        CallsTable = {}
                        ESX.TriggerServerCallback('kayscore:appelRetreive:job', function(calls)
                            CallsTable = calls
                        end)
                    end
                }, drugsAlerte)
    
                RageUI.Checkbox('Radar', nil, kayscoreLSPD.Police.radar, {}, {
                    onChecked = function()
                        kayscoreLSPD.Police.radar = true
                        TriggerEvent('police:POLICE_radar')
                        TriggerServerEvent('kayscore:police:radar', true)
                    end,
                    onUnChecked = function()
                        kayscoreLSPD.Police.radar = false
                        TriggerEvent('police:POLICE_radar')
                        TriggerServerEvent('kayscore:police:radar', false)
                    end
                })
    
                RageUI.Line()
                RageUI.Button('Faire une annonce personnalisée', nil, {}, true, {
                    onSelected = function()
                        local jobName = ESX.PlayerData.job.name
                        KeyboardUtils.use('Contenu', function(msg)
                            if msg == nil then return end
                            TriggerServerEvent('monjob:annoncer', msg, ESX.PlayerData.job.name)
                        end)
                    end
                })
            end
        end)
    
        RageUI.IsVisible(drugsAlerte, function()
            if #CallsTable == 0 then
                RageUI.Separator('~r~Aucun appel en cours')
            else
                RageUI.Button('Vider la liste des appels', nil, {RightLabel = "⚠️"}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        TriggerServerEvent('kayscore:bande:clearlatable')
                    end
                })
        
                RageUI.Line()
        
                for k, v in pairs(CallsTable) do
                    RageUI.Button('#'..k..' '..v.raison, nil, {RightLabel = '>'}, true, {
                        onSelected = function()
                            CallInfo.coords = v.pos 
                            CallInfo.raison = v.raison
                            CallInfo.id = v.id
                        end
                    }, AppelTakeMenu)
                end
            end
        end)
    
        RageUI.IsVisible(AppelTakeMenu, function()
            RageUI.Button('Prendre l\'appel', nil, {}, true, {
                onSelected = function()
                    SetNewWaypoint(CallInfo.coords.x, CallInfo.coords.y)
                end
            })
            RageUI.Button('Supprimer l\'appel', nil, {}, true, {
                onSelected = function()
                    TriggerServerEvent('kayscore:appelDelete:job', CallInfo.id)
                    ESX.TriggerServerCallback('kayscore:appelRetreive:job', function(calls)
                        CallsTable = calls
                    end)
                end
            })
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
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            RageUI.Button('Mettre une amende', nil, {}, true, {
                onSelected = function()
                    if closestDistance ~= -1 and closestDistance <= 3 then
                        KeyboardUtils.use('Montant', function(data)
                            local data = tonumber(data)
                            if data == nil or data <= 0 then return end

                            secured_TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_'..ESX.PlayerData.job.name, (ESX.PlayerData.job.label), data)
                        end)
                    else
                        ESX.ShowNotification("Aucun joueur à proximité")
                    end
                end
            })   
            
            RageUI.Button('Vérifier les amendes impayé', nil, {}, true, {
                onSelected = function()
                    if closestDistance == -1 or closestDistance > 3 then return ESX.ShowNotification('Personne aux alentours') end

                    playerAmende = {}

                    ESX.TriggerServerCallback('kayscore:police:amendes', function(cb)
                        if cb then
                            playerAmende = cb
                            RageUI.Visible(playerAmender, true)
                        end
                    end, GetPlayerServerId(closestPlayer))
                end
            })

            RageUI.Button('Fouiller', nil, {}, true, {
                onSelected = function()
                    if closestDistance == -1 or closestDistance > 3 then return ESX.ShowNotification('Personne aux alentours') end
                    if ESX.isHandsUp(GetPlayerPed(closestPlayer)) then
                        exports['inv']:openPlayerLoot()
                    else
                        return ESX.ShowNotification('🤚✋La personne doit ~r~lever les mains~s~ pour être fouiller')
                    end
                end
            })
            RageUI.Button('Menotter/Demenotter', nil, {}, true, {
                onSelected = function()
                    if closestDistance == -1 or closestDistance > 3 then return ESX.ShowNotification('Personne aux alentours') end
                    TriggerServerEvent('kayscore:police:menotter', GetPlayerServerId(closestPlayer))
                end
            })
            RageUI.Button('Escorter', nil, {}, true, {
                onSelected = function()
                    if closestDistance == -1 or closestDistance > 3 then return ESX.ShowNotification('Personne aux alentours') end
                    TriggerServerEvent('kayscore:police:escoter', GetPlayerServerId(closestPlayer))
                end
            })
            RageUI.Button('Mettre dans le véhicule', nil, {}, true, {
                onSelected = function()
                    if closestDistance == -1 or closestDistance > 3 then return ESX.ShowNotification('Personne aux alentours') end
                    TriggerServerEvent('kayscore:police:putinvehicule', GetPlayerServerId(closestPlayer))
                end
            })
        end)
    
        -- RageUI.IsVisible(fouilleMenu, function()
        --     RageUI.Separator('~b~Objet trouvé~s~:')
        
        --     for i, item in pairs(kayscoreLSPD.Police.fouille.inventory) do
        --         if item.count > 0 then
        --             RageUI.Button(item.label, nil, {RightLabel = ('x' .. item.count)}, true, {
        --                 onSelected = function()
        --                     TriggerServerEvent('kayscore:police:takeitem', item.name)
        --                 end
        --             })
        --         end
        --     end
        
        --     for i, weapon in pairs(kayscoreLSPD.Police.fouille.loadout) do
        --         RageUI.Button(weapon.label, nil, {RightLabel = ('Munitions: ' .. weapon.ammo)}, true, {
        --             onSelected = function()
        --                 TriggerServerEvent('kayscore:police:takeweapon', weapon.name)
        --             end
        --         })
        --     end
        
        --     RageUI.Button('Argent', nil, {RightLabel = ('$' .. kayscoreLSPD.Police.fouille.cash)}, true, {
        --         onSelected = function()
        --             TriggerServerEvent('kayscore:police:takecash', kayscoreLSPD.Police.fouille.cash)
        --         end
        --     })
        
        --     RageUI.Button('Argent sale', nil, {RightLabel = ('$' .. kayscoreLSPD.Police.fouille.black_money)}, true, {
        --         onSelected = function()
        --             TriggerServerEvent('kayscore:police:takeblackmoney', kayscoreLSPD.Police.fouille.black_money)
        --         end
        --     })
        -- end)
        
    
        RageUI.IsVisible(vehicleMenu, function()
            local vehicle = GetVehiclePedIsIn(PlayerPedId())
            
            if vehicle then
                RageUI.Button('Vérifier la plaque', nil, {}, true, {
                    onSelected = function()
                        local getVeh = ESX.Game.GetVehicleProperties(ESX.Game.GetVehicleInDirection())
                        LSPD.VehiculeInfos = nil
                        ESX.TriggerServerCallback('kayscore:getVehiculehInfos', function(Infos)
                            LSPD.VehiculeInfos = Infos
                        end, getVeh.plate, GetDisplayNameFromVehicleModel(getVeh.model))
                        
                        waitingForPlaque = true
                        
                        if DoesEntityExist(ESX.Game.GetVehicleInDirection()) then
                            LoadAnimDict("amb@code_human_police_investigate@idle_a")
                            TaskPlayAnim(GetPlayerPed(-1), "amb@code_human_police_investigate@idle_a", "idle_b", 8.0, 0.6, -1, 49, 0, 0, 0, 0)
                        end
                    end
                }, vehicleInfoWithPlate) 
            end 
        end)
        
    
        RageUI.IsVisible(vehicleInfoWithPlate, function()
        if LSPD.VehiculeInfos then
            if LSPD.VehiculeInfos.plate == nil then
                RageUI.Separator("")
                RageUI.Separator("~r~Aucun véhicule à proximité !")
                RageUI.Separator("")
            else
                if waitingForPlaque then
                    TriggerEvent("kayscore:waitingForPlaque")                               
                    RageUI.Separator("")
                    RageUI.Separator("~p~Vérification des informations...")
                    RageUI.Separator("")
                end
                local owner = ""
                if not LSPD.VehiculeInfos.owner then owner = "Inconnu" else owner = LSPD.VehiculeInfos.owner end
                if not waitingForPlaque then
                    RageUI.Separator("~p~Propriétaire du véhicule : ~s~"..owner)
                    RageUI.Separator("~p~Model du véhicule : ~s~"..LSPD.VehiculeInfos.model)
                    RageUI.Separator("~p~Plaque d'imatriculation : ~s~"..LSPD.VehiculeInfos.plate)
                end
            end
        end
    end)
    
        -- RageUI.IsVisible(billMenu, function()
        --     RageUI.Button('Amende à 250$ pour excès de vitesse', nil, {}, true, {
        --         onSelected = function()
        --             if closestDistance == -1 or closestDistance > 3 then return ESX.ShowNotification('Personne aux alentours') end
        --             TriggerServerEvent('kayscore:police:amende', GetPlayerServerId(closestPlayer), 250)
        --         end
        --     })
        --     RageUI.Button('Amende à 500$ pour conduite dangereuse', nil, {}, true, {
        --         onSelected = function()
        --             if closestDistance == -1 or closestDistance > 3 then return ESX.ShowNotification('Personne aux alentours') end
        --             TriggerServerEvent('kayscore:police:amende', GetPlayerServerId(closestPlayer), 500)
        --         end
        --     })
        --     RageUI.Button('Amende à 1000$ pour conduite en état d\'ivresse', nil, {}, true, {
        --         onSelected = function()
        --             if closestDistance == -1 or closestDistance > 3 then return ESX.ShowNotification('Personne aux alentours') end
        --             TriggerServerEvent('kayscore:police:amende', GetPlayerServerId(closestPlayer), 1000)
        --         end
        --     })
        -- end)
    
        -- RageUI.IsVisible(dogMenu, function()
        --     RageUI.Button('Faire travailler le chien', nil, {}, true, {
        --         onSelected = function()
        --             TriggerServerEvent('kayscore:dog:working')
        --         end
        --     })
    
        --     RageUI.Button('Cacher le chien', nil, {}, true, {
        --         onSelected = function()
        --             TriggerServerEvent('kayscore:dog:hide')
        --         end
        --     })
        -- end)
    
        RageUI.IsVisible(code, function()
            RageUI.Button('Code 10-1 : Personne recherchée', nil, {}, true, {
                onSelected = function()
                    TriggerServerEvent('kayscore:codes', '10-1')
                end
            })
    
            RageUI.Button('Code 10-2 : Alarme', nil, {}, true, {
                onSelected = function()
                    TriggerServerEvent('kayscore:codes', '10-2')
                end
            })
    
            RageUI.Button('Code 10-3 : Assistance', nil, {}, true, {
                onSelected = function()
                    TriggerServerEvent('kayscore:codes', '10-3')
                end
            })
    
            RageUI.Button('Code 10-4 : Urgence', nil, {}, true, {
                onSelected = function()
                    TriggerServerEvent('kayscore:codes', '10-4')
                end
            })
        end)
    
        if not RageUI.Visible(main) and not RageUI.Visible(interactMenu) and not RageUI.Visible(vehicleMenu) and not RageUI.Visible(fouilleMenu) and not RageUI.Visible(billMenu) and not RageUI.Visible(dogMenu) and not RageUI.Visible(code) and not RageUI.Visible(drugsAlerte) and not RageUI.Visible(AppelTakeMenu) and not RageUI.Visible(vehicleInfoWithPlate) then
            break
        end
    end
end


function Police_OpenaccueilMenu()
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
                    ESX.TriggerServerCallback('kayscore:police:plainte:get', function(cb)
                        kayscoreLSPD.Police.complaint.archives = cb

                        RageUI.Visible(archives, true)
                    end)
                end
            })
        end)

        RageUI.IsVisible(registerPlaint, function()
            RageUI.Button('Date', nil, {RightLabel = kayscoreLSPD.Police.complaint.date or ''},  true, {
                onSelected = function()
                    KeyboardUtils.use('Entrer une date', function(data)
                        if data == nil or data == '' then return end
                        kayscoreLSPD.Police.complaint.date = data
                    end)
                end
            })
            RageUI.Button('Nom/Prénom de la personne', nil, {RightLabel = kayscoreLSPD.Police.complaint.name or ''}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nom/Prénom de la personne', function(data)
                        if data == nil or data == '' then return end
                        kayscoreLSPD.Police.complaint.name = data
                    end)
                end
            })
            RageUI.Button('Numéro de téléphone de la personne', nil, {RightLabel = kayscoreLSPD.Police.complaint.numberphone or ''}, true , {
                onSelected = function()
                    KeyboardUtils.use('Numéro de téléphonem de la personne', function(data)
                        if data == nil or data == '' then return end
                        kayscoreLSPD.Police.complaint.numberphone = data
                    end)
                end
            })
            RageUI.Button('Raison/Description de la plainte', nil, {RightLabel = kayscoreLSPD.Police.complaint.reason or ''}, true, {
                onSelected = function()
                    KeyboardUtils.use('Raison/Description de la plainte', function(data)
                        if data == nil or data == '' then return end
                        kayscoreLSPD.Police.complaint.reason = data
                    end)
                end
            })
            RageUI.WLine()
            RageUI.Button('Confirmer', nil, {}, true, {
                onSelected = function()
                    if kayscoreLSPD.Police.complaint.date == nil or kayscoreLSPD.Police.complaint.name == nil or kayscoreLSPD.Police.complaint.numberphone == nil or kayscoreLSPD.Police.complaint.reason == nil then return ESX.ShowNotification('Toutes les informations ne sont pas correctement complétés') end

                    TriggerServerEvent('kayscore:police:plainte:register', kayscoreLSPD.Police.complaint)
                end
            })
        end)

        RageUI.IsVisible(archives, function()
            for k,v in pairs(kayscoreLSPD.Police.complaint.archives) do
                RageUI.Button(('%s - %s'):format(v.id, v.name), v.reason, {}, true, {
                    onSelected = function()
                        kayscoreLSPD.Police.complaint.archivesSelected = v
                        RageUI.Visible(archivesSelected, true)
                    end
                })
            end
        end)

        RageUI.IsVisible(archivesSelected, function()
            RageUI.Separator(('Archive %s - %s'):format(kayscoreLSPD.Police.complaint.archivesSelected.id, kayscoreLSPD.Police.complaint.archivesSelected.name))
            RageUI.Separator(('Nom/Prenom %s'):format(kayscoreLSPD.Police.complaint.archivesSelected.name))
            RageUI.Button('Raison de la plainte', kayscoreLSPD.Police.complaint.archivesSelected.reason, {}, true, {
                onActive = function()
                    RageUI.Info('Informations', {kayscoreLSPD.Police.complaint.archivesSelected.reason}, {})
                end,
                onSelected = function()
                    
                end
            })
            RageUI.WLine()
            RageUI.Button('Changer la raison', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nouvelle raison', function(data)
                        if data == nil then return end

                        TriggerServerEvent('kayscore:police:plainte:editReason', kayscoreLSPD.Police.complaint.archivesSelected.id, data)

                        kayscoreLSPD.Police.complaint.archivesSelected.reason = data
                    end)
                end
            })
            RageUI.Button('Supprimer l\'archive', nil, {Color = {BackgroundColor = {255,0,0,100}}}, true, {
                onSelected = function()
                    exports['sPrompt']:displayRequestttt(
                        kayscoreConfigServ.ServerName,
                        'Êtes-vous sûr de vouloir supprimer cette archive ?', -- Message de confirmation
                        function() -- oui
                            TriggerServerEvent('kayscore:police:plainte:delete', kayscoreLSPD.Police.complaint.archivesSelected.id)
                            RageUI.Visible(archivesSelected, false)
                            RageUI.Visible(archives, false)
                            RageUI.Visible(main, true)
                            ESX.ShowNotification('Archive supprimée avec succès')
                        end,
                        function() -- non
                            ESX.ShowNotification('Action annulée')
                        end
                    )
                end
            })
            
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(registerPlaint) and not RageUI.Visible(archives) and not RageUI.Visible(archivesSelected) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

RegisterNetEvent('kayscore:police:renforts', function(coords, raison)
    if ESX.PlayerData.job.name ~= 'police' then return end
    if not kayscoreLSPD.Police.Service then return end

    if raison == 'petite' then
        print('renfort after petite')
        PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
        PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
        ESX.ShowAdvancedNotification('Centrale SASP', kayscoreConfigServ.GTACOLOR..'Demande de renfort', 'Demande de renfort demandé.\nRéponse : ~g~CODE-2\n~w~Importance : ~g~Légère.', 'CHAR_CALL911', 0)
        Wait(1000)
        PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
        color = 2
    elseif raison == 'importante' then
        PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
        PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
        ESX.ShowAdvancedNotification('Centrale SASP', kayscoreConfigServ.GTACOLOR..'Demande de renfort', 'Demande de renfort demandé.\nRéponse : ~g~CODE-3\n~w~Importance : ~b~Importante.', 'CHAR_CALL911', 0)
        Wait(1000)
        PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
        color = 47
    elseif raison == 'omgad' then
        PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
        PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
        PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", 1)
        ESX.ShowAdvancedNotification('Centrale SASP', kayscoreConfigServ.GTACOLOR..'Demande de renfort', 'Demande de renfort demandé.\nRéponse : ~g~CODE-99\n~w~Importance : ~r~URGENTE !\nDANGER IMPORTANT', 'CHAR_CALL911', 0)
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
end)

function Police_OpenWeaponMenu()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Button('Rendre ses armes de service', nil, {}, true, {
                onSelected = function()
                    local weaponNames = {}
                    for _, weapon in pairs(kayscoreLSPD.Police.weapons) do
                        table.insert(weaponNames, weapon.name)
                    end
                    TriggerServerEvent('kayscore:police.removeWeapon', weaponNames) 
                end
            })
            
            RageUI.WLine()
            for k,v in pairs(kayscoreLSPD.Police.weapons) do
                RageUI.Button(v.label, nil, {RightLabel = '>>'}, ESX.PlayerData.job.grade >= v.required_grade, {
                    onSelected = function()
                        secured_TriggerServerEvent('kayscore:police:giveweapon', v.name, v.label)
                    end
                })
            end
        end)

        if not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
        end
    end
end

RegisterCommand('F6_Police', function()
    if ESX.PlayerData.job.name ~= 'police' then return end

    Police_openF6()
end)
RegisterKeyMapping('F6_Police', 'Menu Intéractions SASP', 'keyboard', 'F6')

RegisterNetEvent('kayscore:police:menotter', function()

    kayscoreLSPD.Police.HandCuffed = not kayscoreLSPD.Police.HandCuffed
    local playerPed = GetPlayerPed(-1)

    Citizen.CreateThread(function()

        
        if kayscoreLSPD.Police.HandCuffed then

            RequestAnimDict('mp_arresting')
            while not HasAnimDictLoaded('mp_arresting') do
                Citizen.Wait(100)
            end

            TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)

            while kayscoreLSPD.Police.HandCuffed == true do
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
	        RageUI.setKeyState(22, false)
            ExecuteCommand(('walk %s'):format(getWalkStyle()))
        end
    end)
end)

local isEscort = false
local playerSRCEscorte = nil
RegisterNetEvent("kayscore:police:escoter", function(player)
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

RegisterNetEvent('kayscore:police:playerVehicle', function(veh, value)
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
    -- AddZones('cloakroom', {
    --     Position = kayscoreLSPD.Police.Position.cloakroom,
    --     Dist = 10,
    --     Public = false,
    --     Job = {['police'] = true},
    --     Job2 = {},
    --     GradesJob = {},
    --     InVehicleDisable = true,
    --     Blip = {
    --         Active = false,
    --         -- Position = vector3(2329.95, 2569.936, 46.67976),
    --         -- BlipId = 784,
    --         -- Color = 1,
    --         -- Scale = 0.6,
    --         -- Text = '[ILLEGAL] Craft D\'arme'
    --     },
    --     marker = true,
    --     ActionText = 'Appuyez sur ~INPUT_CONTEXT~ pour intéragir',
    --     Action = function()
    --         Police_openVestiaire()
    --     end
    -- })
    AddZones('accueil', {
        Position = kayscoreLSPD.Police.Position.accueil,
        Dist = 10,
        Public = false,
        Job = {['police'] = true},
        Job2 = {},
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = false,
            -- Position = vector3(2329.95, 2569.936, 46.67976),
            -- BlipId = 784,
            -- Color = 1,
            -- Scale = 0.6,
            -- Text = '[ILLEGAL] Craft D\'arme'
        },
        marker = true,
        ActionText = 'Appuyez sur ~INPUT_CONTEXT~ pour intéragir',
        Action = function()
            Police_OpenaccueilMenu()
        end
    })
    AddZones('weapons_menu', {
        Position = kayscoreLSPD.Police.Position.armory,
        Dist = 10,
        Public = false,
        Job = {['police'] = true},
        Job2 = {},
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = false,
            -- Position = vector3(2329.95, 2569.936, 46.67976),
            -- BlipId = 784,
            -- Color = 1,
            -- Scale = 0.6,
            -- Text = '[ILLEGAL] Craft D\'arme'
        },
        marker = true,
        ActionText = 'Appuyez sur ~INPUT_CONTEXT~ pour intéragir',
        Action = function()
            Police_OpenWeaponMenu()
        end
    })

    AddZones('weapons_menu_gouv', {
        Position = vector3(-1301.275269, -556.947510, 30.566780),
        Dist = 10,
        Public = false,
        Job = {['gouvernement'] = true},
        Job2 = {},
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = false,
            -- Position = vector3(2329.95, 2569.936, 46.67976),
            -- BlipId = 784,
            -- Color = 1,
            -- Scale = 0.6,
            -- Text = '[ILLEGAL] Craft D\'arme'
        },
        marker = true,
        ActionText = 'Appuyez sur ~INPUT_CONTEXT~ pour intéragir',
        Action = function()
            Police_OpenWeaponMenu()
        end
    })
    -- _PEDS.addPed('craft_weapons', {
    --     model = 'csb_talcc',
    --     position = vector3(2329.95, 2569.936, 46.67976),
    --     heading = 340.12387084961,
    --     scenario = {
    --         active = false,
    --         name = 'WORLD_HUMAN_CLIPBOARD',
    --         count = 0,
    --     },
    --     weapon = {
    --         active = true,
    --         weaponName = 'weapon_assaultrifle',
    --     },
    --     floatingText = {
    --         active = true,
    --         text = 'Nay',
    --         color = 34,
    --     },
    -- })
end)

RegisterNetEvent('kayscore:police:sendCode', function()
    if ESX.PlayerData.job.name ~= 'police' then return end
    if not kayscoreLSPD.Police.Service then return end
    PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
    PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
    PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", 1)
end)

local last = {}

RegisterNetEvent('kayscore:police:callDrugs', function(data)
    if ESX.PlayerData.job.name ~= 'police' then return end
    if not kayscoreLSPD.Police.Service then return end
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


