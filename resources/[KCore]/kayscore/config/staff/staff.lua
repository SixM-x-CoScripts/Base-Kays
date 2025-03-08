kayscoreTPAdmin = {   

    TeleportLocations = {
    { label = "Recolte Weed", coords = vector3(1060.5313720703, -3193.3864746094, -39.140571594238)},
    { label = "Point B", coords = vector3(1060.53, -3193.38, -39.14) },
    -- Ajoutez d'autres points de téléportation ici
},

 }

 Config = {
    Staff = {},
}

Config.Staff.NoClip = {

    vitessenormalnoclip = "0.4", -- Vitesse du Noclip quand tu marche
    vitessespeednoclip = "8", -- Vitesse du Noclip quand tu cours 
    touchewnoclip = "F3",


}
Config.Staff.Permissions = {
    Menu = {
        ['openMenu'] = {
            ['*'] = true
        },
        ['personnalOptions'] = {
            ['*'] = true
        },
        ['serverOptions'] = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['responsable'] = true,
            ['gerant'] = true,
            ['superadmin'] = true,
            ['administrateur'] = true,
        },
        ['vehiclesOptions'] = {
            ['*'] = true
        },
        ['playersList'] = {
            ['*'] = true
        },
        ['staffsList'] = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['responsable'] = false,
            ['gerant'] = false,
            ['superadmin'] = false,
            ['administrateur'] = false,
        },
        ['uniqueidOptions'] = {
            ['*'] = true
        },
        ['reports'] = {
            ['*'] = true,
        },
        ['events'] = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['responsable'] = true,
            ['gerant'] = true,
            ['superadmin'] = true,
            ['administrateur'] = true
        },
    },

    OutFit = {
        ['Data'] = {
            ['gerant'] = false,
            ['responsable'] = true,
            ['superadmin'] = true,
            ['administrateur'] = true,
            ['moderateur'] = true,
            ['helpeur'] = true, 
        }
    },

    Modules = {
        ['noClip'] = {
            ['*'] = true
        },
        ['gamerTags'] = {
            ['*'] = true
        },
        ['blips'] = {
            ['*'] = true
        },
        ['reportsInfos'] = {
            ['*'] = true
        },
        ['reportsSong'] = {
            ['*'] = true
        },
        ['objects'] = {
            ['*'] = true
        },
        ['gunInfos'] = {
            ['fondateur'] = true,
            ['responsable'] = true,
            ['gerant'] = true,
            ['superadmin'] = true,
            ['administrateur'] = true,
        },
        ['weather'] = {
            ['fondateur'] = true,
            ['responsable'] = true,
            ['gerant'] = true,
            ['superadmin'] = true,
            ['administrateur'] = true,
        },
        ['tptkt'] = {
            ['fondateur'] = true,
            ['responsable'] = true,
            ['gerant'] = true,
            ['superadmin'] = true,
            ['administrateur'] = true,
        },
    },

    VehiclesOptions = {
        ['delveh'] = {
            ['*'] = true,
        },
        ['repairveh'] = {
             ['*'] = true
        },
        ['delvehzone'] = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['responsable'] = true,
            ['gerant'] = true,
            ['superadmin'] = true,
            ['administrateur'] = true,
        },
        ['repairvehzone'] = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['responsable'] = true,
            ['gerant'] = true,
            ['superadmin'] = true,
            ['administrateur'] = true,
        },
        ['cleanVehicle'] = {
            ['*'] = true
        },
        ['spawnveh'] = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['responsable'] = true,
            ['gerant'] = true,
            ['superadmin'] = true,
        },
        ['fullcustom'] = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['responsable'] = true,
            ['gerant'] = true,
        },
        ['returnveh'] = {
            ['*'] = true
        },
        ['freezeunfreeze'] = {
            ['*'] = true
        }
    },

    ManagePlayers = {
        ['goto'] = {
            ['*'] = true
        },
        ['bring'] = {
            ['*'] = true
        },
        ['screen'] = {
            ['*'] = true
        },
        ['spectate'] = {
            ['*'] = true
        },
        ['Message'] = {
            ['*'] = true,
        },
        ['revive'] = {
            ['*'] = true
        },
        ['heal'] = {
            ['*'] = true
        },
        ['gopc'] = {
            ['*'] = true
        },
        ['gomb'] = {
            ['*'] = true
        },
        ['givepanto'] = {
            ['*'] = true
        },
        ['clearinventory'] = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['responsable'] = true,
            ['gerant'] = true,
        },
        ['clearweapons'] = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['responsable'] = true,
            ['gerant'] = true,
        },
        ['playerinformations'] = {
            ['*'] = true
        },
        ['changejob'] = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['responsable'] = true,
            ['gerant'] = true,
            ['superadmin'] = true,
            ['administrateur'] = true
        },
        ['changegroup'] = {
            ['fondateur'] = true,
            ['responsable'] = true,
            ['gerant'] = true,
        },
        ['wipe'] = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['responsable'] = true,
            ['gerant'] = true,
            ['superadmin'] = true,
            ['administrateur'] = true
        },
        WARN = {
            ['*'] = true
        }
    },

    ServerOptions = {
        ['announce'] = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['responsable'] = true,
            ['gerant'] = true,
        },
        ['restartServer'] = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['gerant'] = true,
        },
        ['boutiqueManagement'] = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['gerant'] = true,
        },
        ['creategarage'] = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['responsable'] = true,
            ['gerant'] = true,
        }, 
        ['fondateur'] = {
            ['fondateur'] = true
        },
        ['creategang'] = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['responsable'] = true,
            ['gerant'] = true,
        }, 
        ['CreateBlanchiment'] = {
            ['fondateur'] = true,
            ['developper'] = true,
        }, 
        ['createentreprise'] = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['responsable'] = true,
            ['gerant'] = true,
        }, 
        ['createsociety'] = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['responsable'] = true,
            ['gerant'] = true,
            ['superadmin'] = true,
            ['administrateur'] = true,
        },
        ['editsociety'] = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['gerant'] = true,
            ['responsable'] = true,
        },
        ['weaponsSell'] = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['gerant'] = true,
            ['responsable'] = true,
        },
        ['createDrugs'] = {
            ['fondateur'] = true,
            ['gerant'] = true,
            ['responsable'] = true,
        }
    },

    UniqueIDoptions = {
        ['clearmoney'] = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['responsable'] = true,
            ['gerant'] = true,
            ['superadmin'] = true,
            ['administrateur'] = true,
        },
        ['clearinventory'] = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['responsable'] = true,
            ['gerant'] = true,
            ['superadmin'] = true,
            ['administrateur'] = true,
        },
        ['clearweaon'] = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['responsable'] = true,
            ['gerant'] = true,
            ['superadmin'] = true,
            ['administrateur'] = true,
        },
        ['boutiquehistory'] = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['responsable'] = true,
            ['gerant'] = true,
            ['superadmin'] = true,
            ['administrateur'] = true,
        },
        GIVE_MONEY = {
            ['fondateur'] = true,
            ['developper'] = true,
            -- ['responsable'] = true,
            ['gerant'] = true,
            -- ['superadmin'] = true,
            -- ['administrateur'] = true,
        },
        GIVE_WEAPON = {
            ['fondateur'] = true,
            ['developper'] = true,
            -- ['responsable'] = true,
            ['gerant'] = true,
            -- ['superadmin'] = true,
            -- ['administrateur'] = true,
        },
        GIVE_ITEM = {
            ['fondateur'] = true,
            ['developper'] = true,
            -- ['responsable'] = true,
            ['gerant'] = true,
            -- ['superadmin'] = true,
            -- ['administrateur'] = true,
        },
        GIVE_VEHICLE = {
            ['fondateur'] = true,
            ['developper'] = true,
            -- ['responsable'] = true,
            ['gerant'] = true,
            -- ['superadmin'] = true,
            -- ['administrateur'] = true,
        }
    },

    ['ServerGroup'] = {
        ['fondateur'] = {
            ['user'] = {label = 'Joueur', value = 'user', id = 8},
            ['helpeur'] = {label = 'Helpeur', value = 'helpeur',id = 7},
            ['moderateur'] = {label = 'Modérateur', value = 'moderateur', id = 6},
            ['administrateur'] = {label = 'Administrateur', value = 'administrateur', id = 5},
            ['superadmin'] = {label = 'Super-Administrateur', value = 'superadmin', id = 4},
            ['responsable'] = {label = 'Responsable', value = 'responsable', id = 3},
            ['gerant'] = {label = 'Gérant', value = 'gerant', id = 2},
            ['fondateur'] = {label = 'Fondateur', value = 'fondateur', id = 1},
        },
        ['gerant'] = {
            ['user'] = {label = 'Joueur', value = 'user', id = 6},
            ['helpeur'] = {label = 'Helpeur', value = 'helpeur',id = 5},
            ['moderateur'] = {label = 'Modérateur', value = 'moderateur', id = 4},
            ['administrateur'] = {label = 'Administrateur', value = 'administrateur', id = 3},
            ['superadmin'] = {label = 'Super-Administrateur', value = 'superadmin', id = 2},
            ['responsable'] = {label = 'Responsable', value = "responsable", id = 1},
        },
        ['responsable'] = {
            ['user'] = {label = 'Joueur', value = 'user', id = 5},
            ['helpeur'] = {label = 'Helpeur', value = 'helpeur',id = 4},
            ['moderateur'] = {label = 'Modérateur', value = 'moderateur', id = 3},
            ['administrateur'] = {label = 'Administrateur', value = 'administrateur', id = 2},
            ['superadmin'] = {label = 'Super-Administrateur', value = 'superadmin', id = 1},
        },
    },

    COMMANDS = {
        BAN = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['responsable'] = true,
            ['gerant'] = true,
            ['moderateur'] = true,
            ['superadmin'] = true,
            ['administrateur'] = true,
        },
        UNBAN = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['responsable'] = true,
            ['gerant'] = true,
            ['moderateur'] = true,
            ['superadmin'] = true,
            ['administrateur'] = true,
        },
        KICK = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['responsable'] = true,
            ['gerant'] = true,
            ['moderateur'] = true,
            ['superadmin'] = true,
            ['administrateur'] = true,
        },
        JAIL = {
            ['*'] = true,
        }
    },

    VIP = {
        ADD = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['gerant'] = true,
        },
        REMOVE = {
            ['fondateur'] = true,
            ['developper'] = true,
            ['gerant'] = true,
        }
    }
}

