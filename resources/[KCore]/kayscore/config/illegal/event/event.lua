    EventConfig = {}
    EventConfig = {
            EggsEvent = {   
            active = true,
            shop = {
                ['250000'] = {
                    type = 'money',
                    amount = 250000,
                    price = 1,
                    label = '250.000$',
                },
                ['centuria'] = {
                    type = 'vehicle',
                    name = 'centuria',
                    price = 20,
                    label = 'Buggati Centuria',
                },
                ['caisse_noel_2022'] = {
                    type = 'item',
                    name = 'caisse_noel_2022',
                    price = 30,
                    label = 'Caisse Pâques',
                },
            },
        },

        AirDropActive = true,
        AirdropItems = {
            {name = "water", count = 5},
            {name = "bread", count = 10},
            {name = "weapon_pistol", count = 1},
            {name = "ammo_pistol", count = 50},
        },
        
        FourgonPosEvent = {
            Sanction = "kick", -- "kick" ou "ban"
            moneyal = math.random(2100, 3600),
            Position = {
                {
                    pos = vector3(-182.5941, -891.2957, 29.33857),
                    reward = {
                        { pos = vector3(-181.9299, -880.7997, 29.35008), money = math.random(2100, 3600) },
                        { pos = vector3(-176.771, -893.2791, 29.33994), money = math.random(2100, 3600) },
                        { pos = vector3(-187.6028, -900.0408, 29.34871), money = math.random(2100, 3600) },
                    }
                },
                {
                    pos = vector3(27.88299, -1722.806, 29.30294),
                    reward = {
                        { pos = vector3(17.25285, -1722.961, 29.30293), money = math.random(2100, 3600) },
                        { pos = vector3(19.33466, -1712.337, 29.29928), money = math.random(2100, 3600) },
                        { pos = vector3(25.21941, -1706.947, 29.2952), money = math.random(2100, 3600) },
                    }
                },
                {
                    pos = vector3(-119.0014, -488.2652, 30.06849),
                    reward = {
                        { pos = vector3(-109.5207, -488.1952, 30.38207), money = math.random(2100, 3600) },
                        { pos = vector3(-114.0339, -494.2086, 30.32321), money = math.random(2100, 3600) },
                        { pos = vector3(-123.3315, -496.1223, 29.98015), money = math.random(2100, 3600) },
                    }
                },
                {
                    pos = vector3(-608.4604, 337.8598, 85.11673),
                    reward = {
                        { pos = vector3(-610.401, 343.8043, 85.11674), money = math.random(2100, 3600) },
                        { pos = vector3(-620.5007, 334.7534, 85.11674), money = math.random(2100, 3600) },
                        { pos = vector3(-613.9526, 331.3243, 85.11738), money = math.random(2100, 3600) },
                    }
                }
            }
        }
    }