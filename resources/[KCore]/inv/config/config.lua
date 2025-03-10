Config = Config or {}
--[[ 
    Welcome to the inventory configuration!
    https://lcode.gitbook.io/documentation/inventory/
]]

--╔════════════════════════════════════════════════════════════════════════════════╗

--  ██████╗ ███████╗███╗   ██╗███████╗██████╗  █████╗ ██╗     
-- ██╔════╝ ██╔════╝████╗  ██║██╔════╝██╔══██╗██╔══██╗██║     
-- ██║  ███╗█████╗  ██╔██╗ ██║█████╗  ██████╔╝███████║██║     
-- ██║   ██║██╔══╝  ██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║██║     
-- ╚██████╔╝███████╗██║ ╚████║███████╗██║  ██║██║  ██║███████╗
--  ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝
                                                           

Config.Language = "fr" -- Set your lang in locales folder (fr, en, es, ...)
Config.Framework = "esx" -- esx or qb
Config.Debug = false 
Config.UseNPC = false
--[[                                    
    'old' (Esx 1.1).
    'new' (Esx 1.2, v1 final, legacy or extendedmode).
]]
Config.esxVersion = 'new' 

Config.Trigger = {
    ['useItem'] = 'esx:useItem', 
    ['getSharedObject'] = 'esx:getSharedObject',
    ['getStatus'] = 'esx_status:getStatus',
    ['saveSkin'] = 'esx_skin:save',
}


Config.KeyBinds = {
    -- Find keybinds here: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    {Command = "inventory", Bind = "TAB", Description = "Open inventory"},-- toggle the inventaire
    {Command = "keybind_1", Bind = "1", Description = "Slot weapon 1"},-- 
    {Command = "keybind_2", Bind = "2", Description = "Slot weapon 2"},-- 
    {Command = "keybind_3", Bind = "3", Description = "Slot weapon 3"},-- 
    {Command = "keybind_4", Bind = "4", Description = "Slot weapon 4"},-- 
    {Command = "keybind_5", Bind = "5", Description = "Slot weapon 5"},-- 
    {Command = "trunk", Bind = "K", Description = "Open trunk vehicle"},-- 
}

-- false : If you want use your custom notification in inventory (client/custom/framework/esx.lua)
Config.UseNotificationInventory = true

-- Name of the item when used will close the UI
Config.CloseUI = {
    ['water'] = true,
    ['bread'] = true,
    ['phone'] = true,
    ['boombox'] = true,
}

-- Names of weapons impossible to give
Config.WeaponNoGive = {
    ['WEAPON_AWPREDLINE'] = true,
    ['WEAPON_AK47NEONRIDE'] = true,
    ['WEAPON_VICTUSXMR'] = true,
    ['WEAPON_M6IC'] = true,
    ['WEAPON_AR15'] = true,
    ['WEAPON_FN509'] = true,
    ['WEAPON_MP5SDFM'] = true,
    ['WEAPON_HONEYBADGERCOD'] = true,
    ['WEAPON_MCXSPEAR'] = true,
    ['WEAPON_GLITCHPOPVANDAL'] = true,
    ['WEAPON_SCAR17FM'] = true,
    ['WEAPON_HKUMP'] = true,
    ['WEAPON_FIREAXE'] = true,
    ['WEAPON_BREN'] = true,
    ['WEAPON_VP9'] = true,
    ['WEAPON_SLEDGEHAMMER'] = true,
    ['WEAPON_M9A3'] = true,
    ['WEAPON_KATANA'] = true,
    ['WEAPON_KARAMBITKNIFE'] = true,
    ['WEAPON_DOUBLEBARREL'] = true,
    ['WEAPON_HK416'] = true,
    ['WEAPON_AKS74U'] = true,
    ['WEAPON_G17NEONOIR'] = true,
    ['WEAPON_G17GEN5'] = true,
    ['WEAPON_M9BAYONNETLORE'] = true,
    ['WEAPON_KATANA2'] = true,
    ['WEAPON_KATANA3'] = true,
    ['WEAPON_KATANA4'] = true,
    ['WEAPON_KATANA5'] = true,
    ['WEAPON_KATANA6'] = true,
    ['WEAPON_TOZ'] = true,
    ['WEAPON_FLAMETHROWER'] = true,
    ['WEAPON_GUITAR'] = true,
    ['WEAPON_GLOCK20'] = true,
    ['WEAPON_HK417'] = true,
    ['WEAPON_MICHAELMYERS'] = true,
    ['WEAPON_LEATHERFACE_HATCHET'] = true,
    ['WEAPON_LEATHERFACE_HAMMER'] = true,
    ['WEAPON_JASONVOORHEES'] = true,
    ['WEAPON_CHUCKY'] = true,
    ['WEAPON_DARTHVADER'] = true,
    ['WEAPON_SCYTHE'] = true,
    
}