Config.Staff.Group = {
    ['fondateur'] = '~r~Fondateur~s~',
    ['gerant'] = '~y~Gérant~s~',
    ['responsable'] = '~y~Responsable~s~',
    ['superadmin'] = '~p~Super-Admin~s~',
    ['administrateur'] = kayscoreConfigServ.GTACOLOR..'Administrateur~s~',
    ['moderateur'] = '~g~Moderateur~s~',
    ['helpeur'] = kayscoreConfigServ.GTACOLOR..'Helpeur~s~',
    ['user'] = '~c~Joueur~s~'
}

Config.Staff.GamertagsGroup = {
    ['fondateur'] = 208,
    ['gerant'] = 208,
    ['responsable'] = 208,
    ['superadmin'] = 208,
    ['administrateur'] = 208,
    ['moderateur'] = 208,
    ['helpeur'] = 208,
    ['user'] = 0
}

Config.eventsMenu = {
    ["Attaque Territoire"] = {
        menu =  {
            ['zone'] =  {
                label = "Territoire",
                description = false,
                type = 'list',
                list = {},
                index = 1,
            },

            ['attacker'] =  {
                label = "Groupe Attaquant",
                description = "Choissiez un groupe attaquant",

                action = function()
                    local result = ""
                    local name = ZGEG.GetTextInput("Groupe")

                    if name and name ~= nil and name ~= '' then
                        result = name
                    end

                    return result
                end
            },

            ['time'] =  {
                label = "Durée de l'attaque",
                description = "Temps en minutes.",
                action = function()
                    local result = ZGEG.GetNumberInput("Durée")
                    if result == nil then
                        ZGEG.ShowNotification("~r~La durée doit être un nombre")

                        return nil
                    end

                    return result
                end
            }
        },

        preview = function()

        end,

        event = function (result)
            local zoneId = exports.Slide:getZoneByName(result.zone)
            TriggerServerEvent("territories:createRaid", zoneId, result.attacker, result.time)
        end,
    },
    ["Braquage Véhicule (Attaque)"] = {
        menu =  {
            ['name'] =  {
                label = "Nom",
                description = "Le nom par défault est 'Fourgon Blindé'.",
                action = function()
                    local result =  "Fourgon Blindé"
                    local name = KeyboardInput("Nom", "Nom", "", 30)
                    if name and name ~= nil and name ~= '' then
                        result = name
                    end

                    return result
                end
            },
            ['vehicle'] =  {
                label = "Véhicule",
                description = "Le modèle du fourgon blindé (stockade) est défini par défault.\n\nVéhicule terrestre conseillé : stockade.\nVéhicule aquatique conseillé : tug.",
                action = function(entity)
                    if entity and DoesEntityExist(entity) then
                        DeleteEntity(entity)
                    end

                    local vehicle = "stockade"
                    local result = KeyboardInput("Modele", "Modele", "", 12)
                    
                    if result ~= nil and result ~= "" then
                        vehicle = result 
                    end

                    return vehicle, handlePreviewEventEntity(vehicle, 'vehicle')
                end
            },

            ['duration'] =  {
                label = "Durée de l'evenement",
                description = "Le temps doit être défini en secondes.",
                action = function()
                    local time = 180
                    local result = KeyboardInput("Temps", "Temps", "", 3)
                    
                    if result ~= nil and result ~= "" then
                        result = tonumber(result)

                        if result > 0 and result ~= nil then
                            time = result
                        end
                    end

                    return time
                end
            },

            ['rewards'] = {
                label = "Nombre de palettes",
                description = "Le nombre maximal est 20.",
                action = function()
                    local amount = 12
                    local result = KeyboardInput("Palettes", "Palettes", "", 2)
                    
                    if result ~= nil and result ~= "" then
                        result = tonumber(result)

                        if result > 0 and result <= 20 and result ~= nil then
                            amount = result
                        end
                    end

                    return amount
                end
            },
        },

        event = function(result)
            TriggerServerEvent('kayscore:admin:vents:van:server:create', result.position, result.heading, result.rewards, result.duration, result.vehicle or 'stockade', result.name or "Fourgon Blindé")
        end,

        previewType = 'vehicle',
        preview = function(entity)
            if entity == nil then return end
            local entity = entity
            local position = GetCoordsFromGamePlayCameraPointAtSynced(PlayerPedId())
            local heading = GetEntityHeading(entity)

            EnableControlAction(0, 14, true)
            if IsControlPressed(0, 14) then
                heading += 4.5
            end

            EnableControlAction(0, 15, true)
            if IsControlPressed(0, 15) then
                heading -= 4
            end

            ground, newZ = GetGroundZFor_3dCoord(position.x, position.y, position.z + 0.5)

            if ground then
                local newPosition = vector3(position.x, position.y, newZ)
                SetEntityCoords(entity, newPosition)
                SetEntityHeading(entity, heading)
            end
        end
    },
}

Config.Staff.HavePermission = function(permissionsCategorie, permissionName, player)

    if not permissionsCategorie then return end
    if not permissionName then return end

    -- client

    if not player then
        if Config.Staff.Permissions[permissionsCategorie][permissionName]['*'] then
            if Player.group ~= 'user' then
                return true
            end
        elseif Config.Staff.Permissions[permissionsCategorie][permissionName][Player.group] then
            return true
        else
            return false
        end
    end

    -- server

    if not (player) then return false end
    local group = player.getGroup()
    if Config.Staff.Permissions[permissionsCategorie][permissionName]['*'] then
        return true
    elseif Config.Staff.Permissions[permissionsCategorie][permissionName][group] then
        return true
    else
        return false
    end
end