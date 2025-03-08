CONFIG_SHOP_ROBBERY = {}

CONFIG_SHOP_ROBBERY.Cops = 2
CONFIG_SHOP_ROBBERY.Shops = {
    { name = 'sup1',  pos = vector3(-1223.568, -906.8078, 12.32636), pedPos = vector3(-1222.013, -908.3307, 12.32636),      heading = 33.729988098145, model = "a_m_y_downtown_01" },
    { name = 'sup2',  pos = vector3(-1487.383, -379.9128, 40.16346), pedPos = vector3(-1486.264, -377.9792, 40.16346),      heading = 135.37841796875, model = "a_m_y_downtown_01" },
    { name = 'sup3',  pos = vector3(374.7773, 327.4552, 103.5664),   pedPos = vector3(372.9586, 328.1214, 103.5664),        heading = 253.36183166504, model = "a_m_y_downtown_01" },
    { name = 'sup4',  pos = vector3(2677.428, 3281.84, 55.24115),    pedPos = vector3(2676.584, 3280.213, 55.24115),        heading = 330.03747558594, model = "a_m_y_downtown_01" },
    { name = 'sup6',  pos = vector3(1698.119, 4924.818, 42.06366),   pedPos = vector3(1697.294, 4923.474, 42.06366),        heading = 323.47631835938, model = "a_m_y_downtown_01" },
    { name = 'sup7',  pos = vector3(-2968.314, 390.9538, 15.04331),  pedPos = vector3(-2966.422, 390.9301, 15.04331),       heading = 84.103271484375, model = "a_m_y_downtown_01" },
    { name = 'sup8',  pos = vector3(1163.222, -323.9108, 69.2051),   pedPos = vector3(1164.839, -323.5992, 69.2051),        heading = 98.695465087891, model = "a_m_y_downtown_01" },
    { name = 'sup9',  pos = vector3(1137.255, -981.4174, 46.41582),  pedPos = vector3(1134.229, -982.5135, 46.41582),       heading = 278.07983398438, model = "a_m_y_downtown_01" },
    { name = 'sup10', pos = vector3(1137.255, -981.4174, 46.41582),  pedPos = vector3(1743.901001, 3613.169434, 34.888447), heading = 304.10610961914, model = "a_m_y_downtown_01" },
}

Banks = {
	-- ["fleeca"] = {
	-- 	position = vector3(146.8011, -1044.848, 29.36801),
	-- 	reward = math.random(100000,150000),
	-- 	nameofbank = "Fleeca Bank",
	-- 	lastrobbed = 15200
	-- },
	["fleeca2"] = {
		position = vector3(-2957.6674804688, 481.45776367188, 15.697026252747),
		reward = math.random(20000,50000),
		nameofbank = "Fleeca",
		lastrobbed = 15200
	},
	["blainecounty"] = {
		position = vector3(-97.158584594727, 6460.59375, 31.634115219116),
		reward = math.random(20000,50000),
		nameofbank = "Fleeca",
		lastrobbed = 15200
	},
    ["flreecanorth"] = {
		position = vector3(310.472992, -283.313599, 54.174522),
		reward = math.random(20000,50000),
		nameofbank = "Fleeca",
		lastrobbed = 15200
	},
    ["flreecaaaaaa"] = {
		position = vector3(-1211.620972, -336.082886, 37.790779),
		reward = math.random(20000,50000),
		nameofbank = "Fleeca",
		lastrobbed = 15200
	},
	-- ["PrincipalBank"] = {
	-- 	position = vector3(236.65756225586,229.15179443359, 97.117164611816),
	-- 	reward = math.random(200000,300000),
	-- 	nameofbank = "Principal bank",
	-- 	lastrobbed = 28400
	-- }
}