-- Names of item impossible to give
Config.ItemNoGive = {
    ['caisse_gold'] = true,
    ['caisse_diamond'] = true,
    ['caisse_ruby'] = true,
    ['caisse_fidelite'] = true,
    ['caisse_noel'] = true,
    ['jetoncustom'] = true,
    ['idcard'] = true,
    ['caisse_vehicule'] = true,
    ['boombox'] = true,

}

-- Name of the item that cannot be placed in slots
Config.BL_SlotInv = {
    ["phone"] = true,
    ["radio"] = true,
    ['boombox'] = true,
}

--╔════════════════════════════════════════════════════════════════════════════════╗

--  ██████╗██╗      ██████╗ ████████╗██╗  ██╗███████╗███████╗
-- ██╔════╝██║     ██╔═══██╗╚══██╔══╝██║  ██║██╔════╝██╔════╝
-- ██║     ██║     ██║   ██║   ██║   ███████║█████╗  ███████╗
-- ██║     ██║     ██║   ██║   ██║   ██╔══██║██╔══╝  ╚════██║
-- ╚██████╗███████╗╚██████╔╝   ██║   ██║  ██║███████╗███████║
--  ╚═════╝╚══════╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝
                 

-- For interaction in the middle of the inventory
Config.Clothes = {
    ['helmet'] = {
        [0] = {['helmet_1'] = -1 --[[ type ]], ["helmet_2"] = 0--[[ color ]]}, -- men 
        [1] = {['helmet_1'] = -1 --[[ type ]], ["helmet_2"] = 0--[[ color ]]}  -- women
    },
    ['chain'] = {
        [0] = {['chain_1'] = 0, ["chain_2"] = 0}, -- //
        [1] = {['chain_1'] = 0, ["chain_2"] = 0}  -- //
    },
    ['torso'] = {
        [0] = {['torso_1'] = 15, ["torso_2"] = 0},
        [1] = {['torso_1'] = 15, ["torso_2"] = 0},
    },
    ['tshirt'] = {
        [0] = {['tshirt_1'] = 15, ["tshirt_2"] = 0},
        [1] = {['tshirt_1'] = 15, ["tshirt_2"] = 0},
    },
    ['arms'] = {
        [0] = {['arms_1'] = 15, ["arms_2"] = 0},
        [1] = {['arms_1'] = 15, ["arms_2"] = 0},
    },
    ['pants'] = {
        [0] = {['pants_1'] = 14, ["pants_2"] = 0},
        [1] = {['pants_1'] = 14, ["pants_2"] = 0}
    },
    ['shoes'] = {
        [0] = {['shoes_1'] = 34, ["shoes_2"] = 0},
        [1] = {['shoes_1'] = 34, ["shoes_2"] = 0}
    },
    ['bags'] = {
        [0] = {['bags_1'] = 0, ["bags_2"] = 0},
        [1] = {['bags_1'] = 0, ["bags_2"] = 0}
    },
    ['mask'] = {
        [0] = {['mask_1'] = 0, ["mask_2"] = 0},
        [1] = {['mask_1'] = 0, ["mask_2"] = 0}
    },
    ['glasses'] = {
        [0] = {['glasses_1'] = 0, ["glasses_2"] = 0},
        [1] = {['glasses_1'] = 0, ["glasses_2"] = 0}
    },
    ['ears'] = {
        [0] = {['ears_1'] = -1, ["ears_2"] = 0},
        [1] = {['ears_1'] = -1, ["ears_2"] = 0}
    },
    ['bracelets'] = {
        [0] = {['bracelets_1'] = -1, ["bracelets_2"] = 0},
        [1] = {['bracelets_1'] = -1, ["bracelets_2"] = 0}
    },
    ['watches'] = {
        [0] = {['watches_1'] = -1, ["watches_2"] = 0},
        [1] = {['watches_1'] = -1, ["watches_2"] = 0}
    },
    ['bproof'] = {
        [0] = {['bproof_1'] = 0, ["bproof_2"] = 0},
        [1] = {['bproof_1'] = 0, ["bproof_2"] = 0}
    },
}

