local vehicleRent = {
    wait = 2500,
    nearbyPoints = {},
    isMenu = false,
    data = {
        ["location_bateaux_marina"] = {
            ped = {
                model = "g_m_m_chigoon_01",
                position = vector3(-864.7895, -1324.807, 1.605167),
                heading = 288.76666259766,
            },
            markerPositon = vector3(-864.3058, -1324.652, 1.605167),
            menuData = {
                {name = 'seashark', label = 'Jetski', price = 17500},
                {name = 'squalo', label = 'Squalo', price = 35000},
                {name = 'dinghy4', label = 'Dinghy', price = 50000},
            },

            ignore = {},

            blip = {
                label = "Location Bateaux/Jetski",
                sprite = 410,
                color = 2,
            },
        },
        ["location_bateaux_roxwood"] = {
            ped = {
                model = "g_m_m_chigoon_01",
                position = vector3(-901.7658, 6673.018, 3.229775), 
                heading = 75.620681762695
            },
            markerPositon = vector3(-903.5583, 6673.391, 3.229775),
            menuData = {
                {name = 'seashark', label = 'Jetski', price = 17500},
                {name = 'squalo', label = 'Squalo', price = 35000},
                {name = 'dinghy4', label = 'Dinghy', price = 50000},
            },

            ignore = {},

            blip = {
                label = "Location Bateaux/Jetski",
                sprite = 410,
                color = 2,
            },
        },
        ["location_bateaux_cayo"] = {
            ped = {
                model = "g_m_m_chigoon_01",
                position = vector3(4890.309, -5163.688, 2.456625),
                heading = 156.81498718262,
            },
            markerPositon = vector3(4889.964, -5164.519, 2.479965),
            menuData = {
                {name = 'seashark', label = 'Jetski', price = 17500},
                {name = 'squalo', label = 'Squalo', price = 35000},
                {name = 'dinghy4', label = 'Dinghy', price = 50000},
            },

            ignore = {},

            blip = {
                label = "Location Bateaux/Jetski",
                sprite = 410,
                color = 2,
            },
        },
        ["location_start"] = {
            ped = {
                model = "g_m_m_chigoon_01",
                position = vector3(-149.952, -307.9374, 38.6716), 
                heading = 74.029289245605
            },
            markerPositon = vector3(-150.624, -307.7148, 38.66837),
            menuData = {
                {name = 'bmx', label = 'BMX', price = 1250},
                {name = 'faggio', label = 'Scooter', price = 3500},
                {name = 'panto', label = 'Panto', price = 10000},
            },

            ignore = {},

            blip = {
                label = "Location Véhicule",
                sprite = 280,
                color = 2,
            },
        },
        ["location_start2"] = {
            ped = {
                model = "g_m_m_chigoon_01",
                position = vector3(-1463.653, -234.6038, 49.6055),
                heading = 6.654242515564
            },
            markerPositon = vector3(-1463.67, -234.3196, 49.60001),
            menuData = {
                {name = 'bmx', label = 'BMX', price = 1250},
                {name = 'faggio', label = 'Scooter', price = 3500},
                {name = 'panto', label = 'Panto', price = 10000},
            },

            ignore = {},

            blip = {
                label = "Location Véhicule",
                sprite = 280,
                color = 2,
            },
        },
        ["location_start3"] = {
            ped = {
                model = "g_m_m_chigoon_01",
                position = vector3(106.1693, -202.2028, 54.68883), 
                heading = 69.51929473877,
            },
            markerPositon = vector3(105.6728, -201.866, 54.70547),
            menuData = {
                {name = 'bmx', label = 'BMX', price = 1250},
                {name = 'faggio', label = 'Scooter', price = 3500},
                {name = 'panto', label = 'Panto', price = 10000},
            },

            ignore = {},

            blip = {
                label = "Location Véhicule",
                sprite = 280,
                color = 2,
            },
        },
        ["location_start4"] = {
            ped = {
                model = "g_m_m_chigoon_01",
                position = vector3(-824.7435, -1085.897, 11.13231), 
                heading = 206.93453979492
            },
            markerPositon = vector3(-824.475, -1086.479, 11.1323),
            menuData = {
                {name = 'bmx', label = 'BMX', price = 1250},
                {name = 'faggio', label = 'Scooter', price = 3500},
                {name = 'panto', label = 'Panto', price = 10000},
            },

            ignore = {},

            blip = {
                label = "Location Véhicule",
                sprite = 280,
                color = 2,
            },
        },
        ["location_start5"] = {
            ped = {
                model = "g_m_m_chigoon_01",
                position = vector3(-1216.835, -778.2169, 17.72026), 
                heading = 145.26921081543
            },
            markerPositon = vector3(-1217.296, -778.7506, 17.7127),
            menuData = {
                {name = 'bmx', label = 'BMX', price = 1250},
                {name = 'faggio', label = 'Scooter', price = 3500},
                {name = 'panto', label = 'Panto', price = 10000},
            },

            ignore = {},

            blip = {
                label = "Location Véhicule",
                sprite = 280,
                color = 2,
            },
        },
        ["location_prison"] = {
            ped = {
                model = "g_m_m_chigoon_01",
                position = vector3(1869.223, 2702.258, 45.83855), 
                heading = 118.77530670166
            },
            markerPositon = vector3(1868.507, 2701.859, 45.82323),
            menuData = {
                {name = 'bmx', label = 'BMX', price = 1250},
                {name = 'faggio', label = 'Scooter', price = 3500},
                --{name = 'sanchez', label = 'Sanchez', price = 7500},
                {name = 'panto', label = 'Panto', price = 10000},
            },

            ignore = {},

            blip = {
                label = "Location Véhicule",
                sprite = 280,
                color = 2,
            },
        },

        ["location_sandy1"] = {
            ped = {
                model = "g_m_m_chigoon_01",
                position = vec3(1737.820435, 3709.271240, 34.135406), 
                heading = 23.848159790039
            },
            markerPositon = vec3(1737.399170, 3710.254150, 34.137794),
            menuData = {
                {name = 'bmx', label = 'BMX', price = 1250},
                {name = 'faggio', label = 'Scooter', price = 3500},
                --{name = 'sanchez', label = 'Sanchez', price = 7500},
                {name = 'panto', label = 'Panto', price = 10000},
            },

            ignore = {},

            blip = {
                label = "Location Véhicule",
                sprite = 280,
                color = 2,
            },
        },
        ["location_cayo"] = {
            ped = {
                model = "g_m_m_cartelguards_01",
                position = vector3(5006.982, -5122.356, 2.562331), 
                heading = 249.88732910156
            },
            markerPositon = vector3(5007.754, -5122.584, 2.477225),
            menuData = {
                {name = 'vetir', label = 'Vetir', price = 1250},
                {name = 'winky', label = 'Winky', price = 1000},
                {name = 'sanchez2', label = 'Sanchez Cayo', price = 1000},
                --{name = 'sanchez', label = 'Sanchez', price = 7500}
            },

            ignore = {},

            blip = {
                label = "Location Véhicule",
                sprite = 280,
                color = 2,
            },
        },
        ["location_cayo2"] = {
            ped = {
                model = "g_m_m_cartelguards_01",
                position = vector3(4502.224, -4530.358, 4.171872), 
                heading = 202.68461608887
            },
            markerPositon = vector3(4502.539, -4531.052, 4.171872),
            menuData = {
                {name = 'vetir', label = 'Vetir', price = 1250},
                {name = 'winky', label = 'Winky', price = 1000},
                {name = 'sanchez2', label = 'Sanchez Cayo', price = 1000},
                --{name = 'sanchez', label = 'Sanchez', price = 7500}
            },

            ignore = {},

            blip = {
                label = "Location Véhicule",
                sprite = 280,
                color = 2,
            },
        },
      --[[   ["location_hopital"] = {
            ped = {
                model = "g_m_m_chigoon_01",
                position = vector3(-1888.214, -366.6456, 49.10292), 
                heading = 142.69451904297
            },
            markerPositon = vector3(-1888.647, -367.2184, 49.08968),
            menuData = {
                {name = 'bmx', label = 'BMX', price = 1250},
            },

            ignore = {},

            blip = {
                label = "Location Véhicule",
                sprite = 280,
                color = 2,
            },
        }, ]]
        ["location_hopital_eclipse"] = {
            ped = {
                model = "g_m_m_chigoon_01",
                position = vector3(-667.006409, 300.279388, 81.758003), 
                heading = 188.1869354248
            },
            markerPositon = vector3(-666.979980, 299.658295, 81.748695),
            menuData = {
                {name = 'bmx', label = 'BMX', price = 1250},
            },

            ignore = {},

            blip = {
                label = "Location Véhicule",
                sprite = 280,
                color = 2,
            },
        },
        ["location_nord"] = {
            ped = {
                model = "g_m_m_chigoon_01",
                position = vec3(114.458824, 6598.043457, 32.007885),
                heading = 311.77880859375
            },
            markerPositon = vec3(115.145103, 6598.757324, 32.006153),
            menuData = {
                {name = 'bmx', label = 'BMX', price = 1250},
            },

            ignore = {},

            blip = {
                label = "Location Véhicule",
                sprite = 280,
                color = 2,
            },
        },
--[[         ["location_hawai_1"] = {
            ped = {
                model = "g_m_m_chigoon_01",
                position = vector3(-3148.135, 7320.725, 8.412848), 
                heading = 304.15502929688
            },
            markerPositon = vector3(-3147.339, 7321.326, 8.412836),
            menuData = {
                {name = 'blazer', label = 'Blazer', price = 1000},
                {name = 'verus', label = 'Verus', price = 1250},
            },

            ignore = {
                ["LSCITY"] = true,
                ["VITALIFE"] = true,
                ["SARP"] = true,
                ["GCITY"] = true,
                ["REDSIDE"] = true,
                ["UNIVERS"] = true,
            },

            blip = {
                label = "Location Véhicule",
                sprite = 280,
                color = 2,
            },
        },

        ["location_hawai_2"] = {
            ped = {
                model = "g_m_m_chigoon_01",
                position = vector3(-2973.046, 6870.066, 6.258947), 
                heading = 229.45753479004
            },
            
            markerPositon = vector3(-2972.287, 6869.604, 6.244773),
            menuData = {
                {name = 'blazer', label = 'Blazer', price = 1000},
                {name = 'verus', label = 'Verus', price = 1250},
            },

            blip = {
                label = "Location Véhicule",
                sprite = 280,
                color = 2,
            },

            ignore = {
                ["LSCITY"] = true,
                ["VITALIFE"] = true,
                ["SARP"] = true,
                ["GCITY"] = true,
                ["REDSIDE"] = true,
                ["UNIVERS"] = true,
            }
        }, ]]

--[[         ["location_borabora"] = {
            ped = {
                model = "g_m_m_chigoon_01",
                position = vector3(-3765.06, 7574.31, 17.16139), 
                heading = 356.89141845703
            },
           
            markerPositon = vector3(-3764.992, 7575.304, 17.18001),
            menuData = {
                {name = 'blazer', label = 'Blazer', price = 1000},
                {name = 'verus', label = 'Verus', price = 1250},
            },

            blip = {
                label = "Location Véhicule",
                sprite = 280,
                color = 2,
            },

            ignore = {
                ["METARP"] = true,
            }
        },

        ["location_borabora2"] = {
            ped = {
                model = "g_m_m_chigoon_01",
                position = vector3(-3380.509, 7565.297, 3.180096), 
                heading = 159.5139465332
            },
           
            markerPositon = vector3(-3380.842, 7564.54, 3.180097),
            menuData = {
                {name = 'seashark', label = 'Jetski', price = 17500},
                {name = 'squalo', label = 'Squalo', price = 35000},
                {name = 'dinghy4', label = 'Dinghy', price = 50000},
            },

            blip = {
                label = "Location Bateaux/Jetski",
                sprite = 410,
                color = 2,
            },

            ignore = {
                ["METARP"] = true,
            }
        },



 ]]
    },
}

