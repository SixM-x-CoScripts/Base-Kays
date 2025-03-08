BasicDefault = {male = 'Defaultmale', girl = 'Defaultfemale'}
Config.Personalmenu = {
    soceityMoney = 0,
    CarteActive = true,
    HudActive = true,
    Hud2Active = true,
    CineMod = false,

    LimitateurIndex = 1,
    Statut = "~g~Allumé",
    Indexdoor = 1,
    DoorState = {
        FrontLeft = false,
        FrontRight = false,
        BackLeft = false,
        BackRight = false,
        Hood = false,
        Trunk = false
    },
    voiture_limite = {
        "50 km/h",
        "80 km/h",
        "130 km/h",
        "Personalisée",
        "Désactiver"
    },

    Radio = {

        [1] = {
            ['police'] = true,
        },
        [2] = {
            ['police'] = true,
        },
        [3] = {
            ['police'] = true,
        },
        [4] = {
            ['police'] = true,
        },
        [5] = {
            ['police'] = true,
        },
        [6] = {
            ['sheriff'] = true,
        },
        [7] = {
            ['sheriff'] = true,
        },
        [8] = {
            ['sheriff'] = true,
        },
        [9] = {
            ['sheriff'] = true,
        },
        [10] = {
            ['sheriff'] = true,
        },
        [11] = {
            ['ambulance'] = true,

        },
        [12] = {
            ['ambulance'] = true,

        },
        [13] = {
            ['ambulance'] = true,

        },
        [14] = {
            ['ambulance'] = true,

        },
        [15] = {
            ['ambulance'] = true,

        },
        [16] = {
            ['ambulance'] = true,
            ['police'] = true,
            ['sheriff'] = true,
        },
        [17] = {
            ['ambulance'] = true,
            ['police'] = true,
            ['sheriff'] = true,

        },
        [18] = {
            ['ambulance'] = true,
            ['police'] = true,
            ['sheriff'] = true,
        },
        [19] = {
            ['ambulance'] = true,
            ['police'] = true,
            ['sheriff'] = true,
        },
        [20] = {
            ['ambulance'] = true,
            ['police'] = true,
            ['sheriff'] = true,
        },
    
        [21] = {
            ['brinks'] = true,
        },
    
        [22] = {
            ['brinks'] = true,
        },
    
        [23] = {
            ['brinks'] = true,
        },
    
        [24] = {
            ['brinks'] = true,
        },
    
        [25] = {
            ['avocat'] = true,
        },
    
        [26] = {
            ['avocat'] = true,
        },
    
        [27] = {
            ['avocat'] = true,
        },
    
        [28] = {
            ['avocat'] = true,
        },
    
        [30] = {
            ["gouv"] = true,
        },
         
        [911] = {
            ['police'] = true,
            ['brinks'] = true,
            ['sheriff'] = true,
        },
    },
    WalkStyle = {

        ["Alien"] = {
            "move_m@alien"
        },
        ["Armored"] = {
            "anim_group_move_ballistic"
        },
        ["Arrogant"] = {
            "move_f@arrogant@a"
        },
        ["Brave"] = {
            "move_m@brave"
        },
        ["Casual"] = {
            "move_m@casual@a"
        },
        ["Casual2"] = {
            "move_m@casual@b",
            "Casual 2"
        },
        ["Casual3"] = {
            "move_m@casual@c",
            "Casual 3"
        },
        ["Casual4"] = {
            "move_m@casual@d",
            "Casual 4"
        },
        ["Casual5"] = {
            "move_m@casual@e",
            "Casual 5"
        },
        ["Casual6"] = {
            "move_m@casual@f",
            "Casual 6"
        },
        ["Chichi"] = {
            "move_f@chichi"
        },
        ["Confident"] = {
            "move_m@confident"
        },
        ["Cop"] = {
            "move_m@business@a"
        },
        ["Cop2"] = {
            "move_m@business@b",
            "Cop 2"
        },
        ["Cop3"] = {
            "move_m@business@c",
            "Cop 3"
        },
        ["Defaultfemale"] = {
            "move_f@multiplayer",
            "Default Female"
        },
        ["Defaultmale"] = {
            "move_m@multiplayer",
            "Default Male"
        },
        ["Drunk"] = {
            "move_m@drunk@a"
        },
        ["Drunk2"] = {
            "move_m@buzzed",
            "Drunk 2"
        },
        ["Drunk3"] = {
            "move_m@drunk@verydrunk",
            "Drunk 3"
        },
        ["Drunk4"] = {
            "move_m@drunk@slightlydrunk",
            "Drunk 4"
        },
        ["Femme"] = {
            "move_f@femme@"
        },
        ["Fire"] = {
            "move_characters@franklin@fire"
        },
        ["Fire2"] = {
            "move_characters@michael@fire",
            "Fire 2"
        },
        ["Fire3"] = {
            "move_m@fire",
            "Fire 3"
        },
        ["Flee"] = {
            "move_f@flee@a"
        },
        ["Franklin"] = {
            "move_p_m_one"
        },
        ["Gangster"] = {
            "move_m@gangster@generic"
        },
        ["Gangster2"] = {
            "move_m@gangster@ng",
            "Gangster 2"
        },
        ["Gangster3"] = {
            "move_m@gangster@var_e",
            "Gangster 3"
        },
        ["Gangster4"] = {
            "move_m@gangster@var_f",
            "Gangster 4"
        },
        ["Gangster5"] = {
            "move_m@gangster@var_i",
            "Gangster 5"
        },
        ["Grooving"] = {
            "anim@move_m@grooving@"
        },
        ["Guard"] = {
            "move_m@prison_gaurd"
        },
        ["Handcuffs"] = {
            "move_m@prisoner_cuffed"
        },
        ["Heels"] = {
            "move_f@heels@c"
        },
        ["Heels2"] = {
            "move_f@heels@d",
            "Heels 2"
        },
        ["Hiking"] = {
            "move_m@hiking"
        },
        ["Hipster"] = {
            "move_m@hipster@a"
        },
        ["Hobo"] = {
            "move_m@hobo@a"
        },
        ["Hurry"] = {
            "move_f@hurry@a"
        },
        ["Janitor"] = {
            "move_p_m_zero_janitor"
        },
        ["Janitor2"] = {
            "move_p_m_zero_slow",
            "Janitor 2"
        },
        ["Jog"] = {
            "move_m@jog@"
        },
        ["Lemar"] = {
            "anim_group_move_lemar_alley"
        },
        ["Lester"] = {
            "move_heist_lester"
        },
        ["Lester2"] = {
            "move_lester_caneup",
            "Lester 2"
        },
        ["Maneater"] = {
            "move_f@maneater"
        },
        ["Michael"] = {
            "move_ped_bucket"
        },
        ["Money"] = {
            "move_m@money"
        },
        ["Muscle"] = {
            "move_m@muscle@a"
        },
        ["Posh"] = {
            "move_m@posh@"
        },
        ["Posh2"] = {
            "move_f@posh@",
            "Posh 2"
        },
        ["Quick"] = {
            "move_m@quick"
        },
        ["Runner"] = {
            "female_fast_runner"
        },
        ["Sad"] = {
            "move_m@sad@a"
        },
        ["Sassy"] = {
            "move_m@sassy"
        },
        ["Sassy2"] = {
            "move_f@sassy",
            "Sassy 2"
        },
        ["Scared"] = {
            "move_f@scared"
        },
        ["Sexy"] = {
            "move_f@sexy@a"
        },
        ["Shady"] = {
            "move_m@shadyped@a"
        },
        ["Slow"] = {
            "move_characters@jimmy@slow@"
        },
        ["Swagger"] = {
            "move_m@swagger"
        },
        ["Tough"] = {
            "move_m@tough_guy@"
        },
        ["Tough2"] = {
            "move_f@tough_guy@",
            "Tough 2"
        },
        ["Trash"] = {
            "clipset@move@trash_fast_turn"
        },
        ["Trash2"] = {
            "missfbi4prepp1_garbageman",
            "Trash 2"
        },
        ["Trevor"] = {
            "move_p_m_two"
        },
        ["Wide"] = {
            "move_m@bag"
        },
        ["Chubbymale"] = {
            "move_chubby",
            "Chubby Male"
        },
        -- male
        ["Chubbyfemale"] = {
            "move_f@chubby@a",
            "Chubby Female"
        },
        -- female
        ["Depressed"] = {
            "move_m@depressed@a"
        },
        ["Depressed2"] = {
            "move_m@depressed@b",
            "Depressed 2"
        },
    },
}

