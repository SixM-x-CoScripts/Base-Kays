kayscoreDrugs = {
    Wait = 2000,
    Drugs = {
        ["weed"] = {
            ["recolte"] = {
                vector3(1060.5313720703, -3193.3864746094, -39.140571594238),
                vector3(1060.8548583984, -3203.1354980469, -39.14879989624),
                vector3(1058.69140625, -3203.4396972656, -39.06368637085),
                vector3(1051.401, -3204.18, -39.13237),
                vector3(1051.636, -3201.86, -39.11514),
                vector3(1053.872, -3195.949, -39.16129),
                vector3(1053.914, -3191.11, -39.16134),
                vector3(1057.406, -3197.282, -39.13162),
                vector3(1060.5856933594, -3198.4584960938, -39.161205291748)
            },
            ["traitement"] = {
                vector3(1039.4801025391, -3205.1555175781, -38.165992736816),
                -- vector3(1034.7731933594, -3205.2922363281, -38.176445007324),
                -- vector3(1044.2901611328, -3195.0302734375, -38.158569335938)
            }
        },
        ["coke"] = {
            ["recolte"] = {
                vector3(-89.12731, 1893.019, 196.8857),
                vector3(-95.6274, 1893.535, 197.0716),
                vector3(-103.2007, 1893.634, 197.1625),
                vector3(-109.2517, 1893.686, 197.2784),
                vector3(-116.2441, 1893.543, 197.4235)
            },
            ["traitement"] = {
                vector3(1090.54, -3196.656, -38.99348),
                vector3(1092.907, -3196.647, -38.99348),
                vector3(1100.811, -3198.811, -38.99348)
            }
        },
        ["mdma"] = {
            ["recolte"] = {
                vector3(2481.819092, 3723.714355, 43.804783)
            },
            ["traitement"] = {
                vector3(108.403679, 6908.245117, 20.004673)
            }
        }
    },
    Items = {
        ["weed"] = {
            ["recolte"] = {
                name = "weed",
                label = "Weed",
                animtype = "anim",
                animdict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                anim = "machinic_loop_mechandplayer",
                animtime = 2000,
                marker = false,
                props = "prop_weed_01"
            },
            ["traitement"] = {
                name = "weed_pooch",
                label = "Pochon de weed",
                animtype = "scenario",
                animdict = "PROP_HUMAN_BUM_BIN",
                anim = nil,
                animtime = 5000,
                marker = true,
                props = nil
            }
        },
        ["coke"] = {
            ["recolte"] = {
                name = "coke",
                label = "Coke",
                animtype = "anim",
                animdict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                anim = "machinic_loop_mechandplayer",
                animtime = 2000,
                marker = false,
                props = "prop_coral_bush_01"
            },
            ["traitement"] = {
                name = "coke_pooch",
                label = "Pochon de coke",
                animtype = "scenario",
                animdict = "PROP_HUMAN_BUM_BIN",
                anim = nil,
                animtime = 5000,
                marker = true,
                props = nil
            }
        },
        ["mdma"] = {
            ["recolte"] = {
                name = "mdma",
                label = "MDMA",
                animtype = "anim",
                animdict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                anim = "machinic_loop_mechandplayer",
                animtime = 2000,
                marker = true,
                props = nil
            },
            ["traitement"] = {
                name = "mdma_pooch",
                label = "Pochon de MDMA",
                animtype = "scenario",
                animdict = "PROP_HUMAN_BUM_BIN",
                anim = nil,
                animtime = 5000,
                marker = true,
                props = nil
            }
        }
    },
    RandomZone = {},
    x = {},
    y = {},
    z = {},
    objSpawn = {},
    
    Ped = {
        Model = "s_m_y_dealer_01", 
        SpawnDistance = {min = 5, max = 10}, 
        Blip = {
            Sprite = 1,
            Colour = 1, 
            Scale = 0.4,
            Name = "Client"
        }
    },

    SaleItems = {
        {item = "weed_pooch", label = "Weed", props = "prop_weed_block_01", anim = {"mp_common", "givetake2_a"}, minmoney = 25, maxmoney = 50},
        {item = "coke_pooch", label = "Coke", props = "prop_coke_block_half_b", anim = {"mp_common", "givetake2_a"}, minmoney = 50, maxmoney = 75},
        {item = "mdma_pooch", label = "Meth", props = "p_meth_bag_01_s", anim = {"mp_common", "givetake2_a"}, minmoney = 50, maxmoney = 75}
    },

    BlackListedJobs = {
        ['police'] = true,
        ['saspn'] = true,
        ['ambulance'] = true,
        ['gouvernement'] = true
    },

    AuthorizedPositions = {
        {x = -1345.102051, y = -1270.704224, z = 4.894472}, -- Position 1
        {x = 274.033691, y = 150.604980, z = 104.416214}, -- Position 2
        {x = 897.672424, y = -2350.440918, z = 30.481197}, -- Position 3
        {x = -955.104431, y = -2593.844727, z = 13.847948}, -- Position 4
        {x = 1692.284180, y = 4772.341797, z = 41.921246}, -- Position 5
        {x = -221.599167, y = 6347.479004, z = 32.094200}  -- Position 6
    },

    Blip = {
        sprite = 304,
        display = 4,
        scale = 0.5,
        color = 5,
        name = "Zone Fréquentée"
    },

    DistanceToSell = 3.0
}
