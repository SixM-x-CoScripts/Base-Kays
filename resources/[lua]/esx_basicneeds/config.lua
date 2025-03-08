Config = {}
Config.Locale = GetConvar('esx:locale', 'fr')
Config.Visible = true

Config.Items = {

	["sw"] = {
		type = "food",
		prop = "v_res_fa_bread03",
		status = 140000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["bread"] = {
		type = "food",
		prop = "v_res_fa_bread03",
		status = 200000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["tacosxll"] = {
		type = "food",
		prop = "v_res_fa_bread03",
		status = 180000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["tacos3"] = {
		type = "food",
		prop = "v_res_fa_bread03",
		status = 170000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["tacos2"] = {
		type = "food",
		prop = "v_res_fa_bread03",
		status = 160000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["sundaynature"] = {
		type = "drink",
		prop = "v_res_fa_bread03",
		status = 200000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["sundayfraise"] = {
		type = "drink",
		prop = "v_res_fa_bread03",
		status = 200000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["frite"] = {
		type = "food",
		prop = "v_res_fa_bread03",
		status = 140000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["petitefrite"] = {
		type = "food",
		prop = "v_res_fa_bread03",
		status = 140000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["moyennefrite"] = {
		type = "food",
		prop = "v_res_fa_bread03",
		status = 140000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["grandefrite"] = {
		type = "food",
		prop = "v_res_fa_bread03",
		status = 150000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["grand_cru"] = {
		type = "drink",
		prop = "v_res_fa_winebottle",
		status = 200000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["vinrouge"] = {
		type = "drink",
		prop = "v_res_fa_winebottle",
		status = 170000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["vinblanc"] = {
		type = "drink",
		prop = "v_res_fa_winebottle",
		status = 150000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["vinrose"] = {
		type = "drink",
		prop = "v_res_fa_winebottle",
		status = 150000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["elixirblanco"] = {
		type = "drink",
		prop = "v_res_fa_winebottle",
		status = 150000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["cocktailmaison"] = {
		type = "drink",
		prop = "v_res_fa_winebottle",
		status = 150000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["elixir"] = {
		type = "drink",
		prop = "v_res_fa_bread03",  -- Remplacez par le prop approprié
		status = 150000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["mangoloco"] = {
		type = "drink",
		prop = "v_res_fa_bread03",  -- Remplacez par le prop approprié
		status = 180000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["heineken"] = {
		type = "drink",
		prop = "v_res_fa_bread03",  -- Remplacez par le prop approprié
		status = 180000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["caprisun"] = {
		type = "drink",
		prop = "v_res_fa_bread03",  -- Remplacez par le prop approprié
		status = 180000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["gitanes"] = {
		type = "smoke",
		prop = "v_res_fa_bread03",  -- Remplacez par le prop approprié
		status = -1000,
		remove = true,
		anim = {dict = 'mp_player_int_cigarette', name = 'mp_player_int_cigarette', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["malboro"] = {
		type = "smoke",
		prop = "v_res_fa_bread03",  -- Remplacez par le prop approprié
		status = -1000,
		remove = true,
		anim = {dict = 'mp_player_int_cigarette', name = 'mp_player_int_cigarette', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["pepsi"] = {
		type = "drink",
		prop = "prop_cs_soda_can",  -- Remplacez par le prop approprié
		status = 150000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["sprite"] = {
		type = "drink",
		prop = "prop_cs_soda_can",  -- Remplacez par le prop approprié
		status = 150000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["ricard"] = {
		type = "drink",
		prop = "prop_cs_soda_can",  -- Remplacez par le prop approprié
		status = 150000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["morgane"] = {
		type = "drink",
		prop = "prop_cs_soda_can",  -- Remplacez par le prop approprié
		status = 150000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["cappuccino"] = {
		type = "drink",
		prop = "prop_cs_soda_can",  -- Remplacez par le prop approprié
		status = 120000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["nioki"] = {
		type = "food",
		prop = "prop_cs_soda_can",  -- Remplacez par le prop approprié
		status = 200000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["glacealitalienne"] = {
		type = "food",
		prop = "prop_cs_soda_can",  -- Remplacez par le prop approprié
		status = 200000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["rhum"] = {
		type = "drink",
		prop = "prop_cs_soda_can",  -- Remplacez par le prop approprié
		status = 120000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["rhumcoca"] = {
		type = "drink",
		prop = "prop_cs_soda_can",  -- Remplacez par le prop approprié
		status = 120000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["vodka"] = {
		type = "drink",
		prop = "prop_cs_soda_can",  -- Remplacez par le prop approprié
		status = 120000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["vodkafruit"] = {
		type = "drink",
		prop = "prop_cs_soda_can",  -- Remplacez par le prop approprié
		status = 120000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["vodkaenergy"] = {
		type = "drink",
		prop = "prop_cs_soda_can",  -- Remplacez par le prop approprié
		status = 120000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["whisky"] = {
		type = "drink",
		prop = "prop_cs_soda_can",  -- Remplacez par le prop approprié
		status = 120000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["whiskycoca"] = {
		type = "drink",
		prop = "prop_cs_soda_can",  -- Remplacez par le prop approprié
		status = 120000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["tequila"] = {
		type = "drink",
		prop = "prop_cs_soda_can",  -- Remplacez par le prop approprié
		status = 120000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["pibwasser"] = {
		type = "drink",
		prop = "prop_cs_soda_can",  -- Remplacez par le prop approprié
		status = 150000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["pastis"] = {
		type = "drink",
		prop = "prop_cs_soda_can",  -- Remplacez par le prop approprié
		status = 150000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["siredward"] = {
		type = "drink",
		prop = "prop_cs_soda_can",  -- Remplacez par le prop approprié
		status = 150000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["belini"] = {
		type = "drink",
		prop = "prop_cs_soda_can",  -- Remplacez par le prop approprié
		status = 150000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["saucisson"] = {
		type = "food",
		prop = "prop_cs_soda_can",  -- Remplacez par le prop approprié
		status = 140000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["bolcacahuetes"] = {
		type = "food",
		prop = "prop_cs_soda_can",  -- Remplacez par le prop approprié
		status = 180000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["caviar"] = {
		type = "food",
		prop = "prop_cs_soda_can",  -- Remplacez par le prop approprié
		status = 180000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["salami"] = {
		type = "food",
		prop = "prop_cs_soda_can",  -- Remplacez par le prop approprié
		status = 180000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["coffe"] = {
		type = "drink",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le café, à ajouter si nécessaire
		status = 300000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = _U('used_coffe')
	},

	["bolnoixcajou"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le bol de noix de cajou, à ajouter si nécessaire
		status = 300000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = _U('used_bolnoixcajou')
	},

	["bolpistache"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le bol de pistaches, à ajouter si nécessaire
		status = 350000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = _U('used_bolpistache')
	},

	["water"] = {
		type = "drink",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour l'eau, à ajouter si nécessaire
		status = 200000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Eau"
	},

	["jager"] = {
		type = "drink",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le Jägermeister, à ajouter si nécessaire
		status = 120000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Jägermeister"
	},

	["chocolat"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le chocolat, à ajouter si nécessaire
		status = 150000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = _U('used_chocolate')
	},

	["applepie"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour la tarte aux pommes, à ajouter si nécessaire
		status = 350000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = _U('used_applepie')
	},

	["bolchips"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le bol de chips, à ajouter si nécessaire
		status = 300000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Bol de Chips"
	},

	["banana"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour la banane, à ajouter si nécessaire
		status = 200000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = _U('used_banana')
	},

	["beef"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le boeuf, à ajouter si nécessaire
		status = 350000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = _U('used_beef')
	},

	["hamburger"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le hamburger, à ajouter si nécessaire
		status = 350000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = _U('used_hamburger')
	},

	["casino_burger"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le casino burger, à ajouter si nécessaire
		status = 350000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Burger"
	},
	["cupcake"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le cupcake, à ajouter si nécessaire
		status = 250000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = _U('used_cupcake')
	},

	["donut"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le donut, à ajouter si nécessaire
		status = 250000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = _U('used_donut')
	},

	["soda"] = {
		type = "drink",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour la soda, à ajouter si nécessaire
		status = 250000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = _U('used_soda')
	},

	["jusfruit"] = {
		type = "drink",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le jus de fruit, à ajouter si nécessaire
		status = 290000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = _U('used_jusfruit')
	},

	["mixapero"] = {
		type = "drink",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le mix apéro, à ajouter si nécessaire
		status = 300000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = _U('used_mixapero')
	},

	["mojito"] = {
		type = "drink",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le mojito, à ajouter si nécessaire
		status = 340000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = _U('used_mojito')
	},

	["limonade"] = {
		type = "drink",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour la limonade, à ajouter si nécessaire
		status = 290000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = _U('used_limonade')
	},

	["cocacola"] = {
		type = "drink",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour la Coca-Cola, à ajouter si nécessaire
		status = 290000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = _U('used_cocacola')
	},

	["cola"] = {
		type = "drink",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour la cola, à ajouter si nécessaire
		status = 290000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = _U('used_cola')
	},

	["drink_burgershot"] = {
		type = "drink",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour la boisson BurgerShot, à ajouter si nécessaire
		status = 290000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Boisson BurgerShot"
	},

	["loka"] = {
		type = "drink",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le Loka, à ajouter si nécessaire
		status = 300000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = _U('used_loka')
	},

	["pizza"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour la pizza, à ajouter si nécessaire
		status = 400000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = _U('used_pizza')
	},

	["ice"] = {
		type = "drink",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour la glace, à ajouter si nécessaire
		status = 200000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = _U('used_ice')
	},

	["coca"] = {
		type = "drink",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour la Coca-Cola, à ajouter si nécessaire
		status = 120000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Coca-Cola"
	},

	["fanta"] = {
		type = "drink",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le Fanta, à ajouter si nécessaire
		status = 120000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Fanta"
	},

	["icetea"] = {
		type = "drink",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour l'IceTea, à ajouter si nécessaire
		status = 120000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 IceTea"
	},

	["fish"] = {
		type = "drink",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le fish, à ajouter si nécessaire
		status = 250000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = _U('used_fish')
	},

	["energy"] = {
		type = "drink",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour l'energy, à ajouter si nécessaire
		status = 300000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = _U('used_energy')
	},

	["chips"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour les chips, à ajouter si nécessaire
		status = 200000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = _U('used_chips')
	},

	["burgershot_burger"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le BurgerShot Burger, à ajouter si nécessaire
		status = 300000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Burger"
	},

	["burgershot_chesseburger"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le BurgerShot CheeseBurger, à ajouter si nécessaire
		status = 300000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 CheeseBurger"
	},

	["burgershot_baconburger"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le BurgerShot BaconBurger, à ajouter si nécessaire
		status = 300000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Bacon Burger"
	},

	["burgershot_frite"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour les frites, à ajouter si nécessaire
		status = 200000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Frites"
	},

	["burgershot_oignonrings"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour les oignons, à ajouter si nécessaire
		status = 250000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Oignon Rings"
	},

	["burgershot_poulet"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour les nuggets poulet, à ajouter si nécessaire
		status = 250000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Nuggets Poulet"
	},

	["burgershot_milkshake"] = {
		type = "drink",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le milkshake, à ajouter si nécessaire
		status = 170000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Milkshake"
	},

	["burgershot_coca"] = {
		type = "drink",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour la Coca, à ajouter si nécessaire
		status = 170000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Coca"
	},

	["burgershot_sprite"] = {
		type = "drink",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour la Sprite, à ajouter si nécessaire
		status = 170000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Sprite"
	},

	["burgershot_biere"] = {
		type = "drink",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour la bière, à ajouter si nécessaire
		status = 170000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Biere"
	},

	["burgershot_cookie"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour les cookies, à ajouter si nécessaire
		status = 100000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Cookies"
	},

	--Horny's--
	["hornys_glace"] = {
		type = "drink",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le BurgerShot Burger, à ajouter si nécessaire
		status = 150000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Glace"
	},

	--Pearl's--
	["pearls_fishandchips"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le BurgerShot BaconBurger, à ajouter si nécessaire
		status = 300000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Fish And Chips"
	},

	["pearls_moulefrite"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le BurgerShot BaconBurger, à ajouter si nécessaire
		status = 250000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Moule Frite"
	},

	["pearls_crevette"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le BurgerShot BaconBurger, à ajouter si nécessaire
		status = 200000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Crevette"
	},

	--WiWang--
	["wiwang_vin"] = {
		type = "drink",
		prop = "v_res_fa_winebottle",
		status = 170000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["wiwang_donperignon"] = {
		type = "drink",
		prop = "v_res_fa_winebottle",
		status = 170000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["wiwang_ruinart"] = {
		type = "drink",
		prop = "v_res_fa_winebottle",
		status = 170000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["wiwang_cocktail"] = {
		type = "drink",
		prop = "v_res_fa_winebottle",
		status = 170000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["wiwang_juspassion"] = {
		type = "drink",
		prop = "v_res_fa_winebottle",
		status = 170000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["wiwang_caviar"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le BurgerShot BaconBurger, à ajouter si nécessaire
		status = 200000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Caviar"
	},
	["wiwang_macarons"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le BurgerShot BaconBurger, à ajouter si nécessaire
		status = 200000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Macarons"
	},

	--Pacific Bluff--

	["pacific_pina"] = {
		type = "drink",
		prop = "v_res_fa_winebottle",
		status = 170000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["pacific_mojito"] = {
		type = "drink",
		prop = "v_res_fa_winebottle",
		status = 170000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["pacific_margarita"] = {
		type = "drink",
		prop = "v_res_fa_winebottle",
		status = 170000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["pacific_coco"] = {
		type = "drink",
		prop = "v_res_fa_winebottle",
		status = 170000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["pacific_smoothie"] = {
		type = "drink",
		prop = "v_res_fa_winebottle",
		status = 170000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["pacific_chips"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le BurgerShot BaconBurger, à ajouter si nécessaire
		status = 200000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Chips"
	},
	["pacific_brochettes"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le BurgerShot BaconBurger, à ajouter si nécessaire
		status = 200000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Brochette"
	},

	--Unicorn--
	["unicorn_wisky"] = {
		type = "drink",
		prop = "v_res_fa_winebottle",
		status = 170000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},	["unicorn_tequila"] = {
		type = "drink",
		prop = "v_res_fa_winebottle",
		status = 170000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},	["unicorn_vodka"] = {
		type = "drink",
		prop = "v_res_fa_winebottle",
		status = 170000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},	["unicorn_pepsi"] = {
		type = "drink",
		prop = "v_res_fa_winebottle",
		status = 170000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},	["unicorn_jusorange"] = {
		type = "drink",
		prop = "v_res_fa_winebottle",
		status = 170000,
		remove = true,
		anim = {dict = 'mp_player_intdrink@burger', name = 'mp_player_intdrink_drink_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}}
	},
	["unicorn_poulet"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le BurgerShot BaconBurger, à ajouter si nécessaire
		status = 200000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Ailes de poulet"
	},

	["unicorn_miniburger"] = {
		type = "food",
		prop = "prop_ld_flow_bottle", -- Propriétés du prop pour le BurgerShot BaconBurger, à ajouter si nécessaire
		status = 200000,
		remove = true,
		anim = {dict = 'mp_player_inteat@burger', name = 'mp_player_int_eat_burger_fp', settings = {8.0, -8, -1, 49, 0, 0, 0, 0}},
		notification = "Vous avez consommé ~y~x1 Mini Burger"
	},

}