Config.Personalmenu.preferences = {
        ['objects_infos'] = {
            type = 'checkbox',
            label = 'Informations Objets',
            desc = 'Permet d\'Afficher ou Non les informations des objets sur la map',
            active = false,
            action = function(bool)
                WorldProps.data.info = bool
            end,
        },
        ['clone_inventory'] = {
            type = 'checkbox',
            label = 'Clone dans L\'inventaire',
            desc = 'Permet de Marcher/Courir/Conduire avec l\'inventaire ouvert',
            active = true,
            action = function(bool)
                exports["inv"]:removePedInv(bool) 
            end,
        },
    }
    
    Config.Personalmenu.preferData = {
        {name = 'objects_infos'},
        {name = 'clone_inventory'},
}

Config.Personalmenu.guids = {
    {"Inventaire/Portefeuille/Préférences", " F5"},
    {"Menu Entreprise", " F6"},
    {"Menu Illégal", " F7"},
    {"Distance de vocal", " F11"},
    {"S'endormir/Trébuchet", " J "},
    {"Sortir/Ranger le téléphone", " G "},
    {"Ouvrir le coffre véhicule", " L ou ALT", "Maintenir et cliquer sur le véhicule."},
    {"Allumer les phares véhicules", "H"},
    {"Ouvrir/Fermer Véhicule", " U ou ALT", "Maintenir et cliquer sur le véhicule."},
    {"Lever les mains", " X"},
    {"Arreter une animation", " W"},
    {"Allumer/Menu TV", " E"},
    {"Quitter Menu TV", " Echap ou Retour"},
    {"Ceinture (Véhicules)", "K"},
    {"Plaquer les gens", " COURIR + Y", "(Uniquement pour les services publique)"},
    {"Changer de place en voiture", '& : 1 / é : 2 / " : 3 / '.."': 4"},
    {"Attribuer un véhicule à une entreprise/organisation", "F5", "F5 -> Gestion véhicule (Cette action est irreverssible)"},
}

