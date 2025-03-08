Statut = {}

Statut.StatusMax = 1000000
Statut.TickTime = 5000
Statut.UpdateInterval = 35000

kayscoreConfigServ = {

    ------ BASIC-------
    IpLock = "Kay",
    ServerName = 'Kays',
    Discord = "https://discord.gg/V9YdK339MY",
    Reglement = "https://discord.gg/V9YdK339MY",
    CfxConnect = "...",
    LogoUrl = "https://i.ibb.co/FqdDjjBh/blanc.png",
    Boutique = "https://discord.gg/overfa",
    Slots = 300,
    Emojie = "⭐",

    ------ COLOR ------
    R = 0,
    G = 64,
    B = 255,
    A = 255, 
    GTACOLOR = "~b~",

    -- ~r~ = Rouge
    -- ~b~ = Bleu
    -- ~g~ = Vert
    -- ~y~ = Jaune
    -- ~p~ = Violet
    -- ~c~ = Vert
    -- ~m~ = Gris foncé
    -- ~u~ = Noir
    -- ~o~ = Orange Spécial:
    -- ~n~ = Nouvelle Ligne
    -- ~s~ = Réinitialiser la couleur
    -- ~h~ = Texte en gras

    ------ RAGEUI CONFIG ------
    BannerMenu = "https://i.ibb.co/rKQC72cd/BANNNNKAYS.png",
    BannerButton = "https://i.ibb.co/L1zYX1m/gradient-nav.png",
    RageUI = {

        IgEdit = false, ----- MODIF DU MENU IG
    },

    ------- RICH PRESENCE ------
    -- https://discord.com/developers/applications
    AppId = 1262599472131870741,
    Asset1 = "principal",
    Asset2 = "principal",
    Text = "Rejoins nous !",

    ------- LAISSER VIDE CACHE DES PLAYERS -------
    player = {

    },

    ------ PREFECTURE ------
    PosPrefecture = vec3(-555.6092, -602.8915, 34.6823),

    ------ LEBONCOIN -------
    PosLeboncoin = vector3(-313.849365, -1034.999146, 30.530506),

    ------ VEHICLE / GARAGES ------
    Vehicules = {
        --Pas toucher--
    },

    ------ ROCKSTAR EDITOR ------
    RockstarEditor = {
        Command = "rec",
    },

    ------ DEV OPTIONS ------
    DevOptions = {
        CoordsCMD = "coords",
        CoordsJsonCMD = "coordsJson",
        CoordsHCMD = "h",
    },

    ------ ASCENSEUR / ACCEUIL ------
    Elevator = {
        positions = {
        -- ne pas ajouter merci !
        },
    
        acceuil = {
            pos = {
                ['SASP'] = {
                    pos = vec3(-1101.0952, -838.1991, 19.3209),
                    message = 'Un personnel de la LSPD est attendu à l\'accueil',
                    job = 'police',
                    label = 'SASP'

                },
                ['bcso'] = {
                    pos = vector3(-446.5594, 6012.762, 31.70),
                    message = 'Un personnel de la bcso est attendu à l\'accueil',
                    job = 'bcso',
                    label = 'BCSO'
                },
                ['EMS'] = {
                    pos = vec3(297.246124, -587.809570, 43.260838),
                    message = 'Un personnel des EMS est attendu à l\'accueil',
                    job = 'ambulance',
                    label = 'EMS'
                },
                ['BurgerShot'] = {
                    pos = vec3(-1179.471436, -887.196167, 13.887445),
                    message = 'Un personnel du BurgerShot est attendu à l\'accueil',
                    job = 'burgershot',
                    label = 'Burgershot'
                },
                ['Concessionnaire Moto'] = {
                    pos = vec3(1233.294800, 2721.875977, 38.092491),
                    message = 'Un personnel du Concessionnaire Moto est attendu à l\'accueil',
                    job = 'motodealer',
                    label = 'Concessionnaire moto'
                },
                ['le_ferailleur'] = {
                    pos = vec3(-612.280029, -1609.057861, 26.899340),
                    message = 'Un personnel du Roger Salvage et Scrap est attendu à l\'accueil',
                    job = 'le_ferailleur',
                    label = 'Roger Salvage et Scrap'
                },
                ['gouvernement'] = {
                    pos = vec3(-545.788513, -205.526642, 38.217331),
                    message = 'Un personnel du Gouvernement est attendu à l\'accueil',
                    job = 'gouvernement',
                    label = 'Gouvernement'
                },
                ['cardealer'] = {
                    pos = vec3(-36.6355, -1086.8293, 27.2744),
                    message = 'Un personnel du Concessionnaire Automobile est attendu à l\'accueil',
                    job = 'cardealer',
                    label = 'Concessionnaire Automobile'
                },
                ['vigne'] = {
                    pos = vec3(-1888.386475, 2050.343262, 140.983704),
                    message = 'Un personnel du Vigneron est attendu à l\'accueil',
                    job = 'vigne',
                    label = 'Vigneron'
                },
                ['mecano'] = {
                    pos = vec3(-232.715073, -1318.416992, 31.296535),
                    message = "Un personnel du Benny's est attendu à l'accueil",
                    job = 'mecano',
                    label = "Benny's"
                },
                ['unicorn'] = {
                    pos = vec3(131.201294, -1298.341797, 29.232746),
                    message = "Un personnel de l'Unicorn est attendu à l'accueil",
                    job = 'unicorn',
                    label = "Unicorn"
                },
                ['lscustom'] = {
                    pos = vec3(868.8140, -2109.7051, 30.4732),
                    message = "Un personnel du EAST Custom est attendu à l'accueil",
                    job = 'lscustom',
                    label = "EAST Custom"
                },
                ['airdealer'] = {
                    pos = vec3(-950.423889, -2957.971191, 13.945072),
                    message = "Un personnel du Concessionnaire Aérien est attendu à l'accueil",
                    job = 'airdealer',
                    label = "Concessionnaire Aérien"
                },
                ['boatdealer'] = {
                    pos = vec3(-817.737793, -1347.739380, 5.150358),
                    message = "Un personnel du Concessionnaire Bateau est attendu à l'accueil",
                    job = 'boatdealer',
                    label = "Concessionnaire Bateau"
                },
                ['taxi'] = {
                    pos = vec3(905.543823, -165.245789, 74.104179),
                    message = "Un personnel du Taxi est attendu à l'accueil",
                    job = 'taxi',
                    label = "Taxi"
                },
                ['realestateagent'] = {
                    pos = vec3(-138.613388, -625.116394, 168.820312),
                    message = "Un personnel de l'agence Immobiliére est attendu à l'accueil",
                    job = 'realestateagent',
                    label = "Agence Immobiliére"
                },
                ['weazelnews'] = {
                    pos = vec3(-599.091980, -933.489990, 23.864485),
                    message = "Un personnel du Weazel News est attendu à l'accueil",
                    job = 'weazelnews',
                    label = "Weazel News"
                },
                ['bcso'] = {
                    pos = vec3(-436.276642, 6013.203613, 32.271370),
                    message = "Un personnel du BCSO est attendu à l'accueil",
                    job = 'bcso',
                    label = "BCSO"
                },
            },
            cooldown = false
        },
    },


    ------ PERM WEAPON / ITEM -----


    PermanentItem = {
        ['caisse_gold'] = true,
        ['caisse_diamond'] = true,
        ['caisse_ruby'] = true,
        ['caisse_fidelite'] = true,
        ['caisse_noel'] = true,
        ['jetoncustom'] = true,
        ['idcard'] = true,
        ['caisse_vehicule'] = true,
    },

    RemoveWeaponOnRespawn = false, --@Sa supprime les armes sauf les armes perms quand respawn ems avec % de chande
    RemoveIllegalItemsOnRespawn = true, --@Sa supprime les item dans la liste IllégalItem lign149 quand respawn ems avec % de chande
    IllegalItem = { --@remove quand respawn ems avec % de chance
        ['bijoux'] = true,
        ['cagoule'] = true,
        ['coke'] = true,
        ['coke_pooch'] = true,
        ['diamond'] = true,
        ['drill'] = true,
        ['gold'] = true,
        ['jewels'] = true,
        ['kevlar'] = true,
        ['lockpick'] = true,
        ['meth'] = true,
        ['meth_pooch'] = true,
        ['opium'] = true,
        ['opium_pooch'] = true,
        ['usbhacked'] = true,
        ['weed'] = true,
        ['weed_pooch'] = true,
        ['haschich'] = true,
        ['haschich_pooch'] = true,
        ['hashish'] = true,
        ['hashish_pooch'] = true,
        ['ciseaux'] = true,
        ['caisse'] = true,
        ['nitrovehicle'] = true,
        ['oblivionPill'] = true,
        ['jumelles'] = true,
    },

    PermanantWeapon = { --@Impossible a remove de l'inventaire mais aprés un wype il se delete pour l'instant
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


    },

    BlackListItem = { --@Impossible a vendre au Leboncoin
        ['bijoux'] = true,
        ['cagoule'] = true,
        ['coke'] = true,
        ['coke_pooch'] = true,
        ['diamond'] = true,
        ['drill'] = true,
        ['gold'] = true,
        ['jewels'] = true,
        ['kevlar'] = true,
        ['lockpick'] = true,
        ['meth'] = true,
        ['meth_pooch'] = true,
        ['opium'] = true,
        ['opium_pooch'] = true,
        ['usbhacked'] = true,
        ['weed'] = true,
        ['weed_pooch'] = true,
        ['haschich'] = true,
        ['haschich_pooch'] = true,
        ['hashish'] = true,
        ['hashish_pooch'] = true,
        ['ciseaux'] = true,
        ['caisse'] = true,
        ['nitrovehicle'] = true,
        ['oblivionPill'] = true,
        ['jumelles'] = true,
        ['caisse_gold'] = true,
        ['caisse_diamond'] = true,
        ['caisse_ruby'] = true,
        ['caisse_fidelite'] = true,
        ['caisse_noel'] = true,
        ['jetoncustom'] = true,
        ['idcard'] = true,
        ['caisse_vehicule'] = true,
    },

    ------ XP SYSTEM ------
    XpSystems = {
        Command = 'XpStats',
        Touche = 'Y',
        Wait = 60*1000*15,
        KickMessage = "Désynchronisation avec le serveur ou detection de Cheat", ---- IF CHEAT
        ToucheDesactiver = {  ---- TOUCHE A DESACTIVER SI PAS LE NIVEAU
            {
                group = 2,
                key = 37,
                message = 'Vous n\'avez pas le niveau nécéssaire.'
            },
             {
                group = 0,
                key = 24,
                message = 'Vous n\'avez pas le niveau nécéssaire.'
            }, 
            {
                group = 0,
                key = 69,
                message = 'Vous n\'avez pas le niveau nécéssaire.'
            }, 
            {
                group = 0,
                key = 92,
                message = 'Vous n\'avez pas le niveau nécéssaire.'
            }, 
            {
                group = 0,
                key = 106,
                message = 'Vous n\'avez pas le niveau nécéssaire.'
            }, 
            {
                group = 0,
                key = 160,
                message = 'Vous n\'avez pas le niveau nécéssaire.'
            }, 
            {
                group = 0,
                key = 45,
                message = 'Vous n\'avez pas le niveau nécéssaire.'
            }, 
            {
                group = 0,
                key = 80,
                message = 'Vous n\'avez pas le niveau nécéssaire.'
            },
            {
                group = 0,
                key = 140,
                message = 'Vous n\'avez pas le niveau nécéssaire.'
            },
            {
                group = 0,
                key = 250,
                message = 'Vous n\'avez pas le niveau nécéssaire.'
            },
            {
                group = 0,
                key = 263,
                message = 'Vous n\'avez pas le niveau nécéssaire.'
            },
            {
                group = 0,
                key = 363,
                message = 'Vous n\'avez pas le niveau nécéssaire.'
            },
            {
                group = 0,
                key = 168,
                message = 'Vous n\'avez pas le niveau nécéssaire.'
            },
        },
    },

    ----- JOB POUR PLAQUER AU SOL -----
    Plaquage = {
        Command = "tacle",
        Touche = ")",
        CheatMessage = "Désynchronisation avec le serveur ou Detection de Cheat",
        whielistJobs = {
            ['police'] = true,
            ['bcso'] = true,
        },
    },

    ------ KEVLAR ------
    eKevlar = {
        loadClothesEvent = 'skinchanger:loadClothes',
        ragdollOnKevlarBreak = true,
        radgollTime = 2, -- in seconds
        skin = {
            male = {
                kevID = 12,
                textureID = 1,
            },
            female = {
                kevID = 12,
                textureID = 1,
            }
        },
        BanAction = function(src)
            DropPlayer(src, "Cheat Kevlar")
        end,
        Translation = {
            KevlarBroken = 'Votre Kevlar s\'est briser.',
        },
    },

    ------ Teleports ------
    Teleporters = {
        ['Traitement Coke'] = {
            ['Job'] = 'none',
            ['Enter'] = { 
                ['x'] = -353.4348,
                ['y'] = -2265.296,
                ['z'] =  6.608184,
                ['Information'] = '[E] Pour Entrer'
            },
    
            ['Exit'] = {
                ['x'] = 1088.65, 
                ['y'] = -3187.69, 
                ['z'] = -40.0,
                ['Information'] = '[E] Pour Sortir' 
            }
        },
        ['Récolte - Traitement Weed'] = {
            ['Job'] = 'none',
            ['Enter'] = { 
                ['x'] = 1754.29, 
                ['y'] = -1649.156, 
                ['z'] = 111.6555,
                ['Information'] = '[E] Pour Entrer' 
            },
    
            ['Exit'] = {
                ['x'] = 1066.14, 
                ['y'] = -3183.42, 
                ['z'] = -40.20,
                ['Information'] = '[E] Pour Sortir' 
            }
        },
        ['TPzonePC'] = {
            ['Job'] = 'none',
            ['Enter'] = { 
                ['x'] = 0, 
                ['y'] = 0, 
                ['z'] = -1.8,
                ['Information'] = '[E] Pour aller au PC'
            },
    
            ['Exit'] = {
                ['x'] = 225.192, 
                ['y'] = -786.342, 
                ['z'] = 21.899,
                ['Information'] = '' 
            }
        },
        ['agentimmo'] = {
            ['Job'] = 'none',
            ['Enter'] = { 
                ['x'] = -198.913,
                ['y'] = -574.988, 
                ['z'] = 39.489,
                ['Information'] = '[E] Pour monter dans le Bureau'
            },
    
            ['Exit'] = {
                ['x'] = -140.815, 
                ['y'] = -617.663, 
                ['z'] = 167.820,
                ['Information'] = '[E] Pour redescendre en Ville'
            },
        },
    },

    ------ ARME DANS LE DOS -----
    WeaponInBack = {
        showWeaponsInBack = false, --Afficher les armes dans le dos 
        back_bone = 24816,
        x = 0.075,
        y = -0.15,
        z = -0.02,
        x_rotation = 0.0,
        y_rotation = 165.0,
        z_rotation = 0.0,
        compatable_weapon_hashes = {
                -- Melee
                ["w_me_bat"] = -1786099057,
                ["prop_ld_jerrycan_01"] = 883325847,
                
                --- Import
                ["w_pi_Slidepistol"] = GetHashKey("WEAPON_SlidePISTOL"),
                ["w_ar_rusttempered"] = GetHashKey("WEAPON_COMPACTAK"),
                ["w_me_candyaxe"] = GetHashKey("WEAPON_CANDYAXE"),
                ["w_ar_417"] = GetHashKey("WEAPON_417"),
                ["w_sg_fortshotgun"] = GetHashKey("WEAPON_FORTSHOTGUN"),
                ["w_me_guitare"] = GetHashKey("kayscore_GUITARE"),
                ["w_ar_hellokitty"] = GetHashKey("WEAPON_HELLOKITTY"),
                ["w_me_katana"] = GetHashKey("WEAPON_katana"),
                ["w_ar_pattern"] = GetHashKey("WEAPON_PATTERN"),
                ["w_sb_gusenberg"] = GetHashKey("WEAPON_GUSPURPLE"),
                ["w_me_rainbowsmash"] = GetHashKey("WEAPON_RAINBOWSMASH"),
                ["w_sr_rgxoperator"] = GetHashKey("WEAPON_RGXOPERATOR"),
                ["w_ar_specialcarbine"] = GetHashKey("WEAPON_SCARH"),
                ["w_sb_smgSlide"] = GetHashKey("WEAPON_SMGSlide"),
                ["w_pi_spongepistol"] = GetHashKey("WEAPON_SPONGEPISTOL"),
                ["w_me_hatchet"] = GetHashKey("WEAPON_STONE_HATCHET"),
                ["w_sb_tec9f"] = GetHashKey("WEAPON_TEC9MF"),
                ["w_predatorleoguns_carbinerifle"] = GetHashKey("WEAPON_PREDATOR"),
                ["w_me_wolfknife_01"] = GetHashKey("WEAPON_WOLFKNIFE"),
                ["w_sg_coachgun"] = GetHashKey("WEAPON_COACHGUN"),
                ["w_sb_scarsc"] = GetHashKey("WEAPON_SCARSC"),
                ["w_ar_oblivion"] = GetHashKey("WEAPON_OBLIVION"),
                ["w_sr_blackleoshop"] = GetHashKey("WEAPON_BLACKSNIPER"),
                ["w_sg_shotgunkleoshop"] = GetHashKey("WEAPON_DOUBLEBARRELFM"),
                
                -- Pistols
                ["w_pi_appistol"] = 584646201,
                ["w_pi_snspistol"] = GetHashKey("weapon_snspistol_mk2"),
                ["w_pi_ceramic"] = 727643628,
                ["w_pi_combatpistol"] = 1593441988,
                ["w_pi_pistol"] = 453432689,
                ["w_pi_pistolmk2"] = GetHashKey("WEAPON_PISTOL_MK2"),
                ["w_pi_snspistol"] = -1076751822,
                ["w_pi_vintagepistol"] = 137902532,
                -- Assault Rifles
                ["w_ar_assaultrifle"] = -1074790547,
                ["w_ar_assaultriflemk2"] = GetHashKey("WEAPON_ASSAULTRIFLE_MK2"),
                ["w_ar_bullpuprifle"] = 2132975508,
                ["w_ar_carbinerifle"] = -2084633992,
                ["w_ar_specialcarbine"] = -1063057011,
                -- Submachine Guns
                ["w_sb_assaultsmg"] = -270015777,
                ["w_sb_microsmg"] = 324215364,
                ["w_sb_smg"] = 736523883,
                ["w_sb_smgmk2"] = GetHashKey("WEAPON_SMG_MK2"),
                ["w_sb_gusenberg"] = 1627465347,
                -- Sniper Rifles
                ["w_sr_heavysniper"] = 205991906,
                ["w_sr_sniperrifle"] = 100416529,
                ["w_sr_marksmanrifle"] = -952879014,
                ["w_sr_heavysnipermk2"] = GetHashKey("WEAPON_HEAVYSNIPER_MK2"),
                -- Shotguns
                ["w_sg_assaultshotgun"] = -494615257,
                ["w_sg_bullpupshotgun"] = -1654528753,
                ["w_sg_heavyshotgun"] = GetHashKey("WEAPON_HEAVYSHOTGUN"),
                ["w_sg_pumpshotgun"] = 487013001,
                ["w_sg_sawnoff"] = 2017895192,
                -- Machine Guns
                ["w_mg_combatmg"] = -1660422300,
                ["w_mg_mg"] = -1660422300,
                ["w_mg_combatmgmk2"] = GetHashKey("WEAPON_COMBATMG_MK2"),
                ["w_mg_mini"] = 1119849093,
                -- Launchers
                ["w_lr_firework"] = 2138347493,
                ["w_lr_homing"] = 1672152130,
                ["w_lr_grenadelauncher"] = -1568386805,
                ["w_lr_rpg"] = -1312131151,
        },
    },

    ------ PILE OU FACE ------
    PileOuFace = {
        Command = "pileouface",
        TextPile = "🏛️ Pile",
        TextFace = "🤠 Face",
    },



    ------ LEGAL SHOP ------
    LegalShops = {
        SuperMarket = vector3(2749.335, 3475.938, 55.67358),
    },

    ------ ILLEGAL SHOP -----
    IllegalShops = {
        Pos = vector3(707.202026, -966.990112, 30.412848),
    },

    ------ FISHING -------
    Fishing = {
        marketPosition = vec3(-1593.081177, 5202.908691, 4.310093),
        PosShop = vec3(-1592.345215, 5203.228516, 4.310093),
        PosSell = vector3(-1845.48, -1196.176, 19.18414),
        fishList = {
    
            permit = {
                {name = 'douce', label = 'Eau Douce', price = 15000, type = 'fishing_douce'},
                {name = 'mer', label = 'Eau de Mer', price = 18000, type = 'fishing_mer'},
                {name = 'ocean', label = 'Eau Profonde', price = 21000, type = 'fishing_ocean'},
            },
    
            informations = {
                Instructions = {
                    {title = 'Fonctionnement canne à pêche', subtitle = '(E) pour mouliner (A) pour laisser partir le poisson. Il faut prendre en compte qu\'après un certain délai passé sans faire remonter le poisson accroché à l\'hameçon, il s\'échappera.'},
                    {title = 'Fonctionnement de l\'interface', subtitle = 'Vous avez un affichage qui apparait sur votre personnage pour vous dire quand vous devez mouliner.'},
                    {title = 'Fonctionnement des zones', subtitle = 'Dans l\'activité de pêche, vous avez trois zones nommées: Eau de Mer/Eau Douce/Eau Profonde. Pour chacune de ces trois zones, il y a un appât bien spécifique à utiliser, sinon vous ne pourrez pas pêcher. Cet hameçon est à acheter au magasin de pêche.'},
                    {title = 'Fonctionnement de la vente', subtitle = 'Pour vendre les poissons que vous avez récoltés, vous avez un restaurant sur votre carte qui vous achètera les poissons.'}
                }
            },
    
            FishList = {
                ['douce'] = {
                    {label = 'Poisson Chat', name = 'poissonchat', price = 500, rarity = 8/20, moulinage = 5},
                    {label = 'Carassin', name = 'carassin', price = 1500, rarity = 8/20, moulinage = 6},
                    {label = 'Carpe commune', name = 'carpecommune', price = 1500, rarity = 6/20, moulinage = 7},
                    {label = 'Carpe miroir', name = 'carpemiroir', price = 2000, rarity = 5/20, moulinage = 8},
                    {label = 'Carpe koï', name = 'carpekoi', price = 2500, rarity = 3/20, moulinage = 9},
                    {label = 'Silure', name = 'silure', price = 3000, rarity = 1/20, moulinage = 11},
                },
                ['mer'] = {
                    {label = 'Anchois', name = 'anchois', price = 1000, rarity = 8/20, moulinage = 5},
                    {label = 'Éperlant', name = 'eperlant', price = 2500, rarity = 8/20, moulinage = 6},
                    {label = 'Hareng', name = 'hareng', price = 2000, rarity = 6/20, moulinage = 7},
                    {label = 'Bar', name = 'bar', price = 2500, rarity = 5/20, moulinage = 8},
                    {label = 'Cabillaud', name = 'cabillaud', price = 3000, rarity = 3/20, moulinage = 9},
                    {label = 'Dorade', name = 'dorade', price = 5000, rarity = 2/20, moulinage = 11},
                },
                ['ocean'] = {
                    {label = 'Sardine', name = 'sardine', price = 1500, rarity = 8/20, moulinage = 5},
                    {label = 'Thon', name = 'thon', price = 2000, rarity = 8/20, moulinage = 6},
                    {label = 'Saumon', name = 'saumon', price = 2500, rarity = 6/20, moulinage = 7},
                    {label = 'Sole', name = 'sole', price = 3000, rarity = 5/20, moulinage = 8},
                    {label = 'Raie', name = 'raie', price = 7500, rarity = 3/20, moulinage = 9},
                    {label = 'Requin', name = 'requin', price = 15000, rarity = 0.3/20, moulinage = 11},
                }
            },
    
            FishingRod = {
                {name = 'canneapeche', label = 'Canne à Pêche', price = 2500, boost = 0, boutique = false, fish = 25},
                {name = 'canneapechecarbonne', label = 'Canne à Pêche en carbone', price = 10000, boost = 2, boutique = false, fish = 50},
                {name = 'canneapecheoretcarbonne', label = 'Canne à Pêche alliage Or et Carbone', price = 3500, boost = 5, boutique = true, fish = 850}
            },
    
            FishingLures = {
                ['douce'] = {
                    name = 'douce_lures', label = 'Appât d\'Eau Douce', price = 1000,
                },
                ['mer'] = {
                    name = 'mer_lures', label = 'Appât d\'Eau de Mer', price = 2000,
                },
                ['ocean'] = {
                    name = 'ocean_lures', label = 'Appât d\'Eau Profonde', price = 3000,
                }
            },
    
            Zones = {
                ['douce'] = {
                    {zone = 'Zone de Pêche (Eau Douce)', position = vector3(1300.12, 4219.472, 33.9087), radius = 1000.0, color = 25},
                    {zone = 'Zone de Pêche (Eau Douce)', position = vector3(-2074.348, 2592.319, -0.4747142), radius = 1000.0, color = 25},
                },
                ['mer'] = {
                    {zone = 'Zone de Pêche (Eau de Mer)', position = vector3(2840.631, -725.8387, 1.089922), radius = 1000.0, color = 63},
                    {zone = 'Zone de Pêche (Eau de Mer)', position = vector3(-3209.05, 473.6197, 5.951783), radius = 1000.0, color = 63},
                    {zone = 'Zone de Pêche (Eau de Mer)', position = vector3(-3428.132, 968.2304, 8.346698), radius = 1000.0, color = 63},
                },
                ['ocean'] = {
                    {zone = 'Zone de Pêche (Eau Profonde)', position = vector3(-722.5606, 7102.517, 6.2777), radius = 1000.0, color = 78},
                    {zone = 'Zone de Pêche (Eau Profonde)', position = vector3(993.8589, 7485.11, 3.306886), radius = 1000.0, color = 78},
                    {zone = 'Zone de Pêche (Eau Profonde)', position = vector3(4856.959, 4986.772, 4.037685), radius = 1000.0, color = 78},
                }
            },
    
            IsFishing = false,
            Lures = false
        }
    },




    ---------- AUTO ECOLE ---------
    ConfigAutoEcole = {
        Pos = vector3(214.7519, -1398.438, 30.58354),
        PositionCode = { x = 214.7519, y = -1398.438, z = 30.58354 },
        PositionCodePed = { x = 214.0132, y = -1399.648, z = 29.69364, h = 330.0},
        PrixCode = 800,
        PrixPermisVoiture = 2500,
        PrixPermisMoto = 2300,
        PrixPermisCamion = 2800,
        timer = 180,

        MaxErrors       = 5,
        SpeedMultiplier = 3.6,
    
        VehicleModels = {
            drive       = 'sultan',
            drive_bike  = 'bati',
            drive_truck = 'mule'
        },
    
        SpeedLimits = {
            residence = 50,
            town      = 80,
            freeway   = 120
        },
    
        Zones = {
            VehicleSpawnPoint = {
                Pos   = {x = 249.409, y = -1407.230, z = 30.4094, h = 317.0},
                Size  = {x = 1.5, y = 1.5, z = 1.0},
                Color = {r = 204, g = 204, b = 0},
                Type  = -1
            }
        },
    
        CheckPoints = {
            {
                Pos = {x = 255.139, y = -1400.731, z = 29.537},
                Action = function(playerPed, vehicle, setCurrentZoneType)
                    DrawMissionText(("Allez vers le prochain passage! Vitesse limite: ~y~%s~s~ km/h"):format(kayscoreConfigServ.ConfigAutoEcole.SpeedLimits['residence']), 5000)
                end
            },
            {
                Pos = {x = 271.874, y = -1370.574, z = 30.932},
                Action = function(playerPed, vehicle, setCurrentZoneType)
                    DrawMissionText("Allez vers le prochain passage!", 5000)
                end
            },
            {
                Pos = {x = 234.907, y = -1345.385, z = 29.542},
                Action = function(playerPed, vehicle, setCurrentZoneType)
                    Citizen.CreateThread(function()
                        DrawMissionText("Faite rapidement un ~r~stop~s~ pour le piéton qui ~y~traverse", 5000)
                        PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
                        FreezeEntityPosition(vehicle, true)
                        Citizen.Wait(4000)
                        FreezeEntityPosition(vehicle, false)
                        DrawMissionText("~g~Bien!~s~ continuons!", 5000)
                    end)
                end
            },
            {
                Pos = {x = 217.821, y = -1410.520, z = 28.292},
                Action = function(playerPed, vehicle, setCurrentZoneType)
                    setCurrentZoneType('town')
                    Citizen.CreateThread(function()
                        DrawMissionText(("Marquer rapidement un ~r~stop~s~ et regardez à votre ~y~gauche~s~. Vitesse limite: ~y~%s~s~ km/h"):format(kayscoreConfigServ.ConfigAutoEcole.SpeedLimits['town']), 5000)
                        PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
                        FreezeEntityPosition(vehicle, true)
                        Citizen.Wait(6000)
                        FreezeEntityPosition(vehicle, false)
                        DrawMissionText("~g~Bien!~s~ prenez à ~y~droite~s~ et suivez votre file", 5000)
                    end)
                end
            },
            {
                Pos = {x = 179.1223, y = -1402.097, z = 27.7344},
                Action = function(playerPed, vehicle, setCurrentZoneType)
                    DrawMissionText("Marquez le stop pour laisser passer les véhicules!", 5000)
                    PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
                    FreezeEntityPosition(vehicle, true)
                    Citizen.Wait(6000)
                    FreezeEntityPosition(vehicle, false)
                end
            },
            {
                Pos = {x = 116.9352, y = -1356.415, z = 27.66045},
                Action = function(playerPed, vehicle, setCurrentZoneType)
                    DrawMissionText("Allez vers le prochain passage!", 5000)
                end
            },
            {
                Pos = {x = 116.9352, y = -1356.415, z = 27.66045},
                Action = function(playerPed, vehicle, setCurrentZoneType)
                    DrawMissionText("Prenez sur la droite, attention vous allez arrivez sur l'autoroute", 5000)
                end
            },
            {
                Pos = {x = 174.3761, y = -1242.414, z = 36.70127},
                Action = function(playerPed, vehicle, setCurrentZoneType)
                    setCurrentZoneType('freeway')
                    DrawMissionText(("Il est temps d'aller sur la rocade! Vitesse limite: ~y~%s~s~ km/h"):format(kayscoreConfigServ.ConfigAutoEcole.SpeedLimits['freeway']), 5000)
                    PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
                end
            },
            {
                Pos = {x = 633.1151, y = -1242.858, z = 39.84327},
                Action = function(playerPed, vehicle, setCurrentZoneType)
                    DrawMissionText("Vous sortez de l'autoroute, réduisez votre vitesse à 80 km/h", 5000)
                end
            },
            {
                Pos = {x = 776.1666, y = -1239.46, z = 26.13107},
                Action = function(playerPed, vehicle, setCurrentZoneType)
                    setCurrentZoneType('town')
                    DrawMissionText(("Entrée en ville, attention à votre vitesse! Vitesse limite: ~y~%s~s~ km/h"):format(kayscoreConfigServ.ConfigAutoEcole.SpeedLimits['town']), 5000)
                end
            },
            {
                Pos = {x = 781.301, y = -1026.195, z = 24.605},
                Action = function(playerPed, vehicle, setCurrentZoneType)
                    DrawMissionText('Marquez le stop pour laisser passer les véhicules!', 5000)
                    PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
                    FreezeEntityPosition(vehicle, true)
                    Citizen.Wait(6000)
                    FreezeEntityPosition(vehicle, false)
                    DrawMissionText('Bien, prenez à gauche!', 5000)
                end
            },
            {
                Pos = {x = 413.946, y = -1040.06, z = 27.80036},
                Action = function(playerPed, vehicle, setCurrentZoneType)
                    DrawMissionText('Allez vers le prochain passage!', 5000)
                end
            },
            {
                Pos = {x = 408.4836, y = -877.0377, z = 27.7428},
                Action = function(playerPed, vehicle, setCurrentZoneType)
                    DrawMissionText('Marquez le stop pour laisser passer les véhicules!', 5000)
                    PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
                    FreezeEntityPosition(vehicle, true)
                    Citizen.Wait(6000)
                    FreezeEntityPosition(vehicle, false)
                    DrawMissionText('Bien, prenez à gauche!', 5000)
                end
            },
            {
                Pos = {x = 313.4638, y = -855.0764, z = 27.73656},
                Action = function(playerPed, vehicle, setCurrentZoneType)
                    DrawMissionText('Marquez le stop pour laisser passer les véhicules!', 5000)
                    PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
                    FreezeEntityPosition(vehicle, true)
                    Citizen.Wait(6000)
                    FreezeEntityPosition(vehicle, false)
                    DrawMissionText('Bien, continuer tous droit!', 5000)
                end
            },
            {
                Pos = {x = 198.3179, y = -827.3132, z = 29.39257},
                Action = function(playerPed, vehicle, setCurrentZoneType)
                    DrawMissionText('Allez vers le prochain passage!', 5000)
                end
            },
            {
                Pos = {x = 81.75273, y = -1336.236, z = 27.73565},
                Action = function(playerPed, vehicle, setCurrentZoneType)
                    DrawMissionText('Allez vers le prochain passage!', 5000)
                end
            },
            {
                Pos = {x = 222.5009, y = -1439.918, z = 27.73374},
                Action = function(playerPed, vehicle, setCurrentZoneType)
                    DrawMissionText('Allez vers le prochain passage!', 5000)
                end
            },
            {
                Pos = {x = 235.283, y = -1398.329, z = 28.921},
                Action = function(playerPed, vehicle, setCurrentZoneType)
                    ESX.Game.DeleteVehicle(vehicle)
                end
            }
        }
    },

    ---------- ACTIVITY ---------
    Activity = {
        Peds = {
            ["SELL_CHASSE"] = {
                model = "cs_joeminuteman",
                tag = "Libba",
                text = "Appuyez sur [ ~g~E~w~ ] pour parler à Libba",
                pos = vector3(739.99090576172, -970.05145263672, 24.457498550415),
                heading = 269.85900878906,
                scenarioActive = true,
                scenarioName = "WORLD_HUMAN_CLIPBOARD",
                weaponActive = true,
                weapon = "weapon_musket",
                gamerTag = true,
                Action = function()
                    _CHASSE.openSellMenu()
                end
            },
            ["START_LIVRAISONS"] = {
                model = "cs_joeminuteman",
                tag = "Leo",
                text = "Appuyez sur [ ~g~E~w~ ] pour parler à Leo",
                pos = vector3(951.97802734375, -1734.8596191406, 31.08740234375),
                heading = 355.27059936523,
                scenarioActive = true,
                scenarioName = "WORLD_HUMAN_CLIPBOARD",
                weaponActive = false,
                weapon = "weapon_musket",
                gamerTag = true,
                Action = function()
                    _LIVRAISONS.openLivraisonsMenu()
                end
            }
        },

        Acier = {
            vector3(100.14375305176, -383.58462524414, 41.428314208984),
            vector3(97.717330932617, -378.58120727539, 41.792797088623),
            vector3(105.64247131348, -378.27307128906, 41.872734069824)
        },
        TAcier = {
            vector3(985.14428710938, -1922.9016113281, 31.13445854187),
            vector3(997.16015625, -1920.0733642578, 31.159097671509),
            vector3(990.61553955078, -1918.0971679688, 31.145364761353)
        },
        VAcier = {
            vector3(1246.288, -3155.489, 5.636689),
            vector3(1242.785, -3149.307, 5.528234),
            vector3(1244.887, -3145.892, 5.538756),
            vector3(1244.075, -3142.173, 5.528234),
            vector3(1247.4, -3135.931, 5.715518),
        },
        Blips = {
            {
                pos = vector3(99.587600708008, -380.77630615234, 41.617053985596),
                blipid = 285,
                blipcolor = 36,
                text = "Récolte D'acier"
            },
            {
                pos = vector3(975.68463134766, -1919.8936767578, 31.135709762573),
                blipid = 285,
                blipcolor = 36,
                text = "Traitement D'acier"
            },
            {
                pos = vector3(1246.755, -3142.263, 5.669068),
                blipid = 285,
                blipcolor = 36,
                text = "Vente D'acier"
            },
            {
                pos = vector3(-1493.923828125, 4978.3872070313, 63.450904846191),
                blipid = 463,
                blipcolor = 59,
                text = "Chasse"
            },
            {
                pos = vector3(-1346.45, 4650.41, 109.64),
                blipid = 463,
                blipcolor = 24,
                text = "Zonne De Chasse"
            },
            {
                pos = vector3(951.97802734375, -1734.8596191406, 31.08740234375),
                blipid = 67,
                blipcolor = 47,
                text = "Livraisons"
            },
            {
                pos = vector3(739.99090576172, -970.05145263672, 24.457498550415),
                blipid = 463,
                blipcolor = 59,
                text = "Vente de gibier"
            }
        },
        ZoneBlips = {
            {
                pos = vector3(-1346.45, 4650.41, 109.64),
                blipcolor = 24
            }
        },

        Chasse = {
            Pos = vector3(-1493.36, 4974.03, 63.83),
            Levels = {
                [100] = {
                    "Chevreuil",
                    "Lapin"
                },
                [200] = {
                    "Chevreuil",
                    "Lapin",
                    "Jaguar"
                },
                [300] = {
                    "Chevreuil",
                    "Lapin",
                    "Jaguar",
                    "Loup"
                },
                [400] = {
                    "Chevreuil",
                    "Lapin",
                    "Jaguar",
                    "Loup",
                    "Cerf"
                },
                [700] = {
                    "Chevreuil",
                    "Lapin",
                    "Jaguar",
                    "Loup",
                    "Sanglier"
                }
            },
            Levels2 = {
                [-664053099] = "cerf",
                [-541762431] = "lapin",
                [307287994] = "jaguar",
                [1682622302] = "loup",
                [-832573324] = "sanglier"
            },
            AuthorizedAnimals = {
                {hash = -664053099, requirededlevel = 100},
                {hash = 307287994, requirededlevel = 200},
                {hash = 1682622302, requirededlevel = 300},
                {hash = -832573324, requirededlevel = 700},
                {hash = -541762431, requirededlevel = 0}
            },
            AuthorizedAnimals2 = {
                [-664053099] = 100,
                [307287994] = 200,
                [1682622302] = 300,
                [832573324] = 400,
                [-832573324] = 700,
                [-541762431] = 0
            },
            Animals = {
                vector3(-1000.6195068359, 4722.7319335938, 251.86349487305),
                vector3(-1314.7746582031, 4850.2954101563, 143.39895629883),
                vector3(-1419.5855712891, 4722.3745117188, 42.911380767822),
                vector3(-1421.2526855469, 4543.3471679688, 59.639568328857),
                vector3(-1430.9395751953, 4305.736328125, 3.238737821579),
                vector3(-1430.9395751953, 4305.736328125, 3.238737821579),
                vector3(-1658.2985839844, 4698.3540039063, 36.048252105713),
                vector3(-1365.0989990234, 4805.5258789063, 130.05764770508),
                vector3(-1160.3708496094, 4557.9013671875, 141.23742675781),
                vector3(-1566.1948242188, 4676.7783203125, 45.917358398438),
                vector3(-1457.439453125, 4805.55859375, 87.928871154785),
                vector3(-1433.5939941406, 4712.162109375, 41.99116897583)
            },
            SellItems = {
                ["lapin"] = {price = 100},
                ["chevreuil"] = {price = 100},
                ["jaguar"] = {price = 150},
                ["loup"] = {price = 150},
                ["sanglier"] = {price = 150},
                ["cerf"] = {price = 200},
            }
        },
        Livraisons = {
            Levels = {
                [100] = 100,
                [200] = 200,
                [300] = 300,
                [400] = 400,
                [500] = 500,
            },
            Vehicle = {
                [200] = {'mule'},
                [400] = {'packer'}
            },
    
            Market = {
                vector3(23.769006729126, -1305.7766113281, 29.17688369751), -- 1
                -- vector3(2565.7229003906, 384.40933227539, 108.46313476563), -- 2
                -- vector3(-3040.5305175781, 603.54089355469, 7.5439276695251), -- 3
                -- vector3(-3234.9484863281, 1003.9524536133, 12.267910003662), -- 4
                -- vector3(543.09710693359, 2679.5480957031, 42.214179992676), -- 5
                -- vector3(1968.8165283203, 3735.2377929688, 32.31792068481), --6 
                -- vector3(2681.0595703125, 3273.1362304688, 55.240520477295), -- 7
                -- vector3(1731.7833251953, 6403.3022460938, 34.654445648193), -- 8
                vector3(1150.8741455078, -980.61779785156, 46.177253723145 ), -- 9
                vector3(-1231.9028320313, -895.34375, 12.216474533081), -- 10
                vector3(-1510.5513916016, -380.0754699707, 41.326847076416), --11
                -- vector3(-2970.4497070313, 372.21466064453, 14.771851539612), -- 12
                -- vector3(1175.51953125, 2696.5549316406, 37.968856811523), -- 13
                -- vector3(1401.4223632813, 3597.2272949219, 34.885875701904), -- 14
                vector3(-63.715763092041, -1753.5750732422, 29.313331604004), -- 15
                vector3(1165.7283935547, -329.54580688477, 69.000129699707), -- 16
                vector3(-729.14410400391, -916.22064208984, 19.013988494873), -- 17
                -- vector3(-1816.0653076172, 788.28387451172, 137.8639831543), -- 18
                -- vector3(1699.8020019531, 4938.7138671875, 42.078151702881), -- 19
            }
        }
    },

    -------------- BOOST PERKS ---------------
    BoosterPerks = {

        botToken = "",
        discordId = "",
        roleBoostId = {
            ['kayscore Booster'] = '1117498546812375101',
        },
        timeDelay = 7, -- in days 
        recompense = function(src)
            local xPlayer = ESX.GetPlayerFromId(src)
            xPlayer.addAccountMoney('cash', 15000)
            xPlayer.showNotification('Vous avez gagnez 15000$ en cash grace a votre boost discord')
        end,
        translation = {
            NOBOOST = 'Vous ne boostez pas le discord',
            TIMER = 'Vous avez déjà récuperer vos récompense de boost il vous reste %s jours %s heures %s minutes\nAvant de pouvoir les récupérés a nouveau', -- %s = days,hours,minutes
        },
        showNotification = function(src, msg)
            local xPlayer = ESX.GetPlayerFromId(src)
    
            xPlayer.showNotification(msg)
        end

    },

    ---------- MAINTENANCE OPTIONS ------------
    MaintenancePerm = {
        Active = false,
        Maintenance = {
            Staff = {
                ["license:8f181d9ed17e4d3c6bdbf74a77fd6b5ff2cc0ee2"] = true, -- Kay

            },
        },
    },

    --------- PNJ DELETER --------
    PNJ = {
        RelationshipGroups = {
            `AGGRESSIVE_INVESTIGATE`,
            `AMBIENT_GANG_BALLAS`,
            `AMBIENT_GANG_CULT`,
            `AMBIENT_GANG_FAMILY`,
            `AMBIENT_GANG_HILLBILLY`,
            `AMBIENT_GANG_LOST`,
            `AMBIENT_GANG_MARABUNTE`,
            `AMBIENT_GANG_MEXICAN`,
            `AMBIENT_GANG_SALVA`,
            `AMBIENT_GANG_WEICHENG`,
            `ARMY`,
            `CAT`,
            `CIVFEMALE`,
            `CIVMALE`,
            `COP`,
            --`COUGAR`,
            `DEALER`,
            `DEER`,
            `DOMESTIC_ANIMAL`,
            `FIREMAN`,
            `GANG_1`,
            `GANG_2`,
            `GANG_9`,
            `GANG_10`,
            `GUARD_DOG`,
            `HATES_PLAYER`,
            `HEN`,
            `MEDIC`,
            `MISSION2`,
            `MISSION3`,
            `MISSION4`,
            `MISSION5`,
            `MISSION6`,
            `MISSION7`,
            `MISSION8`,
            `NO_RELATIONSHIP`,
            `PLAYER`,
            `PRISONER`,
            `PRIVATE_SECURITY`,
            `SECURITY_GUARD`,
            --`SHARK`,
            `SPECIAL`,
            --`WILD_ANIMAL`,
        },
        PickupWeapons = {
            `PICKUP_AMMO_BULLET_MP`,
            `PICKUP_AMMO_FIREWORK`,
            `PICKUP_AMMO_FIREWORK_MP`,
            `PICKUP_AMMO_FLAREGUN`,
            `PICKUP_AMMO_GRENADELAUNCHER`,
            `PICKUP_AMMO_GRENADELAUNCHER_MP`,
            `PICKUP_AMMO_HOMINGLAUNCHER`,
            `PICKUP_AMMO_MG`,
            `PICKUP_AMMO_MINIGUN`,
            `PICKUP_AMMO_MISSILE_MP`,
            `PICKUP_AMMO_PISTOL`,
            `PICKUP_AMMO_RIFLE`,
            `PICKUP_AMMO_RPG`,
            `PICKUP_AMMO_SHOTGUN`,
            `PICKUP_AMMO_SMG`,
            `PICKUP_AMMO_SNIPER`,
            `PICKUP_WEAPON_ADVANCEDRIFLE`,
            `PICKUP_WEAPON_APPISTOL`,
            `PICKUP_WEAPON_ASSAULTRIFLE`,
            `PICKUP_WEAPON_ASSAULTRIFLE_MK2`,
            `PICKUP_WEAPON_ASSAULTSHOTGUN`,
            `PICKUP_WEAPON_ASSAULTSMG`,
            `PICKUP_WEAPON_AUTOSHOTGUN`,
            `PICKUP_WEAPON_BAT`,
            `PICKUP_WEAPON_BATTLEAXE`,
            `PICKUP_WEAPON_BOTTLE`,
            `PICKUP_WEAPON_BULLPUPRIFLE`,
            `PICKUP_WEAPON_BULLPUPRIFLE_MK2`,
            `PICKUP_WEAPON_BULLPUPSHOTGUN`,
            `PICKUP_WEAPON_CARBINERIFLE`,
            `PICKUP_WEAPON_CARBINERIFLE_MK2`,
            `PICKUP_WEAPON_COMBATMG`,
            `PICKUP_WEAPON_COMBATMG_MK2`,
            `PICKUP_WEAPON_COMBATPDW`,
            `PICKUP_WEAPON_COMBATPISTOL`,
            `PICKUP_WEAPON_COMPACTLAUNCHER`,
            `PICKUP_WEAPON_COMPACTRIFLE`,
            `PICKUP_WEAPON_CROWBAR`,
            `PICKUP_WEAPON_DAGGER`,
            `PICKUP_WEAPON_DBSHOTGUN`,
            `PICKUP_WEAPON_DOUBLEACTION`,
            `PICKUP_WEAPON_FIREWORK`,
            `PICKUP_WEAPON_FLAREGUN`,
            `PICKUP_WEAPON_FLASHLIGHT`,
            `PICKUP_WEAPON_GRENADE`,
            `PICKUP_WEAPON_GRENADELAUNCHER`,
            `PICKUP_WEAPON_GUSENBERG`,
            `PICKUP_WEAPON_GolfClub`,
            `PICKUP_WEAPON_HAMMER`,
            `PICKUP_WEAPON_HATCHET`,
            `PICKUP_WEAPON_HEAVYPISTOL`,
            `PICKUP_WEAPON_HEAVYSHOTGUN`,
            `PICKUP_WEAPON_HEAVYSNIPER`,
            `PICKUP_WEAPON_HEAVYSNIPER_MK2`,
            `PICKUP_WEAPON_HOMINGLAUNCHER`,
            `PICKUP_WEAPON_KNIFE`,
            `PICKUP_WEAPON_KNUCKLE`,
            `PICKUP_WEAPON_MACHETE`,
            `PICKUP_WEAPON_MACHINEPISTOL`,
            `PICKUP_WEAPON_MARKSMANPISTOL`,
            `PICKUP_WEAPON_MARKSMANRIFLE`,
            `PICKUP_WEAPON_MARKSMANRIFLE_MK2`,
            `PICKUP_WEAPON_MG`,
            `PICKUP_WEAPON_MICROSMG`,
            `PICKUP_WEAPON_MINIGUN`,
            `PICKUP_WEAPON_MINISMG`,
            `PICKUP_WEAPON_MOLOTOV`,
            `PICKUP_WEAPON_MUSKET`,
            `PICKUP_WEAPON_NIGHTSTICK`,
            `PICKUP_WEAPON_PETROLCAN`,
            `PICKUP_WEAPON_PIPEBOMB`,
            `PICKUP_WEAPON_PISTOL`,
            `PICKUP_WEAPON_PISTOL50`,
            `PICKUP_WEAPON_PISTOL_MK2`,
            `PICKUP_WEAPON_POOLCUE`,
            `PICKUP_WEAPON_PROXMINE`,
            `PICKUP_WEAPON_PUMPSHOTGUN`,
            `PICKUP_WEAPON_PUMPSHOTGUN_MK2`,
            `PICKUP_WEAPON_RAILGUN`,
            `PICKUP_WEAPON_RAYCARBINE`,
            `PICKUP_WEAPON_RAYMINIGUN`,
            `PICKUP_WEAPON_RAYPISTOL`,
            `PICKUP_WEAPON_REVOLVER`,
            `PICKUP_WEAPON_REVOLVER_MK2`,
            `PICKUP_WEAPON_RPG`,
            `PICKUP_WEAPON_SAWNOFFSHOTGUN`,
            `PICKUP_WEAPON_SMG`,
            `PICKUP_WEAPON_SMG_MK2`,
            `PICKUP_WEAPON_SMOKEGRENADE`,
            `PICKUP_WEAPON_SNIPERRIFLE`,
            `PICKUP_WEAPON_SNSPISTOL`,
            `PICKUP_WEAPON_SNSPISTOL_MK2`,
            `PICKUP_WEAPON_SPECIALCARBINE`,
            `PICKUP_WEAPON_SPECIALCARBINE_MK2`,
            `PICKUP_WEAPON_TACTICALRIFLE`,
            `PICKUP_WEAPON_STICKYBOMB`,
            `PICKUP_WEAPON_STONE_HATCHET`,
            `PICKUP_WEAPON_STUNGUN`,
            `PICKUP_WEAPON_SWITCHBLADE`,
            `PICKUP_WEAPON_VINTAGEPISTOL`,
            `PICKUP_WEAPON_WRENCH`,
        },
        SuppressedVehiclesModels = {
            -- Tankers
            `armytanker`,
            `tanker`,
            `tanker2`,
            -- Military
            `apc`,
            `barracks`,
            `barracks2`,
            `barracks3`,
            `barrage`,
            `chernobog`,
            `crusader`,
            `halftrack`,
            `khanjali`,
            `minitank`,
            `rhino`,
            `scarab`,
            `scarab2`,
            `scarab3`,
            `scramjet`, 
            `thruster`,
            `trailersmall2`,
            -- Helico
            `polmav`,
            `akula`,
            `annihilator`,
            `buzzard`,
            `buzzard2`,
            `cargobob`,
            `cargobob2`,
            `cargobob3`,
            `cargobob4`,
            `frogger`,
            `frogger2`,
            `havok`,
            `hunter`,
            `maverick`,
            `savage`,
            `seasparrow`,
            `skylift`,
            `supervolito`,
            `supervolito2`,
            `swift`,
            `swift2`,
            `valkyrie`,
            `valkyrie2`,
            `volatus`,
            -- planes
            `alphaz1`,
            `avenger`,
            `avenger2`,
            `besra`,
            `blimp`,
            `blimp2`,
            `blimp3`,
            `bombushka`,
            `cargoplane`,
            `cuban800`,
            `dodo`,
            `duster`,
            `howard`,
            `hydra`,
            `jet`,
            `lazer`,
            `luxor`,
            `luxor2`,
            `mammatus`,
            `microlight`,
            `miljet`,
            `mogul`,
            `molotok`,
            `nimbus`,
            `nokota`,
            `pyro`,
            `rogue`,
            `seabreeze`,
            `shamal`,
            `starling`,
            `strikeforce`,
            `stunt`,
            `titan`,
            `tula`,
            `velum`,
            `velum2`,
            `vestra`,
            `volatol`,
        },
        SuppressedPedsModels = {
            --`a_c_mtlion`,
            `a_c_cormorant`,
            `a_c_pigeon`,
            `a_c_chickenhawk`,
            `a_c_crow`,
            `a_c_seagull`,
        },
    },

    --------- WEATHER ---------
    weatherCFG = {
        weathers = {
            "EXTRASUNNY",
            "RAIN",
            "CLOUDS",
            "FOGGY",
            "CLEAR",
            "THUNDER",
            "SMOG",
            "OVERCAST",
            "CLEARING",
            "NEUTRAL",
            "SNOW",
            "BLIZZARD",
            "SNOWLIGHT",
            "XMAS",
            "HALLOWEEN",
            "THUNDERSTORM",
            "SANDSTORM",
            "FOG",
            "HURRICANE",
        },
            polyzones = {
                {
                    zoneId = 2,
                    zone = PolyZone:Create({
                        vector2(-6443.509765625, 1915.9144287109),
                        vector2(4431.2587890625, 255.49807739258),
                        vector2(4562.1049804688, -3688.2724609375),
                        vector2(-5136.7138671875, -5066.4565429688)
                    }, {
                        name = "weather_south",
                    }),
                },
                {
                    zoneId = 3,
                    zone = PolyZone:Create({
                        vector2(4275.10546875, 5434.8364257812),
                        vector2(1564.6053466797, 4408.8530273438),
                        vector2(1390.6961669922, 4273.3383789062),
                        vector2(719.68798828125, 4142.8276367188),
                        vector2(531.11596679688, 4152.5405273438),
                        vector2(-116.3205871582, 4248.349609375),
                        vector2(-210.17153930664, 4176.80078125),
                        vector2(-1181.7255859375, 3846.3901367188),
                        vector2(-3051.0166015625, 5129.0639648438),
                        vector2(-1193.9758300781, 7723.66015625),
                        vector2(3195.1027832031, 7207.4565429688)
                    }, {
                        name = "weather_north",
                    }),
                }
            }
        }
    }

