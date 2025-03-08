kayscoreVehiclesConfig = {
    Limit = {
        Custom = {
           --[GetHashKey("BLISTA")] = 10,
        },
        GTA = {
            [0] = 50, --Compact
            [1] = 40, --Sedan
            [2] = 60, --SUV
            [3] = 40, --Coupes
            [4] = 40, --Muscle
            [5] = 40, --Sports Classics
            [6] = 40, --Sports
            [7] = 40, --Super
            [8] = 5,  --Motorcycles
            [9] = 200, --Off-road
            [10] = 500, --Industrial
            [11] = 44000, --Utility
            [12] = 2000, --Vans
            [13] = 0, --Cycles
            [14] = 200, --Boats
            [15] = 200, --Helicopters
            [16] = 600, --Planes
            [17] = 7500, --Service
            [18] = 100, --Emergency
            [19] = 0, --Military
            [20] = 7500, --Commercial
            [21] = 0, --Trains
        }
    },

   -- BlackListWeaponLSPD = {        }        
}

-- IMPORTANT: Some of these values MUST be defined as a floating point number. ie. 10.0 instead of 10
VEHICLE_DAMAGE = {
	deformationMultiplier = -1,					-- How much should the vehicle visually deform from a collision. Range 0.0 to 10.0 Where 0.0 is no deformation and 10.0 is 10x deformation. -1 = Don't touch. Visual damage does not sync well to other players.
	deformationExponent = 0.4,					-- How much should the handling file deformation setting be compressed toward 1.0. (Make cars more similar). A value of 1=no change. Lower values will compress more, values above 1 it will expand. Dont set to zero or negative.
	collisionDamageExponent = 0.6,				-- How much should the handling file deformation setting be compressed toward 1.0. (Make cars more similar). A value of 1=no change. Lower values will compress more, values above 1 it will expand. Dont set to zero or negative.

	damageFactorEngine = 2.0,					-- Sane values are 1 to 100. Higher values means more damage to vehicle. A good starting point is 10
	damageFactorBody = 3.0,						-- Sane values are 1 to 100. Higher values means more damage to vehicle. A good starting point is 10
	damageFactorPetrolTank = 64.0,				-- Sane values are 1 to 200. Higher values means more damage to vehicle. A good starting point is 64
	engineDamageExponent = 0.6,					-- How much should the handling file engine damage setting be compressed toward 1.0. (Make cars more similar). A value of 1=no change. Lower values will compress more, values above 1 it will expand. Dont set to zero or negative.
	weaponsDamageMultiplier = 2.0,				-- How much damage should the vehicle get from weapons fire. Range 0.0 to 10.0, where 0.0 is no damage and 10.0 is 10x damage. -1 = don't touch
	degradingHealthSpeedFactor = 10,			-- Speed of slowly degrading health, but not failure. Value of 10 means that it will take about 0.25 second per health point, so degradation from 800 to 305 will take about 2 minutes of clean driving. Higher values means faster degradation
	cascadingFailureSpeedFactor = 8.0,			-- Sane values are 1 to 100. When vehicle health drops below a certain point, cascading failure sets in, and the health drops rapidly until the vehicle dies. Higher values means faster failure. A good starting point is 8

	cascadingFailureThreshold = 360.0,			-- Below this value, health cascading failure will set in
	engineSafeGuard = 100.0,					-- Final failure value. Set it too high, and the vehicle won't smoke when disabled. Set too low, and the car will catch fire from a single bullet to the engine. At health 100 a typical car can take 3-4 bullets to the engine before catching fire.

	torqueMultiplierEnabled = false,				-- Decrease engine torque as engine gets more and more damaged

	limpMode = false,							-- If true, the engine never fails completely, so you will always be able to get to a mechanic unless you flip your vehicle and preventVehicleFlip is set to true
	limpModeMultiplier = 0.19,					-- The torque multiplier to use when vehicle is limping. Sane values are 0.05 to 0.25

	sundayDriver = false,						-- If true, the accelerator response is scaled to enable easy slow driving. Will not prevent full throttle. Does not work with binary accelerators like a keyboard. Set to false to disable. The included stop-without-reversing and brake-light-hold feature does also work for keyboards.
	sundayDriverAcceleratorCurve = 7.5,			-- The response curve to apply to the accelerator. Range 0.0 to 10.0. Higher values enables easier slow driving, meaning more pressure on the throttle is required to accelerate forward. Does nothing for keyboard drivers
	sundayDriverBrakeCurve = 5.0,				-- The response curve to apply to the Brake. Range 0.0 to 10.0. Higher values enables easier braking, meaning more pressure on the throttle is required to brake hard. Does nothing for keyboard drivers

	compatibilityMode = false,					-- prevents other scripts from modifying the fuel tank health to avoid random engine failure with BVA 2.01 (Downside is it disabled explosion prevention)

	randomTireBurstInterval = 0,				-- Number of minutes (statistically, not precisely) to drive above 22 mph before you get a tire puncture. 0=feature is disabled

	-- Class Damagefactor Multiplier
	-- The damageFactor for engine, body and Petroltank will be multiplied by this value, depending on vehicle class
	-- Use it to increase or decrease damage for each class
	classDamageMultiplier = {
		[0] = 	0.35,		--	0: Compacts
				0.35,		--	1: Sedans
				0.35,		--	2: SUVs
				0.35,		--	3: Coupes
				0.35,		--	4: Muscle
				0.35,		--	5: Sports Classics
				0.35,		--	6: Sports
				0.35,		--	7: Super
				0.05,		--	8: Motorcycles
				0.05,		--	9: Off-road
				0.25,		--	10: Industrial
				0.35,		--	11: Utility
				0.35,		--	12: Vans
				0.35,		--	13: Cycles
				0.0,		--	14: Boats
				0.0,		--	15: Helicopters
				0.0,		--	16: Planes
				0.35,		--	17: Service
				0.75,		--	18: Emergency
				0.75,		--	19: Military
				0.35,		--	20: Commercial
				1.0			--	21: Trains
	}
}