PedListpeds = {
    normal = {
        {label = "Abigail", model = "ig_abigail", vip = 1},
        {label = "Abner", model = "u_m_y_abner", vip = 1},
        {label = "Afriamer", model = "a_m_m_afriamer_01", vip = 1},
        {label = "Agent", model = "csb_agent", vip = 1},
        {label = "Airhostess", model = "s_f_y_airhostess_01", vip = 1},
        {label = "Airworker", model = "s_m_y_airworker", vip = 1},
        {label = "Aldinapoli", model = "u_m_m_aldinapoli", vip = 1},
        {label = "Amandatownley", model = "ig_amandatownley", vip = 1},
        {label = "Ammucity", model = "s_m_y_ammucity_01", vip = 1},
        {label = "Ammucountry", model = "s_m_m_ammucountry", vip = 1},
        {label = "Andreas", model = "ig_andreas", vip = 1},
        {label = "Armboss", model = "g_m_m_armboss_01", vip = 1},
        {label = "Armgoon", model = "g_m_m_armgoon_01", vip = 1},
        {label = "Armgoon2", model = "g_m_y_armgoon_02", vip = 1},
        {label = "Armlieut", model = "g_m_m_armlieut_01", vip = 1},
        {label = "Armoured", model = "mp_s_m_armoured_01", vip = 1},
        {label = "Armoured2", model = "s_m_m_armoured_02", vip = 1},
        {label = "Armymech", model = "s_m_y_armymech_01", vip = 1},
        {label = "Ashley", model = "ig_ashley", vip = 1},
        {label = "Autopsy", model = "s_m_y_autopsy_01", vip = 1},
        {label = "Autoshop", model = "s_m_m_autoshop_01", vip = 1},
        {label = "Autoshop2", model = "s_m_m_autoshop_02", vip = 1},
        {label = "Money", model = "csb_money", vip = 1},
        {label = "Azteca", model = "g_m_y_azteca_01", vip = 1},
        {label = "BabyD", model = "u_m_y_babyd", vip = 1},
        {label = "Ballas1", model = "g_m_y_ballaeast_01", vip = 1},
        {label = "Ballas OG", model = "g_m_y_ballaorig_01", vip = 1},
        {label = "Ballas Girl", model = "g_f_y_ballas_01", vip = 1},
        {label = "Ballas OG 2", model = "ig_ballasog", vip = 1},
        {label = "Ballas 3", model = "g_m_y_ballasout_01", vip = 1},
        {label = "Bank", model = "u_m_m_bankman", vip = 1},
        {label = "Bank2", model = "ig_bankman", vip = 1},
        {label = "Barman", model = "s_m_y_barman_01", vip = 1},
        {label = "Barry", model = "ig_barry", vip = 1},
        {label = "Bartender", model = "s_f_y_bartender_01", vip = 1},
        {label = "Baygor", model = "u_m_y_baygor", vip = 1},
        {label = "Baywatch", model = "s_f_y_baywatch_01", vip = 1},
        {label = "Baywatch2", model = "s_m_y_baywatch_01", vip = 1},
        {label = "Beach", model = "a_f_m_beach_01", vip = 1},
        {label = "Beach1", model = "a_m_o_beach_01", vip = 1},
        {label = "Beach2", model = "a_m_y_beach_01", vip = 1},
        {label = "Beach3", model = "a_m_m_beach_02", vip = 1},
        {label = "Beach4", model = "a_m_y_beach_02", vip = 1},
        {label = "Beach5", model = "a_m_y_beach_03", vip = 1},
        {label = "Beachvesp", model = "a_m_y_beachvesp_01", vip = 1},
        {label = "Beachvesp2", model = "a_m_y_beachvesp_02", vip = 1},
        {label = "Benny", model = "ig_benny", vip = 1},
        {label = "Bestmen", model = "ig_bestmen", vip = 1},
        {label = "Beverly", model = "ig_beverly", vip = 1},
        {label = "Bevhills", model = "a_f_m_bevhills_01", vip = 1},
        {label = "Bevhills2", model = "a_f_y_bevhills_01", vip = 1},
        {label = "Bevhills3", model = "a_m_m_bevhills_01", vip = 1},
        {label = "Bevhills4", model = "a_m_y_bevhills_01", vip = 1},
        {label = "Bevhills5", model = "a_f_m_bevhills_02", vip = 1},
        {label = "Bevhills6", model = "a_f_y_bevhills_02", vip = 1},
        {label = "Bevhills7", model = "a_m_m_bevhills_02", vip = 1},
        {label = "Bevhills8", model = "a_m_y_bevhills_02", vip = 1},
        {label = "Bevhills9", model = "a_f_y_bevhills_03", vip = 1},
        {label = "Bikehire", model = "u_m_m_bikehire_01", vip = 1},
        {label = "BikerChic", model = "u_f_y_bikerchic", vip = 1},
        {label = "BkackOPS", model = "s_m_y_blackops_01", vip = 1},
        {label = "BkackOPS2", model = "s_m_y_blackops_02", vip = 1},
        {label = "BkackOPS3", model = "s_m_y_blackops_03", vip = 1},
        {label = "Boatstaff", model = "mp_f_boatstaff_01", vip = 1},
        {label = "Boatstaff2", model = "mp_m_boatstaff_01", vip = 1},
        {label = "Bodybuild", model = "a_f_m_bodybuild_01", vip = 1},
        {label = "Bouncer", model = "s_m_m_bouncer_01", vip = 1},
        {label = "Brad", model = "ig_brad", vip = 3},
        {label = "Breakdance", model = "a_m_y_breakdance_01", vip = 1},
        {label = "Bride", model = "ig_bride", vip = 1},
        {label = "Bugerdrug", model = "u_m_y_burgerdrug_01", vip = 1},
        {label = "Busboy", model = "s_m_y_busboy_01", vip = 1},
        {label = "Busicas", model = "a_m_y_busicas_01", vip = 1},
        {label = "Business", model = "a_f_y_business_01", vip = 1},
        {label = "Buisness", model = "a_m_m_business_01", vip = 1},
        {label = "Buisness2", model = "a_f_m_business_02", vip = 1},
        {label = "Buisness3", model = "a_m_y_business_02", vip = 1},
        {label = "Buisness4", model = "a_f_y_business_03", vip = 1}, --
        {label = "Buisness5", model = "a_m_y_business_03", vip = 1},
        {label = "Buisness6", model = "a_f_y_business_04", vip = 1},
        {label = "Busker", model = "s_m_o_busker_01", vip = 1},
        {label = "Car3guy1", model = "ig_car3guy1", vip = 1},
        {label = "Car3guy2", model = "ig_car3guy2", vip = 1},
        {label = "Carbuyer", model = "cs_carbuyer", vip = 1},
        {label = "Ccrew", model = "s_m_m_ccrew_01", vip = 1},
        {label = "Chef", model = "s_m_y_chef_01", vip = 1},
        {label = "Chef2", model = "ig_chef2", vip = 1},
        {label = "Meryweather", model = "s_m_m_chemsec_01", vip = 1},
        {label = "Chemwork", model = "g_m_m_chemwork_01", vip = 1},
        {label = "Chiboss", model = "g_m_m_chiboss_01", vip = 1},
        {label = "Chicold", model = "g_m_m_chicold_01", vip = 1},
        {label = "Chigoon", model = "g_m_m_chigoon_01", vip = 1},
        {label = "Chigoon2", model = "g_m_m_chigoon_02", vip = 1},
        {label = "Goon", model = "csb_chin_goon", vip = 1},
        {label = "Chip", model = "u_m_y_chip", vip = 1},
        {label = "Ciasec", model = "s_m_m_ciasec_01", vip = 1},
        {label = "Clay", model = "ig_clay", vip = 1},
        {label = "Claypain", model = "ig_claypain", vip = 1},
        {label = "Cletus", model = "ig_cletus", vip = 1},
        {label = "Clown", model = "s_m_y_clown_01", vip = 1},
        {label = "Cntrybar", model = "s_m_m_cntrybar_01", vip = 1},
        {label = "Comjane", model = "u_f_y_comjane", vip = 1},
        {label = "Construct", model = "s_m_y_construct_01", vip = 1},
        {label = "Construct2", model = "s_m_y_construct_02", vip = 1},
        {label = "Corpse", model = "u_f_y_corpse_02", vip = 1},
        {label = "Chrisformage", model = "ig_chrisformage", vip = 1},
        {label = "Customer", model = "csb_customer", vip = 1},
        {label = "Cyclist", model = "u_m_y_cyclist_01", vip = 1},
        {label = "Cyclist2", model = "a_m_y_cyclist_01", vip = 1},
        {label = "Dale", model = "ig_dale", vip = 1},
        {label = "Dave", model = "ig_davenorton", vip = 1},
        {label = "Dealer", model = "s_m_y_dealer_01", vip = 1},
        {label = "Debra", model = "cs_debra", vip = 1},
        {label = "Denise", model = "ig_denise", vip = 1},
        {label = "Denise2", model = "csb_denise_friend", vip = 1},
        {label = "Devin", model = "ig_devin", vip = 1},
        {label = "Devinsec", model = "s_m_y_devinsec_01", vip = 1},
        {label = "Dhill", model = "a_m_y_dhill_01", vip = 1},
        {label = "Doa", model = "u_m_m_doa_01", vip = 1},
        {label = "Dockwork", model = "s_m_m_dockwork_01", vip = 1},
        {label = "Dockwork2", model = "s_m_y_dockwork_01", vip = 1},
        {label = "Doctor", model = "s_m_m_doctor_01", vip = 1},
        {label = "Dom", model = "ig_dom", vip = 1},
        {label = "Doorman", model = "s_m_y_doorman_01", vip = 1},
        {label = "Downtown", model = "a_f_m_downtown_01", vip = 1},
        {label = "Downtown2", model = "a_m_y_downtown_01", vip = 1},
        {label = "Dreyfuss", model = "ig_dreyfuss", vip = 1},
        {label = "Drfriedlander", model = "ig_drfriedlander", vip = 1},
        {label = "Eastsa", model = "a_f_m_eastsa_01", vip = 1},
        {label = "Eastsa2", model = "a_m_m_eastsa_01", vip = 1},
        {label = "Eastsa3", model = "a_m_y_eastsa_01", vip = 1},
        {label = "Eastsa4", model = "a_f_m_eastsa_02", vip = 1},
        {label = "Eastsa5", model = "a_m_y_eastsa_02", vip = 1},
        {label = "Eastsa6", model = "a_f_y_eastsa_03", vip = 1},
        {label = "Edtoh", model = "u_m_m_edtoh", vip = 1},
        {label = "Epsilon", model = "a_f_y_epsilon_01", vip = 1},
        {label = "Epsilon2", model = "a_m_y_epsilon_01", vip = 1},
        {label = "Epsilon3", model = "a_m_y_epsilon_02", vip = 1},
        {label = "Fabien", model = "ig_fabien", vip = 1},
        {label = "Factory", model = "s_f_y_factory_01", vip = 1},
        {label = "Factory2", model = "s_m_y_factory_01", vip = 1},
        {label = "Families", model = "g_m_y_famca_01", vip = 1},
        {label = "Families2", model = "mp_m_famdd_01", vip = 1},
        {label = "Families3", model = "g_m_y_famdnf_01", vip = 1},
        {label = "Families4", model = "g_m_y_famfor_01", vip = 1},
        {label = "Families5", model = "g_f_y_families_01", vip = 1},
        {label = "Farmer", model = "a_m_m_farmer_01", vip = 1},
        {label = "Fatbla", model = "a_f_m_fatbla_01", vip = 1},
        {label = "Fatcult", model = "a_f_m_fatcult_01", vip = 1},
        {label = "Fatlatin", model = "a_m_m_fatlatin_01", vip = 1},
        {label = "Fatwhite", model = "a_f_m_fatwhite_01", vip = 1},
        {label = "Fbisuit", model = "ig_fbisuit_01", vip = 1},
        {label = "Fembarber", model = "s_f_m_fembarber", vip = 1},
        {label = "Fibarchitect", model = "u_m_m_fibarchitect", vip = 1},
        {label = "Fibmugger", model = "u_m_y_fibmugger_01", vip = 1},
        {label = "Fiboffice", model = "s_m_m_fiboffice_01", vip = 1},
        {label = "Fiboffice", model = "s_m_m_fiboffice_02", vip = 1},
        {label = "Filmdirector", model = "u_m_m_filmdirector", vip = 1},
        {label = "Filmnoir", model = "u_m_o_filmnoir", vip = 1},
        {label = "Finguru", model = "u_m_o_finguru_01", vip = 1},
        {label = "Fireman", model = "s_m_y_fireman_01", vip = 1},
        {label = "Fitness", model = "a_f_y_fitness_01", vip = 1},
        {label = "Fitness2", model = "a_f_y_fitness_02", vip = 1},
        {label = "Floyd", model = "ig_floyd", vip = 1},
        {label = "Fos", model = "csb_fos_rep", vip = 1},
        {label = "G", model = "ig_g", vip = 1},
        {label = "Gaffer", model = "s_m_m_gaffer_01", vip = 1},
        {label = "Garbage", model = "s_m_y_garbage", vip = 1},
        {label = "Gardener", model = "s_m_m_gardener_01", vip = 1},
        {label = "Garbage1", model = "a_m_y_gay_01", vip = 1},
        {label = "Garbage2", model = "a_m_y_gay_02", vip = 1},
        {label = "Genfat", model = "a_m_m_genfat_01", vip = 1},
        {label = "Genfat2", model = "a_m_m_genfat_02", vip = 1},
        {label = "Genhot", model = "a_f_y_genhot_01", vip = 1},
        {label = "Genstreet", model = "a_f_o_genstreet_01", vip = 1},
        {label = "Genstreet2", model = "a_m_o_genstreet_01", vip = 1},
        {label = "Genstreet", model = "a_m_y_genstreet_01", vip = 1},
        {label = "Genstreet3", model = "a_m_y_genstreet_02", vip = 1},
        {label = "Gentransport", model = "s_m_m_gentransport", vip = 1},
        {label = "Glenstank", model = "u_m_m_glenstank_01", vip = 3},
        {label = "Golfer", model = "a_f_y_golfer_01", vip = 1},
        {label = "Golfer2", model = "a_m_m_golfer_01", vip = 1},
        {label = "Golfer3", model = "a_m_y_golfer_01", vip = 1},
        {label = "Golfer4", model = "a_m_y_golfer_01", vip = 1},
        {label = "Griff", model = "u_m_m_griff_01", vip = 1},
        {label = "Grip", model = "s_m_y_grip_01", vip = 1},
        {label = "Groom", model = "ig_groom", vip = 1},
        {label = "Grove", model = "csb_grove_str_dlr", vip = 2},
        {label = "Guadalope", model = "cs_guadalope", vip = 2},
        {label = "Guido", model = "u_m_y_guido_01", vip = 2},
        {label = "Gunvend", model = "u_m_y_gunvend_01", vip = 2},
        {label = "Gurk", model = "cs_gurk", vip = 2},
        {label = "Hacker", model = "hc_hacker", vip = 2},
        {label = "Hairdress", model = "s_m_m_hairdress_01", vip = 2},
        {label = "Hao", model = "ig_hao", vip = 2},
        {label = "Hasjew", model = "a_m_m_hasjew_01", vip = 2},
        {label = "Hasjew2", model = "a_m_y_hasjew_01", vip = 2},
        {label = "Highsec", model = "s_m_m_highsec_01", vip = 2},
        {label = "Highsec2", model = "s_m_m_highsec_02", vip = 2},
        {label = "Hiker", model = "a_f_y_hiker_01", vip = 2},
        {label = "Hiker2", model = "a_m_y_hiker_01", vip = 2},
        {label = "Hillbilly", model = "a_m_m_hillbilly_01", vip = 2},
        {label = "Hillbilly2", model = "a_m_m_hillbilly_02", vip = 2},
        {label = "Hippie", model = "u_m_y_hippie_01", vip = 2},
        {label = "Hippie2", model = "a_f_y_hippie_01", vip = 2},
        {label = "Hippie3", model = "a_m_y_hippy_01", vip = 2},
        {label = "Hipster", model = "a_f_y_hipster_01", vip = 2},
        {label = "Hipster2", model = "a_m_y_hipster_01", vip = 2},
        {label = "Hipster3", model = "a_f_y_hipster_02", vip = 2},
        {label = "Hipster4", model = "a_m_y_hipster_02", vip = 2},
        {label = "Hipster5", model = "a_f_y_hipster_03", vip = 2},
        {label = "Hipster6", model = "a_m_y_hipster_03", vip = 2},
        {label = "Hipster7", model = "a_f_y_hipster_04", vip = 2},
        {label = "Hooker", model = "s_f_y_hooker_01", vip = 2},
        {label = "Hooker2", model = "s_f_y_hooker_02", vip = 2},
        {label = "Hooker3", model = "s_f_y_hooker_03", vip = 2},
        {label = "Hotposh", model = "u_f_y_hotposh_01", vip = 2},
        {label = "Hugh", model = "csb_hugh", vip = 2},
        {label = "Imran", model = "csb_imran", vip = 2},
        {label = "Indian", model = "a_f_o_indian_01", vip = 2},
        {label = "Indian2", model = "a_f_y_indian_01", vip = 2},
        {label = "Indian3", model = "a_m_m_indian_01", vip = 2},
        {label = "Indian4", model = "a_m_y_indian_01", vip = 2},
        {label = "Jackhowitzer", model = "csb_jackhowitzer", vip = 2},
        {label = "Janet", model = "ig_janet", vip = 3},
        {label = "Janitor", model = "csb_janitor", vip = 2},
        {label = "Norris", model = "ig_jay_norris", vip = 2},
        {label = "Jesus", model = "u_m_m_jesus_01", vip = 2},
        {label = "Jetski", model = "a_m_y_jetski_01", vip = 2},
        {label = "Jewelass", model = "u_f_y_jewelass_01", vip = 2},
        {label = "Jewelass", model = "ig_jewelass", vip = 2},
        {label = "Jewelsec", model = "u_m_m_jewelsec_01", vip = 2},
        {label = "Jewelthief", model = "u_m_m_jewelthief", vip = 2},
        {label = "Jimmyboston", model = "ig_jimmyboston", vip = 2},
        {label = "Jimmydisanto", model = "ig_jimmydisanto", vip = 2},
        {label = "Joeminuteman", model = "ig_joeminuteman", vip = 2},
        {label = "Josef", model = "ig_josef", vip = 2},
        {label = "Juggalo", model = "a_f_y_juggalo_01", vip = 2},
        {label = "Daniels", model = "cs_karen_daniels", vip = 2},
        {label = "Kerrymcintosh", model = "ig_kerrymcintosh", vip = 2},
        {label = "Korboss", model = "g_m_m_korboss_01", vip = 2},
        {label = "Korean", model = "g_m_y_korean_01", vip = 2},
        {label = "Korean2", model = "g_m_y_korean_02", vip = 2},
        {label = "Korean3", model = "g_m_y_korlieut_01", vip = 2},
        {label = "Ktown", model = "a_f_m_ktown_01", vip = 2},
        {label = "Ktown2", model = "a_f_o_ktown_01", vip = 2},
        {label = "Ktown3", model = "a_m_m_ktown_01", vip = 2},
        {label = "Ktown4", model = "a_m_o_ktown_01", vip = 2},
        {label = "Ktown5", model = "a_m_y_ktown_01", vip = 2},
        {label = "Ktown6", model = "a_f_m_ktown_022", vip = 2},
        {label = "Ktown7", model = "a_m_y_ktown_02", vip = 2},
        {label = "Lamar", model = "ig_lamardavis", vip = 2},
        {label = "Lathandy", model = "s_m_m_lathandy_01", vip = 2},
        {label = "Latino", model = "a_m_y_latino_01", vip = 2},
        {label = "Lazlow", model = "ig_lazlow", vip = 2},
        {label = "Lester", model = "ig_lestercrest", vip = 2},
        {label = "Lifeinvad", model = "ig_lifeinvad_01", vip = 2},
        {label = "Lifeinvad2", model = "ig_lifeinvad_02", vip = 2},
        {label = "Linecook", model = "s_m_m_linecook", vip = 2},
        {label = "Lost", model = "g_f_y_lost_01", vip = 2},
        {label = "Lost1", model = "g_m_y_lost_01", vip = 2},
        {label = "Lost2", model = "g_m_y_lost_02", vip = 2},
        {label = "Lost3", model = "g_m_y_lost_03", vip = 2},
        {label = "Lsmetro", model = "s_m_m_lsmetro_01", vip = 2},
        {label = "Magenta", model = "ig_magenta", vip = 2},
        {label = "Maid", model = "s_f_m_maid_01", vip = 2},
        {label = "Malibu", model = "a_m_m_malibu_01", vip = 2},
        {label = "Mani", model = "u_m_y_mani", vip = 2},
        {label = "Manuel", model = "ig_manuel", vip = 2},
        {label = "Mariachi", model = "s_m_m_mariachi_01", vip = 2},
        {label = "Marine", model = "s_m_y_marine_02", vip = 2},
        {label = "Markfost", model = "u_m_m_markfost", vip = 2},
        {label = "Marnie", model = "ig_marnie", vip = 2},
        {label = "Martinmadrazo", model = "cs_martinmadrazo", vip = 2},
        {label = "Maryann", model = "ig_maryann", vip = 2},
        {label = "Maude", model = "ig_maude", vip = 2},
        {label = "Methhead", model = "a_m_y_methhead_01", vip = 2},
        {label = "Mexboss", model = "g_m_m_mexboss_01", vip = 2},
        {label = "Mexboss2", model = "g_m_m_mexboss_02", vip = 2},
        {label = "Mexcntry", model = "a_m_m_mexcntry_01", vip = 2},
        {label = "Mexgang", model = "g_m_y_mexgang_01", vip = 2},
        {label = "Mexgoon", model = "g_m_y_mexgoon_01", vip = 2},
        {label = "Mexgoon2", model = "g_m_y_mexgoon_02", vip = 2},
        {label = "Mexgoon3", model = "g_m_y_mexgoon_03", vip = 2},
        {label = "Mexgoon4", model = "a_m_m_mexlabor_01", vip = 2},
        {label = "Mexgoon5", model = "a_m_y_mexthug_01", vip = 2},
        {label = "Michelle", model = "ig_michelle", vip = 2},
        {label = "Migrant", model = "s_f_y_migrant_01", vip = 2},
        {label = "Migrant2", model = "s_m_m_migrant_01", vip = 2},
        {label = "Militarybum", model = "u_m_y_militarybum", vip = 2},
        {label = "Milton", model = "cs_milton", vip = 2},
        {label = "Mime", model = "s_m_y_mime", vip = 2},
        {label = "Miranda", model = "u_f_m_miranda", vip = 2},
        {label = "Mistress", model = "u_f_y_mistress", vip = 2},
        {label = "Molly", model = "ig_molly", vip = 2},
        {label = "Motox", model = "a_m_y_motox_01", vip = 2},
        {label = "Motox2", model = "a_m_y_motox_02", vip = 2},
        --{label = "Movalien", model = "s_m_m_movalien_01", vip = 2},
        {label = "Movpremf", model = "cs_movpremf_01", vip = 2},
        {label = "Movpremmale", model = "cs_movpremmale", vip = 2},
        {label = "Moviestar", model = "u_f_o_moviestar", vip = 2},
        --{label = "Movspace", model = "s_m_m_movspace_01", vip = 2},
        {label = "Pros", model = "mp_g_m_pros_01", vip = 2},
        {label = "Mrk", model = "ig_mrk", vip = 2},
        {label = "Mrsphillips", model = "ig_mrsphillips", vip = 2},
        {label = "Thornhill", model = "ig_mrs_thornhill", vip = 2},
        {label = "Musclbeac", model = "a_m_y_musclbeac_01", vip = 2},
        {label = "Musclbeac2", model = "a_m_y_musclbeac_02", vip = 2},
        {label = "Natalia", model = "ig_natalia", vip = 2},
        {label = "Nervousron", model = "ig_nervousron", vip = 2},
        {label = "Nigel", model = "ig_nigel", vip = 3},
        {label = "Ogboss", model = "a_m_m_og_boss_01", vip = 2},
        {label = "Man1a", model = "ig_old_man1a", vip = 2},
        {label = "Man2", model = "ig_old_man2", vip = 2},
        {label = "Omega", model = "ig_omega", vip = 2},
        {label = "Oneil", model = "ig_oneil", vip = 2},
        {label = "Orleans", model = "ig_orleans", vip = 2},
        {label = "Ortega", model = "ig_ortega", vip = 2},
        {label = "Oscar", model = "csb_oscar", vip = 2},
        {label = "Paige", model = "ig_paige", vip = 2},
        {label = "Paparazzi", model = "a_m_m_paparazzi_01", vip = 3},
        {label = "Paparazzi2", model = "u_m_y_paparazzi", vip = 3},
        {label = "Paper", model = "ig_paper", vip = 3},
        {label = "Paramedic", model = "s_m_m_paramedic_01", vip = 3},
        {label = "Party", model = "u_m_y_party_01", vip = 3},
        {label = "Partytarge", model = "u_m_m_partytarget", vip = 3},
        {label = "Patricia", model = "ig_patricia", vip = 3},
        {label = "Pestcont", model = "s_m_y_pestcont_01", vip = 3},
        {label = "Pilot", model = "s_m_y_pilot_01", vip = 3},
        --{label = "Pogo", model = "u_m_y_pogo_01", vip = 3},
        {label = "Pologoon", model = "g_m_y_pologoon_01", vip = 3},
        {label = "Pologoon2", model = "g_m_y_pologoon_02", vip = 3},
        {label = "Polynesian", model = "a_m_m_polynesian_01", vip = 3},
        {label = "Polynesian2", model = "a_m_y_polynesian_01", vip = 3},
        {label = "Popov", model = "ig_popov", vip = 3},
        {label = "Poppymich", model = "u_f_y_poppymich", vip = 3},
        {label = "Porndudes", model = "csb_porndudes", vip = 3},
        {label = "Postal", model = "s_m_m_postal_01", vip = 3},
        {label = "Postal2", model = "s_m_m_postal_02", vip = 3},
        {label = "Priest", model = "ig_priest", vip = 3},
        {label = "Princess", model = "u_f_y_princess", vip = 3},
        {label = "Prismuscl", model = "s_m_y_prismuscl_01", vip = 3},
        {label = "Prisoner", model = "u_m_y_prisoner_01", vip = 3},
        {label = "Prisoner2", model = "s_m_y_prisoner_01", vip = 3},
        {label = "Proldriver", model = "u_m_y_proldriver_01", vip = 3},
        {label = "Prolhost", model = "u_f_o_prolhost_01", vip = 3},
        {label = "Prolhost2", model = "a_f_m_prolhost_01", vip = 3},
        {label = "Prolhost3", model = "a_m_m_prolhost_01", vip = 3},
        {label = "Promourn", model = "u_f_m_promourn_01", vip = 3},
        {label = "Promourn2", model = "u_m_m_promourn_01", vip = 3},
        {label = "Gang", model = "ig_ramp_gang", vip = 3},
        {label = "Hic", model = "ig_ramp_hic", vip = 3},
        {label = "Hipster", model = "ig_ramp_hipster", vip = 3},
        {label = "Rashcosvki", model = "ig_rashcosvki", vip = 3},
        {label = "Reporter", model = "csb_reporter", vip = 3},
        --{label = "Rsranger", model = "u_m_y_rsranger_01", vip = 3},
        {label = "Runner", model = "a_f_y_runner_01", vip = 3},
        {label = "Runner2", model = "a_m_y_runner_01", vip = 3},
        {label = "Runner3", model = "a_m_y_runner_02", vip = 3},
        {label = "Rurmeth", model = "a_f_y_rurmeth_01", vip = 3},
        {label = "Rurmeth", model = "a_m_m_rurmeth_01", vip = 3},
        {label = "Salton", model = "a_f_m_salton_01", vip = 3},
        {label = "Salton2", model = "a_f_o_salton_01", vip = 3},
        {label = "Salton3", model = "a_m_y_salton_01", vip = 3},
        {label = "Salton4", model = "a_m_m_salton_02", vip = 3},
        {label = "Salton5", model = "a_m_m_salton_03", vip = 3},
        {label = "Salton6", model = "a_m_m_salton_04", vip = 3},
        {label = "Salton7", model = "g_m_y_salvaboss_01", vip = 3},
        {label = "Salton8", model = "g_m_y_salvagoon_01", vip = 3},
        {label = "Salton9", model = "g_m_y_salvagoon_02", vip = 3},
        {label = "Salton10", model = "g_m_y_salvagoon_03", vip = 3},
        {label = "Sbike", model = "u_m_y_sbike", vip = 3},
        {label = "Scdressy", model = "a_f_y_scdressy_01", vip = 3},
        {label = "Scientist", model = "s_m_m_scientist_01", vip = 3},
        {label = "Scdressy", model = "a_f_y_scdressy_01", vip = 3},
        {label = "Shopkeep", model = "mp_m_shopkeep_01", vip = 3},
        {label = "Shop", model = "s_f_y_shop_low", vip = 3},
        {label = "Shop2", model = "s_m_y_shop_mask", vip = 3},
        {label = "Shop3", model = "s_f_y_shop_mid", vip = 3},
        {label = "Siemonyetarian", model = "ig_siemonyetarian", vip = 3},
        {label = "Skater", model = "a_f_y_skater_01", vip = 3},
        {label = "Skater2", model = "a_m_m_skater_01", vip = 3},
        {label = "Skater3", model = "a_m_y_skater_02", vip = 3},
        {label = "Skidrow", model = "a_f_m_skidrow_01", vip = 3},
        {label = "Soucent", model = "a_m_m_soucent_01", vip = 3},
        {label = "Soucent2", model = "a_m_m_soucent_03", vip = 3},
        {label = "Soucent3", model = "a_m_o_soucent_02", vip = 3},
        {label = "Soucent4", model = "a_m_y_soucent_02", vip = 3},
        {label = "Soucent4", model = "a_m_o_soucent_03", vip = 3},
        {label = "Staggrm", model = "u_m_y_staggrm_01", vip = 3},
        {label = "Stretch", model = "ig_stretch", vip = 3},
        {label = "Stripper", model = "csb_stripper_01", vip = 3},
        {label = "Stripper2", model = "csb_stripper_02", vip = 3},
        {label = "Strperf", model = "s_m_m_strperf_01", vip = 3},
        {label = "Strpreach", model = "s_m_m_strpreach_01", vip = 3},
        {label = "Strpunk", model = "g_m_y_strpunk_01", vip = 3},
        {label = "Strpunk2", model = "g_m_y_strpunk_02", vip = 3},
        {label = "Strvend", model = "s_m_m_strvend_01", vip = 3},
        {label = "Strvend2", model = "s_m_y_strvend_01", vip = 3},
        {label = "Stwhi", model = "a_m_y_stwhi_01", vip = 3},
        {label = "Taocheng", model = "ig_taocheng", vip = 3},
        {label = "Taostranslator", model = "ig_taostranslator", vip = 3},
        {label = "Taphillbilly", model = "u_m_o_taphillbilly", vip = 3},
        {label = "Tattoo", model = "u_m_y_tattoo_01", vip = 3},
        {label = "Tennis", model = "a_f_y_tennis_01", vip = 3},
        {label = "Tennis2", model = "a_m_m_tennis_01", vip = 3},
        {label = "Tenniscoach", model = "ig_tenniscoach", vip = 3},
        {label = "Terry", model = "ig_terry", vip = 3},
        {label = "Tom", model = "cs_tom", vip = 3},
        {label = "Tomepsilon", model = "cs_tomepsilon", vip = 3},
        {label = "Tonya", model = "ig_tonya", vip = 3},
        {label = "Topless", model = "a_f_y_topless_01", vip = 3},
        {label = "Tourist", model = "a_m_m_tourist_01", vip = 3},
        {label = "Tramp", model = "u_m_o_tramp_01", vip = 3},
        {label = "Tramp2", model = "a_f_m_tramp_01", vip = 3},
        {label = "Tramp3", model = "a_m_m_tramp_01", vip = 3},
        {label = "Tramp4", model = "a_m_o_tramp_01", vip = 3},
        {label = "Tramp5", model = "a_f_m_trampbeac_01", vip = 3},
        {label = "Tramp6", model = "a_m_m_trampbeac_01", vip = 3},
        {label = "Tranvest", model = "a_m_m_tranvest_01", vip = 3},
        {label = "Tranvest2", model = "a_m_m_tranvest_02", vip = 3},
        {label = "Trucker", model = "s_m_m_trucker_01", vip = 3},
        {label = "Vagfun", model = "mp_m_g_vagfun_01", vip = 3},
        {label = "Vagos", model = "g_f_y_vagos_01", vip = 3},
        {label = "Vagspeak", model = "ig_vagspeak", vip = 3},
        {label = "Valet", model = "s_m_y_valet_01", vip = 3},
        {label = "Chengsr", model = "ig_chengsr", vip = 3},
        {label = "Malc", model = "ig_malc", vip = 3},
        {label = "Cardesign", model = "mp_f_cardesign_01", vip = 3},
        {label = "Chbar", model = "mp_f_chbar_01", vip = 3},
        {label = "Cocaine", model = "mp_f_cocaine_01", vip = 3},
        {label = "Counterfeit", model = "mp_f_counterfeit_01", vip = 3},
        {label = "Meth", model = "mp_f_meth_01", vip = 3},
        {label = "Weed", model = "mp_f_weed_01", vip = 3},
        {label = "Cocaine2", model = "mp_m_cocaine_01", vip = 3},
        {label = "Counterfeit", model = "mp_m_counterfeit_01", vip = 3},
        {label = "Execpa", model = "mp_m_execpa_01", vip = 3},
        {label = "Forgery", model = "mp_m_forgery_01", vip = 3},
        {label = "Meth", model = "mp_m_meth_01", vip = 3},
        {label = "Securoguard", model = "mp_m_securoguard_01", vip = 3},
        {label = "Waremech", model = "mp_m_waremech_01", vip = 3},
        {label = "Weapexp", model = "mp_m_weapexp_01", vip = 3},
        {label = "Weapwork", model = "mp_m_weapwork_01", vip = 3},
        {label = "Weed", model = "mp_m_weed_01", vip = 3},
        {label = "Xmech", model = "s_m_y_xmech_02_mp", vip = 3},
        {label = "Streetart", model = "u_m_m_streetart_01", vip = 3},
        {label = "Lester2", model = "ig_lestercrest_2", vip = 3},
        {label = "Avongoon", model = "mp_m_avongoon", vip = 3},
        {label = "Bogdangoon", model = "mp_m_bogdangoon", vip = 3},
        {label = "Beach", model = "a_f_y_beach_02", vip = 3},
        {label = "Clubcust", model = "a_f_y_clubcust_04", vip = 3},
        {label = "Beach2", model = "a_m_o_beach_02", vip = 3},
        {label = "Beach3", model = "a_m_y_beach_04", vip = 3},
        {label = "Beach4", model = "a_m_y_clubcust_04", vip = 3},
        {label = "Patricia", model = "cs_patricia_02", vip = 3},
        {label = "Ary", model = "csb_ary", vip = 3},
        {label = "Englishdave", model = "csb_englishdave_02", vip = 3},
        {label = "Gustavo", model = "csb_gustavo", vip = 3},
        {label = "Helmsmanpavel", model = "csb_helmsmanpavel", vip = 3},
        {label = "Isldj", model = "csb_isldj_00", vip = 3},
        {label = "Isldj2", model = "csb_isldj_01", vip = 3},
        {label = "Isldj3", model = "csb_iSLdj_02", vip = 3},
        {label = "Isldj4", model = "csb_isldj_03", vip = 3},
        {label = "Isldj5", model = "csb_isldj_04", vip = 3},
        {label = "Jio", model = "csb_jio", vip = 3},
        {label = "Juanstrickler", model = "csb_juanstrickler", vip = 3},
        {label = "Miguelmadrazo", model = "csb_miguelmadrazo", vip = 3},
        {label = "Mjo", model = "csb_mjo", vip = 3},
        {label = "Sss", model = "csb_sss", vip = 3},
        {label = "Cartelguards", model = "g_m_m_cartelguards_01", vip = 3},
        {label = "Cartelguards2", model = "g_m_m_cartelguards_02", vip = 3},
        {label = "kayscorelee", model = "ig_kayscorelee", vip = 3},
        {label = "Highsec", model = "s_m_m_highsec_04", vip = 3},
        {label = "Hao", model = "CSB_Hao_02", vip = 3},
        {label = "Mimi", model = "CSB_Mimi", vip = 3},
        {label = "Sessanta", model = "CSB_Sessanta", vip = 3},
        {label = "AviSchwartzman", model = "CSB_AviSchwartzman_02", vip = 3},
        {label = "Benny", model = "IG_Benny_02", vip = 3},
        {label = "AutoShop1", model = "S_F_M_Autoshop_01", vip = 3},
        {label = "AutoShop2", model = "S_M_M_Autoshop_03", vip = 3},
        {label = "Moodyman", model = "CSB_Moodyman_02", vip = 3},
        {label = "TattooCust ", model = "A_M_Y_TattooCust_01", vip = 3},
        {label = "DrugDealer", model = "CSB_DrugDealer", vip = 3},
        {label = "LilDee", model = "IG_LilDee", vip = 3},
        {label = "Slasher", model = "G_M_M_Slasher_01", vip = 3},
        {label = "Tattoo", model = "S_M_M_Tattoo_01", vip = 3},
        {label = "Prisoners", model = "G_M_M_Prisoners_01", vip = 3},
        {label = "RetailStaff", model = "S_F_M_RetailStaff_01", vip = 3},
        {label = "CarClub", model = "A_F_Y_CarClub_01", vip = 3},
        {label = "RaceOrg", model = "S_M_M_RaceOrg_01", vip = 3},
       -- {label = "Backjoker", model = "jigsaw", vip = 3},
        --{label = "Flash", model = "flash", vip = 3},
        --{label = "Mike", model = "mike", vip = 3},
       -- {label = "LeatherFace", model = "leatherface", vip = 3},
       -- {label = "Jason", model = "jason", vip = 3},
       -- {label = "HarleyQuinn", model = "harleyquinn", vip = 3},
        --{label = "Pennywise", model = "pennywise", vip = 3},
        --{label = "Ghostface", model = "ghostface", vip = 3},
        {label = "DLC Contrat 3", model = "a_f_y_studioparty_01", vip = 3},
        {label = "DLC Contrat 4", model = "a_f_y_studioparty_02", vip = 3},
        {label = "DLC Contrat 5", model = "a_m_m_studioparty_01", vip = 3},
        {label = "DLC Contrat 6", model = "a_m_y_studioparty_01", vip = 3},
        {label = "DLC Contrat 7", model = "csb_ary_02", vip = 3},
        {label = "DLC Contrat 8", model = "csb_ballas_leader", vip = 3},
        {label = "DLC Contrat 9", model = "csb_billionaire", vip = 3},
        {label = "DLC Contrat 10", model = "csb_golfer_a", vip = 3},
        {label = "DLC Contrat 11", model = "csb_golfer_b", vip = 3},
        {label = "DLC Contrat 12", model = "csb_imani", vip = 3},
        {label = "DLC Contrat 13", model = "csb_jio_02", vip = 3},
        {label = "DLC Contrat 14", model = "csb_johnny_guns", vip = 3},
        {label = "DLC Contrat 15", model = "csb_mjo_02", vip = 3},
        {label = "DLC Contrat 16", model = "csb_musician_00", vip = 3},
        {label = "DLC Contrat 17", model = "csb_party_promo", vip = 3},
        {label = "DLC Contrat 18", model = "csb_req_officer", vip = 3},
        {label = "DLC Contrat 19", model = "csb_security_a", vip = 3},
        {label = "DLC Contrat 20", model = "csb_soundeng_00", vip = 3},
        {label = "DLC Contrat 21", model = "csb_vagos_leader", vip = 3},
        {label = "DLC Contrat 22", model = "csb_vernon", vip = 3},
        {label = "DLC Contrat 23", model = "g_m_m_goons_01", vip = 3},
        {label = "DLC Contrat 24", model = "ig_ary_02", vip = 3},
        {label = "DLC Contrat 25", model = "ig_ballas_leader", vip = 3},
        {label = "DLC Contrat 26", model = "ig_billionaire", vip = 3},
        {label = "DLC Contrat 27", model = "ig_entourage_a", vip = 3},
        {label = "DLC Contrat 28", model = "ig_entourage_b", vip = 3},
        {label = "DLC Contrat 29", model = "ig_golfer_a", vip = 3},
        {label = "DLC Contrat 30", model = "ig_golfer_b", vip = 3},
        {label = "DLC Contrat 31", model = "ig_imani", vip = 3},
        {label = "DLC Contrat 32", model = "ig_jio_02", vip = 3},
        {label = "DLC Contrat 33", model = "ig_johnny_guns", vip = 3},
        {label = "DLC Contrat 34", model = "ig_mjo_02", vip = 3},
        {label = "DLC Contrat 35", model = "ig_musician_00", vip = 3},
        {label = "DLC Contrat 36", model = "ig_party_promo", vip = 3},
        {label = "DLC Contrat 37", model = "ig_req_officer", vip = 3},
        {label = "DLC Contrat 38", model = "ig_security_a", vip = 3},
        {label = "DLC Contrat 39", model = "ig_soundeng_00", vip = 3},
        {label = "DLC Contrat 40", model = "ig_vernon", vip = 3},
        {label = "DLC Contrat 40", model = "ig_vincent_3", vip = 3},
        {label = "DLC Contrat 41", model = "s_f_m_studioassist_01", vip = 3},
        {label = "DLC Contrat 42", model = "s_m_m_highsec_05", vip = 3},
        {label = "DLC Contrat 43", model = "s_m_m_studioassist_02", vip = 3},
        {label = "DLC Contrat 44", model = "s_m_m_studioprod_01", vip = 3},
        {label = "DLC Contrat 45", model = "s_m_m_studiosoueng_02", vip = 3},
        {label = "Fat American", model = "a_m_m_farmer_01", vip = 3},
        {label = "Bébé 1", model = "Alex-baby", vip = 1},
        {label = "Bébé 2", model = "Alia-Robinson", vip = 1},
        {label = "Bébé 3", model = "Baby-107", vip = 1},
        {label = "Bébé 4", model = "Baby-black6", vip = 1},
        {label = "Bébé 5", model = "Baby-girl-magic2", vip = 1},
        {label = "Bébé 6", model = "Baby-magic-boy", vip = 1},
        {label = "Bébé 7", model = "BabyBlurri1", vip = 1},
        {label = "Bébé 8", model = "babyfemale45a", vip = 1},
        {label = "Bébé 9", model = "babyfemale46a", vip = 1},
        {label = "Bébé 10", model = "babyfemale6", vip = 1},
        {label = "Bébé 11", model = "babyfemale60d", vip = 1},
        {label = "Bébé 12", model = "babyfemale60f", vip = 1},
        {label = "Bébé 13", model = "babyfemale67a", vip = 1},
        {label = "Bébé 14", model = "babyfemale70c", vip = 1},
        {label = "Bébé 15", model = "babyfemale71a", vip = 1},
        {label = "Bébé 16", model = "babyfemale72a", vip = 1},
        {label = "Bébé 17", model = "babyfemale73a", vip = 1},
        {label = "Bébé 18", model = "babymale100d", vip = 1},
        {label = "Bébé 19", model = "babymale102a", vip = 1},
        {label = "Bébé 20", model = "babymale103a", vip = 1},
        {label = "Bébé 21", model = "babymale106c", vip = 1},
        {label = "Bébé 22", model = "babymale107a", vip = 1},
        {label = "Bébé 23", model = "babymale122a", vip = 1},
        {label = "Bébé 24", model = "babymale30d", vip = 1},
        {label = "Bébé 25", model = "babymale37c", vip = 1},
        {label = "Bébé 26", model = "babymale37e", vip = 1},
        {label = "Bébé 27", model = "babymale38b", vip = 1},
        {label = "Bébé 28", model = "babymale54b", vip = 1},
        {label = "Bébé 29", model = "babymale67a", vip = 1},
        {label = "Bébé 30", model = "babymale67c", vip = 1},
        {label = "Bébé 31", model = "babymale67e", vip = 1},
        {label = "Bébé 32", model = "babymale68a2", vip = 1},
        {label = "Bébé 33", model = "BabyMale69B", vip = 1},
        {label = "Bébé 34", model = "babymale94b", vip = 1},
        {label = "Bébé 35", model = "Boy-black22", vip = 1},
        {label = "Bébé 36", model = "Boy-black7", vip = 1},
        {label = "Bébé 37", model = "Carol-baby", vip = 1},
        {label = "Bébé 38", model = "childmale11a", vip = 1},
        {label = "Bébé 39", model = "childmale12a", vip = 1},
        {label = "Bébé 40", model = "childmale16d", vip = 1},
        {label = "Bébé 41", model = "Chris-baby", vip = 1},
        {label = "Bébé 42", model = "Daphiny-Baby", vip = 1},
        {label = "Bébé 43", model = "Dorinha-baby", vip = 1},
        {label = "Bébé 44", model = "Eloisa-girl", vip = 1},
        {label = "Bébé 45", model = "Gina-baby", vip = 1},
        {label = "Bébé 46", model = "Girl-Casual-B3", vip = 1},
        {label = "Bébé 47", model = "ivy", vip = 1},
        {label = "Bébé 48", model = "JasianaBabyPed1", vip = 1},
        {label = "Bébé 49", model = "Jaylen-baby", vip = 1},
        {label = "Bébé 50", model = "Jaylen-baby2", vip = 1},
        {label = "Bébé 51", model = "JMoneyNT01", vip = 1},
        {label = "Bébé 52", model = "Jonas-baby2", vip = 1},
        {label = "Bébé 53", model = "Jordan-Boy2", vip = 1},
        {label = "Bébé 54", model = "July-baby", vip = 1},
        {label = "Bébé 55", model = "Junior-baby", vip = 1},
        {label = "Bébé 56", model = "KikiBeigeGirl", vip = 1},
        {label = "Bébé 57", model = "KikiBrownGirl", vip = 1},
        {label = "Bébé 58", model = "KikiGreyToddler", vip = 1},
        {label = "Bébé 59", model = "KikiPinkToddler", vip = 1},
        {label = "Bébé 60", model = "Kyaire-baby", vip = 1},
        {label = "Bébé 61", model = "Leda-baby", vip = 1},
        {label = "Bébé 62", model = "Leila-baby", vip = 1},
        {label = "Bébé 63", model = "Lena-baby", vip = 1},
        {label = "Bébé 64", model = "Lena2-baby", vip = 1},
        {label = "Bébé 65", model = "Luan-baby", vip = 1},
        {label = "Bébé 66", model = "Luiz-baby", vip = 1},
        {label = "Bébé 67", model = "Madalena-girl", vip = 1},
        {label = "Bébé 68", model = "Magno-boy", vip = 1},
        {label = "Bébé 69", model = "Maik-Boy", vip = 1},
        {label = "Bébé 70", model = "Maysa-baby", vip = 1},
        {label = "Bébé 71", model = "MJ-boy", vip = 1},
        {label = "Bébé 72", model = "Nielso-baby", vip = 1},
        {label = "Bébé 73", model = "Nikki-baby", vip = 1},
        {label = "Bébé 74", model = "Peachy-baby", vip = 1},
        {label = "Bébé 75", model = "PinkBear", vip = 1},
        {label = "Bébé 76", model = "Robert-Boy", vip = 1},
        {label = "Bébé 77", model = "SATODEONPREMADE", vip = 1},
        {label = "Bébé 78", model = "SatoKianiPremade", vip = 1},
        {label = "Bébé 79", model = "SosaTankPed1", vip = 1},
        {label = "Bébé 80", model = "TaliahPed1", vip = 1},
        {label = "Bébé 81", model = "Toby-baby", vip = 1},
        {label = "Bébé 82", model = "TooleyPed", vip = 1},
        {label = "Bébé 83", model = "WaterPed1", vip = 1},
    


    },
    animals =  {
        {label = "Chien1", model = "a_c_poodle", vip = 3},
        {label = "Chien2", model = "a_c_husky", vip = 3},
        {label = "DLC Contrat 1", model = "a_c_chop_02", vip = 3},
        {label = "Poule", model = "a_c_hen", vip = 3},
        {label = "Chien3", model = "a_c_chop", vip = 3},
        {label = "Chat", model = "a_c_cat_01", vip = 3},
        {label = "Coyotte", model = "a_c_coyote", vip = 3},
        {label = "Chien4", model = "a_c_retriever", vip = 3},
        {label = "Chien5", model = "a_c_shepherd", vip = 3},
        {label = "Chien6", model = "a_c_westy", vip = 3},
        {label = "Mtlion", model = "a_c_mtlion", vip = 3},
        {label = "Vache", model = "a_c_cow", vip = 3},
    },

}
Config.WeaponsBinds = {
    {id = 'one', weapon = `WEAPON_UNARMED`, weaponLabel = '', label = string.format("Raccourci Arme %s", 1), bind = '1'},
    {id = 'two', weapon = `WEAPON_UNARMED`, weaponLabel = '', label = string.format("Raccourci Arme %s", 2), bind = '2'},
    {id = 'three', weapon = `WEAPON_UNARMED`, weaponLabel = '', label = string.format("Raccourci Arme %s", 3), bind = '3'},
    {id = 'four', weapon = `WEAPON_UNARMED`, weaponLabel = '', label = string.format("Raccourci Arme %s", 4), bind = '4'},
    {id = 'five', weapon = `WEAPON_UNARMED`, weaponLabel = '', label = string.format("Raccourci Arme %s", 5), bind = '5'},
}
function GetPedList()
	return PedListpeds
end

function GetAnimalList()
	return PedListpeds
end