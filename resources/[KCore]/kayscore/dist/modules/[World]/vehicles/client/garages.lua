---@class Garages


local waitvehperso = true



local token = 0
RegisterNetEvent('kayscore:garage:retreive:token', function (newToken)
    token = newToken
end)


RegisterNetEvent('kayscore:garage:refresh', function(Table)
    if json.encode(Table) == '[]' then goto continue end

    Garages.garage_data.garages = Table
    Garages.garage_data.Loaded = true

   ::continue::
end)

RegisterNetEvent('kayscore:garage:refreshBlip', function()
    Garages:InitBlip()
end)

CreateThread(function()
    Wait(1000)
    TriggerServerEvent('kayscore:garage:load')
end)

function Garages:InitBlip()
    for k,v in pairs(Garages.garage_data.garages) do
        if v.activeblip == nil then goto continue end

        if v.activeblip == 1 or v.activeblip == true then
            local GarageBlip = AddBlipForCoord(v.defaultpos.x, v.defaultpos.y, v.defaultpos.z)
            SetBlipSprite(GarageBlip, v.type == 'car' and 357 or v.type == 'boat' and 427 or v.type == 'aircraft' and 557)
            SetBlipDisplay(GarageBlip, 4)
            SetBlipScale(GarageBlip, v.type == 'boat' and 0.5 or 0.5)
            SetBlipColour(GarageBlip, 42)
            SetBlipAsShortRange(GarageBlip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.type == 'car' and '[TERRESTRE] Parking Public' or v.type == 'boat' and '[NAUTIQUE] Parking Public' or v.type == 'aircraft' and '[AÉRIEN] Parking Public')
            EndTextCommandSetBlipName(GarageBlip)

            Garages.garage_data.blips[k] = {
                id = GarageBlip
            }
        end

        ::continue::
    end
end