VehicleFuelConfig = {}

VehicleFuelConfig.Fuel = {
	DisableKeys = {0, 22, 23, 24, 29, 30, 31, 37, 44, 56, 82, 140, 166, 167, 168, 170, 288, 289, 311, 323},
	PumpModels = {
		[-2007231801] = true,
		[1339433404] = true,
		[1694452750] = true,
		[1933174915] = true,
		[-462817101] = true,
		[-469694731] = true,
		[-164877493] = true,
		[486135101] = true
	},
	JerryCanCost = 200,
	RefillCost = 50,
	ShowNearestGasStationOnly = false,
	ShowAllGasStations = true,
	CostMultiplier = 1.0,
	Classes = {
        [0] =  0.2, -- Compacts
        [1] =  0.2, -- Sedans
        [2] =  0.2, -- SUVs
        [3] =  0.2, -- Coupes
        [4] =  0.2, -- Muscle
        [5] =  0.2, -- Sports Classics
        [6] =  0.2, -- Sports
        [7] =  0.2, -- Super
        [8] =  0.2, -- Motorcycles
        [9] =  0.2, -- Off-road
        [10] = 0.2, -- Industrial
        [11] = 0.2, -- Utility
        [12] = 0.2, -- Vans
        [13] = 0.2, -- Cycles
        [14] = 0.2, -- Boats
        [15] = 1.0, -- Helicopters
        [16] = 1.0, -- Planes
        [17] = 0.2, -- Service
        [18] = 0.2, -- Emergency
        [19] = 0.2, -- Military
        [20] = 0.2, -- Commercial
        [21] = 0.2, -- Trains
	},
    Strings = {
        ExitVehicle = "Sorter du véhicule pour faire le plein",
        EToRefuel = "Appuyer sur ~g~E ~w~pour remplir le véhicule",
        JerryCanEmpty = "Votre jerrycan est vide",
        FullTank = "Véhicule rempli",
        PurchaseJerryCan = "Appuyer sur ~g~E ~w~pour acheter un jerrycan ~g~$100",
        CancelFuelingPump = "Appuyer sur ~g~E ~w~pour arrêter de remplir",
        CancelFuelingJerryCan = "Appuyer sur ~g~E ~w~pour arrêter de remplir",
        NotEnoughCash = "Vous n'avez pas assez d'argent",
        RefillJerryCan = "Appuyer sur ~g~E ~w~ pour remplir votre jerrycan",
        NotEnoughCashJerryCan = "Vous n'avez pas assez d'argent pour remplir le jerrycan",
        JerryCanFull = "Votre jerrycan est rempli",
        TotalCost = "Prix",
    },
	Blacklist = {
		'iak_wheelchair',
		'bmx',
	},
	FuelUsage = {
		[1.0] = 1.4,
		[0.9] = 1.2,
		[0.8] = 1.0,
		[0.7] = 0.9,
		[0.6] = 0.8,
		[0.5] = 0.7,
		[0.4] = 0.5,
		[0.3] = 0.4,
		[0.2] = 0.2,
		[0.1] = 0.1,
		[0.0] = 0.0,
	},
}