--╚════════════════════════════════════════════════════════════════════════════════╝
--╔════════════════════════════════════════════════════════════════════════════════╗

--  ██████╗██╗      ██████╗ ████████╗██╗  ██╗██╗███╗   ██╗ ██████╗     ███████╗████████╗ ██████╗ ██████╗ ███████╗
-- ██╔════╝██║     ██╔═══██╗╚══██╔══╝██║  ██║██║████╗  ██║██╔════╝     ██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗██╔════╝
-- ██║     ██║     ██║   ██║   ██║   ███████║██║██╔██╗ ██║██║  ███╗    ███████╗   ██║   ██║   ██║██████╔╝█████╗  
-- ██║     ██║     ██║   ██║   ██║   ██╔══██║██║██║╚██╗██║██║   ██║    ╚════██║   ██║   ██║   ██║██╔══██╗██╔══╝  
-- ╚██████╗███████╗╚██████╔╝   ██║   ██║  ██║██║██║ ╚████║╚██████╔╝    ███████║   ██║   ╚██████╔╝██║  ██║███████╗
--  ╚═════╝╚══════╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝
        
Config.ActiveClothShop = true

Config.ClothMarkerDistance = 15
Config.ClothMarkerType = 25
Config.ClothActiveText = false
Config.ClothMarkerText = '👕'

Config.ClothTypeMoney = 'bank'
Config.ClothPriceSave = 100
Config.ClothPriceRegister = 250
Config.ClothPrice = {
    ["top"] = 150,
    ["pants"] = 100,
    ["shoes"] = 80,
    ["bags"] = 50,
    ["glasses"] = 20,
    ["ears"] = 10,
    ["helmet"] = 30,
    ["bracelets"] = 15,
    ["watches"] = 30,
    ["chain"] = 50,
    ["mask"] = 30,
}

Config.PosClotheShop = {
        ['Binco'] = {
            menu = 'shopui_title_lowendfashion2',
            type = 'clothes', -- or mask
            coords = {
                vec3(73.862755, -1396.690063, 29.673582-1.0),
                vec3(4489.457031, -4452.023438, 4.171892-1.0), 
                vec3(-715.71514892578, -148.38920593262, 37.614612579346-1.0),
                vec3(-163.11073303223, -310.48196411133, 39.932754516602-1.0),
                vec3(428.754333, -802.218201, 29.788582-1.0),
                vec3(-827.337158, -1072.996826, 11.625566-1.0),
                vec3(-1447.6207275391, -230.46119689941, 50.004837036133-1.0),
                vec3(9.744390, 6513.010254, 32.175278-1.0),
                vec3(122.8479385376, -214.50944519043, 54.557678222656-1.0),
                vec3(1696.098389, 4827.079590, 42.360531-1.0),
                vec3(620.68029785156, 2755.5168457031, 42.087894439697-1.0),
                vec3(1192.668701, 2713.233887, 38.520050-1.0),
                vec3(-1195.6591796875, -777.41845703125, 17.329225540161-1.0),
                vec3(-3172.9787597656, 1053.1711425781, 20.863037109375-1.0),
                vec3(-1106.550537, 2710.057617, 19.405302-1.0),
            },
            blip = {
                color = 81,
                size = 0.5,
                style = 73
            }
        },
        ['Magasin de masque'] = {
            menu = 'shopui_title_lowendfashion2',
            type = 'mask', -- or mask
            coords = {
                vec3(-1264.233154, -1425.383301, 4.373890-1.0)

            },
            blip = {
                color = 18,
                size = 0.5,
                style = 102
            }
        },
    }



--╚════════════════════════════════════════════════════════════════════════════════╝
--╔════════════════════════════════════════════════════════════════════════════════╗

