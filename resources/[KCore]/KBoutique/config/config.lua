Boutique = {}

Boutique = {

    Framework = "newEsx", -- "esx" = old-esx (with trigger) / "newEsx" = new esx (export) / "standalone" = standalone
    Extended_Name = "frwk",
    getSharedObject = "esx:getSharedObject",
    Mysql = "oxmysql", -- mysql-async / ghmattimysql / oxmysql (don't forget to change in the fxmanifest)


    Name = "Kays",
 
    -- RegisterKeyMap
    CmdName = "boutique",
    DescKeyParameter = "Boutique",
    defaultMapper = "keyboard",
    KeyOpen = "F1",
    --

    GiveCmdName = "giveidboutique",

    NewArrivalCredit = 0, -- Définir le nombre de points boutique à la première connexion du joueur sur votre serveur

    TestVeh = {
        PositionStart = vector4(-899.62, -3298.74, 13.94, 58.0),
        Timer = 30,
        NotificationsStart = "~o~Vous avez 30 secondes pour tester le véhicule.",
        Notifications = {
            {time = 15, message = "~o~Il vous reste 15 secondes."},
            {time = 10, message = "~o~Il vous reste 10 secondes."},
            {time = 5, message = "~o~Il vous reste 5 secondes."},
            {time = 0, message = "~r~Vous avez terminé la période d'essai."},
        },
    },

    -- Change this to your preferred format insert plate. L = letters, N = numbers. 
    -- Example : (LLLLNNNN = AAAA1234)
    -- Example : (NNNNLLLL = 0000AAAA) 
    -- Example : (NNLL = 00AA) 
    -- look at the format of your plates in your owned_vehicles table
    PlateFormat = "LLLLNNNN",  
    TableNameVehicle = "owned_vehicles", -- votre table SQL qui stock véhicule garage

    Notifications = {
        NoCoins = "~r~Vous n'avez pas assez de crédits",
        BuyVeh = "~g~Vous avez reçu un nouveau véhicule :",
        BuyWeapon = "~g~Vous avez reçu une nouvelle arme :",
        BuyMoney = "~g~Vous avez reçu :",
        GiveCredits = {
            RefuseIfYour = "~r~Vous ne pouvez pas vous transférer de crédits sur votre propre code boutique.",
            YouHaveReceive = "Vous avez reçu",
            YouHaveReceive2 = "crédit(s) de la part de",
            TransferGood = "La transaction a été effectuée.",
            TransferProblem = "La transaction n'a pas pu être effectuée.",
        }
    },

    ArmeItem = false,

    addAccountMoney = true, -- Si vous préférez utiliser un addaccountmoney que un addMoney.
    AccountName = "bank", -- Nom de l'account ou faut ajouté l'argent
}

Boutique.Vehicles = {
    {label = "Bmw s1000rr", model = "rr01", img = "vehicles/CBR1000RRR", coins = 1500, speed = 300, seat = 2},
    {label = "Mercerdes A45", model = "a45", img = "vehicles/a45amg", coins = 1500, speed = 180, seat = 2},
    {label = "Bmw m3", model = "16m3f80", img = "vehicles/16m3f80", coins = 4000, speed = 180, seat = 4},
    {label = "Deluxo WB", model = "deluxowb", img = "vehicles/deluxowb", coins = 3500, speed = 180, seat = 4},
    {label = "Caracara 6x6", model = "caracara6x6", img = "vehicles/caracara6x6", coins = 3500, speed = 180, seat = 4},
    {label = "Relaxer", model = "relaxer", img = "vehicles/relaxer", coins = 3000, speed = 180, seat = 4},
    {label = "Granut H4", model = "h4rxgranut", img = "vehicles/h4rxgranut", coins = 2500, speed = 180, seat = 4},
    {label = "Runner CIV", model = "roadrunnerciv", img = "vehicles/roadrunnerciv", coins = 2000, speed = 180, seat = 4},
    {label = "Scheisser", model = "scheisser", img = "vehicles/scheisser", coins = 1500, speed = 180, seat = 4},
    {label = "Dom 645", model = "dom645", img = "vehicles/dom645", coins = 1500, speed = 180, seat = 4},
    {label = "ESP Executive", model = "espexecutive", img = "vehicles/espexecutive", coins = 1500, speed = 180, seat = 4},
    {label = "Mule", model = "mule5", img = "vehicles/mule5", coins = 1000, speed = 180, seat = 4},
}

Boutique.Weapons = {
    {label = "Ak-47", name = "weapon_assaultrifle", img = "weapons/weapon_assaultrifle", coins = 4500},
    {label = "Arme de défense personnelle", name = "weapon_combatpdw", img = "weapons/weapon_combatpdw", coins = 3750},
    {label = "Glock-17", name = "weapon_g17gen5", img = "weapons/weapon_g17gen5", coins = 1750},
    {label = "Katana", name = "weapon_katana", img = "weapons/weapon_katana", coins = 750},
}

Boutique.Money = {
    {label = "Pack Argent 250.000$", count = 250000, img = "money/money1", coins = 1000},
    {label = "Pack Argent 500.000$", count = 500000, img = "money/money2", coins = 1950},
    {label = "Pack Argent 1.000.000$", count = 1000000, img = "money/money3", coins = 2800},
    {label = "Pack Argent 5.000.000$", count = 5000000, img = "money/money5", coins = 13000},
    {label = "Pack Argent 10.000.000$", count = 10000000, img = "money/money4", coins = 25000},
    {label = "Création d'entreprise (Ticket discord)", count = 1, img = "packentreprise", coins = 9500},
    {label = "Création organisation ou gang (Ticket discord)", count = 2, img = "packorga", coins = 7500},
    {label = "Importation d'un véhicule (Ticket discord)", count = 3, img = "packvehimport", coins = 20000},
    {label = "Achat d'une Villa (Ticket discord)", count = 4, img = "packvilla", coins = 12000},
}

Boutique.Tebex = {
    {label = "500 Coins", img = "coins/1", price = 6, link = "#"},
    {label = "1.000 Coins", img = "coins/2", price = 12, link = "#"},
    {label = "1.500 Coins", img = "coins/3", price = 18, link = "#"},
    {label = "2.000 Coins", img = "coins/4", price = 24, link = "#"},
    {label = "3.500 (+200) Coins", img = "coins/5", price = 42, link = "#"},
    {label = "5.000 (+500) Coins", img = "coins/6", price = 60, link = "#"},
    {label = "7.500 (+700) Coins", img = "coins/7", price = 90, link = "#"},
    {label = "10.000 (+2000) Coins", img = "coins/8", price = 120, link = "#"},
    {label = "20.000 (+6000) Coins", img = "coins/9", price = 240, link = "#"},
}


-------------- Type of loot --------------

-- "Vehicle" -- 
-- "Weapon" --
-- "Coin" --
-- "Money" --

Boutique.Cases = {

    {
        label = "Diamond", 
        coins = 1000, 
        img = "lootbox/blue", 
        gains = {
            ----ULTIME----
            {label = "Velum", item = "velum", img = "vehicles/velum", type = "Vehicle", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 1000},
            {label = "FN-509", item = "WEAPON_FN509", img = "weapons/weapon_FN509", type = "Weapon", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 1000},
            {label = "Honey Badger COD", item = "WEAPON_HONEYBADGERCOD", img = "weapons/weapon_honeybadgercod", type = "Weapon", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 1000},
            {label = "Thrax D", item = "thraxd", img = "vehicles/thraxd", type = "Vehicle", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 1000},
        
            ----LÉGENDAIRE----
            {label = "350.000$", item = 350000, img = "money/money2", type = "Money", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 0},
            {label = "Baller STD", item = "SSG_BallerSTD", img = "vehicles/SSG_BallerSTD", type = "Vehicle", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 750},

            ----RARE----
            {label = "Dubsta G", item = "dubstag", img = "vehicles/dubstag", type = "Vehicle", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 500},
            {label = "Dominator TF", item = "tfdominator", img = "vehicles/tfdominator", type = "Vehicle", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 500},
            
            ----COMMUN----
            {label = "Hâche", item = "WEAPON_FIREAXE", img = "weapons/weapon_fireaxe", type = "Weapon", typeLabel = '<p style="color: #69db7c;">Commun</p>', chance = 40, sell = 250},
            {label = "Orac", item = "jd_oraclev12", img = "vehicles/jd_oraclev12", type = "Vehicle", typeLabel = '<p style="color: #69db7c;">Commun</p>', chance = 40, sell = 250},
            {label = "150.000$", item = 150000, img = "money/money1", type = "Money", typeLabel = '<p style="color: #69db7c;">Commun</p>', chance = 40, sell = 0},  
            {label = "Odyssey", item = "odyssey", img = "vehicles/odyssey", type = "Vehicle", typeLabel = '<p style="color: #69db7c;">Commun</p>', chance = 40, sell = 250},
            {label = "AJ WAR", item = "ajwar", img = "vehicles/ajwar", type = "Vehicle", typeLabel = '<p style="color: #69db7c;">Commun</p>', chance = 40, sell = 250},
        }
    },

    {
        label = "Caisse Ruby", 
        coins = 2000,
        img = "lootbox/red", 
        gains = {
            ----ULTIME----
            {label = "Luxor", item = "luxor", img = "vehicles/luxor", type = "Vehicle", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 2000},
            {label = "1750 Tokens", item = 1750, img = "coins", type = "Coin", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 1750},
            {label = "HK-UMP 45", item = "WEAPON_HKUMP", img = "weapons/weapon_HKUMP", type = "Weapon", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 2000},
            {label = "Comet SCW", item = "comet6scw", img = "vehicles/comet6scw", type = "Vehicle", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 2000},
            {label = "Buzzard", item = "buzzard2", img = "vehicles/buzzard", type = "Vehicle", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 2000},
            {label = "DOUBLE BARREL", item = "weapon_dbshotgun", img = "weapons/WEAPON_DOUBLEBARRELFM", type = "Weapon", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 2000},
            
            ----LÉGENDAIRE----
            {label = "Mesa XL", item = "mesaxl", img = "vehicles/mesaxl", type = "Vehicle", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 1500},
            {label = "750.000$", item = 750000, img = "money/money5", type = "Money", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 0},
            {label = "Faux", item = "weapon_scythe", img = "weapons/weapon_scythe", type = "item", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 1500},

            ----RARE----
            {label = "1000 Tokens", item = 1000, img = "coins", type = "Coin", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 1000},
            {label = "500.000$", item = 500000, img = "money/money3", type = "Money", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 0},
            {label = "Astron C", item = "astronc", img = "vehicles/astronc", type = "Vehicle", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 1000},

            ----COMMUN----
            {label = "Manchez BW", item = "manchezbw", img = "vehicles/manchezbw", type = "Vehicle", typeLabel = '<p style="color: #69db7c;">Commun</p>', chance = 40, sell = 500},
        }
    },

    {
        label = "Caisse Prestige", 
        coins = 3000,
        img = "lootbox/silver", 
        gains = {
            ----ULTIME----
            {label = "Tempesta ES", item = "tempestaes", img = "vehicles/tempestaes", type = "Vehicle", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 3000},
            {label = "MCX Spear", item = "WEAPON_MCXSPEAR", img = "weapons/weapon_MCXSPEAR", type = "Weapon", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 3000},
            {label = "AKS-74U", item = "WEAPON_AKS74U", img = "weapons/weapon_aks74u", type = "Weapon", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 3000},
            {label = "Supervolito", item = "supervolito2", img = "vehicles/supervolito2", type = "Vehicle", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 3000},    

            ----LÉGENDAIRE----
            {label = "1.000.000$", item = 1000000, img = "money/money5", type = "Money", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 2250},
            {label = "Glock-17 Néo-Noir", item = "WEAPON_G17NEONOIR", img = "weapons/weapon_g17neonoir", type = "Weapon", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 2250},
            {label = "Mantis", item = "mantis", img = "vehicles/mantis", type = "Vehicle", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 2250},

            ----RARE----
            {label = "1500 Tokens", item = 1500, img = "coins", type = "Coin", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 1500},
            {label = "750.000$", item = 750000, img = "money/money3", type = "Money", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 0},
            {label = "Hoonie", item = "hoonie", img = "vehicles/hoonie", type = "Vehicle", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 1500},


            ----COMMUN----
            {label = "Issi 8S", item = "issi8s", img = "vehicles/issi8s", type = "Vehicle", typeLabel = '<p style="color: #69db7c;">Commun</p>', chance = 40, sell = 750},
            {label = "Shino", item = "shinobiold", img = "vehicles/shinobiold", type = "Vehicle", typeLabel = '<p style="color: #69db7c;">Commun</p>', chance = 40, sell = 750},
        }
    },

    {
        label = "Caisse Élite", 
        coins = 4000,
        img = "lootbox/gold", 
        gains = {
            ----ULTIME----
            {label = "AWP Redline", item = "weapon_awpredline", img = "weapons/WEAPON_SCAR17FM", type = "item", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 4000},
            {label = "SCAR-17", item = "weapon_SCAR17FM", img = "weapons/WEAPON_SCAR17FM", type = "item", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 4000},
            {label = "Torero XOC", item = "toreroxoc", img = "vehicles/toreroxoc", type = "Vehicle", typeLabel = '<p style="color: #c92a2a;">Ultime</p>', chance = 5, sell = 4000},
            
            ----LÉGENDAIRE----
            {label = "Revolver DA", item = "WEAPON_DOUBLEACTION", img = "weapons/WEAPON_DOUBLEACTION", type = "Weapon", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 3000},
            {label = "Jugurest", item = "jugularest", img = "vehicles/jugularest", type = "Vehicle", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 3000},
            {label = "2500 Tokens", item = 2500, img = "coins", type = "Coin", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 1500},

            ----RARE----
            {label = "1.000.000$", item = 1000000, img = "money/money5", type = "Money", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 0},
            {label = "Riata N", item = "nriata", img = "vehicles/nriata", type = "Vehicle", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 2000},
            {label = "Dominator 9S", item = "dominator9s", img = "vehicles/dominator9s", type = "Vehicle", typeLabel = '<p style="color: #339af0;">Rare</p>', chance = 35, sell = 2000},

            ----COMMUN----
            {label = "Peacemaker", item = "peacemaker", img = "vehicles/peacemaker", type = "Vehicle", typeLabel = '<p style="color: #69db7c;">Commun</p>', chance = 40, sell = 1000},
            {label = "500.000$", item = 500000, img = "money/money5", type = "Money", typeLabel = '<p style="color: #fcc419;">Légendaire</p>', chance = 20, sell = 0},
        }
    },
}