VehicleFuelConfig.Fuel.GasStations = {
	vector3(49.4187, 2778.793, 58.043),
	vector3(263.894, 2606.463, 44.983),
	vector3(1039.958, 2671.134, 39.550),
	vector3(1207.260, 2660.175, 37.899),
	vector3(2539.685, 2594.192, 37.944),
	vector3(2679.858, 3263.946, 55.240),
	vector3(2005.055, 3773.887, 32.403),
	vector3(1687.156, 4929.392, 42.078),
	vector3(1701.314, 6416.028, 32.763),
	vector3(179.857, 6602.839, 31.868),
	vector3(-94.4619, 6419.594, 31.489),
	vector3(-2554.996, 2334.40, 33.078),
	vector3(-1800.375, 803.661, 138.651),
	vector3(-1437.622, -276.747, 46.207),
	vector3(-2096.243, -320.286, 13.168),
	vector3(-724.619, -935.1631, 19.213),
	vector3(-526.019, -1211.003, 18.184),
	vector3(-70.2148, -1761.792, 29.534),
	vector3(265.648, -1261.309, 29.292),
	vector3(819.653, -1028.846, 26.403),
	vector3(1208.951, -1402.567,35.224),
	vector3(1181.381, -330.847, 69.316),
	vector3(620.843, 269.100, 103.089),
	vector3(2581.321, 362.039, 108.468),
	vector3(176.631, -1562.025, 29.263),
	vector3(-319.292, -1471.715, 30.549),
	vector3(1784.324, 3330.55, 41.253)
}
kayscorePublicJobVehicles = {
    ['police'] = true,
    ['ambulance'] = true,
    ['ambulancecayo'] = true,
    ['ambulancepillbox'] = true,
    ["ambulancenord"] = true,
    ["ambulancesandy"] = true,
    ['bcso'] = true,
    ["policecayo"] = true,
    ["taxi"] = true
}
extrasCFG = {
    ['ambulance'] = {
        vec3(286.254425, -603.951477, 43.186523)
    },
    ['police'] = {
        vec3(-1073.249268, -864.736877, 4.867171)
    },
    ['gouvernement'] = {
        vec3(-1320.302124, -558.382263, 20.802767)
    },
    ['bcso'] = vec3(-475.216095, 6025.146484, 31.340387),
    ["taxi"] = vec3(915.119873, -164.027420, 74.578026)
}

OfRoadCFG = {}

OfRoadCFG.debug = false
OfRoadCFG.generalDepthDifficulty = 100
OfRoadCFG.generalSinkageSpeed = 100
OfRoadCFG.generalTractionLoss = 100

OfRoadCFG.offroadTires = {
    upgradeValue = 50,
    tractionOnSoft = 20,
    tractionOnHard = -10,
}

OfRoadCFG.awdUpgrade = 25

OfRoadCFG.refreshRate = 200

OfRoadCFG.areaBlacklist = {
    { -- Pillbox hospital
        coords = vector3(293.17, -584.5, 42.8),
        radius = 20.0
    },
    { -- LSPD
        coords = vector3(-1075.8744, -840.2404, 23.5104),
        radius = 60.0
    },
    { -- Simeon's dealership
        coords = vector3(-40.4, -1111.3, 25.8),
        radius = 40.0
    },
    { -- bcso
        coords = vector3(-446.0, 6013.8, 31.8),
        radius = 50.0
    },
    { -- Sandy Shores PD
        coords = vector3(1853.6, 3685.8, 34.3),
        radius = 25.0
    },
    { -- Legion Square
        coords = vector3(202.3, -941.9, 27.6),
        radius = 120.0
    },
}