CreateThread(function()
    while not ESXLoaded do Wait(1) end
    while not Garages.garage_data.Loaded do Wait(1) end

    Garages:InitBlip()

    for k,v in pairs(Garages.garage_data.data.Pounds) do
        for i,p in pairs(Garages.garage_data.data.Pounds[k]) do
            local FourriereBlip = AddBlipForCoord(p.position.x, p.position.y, p.position.z)
            SetBlipSprite(FourriereBlip, 643)
            SetBlipDisplay(FourriereBlip, 4)
            SetBlipScale(FourriereBlip, 0.5)
            SetBlipColour(FourriereBlip, 81)
            SetBlipAsShortRange(FourriereBlip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(k == 'car' and '[TERRESTRE] Fourrière' or k == 'boat' and '[NAUTIQUE] Fourrière' or k == 'aircraft' and '[AÉRIEN] Fourrière')
            EndTextCommandSetBlipName(FourriereBlip)
        end
    end

    while true do

        Wait(Garages.garage_data.wait)

        Garages.garage_data.wait = 2000

        for k,v in pairs(Garages.garage_data.garages) do
            if v.defaultpos == nil and v.deletepos == nil then goto continue end

            local ppos = GetEntityCoords(PlayerPedId())
            local distance = #(ppos-vector3(v.defaultpos.x, v.defaultpos.y, v.defaultpos.z))
            local distance2 = #(ppos-vector3(v.deletepos.x, v.deletepos.y, v.deletepos.z))

            if distance > 30 and distance2 > 30 then goto continue end

            Garages.garage_data.wait = 1

            DrawMarker(25, v.defaultpos.x, v.defaultpos.y, v.defaultpos.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)
            DrawMarker(36, v.deletepos.x, v.deletepos.y, v.deletepos.z-0.30, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, true, false, false, false)

            if distance < 1.5 then
                DrawInstructionBarNotification(v.defaultpos.x, v.defaultpos.y, v.defaultpos.z, "Appuyez sur [ ~g~E~w~ ] pour intéragir")
                --exports['ui']:showHelpNotification('Appuyez sur ~p~E~s~ pour intéragir')
                if IsControlJustPressed(1,51) then
                    Garages:openMenu(k, v.type)
                end
            end

            if distance2 < 1.5 then
                DrawInstructionBarNotification(v.deletepos.x, v.deletepos.y, v.deletepos.z + 0.25, "Appuyez sur [ ~g~E~w~ ] pour ranger votre véhicule")
                if IsControlJustPressed(1,51) then
                    Garages:rentVehicle(k, v.type)
                end
            end

            ::continue::
        end

        for k,v in pairs(Garages.garage_data.data.Pounds) do
            for i,p in pairs(Garages.garage_data.data.Pounds[k]) do
                local distance = #(GetEntityCoords(PlayerPedId())-vector3(p.position.x, p.position.y, p.position.z))

                if distance > 10 then goto continue end

                Garages.garage_data.wait = 1

                DrawMarker(25, p.position.x, p.position.y, p.position.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)

                if distance < 1.5 then
                    DrawInstructionBarNotification(p.position.x, p.position.y, p.position.z, "Appuyez sur [ ~g~E~w~ ] pour intéragir")
                    if IsControlJustPressed(1,51) then
                        Garages:openPoundMenu(k, p, k, i)
                    end
                end

                ::continue::
            end
        end
    end
end)

---Garages:createMenu
function Garages:createMenu()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')
    local create = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local edit = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local edit_select = RageUI.CreateSubMenu(edit, '', 'Actions Disponibles')

    local editSpawnPos = RageUI.CreateSubMenu(edit_select, '', 'Actions Disponibles')

    local playerInformations = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local playerInformationsUniqueID = {}
    local playerInformationsUniqueIDInfo = 0

    local entrepriseInformations = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local Attribueveiculeentreprise = RageUI.CreateSubMenu(entrepriseInformations, '', "Actions Disponibles")

    RageUI.Visible(main, not RageUI.Visible(main))
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Line(UTILS.ServerColor.r, UTILS.ServerColor.g, UTILS.ServerColor.b, UTILS.ServerColor.o)
            RageUI.Button('Crée un garage', nil, {}, true, {}, create)
            RageUI.Button('Modifier un garage', nil, {}, true, {
                onSelected = function()

                end
            }, edit)
            RageUI.Line(UTILS.ServerColor.r, UTILS.ServerColor.g, UTILS.ServerColor.b, UTILS.ServerColor.o)
              --  RageUI.Button('Gérer les véhicules d\'un joueur', nil, {}, true, {
               --  onSelected = function()
               --      KeyboardUtils.use('Entrée l\'id unique du joueur', function(data)
               --          local data = tonumber(data)
               --          if data == nil and data == '' then return end
               --          ESX.TriggerServerCallback('kayscore:garage:getInfoPlayer', function(cb)
               --             if json.encode(cb) == '[]' then goto continue end
               --              playerInformationsUniqueID = cb
               --              playerInformationsUniqueIDInfo = data
               --              RageUI.Visible(playerInformations, true)

                --             ::continue::
                 --        end, data)
                --     end)
                -- end
           --  })
            RageUI.Button('Gérer les véhicules (joueur/group/entreprise)', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Entrée le (ID/Group/Entreprise)', function(data)
                        if data == nil or data == '' then return end
                        ESX.TriggerServerCallback('kayscore:garage:getInfoEntreprise', function(cb)
                            playerInformationsUniqueID = cb
                            playerInformationsUniqueIDInfo = data
                            RageUI.Visible(entrepriseInformations, true)
                        end, data)
                    end)
                end
            })
        end)

        RageUI.IsVisible(create, function()
             RageUI.Line(UTILS.ServerColor.r, UTILS.ServerColor.g, UTILS.ServerColor.b, UTILS.ServerColor.o)

            RageUI.Button('Nom du garage', nil, {RightLabel = Garages.CreateName or '~r~Indéfini~s~'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Entrée un nom', function(data)
                        if data == '' then Garages.CreateName = nil return end

                        Garages.CreateName = data
                    end)
                end
            })

            RageUI.Button('Label du garage', nil, {RightLabel = Garages.CreateLabel or '~r~Indéfini~s~'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Entrée un LABEL', function(data)
                        if data == '' then Garages.CreateLabel = nil return end

                        Garages.CreateLabel = data
                    end)
                end
            })

            RageUI.List('Type de garage', Garages.Create.Data, Garages.Create.Index, nil, {}, true, {
                onListChange = function(Index)
                    Garages.Create.Index = Index
                end
            })

            RageUI.Button('Position du garage', '\n⚠️ Une fois la position défini, vous pouvez re-séléctioné le bouton pour la changer\n', {RightLabel = Garages.defaultpos == nil and '~r~Indéfini~s~' or '~g~Défini~s~'}, true, {
                onSelected = function()
                    Garages.defaultpos = GetEntityCoords(PlayerPedId())
                end
            })

            RageUI.Button('Position du rangement', '\n⚠️ Une fois la position défini, vous pouvez re-séléctioné le bouton pour la changer\n', {RightLabel = Garages.deletepos == nil and '~r~Indéfini~s~' or '~g~Défini~s~'}, true, {
                onSelected = function()
                    Garages.deletepos = GetEntityCoords(PlayerPedId())
                end
            })

            RageUI.Line()

            RageUI.Separator(('Actuellement %s position(s)'):format(#Garages.Create.spawnPos))

            RageUI.Button('Positions du spawn', 'Définir une ou plusieurs positions de spawn', {}, true, {
                onSelected = function()
                    local playerCoords = GetEntityCoords(PlayerPedId())
                    Garages.Create.spawnPos[#Garages.Create.spawnPos+1] = {x = playerCoords.x, y = playerCoords.y, z = playerCoords.z-0.98, h = GetEntityHeading(PlayerPedId())}
                end
            })

            RageUI.Button('Retirer la dernière position', nil, {}, true, {
                onSelected = function()
                    Garages.Create.spawnPos[#Garages.Create.spawnPos] = nil
                end
            })

            for k,v in pairs(Garages.Create.spawnPos) do
                DrawMarker(1, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 240, 255, 0, 255, false, false, 2, false, false, false, false)
                DrawInstructionBarNotification(v.x, v.y, v.z+0.25, (v.x..' '..v.y..' '..v.z.. ' (%s)'):format(v.h))
            end

            RageUI.Line()

            -- RageUI.Button('Position du spawn', '\n⚠️ Une fois la position défini, vous pouvez re-séléctioné le bouton pour la changer\n', {RightLabel = Garages.spawnpos == nil and '~r~Indéfini~s~' or '~g~Défini~s~'}, true, {
            --     onSelected = function()
            --         Garages.spawnpos = GetEntityCoords(PlayerPedId())
            --     end
            -- })

            -- RageUI.Button('Rotation du spawn', '\n⚠️ Une fois la rotation défini, vous pouvez re-séléctioné le bouton pour la changer\n', {RightLabel = Garages.headingspawnpos == nil and '~r~Indéfini~s~' or '~g~Défini~s~'}, true, {
            --     onSelected = function()
            --         Garages.headingspawnpos = GetEntityHeading(PlayerPedId())
            --     end
            -- })

            RageUI.Checkbox('Afficher le blip', nil, Garages.activeblip, {}, {
                onChecked = function()
                    Garages.activeblip = true
                end,
                onUnChecked = function()
                    Garages.activeblip = false
                end
            })

            RageUI.Button('Confirmer', nil, {}, true, {
                onSelected = function()
                    Garages:create(Garages.CreateName, Garages.CreateLabel, Garages.Create.Index, Garages.defaultpos, Garages.deletepos, Garages.Create.spawnPos, Garages.headingspawnpos, Garages.activeblip)

                    Garages.Create.spawnPos = {}
                end
            })

             RageUI.Line(UTILS.ServerColor.r, UTILS.ServerColor.g, UTILS.ServerColor.b, UTILS.ServerColor.o)
        end)

        RageUI.IsVisible(edit, function()
            for k,v in pairs(Garages.garage_data.garages) do
                RageUI.Button(('(%i) %s - %s'):format(v.id, v.name, v.label), nil, {}, true, {
                    onSelected = function()
                        Garages.selectedId = v.id
                        if Garages.garage_data.garages[v.id].activeblip == 1 or Garages.garage_data.garages[v.id].activeblip == true then Garages.garage_data.garages[v.id].activeblip = true else Garages.garage_data.garages[v.id].activeblip = false end
                    end
                }, edit_select)
            end
        end)

        RageUI.IsVisible(edit_select, function()
            for k,v in pairs(Garages.garage_data.garages) do
                if v.id == Garages.selectedId then
                    RageUI.Separator(('Nom du garage: %s'):format(v.name))
                    RageUI.Separator(('Label du garage: %s'):format(v.label))
                end
            end
                RageUI.Line(UTILS.ServerColor.r, UTILS.ServerColor.g, UTILS.ServerColor.b, UTILS.ServerColor.o)
                RageUI.Button('Changer le nom du garage', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Nouveau nom', function(data)
                            if data == '' then return end

                            Garages.garage_data.garages[Garages.selectedId].name = data
                            TriggerServerEvent('kayscore:garage:edit', Garages.selectedId, Garages.garage_data.garages[Garages.selectedId])
                        end)
                    end
                })
                RageUI.Button('Changer le label du garage', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Nouveau nom', function(data)
                            if data == '' then return end

                            Garages.garage_data.garages[Garages.selectedId].label = data
                            TriggerServerEvent('kayscore:garage:edit', Garages.selectedId, Garages.garage_data.garages[Garages.selectedId])
                        end)
                    end
                })
                RageUI.Button('Changer la position du garage', nil, {}, true, {
                    onSelected = function()
                        Garages.garage_data.garages[Garages.selectedId].defaultpos = GetEntityCoords(PlayerPedId())
                        TriggerServerEvent('kayscore:garage:edit', Garages.selectedId, Garages.garage_data.garages[Garages.selectedId])
                    end
                })
                RageUI.Button('Changer la position du point de delete', nil,  {}, true, {
                    onSelected = function()
                        Garages.garage_data.garages[Garages.selectedId].deletepos = GetEntityCoords(PlayerPedId())
                        TriggerServerEvent('kayscore:garage:edit', Garages.selectedId, Garages.garage_data.garages[Garages.selectedId])
                    end
                })
                -- RageUI.Button('Changer la position du point de spawn', nil, {}, false, {
                --     onSelected = function()
                --         Garages.garage_data.garages[Garages.selectedId].spawnpos = GetEntityCoords(PlayerPedId())
                --         TriggerServerEvent('kayscore:garage:edit', Garages.selectedId, Garages.garage_data.garages[Garages.selectedId])
                --     end
                -- })
                RageUI.Button('Modifier les positions de spawn', nil, {}, true, {
                    onSelected = function()
                        
                    end
                }, editSpawnPos)
                -- RageUI.Button('Changer la rotation du point de spawn', nil, {}, true, {
                --     onSelected = function()
                --         Garages.garage_data.garages[Garages.selectedId].headingspawnpos = GetEntityHeading(PlayerPedId())
                --         TriggerServerEvent('kayscore:garage:edit', Garages.selectedId, Garages.garage_data.garages[Garages.selectedId])
                --     end
                -- })
                for k,v in pairs(Garages.garage_data.garages) do
                    if v.id == Garages.selectedId then
                    RageUI.Checkbox('Afficher le blip', nil, Garages.garage_data.garages[Garages.selectedId].activeblip, {}, {
                        onChecked = function()
                            Garages.garage_data.garages[Garages.selectedId].activeblip = true
                            TriggerServerEvent('kayscore:garage:edit', Garages.selectedId, Garages.garage_data.garages[Garages.selectedId])
                            ESX.ShowNotification('Le blip est désormé actif')
                            
                            TriggerServerEvent('kayscore:garages:edit:blips', 'add', Garages.selectedId)
                        end,
                        onUnChecked = function()
                            Garages.garage_data.garages[Garages.selectedId].activeblip = false
                            TriggerServerEvent('kayscore:garage:edit', Garages.selectedId, Garages.garage_data.garages[Garages.selectedId])
                            ESX.ShowNotification('Le blip est désormé inactif')
                            TriggerServerEvent('kayscore:garages:edit:blips', 'remove', Garages.selectedId)
                        end
                    })
                end
            end
            -- RageUI.List('Se téléporter à ', Garages.Create.Locations.Data, Garages.Create.Locations.Index, nil, {}, true, {
            --     onListChange = function(Index)
            --         Garages.Create.Locations.Index = Index
            --     end,
            --     onSelected = function()
            --         local PlayerPed = PlayerPedId()
            --         if Garages.Create.Locations.Index == 1 then
            --             SetEntityCoords(PlayerPed, vector3(Garages.garage_data.garages[Garages.selectedId].defaultpos.x, Garages.garage_data.garages[Garages.selectedId].defaultpos.y, Garages.garage_data.garages[Garages.selectedId].defaultpos.z))
            --         elseif Garages.Create.Locations.Index == 2 then
            --             SetEntityCoords(PlayerPed, vector3(Garages.garage_data.garages[Garages.selectedId].deletepos.x, Garages.garage_data.garages[Garages.selectedId].deletepos.y, Garages.garage_data.garages[Garages.selectedId].deletepos.z))
            --         elseif Garages.Create.Locations.Index == 3 then
            --             SetEntityCoords(PlayerPed, vector3(Garages.garage_data.garages[Garages.selectedId].spawnpos.x, Garages.garage_data.garages[Garages.selectedId].spawnpos.y, Garages.garage_data.garages[Garages.selectedId].spawnpos.z))
            --         end
            --     end
            -- })
            RageUI.Button('Supprimer le garage', nil, {}, Garages.selectedId ~= 1 and Garages.selectedId ~= 2 and Garages.selectedId ~= 3, {
                onSelected = function()
                    TriggerServerEvent('kayscore:garage:delete', Garages.selectedId)
                    Garages.garage_data.garages[Garages.selectedId] = nil
                    RageUI.GoBack()
                end
            })
        end)

        RageUI.IsVisible(editSpawnPos, function()
            Garages.garage_data.garages[Garages.selectedId].spawnpos = Garages.garage_data.garages[Garages.selectedId].spawnpos
            for k,v in pairs(Garages.garage_data.garages[Garages.selectedId].spawnpos) do
                DrawMarker(1, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 240, 255, 0, 255, false, false, 2, false, false, false, false)
                DrawInstructionBarNotification(v.x, v.y, v.z+0.25, (v.x..' '..v.y..' '..v.z.. ' (%s)'):format(v.h))
                RageUI.Button(('%s %s %s (%s)'):format(v.x, v.y, v.z, v.h or 90.0), '\n[ENTER] pour changer la position\n[E] pour supprimer la position\n', {}, true, {
                    onActive = function()
                        DrawMarker(43, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 240, 0, 0, 255, false, false, 2, false, false, false, false)
                        DrawInstructionBarNotification(v.x, v.y, v.z+0.25, (v.x..' '..v.y..' '..v.z.. ' (%s)'):format(v.h))

                        if IsControlJustPressed(0, 54) then
                            if #Garages.garage_data.garages[Garages.selectedId].spawnpos == 1 then
                                return
                            end
                            table.remove(Garages.garage_data.garages[Garages.selectedId].spawnpos, k)
                            
                            TriggerServerEvent('kayscore:garage:edit', Garages.selectedId, Garages.garage_data.garages[Garages.selectedId])

                        end
                    end,
                    onSelected = function()
                        local playerPed = PlayerPedId()
                        local PlayerCoords = GetEntityCoords(playerPed)
                        local PlayerHeading = GetEntityHeading(playerPed)

                        Garages.garage_data.garages[Garages.selectedId].spawnpos[k].x, Garages.garage_data.garages[Garages.selectedId].spawnpos[k].y, Garages.garage_data.garages[Garages.selectedId].spawnpos[k].z = PlayerCoords.x, PlayerCoords.y, PlayerCoords.z

                        Garages.garage_data.garages[Garages.selectedId].spawnpos[k].h = PlayerHeading

                        Garages.garage_data.garages[Garages.selectedId].spawnpos[k].z -= 1

                        TriggerServerEvent('kayscore:garage:edit', Garages.selectedId, Garages.garage_data.garages[Garages.selectedId])
                    end
                })
            end
            RageUI.Line()
            RageUI.Separator(('Actuellement %s position(s)'):format(#Garages.garage_data.garages[Garages.selectedId].spawnpos))

            RageUI.Button('Ajouter une position', 'Permet d\'jouter une nouvelle position de spawn', {}, true, {
                onSelected = function()
                    local playerCoords = GetEntityCoords(PlayerPedId())
                    Garages.garage_data.garages[Garages.selectedId].spawnpos[#Garages.garage_data.garages[Garages.selectedId].spawnpos+1] = {x = playerCoords.x, y = playerCoords.y, z = playerCoords.z-0.98, h = GetEntityHeading(PlayerPedId())}

                    TriggerServerEvent('kayscore:garage:edit', Garages.selectedId, Garages.garage_data.garages[Garages.selectedId])
                end
            })
        end)

       -- RageUI.IsVisible(playerInformations, function()
           -- RageUI.Separator(('Informations des véhicules du joueur ~p~%s~s~'):format(playerInformationsUniqueID[playerInformationsUniqueIDInfo].owner))


          --  RageUI.Line(UTILS.ServerColor.r, UTILS.ServerColor.g, UTILS.ServerColor.b, UTILS.ServerColor.o)

          --  for k,v in pairs(playerInformationsUniqueID) do
        --        RageUI.Button(v.label, nil, {}, true, {

        --        })
        --    end
       -- end)

       RageUI.IsVisible(entrepriseInformations, function()
        RageUI.Separator(('Informations des véhicules de ~p~%s~s~'):format(playerInformationsUniqueIDInfo))
    
        RageUI.Button('Attribuer un véhicule', nil, {}, true, {
        }, Attribueveiculeentreprise)
    
        RageUI.Line(UTILS.ServerColor.r, UTILS.ServerColor.g, UTILS.ServerColor.b, UTILS.ServerColor.o)
    
        for k, v in pairs(playerInformationsUniqueID) do
            RageUI.Button(v.label, nil, {}, true, {
                onSelected = function()
                    -- Afficher la demande de confirmation
                    exports['sPrompt']:displayRequestttt(
                        'Confirmer la suppression du véhicule',
                        'Voulez-vous confirmer la suppression du véhicule',
                        function() -- Oui
                            -- Suppression du véhicule
                            TriggerServerEvent('kayscore:garages:delVeh', v.plate)
    
                            -- Actualisation des informations après un délai
                            SetTimeout(2000, function()
                                ESX.TriggerServerCallback('kayscore:garage:getInfoEntreprise', function(cb)
                                    playerInformationsUniqueID = cb
                                    playerInformationsUniqueIDInfo = data
                                end, playerInformationsUniqueIDInfo)
                            end)
                        end,
                        function() -- Non
                            ESX.ShowNotification("Vous avez annulé la suppression du véhicule")
                        end
                    )
                end
            })
        end
    end)

        RageUI.IsVisible(Attribueveiculeentreprise, function()
            RageUI.Button('Nom du spawn', nil, {RightLabel = nameSpawn or '~r~Indéfini'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nom du spawn', function(data)
                        if data == nil or data == '' then return end
                        nameSpawn = data
                    end)
                end
            })
            RageUI.Button('Label', nil, {RightLabel = labelSpawn or '~r~Indéfini'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Label', function(data)
                        if data == nil or data == '' then return end
                        labelSpawn = data
                    end)
                end
            })
            RageUI.Button('Type (car, boat, aircraft)', nil, {RightLabel = typeSpawn or '~r~Indéfini'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Type', function(data)
                        if data == nil or data == '' then return end
                        typeSpawn = data
                    end)
                end
            })
            RageUI.Button('Confirmer', nil, {}, true, {
                onSelected = function()
                    if nameSpawn == nil and labelSpawn == nil and typeSpawn == nil then return ESX.ShowNotification('❌ Toutes les informations ne sont pas correctement complétés') end

                    local plate = GeneratePlate()
                    ESX.Game.SpawnVehicle(nameSpawn, vector3(748.97686767578, -4407.44140625, -0.65416955947876), GetEntityHeading(PlayerPedId()), function (vehicle) 
                    print(GetEntityModel(vehicle))
                    SetEntityVisible(vehicle, false)
                    print (json.encode(lib.getVehicleProperties(vehicle)))
                    local vehicleProps = lib.getVehicleProperties(vehicle)
                    vehicleProps.plate = plate
                    SetVehicleNumberPlateText(vehicle, plate)
                    TriggerServerEvent('kayscore:garages:attribuevehiculetosociety', plate, labelSpawn, typeSpawn, vehicleProps, playerInformationsUniqueIDInfo)
                    Wait(10)
                    DeleteEntity(vehicle)
                    end)
                end
            })
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(create) and not RageUI.Visible(edit) and not RageUI.Visible(edit_select) and not RageUI.Visible(playerInformations) and not RageUI.Visible(entrepriseInformations) and not RageUI.Visible(Attribueveiculeentreprise) and not RageUI.Visible(editSpawnPos) and not RageUI.Visible(main) then main = RMenu:DeleteType('main') end
    end
end

---Garages:create
---@public
---@param name string
---@param label string
---@param defaultpos table
---@param deletepos table
---@param spawnpos table
---@param headingspawnpos table
---@param activeblip boolean
function Garages:create(name, label, type, defaultpos, deletepos, spawnpos, headingspawnpos, activeblip)
    if name == nil and label == nil and defaultpos == nil and spawnpos == nil and headingspawnpos == nil then goto continue end

    if activeblip == nil then activeblip = false end
    if type == 1 then type = 'car' end
    if type == 2 then type = 'boat' end
    if type == 3 then type = 'aircraft' end

    TriggerServerEvent('kayscore:garage:create', name, label, type, defaultpos, deletepos, spawnpos, headingspawnpos, activeblip)

    Garages:addBlip(type, defaultpos)

    Garages.CreateName = nil Garages.CreateLabel = nil Garages.Create.Index = 1 Garages.defaultpos = nil Garages.deletepos = nil Garages.spawnpos = nil Garages.headingspawnpos = nil Garages.activeblip = false

    ::continue::
end

---Garages:edit
---@public
---@param name string
---@param label string
---@param defaultpos table
---@param deletepos table
---@param spawnpos table
---@param headingspawnpos table
---@param activeblip boolean
function Garages:edit(name, label, defaultpos, deletepos, spawnpos, headingspawnpos, activeblip)

end

---Garages:addBlip
---@public
---@param type string
---@param pos table
function Garages:addBlip(type, pos)
    local GarageBlip = AddBlipForCoord(pos.x, pos.y, pos.z)
    SetBlipSprite(GarageBlip, type == 'car' and 357 or type == 'boat' and 427 or type == 'aircraft' and 557)
    SetBlipDisplay(GarageBlip, 4)
    SetBlipScale(GarageBlip, type == 'boat' and 0.5 or 0.5)
    SetBlipColour(GarageBlip, 42)
    SetBlipAsShortRange(GarageBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(type == 'car' and '[TERRESTRE] Parking Public' or type == 'boat' and '[NAUTIQUE] Parking Public' or type == 'aircraft' and '[AÉRIEN] Parking Public')
    EndTextCommandSetBlipName(GarageBlip)
end

zones = {
        ['AIRP'] = 'Los Santos International Airport',
        ['ALAMO'] = 'Alamo Sea',
        ['ALTA'] = 'Alta street',
        ['ARMYB'] = 'Fort Zancudo',
        ['BANHAMC'] = 'Banham Canyon Dr',
        ['BANNING'] = 'Banning avenue',
        ['BEACH'] = 'Vespucci Beach',
        ['BHAMCA'] = 'Banham Canyon',
        ['BRADP'] = 'Braddock Pass',
        ['BRADT'] = 'Braddock Tunnel',
        ['BURTON'] = 'Burton avenue',
        ['CALAFB'] = 'Calafia Bridge',
        ['CANNY'] = 'Raton Canyon',
        ['CCREAK'] = 'Cassidy Creek',
        ['CHAMH'] = 'Chamberlain Hills',
        ['CHIL'] = 'Vinewood Hills',
        ['CHU'] = 'Chumash avenue',
        ['CMSW'] = 'Chiliad Mountain State Wilderness',
        ['CYPRE'] = 'Cypress Flats',
        ['DAVIS'] = 'Davis',
        ['DELBE'] = 'Del Perro Beach',
        ['DELPE'] = 'Del Perro',
        ['DELSOL'] = 'La Puerta',
        ['DESRT'] = 'Grand Senora Desert',
        ['DOWNT'] = 'Downtown avenue',
        ['DTVINE'] = 'Downtown Vinewood',
        ['EAST_V'] = 'East Vinewood',
        ['EBURO'] = 'El Burro Heights',
        ['ELGORL'] = 'El Gordo Lighthouse',
        ['ELYSIAN'] = 'Elysian Island',
        ['GALFISH'] = 'Galilee',
        ['GOLF'] = 'GWC and Golfing Society',
        ['GRAPES'] = 'Grapeseed',
        ['GREATC'] = 'Great Chaparral',
        ['HARMO'] = 'Harmony avenue',
        ['HAWICK'] = 'Hawick avenue',
        ['HORS'] = 'Vinewood Racetrack',
        ['HUMLAB'] = 'Humane Labs and Research',
        ['JAIL'] = 'Bolingbroke Penitentiary',
        ['KOREAT'] = 'Little Seoul',
        ['LACT'] = 'Land Act Reservoir',
        ['LAGO'] = 'Lago Zancudo',
        ['LDAM'] = 'Land Act Dam',
        ['LEGSQU'] = 'Legion Square',
        ['LMESA'] = 'La Mesa',
        ['LOSPUER'] = 'La Puerta',
        ['MIRR'] = 'Mirror Park',
        ['MORN'] = 'Morningwood',
        ['MOVIE'] = 'Richards Majestic',
        ['MTCHIL'] = 'Mount Chiliad',
        ['MTGORDO'] = 'Mount Gordo',
        ['MTJOSE'] = 'Mount Josiah',
        ['MURRI'] = 'Murrieta Heights',
        ['NCHU'] = 'North Chumash',
        ['NOOSE'] = 'N.O.O.S.E',
        ['OCEANA'] = 'Pacific Ocean',
        ['PALCOV'] = 'Paleto Cove',
        ['PALETO'] = 'Paleto Bay',
        ['PALFOR'] = 'Paleto Forest',
        ['PALHIGH'] = 'Palomino Highlands',
        ['PALMPOW'] = 'Palmer-Taylor Power Station',
        ['PBLUFF'] = 'Pacific Bluffs',
        ['PBOX'] = 'Pillbox Hill',
        ['PROCOB'] = 'Procopio Beach',
        ['RANCHO'] = 'Rancho',
        ['RGLEN'] = 'Richman Glen',
        ['RICHM'] = 'Richman',
        ['ROCKF'] = 'Rockford Hills',
        ['RTRAK'] = 'Redwood Lights Track',
        ['SANAND'] = 'San Andreas',
        ['SANCHIA'] = 'San Chianski Mountain Range',
        ['SANDY'] = 'Sandy Shores',
        ['SKID'] = 'Mission Row',
        ['SLAB'] = 'Stab City',
        ['STAD'] = 'Maze Bank Arena',
        ['STRAW'] = 'Strawberry',
        ['TATAMO'] = 'Tataviam Mountains',
        ['TERMINA'] = 'Terminal',
        ['TEXTI'] = 'Textile City',
        ['TONGVAH'] = 'Tongva Hills',
        ['TONGVAV'] = 'Tongva Valley',
        ['VCANA'] = 'Vespucci Canals',
        ['VESP'] = 'Vespucci avenue',
        ['VINE'] = 'Vinewood avenue',
        ['WINDF'] = 'Ron Alternates Wind Farm',
        ['WVINE'] = 'West Vinewood',
        ['ZANCUDO'] = 'Zancudo River',
        ['ZP_ORT'] = 'Port of South Los Santos',
        ['ZQ_UAR'] = 'Davis Quartz'
}

---Garages:openMenu
---@param id number
---@param type string
function Garages:openMenu(id, type)
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    local my_vehicle = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local my_vehicle_select = RageUI.CreateSubMenu(my_vehicle, '', 'Actions Disponibles')
    local my_vehicle_select_garage = 1

    local my_vehicle_group = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local vehiclePoundListPosition = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local my_vehicle_group_select = RageUI.CreateSubMenu(my_vehicle_group, '', 'Actions Disponibles')

    local my_vehicle_entreprise = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local my_vehicle_entreprise_select = RageUI.CreateSubMenu(my_vehicle_entreprise, '', 'Actions Disponibles')

    my_vehicle.Closed = function()
        Garages.garage_data.place.Index = 1
        Garages.my_garage.VehiclesList = {}
    end

    RageUI.Visible(main, not RageUI.Visible(main))
        FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Separator(('%s (%s%s~s~)'):format(zones[GetNameOfZone(Player.coords.x, Player.coords.y, Player.coords.z)], UTILS.COLORCODE, type == 'car' and 'Garage Terrestre' or type == 'boat' and 'Garage Nautique' or type == 'aircraft' and 'Garage Aérien'))
            RageUI.Button('Mes Véhicules', nil, {RightLabel = '→'}, waitvehperso, {
                onSelected = function()
                    waitvehperso = false
                    Citizen.SetTimeout(2500, function()
                        waitvehperso = true
                    end)
                    --ESX.ShowNotification("Chargement de vos véhicules...")
                    ESX.TriggerServerCallback('kayscore:garage:myvehicle', function(cb)
                        Garages.my_garage.VehiclesList = cb
                    end)
                end
            }, my_vehicle)
            RageUI.Button('Véhicules de Société', nil, {RightLabel = '→'}, Player.job.name ~= "unemployed" and waitvehperso, {
                onSelected = function()
                    waitvehperso = false
                    Citizen.SetTimeout(2500, function()
                        waitvehperso = true
                    end)
                    --ESX.ShowNotification("Chargement des véhicules de société...")
                    ESX.TriggerServerCallback('kayscore:garage:myvehicle_entreprise', function(cb)
                        Garages.my_garage.VehiclesEntrepriseList = cb
                    end)
                end
            }, my_vehicle_entreprise)
            RageUI.Button('Véhicules de mon Groupe Illégal', nil, {RightLabel = '→'}, Player.job2.name ~= "unemployed2" and waitvehperso, {
                onSelected = function()
                    --ESX.ShowNotification("Chargement des véhicules du groupe...")
                    waitvehperso = false
                    Citizen.SetTimeout(2500, function()
                        waitvehperso = true
                    end)
                    ESX.TriggerServerCallback('kayscore:garage:myvehicle_group', function(cb)
                        Garages.my_garage.VehiclesGroupList = cb
                    end)
                end
            }, my_vehicle_group)
            -- RageUI.Button("Localisé un véhicule", nil, {RightLabel = "~y~VIP~s~"}, VIP.haveVip(), {
            --     onSelected = function()
            --         ESX.TriggerServerCallback("ZgegFramework:vehicles:getVehicleSort", function(data)
            --             garages.vehiclesPositions = data
            --             RageUI.Visible(vehiclePoundListPosition, true)
            --         end)
            --     end
            -- })
        end)

        RageUI.IsVisible(vehiclePoundListPosition, function()
            for k,v in pairs(garages.vehiclesPositions) do 
                RageUI.Button(v.name, nil, {RightLabel = math.floor(#(v.position-Player.coords)).."km"}, true, {
                    onSelected = function()
                        SetNewWaypoint(v.position.x, v.position.y)
                    end
                })
            end
        end)

        RageUI.IsVisible(my_vehicle, function()
            RageUI.List('Emplacement :', Garages.garage_data.place.Data, Garages.garage_data.place.Index, nil, {}, true, {
                onListChange = function(Index)
                    Garages.garage_data.place.Index = Index
                end
            })
            for k,v in pairs(Garages.my_garage.VehiclesList) do

                if tonumber(v.propertiesID) ~= 0 then goto continue end
                
                if Garages.garage_data.place.Index == 1 then
                    if v.type ~= type then
                        goto continue
                    end

                    if v.garageid ~= id then
                        goto continue
                    end

                    if v.state == false or v.state == 0 then
                        goto continue
                    end
                end

                if Garages.garage_data.place.Index == 2 then
                    if v.type ~= type then
                        goto continue
                    end

                    if v.garageid == id then
                        goto continue
                    end

                    if v.state == false or v.state == 0 then
                        goto continue
                    end
                end

                if Garages.garage_data.place.Index == 3 then
                    if v.type ~= type then
                        goto continue
                    end

                    if v.state == true or v.state == 1 then
                        goto continue
                    end
                end
                vehicle = json.decode(v.vehicle)
                local rightBadge = v.boutique == true and RageUI.BadgeStyle.Star or v.boutique == 1 and RageUI.BadgeStyle.Star or nil 
                RageUI.Button(('%s'):format(v.label), Garages.garage_data.garages[v.garageid].label or 'Erreur', {RightBadge = rightBadge, RightLabel = v.neons == 1 and '~g~Néons~s~' or ''}, true, {
                    onActive = function()
                        RageUI.Info('~p~Informations de votre véhicule',
                        {
                            'Plaque d\'immatriculation :',
                            'Garage :',
                            'Nom : ',
                            'Modele :'
                        },
                        {
                            v.plate,
                            v.state == 1 or v.state == true and Garages.garage_data.garages[v.garageid].label or 'Fourrière',
                            v.label or "Aucun",
                            tonumber(vehicle.model) and vehicle.model or GetLabelText(GetDisplayNameFromVehicleModel(vehicle.model))
                        })
                    end,
                    onSelected = function()
                        my_vehicle_select_garage = Garages.garage_data.place.Index
                        vehicles = json.decode(v.vehicle)
                        vehiiiiiiicle = v
                        garagepos = Garages.garage_data.garages[v.garageid].defaultpos
                        Garages.my_garage.labelVehicle = v.label
                    end
                }, my_vehicle_select)

                ::continue::
            end
        end)

        RageUI.IsVisible(my_vehicle_select, function()
            if my_vehicle_select_garage ~= 1 then goto two end
            RageUI.Button('Sortir le véhicule', nil, {}, true, {
                onSelected = function()
                    if not Garages:DoesPlateExist(vehicles.plate) then return ESX.ShowNotification('Ce véhicule est déjà sur la map ') end

                    Garages:sortVehicle(vehicles.model, vehicles, Garages.garage_data.garages[id].spawnpos[math.random(1, #Garages.garage_data.garages[id].spawnpos)], Garages.garage_data.garages[id].headingspawnpos, vehicles.plate, id)
                end
            })

            ::two::


            if vehiiiiiiicle ~= nil then
                if Garages.garage_data.place.Index == 2 then
                    RageUI.Button('Mettre un point sur le GPS', nil, {}, true, {
                        onSelected = function()
                            print(garagepos.x)
                            SetNewWaypoint(garagepos.x, garagepos.y)
                            
                        end
                    })
                end

                -- if vehicles.neonColor[1] == 255 and vehicles.neonColor[3] == 255 and vehicles.neonColor[2] == 0 then
                    RageUI.Button('Retirer néon rose', nil, {}, true, {
                        onSelected = function()
                            -- Afficher la demande de confirmation
                            exports['sPrompt']:displayRequestttt(
                                'Retirer néon rose',
                                'Voulez-vous confirmer la suppression du néon rose',
                                function() -- Oui
                                    RageUI.CloseAll()
                                    TriggerServerEvent('kayscore:garages:fix:neon', vehicles.plate)
                                end,
                                function() -- Non
                                    ESX.ShowNotification("Vous avez annulé l'action")
                                end
                            )
                        end
                    })
                --end
                    
                RageUI.Line()

                RageUI.Button('Renommer', nil, {RightLabel = Garages.my_garage.labelVehicle}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Nouveau nom', function(data)
                            if data == nil and data == '' then return end
    
                            Garages.my_garage.labelVehicle = data
    
                            TriggerServerEvent('kayscore:garages:renamemy_vehicle', vehicles.plate, data, vehiiiiiiicle.owner)
                            Garages.my_garage.VehiclesList = {}
                            ESX.TriggerServerCallback('kayscore:garage:myvehicle', function(cb)
                                Garages.my_garage.VehiclesList = cb
                            end)
                            RageUI.GoBack()
                        end)
                    end
                })
                RageUI.Button('Attribuer le véhicule à mon entreprise', nil, {}, ESX.GetPlayerData().job.name ~= "unemployed", {
                    onSelected = function()
                        -- Afficher la demande de confirmation
                        exports['sPrompt']:displayRequestttt(
                            'Attribuer le véhicule',
                            'Voulez-vous confirmer l\'attribution du véhicule à votre entreprise',
                            function() -- Oui
                                ESX.TriggerServerCallback('kayscore:garages:checkIfIsBoutique', function(cb)
                                    if cb == true then
                                        ESX.ShowNotification('Vous ne pouvez pas attribuer un véhicule boutique')
                                        return
                                    end
                
                                    -- Nettoyer la liste des véhicules du garage et aller en arrière
                                    Garages.my_garage.VehiclesList = {}
                                    RageUI.GoBack()
                
                                    -- Attribuer le véhicule à l'entreprise
                                    TriggerServerEvent('kayscore:garages:my_vehicles:setmyentreprise', vehicles.plate, ESX.GetPlayerData().job.name)
                
                                    -- Mettre à jour la liste des véhicules de l'entreprise
                                    ESX.TriggerServerCallback('kayscore:garage:myvehicle', function(cb)
                                        Garages.my_garage.VehiclesEntrepriseList = cb
                                    end)
                                end, vehicles.plate)
                            end,
                            function() -- Non
                                ESX.ShowNotification("Vous avez annulé l'action")
                            end
                        )
                    end
                })
                


    
                RageUI.Button('Attribuer le véhicule à mon gang/orga', 'Cette action est irréversible', {}, ESX.GetPlayerData().job2.name ~= "unemployed2", {
                    onSelected = function()
                        -- Afficher la demande de confirmation
                        exports['sPrompt']:displayRequestttt(
                            'Attribuer le véhicule',
                            'Voulez-vous confirmer l\'attribution du véhicule à votre gang/organisation',
                            function() -- Oui
                                ESX.TriggerServerCallback('kayscore:garages:checkIfIsBoutique', function(cb)
                                    if cb == true then
                                        ESX.ShowNotification('Vous ne pouvez pas attribuer un véhicule boutique')
                                        return
                                    end
                
                                    -- Nettoyer la liste des véhicules du garage et aller en arrière
                                    Garages.my_garage.VehiclesList = {}
                                    RageUI.GoBack()
                
                                    -- Attribuer le véhicule au gang/organisation
                                    TriggerServerEvent('kayscore:garages:my_vehicles:setmygroup', vehicles.plate, ESX.GetPlayerData().job2.name)
                
                                    -- Mettre à jour la liste des véhicules
                                    ESX.TriggerServerCallback('kayscore:garage:myvehicle', function(cb)
                                        Garages.my_garage.VehiclesList = cb
                                    end, vehicles.plate)
                                end)
                            end,
                            function() -- Non
                                ESX.ShowNotification("Vous avez annulé l'action")
                            end
                        )
                    end
                })
                

            end
        end)

        RageUI.IsVisible(my_vehicle_group, function()
            RageUI.List('Emplacement :', Garages.garage_data.place.Data, Garages.garage_data.place.Index, nil, {}, true, {
                onListChange = function(Index)
                    Garages.garage_data.place.Index = Index
                end
            })
            for k,v in pairs(Garages.my_garage.VehiclesGroupList) do

                if tonumber(v.propertiesID) ~= 0 then goto continue end

                if Garages.garage_data.place.Index == 1 then
                    if v.type ~= type then
                        goto continue
                    end

                    if v.garageid ~= id then
                        goto continue
                    end

                    if v.state == false or v.state == 0 then
                        goto continue
                    end
                end

                if Garages.garage_data.place.Index == 2 then
                    if v.type ~= type then
                        goto continue
                    end

                    if v.garageid == id then
                        goto continue
                    end

                    if v.state == false or v.state == 0 then
                        goto continue
                    end
                end

                if Garages.garage_data.place.Index == 3 then
                    if v.type ~= type then
                        goto continue
                    end

                    if v.state == true or v.state == 1 then
                        goto continue
                    end
                end
                vehicle = json.decode(v.vehicle)
                local rightBadge = v.boutique == true and RageUI.BadgeStyle.Star or v.boutique == 1 and RageUI.BadgeStyle.Star or nil 
                RageUI.Button(('%s'):format(v.label), Garages.garage_data.garages[v.garageid].label or 'Erreur', {RightBadge = rightBadge, RightLabel = v.neons == 1 and '~g~Néons~s~' or ''}, true, {
                    onActive = function()
                        RageUI.Info('Informations de votre véhicule',
                        {
                            'Plaque d\'immatriculation :',
                            'Garage :',
                            'Nom : ',
                            'Modele :'
                        },
                        {
                            v.plate,
                            v.state == 1 or v.state == true and Garages.garage_data.garages[v.garageid].label or 'Fourrière',
                            v.label or "Aucun",
                            tonumber(vehicle.model) and vehicle.model or GetLabelText(GetDisplayNameFromVehicleModel(vehicle.model))
                        })
                    end,
                    onSelected = function()
                        my_vehicle_select_garage = Garages.garage_data.place.Index
                        vehicles = json.decode(v.vehicle)
                        vehiiiiiiicle = v
                        Garages.my_garage.labelVehicle = v.label
                    end
                }, my_vehicle_group_select)

                ::continue::
            end
        end)

        RageUI.IsVisible(my_vehicle_group_select, function()
            if my_vehicle_select_garage ~= 1 then goto two end
            RageUI.Button('Sortir le véhicule', nil, {}, true, {
                onSelected = function()
                    if not Garages:DoesPlateExist(vehicles.plate) then return ESX.ShowNotification('Ce véhicule est déjà sur la map ') end
                    Garages:sortVehicle(vehicles.model, vehicles, Garages.garage_data.garages[id].spawnpos[math.random(1, #Garages.garage_data.garages[id].spawnpos)], Garages.garage_data.garages[id].headingspawnpos, vehicles.plate, id)
                end
            })

            ::two::
            if Garages.garage_data.place.Index == 2 then
                RageUI.Button('Mettre un point sur le GPS', nil, {}, true, {
                    onSelected = function()
                        print(garagepos.x)
                        SetNewWaypoint(garagepos.x, garagepos.y)
                        
                    end
                })
                RageUI.Line()
            end
            RageUI.Button('Renommer', nil, {RightLabel = Garages.my_garage.labelVehicle}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nouveau nom', function(data)
                        if data == nil and data == '' then return end

                        Garages.my_garage.labelVehicle = data

                        TriggerServerEvent('kayscore:garages:renamemy_vehicle', vehicles.plate, data, vehiiiiiiicle.owner)
                        Garages.my_garage.VehiclesGroupList = {}
                        ESX.TriggerServerCallback('kayscore:garage:myvehicle_group', function(cb)
                            Garages.my_garage.VehiclesGroupList = cb
                        end)
                        RageUI.GoBack()
                    end)
                end
            })
        end)

        RageUI.IsVisible(my_vehicle_entreprise, function()
            RageUI.List('Emplacement :', Garages.garage_data.place.Data, Garages.garage_data.place.Index, nil, {}, true, {
                onListChange = function(Index)
                    Garages.garage_data.place.Index = Index
                end
            })
            for k,v in pairs(Garages.my_garage.VehiclesEntrepriseList) do

                if tonumber(v.propertiesID) ~= 0 then goto continue end

                if Garages.garage_data.place.Index == 1 then
                    if v.type ~= type then
                        goto continue
                    end

                    if v.garageid ~= id then
                        goto continue
                    end

                    if v.state == false or v.state == 0 then
                        goto continue
                    end
                end

                if Garages.garage_data.place.Index == 2 then
                    if v.type ~= type then
                        goto continue
                    end

                    if v.garageid == id then
                        goto continue
                    end

                    if v.state == false or v.state == 0 then
                        goto continue
                    end
                end

                if Garages.garage_data.place.Index == 3 then
                    if v.type ~= type then
                        goto continue
                    end

                    if v.state == true or v.state == 1 then
                        goto continue
                    end
                end
                vehicle = json.decode(v.vehicle)
                local rightBadge = v.boutique == true and RageUI.BadgeStyle.Star or v.boutique == 1 and RageUI.BadgeStyle.Star or nil 
                RageUI.Button(('%s'):format(v.label), Garages.garage_data.garages[v.garageid].label or 'Erreur', {RightBadge = rightBadge, RightLabel = v.neons == 1 and '~g~Néons~s~' or ''}, true, {
                    onActive = function()
                        RageUI.Info('Informations de votre véhicule',
                        {
                            'Plaque d\'immatriculation :',
                            'Garage :',
                            'Nom : ',
                            'Modele :'
                        },
                        {
                            v.plate,
                            v.state == 1 or v.state == true and Garages.garage_data.garages[v.garageid].label or 'Fourrière',
                            v.label or "Aucun",
                            tonumber(vehicle.model) and vehicle.model or GetLabelText(GetDisplayNameFromVehicleModel(vehicle.model))
                        })
                    end,
                    onSelected = function()
                        my_vehicle_select_garage = Garages.garage_data.place.Index
                        vehicles = json.decode(v.vehicle)
                        vehiiiiiiicle = v
                        Garages.my_garage.labelVehicle = v.label
                    end
                }, my_vehicle_entreprise_select)

                ::continue::
            end
        end)

        RageUI.IsVisible(my_vehicle_entreprise_select, function()
            if my_vehicle_select_garage ~= 1 then goto two end
            RageUI.Button('Sortir le véhicule', nil, {}, true, {
                onSelected = function()
                    if not Garages:DoesPlateExist(vehicles.plate) then return ESX.ShowNotification('Ce véhicule est déjà sur la map ') end
                    Garages:sortVehicle(vehicles.model, vehicles, Garages.garage_data.garages[id].spawnpos[math.random(1, #Garages.garage_data.garages[id].spawnpos)], Garages.garage_data.garages[id].headingspawnpos, vehicles.plate, id)
                end
            })

            
            ::two::
            if Garages.garage_data.place.Index == 2 then
                RageUI.Button('Mettre un point sur le GPS', nil, {}, true, {
                    onSelected = function()
                        print(garagepos.x)
                        SetNewWaypoint(garagepos.x, garagepos.y)
                        
                    end
                })
                RageUI.Line()
            end
            RageUI.Button('Renommer', nil, {RightLabel = Garages.my_garage.labelVehicle}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nouveau nom', function(data)
                        if data == nil and data == '' then return end

                        Garages.my_garage.labelVehicle = data

                        TriggerServerEvent('kayscore:garages:renamemy_vehicle', vehicles.plate, data, vehiiiiiiicle.owner)
                        Garages.my_garage.VehiclesEntrepriseList = {}
                        ESX.TriggerServerCallback('kayscore:garage:myvehicle_entreprise', function(cb)
                            Garages.my_garage.VehiclesEntrepriseList = cb
                        end)
                        RageUI.GoBack()
                    end)
                end
            })
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(my_vehicle_group) and not RageUI.Visible(my_vehicle_group_select) and not RageUI.Visible(my_vehicle_entreprise) and not RageUI.Visible(my_vehicle_entreprise_select) and
            not RageUI.Visible(my_vehicle) and
            not RageUI.Visible(my_vehicle_select) and
            not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
            Garages.my_garage.VehiclesList = {}
        end
    end
end

function Garages:openPoundMenu(type, spawnPoint, pound, id)
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    local my_vehicle = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local my_vehicle_group = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local my_vehicle_entreprise = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Separator(type == 'car' and 'Fourrière automobile' or type == 'boat' and 'Fourrière à bateaux' or type == 'aircraft' and 'Fourrière à avions')
            RageUI.Line(UTILS.ServerColor.r, UTILS.ServerColor.g, UTILS.ServerColor.b, UTILS.ServerColor.o)
            RageUI.Button('Mes Véhicules', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('kayscore:garage:myvehicle', function(cb)
                        Garages.my_garage.VehiclesList = cb
                    end)
                end
            }, my_vehicle)
            RageUI.Button('Véhicules de société', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('kayscore:garage:myvehicle_entreprise', function(cb)
                        Garages.my_garage.VehiclesEntrepriseList = cb
                    end)
                end
            }, my_vehicle_entreprise)
            RageUI.Button('Véhicules de mon groupe', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('kayscore:garage:myvehicle_group', function(cb)
                        Garages.my_garage.VehiclesGroupList = cb
                    end)
                end
            }, my_vehicle_group)
        end)

        RageUI.IsVisible(my_vehicle, function()
            for k, v in pairs(Garages.my_garage.VehiclesList) do
                if v.state == 0 or v.state == false then
                    if v.type == pound then
                        veh = json.decode(v.vehicle)
                        local rightBadge = v.boutique == true and RageUI.BadgeStyle.Star or v.boutique == 1 and RageUI.BadgeStyle.Star or nil
                        local priceLabel = VIP.haveVip() and "~b~Gratuite" or "500$"

                        RageUI.Button(v.label, nil, {RightBadge = rightBadge, RightLabel = priceLabel}, true, {
                            onSelected = function()
                                veh2 = json.decode(v.vehicle)

                                exports['sPrompt']:displayRequest(
                                    'Confirmer le véhicule',
                                    'Voulez-vous valider l\'apparition du véhicule',
                                    function() 
                                        if not Garages:DoesPlateExist(veh.plate) then 
                                            ESX.ShowNotification('Ce véhicule est déjà sur la map')
                                            return
                                        end

                                        Garages:sortVehicle(veh2.model, json.decode(v.vehicle), spawnPoint.pos[math.random(1, #spawnPoint.pos)], spawnPoint.heading, veh2.plate, 1, 'pound', k, id)

                                        RageUI.CloseAll()
                                    end,
                                    function() 
                                        ESX.ShowNotification("Vous avez annulé l'action")
                                    end
                                )
                            end
                        })
                    end
                end

                ::continue::
            end
        end)
        
        RageUI.IsVisible(my_vehicle_group, function()
            for k, v in pairs(Garages.my_garage.VehiclesGroupList) do
                if v.state == 0 or v.state == false and v.type == type then
                    veh = json.decode(v.vehicle)
                    local rightBadge = v.boutique == true and RageUI.BadgeStyle.Star or v.boutique == 1 and RageUI.BadgeStyle.Star or nil
                    local priceLabel = VIP.haveVip() and "~b~Gratuite" or "500$"

                    RageUI.Button(v.label, nil, {RightBadge = rightBadge, RightLabel = priceLabel}, true, {
                        onSelected = function()
                            veh2 = json.decode(v.vehicle)

                            exports['sPrompt']:displayRequest(
                                'Confirmer le véhicule',
                                'Voulez-vous valider l\'apparition du véhicule',
                                function()
                                    if not Garages:DoesPlateExist(veh.plate) then
                                        ESX.ShowNotification('Ce véhicule est déjà sur la map')
                                        return
                                    end

                                    Garages:sortVehicle(veh2.model, json.decode(v.vehicle), spawnPoint.pos[math.random(1, #spawnPoint.pos)], spawnPoint.heading, veh2.plate, 1, 'pound', k, id)

                                    RageUI.CloseAll()
                                end,
                                function() 
                                    ESX.ShowNotification("Vous avez annulé l'action")
                                end
                            )
                        end
                    })
                end
            end
        end)
        
        RageUI.IsVisible(my_vehicle_entreprise, function()
            for k, v in pairs(Garages.my_garage.VehiclesEntrepriseList) do
                if (v.state == 0 or v.state == false) and v.type == type then
                    veh = json.decode(v.vehicle)
                    local rightBadge = v.boutique == true and RageUI.BadgeStyle.Star or v.boutique == 1 and RageUI.BadgeStyle.Star or nil
                    local priceLabel = VIP.haveVip() and "~b~Gratuite" or "500$"

                    RageUI.Button(v.label, nil, {RightBadge = rightBadge, RightLabel = priceLabel}, true, {
                        onSelected = function()
                            veh2 = json.decode(v.vehicle)

                            exports['sPrompt']:displayRequest(
                                'Confirmer le véhicule',
                                'Voulez-vous valider l\'apparition du véhicule',
                                function()
                                    if not Garages:DoesPlateExist(veh.plate) then
                                        ESX.ShowNotification('Ce véhicule est déjà sur la map')
                                        return
                                    end

                                    Garages:sortVehicle(veh2.model, json.decode(v.vehicle), spawnPoint.pos[math.random(1, #spawnPoint.pos)], spawnPoint.heading, veh2.plate, 1, 'pound', k, id)

                                    RageUI.CloseAll()
                                end,
                                function() 
                                    ESX.ShowNotification("Vous avez annulé l'action")
                                end
                            )
                        end
                    })
                end
            end
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(my_vehicle_group) and not RageUI.Visible(vehiclePoundListPosition) and not RageUI.Visible(my_vehicle_entreprise) and
            not RageUI.Visible(my_vehicle) and
            not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end


function Garages:setSateVehicle(plate, value, type, id, properties)
    TriggerServerEvent('kayscore:garage:state', plate, value, type, id, properties)
end

function Garages:sortVehicle(vehicles, veh, defaultpos, defautheading, plate, garageid, type, k, p)
    local coords = defaultpos
    local head = defautheading

    if type == 'pound' then
        coords = defaultpos.spawnPoint
        head = defaultpos.heading

        local attemps = 0
        local notifs = false

        local function r()
            Wait(10)
            attemps = attemps + 1

            if not ESX.Game.IsSpawnPointClear(coords, 2) then coords = Garages.garage_data.data.Pounds['car'][p].pos[math.random(1, #Garages.garage_data.data.Pounds['car'][p].pos)].spawnPoint end
            
            if attemps > 10 then
                if not notifs then
                    notifs = true
                    ESX.ShowNotification('~r~Vous devez attendre qu\'une place se libère pour que votre véhicule sorte~s~')
                end
            end

            return ESX.Game.IsSpawnPointClear(coords, 2) == true or r();
        end

        r()
    end

    if type ~= 'pound' then

        local attemp = 0
        local notif = false

        local function recurse()
            Wait(10)
            attemp = attemp + 1
            local last_result = nil;
            if not ESX.Game.IsSpawnPointClear(defaultpos, 2) then coords = Garages.garage_data.garages[garageid].spawnpos[math.random(1, #Garages.garage_data.garages[garageid].spawnpos)]  defaultpos = Garages.garage_data.garages[garageid].spawnpos[math.random(1, #Garages.garage_data.garages[garageid].spawnpos)]  last_result = Garages.garage_data.garages[garageid].spawnpos[math.random(1, #Garages.garage_data.garages[garageid].spawnpos)] end

            if attemp > 10 then
                if not notif then
                    notif = true
                    ESX.ShowNotification('~r~Vous devez attendre qu\'une place se libère pour que votre véhicule sorte~s~')
                end
            end

            return ESX.Game.IsSpawnPointClear(defaultpos, 2) == true or recurse();
        end

        recurse()
    end

    if type ~= 'pound' then
        TriggerServerEvent('kayscore:garages:sortVehicle', vehicles, veh, defaultpos, defaultpos.h or 90.0, plate, garageid, type)
    else
        TriggerServerEvent('kayscore:garages:sortVehicle', vehicles, veh, coords, head, plate, garageid, type)
    end

    Garages:setSateVehicle(plate, false, nil, garageid, veh)
    RageUI.CloseAll()
end

function Garages:rentVehicle(id, type)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

    if vehicle == 0 then goto continue end

    local vehicleProps = lib.getVehicleProperties(vehicle)
    ESX.TriggerServerCallback('kayscore:garage:getType', function(cb)
        if not cb then return ESX.ShowNotification('Ce véhicule ne vous appartient pas') end
        if Garages.garage_data.garages[id].type ~= cb then return ESX.ShowNotification('Ce type de véhicule n\'est pas accepté dans ce type de garage ! ') end

        TriggerServerEvent('kayscore:garages:setVehicleFuel', vehicleProps.plate, GetFuel(vehicle))

        Garages:setSateVehicle(vehicleProps.plate, true, type, id, vehicleProps)
        ESX.Game.DeleteVehicle(vehicle)

        ESX.ShowNotification('✅ Véhicule rangé avec succès')

    end, vehicleProps.plate, vehicleProps)

    ::continue::
end

function Garages:DoesPlateExist(plate)
    local attemp = 0
    local r = nil
    
    ESX.TriggerServerCallback('kayscore:garages:checkPlateInMap', function(cb)
        r = cb
    end, plate) 

    while r == nil do 
        Wait(1) 
        attemp = attemp + 1 
        if attemp > 100 then
            return true
        end
    end

    if r then
        return true
    else
        local vehicles = GetGamePool('CVehicle')
        for i=1,#vehicles do
            local vehicle = vehicles[i]
            if DoesEntityExist(vehicle) then
                if GetVehicleNumberPlateText(vehicle) == plate then
                    return true
                end
            end
        end
        return false
    end
end