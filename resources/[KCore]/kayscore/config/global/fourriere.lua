Garages = {
    my_garage = {
        VehiclesList = {},
        PaidGarage = {},
        VehiclesGroupList = {},
        VehiclesEntrepriseList = {},
    },

    garage_data = {
        garages = {},
        data = {
            Pounds = {
                ['car'] = {
                    ["gabz_los_santos_impound"] = {
                        position = vector3(487.7596, -1308.726, 29.26244),
                        pos = {
                            {spawnPoint = vector3(501.893311, -1337.107422, 29.318890), heading = 23.31552696228},
                            {spawnPoint = vector3(496.653961, -1336.118896, 29.326445), heading = 2.2732810974121},
                            {spawnPoint = vector3(491.866638, -1338.502319, 29.302683), heading = 346.42391967773},
                        }
                    },
                    ["plage"] = {
                        position = vec3(-1233.836060, -1428.008423, 4.325500),
                        pos = {
                            {spawnPoint = vec3(-1238.092896, -1418.930176, 4.323708), heading = 35.559921264648},
                            {spawnPoint = vec3(-1243.239868, -1410.901733, 4.323080), heading = 2.2732810974121},
                            {spawnPoint = vec3(-1244.371582, -1423.067139, 4.323322), heading = 346.42391967773},
                            {spawnPoint = vec3(-1252.028076, -1413.349487, 4.318987), heading = 346.42391967773},

                        }
                    },
                    -- ["gabz_los_santos_impound2"] = {
                    --     position = vector3(-191.718475, -1162.354858, 23.671421),
                    --     pos = {
                    --         {spawnPoint = vector3(-138.812378, -1166.063232, 23.769590), heading = 178.83807373047},
                    --         {spawnPoint = vector3(-144.215225, -1164.822021, 23.769590), heading = 175.07290649414},
                    --         {spawnPoint = vector3(-150.798706, -1168.491089, 23.769588), heading = 260.14337158203},
                    --     }
                    -- },
                    ["gabz_paleto"] = {
                        position = vector3(-73.4558, 6422.496, 31.49045),
                        pos = {
                            {spawnPoint = vector3(-72.93914, 6430.616, 31.43954), heading = 38.243446350098},
                            {spawnPoint = vector3(-75.71261, 6428.742, 31.44009), heading = 40.279216766357},
                            {spawnPoint = vector3(-77.62532, 6426.474, 31.49045), heading = 41.109046936035} ,
                            {spawnPoint = vector3(-80.01643, 6424.654, 31.49043), heading = 42.023078918457} ,
                        }
                    },
                    ["gabz_sandyshores"] = {
                        position = vector3(1693.040649, 3585.272461, 35.620983),
                        pos = {
                            {spawnPoint = vector3(1717.553467, 3594.351807, 35.279045), heading = 112.243446350098},
                            {spawnPoint = vector3(1715.481445, 3597.958740, 35.219208), heading = 112.29510498047},
                            {spawnPoint = vector3(1714.116821, 3600.928955, 35.162498), heading = 112.79634857178},
                        }
                    },
                    ["gabz_cayo"] = {
                        position = vector3(4519.855, -4514.667, 4.500879),
                        pos = {
                            {spawnPoint = vector3(4515.373, -4520.718, 4.162189), heading = 31.224763870239},
                            {spawnPoint = vector3(4513.043, -4512.203, 4.13976), heading = 354.41165161133},
                            {spawnPoint = vector3(4515.221, -4502.596, 4.188764), heading = 317.72991943359}
                        }
                    },
                    ["Bennysss"] = {
                        position = vector3(249.874588, -3110.191406, 5.794337),
                        pos = {
                            {spawnPoint = vector3(255.085510, -3100.947998, 5.636710), heading = 31.224763870239},
                            {spawnPoint = vector3(241.727264, -3098.606445, 5.796792), heading = 354.41165161133},
                            {spawnPoint = vector3(230.732803, -3109.521240, 5.790266), heading = 317.72991943359}
                        }
                    },
                },
                ['boat'] = {
                    ["dock"] = {
                        position = vector3(-849.5558, -1487.478, 1.595393),
                        pos = {
                            {spawnPoint = vector3(-838.4496, -1483.574, 0.9354513), heading = 200.54750061035}
                        }
                    },
                    ["dock_cayo"] = {
                        position = vector3(4907.027, -5171.647, 2.45890),
                        pos = {
                            {spawnPoint = vector3(4909.705, -5165.125, 1.655253), heading = 64.371887207031}
                        }
                    },
                },
                ['aircraft'] = {
                    ["airport"] = {
                        position = vector3(-1267.4583740234, -2683.6896972656, 19.629182815552),
                        pos = {
                            {spawnPoint = vector3(-1318.946, -2735.557, 13.94492), heading = 146.83299255371}
                        }
                    },
                    ["airport_nord"] = {
                        position = vector3(1766.286, 3304.177, 41.16399),
                        pos = {
                            {spawnPoint = vector3(1771.231, 3267.859, 41.6414), heading = 102.14114379883}
                        },
                    },
                    ["airport_cayo"] = {
                        position = vector3(4367.37, -4574.132, 4.207753),
                        pos = {
                            {spawnPoint = vector3(4359.654, -4555.144, 4.195066), heading = 19.962730407715}
                        },
                    },
                },
            }
        },
        place = {
            Index = 1,
            Data = {
                'Dans ce garage',
                'Dans un autre Garage',
                'Fourrière',
            }
        },
        Loaded = false,
        wait = 2000,

        blips = {}
    },

    Create = {
        Index = 1,
        Data = {
            "Car",
            "Bateaux",
            'Avions'
        },

        Locations = {
            Index = 1,
            Data = {
                'Point de sortie',
                'Point de delete',
                'Point de spawn'
            }
        },

        spawnPos = {},
    }
}
