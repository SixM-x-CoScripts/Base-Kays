---@class Gangs
Gangs = {}
Gangs.Create = {
    name = nil,
    label = nil,
    positions = {
        chest = nil,
        boss = nil,
        blips = nil,
    },
    blips = false,
    blipscolor = nil,
    listecat = nil,
    listeIndex = 1,
    liste = {"Gangs", "MC", "Orga", "Mafia", "Cartel"},
    listeRelative = {
        ["Gangs"] = 1,
        ["MC"] = 2,
        ["Orga"] = 3,
        ["Mafia"] = 4,
        ["Cartel"] = 5,
    },
    blipsColorsIndex = 1,
    blipsColors = {"Bleu", "Blanc", "Rouge", "Noir", "Gris", "Orange", "Vert", "Violet", "Gris", "Rose", "Jaune"},
    blipsColorRelative = {
        ["Bleu"] = 1,
        ["Blanc"] = 1,
        ["Rouge"] = 1,
        ["Noir"] = 1,
        ["Gris"] = 1,
        ["Orange"] = 1,
        ["Vert"] = 1,
        ["Violet"] = 1,
        ["Gris"] = 1,
        ["Rose"] = 1,
        ["Jaune"] = 1
    }
}
Gangs.Create.canOpenMenu = {
    ['fondateur'] = true,
    ['gerant'] = true,
    ['responsable'] = true
}
Gangs.List = {}

Gangs.SearchGang = nil
Gangs.SelectedGangName = nil

Gangs.Permissions = {
    {
        name = '*',
        title = "Toutes les Permissions",
        enable = false,
    },

    -- category
    {
        name = 'items',
        title = "Catégorie Objet(s)",
        enable = false,
    },
    {
        name = 'weapons',
        title = "Catégorie Armes(s)",
        enable = false,
    },
    {
        name = 'accounts',
        title = "Catégorie Comptes",
        enable = false,
    },
    {
        name = 'recruit_remove_player',
        title = "Recruter/Virer une personne",
        enable = false,
    },
    {
        name = 'change_group_player',
        title = "Changer le grade d'une personne",
        enable = false,
    },
    {
        name = 'create_edit_grades',
        title = "Créer/Editer les grades",
        enable = false,
    },
    {
        name = 'manage_members',
        title = "Gérer les membres",
        enable = false,
    },

    -- action add
    {
        name = 'items_add',
        title = "Ajouter des Objets au Coffre",
        enable = false,
    },
    {
        name = 'weapons_add',
        title = "Ajouter des Armes au Coffre",
        enable = false,
    },
    {
        name = 'accounts_add',
        title = "Ajouter du solde sur les Comptes",
        enable = false,
    },

    -- action remove
    {
        name = 'items_remove',
        title = "Retirer des Objets au Coffre",
        enable = false,
    },
    {
        name = 'weapons_remove',
        title = "Retirer des Armes au Coffre",
        enable = false,
    },
    {
        name = 'accounts_remove',
        title = "Retirer du solde sur les Comptes",
        enable = false,
    },
}

Gangs.CreateGrade = {
    name = nil,
    label = nil,
}

Gangs.MembersList = {}