OfRoadCFG.blacklist = {
    models = {
        'rcbandito',
        'monster',
        'rhino',
        'scarab',
        'khanjali',
    },
    classes = {
        [0] = false, -- Compacts
        [1] = false, -- Sedans
        [2] = false, -- SUVs
        [3] = false, -- Coupes
        [4] = false, -- Muscle
        [5] = false, -- Sports Classics
        [6] = false, -- Sports
        [7] = false, -- Super
        [8] = false, -- Motorcycles
        [9] = false, -- Off-road
        [10] = false, -- Industrial
        [11] = false, -- Utility
        [12] = false, -- Vans
        [17] = false, -- Service
        [18] = false, -- Emergency
        [19] = false, -- Military
        [20] = false, -- Commercial
    }
}

OfRoadCFG.depthHandlingQuality = {
    models = {
        seminole2 = 20,
        sandking = 20,
        sandking2 = 20,
        issi2 = -10,
        panto = -20,
        comet4 = 30,

        -- dirt bikes
        bf400 = 30,
        sanchez = 20,
        manchez = 20,
        esskey = 0,
        cliffhanger = 0,
        enduro = 0,
    },
    classes = {
        [0] = 5, -- Compacts
        [1] = -5, -- Sedans
        [2] = 15, -- SUVs
        [3] = 0, -- Coupes
        [4] = -5, -- Muscle
        [5] = 5, -- Sports Classics
        [6] = 5, -- Sports
        [7] = 5, -- Super
        [8] = -10, -- Motorcycles
        [9] = 35, -- Off-road
        [10] = -10, -- Industrial
        [11] = -10, -- Utility
        [12] = -5, -- Vans
        [17] = 10, -- Service
        [18] = 10, -- Emergency
        [19] = 15, -- Military
        [20] = -5, -- Commercial
    }
}

-------------------------------------------------
--- ROADSIDE SETTINGS
-------------------------------------------------