--  █████╗  ██████╗ ██████╗ ██████╗ ██╗   ██╗███╗   ██╗████████╗
-- ██╔══██╗██╔════╝██╔════╝██╔═══██╗██║   ██║████╗  ██║╚══██╔══╝
-- ███████║██║     ██║     ██║   ██║██║   ██║██╔██╗ ██║   ██║   
-- ██╔══██║██║     ██║     ██║   ██║██║   ██║██║╚██╗██║   ██║   
-- ██║  ██║╚██████╗╚██████╗╚██████╔╝╚██████╔╝██║ ╚████║   ██║   
-- ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   
                                                             

-- Display accounts in inventory
Config.ActiveAccount = true
Config.Account = {["black_money"] = true, ["cash"] = true} 
Config.AccountName = {
    ["black_money"] = 'Argents sale', 
    ["cash"] = 'Argents'
}

--╚════════════════════════════════════════════════════════════════════════════════╝
--╔════════════════════════════════════════════════════════════════════════════════╗

-- ██╗██████╗      ██████╗ █████╗ ██████╗ ██████╗ 
-- ██║██╔══██╗    ██╔════╝██╔══██╗██╔══██╗██╔══██╗
-- ██║██║  ██║    ██║     ███████║██████╔╝██║  ██║
-- ██║██║  ██║    ██║     ██╔══██║██╔══██╗██║  ██║
-- ██║██████╔╝    ╚██████╗██║  ██║██║  ██║██████╔╝
-- ╚═╝╚═════╝      ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ 
    

-- Display id card in inventory
Config.ActiveIdCard = false -- just for ESX
Config.ActiveMugShot = false -- https://github.com/BaziForYou/MugShotBase64
Config.PictureIdCard = 'https://cdn.discordapp.com/attachments/979486375218937946/1135635765397823488/47848.png'  -- if ActiveMugShot == false
Config.IdCardName = {
    ["idcard"] = {
        name = 'Identity card', 
        icon = 'assets/icons/icon.png',
        color = '#FFF'
    },
    -- ["drive"] = {
    --     name = 'Driver\'s license', 
    --     icon = 'assets/icons/permis.png',
    --     color = '#e2bab3'
    -- },
    -- ["weapon"] = {
    --     name = 'Weapon license', 
    --     icon = 'https://cdn.discordapp.com/attachments/979486375218937946/1135638696289382400/gun-4-xxl.png',
    --     color = '#cc352a'
    -- },
    -- ["police"] = { 
    --     name = 'Badge LSPD',
    --     icon = 'assets/icons/police.png', 
    --     color = '#05224d'
    -- }
}
Config.GenreIdCard = {
    ["1"] = 'Women', 
    ["0"] = 'Men', 
}

--╚════════════════════════════════════════════════════════════════════════════════╝
--╔════════════════════════════════════════════════════════════════════════════════╗

-- ██╗     ██████╗     ██████╗ ██╗  ██╗ ██████╗ ███╗   ██╗███████╗
-- ██║     ██╔══██╗    ██╔══██╗██║  ██║██╔═══██╗████╗  ██║██╔════╝
-- ██║     ██████╔╝    ██████╔╝███████║██║   ██║██╔██╗ ██║█████╗  
-- ██║     ██╔══██╗    ██╔═══╝ ██╔══██║██║   ██║██║╚██╗██║██╔══╝  
-- ███████╗██████╔╝    ██║     ██║  ██║╚██████╔╝██║ ╚████║███████╗
-- ╚══════╝╚═════╝     ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
                                                               
-- LB Phone is unique with inventory
Config.ActivePhoneUnique = false
Config.ItemPhoneName = 'phone'

--╚════════════════════════════════════════════════════════════════════════════════╝
--╔════════════════════════════════════════════════════════════════════════════════╗

-- ██████╗  ██████╗  ██████╗ ███╗   ███╗██████╗  ██████╗ ██╗  ██╗
-- ██╔══██╗██╔═══██╗██╔═══██╗████╗ ████║██╔══██╗██╔═══██╗╚██╗██╔╝
-- ██████╔╝██║   ██║██║   ██║██╔████╔██║██████╔╝██║   ██║ ╚███╔╝ 
-- ██╔══██╗██║   ██║██║   ██║██║╚██╔╝██║██╔══██╗██║   ██║ ██╔██╗ 
-- ██████╔╝╚██████╔╝╚██████╔╝██║ ╚═╝ ██║██████╔╝╚██████╔╝██╔╝ ██╗
-- ╚═════╝  ╚═════╝  ╚═════╝ ╚═╝     ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝
                                                              