Gangs.openCreateMenu = function()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')
    local main_create = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local main_edit = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local main_edit_selected = RageUI.CreateSubMenu(main_edit, '', 'Actions Disponibles')
    local main_edit_selected_teleportOptions = RageUI.CreateSubMenu(main_edit_selected, '', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))

    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Button('Créer un Gang', nil, {RightLabel = '→'}, true, {
                onSelected = function()
                    
                end
            }, main_create)
            RageUI.Button('Gerer les Gangs', nil, {RightLabel = '→'}, true, {
                onSelected = function()

                end
            }, main_edit)
        end)

        RageUI.IsVisible(main_create, function()
            RageUI.Button('Nom du gang', nil, {RightLabel = Gangs.Create.name == nil and '~r~Indéfini~s~' or Gangs.Create.name}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nom du gang', function(data)
                        if data == nil or data == '' then return end

                        Gangs.Create.name = data
                    end)
                end
            })
            RageUI.Button('Nom d\'affichage du gang', nil, {RightLabel = Gangs.Create.label == nil and '~r~Indéfini~s~' or Gangs.Create.label}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nom d\'affichage du gang', function(data)
                        if data == nil or data == '' then return end

                        Gangs.Create.label = data
                    end)
                end
            })
            RageUI.Button('Position du coffre', nil, {RightLabel = Gangs.Create.positions.chest == nil and '~r~Indéfini~s~' or '~g~Défini~s~'}, true, {
                onSelected = function()
                    Gangs.Create.positions.chest = GetEntityCoords(Player.playerPed)
                end
            })
            RageUI.Button('Position de la gestion', nil, {RightLabel = Gangs.Create.positions.boss == nil and '~r~Indéfini~s~' or '~g~Défini~s~'}, true, {
                onSelected = function()
                    Gangs.Create.positions.boss = GetEntityCoords(Player.playerPed)
                end
            })
            RageUI.List("Catégorie", Gangs.Create.liste, Gangs.Create.listeIndex, nil, {}, true, {
                onListChange = function(Index)
                    Gangs.Create.listeIndex = Index
                    Gangs.Create.listecat = Gangs.Create.liste[Index]
                end,
                onSelected = function()
                    -- print(Gangs.Create.listeIndex)
                end
            })
            RageUI.Checkbox('Affichage sur la carte', nil, Gangs.Create.blips, {}, {
                onChecked = function()
                    Gangs.Create.blips = true
                end,
                onUnChecked = function()
                    Gangs.Create.blips = false
                end
            })
            if Gangs.Create.blips == true then
                RageUI.Button('Position de l\'affichage', nil, {}, true, {
                    onSelected = function()
                        Gangs.Create.positions.blips = GetEntityCoords(Player.playerPed)
                    end
                })
                RageUI.List("Couleur de l\'affichage sur la carte", Gangs.Create.blipsColors, Gangs.Create.blipsColorsIndex, nil, {}, true, {
                    onListChange = function(Index)
                        Gangs.Create.blipsColorsIndex = Index
                        Gangs.Create.blipscolor = Gangs.Create.blipsColors[Index]
                    end
                })
            end
            if Gangs.Create.name ~= nil and Gangs.Create.label ~= nil and Gangs.Create.positions.chest ~= nil and Gangs.Create.positions.boss ~= nil then
                RageUI.Button('Confirmer la création', nil, {Color = {BackgroundColor = {UTILS.ServerColor.r, UTILS.ServerColor.g, UTILS.ServerColor.b, UTILS.ServerColor.o}}}, true, {
                    onSelected = function()
                        exports['sPrompt']:displayRequestttt(
                            kayscoreConfigServ.ServerName,
                            'Êtes-vous sûr de vouloir confirmer la création de ce gang ?', -- Message de confirmation
                            function() -- oui
                                secured_TriggerServerEvent('kayscore:gangs:create', Gangs.Create)
                
                                -- Réinitialisation des valeurs après la création
                                Gangs.Create = {
                                    name = nil,
                                    label = nil,
                                    positions = {
                                        chest = nil,
                                        boss = nil,
                                        blips = nil,
                                    },
                                    listecat = nil,
                                    listeIndex = 1,
                                    liste = {"Gangs", "MC", "Orga", "Mafia", "Cartel"},
                                    listeRelative = {
                                        ["Gangs"] = 1,
                                        ["MC"] = 2,
                                        ["Orga"] = 3,
                                        ["Mafia"] = 4,
                                        ["Cartel"] = 5,
                                    },
                                    blips = false,
                                    blipscolor = nil,
                                    blipsColorsIndex = 1,
                                    blipsColors = {"Bleu", "Blanc", "Rouge", "Noir", "Gris", "Orange", "Vert", "Violet", "Gris", "Rose", "Jaune"},
                                    blipsColorRelative = {
                                        ["Bleu"] = 1,
                                        ["Blanc"] = 1,
                                        ["Rouge"] = 1,
                                        ["Noir"] = 1,
                                        ["Gris"] = 1,
                                        ["Orange"] = 1,
                                        ["Vert"] = 1,
                                        ["Violet"] = 1,
                                        ["Gris"] = 1,
                                        ["Rose"] = 1,
                                        ["Jaune"] = 1
                                    },
                                    canOpenMenu = {
                                        ['fondateur'] = true,
                                        ['responsable'] = true
                                    }
                                }
                
                                ESX.ShowNotification('✅ Gang créé avec succès') -- Notification de succès
                            end,
                            function() -- non
                                ESX.ShowNotification('Création du gang annulée') -- Notification d'annulation
                            end
                        )
                    end
                })
            end
        end)

        RageUI.IsVisible(main_edit, function()
            RageUI.Button('Rechercher', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Entrée les donnez', function(data)
                        Gangs.SearchGang = data
                    end)
                end
            })
            if Gangs.SearchGang then
                RageUI.Button('Stopper la recherche ❌', nil, {RightLabel = Gangs.SearchGang}, true, {
                    onSelected = function()
                        Gangs.SearchGang = nil
                    end
                })
            end
            RageUI.Line()
            for k,v in pairs(Gangs.List) do
                local gangButtonName = ('%s (~g~%s~s~)'):format(v.label, v.name)

                if not Gangs.SearchGang then
                    RageUI.Button(gangButtonName, nil, {RightLabel = '→'}, true, {
                        onSelected = function()
                            Gangs.SelectedGangName = v.name

                            RageUI.Visible(main_edit_selected, true)
                        end
                    })
                else
                    if string.match(string.upper(gangButtonName), string.upper(Gangs.SearchGang)) then
                        RageUI.Button(gangButtonName, nil, {RightLabel = '→'}, true, {
                            onSelected = function()
                                Gangs.SelectedGangName = v.name

                                RageUI.Visible(main_edit_selected, true)
                            end
                        })
                    end
                end
            end
        end)

        RageUI.IsVisible(main_edit_selected, function()
            local gangData = Gangs.List[Gangs.SelectedGangName] or {}
            RageUI.Separator(('Edition du gang: ~g~%s~s~ (~g~%s~s~)'):format(gangData.label, gangData.name))
            RageUI.Button('Supprimer le Gang', nil, {Color = {BackgroundColor = {255,0,0,150}}}, true, {
                onSelected = function()
                    exports['sPrompt']:displayRequestttt(
                        kayscoreConfigServ.ServerName,
                        'Êtes-vous sûr de vouloir supprimer ce gang ?', -- Message de confirmation
                        function() -- oui
                            secured_TriggerServerEvent('kayscore:gangs:staff:delete', gangData.name)
                            ESX.ShowNotification('✅ Gang supprimé avec succès') -- Notification de succès
                            RageUI.GoBack()
                        end,
                        function() -- non
                            ESX.ShowNotification('Suppression du gang annulée') -- Notification d'annulation
                        end
                    )
                end
            })
            
            RageUI.Line()
            RageUI.Button('Téléportation', nil, {RightLabel = '→'}, true, {
                onSelected = function()
                    
                end
            }, main_edit_selected_teleportOptions)
            RageUI.Line()
            RageUI.Button('Changer le nom d\'affichage du gang', nil, {RightBadge = RageUI.BadgeStyle.Star}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nouveau nom', function(data)
                        if data == nil or data == '' then return end

                        exports['sPrompt']:displayRequestttt(
                            kayscoreConfigServ.ServerName,
                            'Voulez-vous changer le nom du groupe ?', -- Message de validation
                            function() -- oui
                                secured_TriggerServerEvent('kayscore:gangs:staff:edit', "label", gangData.name, data)
                                ESX.ShowNotification(('✅ Nom d\'affichage du gang changé pour "%s"'):format(data)) -- Notification de succès
                                RageUI.GoBack()
                            end,
                            function() -- non
                                ESX.ShowNotification('Changement du nom d\'affichage annulé') -- Notification d'annulation
                            end
                        )
                    end)
                end
            })
            RageUI.Button('Changer la position de la gestion', nil, {RightBadge = RageUI.BadgeStyle.Star}, true, {
                onSelected = function()
                    exports['sPrompt']:displayRequestttt(
                        kayscoreConfigServ.ServerName,
                        'Êtes-vous sûr de vouloir changer la position de gestion du gang ?', -- Message de confirmation
                        function() -- oui
                            gangData.positions.boss = GetEntityCoords(Player.playerPed)
                            secured_TriggerServerEvent('kayscore:gangs:staff:edit', "positions", gangData.name, gangData.positions, true)
                            ESX.ShowNotification('✅ Position de gestion du gang changée avec succès') -- Notification de succès
                        end,
                        function() -- non
                            ESX.ShowNotification('Changement de position de gestion annulé') -- Notification d'annulation
                        end
                    )
                end
            })
            RageUI.Button('Changer la position du coffre', nil, {RightBadge = RageUI.BadgeStyle.Star}, true, {
                onSelected = function()
                    exports['sPrompt']:displayRequestttt(
                        kayscoreConfigServ.ServerName,
                        'Êtes-vous sûr de vouloir changer la position du coffre du gang ?', -- Message de confirmation
                        function() -- oui
                            gangData.positions.chest = GetEntityCoords(Player.playerPed)
                            secured_TriggerServerEvent('kayscore:gangs:staff:edit', "positions", gangData.name, gangData.positions, true)
                            ESX.ShowNotification('✅ Position du coffre du gang changée avec succès') -- Notification de succès
                        end,
                        function() -- non
                            ESX.ShowNotification('Changement de position du coffre annulé') -- Notification d'annulation
                        end
                    )
                end
            })
            
        end)

        RageUI.IsVisible(main_edit_selected_teleportOptions, function()
            local gangData = Gangs.List[Gangs.SelectedGangName] or {}
            RageUI.Button('Se téléporter à la gestion', nil, {}, true, {
                onSelected = function()
                    SetEntityCoords(Player.playerPed, vector3(gangData.positions.boss.x, gangData.positions.boss.y, gangData.positions.boss.z))
                end
            })
            RageUI.Button('Se téléporter au coffre', nil, {}, true, {
                onSelected = function()
                    SetEntityCoords(Player.playerPed, vector3(gangData.positions.chest.x, gangData.positions.chest.y, gangData.positions.chest.z))
                end
            })
            RageUI.Button('Se téléporter au blip', nil, {}, gangData.blips, {
                onSelected = function()
                    SetEntityCoords(Player.playerPed, vector3(gangData.positions.blips.x, gangData.positions.blips.y, gangData.positions.blips.z))
                end
            })
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(main_create) and not RageUI.Visible(main_edit) and not RageUI.Visible(main_edit_selected) and not RageUI.Visible(main_edit_selected_teleportOptions) then
            main = RMenu:DeleteType('main')
        end
    end
end

RegisterCommand('gangbuilder', function()
    if not ESX.GetPlayerData().group then return end
    
    if Gangs.Create.canOpenMenu[ESX.GetPlayerData().group] then
        Gangs.openCreateMenu()
    end
end)

secured_RegisterNetEvent('kayscore:gangs:recieveGangs', function(data)
    Gangs.List = data
end)

---havePermission
---@param permissionName string
---@return boolean
---public
function Gangs:havePermission(permissionName)
    if not Gangs.List[Player.job2.name] then return false end

    if Player.job2.grade_name == "boss" then return true end

    local pemrs = Gangs.List[Player.job2.name].permissions

    if pemrs[permissionName] then
        if pemrs[permissionName][Player.job2.grade_name] then
            return true 
        end
    end

    return false
end

Gangs.Gestion = {
    Roles = {
        Search = nil,
        Selected = nil,
        CantRemove = {
            ['boss'] = true
        }
    }
}

---openGestionMenu
---@param gangName string
---public
function Gangs:openGestionMenu(gangName)
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    local main_editRoles = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local main_editRoles_create = RageUI.CreateSubMenu(main_editRoles, '', 'Actions Disponibles')
    local main_editRoles_selected = RageUI.CreateSubMenu(main_editRoles, '', 'Actions Disponibles')
    local main_editRoles_selected_editPermissions = RageUI.CreateSubMenu(main_editRoles_selected, '', 'Actions Disponibles')

    local main_manageMembers = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local main_manageMembers_actions = RageUI.CreateSubMenu(main_manageMembers, '', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(Player.playerPed, true)
    while main do Wait(1)

        local gangData = Gangs.List[gangName]

        RageUI.IsVisible(main, function()
            RageUI.Separator(('Gang: %s%s~s~ (%s%s~s~)'):format(UTILS.COLORCODE, gangData.label, UTILS.COLORCODE, gangData.name))
            RageUI.Line()
            RageUI.Button('Gérer les Rôles', nil, {RightLabel = '→'}, Gangs:havePermission('create_edit_grades'), {
                onSelected = function()
                    
                end
            }, main_editRoles)
            RageUI.Button('Gérer les membres', nil, {RightLabel = '→'}, Gangs:havePermission('manage_members'), {
                onSelected = function()
                ESX.TriggerServerCallback('kayscore:gangs:gestions:members:fetch', function(cb)
                        if type(cb) == "table" then
                            Gangs.MembersList = cb
                        end
                    end)
                end
            }, main_manageMembers)
            if gangData.circuit == true then
                ---@todo TERRITORIES
            end
            RageUI.Line()
        end)

        RageUI.IsVisible(main_editRoles, function()
            RageUI.Button('Créer un nouveau Rôle', nil, {RightLabel = '→'}, true, {
                onSelected = function()
                    
                end
            }, main_editRoles_create)
            RageUI.Button('Rechercher', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Entrée les données', function(data)
                        Gangs.Gestion.Roles.Search = data
                    end)
                end
            })
            if Gangs.Gestion.Roles.Search then
                RageUI.Button('Stopper la recherche ❌', nil, {RightLabel = Gangs.Gestion.Roles.Search}, true, {
                    onSelected = function()
                        Gangs.Gestion.Roles.Search = nil
                    end
                })
            end
            RageUI.Line()
            for k,v in pairs(gangData.grades) do
                local buttonName = ('%s (%s)'):format(v.label, v.name)
                if not Gangs.Gestion.Roles.Search then
                    if v.name == "boss" then
                        RageUI.Button(buttonName, nil, {Color = {BackgroundColor = {236, 255, 0,150}}, RightLabel = '→'}, true, {
                            onSelected = function()
                                Gangs.Gestion.Roles.Selected = v
    
                                RageUI.Visible(main_editRoles_selected, true)
                            end
                        })
                    else
                        RageUI.Button(buttonName, nil, {RightLabel = '→'}, true, {
                            onSelected = function()
                                Gangs.Gestion.Roles.Selected = v
    
                                RageUI.Visible(main_editRoles_selected, true)
                            end
                        })
                    end
                else
                    if string.match(string.upper(buttonName), string.upper(Gangs.Gestion.Roles.Search)) then
                        if v.name == "boss" then
                            RageUI.Button(buttonName, nil, {Color = {BackgroundColor = {236, 255, 0,150}}, RightLabel = '→'}, true, {
                                onSelected = function()
                                    Gangs.Gestion.Roles.Selected = v
        
                                    RageUI.Visible(main_editRoles_selected, true)
                                end
                            })
                        else
                            RageUI.Button(buttonName, nil, {RightLabel = '→'}, true, {
                                onSelected = function()
                                    Gangs.Gestion.Roles.Selected = v
        
                                    RageUI.Visible(main_editRoles_selected, true)
                                end
                            })
                        end
                    end
                end
            end
        end)

        RageUI.IsVisible(main_editRoles_create, function()
            RageUI.Button('Nom du Rôle', nil, {RightLabel = Gangs.CreateGrade.name == nil and '~r~Indéfini~s~' or Gangs.CreateGrade.name}, true, {
                onSelected = function()
                    KeyboardUtils.use('Entrée les données', function(data)
                        if data == '' or data == nil then return end

                        Gangs.CreateGrade.name = data
                    end)
                end
            })
            RageUI.Button('Nom d\'affichage du Rôle', nil, {RightLabel = Gangs.CreateGrade.label == nil and '~r~Indéfini~s~' or Gangs.CreateGrade.label}, true, {
                onSelected = function()
                    KeyboardUtils.use('Entrée les données', function(data)
                        if data == '' or data == nil then return end

                        Gangs.CreateGrade.label = data
                    end)
                end
            })
            if Gangs.CreateGrade.name ~= nil and Gangs.CreateGrade.label ~= nil then
                RageUI.Button('Confirmer la création', nil, {Color = {BackgroundColor = {UTILS.ServerColor.r, UTILS.ServerColor.g, UTILS.ServerColor.b, UTILS.ServerColor.o}}}, true, {
                    onSelected = function()
                        exports['sPrompt']:displayRequestttt(
                            kayscoreConfigServ.ServerName,
                            'Êtes-vous sûr de vouloir créer ce grade pour le gang ?', -- Message de confirmation
                            function() -- oui
                                secured_TriggerServerEvent('kayscore:gangs:gestion:grades:create', gangData.name, Gangs.CreateGrade)
                                ESX.ShowNotification('✅ Grade créé avec succès') -- Notification de succès
                                Gangs.CreateGrade = {
                                    name = nil,
                                    label = nil,
                                }
                            end,
                            function() -- non
                                ESX.ShowNotification('Création de grade annulée') -- Notification d'annulation
                            end
                        )
                    end
                })
            end
            
        end)

        RageUI.IsVisible(main_editRoles_selected, function()
            RageUI.Separator(('Modification du grade: ~g~%s~s~ (~g~%s~s~)'):format(Gangs.Gestion.Roles.Selected.label, Gangs.Gestion.Roles.Selected.name))
            RageUI.Button('Supprimer le grade', nil, {Color = {BackgroundColor = {255,0,0,150}}}, not Gangs.Gestion.Roles.CantRemove[Gangs.Gestion.Roles.Selected.name], {
                onSelected = function()
                    exports['sPrompt']:displayRequestttt(
                        kayscoreConfigServ.ServerName,
                        'Êtes-vous sûr de vouloir supprimer ce grade ?', -- Message de confirmation
                        function() -- oui
                            secured_TriggerServerEvent('kayscore:gangs:gestion:grades:delete', gangData.name, Gangs.Gestion.Roles.Selected.name)
                            ESX.ShowNotification('✅ Grade supprimé avec succès') -- Notification de succès
                            RageUI.GoBack()
                        end,
                        function() -- non
                            ESX.ShowNotification('Suppression de grade annulée') -- Notification d'annulation
                        end
                    )
                end
            })
            
            RageUI.Line()
            RageUI.Button('Permissions', nil, {RightLabel = '→'}, Gangs.Gestion.Roles.Selected.name ~= "boss", {
                onSelected = function()
                    for k,v in pairs(gangData.permissions) do
                        for i,p in pairs(Gangs.Permissions) do
                            if k == p.name then
                                if gangData.permissions[p.name][Gangs.Gestion.Roles.Selected.name] then
                                    Gangs.Permissions[i].enable = true
                                else
                                    Gangs.Permissions[i].enable = false
                                end
                            end
                        end
                    end

                    RageUI.Visible(main_editRoles_selected_editPermissions, true)
                end
            })
            RageUI.Button('Modifier le Nom D\'affichage', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Entrée les données', function(data)
                        if data == '' or data == nil then return end

                        secured_TriggerServerEvent('kayscore:gangs:gestion:grades:editLabel', gangData.name, Gangs.Gestion.Roles.Selected.name, data)

                        Gangs.Gestion.Roles.Selected.label = data
                    end)
                end
            })
        end)

        RageUI.IsVisible(main_editRoles_selected_editPermissions, function()
            for k,v in ipairs(Gangs.Permissions) do
                RageUI.Checkbox(v.title, nil, v.enable, {}, {
                    onChecked = function()
                        v.enable = true

                        gangData.permissions[v.name][Gangs.Gestion.Roles.Selected.name] = true

                        secured_TriggerServerEvent('kayscore:gangs:gestion:grades:editGradePermissions', gangData.name, gangData.permissions)
                    end,
                    onUnChecked = function()
                        v.enable = false

                        gangData.permissions[v.name][Gangs.Gestion.Roles.Selected.name] = false

                        secured_TriggerServerEvent('kayscore:gangs:gestion:grades:editGradePermissions', gangData.name, gangData.permissions)
                    end
                })
            end
        end)

        RageUI.IsVisible(main_manageMembers, function()
            for k,v in pairs(Gangs.MembersList) do
                local buttonName = ("%s %s (%s) (%s) [%s] %s"):format(v.firstname, v.lastname, v.playerName, v.job2_grade, v.UniqueID, v.connected)
                
                RageUI.Button(buttonName, nil, {RightLabel = '→'}, true, {
                    onSelected = function()
                        selectedMembed = v.UniqueID

                        RageUI.Visible(main_manageMembers_actions, true)
                    end
                })
            end
        end)

        RageUI.IsVisible(main_manageMembers_actions, function()
            RageUI.Button('Virer la Personne', nil, {}, true, {
                onSelected = function()
                    secured_TriggerServerEvent('kayscore:gangs:manage:demotePlayer', selectedMembed)

                    RageUI.GoBack()
                    RageUI.GoBack()
                end
            })
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(main_editRoles) and not RageUI.Visible(main_editRoles_create) and not RageUI.Visible(main_editRoles_selected) and not RageUI.Visible(main_editRoles_selected_editPermissions) and not RageUI.Visible(main_manageMembers) and not RageUI.Visible(main_manageMembers_actions) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(Player.playerPed, false)
        end
    end
end

Gangs.SelectedAccount = 'cash'

---openChestMenu
---@param gangName string
---@public
function Gangs:openChestMenu(gangName)
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    local main_accounts = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local main_items = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local main_items_add = RageUI.CreateSubMenu(main_items, '', 'Actions Disponibles')
    
    local main_weapons = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local main_weapons_add = RageUI.CreateSubMenu(main_weapons, '', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(Player.playerPed, true)
    while main do Wait(1)
        local gangData = Gangs.List[Player.job2.name]

        RageUI.IsVisible(main, function()
            RageUI.Separator(('Coffre du Gang ~g~%s~s~'):format(gangData.label))
            RageUI.Button(('Argent Propre (~g~%s$~s~)'):format(gangData.chest["accounts"].cash), nil, {RightLabel = '→'}, Gangs:havePermission('accounts'), {
                onSelected = function()
                    Gangs.SelectedAccount = 'cash'

                    RageUI.Visible(main_accounts, true)
                end
            })
            RageUI.Button(('Argent Sale (~r~%s$~s~)'):format(gangData.chest["accounts"].black_money), nil, {RightLabel = '→'}, Gangs:havePermission('accounts'), {
                onSelected = function()
                    Gangs.SelectedAccount = 'black_money'

                    RageUI.Visible(main_accounts, true)
                end
            })
            RageUI.Line()
            RageUI.Button(('Objets (~g~x%s~s~)'):format(#gangData.chest["items"]), nil, {RightLabel = '→'}, Gangs:havePermission('items'), {
                onSelected = function()
                    
                end
            }, main_items)
            RageUI.Button(('Armes (~r~x%s~s~)'):format(#gangData.chest["weapons"]), nil, {RightLabel = '→'}, Gangs:havePermission('weapons'), {
                onSelected = function()
                    
                end
            }, main_weapons)
        end)

        RageUI.IsVisible(main_accounts, function()
            RageUI.Separator(gangData.chest["accounts"][Gangs.SelectedAccount]..'$')
            RageUI.Button('Ajouter de l\'argent', nil, {RightLabel = '→'}, Gangs:havePermission('accounts_add'), {
                onSelected = function()
                    KeyboardUtils.use('Ajouter de l\'argent', function(data)
                        local data = tonumber(data)

                        if data == nil or data <= 0 then return end

                        secured_TriggerServerEvent('kayscore:gangs:chest:accounts:add', gangData.name, Gangs.SelectedAccount, data)
                    end)
                end
            })
            RageUI.Button('Retirer de l\'argent', nil, {RightLabel = '→'}, Gangs:havePermission('accounts_remove'), {
                onSelected = function()
                    KeyboardUtils.use('Retirer de l\'argent', function(data)
                        local data = tonumber(data)

                        if data == nil or data <= 0 then return end

                        secured_TriggerServerEvent('kayscore:gangs:chest:accounts:remove', gangData.name, Gangs.SelectedAccount, data)
                    end)
                end
            })
        end)

        RageUI.IsVisible(main_items, function()
            RageUI.Button('Ajouter un objet', nil, {RightLabel = '→'}, Gangs:havePermission('items_add'), {
                onSelected = function()
                    
                end
            }, main_items_add)
            RageUI.Line()
            for k,v in pairs(gangData.chest["items"]) do
                RageUI.Button(v.label, nil, {RightLabel = ('~g~x%s~s~'):format(v.count)}, Gangs:havePermission('items_remove'), {
                    onSelected = function()
                        Wait(100)
                        KeyboardUtils.use('Quantité à retirer', function(data)
                            local data = tonumber(data)

                            if data == nil or data <= 0 then return end

                            if not gangData.chest["items"][k] then return end

                            secured_TriggerServerEvent('kayscore:gangs:chest:items:remove', gangData.name, v, data)
                        end)
                    end
                })
            end
        end)

        RageUI.IsVisible(main_items_add, function()
            Player.inventory = ESX.GetPlayerData().inventory
            for k,v in pairs(Player.inventory) do
                RageUI.Button(v.label, nil, {RightLabel = ('~g~x%s~s~'):format(v.count)}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Quantité', function(data)
                            local data = tonumber(data)

                            if data == nil or data <= 0 then return end

                            secured_TriggerServerEvent('kayscore:gangs:chest:items:add', gangData.name, v, data)
                        end)
                    end
                })
            end
        end)

        RageUI.IsVisible(main_weapons, function()
            RageUI.Button('Ajouter une arme', nil, {RightLabel = '→'}, Gangs:havePermission('weapons_add'), {
                onSelected = function()
                    
                end
            }, main_weapons_add)
            RageUI.Line()
            for k,v in pairs(gangData.chest["weapons"]) do
                RageUI.Button(v.label, nil, {RightLabel = ('~g~x%s~s~'):format(v.count)}, Gangs:havePermission('weapons_remove'), {
                    onSelected = function()
                        Wait(100)
                        exports['sPrompt']:displayRequestttt(
                            kayscoreConfigServ.ServerName,
                            ('Êtes-vous sûr de vouloir prendre %s ?'):format(v.label), -- Message de confirmation
                            function() -- oui
                                secured_TriggerServerEvent('kayscore:gangs:chest:weapons:remove', gangData.name, v)
                            end,
                            function() -- non
                                ESX.ShowNotification(('Suppression de %s annulée'):format(v.label)) -- Notification d'annulation
                            end
                        )
                    end
                })
                
            end
        end)

        RageUI.IsVisible(main_weapons_add, function()
            Player.loadout = ESX.GetPlayerData().loadout
            for k,v in pairs(Player.loadout) do
                if HasPedGotWeapon(Player.playerPed, GetHashKey(v.name)) then
                    RageUI.Button(v.label, nil, {RightLabel = ('~g~x%s~s~'):format(v.ammo)}, true, {
                        onSelected = function()
                            if kayscoreConfigServ.PermanantWeapon(v.name) then return end
                            exports['sPrompt']:displayRequestttt(
                                kayscoreConfigServ.ServerName,
                                ('Êtes-vous sûr de vouloir ajouter %s au coffre du groupe ?'):format(v.label), -- Message de confirmation
                                function() -- oui
                                    secured_TriggerServerEvent('kayscore:gangs:chest:weapons:add', gangData.name, v, v.ammo)
                                end,
                                function() -- non
                                    ESX.ShowNotification(('Ajout de %s annulé'):format(v.label)) -- Notification d'annulation
                                end
                            )
                        end
                    })
                end
            end
        end)
        


        if not RageUI.Visible(main) and not RageUI.Visible(main_accounts) and not RageUI.Visible(main_items) and not RageUI.Visible(main_items_add) and not RageUI.Visible(main_weapons) and not RageUI.Visible(main_weapons_add)  then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(Player.playerPed, false)
        end
    end