-- When enabled it makes surfaces which are close to main roads less deep to prevent cars from sinking too deep when on the median etc.
OfRoadCFG.roadSideHelper = {
    enabled = true,
    
    -- Maximum distance from the road (mind that this takes the middle point of the road. You can see the distance in the /surfaceDebug mode
    distanceThreshold = 15.0,
    
    -- Depth multiplier
    depthMultiplier = 0.1,

    -- Traction loss multiplier
    tractionMultiplier = 0.25,
}

OfRoadCFG.fallbackSurface = {
    name = 'Fallback Surface',
    traction = 100,
    depth = 0,
    softness = 0,
}

OfRoadCFG.surfaces = {
    [1] = {
        name = 'Concrete',
        traction = 100,
        depth = 0,
        softness = 0,
    },
    [4] = {
        name = 'Road',
        traction = 100,
        depth = 0,
        softness = 0,
    },
    [5] = {
        name = 'Metal',
        traction = 100,
        depth = 0,
        softness = 0,
    },
    [6] = {
        name = 'Sandy roadside',
        traction = 80,
        depth = 50,
        softness = 5,
    },
    [9] = {
        name = 'Sandstone',
        traction = 80,
        depth = 0,
        softness = 0,
    },
    [10] = {
        name = 'Rock',
        traction = 80,
        depth = 0,
        softness = 0,
    },
    [11] = {
        name = 'Rock',
        traction = 80,
        depth = 0,
        softness = 0,
    },
    [13] = {
        name = 'Cobble',
        traction = 90,
        depth = 0,
        softness = 0,
    },
    [16] = {
        name = 'Limestoneesque sand',
        traction = 80,
        depth = 0,
        softness = 0,
    },
    [17] = {
        name = 'Rocky dry dirt',
        traction = 80,
        depth = 50,
        softness = 5,
    },
    [18] = {
        name = 'Dry sand',
        traction = 80,
        depth = 130,
        softness = 40,
    },
    [19] = {
        name = 'Road sand',
        traction = 90,
        depth = 30,
        softness = 5,
    },
    [20] = {
        name = 'Grainy Sand',
        traction = 80,
        depth = 100,
        softness = 10,
    },
    [21] = {
        name = 'Gravely sand',
        traction = 70,
        depth = 220,
        softness = 30,
    },
    [22] = {
        name = 'Wet hard sand',
        traction = 70,
        depth = 250,
        softness = 50,
    },
    [23] = {
        name = 'Gravel road',
        traction = 75,
        depth = 50,
        softness = 5,
    },
    [24] = {
        name = 'Wet sand',
        traction = 60,
        depth = 350,
        softness = 70,
    },
    [31] = {
        name = 'Gravely dirt/path',
        traction = 70,
        depth = 50,
        softness = 5,
    },
    [32] = {
        name = 'Gravely dirt',
        traction = 70,
        depth = 200,
        softness = 15,
    },
    [35] = {
        name = 'Tuff Sand',
        traction = 90,
        depth = 50,
        softness = 5,
    },
    [36] = {
        name = 'Dirt',
        traction = 70,
        depth = 300,
        softness = 40,
    },
    [37] = {
        name = 'Deep road sand',
        traction = 60,
        depth = 75,
        softness = 15,
    },
    [38] = {
        name = 'Rocky sand',
        traction = 70,
        depth = 150,
        softness = 10,
    },
    [40] = {
        name = 'Moist dirt path',
        traction = 60,
        depth = 150,
        softness = 50,
    },
    [41] = {
        name = 'Swamp grass',
        traction = 50,
        depth = 250,
        softness = 50,
    },
    [42] = {
        name = 'Swamp sand',
        traction = 70,
        depth = 500,
        softness = 110,
    },
    [43] = {
        name = 'Hard Sand',
        traction = 75,
        depth = 50,
        softness = 10,
    },
    [44] = {
        name = 'Dirt/Sand',
        traction = 50,
        depth = 200,
        softness = 25,
    },
    [46] = {
        name = 'Hard grass',
        traction = 80,
        depth = 50,
        softness = 5,
    },
    [47] = {
        name = 'Grass',
        traction = 65,
        depth = 125,
        softness = 10,
    },
    [48] = {
        name = 'Tall grass',
        traction = 60,
        depth = 150,
        softness = 20,
    },
    [49] = {
        name = 'Farmland',
        traction = 60,
        depth = 200,
        softness = 35,
    },
    [50] = {
        name = 'Podzol',
        traction = 70,
        depth = 125,
        softness = 25,
    },
    [51] = {
        name = 'Podzol',
        traction = 70,
        depth = 125,
        softness = 25,
    },
    [52] = {
        name = 'Dry podzol',
        traction = 80,
        depth = 75,
        softness = 10,
    },
    [64] = {
        name = 'Metal',
        traction = 90,
        depth = 0,
        softness = 0,
    },
    [125] = {
        name = 'Drain concrete',
        traction = 70,
        depth = 0,
        softness = 0,
    },
}

OfRoadCFG.zones = {
    {
        name = 'City',
        depthMultiplier = 0.3,
        tractionMultiplier = 0.6,
        zones = {
            'MOVIE',
            'ROCKF',
            'DOWNT',
            'DTVINE',
            'EAST_V',
            'GOLF',
            'LEGSQU',
            'ROCKF',
            'MORN',
            'STAD',
            'DAVIS',
            'RANCHO',
            'STRAW',
            'CHAMH',
            'PBOX',
            'SKID',
            'TEXTI',
            'LMESA',
            'ELYSIAN',
            'TERMINA',
            'HAWICK',
            'ALTA',
            'BURTON',
            'DELPE',
        },
    },
    {
        name = 'City beaches',
        depthMultiplier = 0.75,
        tractionMultiplier = 0.75,
        zones = {
            'BEACH',
            'DELBE',
        },
    },
    {
        name = 'Mountains',
        depthMultiplier = 1.25,
        tractionMultiplier = 1.1,
        zones = {
            'MTCHIL',
            'MTGORDO',
            'MTJOSE',
            'PALHIGH',
        },
    },
    {
        name = 'Zancudo Swamp',
        depthMultiplier = 1.1,
        tractionMultiplier = 1.1,
        zones = {
            'LAGO',
            'ZANCUDO',
        },
    },
    {
        name = 'Popular',
        depthMultiplier = 0.75,
        tractionMultiplier = 0.75,
        zones = {
            'PALETO',
            'HARMO',
            'GRAPES',
            'SANDY',
            'RTRAK',
            'ZQ_UAR',
            'HUMLAB',
        },
    },
}

OfRoadCFG.suspensionRefresh = {
    enabled = true,
    type = 'flag',
}

WHEEL_SIZE = 'kq_wheelsize_'

WHEEL_DEPTH = 'kq_wheel_depth_'