--[[Citizen.CreateThread(function()
    while ESX == nil do Wait(1) end
    local sName = 'Slide'

    for k,v in pairs(vehicleRent.data) do
        if v.ignore and v.ignore[sName] then goto continue end
        if v.ped then
            _PEDS.addPed(("vehicle_rent_%s"):format(k), {
                model = v.ped.model,
                position = v.ped.position,
                heading = v.ped.heading,
                scenario = {
                    active = true,
                    name = "WORLD_HUMAN_CLIPBOARD",
                    count = 0,
                },
                weapon = {
                    active = false,
                    weaponName = '',
                },
                floatingText = {
                    active = true,
                    text = 'Location',
                    color = 4,
                },
            })
        end

        if v.blip then
            ESX.addBlips({
                name = k,
                label = v.blip.label,
                position = v.markerPositon,
                sprite = v.blip.sprite,
                display = 4,
                scale = 0.75,
                color = v.blip.color,
            })
        end

        AddZones(("vehicle_rent_%s"):format(k), {
            Position = vector3(v.markerPositon.x, v.markerPositon.y, v.markerPositon.z),
            Dist = 10,
            Public = true,
            Job = nil,
            Job2 = nil,
            GradesJobRequire = false,
            GradesJob = {},
            InVehicleDisable = true,
            Blip = {
                Active = false,
            },
            ActionText =('Appuyez sur [ %sE~w~ ] pour intéragir'):format(UTILS.COLORCODE),
            Action = function()
                vehicleRent:openMenu(k, v.menuData)
            end
        })

        ::continue::
    end
end)

function vehicleRent:openMenu(rentIndex, rentData)
    if vehicleRent.isMenu then return end
    vehicleRent.isMenu = true

    local menu = RageUI.CreateMenu(nil, 'Intéraction')
    local menuTime = RageUI.CreateSubMenu(menu, nil, 'Intéraction')

    local vehicleSelected = nil

    RageUI.Visible(menu, not RageUI.Visible(menu))

    while menu do
        Citizen.Wait(0)

        RageUI.IsVisible(menu, function ()
            for _, v in pairs(rentData) do
                RageUI.Button(v.label, nil, { RightLabel = ("%s $"):format(v.price) }, true, {
                    onSelected = function()
                        vehicleSelected = v.name
                    end
                }, menuTime)
            end
        end)

        RageUI.IsVisible(menuTime, function ()
            RageUI.Button("15 minutes", nil, {}, true, {
                onSelected = function ()
                    RageUI.CloseAll()
                    TriggerServerEvent("kayscore:vehicle:rentVehicle", rentIndex, vehicleSelected, 1)
                end
            })

            RageUI.Button("30 minutes", nil, {}, true, {
                onSelected = function ()
                    RageUI.CloseAll()
                    TriggerServerEvent("kayscore:vehicle:rentVehicle", rentIndex, vehicleSelected, 2)
                end
            })

            RageUI.Button("1 heure", nil, {}, true, {
                onSelected = function ()
                    RageUI.CloseAll()
                    TriggerServerEvent("kayscore:vehicle:rentVehicle", rentIndex, vehicleSelected, 3)
                end
            })
        end)

        if
            not RageUI.Visible(menu) and
            not RageUI.Visible(menuTime)
        then
            vehicleRent.isMenu = false
            menu = RMenu:DeleteType('menu', true)
        end
    end
end


local rentEndTime = nil

RegisterNetEvent("kayscore:vehicle:spawnVehicle")
AddEventHandler("kayscore:vehicle:spawnVehicle", function(vehicleName, rentTime)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local vehicleModel = GetHashKey(vehicleName)
    RequestModel(vehicleModel)
    while not HasModelLoaded(vehicleModel) do
        Citizen.Wait(0)
    end
    local vehicle = CreateVehicle(vehicleModel, coords.x, coords.y, coords.z, GetEntityHeading(playerPed), true, false)
    SetPedIntoVehicle(playerPed, vehicle, -1)
    rentEndTime = GetGameTimer() + (rentTime * 1000)
end)

RegisterNetEvent("kayscore:vehicle:removeVehicle")
AddEventHandler("kayscore:vehicle:removeVehicle", function()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if vehicle and vehicle ~= 0 then
        DeleteVehicle(vehicle)
    end
    rentEndTime = nil
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if rentEndTime then
            local remainingTime = rentEndTime - GetGameTimer()
            if remainingTime > 0 then
                DrawProgressBarRent(remainingTime, rentEndTime - (rentEndTime - remainingTime))
            else
                TriggerEvent("kayscore:vehicle:removeVehicle")
            end
        end
    end
end)

function DrawProgressBarRent(currentTime, totalTime)
    local percent = currentTime / totalTime
    DrawRect(0.5, 0.9, 0.2, 0.03, 0, 0, 0, 150)
    DrawRect(0.5 - (0.2 * (1 - percent)) / 2, 0.9, 0.2 * percent, 0.03, 0, 255, 0, 150)
end

function DrawRect(x, y, width, height, r, g, b, a)
    DrawRect(x, y, width, height, r, g, b, a)
end]]--
