kayscoreHolsters = {
    ["SideHolsterAnimation"] = {
        label = "Droite",
        intro = function(ped, weapon, cb)
            ESX.Streaming.RequestAnimDict('rcmjosh4')
            ESX.Streaming.RequestAnimDict('reaction@intimidation@cop@unarmed')
            TaskPlayAnim(ped, "reaction@intimidation@cop@unarmed", "intro", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
            Citizen.Wait(100)
            TaskPlayAnim(ped, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
            SetCurrentPedWeapon(ped, weapon, true)
            Citizen.Wait(400)
            ClearPedTasks(ped)
            RemoveAnimDict('rcmjosh4')
            RemoveAnimDict('reaction@intimidation@cop@unarmed')
            if cb then 
                cb()
            end
        end,

        outro = function(ped, weapon, cb)
            ESX.Streaming.RequestAnimDict('rcmjosh4')
            ESX.Streaming.RequestAnimDict('reaction@intimidation@cop@unarmed')
            TaskPlayAnim(ped, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
            Citizen.Wait(500)
            TaskPlayAnim(ped, "reaction@intimidation@cop@unarmed", "outro", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
            Citizen.Wait(60)
            RemoveAnimDict('rcmjosh4')
            RemoveAnimDict('reaction@intimidation@cop@unarmed')
            if cb then 
                cb()
            end
        end
        
    },
    ["BackHolsterAnimation"] = {
        label = "Arrière",
        intro = function(ped, weapon, cb)
            ESX.Streaming.RequestAnimDict('reaction@intimidation@1h')
            pos = GetEntityCoords(ped, true)
            rot = GetEntityHeading(ped)
            TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "intro", pos, 0, 0, rot, 8.0, 3.0, -1, 50, 0.325, 0, 0)
            Citizen.Wait(600)
            SetCurrentPedWeapon(ped, weapon, true)
            ClearPedTasks(ped)
            RemoveAnimDict('reaction@intimidation@1h')
            if cb then 
                cb()
            end
        end,

        outro = function(ped, weapon, cb)
            ESX.Streaming.RequestAnimDict('reaction@intimidation@1h')
            pos = GetEntityCoords(ped, true)
            rot = GetEntityHeading(ped)
            TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "outro", pos, 0, 0, rot, 8.0, 3.0, -1, 50, 0.125, 0, 0)
            Citizen.Wait(1000)
            SetCurrentPedWeapon(ped, weapon, false)
            ClearPedTasks(ped)
            RemoveAnimDict('reaction@intimidation@1h')
            if cb then 
                cb()
            end
        end
        
    },

    ["FrontHolsterAnimation"] = {
        label = "Devant",
        intro = function(ped, weapon, cb)
            ESX.Streaming.RequestAnimDict('combat@combat_reactions@pistol_1h_gang')
            pos = GetEntityCoords(ped, true)
            rot = GetEntityHeading(ped)
            TaskPlayAnimAdvanced(ped, "combat@combat_reactions@pistol_1h_gang", "0", pos, 0, 0, rot, 8.0, 3.0, -1, 50, 0.325, 0, 0)
            Citizen.Wait(500)
            SetCurrentPedWeapon(ped, weapon, true)
            ClearPedTasks(ped)
            RemoveAnimDict('combat@combat_reactions@pistol_1h_gang')
            if cb then 
                cb()
            end
        end,

        outro = function(ped, weapon)
            ESX.Streaming.RequestAnimDict('combat@combat_reactions@pistol_1h_gang')
            pos = GetEntityCoords(ped, true)
            rot = GetEntityHeading(ped)
            TaskPlayAnimAdvanced(ped, "combat@combat_reactions@pistol_1h_gang", "0", pos, 0, 0, rot, 8.0, 3.0, -1, 50, 0.125, 0, 0)
            Citizen.Wait(1000)
            SetCurrentPedWeapon(ped, weapon, false)
            ClearPedTasks(ped)
            RemoveAnimDict('combat@combat_reactions@pistol_1h_gang')
            if cb then 
                cb()
            end
        end
    },

    ["AgressiveFrontHolsterAnimation"] = {
        label = "Gauche Aggressif",
        intro = function(ped, weapon, cb)
            ESX.Streaming.RequestAnimDict('combat@combat_reactions@pistol_1h_hillbilly')
            pos = GetEntityCoords(ped, true)
            rot = GetEntityHeading(ped)
            TaskPlayAnimAdvanced(ped, "combat@combat_reactions@pistol_1h_hillbilly", "0", pos, 0, 0, rot, 8.0, 3.0, -1, 50, 0.325, 0, 0)
            Citizen.Wait(600)
            SetCurrentPedWeapon(ped, weapon, true)
            ClearPedTasks(ped)
            RemoveAnimDict('combat@combat_reactions@pistol_1h_hillbilly')
            if cb then 
                cb()
            end
        end,

        outro = function(ped, weapon, cb)
            ESX.Streaming.RequestAnimDict('combat@combat_reactions@pistol_1h_gang')
            pos = GetEntityCoords(ped, true)
            rot = GetEntityHeading(ped)
            TaskPlayAnimAdvanced(ped, "combat@combat_reactions@pistol_1h_gang", "0", pos, 0, 0, rot, 8.0, 3.0, -1, 50, 0.125, 0, 0)
            Citizen.Wait(1000)
            SetCurrentPedWeapon(ped, weapon, false)
            ClearPedTasks(ped)
            RemoveAnimDict('combat@combat_reactions@pistol_1h_gang')
            if cb then 
                cb()
            end
        end
    },

    ["SideLegHolsterAnimation"] = {
        label = "Holster bas",
        intro = function(ped, weapon, cb)
            ESX.Streaming.RequestAnimDict("reaction@male_stand@big_variations@d")
            pos = GetEntityCoords(ped, true)
            rot = GetEntityHeading(ped)
            TaskPlayAnimAdvanced(ped, "reaction@male_stand@big_variations@d", "react_big_variations_m", pos, 0, 0, rot, 8.0, 3.0, -1, 50, 0.325, 0, 0)
            Citizen.Wait(500)
            SetCurrentPedWeapon(ped, weapon, true)
            ClearPedTasks(ped)  
            RemoveAnimDict("reaction@male_stand@big_variations@d")
            if cb then 
                cb()
            end
        end,

        outro = function(ped, weapon, cb)
            ESX.Streaming.RequestAnimDict("reaction@male_stand@big_variations@d")
            pos = GetEntityCoords(ped, true)
            rot = GetEntityHeading(ped)
            TaskPlayAnimAdvanced(ped, "reaction@male_stand@big_variations@d", "react_big_variations_m", pos, 0, 0, rot, 8.0, 3.0, -1, 50, 0.125, 0, 0)
            Citizen.Wait(500)
            SetCurrentPedWeapon(ped, weapon, false)
            ClearPedTasks(ped)
            RemoveAnimDict("reaction@male_stand@big_variations@d")
            if cb then 
                cb()
            end
        end  
    }
}

kayscoreAimStyles = {
    "Default",
    "Gangster",
    "Gangster2"
}
kayscoreAimWeapons = {
    "WEAPON_PISTOL",
    "WEAPON_COMBATPISTOL",
    "WEAPON_APPISTOL",
    "WEAPON_PISTOL50",
    "WEAPON_SNSPISTOL",
    "WEAPON_HEAVYPISTOL",
    "WEAPON_VINTAGEPISTOL",
    "WEAPON_MARKSMANPISTOL",
    "WEAPON_MACHINEPISTOL",
    "WEAPON_VINTAGEPISTOL",
    "WEAPON_PISTOL_MK2",
    "WEAPON_SNSPISTOL_MK2",
    "WEAPON_FLAREGUN",
    "WEAPON_STUNGUN",
    "WEAPON_REVOLVER",
}

kayscoreCraftWeapons = {
    fond = false,
    loadpercent = 0.0,
    count = 0.00006,

    fondCount = 0,

    crafting = false,

    Weapons = {
        ['weapon_snspistol'] = {
            name = 'weapon_snspistol',
            label = 'Petoire',
            price = 110000,
            acierFondue = 30,
            filFer = 5,
            time = 1 -- en minutes
        },
    }
}

-- ConfigLaboArmes = {}

-- ConfigLaboArmes.Weapons = {
--     Gangs = {
--         pistol = {
--             label = 'Pistolet',
--             item1 = 'iron',
--             item2 = 'copper',
--             amount1 = 1,
--             amount2 = 5
--         },
--         shotgun = {
--             label = 'Fusil à pompe',
--             item1 = 'steel',
--             item2 = 'aluminum',
--             amount1 = 2,
--             amount2 = 10
--         },
--         -- Ajoutez d'autres armes pour les gangs ici...
--     },
--     mc = {
--         -- Ajoutez des armes pour les Motorcycle Clubs ici...
--     },
--     orga = {
--         -- Ajoutez des armes pour les Organisations ici...
--     },
--     mafia = {
--         -- Ajoutez des armes pour la Mafia ici...
--     },
--     cartel = {
--         -- Ajoutez des armes pour le Cartel ici...
--     }
-- }
