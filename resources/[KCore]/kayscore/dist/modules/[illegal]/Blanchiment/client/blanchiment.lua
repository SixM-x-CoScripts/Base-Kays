---@class Blanchiment


function Blanchiment:createMenu()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    local create = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local edit = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local selectedEditBlanchiment = RageUI.CreateSubMenu(edit, '', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Button('Créer une location (Blanchiment)', nil, {}, true, {
                onSelected = function()
                    
                end
            }, create)
            RageUI.Button('Modifier une location', nil, {}, true, {
                onSelected = function()
                    
                end
            }, edit)
        end)

        RageUI.IsVisible(create, function()
            RageUI.Button('Nom de la position', nil, {RightLabel = Blanchiment.admin.create.name or '~r~Indéfini'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nom de la position', function(data)
                        if data == nil or data == '' then Blanchiment.admin.create.name = nil return end

                        Blanchiment.admin.create.name = data
                    end)
                end
            })
            RageUI.Button('Label de la position', nil, {RightLabel = Blanchiment.admin.create.label or '~r~Indéfini'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nom de la position', function(data)
                        if data == nil or data == '' then Blanchiment.admin.create.label = nil return end

                        Blanchiment.admin.create.label = data
                    end)
                end
            })
            RageUI.Button('Position', '\nUne fois la position définie, vous pouvez re séléctionner le bouton pour la redéfinir\n', {RightLabel = Blanchiment.admin.create.defPos and '~g~Défini' or '~r~Indéfini'}, true, {
                onSelected = function()
                    Blanchiment.admin.create.defPos  = GetEntityCoords(PlayerPedId())
                end
            })
            RageUI.Button('Confirmer', nil, {}, true, {
                onSelected = function()
                    if Blanchiment.admin.create.name == nil or Blanchiment.admin.create.label == nil or Blanchiment.admin.create.defPos == nil then return ESX.ShowNotification('Toutes les informations ne sont pas corréctement renseigner') end
                    
                    secured_TriggerServerEvent('kayscore:blanchiment:create', Blanchiment.admin.create.name, Blanchiment.admin.create.label, Blanchiment.admin.create.defPos)
                end
            })
        end)

        RageUI.IsVisible(edit, function()
            for k,v in pairs(Blanchiment.data.blanchiment) do
                RageUI.Button(('(%s) %s - %s'):format(k, v.name, v.label), nil, {}, true, {
                    onSelected = function()
                        Blanchiment.admin.selectedBlanchiment = v
                        Blanchiment.admin.selectedBlanchimentId = k
                    end
                }, selectedEditBlanchiment)
            end
        end)

        RageUI.IsVisible(selectedEditBlanchiment, function()
            RageUI.Button('Supprimer le bâtiment', nil, {}, true, {
                onSelected = function()
                    exports['sPrompt']:displayRequestttt(
                        kayscoreConfigServ.ServerName,
                        'Êtes-vous sûr de vouloir supprimer ce bâtiment de blanchiment ?', -- Message de confirmation
                        function() -- oui
                            Blanchiment.data.blanchiment[Blanchiment.admin.selectedBlanchimentId] = nil
                            secured_TriggerServerEvent('kayscore:blanchiment:delete', Blanchiment.admin.selectedBlanchimentId)
                            RageUI.GoBack()
                        end,
                        function() -- non
                            ESX.ShowNotification('Suppression annulée')
                        end
                    )
                end
            })
        end)
        

        if not RageUI.Visible(main) and not RageUI.Visible(create) and not RageUI.Visible(edit) and not RageUI.Visible(selectedEditBlanchiment) and

        not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
        end
    end
end

RegisterCommand('blanchiment', function()
    if not Blanchiment.admin.permissions_command[ESX.PlayerData.group] then return end

    Blanchiment:createMenu()
end)

CreateThread(function()
    Wait(1000)
    secured_TriggerServerEvent('kayscore:blanchiment:init')
end)

RegisterNetEvent('kayscore:blanchiment:refresh', function(Table)
    Blanchiment.data.blanchiment = Table
    Blanchiment.data.load = true
end)