-- Boombox with inventory
Config.ActiveBoombox = false
Config.BoomboxItem = 'boombox'

Config.MaxDistance = 40
Config.MinDistance = 0

Config.MaxVolume = 100
Config.MinVolume = 0

function UseBoombox(source)
    return true -- use condition for vip (exemple)
end

--╔════════════════════════════════════════════════════════════════════════════════╗

-- ██╗      ██████╗  ██████╗ ████████╗
-- ██║     ██╔═══██╗██╔═══██╗╚══██╔══╝
-- ██║     ██║   ██║██║   ██║   ██║   
-- ██║     ██║   ██║██║   ██║   ██║   
-- ███████╗╚██████╔╝╚██████╔╝   ██║   
-- ╚══════╝ ╚═════╝  ╚═════╝    ╚═╝   
                      
Config.HandsupForLoot = false
Config.ActiveJobForLoot = false
Config.JobForLoot = {
    ['police'] = true,
    ['fbi'] = true,
}

--╚════════════════════════════════════════════════════════════════════════════════╝
--╔════════════════════════════════════════════════════════════════════════════════╗

-- ████████╗██████╗ ██╗   ██╗███╗   ██╗██╗  ██╗
-- ╚══██╔══╝██╔══██╗██║   ██║████╗  ██║██║ ██╔╝
--    ██║   ██████╔╝██║   ██║██╔██╗ ██║█████╔╝ 
--    ██║   ██╔══██╗██║   ██║██║╚██╗██║██╔═██╗ 
--    ██║   ██║  ██║╚██████╔╝██║ ╚████║██║  ██╗
--    ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝


Config.JustOwnerVehicle = false        

Config.saveTrunkCommand = 'saveTrunk'
Config.savingTimer = 5 -- minutes

Config.AutoDeleteTrunk = true -- remove all trunk with not owner
Config.CommandDeleteTrunk = 'deleteTrunk'

Config.AccountTrunkName = {
    ["cash"] = 'Argents',
    ["black_money"] = 'Argents Sale', 
}

Config.WeightVehicle = {
    [0] = 200, -- Compacts  
    [1] = 300, -- Sedans
    [2] = 400, -- SUVs
    [3] = 300, -- Coupes 
    [4] = 300, -- Muscle  
    [5] = 250, -- Sports Classics  
    [6] = 250, -- Sports  
    [7] = 200, -- Super  
    [8] = 100, -- Motorcycles  
    [9] = 400, -- Off-road 
    [10] = 750, -- Industrial  
    [11] = 250, -- Utility  
    [12] = 600, -- Vans  
    [13] = 25, -- Cycles  
    [14] = 750, -- Boats  
    [15] = 750, -- Helicopters  
    [16] = 500, -- Planes  
    [17] = 250, -- Service  
    [18] = 500, -- Emergency  
    [19] = 750, -- Military  
    [20] = 750, -- Commercial  
    [21] = 750, -- Trains  
    [22] = 100, -- Open Wheel,
    SpecificVehicles = { -- Table des poids spécifiques pour certains modèles
        ["contender"] = 800,
        ["mule5"] = 1500,
        ["gbesperta"] = 2000
    }
}

Config.WeaponDefaultWeight = 5
Config.WeaponWeight = {
    ["WEAPON_NIGHTSTICK"] = 1,
    ["WEAPON_STUNGUN"] = 1,
    ["WEAPON_FLASHLIGHT"] = 1,
    ["WEAPON_ASSAULTRIFLE"] = 5,
    ["WEAPON_SMG"] = 3,
}

Config.ClothesWeight = {
    ["top"] = 0.8,
    ["pants"] = 0.5,
    ["outfit"] = 2,
    ["shoes"] = 0.5,
    ["bags"] = 1.5,
    ["glasses"] = 0.2,
    ["ears"] = 0.2,
    ["helmet"] = 0.4,
    ["bracelets"] = 0.1,
    ["watches"] = 0.1,
    ["chain"] = 0.1,
    ["mask"] = 0.4,
}

--╚════════════════════════════════════════════════════════════════════════════════╝