CONFIG_BRAQUAGE_MAISON = {
	List = {
		-- Favelas cambriolage
		{name = "Braquage de Maison", position = vector3(924.040222, -525.627991, 59.784012), interior = vector3(346.672546, -1012.613281, -99.196175), objects = {
			{
				position = vec3(343.815002, -1002.915100, -99.196266),
				price = math.random(1200,2200)
			},
			{
				position = vec3(338.299591, -995.551758, -99.196266),
				price = math.random(1200,2200)
			},
		        {
				position = vec3(351.427429, -998.973877, -99.196213),
				price = math.random(1200,2200)
			},
		        {
				position = vec3(351.216309, -993.687622, -99.196175),
				price = math.random(1200,2200)
			},
		        {
				position = vec3(349.636871, -994.680298, -99.195839),
				price = math.random(1200,2200)
			},
		        {
				position = vec3(341.599731, -997.320007, -99.196205),
				price = math.random(1200,2200)
			},
			{
				position = vec3(345.300659, -995.070862, -99.196266),
				price = math.random(1200,2200)
			}
		}},

		{name = "Braquage de Maison", position = vector3(850.570862, -532.763489, 57.925419), interior = vector3(346.672546, -1012.613281, -99.196175), objects = {
			{
				position = vec3(343.815002, -1002.915100, -99.196266),
				price = math.random(1200,2200)
			},
			{
				position = vec3(338.299591, -995.551758, -99.196266),
				price = math.random(1200,2200)
			},
		        {
				position = vec3(351.427429, -998.973877, -99.196213),
				price = math.random(1200,2200)
			},
		        {
				position = vec3(351.216309, -993.687622, -99.196175),
				price = math.random(1200,2200)
			},
		        {
				position = vec3(349.636871, -994.680298, -99.195839),
				price = math.random(1200,2200)
			},
		        {
				position = vec3(341.599731, -997.320007, -99.196205),
				price = math.random(1200,2200)
			},
			{
				position = vec3(345.300659, -995.070862, -99.196266),
				price = math.random(1200,2200)
			}
		}},

		{name = "Braquage de Maison", position = vector3(963.884216, -595.859741, 59.902691), interior = vector3(346.672546, -1012.613281, -99.196175), objects = {
			{
				position = vec3(343.815002, -1002.915100, -99.196266),
				price = math.random(1200,2200)
			},
			{
				position = vec3(338.299591, -995.551758, -99.196266),
				price = math.random(1200,2200)
			},
		        {
				position = vec3(351.427429, -998.973877, -99.196213),
				price = math.random(1200,2200)
			},
		        {
				position = vec3(351.216309, -993.687622, -99.196175),
				price = math.random(1200,2200)
			},
		        {
				position = vec3(349.636871, -994.680298, -99.195839),
				price = math.random(1200,2200)
			},
		        {
				position = vec3(341.599731, -997.320007, -99.196205),
				price = math.random(1200,2200)
			},
			{
				position = vec3(345.300659, -995.070862, -99.196266),
				price = math.random(1200,2200)
			}
		}},

		{name = "Braquage de Maison", position = vector3(997.425720, -729.299316, 57.815739), interior = vector3(346.672546, -1012.613281, -99.196175), objects = {
			{
				position = vec3(343.815002, -1002.915100, -99.196266),
				price = math.random(1200,2200)
			},
			{
				position = vec3(338.299591, -995.551758, -99.196266),
				price = math.random(1200,2200)
			},
		        {
				position = vec3(351.427429, -998.973877, -99.196213),
				price = math.random(1200,2200)
			},
		        {
				position = vec3(351.216309, -993.687622, -99.196175),
				price = math.random(1200,2200)
			},
		        {
				position = vec3(349.636871, -994.680298, -99.195839),
				price = math.random(1200,2200)
			},
		        {
				position = vec3(341.599731, -997.320007, -99.196205),
				price = math.random(1200,2200)
			},
			{
				position = vec3(345.300659, -995.070862, -99.196266),
				price = math.random(1200,2200)
			}
		}},

		{name = "Braquage de Maison", position = vector3(971.061523, -700.988953, 58.481956), interior = vector3(346.672546, -1012.613281, -99.196175), objects = {
			{
				position = vec3(343.815002, -1002.915100, -99.196266),
				price = math.random(1200,2200)
			},
			{
				position = vec3(338.299591, -995.551758, -99.196266),
				price = math.random(1200,2200)
			},
		        {
				position = vec3(351.427429, -998.973877, -99.196213),
				price = math.random(1200,2200)
			},
		        {
				position = vec3(351.216309, -993.687622, -99.196175),
				price = math.random(1200,2200)
			},
		        {
				position = vec3(349.636871, -994.680298, -99.195839),
				price = math.random(1200,2200)
			},
		        {
				position = vec3(341.599731, -997.320007, -99.196205),
				price = math.random(1200,2200)
			},
			{
				position = vec3(345.300659, -995.070862, -99.196266),
				price = math.random(1200,2200)
			}
		}},
        -- Vinewood cambriolage
		{name = "Braquage de Maison", position = vector3(-606.287964, 672.457153, 151.597153), interior = vector3(-174.240952, 497.618958, 137.666977), objects = {
			{
				position = vec3(-170.342621, 482.941803, 137.244232),
				price = math.random(1300,2400)
			},
			{
				position = vec3(-170.378906, 481.648407, 133.846680),
				price = math.random(1300,2400)
			},
		        {
				position = vec3(-162.856369, 481.674713, 133.869553),
				price = math.random(1300,2400)
			},
		        {
				position = vec3(-172.517410, 500.608124, 130.040268),
				price = math.random(1300,2400)
			},
		        {
				position = vec3(-170.146118, 491.205780, 130.043686),
				price = math.random(1300,2400)
			},
		        {
				position = vec3(-175.126892, 492.961182, 130.043716),
				price = math.random(1300,2400)
			}
		}},

		{name = "Braquage de Maison", position = vector3(-931.567810, 808.210083, 184.781067), interior = vector3(-174.240952, 497.618958, 137.666977), objects = {
			{
				position = vec3(-170.342621, 482.941803, 137.244232),
				price = math.random(1300,2400)
			},
			{
				position = vec3(-170.378906, 481.648407, 133.846680),
				price = math.random(1300,2400)
			},
		        {
				position = vec3(-162.856369, 481.674713, 133.869553),
				price = math.random(1300,2400)
			},
		        {
				position = vec3(-172.517410, 500.608124, 130.040268),
				price = math.random(1300,2400)
			},
		        {
				position = vec3(-170.146118, 491.205780, 130.043686),
				price = math.random(1300,2400)
			},
		        {
				position = vec3(-175.126892, 492.961182, 130.043716),
				price = math.random(1300,2400)
			}
		}},

		{name = "Braquage de Maison", position = vector3(-185.315887, 591.404846, 197.823044), interior = vector3(-174.240952, 497.618958, 137.666977), objects = {
			{
				position = vec3(-170.342621, 482.941803, 137.244232),
				price = math.random(1300,2400)
			},
			{
				position = vec3(-170.378906, 481.648407, 133.846680),
				price = math.random(1300,2400)
			},
		        {
				position = vec3(-162.856369, 481.674713, 133.869553),
				price = math.random(1300,2400)
			},
		        {
				position = vec3(-172.517410, 500.608124, 130.040268),
				price = math.random(1300,2400)
			},
		        {
				position = vec3(-170.146118, 491.205780, 130.043686),
				price = math.random(1300,2400)
			},
		        {
				position = vec3(-175.126892, 492.961182, 130.043716),
				price = math.random(1300,2400)
			}
		}},

		{name = "Braquage de Maison", position = vector3(315.885101, 500.885071, 153.179764), interior = vector3(-174.240952, 497.618958, 137.666977), objects = {
			{
				position = vec3(-170.342621, 482.941803, 137.244232),
				price = math.random(1300,2400)
			},
			{
				position = vec3(-170.378906, 481.648407, 133.846680),
				price = math.random(1300,2400)
			},
		        {
				position = vec3(-162.856369, 481.674713, 133.869553),
				price = math.random(1300,2400)
			},
		        {
				position = vec3(-172.517410, 500.608124, 130.040268),
				price = math.random(1300,2400)
			},
		        {
				position = vec3(-170.146118, 491.205780, 130.043686),
				price = math.random(1300,2400)
			},
		        {
				position = vec3(-175.126892, 492.961182, 130.043716),
				price = math.random(1300,2400)
			}
		}},

		{name = "Braquage de Maison", position = vector3(84.881340, 562.309448, 182.572464), interior = vector3(-174.240952, 497.618958, 137.666977), objects = {
			{
				position = vec3(-170.342621, 482.941803, 137.244232),
				price = math.random(1300,2400)
			},
			{
				position = vec3(-170.378906, 481.648407, 133.846680),
				price = math.random(1300,2400)
			},
		        {
				position = vec3(-162.856369, 481.674713, 133.869553),
				price = math.random(1300,2400)
			},
		        {
				position = vec3(-172.517410, 500.608124, 130.040268),
				price = math.random(1300,2400)
			},
		        {
				position = vec3(-170.146118, 491.205780, 130.043686),
				price = math.random(1300,2400)
			},
		        {
				position = vec3(-175.126892, 492.961182, 130.043716),
				price = math.random(1300,2400)
			}
		}},

		{name = "Braquage de Maison", position = vector3(-967.827759, 436.632019, 80.571877), interior = vector3(-174.240952, 497.618958, 137.666977), objects = {
			{
				position = vec3(-170.342621, 482.941803, 137.244232),
				price = math.random(1300,2400)
			},
			{
				position = vec3(-170.378906, 481.648407, 133.846680),
				price = math.random(1300,2400)
			},
		        {
				position = vec3(-162.856369, 481.674713, 133.869553),
				price = math.random(1300,2400)
			},
		        {
				position = vec3(-172.517410, 500.608124, 130.040268),
				price = math.random(1300,2400)
			},
		        {
				position = vec3(-170.146118, 491.205780, 130.043686),
				price = math.random(1300,2400)
			},
		        {
				position = vec3(-175.126892, 492.961182, 130.043716),
				price = math.random(1300,2400)
			}
		}},

		-- Boite de nuit

		{name = "Braquage de Garage", position = vector3(318.9869, 268.3438, 104.5283), interior = vector3(971.1348, -2988.5483, -39.6470), objects = {
			{
				position = vec3(968.4982, -3001.7983, -39.6470),
				price = math.random(2500,3200)
			},
			{
				position = vec3(972.1298, -3022.6807, -39.6471),
				price = math.random(2500,3200)
			},
		        {
				position = vec3(963.3402, -3016.9441, -39.6470),
				price = math.random(2500,3200)
			},
		        {
				position = vec3(1010.0809, -3012.2661, -39.6470),
				price = math.random(2500,3200)
			},
		        {
				position = vec3(997.1898, -2988.4272, -39.6470),
				price = math.random(2500,3200)
			},
		        {
				position = vec3(953.0372, -2992.1863, -39.6469),
				price = math.random(2500,3200)
			}
		}},

		-- bloods 

		{name = "Braquage de Maison", position = vector3(-1582.911377, -266.161865, 48.275646), interior = vector3(117.162804, 559.649353, 184.304855), objects = {
			{
				position = vec3(124.667374, 547.583618, 184.096863),
				price = math.random(2900,3600)
			},
			{
				position = vec3(118.404289, 544.114624, 183.897629),
				price = math.random(2900,3600)
			},
		        {
				position = vec3(118.633614, 543.246094, 180.511642),
				price = math.random(2900,3600)
			},
		        {
				position = vec3(118.531563, 566.452637, 176.697144),
				price = math.random(2900,3600)
			},
		        {
				position = vec3(114.557762, 568.647644, 176.697144),
				price = math.random(2900,3600)
			}
		}},

		-- entrepot 


		{name = "Braquage de Maison", position = vector3(991.169373, -2430.944092, 31.242449), interior = vector3(-1507.735352, -3015.324707, -79.242065), objects = {
			{
				position = vec3(-1519.210938, -3029.658936, -79.242172),
				price = math.random(2900,3600)
			},
			{
				position = vec3(-1515.710205, -3018.509766, -79.242188),
				price = math.random(2900,3600)
			},
		        {
				position = vec3(-1509.354370, -3004.514893, -81.559998),
				price = math.random(2900,3600)
			},
		        {
				position = vec3(-1519.279785, -3042.285400, -79.242195),
				price = math.random(2900,3600)
			},
		        {
				position = vec3(-1498.100830, -3043.149414, -79.242195),
				price = math.random(2900,3600)
			}
		}},
		
	}
}