end

Gangs.PlayerInventory = {}
local GANG_DATA_TERRITORIES = {}
function Gangs:openInteractMenu()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    local main_inventory = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local main_recruitPlayer = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local main_territories = RageUI.CreateSubMenu(main, '', 'Liste des territoires')

    RageUI.Visible(main, not RageUI.Visible(main))

    while main do Wait(1)
        local gangData = Gangs.List[Player.job2.name]

        RageUI.IsVisible(main, function()

            -- RageUI.Button('Informations territoires', nil, {RightLabel = '>'}, true, {
            --     onSelected = function()
            --         ESX.TriggerServerCallback("territories:getTerritoriesData", function (data)
            --             GANG_DATA_TERRITORIES = data
            --         end)
            --     end
            -- }, main_territories);
            RageUI.Button('Fouiller la personne', nil, {RightLabel = '→'}, true, {
                onSelected = function()
                    local player, distance = ESX.Game.GetClosestPlayer()

                    if distance == -1 or distance > 3 then return ESX.ShowNotification('~r~Aucun joueur à Proximité~s~') end

                    if not ESX.isHandsUp(GetPlayerPed(player)) then
                        return ESX.ShowNotification('✋ Le joueur doit lever les mains')
                    end

                    ESX.TriggerServerCallback('kayscore:gangs:interaction:requestPlayerInventory', function(cb)
                        Gangs.PlayerInventory = cb

                        RageUI.Visible(main_inventory, true)
                    end, GetPlayerServerId(player))
                end
            })
            RageUI.Button('Cagouler/Décagouler la personne', nil, {RightLabel = '→'}, true, {
                onSelected = function()
                    local player, distance = ESX.Game.GetClosestPlayer()

                    if distance == -1 or distance > 3 then return ESX.ShowNotification('~r~Aucun joueur à Proximité~s~') end

                    if not ESX.isHandsUp(GetPlayerPed(player)) then
                        return ESX.ShowNotification('✋ Le joueur doit lever les mains')
                    end

                    secured_TriggerServerEvent("kayscore:gangs:interaction:cagoulePlayer", GetPlayerServerId(player))
                end
            })
            if Gangs:havePermission('recruit_remove_player') then
                RageUI.Button('Recruter la personne', nil, {RightLabel = '→→'}, true, {
                    onSelected = function()
                        local player, distance = ESX.Game.GetClosestPlayer()

                        if distance == -1 or distance > 3 then return ESX.ShowNotification('~r~Aucun joueur à Proximité~s~') end

                        RageUI.Visible(main_recruitPlayer, true)
                    end
                })
                RageUI.Button('Virer la personne', nil, {RightLabel = '→'}, true, {
                    onSelected = function()
                        local player, distance = ESX.Game.GetClosestPlayer()

                        if distance == -1 or distance > 3 then return ESX.ShowNotification('~r~Aucun joueur à Proximité~s~') end

                        secured_TriggerServerEvent('kayscore:gangs:interaction:removePlayer', GetPlayerServerId(player))
                    end
                })
            end
            if Gangs:havePermission('change_group_player') then
                RageUI.Button('Changer le Rôle de la personne', nil, {RightLabel = '→→'}, true, {
                    onSelected = function()
                        local player, distance = ESX.Game.GetClosestPlayer()

                        if distance == -1 or distance > 3 then return ESX.ShowNotification('~r~Aucun joueur à Proximité~s~') end

                        RageUI.Visible(main_recruitPlayer, true)
                    end
                })
            end
            if gangData.circuit == true then
             --   RageUI.Button('Gestion du Territoire', nil, {RightLabel = '→'}, true, {
             --       onSelected = function()
                        
             --       end
            --    })
            end
        end)

        RageUI.IsVisible(main_territories, function()
            for k,v in pairs(GANG_DATA_TERRITORIES) do
                if not v.active then goto continue end

                RageUI.Button(v.name,
                    ("Nom de la zone : %s\nControlé par : %s\nNombre de point : %s\n-----\nVotre nombre de point : %s\nPoint manquant pour controler la zone : %s"):format(
                        v.name,
                        v.ownerLabel == nil and "Aucun" or v.ownerLabel,
                        v.ownerCount,
                        GANG_DATA_TERRITORIES[k].data[ESX.PlayerData.job2.name] == nil and 0 or GANG_DATA_TERRITORIES[k].data[ESX.PlayerData.job2.name].count,
                        v.owner == ESX.PlayerData.job2.name and "Vous controlez la zone" or v.ownerCount - (GANG_DATA_TERRITORIES[k].data[ESX.PlayerData.job2.name] == nil and 0 or GANG_DATA_TERRITORIES[k].data[ESX.PlayerData.job2.name].count)
                    ), { RightLabel = v.owner == ESX.PlayerData.job2.name and '✅' or "❌" }, true, {}
                )

                ::continue::
            end
        end)


        RageUI.IsVisible(main_inventory, function()
            RageUI.Separator('↓ Soldes ↓')
            for k,v in pairs(Gangs.PlayerInventory.accounts) do
                if v.name == "cash" then
                    RageUI.Button('Argent Propre', nil, {RightLabel = ('~g~%s~s~'):format(v.money)}, true, {
                        onSelected = function()
                            
                        end
                    })
                elseif v.name == "black_money" then
                    RageUI.Button('Argent Sale', nil, {RightLabel = ('~r~%s~s~'):format(v.money)}, true, {
                        onSelected = function()
                            
                        end
                    })
                end
            end
            RageUI.Separator('↓ Objets ↓')
            for k,v in pairs(Gangs.PlayerInventory.items) do
                RageUI.Button(v.label, nil, {RightLabel = ('~g~x%s~s~'):format(v.count)}, true, {
                    onSelected = function()
                        
                    end
                })
            end
            RageUI.Separator('↓ Armes ↓')
            for k,v in pairs(Gangs.PlayerInventory.weapons) do
                RageUI.Button(v.label, nil, {RightLabel = ('~r~%s Munitions~s~'):format(v.ammo)}, true, {
                    onSelected = function()

                    end
                })
            end
        end)

        RageUI.IsVisible(main_recruitPlayer, function()
            for k,v in pairs(gangData.grades) do
                RageUI.Button(v.label, nil, {}, true, {
                    onSelected = function()
                        local player, distance = ESX.Game.GetClosestPlayer()

                        if distance == -1 or distance > 3 then return ESX.ShowNotification('~r~Aucun joueur à Proximité~s~') end

                        secured_TriggerServerEvent('kayscore:gangs:interaction:recruitPlayer', GetPlayerServerId(player), gangData.name, v.grade)

                        RageUI.GoBack()
                    end
                })
            end
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(main_inventory) and not RageUI.Visible(main_territories) and not RageUI.Visible(main_recruitPlayer) then
            main = RMenu:DeleteType('main')
        end
    end
end
RegisterCommand('openGangInteractions', function()
    if not Gangs.List[Player.job2.name] then return end

    Gangs:openInteractMenu()
end)
RegisterKeyMapping('openGangInteractions', 'Menu Intéractions Groupes Illégal', 'keyboard', 'F7')

CreateThread(function()
    local interval = 2000

    while true do
        Wait(interval)

        interval = 2000

        local playerData = ESX.GetPlayerData()
        local playerName = playerData.job2 and playerData.job2.name or nil

        if playerName then
            local playerJob2 = Player.job2 or {}
            playerJob2.name = playerName
            Player.job2 = playerJob2

            for k,v in pairs(Gangs.List) do
                if v.name == playerName then
                    local playerPed = PlayerPedId()
                    local playerCoords = GetEntityCoords(playerPed)
                    
                    local distChest = #(playerCoords - vector3(v.positions.chest.x, v.positions.chest.y, v.positions.chest.z))
                    local distManagement = #(playerCoords - vector3(v.positions.boss.x, v.positions.boss.y, v.positions.boss.z))

                    if distChest <= 15 or distManagement <= 15 then
                        interval = 1

                        DrawMarker(25, v.positions.chest.x, v.positions.chest.y, v.positions.chest.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)
                        DrawMarker(25, v.positions.boss.x, v.positions.boss.y, v.positions.boss.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)

                        if distChest < 1 then
                            DrawInstructionBarNotification(v.positions.chest.x, v.positions.chest.y, v.positions.chest.z, "Appuyez sur [ ~g~E~w~ ] pour intéragir (Coffre)")

                            if IsControlJustPressed(0, 54) then
                                Gangs:openChestMenu(v.name)
                            end
                        end

                        if distManagement < 1 then
                            DrawInstructionBarNotification(v.positions.boss.x, v.positions.boss.y, v.positions.boss.z, "Appuyez sur [ ~g~E~w~ ] pour intéragir (Gestion)")

                            if IsControlJustPressed(0, 54) then
                                Gangs:openGestionMenu(v.name)
                            end
                        end
                    end
                end
            end
        end
    end
end)


secured_RegisterNetEvent('kayscore:gangs:updateGang', function(name, data)
    Gangs.List[name] = data
end)
secured_RegisterNetEvent('kayscore:gangs:delete', function(name)
    Gangs.List[name] = nil
end)
secured_RegisterNetEvent('kayscore:gangs:updateChest', function(name, chest)
    if Gangs.List[name] then
        Gangs.List[name].chest = chest
       -- print("Refresh")
    else
       -- print("Gang non trouvé")
    end
end)

exports('HasCagoule', function()
    return needDisplayBag
end)
secured_RegisterNetEvent('kayscore:gangs:interaction:cagoulePlayer', function(value)
    needDisplayBag = value

    while needDisplayBag do
        if not HasStreamedTextureDictLoaded('cagoule') then
            RequestStreamedTextureDict('cagoule')
            while not HasStreamedTextureDictLoaded('cagoule') do
                Citizen.Wait(50)
            end
        end
        exports['inv']:closeInventory()
        DrawSprite('cagoule', 'headbag', 0.5, 0.5, 1.0, 1.0, 0.0, 255, 255, 255, 255)
        Citizen.Wait(1)
        DisableControlAction(2, 289, true) -- F2
        DisableControlAction(2, 322, true) -- ECHAP CARTE
        DisableControlAction(2, 199, true) -- ECHAP CARTE
        DisableControlAction(2, 200, true) -- ECHAP CARTE
        DisableControlAction(0, 288, true) --TELEPHONE
    end
    SetStreamedTextureDictAsNoLongerNeeded('cagoule')
end)