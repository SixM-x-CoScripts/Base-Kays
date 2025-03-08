local propsPropsList = {}
local pma = exports["pma-voice"]
cloneInterface = true
cinemamode = false
hudhide = true
menumap = true
casque = true
moto = false
crosshairactive = true
fighthand = true
covermod = false
silenceTimeIndexSingle = 1
silenceTimeIndexSingleVotes = 1
silenceTimeList = {
    "5 minutes",
    "10 minutes",
    "15 minutes",
    "20 minutes",
    "25 minutes",
    "30 minutes",
    "1 heure",
}

blackListedRole = {
    ['police'] = true,
    ['bcso'] = true,
    ['ambulance'] = true,
    ['gouvernement'] = true
}

--coupdecrossmv = false
--rouladeMGL = true
    Citizen.CreateThread(function()
        while not crosshairactive do
            HideHudComponentThisFrame(14)
            Citizen.Wait(0)
        end
    end)
    function crosshair()
        HideHudComponentThisFrame(14)
    end
    Citizen.CreateThread(function()
        while not fighthand do
            local sleepTime = 750
            if Player.weapon == `WEAPON_UNARMED` then
                sleepTime = 0
                DisableControlAction(0, 24)
                DisableControlAction(0, 140)
            end
            Citizen.Wait(sleepTime)
        end
    end)
Citizen.CreateThread(function()
     while covermod do
        DisableControlAction(0, 44)
        Citizen.Wait(0)
        end
    end)
function ChangePedModel(pedIndex, skinModel)
    if GetSafeZone() then
    local ped = PlayerPedId()
    if DoesEntityExist(ped) then
        RequestModel(skinModel)
        while not HasModelLoaded(skinModel) do
            Wait(1)
        end
        SetPlayerModel(PlayerId(), skinModel)
        SetPedDefaultComponentVariation(ped)
        SetModelAsNoLongerNeeded(skinModel)
        end
    end
end
Citizen.CreateThread(function()
    Citizen.Wait(1000) 
    fetchNumberOfSocieties()
end)
local vip_plates = {}

exports('activeCloneInterface', function()
    return cloneInterface
end)

local weaponTint = {
    {id = 0, name = "Normal"},
    {id = 1, name = "Vert"},
    {id = 2, name = "Or"},
    {id = 3, name = "Rose"},
    {id = 4, name = "Armée"},
    {id = 5, name = "SASP"},
    {id = 6, name = "Orange"},
    {id = 7, name = "Platine"},
}

local posjob = {
    ['taxi'] = {z = 73.4714, x = 916.642, y= -170.5425},
    ['ambulance'] = {z = 43.28411, x = 306.8368, y = -601.4506},
    ['gouvernement'] = {z = 43.28411, x = 306.8368, y = -601.4506},
    ['starpizza'] = {z = -1352.5557861328126, x = -1352.5557861328126, y = -1055.9505615234376},
    ['bcso'] = {z = -1352.5557861328126, x = -437.8479614257813, y = 6011.97412109375},
    ['airdealer'] = {z = -1352.5557861328126, x = -900.5676879882813, y = 19.84539794921875},
    ['police'] = {z = -1352.5557861328126, x = 438.5268, y = -982.1306},
    ['motodealer'] = {z = -1352.5557861328126, x = 955.5384521484376, y = -118.72398376464844},
    ['boatdealer'] = {z = -1352.5557861328126, x = -805.7225341796875, y = -1368.7467041015626},
    ['cardealer'] = {z = -1352.5557861328126, x = -23.51351356506347, y = -1102.084716796875},

}


local fetchedNumberOfSocieties = false
local NumberSocietyStatus = 0

function fetchNumberOfSocieties()
    if not fetchedNumberOfSocieties then
        ESX.TriggerServerCallback('kayscore:getNumberOfSocieties', function(numberOfSocieties)
            NumberSocietyStatus = numberOfSocieties
            fetchedNumberOfSocieties = true
            -- print('Nombre de sociétés récupéré:', NumberSocietyStatus)
        end)
    end
end


IndexAim = 1