CreateThread(function()
    while (not ESXLoaded) do Wait(1) end
    while (not Blanchiment.data.load) do Wait(1) end

    while true do

        
        Wait(Blanchiment.data.interval)

        Blanchiment.data.interval = 2000

        for k,v in pairs(Blanchiment.data.blanchiment) do
            local dist = #(GetEntityCoords(PlayerPedId())-vector3(v.pos.x, v.pos.y, v.pos.z))

            if dist > 15 then goto continue end

            Blanchiment.data.interval = 1

            DrawMarker(25, v.pos.x, v.pos.y, v.pos.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)

            if dist < 1.5 then
                DrawInstructionBarNotification(v.pos.x, v.pos.y, v.pos.z, ("Appuyez sur [ %sE~w~ ] pour intéragir"):format(UTILS.COLORCODE))
                if IsControlJustPressed(1,51) then
                    Blanchiment:openMenu(k)
                end
            end

            ::continue::
        end
    end
end)

function Blanchiment:openMenu(k)
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    local create = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            if Blanchiment.data.blanchiment[k] == nil then RageUI.CloseAll() end
            if Blanchiment.data.blanchiment[k].owner == ESX.PlayerData.UniqueID then
                RageUI.Separator('↓ Votre batiment ↓')
                RageUI.Separator(('Temps restant de location restant: ~p~%sh~s~'):format(Blanchiment.data.blanchiment[k].time))
                RageUI.Separator(('Pourcentage du batiment: ~g~%s%s%s~s~'):format('-', math.floor(Blanchiment.data.blanchiment[k].percent * 100), '%'))
                RageUI.Button('Blanchir de l\'argent (Sale)', '⚠️10 000$ minimum⚠️ \n', {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Montant à blanchir', function(data)
                            local data = tonumber(data)
                            if data == nil or data < 10000 then return ESX.ShowNotification('⛔ Argument manquant ou montant invalide') end

                            secured_TriggerServerEvent('kayscore:blanchiment:washMoney', data, Blanchiment.data.blanchiment[k].percent, Blanchiment.data.blanchiment[k].owner)
                        end)
                    end
                })
                RageUI.Button('Rendre la location', '⚠️Aucun remboursement⚠️ \n', {}, true, {
                    onSelected = function()
                        exports['sPrompt']:displayRequestttt(
                            kayscoreConfigServ.ServerName,
                            'Êtes-vous sûr de vouloir rendre cette location ? Aucun remboursement ne sera effectué.', -- Message de confirmation
                            function() -- oui
                                secured_TriggerServerEvent('kayscore:blanchiment:removeOwner', k)
                            end,
                            function() -- non
                                ESX.ShowNotification('Action annulée')
                            end
                        )
                    end
                })
            else
                if Blanchiment.data.blanchiment[k].owner ~= 0 then
                    RageUI.Line()
                    RageUI.Separator('~r~Ce batiment est déjà en cours de location !~s~\nrevenez ultérieurement')
                    RageUI.Separator()
                    RageUI.Line()
                else
                    RageUI.Separator('↓ Batiment en location ↓')
                    RageUI.Separator(('Louer ce batiment pour un total de ~g~%s$~s~'):format(ESX.Math.GroupDigits(Blanchiment.data.Price[Blanchiment.data.locationData][Blanchiment.data.percentData])))
                    RageUI.List('Temps de location', Blanchiment.data.location, Blanchiment.data.locationData, nil, {}, true, {
                        onListChange = function(Index)
                            Blanchiment.data.locationData = Index
                        end
                    })
                    RageUI.List('Pourcentage', Blanchiment.data.percent, Blanchiment.data.percentData, nil, {}, true, {
                        onListChange = function(Index)
                            Blanchiment.data.percentData = Index
                        end
                    })
                    RageUI.List('Payer en', Blanchiment.data.paid, Blanchiment.data.paidData, nil, {}, true, {
                        onListChange = function(Index)
                            Blanchiment.data.paidData = Index
                        end
                    })
                    RageUI.Line()
                    RageUI.Button('Confirmer l\'achat', nil, {}, true, {
                        onSelected = function()
                            exports['sPrompt']:displayRequestttt(
                                kayscoreConfigServ.ServerName,
                                'Êtes-vous sûr de vouloir confirmer cet achat ?', -- Message de confirmation
                                function() -- oui
                                    secured_TriggerServerEvent('kayscore:blanchiment:paid', Blanchiment.data.locationData, Blanchiment.data.Price[Blanchiment.data.locationData][Blanchiment.data.percentData], Blanchiment.data.percentData, Blanchiment.data.paidData, k)
                                end,
                                function() -- non
                                    ESX.ShowNotification('Achat annulé')
                            end)
                        end
                    })
                end
            end
        end)

        if not RageUI.Visible(main) and

        not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

secured_RegisterNetEvent('kayscore:blanchiment:updateOwner', function(id, Table)
    Blanchiment.data.blanchiment[id] = Table
end)