local cross = true
local self = {}
self.radioEnabled = false
self.radioChannel = 0 
self.showVolume = false
self.radioTick = false
self.volumeRadio = 1
function openPersonnalMenu()

    if getIsDead() then return end

    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    local vipMenu = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local petMenu = RageUI.CreateSubMenu(vipMenu, '', 'Actions Disponibles')

    local openVipPeds = RageUI.CreateSubMenu(vipMenu, '', 'Actions Disponibles')

    local selectedWeaponTint = RageUI.CreateSubMenu(vipMenu, '', 'Actions Disponibles')

    local vipPlates = RageUI.CreateSubMenu(vipMenu, '', 'Actions Disponibles')
    
    local vipPlateGestion = RageUI.CreateSubMenu(vipMenu, '', 'Actions Disponibles')

    local Portefeuille = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local CustomMenu = RageUI.CreateSubMenu(vipMenu, '', 'Actions Disponibles')
    local CustomMenuSelected = RageUI.CreateSubMenu(CustomMenu, '', 'Actions Disponibles')

    local radioMenu = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local VehicleOption = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local EntrepriseOption = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local OptionsVisuels = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    
    local visualconfig = RageUI.CreateSubMenu(OptionsVisuels, '', 'Actions Disponibles')

    local Notifmeny = RageUI.CreateSubMenu(visualconfig, '', 'Actions Disponibles')

    local OptiMenu = RageUI.CreateSubMenu(visualconfig, '', 'Actions Disponibles')

    local ModifMenu = RageUI.CreateSubMenu(visualconfig, '', 'Actions Disponibles')

    local OpenReportFast = RageUI.CreateSubMenu(OptionsVisuels, '', 'Actions Disponibles')
    
    local weaponsAnimationsMenu = RageUI.CreateSubMenu(FightModif, '', 'Actions Disponibles')
    
    local carconfig = RageUI.CreateSubMenu(OptionsVisuels, '', 'Actions Disponibles')

    local FightModif = RageUI.CreateSubMenu(OptionsVisuels, '', 'Actions Disponibles')

    local weaponsBind = RageUI.CreateSubMenu(OptionsVisuels, '', 'Actions Disponibles')

    local weaponsBindList = RageUI.CreateSubMenu(weaponsBind, '', 'Actions Disponibles')

    local stautinfo = RageUI.CreateSubMenu(OptionsVisuels, '', 'Actions Disponibles')
    
    local walksList = RageUI.CreateSubMenu(OptionsVisuels, '', 'Actions Disponibles')

    local openSocietyList = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local propsMenu = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local clothesMenu = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local clothesMenu2 = RageUI.CreateSubMenu(clothesMenu, '', 'Actions Disponibles')

    local factures = RageUI.CreateSubMenu(Portefeuille, '', 'Actions Disponibles')

    local guids = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local gestionlicense = RageUI.CreateSubMenu(Portefeuille, '', 'Actions Disponibles')

    local infojob = RageUI.CreateSubMenu(Portefeuille, '', 'Actions Disponibles')

    local infojob2 = RageUI.CreateSubMenu(Portefeuille, '', 'Actions Disponibles')

    local drugsmod = RageUI.CreateSubMenu(main, '', 'Actions Disponibles') 

    propsMenu.Closed = function()
        if DoesEntityExist(previewPropMenu) then
            DeleteEntity(previewPropMenu)
        end
    end
    radioMenu.EnableMouse = true
    RageUI.Visible(main, not RageUI.Visible(main))
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            if kayscoreConfigServ.RageUI.Header == true then
            RageUI.Separator(string.format("%s: %s", "ID Unique", Player.UniqueID))
            end
            --RageUI.Info(("%sInformations Personnel~s~"):format(UTILS.COLORCODE), {"ID Unique", "Entreprise", "Groupe Illégal", "Argent Propre", "Argent en Banque", "Argent Sale"}, {Player.UniqueID, ('%s (%s)'):format(Player.job.label, Player.job.grade_label), ('%s (%s)'):format(Player.job2.label, Player.job2.grade_label), ("~g~%s$~s~"):format(ESX.getAccountMoney("cash")), (kayscoreConfigServ.GTACOLOR.."%s$~s~"):format(ESX.getAccountMoney("bank")), ("~r~%s$~s~"):format(ESX.getAccountMoney("black_money"))})
            RageUI.Separator(string.format("%s: %s", "ID Unique", Player.UniqueID))
            RageUI.Button("Portefeuille", "Votre Portefeuille", {RightLabel = ""}, true, {
                onSelected = function()
                    
                end
            }, Portefeuille)
            RageUI.Button(('Statut des entreprises (%s)'):format(NumberSocietyStatus), nil, {RightLabel = ""}, true, {
                onSelected = function() 

                end
            }, openSocietyList)
            if IsPedSittingInAnyVehicle(Player.playerPed) then 
                RageUI.Button('Gestion véhicule', 'Actions sur le véhicule', {RightLabel = ""}, true, {}, VehicleOption)
            end
            RageUI.Button('Objets', nil, {RightLabel = ""}, true, {
                onSelected = function()
                    TriggerServerEvent('kayscore:personalmenu:getpropspropss')

                    RageUI.Visible(propsMenu, true)
                end
            })
            RageUI.Button("Radio", "Accéder à la radio", {RightLabel = ""}, true, {
                onSelected = function()
                    
                end
            }, radioMenu)
            RageUI.Button("Préférences", "Définissez vos préférences", {RightLabel = ''}, true, {
                onSelected = function()
                    
                end
            }, OptionsVisuels)
            RageUI.Button('Guide', nil, {RightLabel = ""}, true, {
                onSelected = function()
                    
                end
            }, guids)
            if VIP.haveVip() then
            RageUI.Button('Menu ~y~VIP~s~', nil, {RightLabel = ""}, VIP.haveVip(), {
                onSelected = function()
                    
                end
            }, vipMenu)
        end
            -- RageUI.Line()
            -- RageUI.Button('~r~Calendrier de Noêl "OverLife Christmas Edition"~s~', nil, {RightLabel = ''}, true, {
            --     onSelected = function()
            --         Christmas.openCalendarMenu()
            --     end
            -- })
        end)

        RageUI.IsVisible(guids, function()
            for k,v in pairs(Config.Personalmenu.guids) do
                RageUI.Button(v[1], nil, {LeftBadge = RageUI.BadgeStyle.Star, RightLabel = v[2]}, true, {
                    onSelected = function()
                        
                    end
                })
            end
        end)
        RageUI.IsVisible(vipMenu, function()
            if not VIP.haveVip() then
                RageUI.CloseAll()
            end

            RageUI.Separator('~y~VIP Actif~s~')
            RageUI.Separator(('Temps restant: ~y~%s Heure(s)~s~'):format(VIP.data.time))

            RageUI.Line()
            RageUI.Button("Récuperer l'argent", nil, {RightLabel = ""}, true, {
                onSelected = function()
                    TriggerServerEvent('kayscore:vip:recieveMoney')
                end
            })

            RageUI.Button("Sortir un scooter d'urgence", nil, {RightLabel = ""}, true, {
                onSelected = function()
                if VIP.haveVip() then
                    local ped = PlayerPedId()
                    local PlayerScoot = GetEntityCoords(ped)

                    if scoot == true then
                        ESX.ShowNotification('~r~Vous avez déja sorti un scooter !')
                    else
                        ESX.Game.SpawnVehicle("faggio", PlayerScoot, 180.0, function(vehicle)
                            scoot = true
                        end)
                    end
                else
                    ESX.ShowNotification("~r~Vous devez être VIP !")
                    RageUI.CloseAll()
                    MenuOpened = false
                end
            end
            })

            RageUI.Checkbox('Mode drift', nil, driftmode, {}, {
                onChecked = function()
                    driftmode = not driftmode
                end,
                onUnChecked = function()
                    driftmode = false
                end,
                onSelected = function(Index)
                    driftmode = Index
                end
            })
            local tintName = 'Aucun'
            for i = 1, #weaponTint do  
                if weaponTint[i].id == getWeaponTint() then
                    tintName = weaponTint[i].name
                end
            end
            RageUI.Button('Teinte d\'arme', 'Vous avez besoin de définir une seule fois votre teinte d\'arme, Elle est ensuite sauvegardée tant que vous êtes VIP.', {RightLabel = tintName}, true, {
                onSelected = function() 

                end
            }, selectedWeaponTint)

            RageUI.Button('Customisations d\'arme', '', {RightLabel = tintName}, true, {
                onSelected = function() 

                end
            }, CustomMenu)


            --     RageUI.Button('Gestion des plaques', nil, {RightLabel = ""}, true, {
            --     onSelected = function() 
            --         ESX.TriggerServerCallback("kayscore:vip:getPlates", function(data)
            --             vip_plates = data
            --             RageUI.Visible(vipPlates, true)
            --         end)
            --     end
            -- })
            RageUI.Button('Animaux', nil, {RightBadge = RageUI.BadgeStyle.Star}, true, {
                onSelected = function()
                    
                end
            }, petMenu)
            
            RageUI.Button('Reprendre personnage', 'Vous devez etre en safezone !', {}, true, {
                onSelected = function()
                    if not GetSafeZone() then return end
                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                        local Male = skin.sex == 0
                        TriggerEvent('skinchanger:loadDefaultModel', Male, function()
                            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                TriggerEvent('skinchanger:loadSkin', skin)
                                TriggerEvent('esx:restoreLoadout')
                            end)
                        end)
                    end)
                end
            })

            RageUI.Button('Peds', nil, {}, true, {
                onSelected = function() 

                end
            }, openVipPeds)
            -- RageUI.Checkbox('Mode Drift', nil, driftMod, {}, {
            --     onChecked = function()
            --         driftMod = true 
            --         TriggerEvent('kayscore:drift:update', driftMod)
            --     end,
            --     onUnChecked = function()
            --         driftMod = false
            --         TriggerEvent('kayscore:drift:update', driftMod)
            --     end
            -- })
        end)
        -- RageUI.IsVisible(vipPlates, function()
        --     RageUI.Separator(("Vous avez %s plaque(s) modifier"):format(ESX.Table.SizeOf(vip_plates)))
        --     RageUI.Separator("Vous devez être dans un véhicule qui vous appartient")
        --     if ESX.Table.SizeOf(vip_plates) >= 1 then
        --         RageUI.Button('Voir mes plaques modifié', nil, {RightLabel = ""}, true, {
        --             onSelected = function() 
                        
        --             end
        --         }, vipPlateGestion)
        --     end
        --     RageUI.Button('Modifier la plaque', nil, {RightLabel = ""}, Player.isInVehicle, {
        --         onSelected = function()
        --             local input = ESX.GetTextInput("Quelle plaque voulez-vous? (8 caractères maximum)")
        --             if input == nil then
        --                 return ESX.ShowNotification("~r~La plaque ne peut pas être nulle")
        --             end

        --             if #input > 8 then
        --                 return ESX.ShowNotification("~r~La plaque ne doit pas dépasser 8 caractères")
        --             end
        --             if not IsPedSittingInAnyVehicle(Player.playerPed) then ESX.ShowNotification("Vous n'etes pas dans un véhicule !") return end
        --             TriggerServerEvent("kayscore:vip:changePlate", NetworkGetNetworkIdFromEntity(Player.vehicle), input)
        --         end
        --     })
        -- end)

        -- RageUI.IsVisible(vipPlateGestion, function()
        --     for k,v in pairs(vip_plates) do 
        --         RageUI.Button(("Véhiculé N*%s | Plaque : %s"):format(k, v.plate), "Appuyer sur ENTRER réinitialisera la plaque du véhicule", {}, true, {
        --             onSelected = function() 
        --                 TriggerServerEvent("kayscore:vip:resetPlate", k)
        --             end
        --         })
        --     end
        -- end)
        RageUI.IsVisible(selectedWeaponTint, function()
            for i = 1, #weaponTint do 
                RageUI.Button(weaponTint[i].name, nil, {}, true, {
                    onSelected = function() 
                        setWeaponTint(weaponTint[i].id)
                    end
                })
            end
        end)

        RageUI.IsVisible(CustomMenu, function()
            local playerPed = PlayerPedId()
            local currentWeapon = GetSelectedPedWeapon(playerPed)
            
            if currentWeapon ~= GetHashKey("WEAPON_UNARMED") then
                local weaponList = ESX.GetWeaponList()
                local selectedWeapon = nil
        
                for _, weapon in pairs(weaponList) do
                    if GetHashKey(weapon.name) == currentWeapon then
                        selectedWeapon = weapon
                        break
                    end
                end
        
                if selectedWeapon and selectedWeapon.components then
                    for i, v in pairs(selectedWeapon.components) do
                        local hasComponent = HasPedGotWeaponComponent(playerPed, currentWeapon, v.hash) 
        
                        RageUI.Button(v.label, nil, { RightLabel = hasComponent and "(Equipé)" or ""}, true, {
                            onSelected = function()
                                if hasComponent then
                                    RemoveWeaponComponentFromPed(playerPed, currentWeapon, v.hash)
                                    ESX.ShowNotification(v.label .. ' a été retiré de votre arme')
                                else
                                    TriggerServerEvent('tebex:on-process-checkout-weapon-custom', selectedWeapon.name, v.hash)
                                    ESX.ShowNotification('Vous avez acheté ' .. v.label)
                                    GiveWeaponComponentToPed(playerPed, currentWeapon, v.hash)
                                end
                            end,
                        })
                    end
                else
                    RageUI.Separator("Aucune personnalisation disponible")
                end
            else
                RageUI.Separator("Vous n'avez pas d'arme dans vos mains")
            end
        end)
        
        RageUI.IsVisible(openVipPeds, function()
            local pedList = GetPedList()
        
            for i = 1, #pedList.normal do 
                local pedIndex = i
                RageUI.Button(pedList.normal[i].label, "~b~Vous devez etre en safezone !~s~", {}, true, {
                    onSelected = function()
                        local healthBeforePed = GetEntityHealth(PlayerPedId())
        
                        if healthBeforePed < 199 then
                            ESX.ShowNotification("Vous devez avoir toute votre vie pour reprendre votre personnage.")
                        else
                            local skinModel = pedList.normal[pedIndex].model
                            ChangePedModel(pedIndex, skinModel)
                        end
                    end
                })
            end
        end)
        RageUI.IsVisible(petMenu, function()
            local animalList = GetPedList()
            if VIP.entity.sorted == true then
                RageUI.Button('Rentrer mon animal', nil, {RigthBadge = RageUI.BadgeStyle.Star}, true, {
                    onSelected = function()
                        TriggerEvent('kayscore:vip:animals:remove')
                    end
                })
                RageUI.Button('Demander de s\'asseoir', nil, {RigthBadge = RageUI.BadgeStyle.Star}, not VIP.entity.sitting, {
                    onSelected = function()
                        local entity = VIP.entity.entityid 
                        local entityCoords = GetEntityCoords(entity)
        
                        local dist = #(GetEntityCoords(PlayerPedId()) - entityCoords)
        
                        if dist > 10 then
                            ESX.ShowNotification('🐕 Votre animal est trop éloigné de vous')
                            return
                        end
        
                        if not VIP.entity.sitting then
                            loadDict("creatures@rottweiler@amb@world_dog_sitting@base")
                            TaskPlayAnim(entity, "creatures@rottweiler@amb@world_dog_sitting@base", "base", 8.0, -8, -1, 1, 0, false, false, false)
                            VIP.entity.sitting = true
                        else
                            ClearPedTasks(entity)
                            VIP.entity.sitting = false
                        end
                    end
                })
                if VIP.entity.sitting then
                    RageUI.Button('Demander de lever', nil, {RigthBadge = RageUI.BadgeStyle.Star}, VIP.entity.sitting, {
                        onSelected = function()
                            local entity = VIP.entity.entityid 
                            local entityCoords = GetEntityCoords(entity)
        
                            local dist = #(GetEntityCoords(PlayerPedId()) - entityCoords)
        
                            if dist > 3 then
                                ESX.ShowNotification('🐕 Votre animal est trop éloigné de vous')
                                return
                            end
        
                            ClearPedTasks(entity)
                            VIP.entity.sitting = false
                        end
                    })
                end
        
                RageUI.Button('Demander de me suivre', nil, {RigthBadge = RageUI.BadgeStyle.Star}, not VIP.entity.followMe, {
                    onSelected = function()
                        local entity = VIP.entity.entityid 
                        local entityCoords = GetEntityCoords(entity)
        
                        local dist = #(GetEntityCoords(PlayerPedId()) - entityCoords)
        
                        if dist > 10 then
                            ESX.ShowNotification('🐕 Votre animal est trop éloigné de vous')
                            return
                        end
        
                        TriggerEvent('kayscore:vip:animals:followMe')
                    end
                })
                if VIP.entity.followMe == true then
                    RageUI.Button('Demander d\'arrêter me suivre', nil, {RigthBadge = RageUI.BadgeStyle.Star}, VIP.entity.followMe, {
                        onSelected = function()
                            VIP.entity.followMe = false
        
                            SetTimeout(2000, function()
                                local entity = VIP.entity.entityid -
        
                                loadDict("creatures@rottweiler@amb@world_dog_sitting@base")
                                TaskPlayAnim(entity, "creatures@rottweiler@amb@world_dog_sitting@base", "base", 8.0, -8, -1, 1, 0, false, false, false)
                                VIP.entity.sitting = true
                            end)
                        end
                    })
                end
                RageUI.Button('Donner un nom à mon animal', nil, {RigthBadge = RageUI.BadgeStyle.Star}, VIP.entity.nameActive == false, {
                    onSelected = function()
                        KeyboardUtils.use('Nom de l\'animal', function(data)
                            if data == nil or data == '' then return end
        
                            secured_TriggerServerEvent('kayscore:vip:animals:setName', VIP.entity.entityid, data)
        
                            VIP.entity.nameActive = true
                        end)
                    end
                })
                if VIP.entity.nameActive ~= false then
                    RageUI.Button('Changer le nom de mon animal', nil, {RigthBadge = RageUI.BadgeStyle.Star}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Nouveau nom', function(data)
                                if data == nil or data == '' then return end
        
                                secured_TriggerServerEvent('kayscore:vip:animals:editName', VIP.entity.entityid, data)
                            end)
                        end
                    })
                    RageUI.Button('Retirer le nom de mon animal', nil, {Color = {BackgroundColor = {255,0,0,100}}}, true, {
                        onSelected = function()
                            secured_TriggerServerEvent('kayscore:vip:animals:removeName', VIP.entity.entityid)
                            VIP.entity.nameActive = false
                        end
                    })
                end
                RageUI.Line()
            end
            for k,v in ipairs(animalList.animals) do
                RageUI.Button(('%s (%s)'):format(v.label, v.model), nil, {RightLabel = ''}, true, {
                    onSelected = function()
                        exports['sPrompt']:displayRequest(
                            kayscoreConfigServ.ServerName,
                            'voulez-vous sortir votre animal',
                            function() -- Oui
                                if VIP.entity.sorted == true then
                                    ESX.ShowNotification('🐕 Vous avez déjà un animal de sorti')
                                else
                                    secured_TriggerServerEvent('kayscore:ips:animals:createPed', GetEntityCoords(PlayerPedId()), v.model)
                                end
                            end,
                            function() -- Non
                                ESX.ShowNotification("Action annulée")
                            end
                        )
                    end
                })
                
            end
        end)
        RageUI.IsVisible(clothesMenu, function()
            for k,v in pairs(
                {{ name = "Tenue", ask = '' },
                { name = "Torse", ask = ''},
                { name = "T-Shirt", ask = ''},
                { name = "Bras", ask = ''},
                { name = "Pantalons", ask = ''},
                { name = "Chaussures", ask = ''},
                { name = "Masque", ask = ''},
                { name = "Gillet par balles", ask = ''},
                { name = "Chaine", ask = ''},
                { name = "Chapeau", ask = ''},
                { name = "Lunettes", ask = ''},
                { name = "Montres", ask = ''},
                { name = "Bracelets", ask = ''},
                { name = "Sacs", ask = ''},}
            ) do
                RageUI.Button(v.name, nil, {RightLabel = v.ask}, true, {
                    onSelected = function()
                        RageUI.Visible(clothesMenu2, true)
                    end
                })
            end
        end)

        RageUI.IsVisible(clothesMenu2, function()
            
        end)

        RageUI.IsVisible(propsMenu, function()
            for k,v in pairs(propsPropsList) do
                RageUI.Button(v.label, nil, {RightLabel = 'x'..v.count}, true, {
                    onActive = function()
                        -- if DoesEntityExist(previewPropMenu) and GetHashKey(GetEntityModel(previewPropMenu)) ~= v.name or not DoesEntityExist(previewPropMenu) then
                        --     DeleteEntity(previewPropMenu)
                            
                        --     local coords, forward = Player.coords, GetEntityForwardVector(Player.playerPed)
                        --     local objectCoords = (coords + forward * 3.0)
        
                        --     ESX.Streaming.RequestModel(v.name)
                        --     previewPropMenu = CreateObjectNoOffset(v.name, objectCoords.x, objectCoords.y, objectCoords.z, false, false, false)
                        --     SetModelAsNoLongerNeeded(v.nale)
                        --     SetEntityCollision(previewPropMenu, false, false)
                        --     SetCanClimbOnEntity(previewPropMenu, false)
                        --     FreezeEntityPosition(previewPropMenu, true)
                        -- else

                        -- end
                    end,
                    onSelected = function()
                        secured_TriggerEvent('kayscore:props:place', v)
                    end
                })
            end
        end)

        RageUI.IsVisible(Portefeuille, function()
    local player, closestplayer = ESX.Game.GetClosestPlayer()
    local cashAmount = ESX.PlayerData.money
    local bankAmount = 0
    local blackMoneyAmount = 0

   RageUI.Separator('Information Compte')

   for i = 1, #ESX.PlayerData.accounts, 1 do
    if ESX.PlayerData.accounts[i].name == 'bank' then
        RageUI.Button('Argent en Banque: ~p~'..ESX.PlayerData.accounts[i].money.."$", nil, { RightLabel = "" }, true, {})
    end
end

for i = 1, #ESX.PlayerData.accounts, 1 do
    if ESX.PlayerData.accounts[i].name == 'cash' then
        RageUI.Button('Argent en Liquide: ~p~'..ESX.PlayerData.accounts[i].money.."$", nil, { RightLabel = "" }, true, {
            onActive = function()
                --local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
               -- if closestDistance ~= -1 and closestDistance <= 3 then
                --    PlayerMakrer(closestPlayer)
              --  end
            end
        })
    end
end

for i = 1, #ESX.PlayerData.accounts, 1 do
    if ESX.PlayerData.accounts[i].name == 'black_money' then
        RageUI.Button('Argent Sale: ~r~'..ESX.PlayerData.accounts[i].money.."$", nil, { RightLabel = "" }, true, {
            onActive = function()
               -- local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
             --   if closestDistance ~= -1 and closestDistance <= 3 then
               --     PlayerMakrer(closestPlayer)
              --  end
            end
        })
    end
end

for i = 1, #ESX.PlayerData.accounts, 1 do
    if ESX.PlayerData.accounts[i].name == 'pesos' then
        RageUI.Button('Peso: ~y~'..ESX.PlayerData.accounts[i].money.."P", nil, { RightLabel = "" }, true, {
            onActive = function()
               -- local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
             --   if closestDistance ~= -1 and closestDistance <= 3 then
               --     PlayerMakrer(closestPlayer)
              --  end
            end
        })
    end
end

            RageUI.Button('Factures', nil, {RightLabel = ''}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('esx_billing:getBills', function(cb)
                        facturessss = cb
                        RageUI.Visible(factures, true)
                    end)
                end
            })
            RageUI.Button("Quitter son Emploie", nil, {RightLabel = ""}, true, {
                onSelected = function()
                    exports['sPrompt']:displayRequest(
                        kayscoreConfigServ.ServerName,
                        'Confirmez votre démission',
                        function() -- Oui
                            TriggerServerEvent("kayscore:job:leave")
                            ESX.ShowNotification("~r~Vous avez quitter votre Job")

                        end,
                        function() -- Non
                            ESX.ShowNotification("Vous n'avez pas quitter votre job")
                        end
                    )
                end
            })

            RageUI.Button("Quitter son Groupe", nil, {RightLabel = ""}, true, {
                onSelected = function()
                    exports['sPrompt']:displayRequest(
                        kayscoreConfigServ.ServerName,
                        'Confirmez votre démission',
                        function() -- Oui
                            TriggerServerEvent("kayscore:job2:leave")
                            ESX.ShowNotification("~r~Vous avez quitter votre Groupe")

                        end,
                        function() -- Non
                            ESX.ShowNotification("Vous n'avez pas quitter votre Groupe")
                        end
                    )
                end
            })


            RageUI.Separator("Information Personnelles")
            
            RageUI.Button('Nom Complet ', nil, {RightLabel = ESX.PlayerData.firstname.." "..ESX.PlayerData.lastname}, true, {
                onSelected = function()
                end
            })
            
            RageUI.Button("Gestion License", nil, {RightLabel = ''}, true, {}, gestionlicense)
                                     
            RageUI.Button("Information Métier", "Accéder aux information de votre métier", {RightLabel = ""}, true, {onSelected = function() end}, infojob)

            RageUI.Button("Information Organisation", "Accéder aux information de votre organisation", {RightLabel = ""}, true, {onSelected = function() end}, infojob2)

        end)

        RageUI.IsVisible(infojob, function()
            ESX.PlayerData = ESX.GetPlayerData()

            RageUI.Button("Votre Métier :", nil, {RightLabel = kayscoreConfigServ.GTACOLOR..""..ESX.PlayerData.job.label}, true, {})
            RageUI.Button("Votre Grade :", nil, {RightLabel = kayscoreConfigServ.GTACOLOR..""..ESX.PlayerData.job.grade_label}, true, {})
        end)


        RageUI.IsVisible(infojob2, function()
            RageUI.Button("Votre Organisation :", nil, {RightLabel = kayscoreConfigServ.GTACOLOR..""..ESX.PlayerData.job2.label}, true, {})
            RageUI.Button("Votre Rang :", nil, {RightLabel = kayscoreConfigServ.GTACOLOR..""..ESX.PlayerData.job2.grade_label}, true, {})
        end)

        RageUI.IsVisible(factures, function()
            for k,v in pairs(facturessss) do
                RageUI.Button(v.label, nil, {RightLabel = v.amount}, true, {
                    onSelected = function()
                        v.target = string.gsub(v.target, 'society_', '')

                        TriggerServerEvent('kayscore:bill:pay', v)

                        RageUI.GoBack()
                    end
                })
            end
        end)
        RageUI.IsVisible(gestionlicense, function()
            
                    RageUI.Info(kayscoreConfigServ.GTACOLOR.."Informations License", {"Pour obtenir votre carte d'intentité dans votre inventaire veuillez", "vous rendre a la ~p~Préfécture ~w~!"}, 
                                                    {})
            RageUI.Separator(('%s↓ Permis de pêche ↓~s~'):format(UTILS.COLORCODE))
            RageUI.Button('Regarder', nil, {}, true, {
                onSelected = function()
                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'fishing')
                end
            })
            RageUI.Button('Montrer', nil, {}, true, {
                onSelected = function()
                    if distance == -1 or distance > 3  then return ESX.ShowNotification('Personne aux alentours') end

                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'fishing')
                end
            })
            RageUI.Separator(('%s↓ Permis de conduire ↓~s~'):format(UTILS.COLORCODE))
            RageUI.Button('Regarder', nil, {}, true, {
                onSelected = function()
                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
                end
            })
            RageUI.Button('Montrer', nil, {}, true, {
                onSelected = function()
                    if distance == -1 or distance > 3  then return ESX.ShowNotification('Personne aux alentours') end

                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')
                end
            })
            RageUI.Separator(('%s↓ Permis de Port D\'arme ↓~s~'):format(UTILS.COLORCODE))
            RageUI.Button('Regarder', nil, {}, true, {
                onSelected = function()
                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
                end
            })
            RageUI.Button('Montrer', nil, {}, true, {
                onSelected = function()
                    if distance == -1 or distance > 3  then return ESX.ShowNotification('Personne aux alentours') end

                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'weapon')
                end
            })
    
            end, function()
            end)
        RageUI.IsVisible(VehicleOption, function()
            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            
            local pVeh = GetVehiclePedIsUsing(Player.playerPed)

            local vModel = GetEntityModel(pVeh)
            if IsPedInAnyVehicle(Player.playerPed, true) then 
                local vPlate = GetVehicleNumberPlateText(GetVehiclePedIsIn(Player.playerPed), false)
                local vName = GetDisplayNameFromVehicleModel(vModel) --Avoir le nom du véhicule
                local Essence = GetVehicleFuelLevel(pVeh)
                RageUI.Separator('[Plaque]   '..vPlate ..'')
                RageUI.Separator('[Modèle]   '..vName..'')
                RageUI.Separator('[Essence]   '..ESX.Math.Round(Essence, 0)..'%')
                SetPlayerCanDoDriveBy(Player.playerId, false)
            else
                RageUI.Separator('[Plaque]   '.."Non défini" ..'')
                RageUI.Separator('[Modèle]   '.."Non défini"..'')
                RageUI.Separator('[Essence]   '.."Non défini"..'')
                RageUI.Separator('[Moteur]    '.."Non défini")
            end
            RageUI.Button("Allumer / Eteindre le moteur", nil, {RightLabel = Config.Personalmenu.Statut}, true, {
                onSelected = function()
                    if GetIsVehicleEngineRunning(vehicle) then
                        Config.Personalmenu.Statut = "~r~Eteint"

                        SetVehicleEngineOn(vehicle, false, false, true)
                        SetVehicleUndriveable(vehicle, true)
                    elseif not GetIsVehicleEngineRunning(vehicle) then
                        Config.Personalmenu.Statut = "~g~Allumé"

                        SetVehicleEngineOn(vehicle, true, false, true)
                        SetVehicleUndriveable(vehicle, false)
                    end
                end
            })

            RageUI.List("Ouvrir / Fermer porte", {"Avant gauche", "Avant Droite", "Arrière Gauche", "Arrière Droite", "Capot", "Coffre"}, Config.Personalmenu.Indexdoor, nil, {}, true, {
                onListChange = function(index)
                    Config.Personalmenu.Indexdoor = index 
                end,
                onSelected = function(index)
                    
                    if index == 1 then
                        if not Config.Personalmenu.DoorState.FrontLeft then
                            Config.Personalmenu.DoorState.FrontLeft = true
                            SetVehicleDoorOpen(vehicle, 0, false, false)
                        elseif Config.Personalmenu.DoorState.FrontLeft then
                            Config.Personalmenu.DoorState.FrontLeft = false
                            SetVehicleDoorShut(vehicle, 0, false, false)
                        end
                    elseif index == 2 then
                        if not Config.Personalmenu.DoorState.FrontRight then
                            Config.Personalmenu.DoorState.FrontRight = true
                            SetVehicleDoorOpen(vehicle, 1, false, false)
                        elseif Config.Personalmenu.DoorState.FrontRight then
                            Config.Personalmenu.DoorState.FrontRight = false
                            SetVehicleDoorShut(vehicle, 1, false, false)
                        end
                    elseif index == 3 then
                        if not Config.Personalmenu.DoorState.BackLeft then
                            Config.Personalmenu.DoorState.BackLeft = true
                            SetVehicleDoorOpen(vehicle, 2, false, false)
                        elseif Config.Personalmenu.DoorState.BackLeft then
                            Config.Personalmenu.DoorState.BackLeft = false
                            SetVehicleDoorShut(vehicle, 2, false, false)
                        end
                    elseif index == 4 then
                        if not Config.Personalmenu.DoorState.BackRight then
                            Config.Personalmenu.DoorState.BackRight = true
                            SetVehicleDoorOpen(vehicle, 3, false, false)
                        elseif Config.Personalmenu.DoorState.BackRight then
                            Config.Personalmenu.DoorState.BackRight = false
                            SetVehicleDoorShut(vehicle, 3, false, false)
                        end
                    elseif index == 5 then 
                        if not Config.Personalmenu.DoorState.Hood then
                            Config.Personalmenu.DoorState.Hood = true
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        elseif Config.Personalmenu.DoorState.Hood then
                            Config.Personalmenu.DoorState.Hood = false
                            SetVehicleDoorShut(vehicle, 4, false, false)
                        end
                    elseif index == 6 then 
                        if not Config.Personalmenu.DoorState.Trunk then
                            Config.Personalmenu.DoorState.Trunk = true
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        elseif Config.Personalmenu.DoorState.Trunk then
                            Config.Personalmenu.DoorState.Trunk = false
                            SetVehicleDoorShut(vehicle, 5, false, false)
                        end
                    end
                end
            })

            RageUI.Button("Fermer toutes les portes", nil, {RightLabel =  ''}, true, {
                onSelected = function ()
                    for door = 0, 7 do
                        SetVehicleDoorShut(vehicle, door, false)
                    end
                end
            })
            if not isintestdrive then
             RageUI.List("Limitateur", Config.Personalmenu.voiture_limite, Config.Personalmenu.LimitateurIndex, nil, {}, true, {
                 onListChange = function(i, item)
                     Config.Personalmenu.LimitateurIndex = i
                 end,

                 onSelected = function(i, item)
                     if i == 1 then
                         SetEntityMaxSpeed(GetVehiclePedIsIn(Player.playerPed, false), 50.0/3.6)
                         ESX.ShowNotification("Limitateur de vitesse défini sur ~p~50 km/h")
                     elseif i == 2 then  
                         SetEntityMaxSpeed(GetVehiclePedIsIn(Player.playerPed, false), 80.0/3.6)
                         ESX.ShowNotification("Limitateur de vitesse défini sur ~p~80 km/h")
                     elseif i == 3  then
                         SetEntityMaxSpeed(GetVehiclePedIsIn(Player.playerPed, false), 130.0/3.6)
                         ESX.ShowNotification("Limitateur de vitesse défini sur ~p~130 km/h")
                     elseif i == 4 then
                         KeyboardUtils.use('Indiquer la viteese', function(speed)
                             if speed ~= nil or speed ~= tostring("") then 
                                 SetEntityMaxSpeed(GetVehiclePedIsIn(Player.playerPed, false), ESX.Math.Round(speed, 1)/3.6)
                                 ESX.ShowNotification("Limitateur de vitesse défini sur ~p~"..speed..'km/h')
                             else
                                 return
                             end
                         end)
                     elseif i == 5 then 
                         SetEntityMaxSpeed(GetVehiclePedIsIn(Player.playerPed, false), 10000.0/3.6)    
                         ESX.ShowNotification("Limitateur de vitesse désactivé")
                     end
                 end
             })
            end
        end)

        RageUI.IsVisible(EntrepriseOption, function()
            RageUI.Button('Argent de la société: '..Society.List[ESX.PlayerData.job.name].coffre['accounts'].society, nil, {}, true, {
                onSelected = function()
                end
            })
            RageUI.Button("Recruter un employé", nil, {RightLabel = ''}, true, {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestDistance ~= -1 and closestDistance <= 3 then
                        TriggerServerEvent("kayscore:entreprise:Boss_recruterplayer", GetPlayerServerId(closestPlayer), ESX.PlayerData.job.name)
                    else
                        ESX.ShowNotification("Aucun joueur à proximité")
                    end
                end
            })

            RageUI.Button("Virer un employé", nil, {RightLabel = ''}, true, {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestDistance ~= -1 and closestDistance <= 3 then
                        TriggerServerEvent("kayscore:entreprise:Boss_virerplayer", GetPlayerServerId(closestPlayer))
                    else
                        ESX.ShowNotification("Aucun joueur à proximité")
                    end
                end
            })

            RageUI.Button("Promouvroir un employé", nil, {RightLabel = ''}, true, {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestDistance ~= -1 and closestDistance <= 3 then
                        TriggerServerEvent("kayscore:entreprise:Boss_promouvoirplayer", GetPlayerServerId(closestPlayer))
                    else
                        ESX.ShowNotification("Aucun joueur à proximité")
                    end
                end
            })

            RageUI.Button("Rétrograder un employé", nil, {RightLabel = ''}, true, {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestDistance ~= -1 and closestDistance <= 3 then
                        TriggerServerEvent("kayscore:entreprise:Boss_destituerplayer", GetPlayerServerId(closestPlayer))
                    else
                        ESX.ShowNotification("Aucun joueur à proximité")
                    end
                end
            })
        end)
        RageUI.IsVisible(OpenReportFast, function()
            RageUI.Button("Signalé un FreeKill", nil, {RightLabel = "⚠️"}, true, {
                onSelected = function()
                    ExecuteCommand("report J'ai besoin d'aide par apport à une FreeKill")
                end
            })
            RageUI.Button("Signalé un FreePunch", nil, {RightLabel = "⚠️"}, true, {
                onSelected = function()
                    ExecuteCommand("report J'ai besoin d'aide par apport à une FreePunch")
                end
            })
            RageUI.Button("Signalé un FreeTaze", nil, {RightLabel = "⚠️"}, true, {
                onSelected = function()
                    ExecuteCommand("report J'ai besoin d'aide par apport à une FreeTaze")
                end
            })
            RageUI.Button("Signalé un MassRP", nil, {RightLabel = "⚠️"}, true, {
                onSelected = function()
                    ExecuteCommand("report J'ai besoin d'aide par apport à un MassRP")
                end
            })
            RageUI.Button("Signalé un PowerGaming", nil, {RightLabel = "⚠️"}, true, {
                onSelected = function()
                    ExecuteCommand("report J'ai besoin d'aide par apport à un PowerGaming")
                end
            })
            RageUI.Button("Signalé un MetaGaming", nil, {RightLabel = "⚠️"}, true, {
                onSelected = function()
                    ExecuteCommand("report J'ai besoin d'aide par apport à un MetaGaming")
                end
            })
            RageUI.Button("Signalé un FreeLoot", nil, {RightLabel = "⚠️"}, true, {
                onSelected = function()
                    ExecuteCommand("report J'ai besoin d'aide par apport à un FreeLoot")
                end
            })
            RageUI.Button("Demander une aide général", nil, {RightLabel = "⚠️"}, true, {
                onSelected = function()
                    ExecuteCommand("report J'ai besoin d'aide s'il vous plait !")
                end
            })

        end)
        RageUI.IsVisible(OptionsVisuels, function()
            if HasKevlar() then
                RageUI.Button('Déséquiper mon Kevlar', nil, {RightLabel = ''}, true, {
                    onSelected = function()
                        TriggerServerEvent('kayscore:RemoveKevlar')
                    end
                })
                RageUI.Line()
            end
            RageUI.Button('Affichage', nil, {RightLabel = ''}, true, {
                onSelected = function()
                end
            }, visualconfig)
            RageUI.Button('Véhicules', nil, {RightLabel = ''}, true, {
                onSelected = function()
                end
            }, carconfig)
            RageUI.Button('Combat', nil, {RightLabel = ''}, true, {
                onSelected = function()
                end
            }, FightModif)
            RageUI.Button("Signalement Rapide", nil, {RightLabel = ''}, true, {
                onSelected = function()
                
                end
            }, OpenReportFast)
            RageUI.Button('Démarche', nil, {RightLabel = getWalkStyle()}, true, {
                onSelected = function()
                end
            }, walksList)
            for _,z in ipairs(Config.Personalmenu.preferData) do
                v = Config.Personalmenu.preferences[z.name]
                if v.type == 'checkbox' then
                    RageUI.Checkbox(v.label, v.desc, v.active, {}, {
                        onChecked = function()
                            v.action(true)

                            v.active = true

                            TriggerServerEvent('kayscore:preferences:add', z.name)
                        end,
                        onUnChecked = function()
                            v.action(false)

                            v.active = false

                            TriggerServerEvent('kayscore:preferences:remove', z.name)
                        end
                    })
                elseif v.type == "menu" then
                    RageUI.Button(v.label, v.desc, {RightLabel = ''}, true, {
                        onSelected = function()
                            v.action()
                        end
                    })
                end
            end
                RageUI.Button('Mode vente de Drogue', "Activer/Desactiver le mode vente de drogue", {}, true, {
                    onSelected = function()
                        if blackListedRole[ESX.GetPlayerData().job.name] then return ESX.ShowNotification('~r~Vous ne pouvez pas vendre de la drogue en étant dans une entreprise public~s~') end

                        ExecuteCommand('drugs')
                    end
                })
        end)
        RageUI.IsVisible(walksList, function()
            for k,v in pairs(Config.Personalmenu.WalkStyle) do 
                RageUI.Button(('%s'):format(k), nil, {}, true, {
                    onSelected = function()
                        RageUI.GoBack()
                        setNewWalkStyle(k)
                        Wait(150)
                        StartWykzWalkezjdhajzehdaz()
                    end
                })
            end
        end)
            RageUI.IsVisible(visualconfig, function()
                --RageUI.Button("Notifications", nil, {RightLabel = ""}, true, {
                --    onSelected = function()
    
                --    end
                --}, Notifmeny)
                -- if kayscoreConfigServ.RageUI.IgEdit == true then
                -- RageUI.Button("Modifications Menu", nil, {RightLabel = ""}, true, {
                --     onSelected = function()
    
                --     end
                -- }, ModifMenu)
                -- end
                RageUI.Button("Optimisation", nil, {RightLabel = ""}, true, {
                    onSelected = function()
    
                    end
                }, OptiMenu)
                RageUI.Button("Voir mon Niveau", nil, {RightLabel = ''}, true, {
                    onSelected = function()
                        ExecuteCommand('XpStats')
                    end
                })
                RageUI.Button("Modifier HUD", nil, {RightLabel = ''}, true, {
                    onSelected = function()
                        ExecuteCommand('hudset')
                    end
                })
                RageUI.Checkbox("Afficher / Désactiver la map", nil, menumap, {RighLabel = ""}, { 
                        onChecked = function()
                            menumap = true
                            DisplayRadar(true)
                        end,
                        onUnChecked = function()
                            menumap = false
                            DisplayRadar(false)
                        end
                    })
                RageUI.Checkbox('Mode cinématique', nil, cinemamode, {}, {
                    onChecked = function()
                        ExecuteCommand('noir')
                        DisplayRadar(true)
                        TriggerEvent('tempui:toggleUi', false)
                        cinemamode = true
                        menumap = true
                        hudhide = true
                    end,
                    onUnChecked = function()
                        ExecuteCommand('noir')
                        TriggerEvent('tempui:toggleUi', true)
                        DisplayRadar(false)
                        cinemamode = false
                        hudhide = false
                        menumap = false
                    end,
                })
                RageUI.Button("Rockstar Editor", nil, {RightLabel = ''}, true, {
                    onSelected = function()
                        ExecuteCommand('rec')
                    end
                })
             end)

             RageUI.IsVisible(ModifMenu, function()
                RageUI.Checkbox("Banniere du Menu", nil, kayscoreConfigServ.RageUI.Header, {RighLabel = ""}, { 
                    onChecked = function()
                        kayscoreConfigServ.RageUI.Header = true
                    end,
                    onUnChecked = function()
                        kayscoreConfigServ.RageUI.Header = false
                    end
                })
                RageUI.Checkbox("Globe du Menu", nil, kayscoreConfigServ.RageUI.Glare, {RighLabel = ""}, { 
                    onChecked = function()
                        kayscoreConfigServ.RageUI.Glare = true
                    end,
                    onUnChecked = function()
                        kayscoreConfigServ.RageUI.Glare = false
                    end
                })
                RageUI.Checkbox("Sous-Titre du Menu", nil, kayscoreConfigServ.RageUI.Subtitle, {RighLabel = ""}, { 
                    onChecked = function()
                        kayscoreConfigServ.RageUI.Subtitle = true
                    end,
                    onUnChecked = function()
                        kayscoreConfigServ.RageUI.Subtitle = false
                    end
                })
                RageUI.Checkbox("Background du Menu", nil, kayscoreConfigServ.RageUI.Background, {RighLabel = ""}, { 
                    onChecked = function()
                        kayscoreConfigServ.RageUI.Background = true
                    end,
                    onUnChecked = function()
                        kayscoreConfigServ.RageUI.Background = false
                    end
                })
                RageUI.Checkbox("Navigation du Menu", nil, kayscoreConfigServ.RageUI.Navigation, {RighLabel = ""}, { 
                    onChecked = function()
                        kayscoreConfigServ.RageUI.Navigation = true
                    end,
                    onUnChecked = function()
                        kayscoreConfigServ.RageUI.Navigation = false
                    end
                })
                RageUI.Checkbox("Instruction du Menu", nil, kayscoreConfigServ.RageUI.InstructionalButton, {RighLabel = ""}, { 
                    onChecked = function()
                        kayscoreConfigServ.RageUI.InstructionalButton = true
                    end,
                    onUnChecked = function()
                        kayscoreConfigServ.RageUI.InstructionalButton = false
                    end
                })
                RageUI.Checkbox("Page du Menu", nil, kayscoreConfigServ.RageUI.PageCounter, {RighLabel = ""}, { 
                    onChecked = function()
                        kayscoreConfigServ.RageUI.PageCounter = true
                    end,
                    onUnChecked = function()
                        kayscoreConfigServ.RageUI.PageCounter = false
                    end
                })
             end)

             RageUI.IsVisible(Notifmeny, function()

                RageUI.List('Ne pas recevoir de notifications', silenceTimeList, silenceTimeIndexSingle, nil, {}, true, {
                    onListChange = function(Index, Items)
                        ESX.ShowNotification("~g~Vous ne recevrez plus de notifications pendant "..silenceTimeList[silenceTimeIndexSingle])
                        ESX.MuteNotification(curr.silenceTimeIndex[silenceTimeIndexSingle])
                    end
                })

                if exports["frwk"]:silplyEr() then
                    RageUI.Button("Réactiver les notifications", nil, {RightLabel = ''}, true, {
                        onSelected = function()
                            exports["frwk"]:DisableNotif()
                            ESX.ShowNotification("~r~Les notifications seront désormais affichées de nouveau")
                        end
                    })
                end

                RageUI.List('Ne pas recevoir de notifications de votes', silenceTimeList, silenceTimeIndexSingleVotes, nil, {}, true, {
                    onListChange = function(Index, Items)
                        ESX.ShowNotification("~g~Vous ne recevrez plus de notifications pendant "..silenceTimeList[silenceTimeIndexSingleVotes])
                        ESX.MuteNotification(curr.silenceTimeIndex[silenceTimeIndexSingleVotes])
                    end
                })

                if exports["frwk"]:SilVotePly() then
                    RageUI.Button("Réactiver les notifications de votes", nil, {RightLabel = ''}, true, {
                        onSelected = function()
                            exports["frwk"]:DisableNotifVote()
                            ESX.ShowNotification("~r~Les notifications seront désormais affichées de nouveau")
                        end
                    })
                end

                RageUI.List("Position des nofitications", notifPosList, notifPosIndex, nil, {}, true, {
                    onListChange = function(Index, Items)
                        TriggerEvent("bulletin:savePosition", notifPosListIndex[notifPosIndex])
                        ESX.ShowNotification("~g~Position des nofitications '"..notifPosList[notifPosIndex].."' sauvegardée avec succès")
                    end
                })
            end)

                RageUI.IsVisible(carconfig, function()
                    RageUI.Checkbox("Casque moto", "Activer le fait d\'équiper un casque de moto automatiquement", casque, {RighLabel = ""}, { 
                        onChecked = function()
                            casque = true
                            SetPedConfigFlag(Player.playerPed, 35, true)
                        end,
                        onUnChecked = function()
                            casque = false
                            SetPedConfigFlag(Player.playerPed, 35, false)
                        end
                    })

                            RageUI.Checkbox("Conduite décontracté moto", 'Activer le style de conduite décontracté en moto', moto, {RighLabel = ""}, { 
                        onChecked = function()
                            moto = true
                            SetPedConfigFlag(PlayerPedId(), 424, true)
                        end,
                        onUnChecked = function()
                            moto = false
                            SetPedConfigFlag(PlayerPedId(), 424, false)
                        end
                    })
        end)
        RageUI.IsVisible(OptiMenu, function()
            RageUI.Button("Faire une optimisation légère", nil, {RightLabel = "📈"}, true, {
                onSelected = function()
                    exports['sPrompt']:displayRequest(
                        kayscoreConfigServ.ServerName,
                        'Confirmer l\'optimisation légère',
                        function() -- Oui
                            CascadeShadowsClearShadowSampleType()
                            CascadeShadowsSetAircraftMode(false)
                            CascadeShadowsEnableEntityTracker(true)
                            CascadeShadowsSetDynamicDepthMode(false)
                            CascadeShadowsSetEntityTrackerScale(5.0)
                            CascadeShadowsSetDynamicDepthValue(3.0)
                            CascadeShadowsSetCascadeBoundsScale(3.0)
                            
                            SetFlashLightFadeDistance(3.0)
                            SetLightsCutoffDistanceTweak(3.0)
                            DistantCopCarSirens(false)
                            SetArtificialLightsState(false)
                        end,
                        function() -- Non
                            ESX.ShowNotification("Optimisation annulée")
                        end
                    )
                end
            })
            

            
            RageUI.Button("Faire une optimisation médium", nil, {RightLabel = "🖥️"}, true, {
                onSelected = function()
                    exports['sPrompt']:displayRequest(
                        kayscoreConfigServ.ServerName,
                        'Confirmer l\'optimisation médium',
                        function() -- Oui
                            CascadeShadowsClearShadowSampleType()
                            CascadeShadowsSetAircraftMode(false)
                            CascadeShadowsEnableEntityTracker(true)
                            CascadeShadowsSetDynamicDepthMode(false)
                            CascadeShadowsSetEntityTrackerScale(0.0)
                            CascadeShadowsSetDynamicDepthValue(0.0)
                            CascadeShadowsSetCascadeBoundsScale(0.0)
                                
                            SetFlashLightFadeDistance(2.0)
                            SetLightsCutoffDistanceTweak(0.0)
                            DistantCopCarSirens(false)
                            SetArtificialLightsState(false)
                        end,
                        function() -- Non
                            ESX.ShowNotification("Optimisation annulée")
                        end
                    )
                end
            })

            RageUI.Button("Faire une optimisation grosse", nil, {RightLabel = "⚡"}, true, {
                onSelected = function()
                    exports['sPrompt']:displayRequest(
                        kayscoreConfigServ.ServerName,
                        'Confirmer la grosse optimisation',
                        function() -- Oui
                            SetTimecycleModifier('tunnel')
                            RopeDrawShadowEnabled(false)
            
                            CascadeShadowsClearShadowSampleType()
                            CascadeShadowsSetAircraftMode(false)
                            CascadeShadowsEnableEntityTracker(true)
                            CascadeShadowsSetDynamicDepthMode(false)
                            CascadeShadowsSetEntityTrackerScale(0.0)
                            CascadeShadowsSetDynamicDepthValue(0.0)
                            CascadeShadowsSetCascadeBoundsScale(0.0)
            
                            SetFlashLightFadeDistance(5.0)
                            SetLightsCutoffDistanceTweak(5.0)
                            DistantCopCarSirens(false)
                        end,
                        function() -- Non
                            ESX.ShowNotification("Optimisation annulée")
                        end
                    )
                end
            })
            

        end, function()
        end)
        RageUI.IsVisible(FightModif, function()
            -- RageUI.Button("Animation d'arme", nil, {RightLabel = ''}, true, {
            -- }, weaponsAnimationsMenu)
            RageUI.Button("Raccourcis d'armes", nil, {RightLabel = ''}, true, {
            }, weaponsBind)
            RageUI.Checkbox("Viseur", 'Afficher le viseur en mode tir', crosshairactive, {RighLabel = ""}, { 
                onChecked = function()
                    crosshairactive = true
                    crosshair()
                end,
                onUnChecked = function()
                    crosshairactive = false
                    crosshair()
                end
            })
            RageUI.Checkbox("Coup de poings", 'Activer l\'attaque par coups de poings', fighthand, {RighLabel = ""}, { 
                onChecked = function()
                    fighthand = true
                end,
                onUnChecked = function()
                    fighthand = false
                end
            })

           -- RageUI.Checkbox("Coup de Crosse", 'Permet d\'activer, désactiver les coup de crosse', coupdecrossmv, {RighLabel = ""}, { 
           --     onChecked = function()
           --         coupdecrossmv = true
           --     end,
           --     onUnChecked = function()
           --         coupdecrossmv = false
            --    end
           -- })
            --RageUI.Checkbox("Roulades", "Permet d'activer/désactiver les roulades", rouladeMGL, {RighLabel = ""}, { 
              --  onChecked = function()
              --      rouladeMGL = true
              --  end,
              --  onUnChecked = function()
             --       rouladeMGL = false
             --   end
          --  })
        end)

        RageUI.IsVisible(weaponsBind, function()
            for i = 1, #Config.WeaponsBinds do
                RageUI.Button(('%s'):format(Config.WeaponsBinds[i].label), nil, {RightLabel = getWeaponKeybind(Config.WeaponsBinds[i].id).label}, true, {
                    onSelected = function()
                        weaponBindSelected = Config.WeaponsBinds[i].id
                    end
                }, weaponsBindList)
            end
        end)

        RageUI.IsVisible(weaponsBindList, function()

            RageUI.Button("Supprimer le raccourci", nil, {}, true, {
                onSelected = function()
                    setWeaponKeybind(weaponBindSelected, `WEAPON_UNARMED`, 'Aucun')
                    ESX.ShowNotification("Vous avez défini une nouvelle arme sur votre raccourci")
                    RageUI.GoBack()
                end
            })
        
            RageUI.Line()
        
            if #ESX.PlayerData.loadout > 0 then 
                for k, v in pairs(ESX.PlayerData.loadout) do 
                    RageUI.Button(('%s'):format(v.label), nil, {}, true, {
                        onSelected = function()
                            setWeaponKeybind(weaponBindSelected, v.name, v.label)
                            ESX.ShowNotification("Vous avez défini une nouvelle arme sur votre raccourci")
                            RageUI.GoBack()
                        end
                    })
                end
            else
                RageUI.Separator("Vous n'avez pas d'arme")
            end
        
        end)
        

        RageUI.IsVisible(drugsmod, function()
            if kayscoreDrugs.sell.InSell then
                RageUI.Separator(('~r~Ventre de drogue (%s)~s~'):format(DrgusList[drugsIndex]))
            else
                RageUI.Separator('~r~Ventre de drogue~s~')
            end
            RageUI.List('Type de drogue', DrgusList, drugsIndex, nil, {}, not kayscoreDrugs.sell.InSell, {
                onListChange = function(Index, Items)
                    if kayscoreDrugs.sell.InSell then return end

                    drugsIndex = Index
                end
            })
            RageUI.Checkbox('Vente de drogue', nil, kayscoreDrugs.sell.InSell, {}, {
                onChecked = function()
                    ESX.TriggerServerCallback('kayscore:drugs:sell:getPhone', function(cb)
                        if not cb then return ESX.ShowNotification('Vous devez posséder un téléphone pour vendre de la ~r~drogue~s~') end

                        -- if exports["lb-phone"]:GetAirplaneMode() then return ESX.ShowNotification('Vous ne pouvez pas vendre de la drogue avec le mode avion activé') end

                        ESX.TriggerServerCallback('kayscore:drugs:sell:getItem', function(cbb)
                            if not cbb then return end

                            kayscoreDrugs.sell.InSell = true
    
                            sendPhoneMessage("Twitter", ("💊 Vente de pochon de %s"):format(DrgusList[drugsIndex]), "Tu viens de lancer une session de vente de drogue")
        
                            setNewDestination()
                        end, DrugsListData[DrgusList[drugsIndex]])

                    end)
                end,
                onUnChecked = function()
                    kayscoreDrugs.sell.InSell = false

                    sendPhoneMessage("Twitter", ("💊 Vente de pochon de %s"):format(DrgusList[drugsIndex]), "Tu viens d\'arrêter ta session de vente de drogue")

                    stopVente()
                end
            })
        end)

        RageUI.IsVisible(radioMenu, function()
            radioMenu.EnableMouse = false
            RageUI.Checkbox('Etat de la radio', nil, self.radioEnabled, {}, {
                onChecked = function()
                    self.radioEnabled = true
                    pma:setVoiceProperty("radioEnabled", true)
                    pma:setRadioChannel(0)
                end,
                onUnChecked = function()
                    self.radioEnabled = false
                    pma:setVoiceProperty("radioEnabled", false)
                    pma:setRadioChannel(0)
                end,
            })
            if (self.radioEnabled) then
                RageUI.Button(('Fréquence (%s)'):format(self.radioChannel), nil, {}, true, {
                    onSelected = function()
                        local input = ESX.GetNumberInput("Entrez la fréquence")
                        if input == nil then
                            return ESX.ShowNotification("~r~La fréquence ne peut pas être nulle")
                        end

                        if Config.Personalmenu.Radio[input] then
                            if not Config.Personalmenu.Radio[input][ESX.PlayerData.job.name] then
                                return ESX.ShowNotification("Vous n'avez pas accès à cette fréquence")
                            end

                            self.radioChannel = input
                            pma:setRadioChannel(input)
                            ESX.ShowNotification(("Fréquence définie sur %s MHZ"):format(input))
                        else
                            self.radioChannel = tostring(input)
                            pma:setRadioChannel(input)
                            ESX.ShowNotification(("Fréquence définie sur %s MHZ"):format(input))
                        end
                    end
                })
                RageUI.Checkbox('Bruitages', nil, self.radioTick, {}, {
                    onChecked = function()
                        self.radioTick = true
                        pma:setVoiceProperty("micClicks", true)
                    end,
                    onUnChecked = function()
                        self.radioTick = false
                        pma:setVoiceProperty("micClicks", false)
                    end,
                })
                RageUI.Button(('Volume (%s)'):format(math.floor(self.volumeRadio*100)..'%'), nil, {}, true, {
                    onActive = function()
                        radioMenu.EnableMouse = true
                    end,
                })
            end
        end, function()
            RageUI.PercentagePanel(self.volumeRadio, 'Volume', '0%', '100%', {
                onProgressChange = function(data)
                    self.volumeRadio = data
                    pma:setRadioVolume(math.floor(self.volumeRadio*100))
                end
            }, 4) 
        end)
        
            RageUI.IsVisible(weaponsAnimationsMenu, function()
                
            for k,v in pairs(kayscoreHolsters) do 
                RageUI.Checkbox(v.label, false, Player.holsterPreset == k, {}, {
                    onChecked = function()
                        SetResourceKvp("HolsterPreset", k)
                        Player.holsterPreset = GetResourceKvpString("HolsterPreset")
                    end
                })
            end
            RageUI.Line()
                        for k,v in pairs(kayscoreAimStyles) do 
                RageUI.Checkbox(v, false, Player.aimStyle == v, {}, {
                    onChecked = function()
                        SetResourceKvp("aimStyle", v)
                        Player.aimStyle = GetResourceKvpString("aimStyle")
                    end
                })
            end
        end)

        RageUI.IsVisible(openSocietyList, function()
            local societyOpen = {}
            local societyClosed = {}

            for k,v in pairs(Society.List) do
                if v.state == true then
                    v.value = '~g~Ouvert~s~'
                    
                    table.insert(societyOpen, {
                        name = v.name,
                        label = v.label,
                        value = v.value,
                        blips = v.blips
                    })
                else
                    v.value = '~r~Fermé~s~'
                    table.insert(societyClosed, {
                        name = v.name,
                        label = v.label,
                        value = v.value,
                        blips = v.blips
                    })
                end
            end

            local blacklist = {
               -- ['vigne'] = true
            }

            for k,v in pairs(societyOpen) do
                if not blacklist[v.name] then 

                RageUI.Button(v.label, 'Appuyer sur ENTRER si vous souhaitez voir la localisation de l\'entreprise sur votre map.', {RightLabel = v.value}, true, {
                    onSelected = function()
                        if v.blips.position then
                            SetNewWaypoint(v.blips.position.x, v.blips.position.y)
                        else
                            SetNewWaypoint(posjob[v.name].x, posjob[v.name].y)
                        end

                    end
                })
            end

            

            end
            for k,v in pairs(societyClosed) do
                if not blacklist[v.name] then 

                RageUI.Button(v.label, 'Appuyer sur ENTRER si vous souhaitez voir la localisation de l\'entreprise sur votre map.', {RightLabel = v.value}, true, {
                    onSelected = function()
                        if v.blips.position then
                            SetNewWaypoint(v.blips.position.x, v.blips.position.y)
                        else
                            SetNewWaypoint(posjob[v.name].x, posjob[v.name].y)
                        end
                        
                    end
                })

                end
            end
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(CustomMenu) and not RageUI.Visible(CustomMenuSelected) and not RageUI.Visible(Portefeuille) and not RageUI.Visible(VehicleOption) and not RageUI.Visible(OpenReportFast) and not RageUI.Visible(OptiMenu) and not RageUI.Visible(FightModif) and not RageUI.Visible(vipMenu) and not RageUI.Visible(petMenu) and not RageUI.Visible(EntrepriseOption) and not RageUI.Visible(OptionsVisuels) and not RageUI.Visible(radioMenu) and not RageUI.Visible(openSocietyList) and not RageUI.Visible(Notifmeny) and not RageUI.Visible(propsMenu) and not RageUI.Visible(clothesMenu) and not RageUI.Visible(clothesMenu2) and not RageUI.Visible(factures) and not RageUI.Visible(stautinfo) and not RageUI.Visible(walksList) and not RageUI.Visible(openVipPeds) and not RageUI.Visible(visualconfig) and not RageUI.Visible(carconfig) and not RageUI.Visible(selectedWeaponTint) and not RageUI.Visible(gestionlicense) and not RageUI.Visible(vipPlateGestion) and not RageUI.Visible(vipPlates) and not RageUI.Visible(infojob2) and not RageUI.Visible(infojob) and not RageUI.Visible(guids) and not RageUI.Visible(weaponsAnimationsMenu) and not RageUI.Visible(ModifMenu) and not RageUI.Visible(weaponsBindList) and not RageUI.Visible(weaponsBind) and not RageUI.Visible(drugsmod) and
            
            not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
        end
    end
end

RegisterCommand('personnalmenu', function()
    openPersonnalMenu()
end)

RegisterKeyMapping('personnalmenu', 'Menu Personnel', 'keyboard', 'F5')

RegisterNetEvent('kayscore:recieveProps', function(table)
    propsPropsList = table
end)