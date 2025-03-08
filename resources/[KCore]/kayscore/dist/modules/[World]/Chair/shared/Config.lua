Config_Chair = {}

Config_Chair.Chair = {}

Config_Chair.Chair.Debugmode = false 
Config_Chair.Chair.DebugPoly = false 
Config_Chair.Chair.UseNativeNotifiactions = true
Config_Chair.Chair.TeleportToLastPosWhenNoRoute = false
Config_Chair.Chair.AlwaysTeleportToSeat = false
Config_Chair.Chair.AlwaysTeleportOutOfSeat = false
Config_Chair.Chair.MaxInteractionDist = 1.8
Config_Chair.Chair.MaxDetectionDist = 3.0
Config_Chair.Chair.MaxTilt = 20.0
Config_Chair.Chair.DefaultKey = 'X'
Config_Chair.Chair.DefaultPadAnalogButton = 'RRIGHT_INDEX'
Config_Chair.Chair.AddChatSuggestions = false
Config_Chair.Chair.ReduceStress = false
Config_Chair.Chair.Target = false
Config_Chair.Chair.UseTargetingCoords = true

Config_Chair.Chair.Targeting = {
    SitIcon = "fas fa-chair",
    LayIcon = "fas fa-bed",
    SitLabel = "S'assoir",
    LayLabel = "Se coucher",
}

Config_Chair.Chair.Lang = {
    Occupied = "~r~Cette place est déja occupée !",
    OccupiedLay = "~r~Vous ne pouvez pas vous coucher ici !",
	NoAvailable = "~r~Aucune chaise autour !",
	NoFound = "~r~Aucune place autour !",
    NoBedFound = "~r~Aucun lit autour !",
    TooTilted = "~r~Cette place est trop inclinée !",
    CannotReachSeat = "~r~Vous ne pouvez pas atteindre cette chaise !",
    CannotReachBed = "~r~Vous ne pouvez pas atteindre ce lit !",

    ChatHelpTextSit = "S'assoir sur le siège le plus proche",
    ChatHelpTextLay = "Se coucher sur le siège le plus proche",

	KeyMappingKeyboard = "Se lever d'une chaise/lit",
	KeyMappingController = "Se lever d'une chaise/lit - Touche",

    GetUp = "Appuyez sur %s pour vous lever",
}

Config_Chair.Chair.SitTypes = {
    ['default'] = { 
        scenarios = { "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER" },
        skipGoStraightTask = false,
        teleportIn = false,
        teleportOut = false,
        timeout = 8
    },
    ['chair'] = {
        scenarios = { "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER" },
        timeout = 8
    },
    ['chair2'] = {
        scenarios = { "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", "PROP_HUMAN_SEAT_ARMCHAIR" },
        timeout = 8
    },
    ['chair3'] = {
        scenarios = { "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", "PROP_HUMAN_SEAT_ARMCHAIR", "PROP_HUMAN_SEAT_DECKCHAIR" },
        timeout = 8
    },
    ['barstool'] = {
        scenarios = { "PROP_HUMAN_SEAT_BAR" },
        teleportIn = true,
        timeout = 8
    },
    ['stool'] = {
        scenarios = { "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER" },
        teleportIn = true,
        timeout = 8
    },
    ['deck'] = {
        scenarios = { "PROP_HUMAN_SEAT_DECKCHAIR" },
        timeout = 8
    },
    ['sunlounger'] = {
        scenarios = { "PROP_HUMAN_SEAT_SUNLOUNGER" },
        skipGoStraightTask = true,
        timeout = 12
    },
    ['tattoo'] = {
        animation = { dict = "misstattoo_parlour@shop_ig_4", name = "customer_loop", offset = vector4(0.0, 0.0, -0.75, 0.0) },
        timeout = 8
    },
    ['strip_watch'] = {
        scenarios = { "PROP_HUMAN_SEAT_STRIP_WATCH" },
        timeout = 8
    },
    ['diner_booth'] = {
        scenarios = { "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER" },
        teleportIn = true,
        teleportOut = true,
        timeout = 8,
    },
    ['wall'] = {
        scenarios = { "WORLD_HUMAN_SEAT_WALL" },
        timeout = 8
    },
    ['steps'] = {
        scenarios = { "WORLD_HUMAN_SEAT_STEPS" },
        timeout = 8
    },
    ['ledge'] = {
        scenarios = { "WORLD_HUMAN_SEAT_LEDGE" },
        timeout = 8
    },
}

Config_Chair.Chair.LayTypes = {
    ['default'] = { 
        animation = { dict = "misslamar1dead_body", name = "dead_idle" },
        exitAnim = true
    },
    ['bed'] = {
        animation = { dict = "misslamar1dead_body", name = "dead_idle" }
    },
    ['lay'] = {
        animation = { dict = "savecouch@", name = "t_sleep_loop_couch", offset = vector4(-0.1, 0.1, -0.5, 270.0) }
    },
    ['layside'] = {
        animation = { dict = "savecouch@", name = "t_sleep_loop_couch", offset = vector4(-0.1, 0.1, -0.5, 270.0) }
    },
    ['busstop'] = {
        animation = { dict = "savecouch@", name = "t_sleep_loop_couch", offset = vector4(0.0, 0.0, -0.5, 270.0) }
    },
    ['medical'] = {
        animation = { dict = "anim@gangops@morgue@table@", name = "body_search" }
    },
    ['tattoo'] = {
        animation = { dict = "amb@world_human_sunbathe@male@front@base", name = "base", offset = vector4(0.0, 0.0, 0.0, 180.0) },
        exitAnim = false
    }
}

Config_Chair.Chair.Models = {


	-- Chairs --
    [826023884] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} } }, -- prop_chair_06
    [1037469683] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.0, 0.4, 180.0)} } }, -- prop_off_chair_05
    [2040839490] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.0, 0.0, 180.0)} } }, -- v_ret_gc_chair02
    [867556671] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} } }, -- v_club_officechair
    [2064599526] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.05, 0.5, 180.0)} } }, -- prop_chair_04a
    [-741944541] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.1, 0.5, 180.0)} } }, -- prop_table_03_chr
    [-171943901] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.1, 0.0, 180.0)} } }, -- v_serv_ct_chair02
    [607684038] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.0, 0.35, 180.0)} } }, -- v_ret_fh_chair01
    [-109356459] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.05, 0.5, 180.0)} } }, -- v_corp_offchair
    [-606800174] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.075, 0.525, 180.0)} } }, -- apa_mp_h_din_chair_04
    [146905321] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} } }, -- prop_table_03b_chr
    [-1761659350] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.05, 0.5, 180.0)} } }, -- prop_table_02_chr
    [1404176808] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} } }, -- prop_table_04_chr
    [-1521264200] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.1, 0.0, 180.0)} } }, -- prop_table_01_chr_a
    [-1173315865] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} } }, -- p_clb_officechair_s
    [764848282] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, -0.025, 0.5, 180.0)} } }, -- prop_chair_01b
    [96868307] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.1, 0.5, 180.0)} } }, -- prop_off_chair_03
    [1918586980] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, -0.05, 0.5, 180.0)} } }, -- v_res_mbchair
    [-1235256368] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.0, 0.0, 270.0)} } }, -- prop_table_01_chr_b
    [1071807406] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.025, 0.06, 180.0)} } }, -- prop_skid_chair_02
    [-1108904010] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.025, 0.06, 180.0)} } }, -- prop_skid_chair_03
    [291348133] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.025, 0.06, 180.0)} } }, -- prop_skid_chair_01
    [-1118419705] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} } }, -- prop_cs_office_chair
    [538002882] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, -0.1, 180.0)} } }, -- ba_prop_battle_club_chair_01
    [-377849416] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} } }, -- v_ilev_leath_chr
    [47332588] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} } }, -- prop_table_05_chr
    [444105316] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} } }, -- v_corp_lazychair
    [1268458364] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} } }, -- prop_off_chair_04
    [-501934650] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} } }, -- v_corp_cd_chair
    [536071214] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.075, 0.5, 180.0)} } }, -- prop_off_chair_01
    [589738836] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} } }, -- v_corp_bk_chair3
    [1281480215] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.05, 0.0, 180.0)} } }, -- prop_chair_08
    [1612971419] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.05, 0.5, 180.0)} } }, -- prop_chair_09
    [1975077032] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, -0.15, 0.5, 180.0)} } }, -- prop_rub_couch03
    [525667351] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.0, 0.52, 180.0)} } }, -- prop_chair_01a
    [-293380809] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, -0.1, 0.5, 180.0)} } }, -- hei_prop_yah_seat_02
    [604553643] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, -0.1, 0.5, 180.0)} } }, -- p_yacht_chair_01_s
    [-157036474] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, -0.1, 0.5, 180.0)} } }, -- gr_dlc_gr_yacht_props_seat_02
    [28672923] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.0, 0.7, 180.0)} } }, -- hei_prop_yah_seat_01
    [-294499241] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, -0.1, 0.5, 180.0)} } }, -- prop_yacht_seat_01
    [-1005619310] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.0, 0.7, 180.0)} } }, -- prop_yacht_seat_03
    [603897027] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} } }, -- v_club_stagechair
    [725259233] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.0, 0.525, 180.0)} } }, -- prop_chair_02
    [558578166] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.0, 0.0, 180.0)} } }, -- prop_gc_chair02
    [-2016553006] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} } }, -- prop_table_06_chr
    [98421364] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} } }, -- v_ilev_p_easychair
    [475561894] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} } }, -- prop_off_chair_04_s
    [1064877149] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} } }, -- prop_chair_03
    [2051175944] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} } }, -- v_res_m_l_chair1
    [1355718178] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} } }, -- prop_waiting_seat_01
    [2053667724] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.0, 0.1, 180.0)} } }, -- v_club_baham_bckt_chr
    [-826852533] = { sit = { type = 'chair2', teleportIn = true, seats = {[1] = vector4(0.0, 0.1, 0.85, 180.0)} } }, -- prop_umpire_01
    [1630899471] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.0, 0.55, 180.0)} } }, -- v_ret_chair_white
    [-1941377959] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.1, 0.5, 180.0)} } }, -- prop_chair_04b
    [-1278649385] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, -0.1, 180.0)} } }, -- ex_prop_offchair_exec_02
    [-1626066319] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, -0.1, 180.0)} } }, -- ex_prop_offchair_exec_01
    [1580642483] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, -0.1, 180.0)} } }, -- ex_prop_offchair_exec_03
    [685944827] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} } }, -- v_res_fa_chair02
    [1262298127] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.075, 0.075, 180.0)} } }, -- prop_wheelchair_01
    [215586331] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.05, 0.3, 180.0)} } }, -- v_ind_ss_chair01
    [-416920619] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.05, 0.0, 180.0)} } }, -- v_ind_ss_chair2
    [-784954167] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.05, 0.0, 180.0)} } }, -- v_ilev_chair02_ped
    [38932324] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.05, 0.5, 180.0)} } }, -- v_res_jarmchair
    [-1251662965] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.05, 0.5, 180.0)} } }, -- v_res_m_armchair
    [1545434534] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} } }, -- prop_chair_05
    [-1869605644] = { sit = { type = 'chair3', seats = {[1] = vector4(0.0, 0.1, 0.0, 0.0)} } }, -- prop_ld_farm_chair01
    [757888276] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, 0.5, 0.0)} } }, -- v_58_soloff_gchair2
    [-1892473334] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, 0.5, 0.0)} } }, -- v_58_soloff_gchair
    [1691387372] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} } }, -- prop_chair_10
    [854385596] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, 0.1, 180.0)} } }, -- prop_rock_chair_01
    [1028260687] = { sit = { type = 'chair', seats = {[1] = vector4(-0.035, 0.08, 0.0, 180.0)} } }, -- prop_chateau_chair_01
    [1103738692] = { sit = { type = 'deck', seats = {[1] = vector4(0.0, 0.0, -0.15, 180.0)} } }, -- prop_old_deck_chair
    [1019962318] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, 0.3, 180.0)} } }, -- prop_hobo_seat_01
    [451260528] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} } }, -- v_ilev_m_dinechair
    [575699050] = { sit = { type = 'deck', seats = {[1] = vector4(0.0, 0.2, 0.35, 0.0)} } }, -- prop_rub_carpart_05
    [-853526657] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.05, -0.1, 180.0)} } }, -- imp_prop_impexp_offchair_01a
    [-997157373] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, -0.1, 180.0)} } }, -- vw_prop_vw_offchair_03
    [-992735415] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.05, -0.1, 180.0)} } }, -- ba_prop_battle_club_chair_03
    [-829283643] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, -0.075, -0.1, 180.0)} } }, -- ba_prop_battle_club_chair_02
    [438342263] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.0, 0.29, 180.0)} } }, -- v_res_fa_chair01
    [-1198343923] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.075, 0.5, 180.0)} } }, -- hei_prop_heist_off_chair
    [768067634] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.1, 0.5, 180.0)} } }, -- sf_prop_sf_bench_piano_01a
    [-61947709] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, -0.1, 0.5, 180.0)} } }, -- sf_prop_sf_sofa_chefield_02a
    [1382419899] = { sit = { type = 'deck', seats = {[1] = vector4(0.0, -0.175, 0.225, 180.0)} } }, -- prop_car_seat
    [1480618483] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, 0.45, 180.0)} } }, -- prop_off_chair_04b
    [174634350] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.05, 0.5, 180.0)} } }, -- v_res_fh_dineeamesb
    [-603563862] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.05, 0.5, 180.0)} } }, -- v_res_fh_dineeamesa
    [-523951410] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.05, 0.5, 180.0)} } }, -- v_ret_chair
    [-590416541] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.10, 0.5, 180.0)} } }, -- gr_dlc_gr_yacht_props_table_01
    [1872312775] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, 0.135, 180.0)} } }, -- prop_ld_toilet_01
    [-1195678770] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, -0.1, 0.80, 0.0)} } }, -- vw_prop_casino_chair_01a
    [-1005355458] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.08, 0.5, 180.0)} } }, -- vw_prop_casino_track_chair_01
    [-296249014] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.05, 0.78, 180.0)} } }, -- prop_chair_pile_01
    [688581443] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, -0.06, 0.03, 180.0)} } }, -- h4_prop_h4_chair_01a

    -- Stools --
    [-1829764702] = { sit = { type = 'barstool', seats = {[1] = vector4(0.0, 0.15, 0.825, 180.0)} } }, -- prop_bar_stool_01
    [-1971298567] = { sit = { type = 'stool', seats = {[1] = vector4(0.0, 0.1, 0.39, 180.0)} } }, -- v_ret_gc_chair01
    [1560277278] = { sit = { type = 'stool', seats = {[1] = vector4(0.0, 0.0, 0.1, 180.0)} } }, -- v_res_tre_stool_leather
    [317065662] = { sit = { type = 'stool', seats = {[1] = vector4(0.0, 0.1, 0.35, 180.0)} } }, -- v_club_bahbarstool
    [652816835] = { sit = { type = 'stool', seats = {[1] = vector4(0.0, 0.1, 0.85, 180.0)} } }, -- apa_mp_h_din_stool_04
    [1938265576] = { sit = { type = 'stool', seats = {[1] = vector4(0.0, 0.1, 0.75, 180.0)} } }, -- v_res_kitchnstool
    [1130482396] = { sit = { type = 'barstool', seats = {[1] = vector4(0.0, 0.0, 0.825, 0.0)} } }, -- prop_stool_01
    [-992710074] = { sit = { type = 'chair2', teleportIn = true, seats = {[1] = vector4(0.0, 0.10, 0.70, 180.0)} } }, -- v_med_cor_medstool
    [1798189768] = { sit = { type = 'chair2', teleportIn = true, seats = {[1] = vector4(0.0, 0.10, 0.55, 180.0)} } }, -- v_ret_ta_stool
    [1840174940] = { sit = { type = 'barstool', seats = {[1] = vector4(0.0, 0.0, 0.815, 180.0)} } }, -- ba_prop_int_glam_stool
    [-1120527678] = { sit = { type = 'stool', seats = {[1] = vector4(0.075, 0.0, 0.8, 90.0)} } }, -- ba_prop_int_edgy_stool
    [708083002] = { sit = { type = 'stool', seats = {[1] = vector4(0.0, 0.1, 0.9, 180.0)} } }, -- h4_prop_h4_barstool_01a
    [1079799018] = { sit = { type = 'chair', teleportIn = true, seats = {[1] = vector4(0.1, 0.0, 0.5, 90.0)} } }, -- sf_prop_sf_chair_stool_08a
    [-360727150] = { sit = { type = 'chair', teleportIn = true, seats = {[1] = vector4(0.0, 0.025, 0.80, 180.0)} } }, -- sf_prop_sf_chair_stool_09a

    -- Sun Loungers --
    [-573707493] = { sit = { type = 'sunlounger', seats = {[1] = vector4(0.0, -0.23, 0.4, 180.0)} } }, -- p_patio_lounger1_s
    [1160611253]  = { sit = { type = 'sunlounger', seats = {[1] = vector4(0.0, 0.3, 0.5, 180.0)} } }, -- prop_yacht_lounger
    [1699040865] = { sit = { type = 'sunlounger', seats = {[1] = vector4(0.0, 0.25, 0.5, 180.0)} } }, -- prop_patio_lounger_2
    [2017293393] = { sit = { type = 'sunlounger', seats = {[1] = vector4(0.0, 0.18, 0.4, 180.0)} } }, -- prop_patio_lounger_3
    [-1498352975] = { sit = { type = 'sunlounger', seats = {[1] = vector4(0.0, -0.2, 0.4, 180.0)} } }, -- prop_patio_lounger1
    [796317896] = { sit = { type = 'sunlounger', seats = {[1] = vector4(0.0, 0.3, 0.5, 180.0)} } }, -- gr_dlc_gr_yacht_props_lounger
    [900699965] = { sit = { type = 'sunlounger', seats = {[1] = vector4(0.0, 0.3, 0.5, 180.0)} } }, -- hei_prop_yah_lounger
    [-2024837020] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.3, 0.45, 270.0), [2] = vector4(0.0, -0.8, 0.45, 90.0)} }, 
        lay = { type = 'layside', seats = {[1] = vector4(0.1, -0.25, 0.45, 90.0)} }
    }, -- prop_patio_lounger1b

    -- Benches --
    [1290593659] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(-0.8, 0.0, 0.42, 180.0), [2] = vector4(0.0, 0.0, 0.42, 180.0), [3] = vector4(0.8, 0.0, 0.42, 180.0)} }, 
        lay = { type = 'layside', seats = {[1] = vector4(0.0, 0.0, 0.42, 180.0)} }
    }, -- prop_bench_11
    [-403891623] = { sit = { type = 'chair2', seats = {[1] = vector4(-0.7, 0.1, 0.5, 180.0), [2] = vector4(0.7, 0.1, 0.5, 180.0)} } }, -- prop_bench_08
    [-99500382] = { sit = { type = 'chair2', seats = {[1] = vector4(-0.8, -0.05, 0.3, 180.0), [2] = vector4(0.0, -0.05, 0.3, 180.0), [3] = vector4(0.8, 0.0, 0.3, 180.0)} } }, -- prop_bench_09
    [-628719744] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(-0.7, 0.0, 0.5, 180.0), [2] = vector4(0.0, 0.0, 0.5, 180.0), [3] = vector4(0.7, 0.0, 0.5, 180.0)} }, 
        lay = { type = 'layside', seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} }
    }, -- prop_bench_02
    [-1062810675] = { sit = { type = 'chair2', seats = {[1] = vector4(-0.35, 0.05, 0.42, 180.0), [2] = vector4(0.35, 0.05, 0.42, 180.0)} } }, -- prop_bench_03
	[-1631057904] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(-0.8, 0.0, 0.45, 180.0), [2] = vector4(0.0, 0.0, 0.45, 180.0), [3] = vector4(0.8, 0.0, 0.45, 180.0)} }, 
        lay = { type = 'layside', seats = {[1] = vector4(0.0, 0.0, 0.45, 180.0)} }
    }, -- prop_bench_05
    [437354449] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(-1.1, -0.05, 0.5, 180.0), [2] = vector4(-0.35, -0.05, 0.5, 180.0), [3] = vector4(0.35, -0.05, 0.5, 180.0), [4] = vector4(1.2, -0.05, 0.5, 180.0)} }, 
        lay = { type = 'layside', seats = {[1] = vector4(0.0, -0.05, 0.5, 180.0)} }
    }, -- prop_bench_10
    [-71417349] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(0.0, -0.1, 0.5, 180.0), [2] = vector4(0.9, -0.1, 0.5, 180.0), [3] = vector4(1.8, -0.1, 0.5, 180.0)} },
        lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(0.9, -0.1, 0.5, 180.0)} }
    }, -- prop_bench_07
    [1805980844] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(-0.75, 0.0, 0.5, 180.0), [2] = vector4(0.0, 0.0, 0.5, 180.0), [3] = vector4(0.75, 0.0, 0.5, 180.0)} }, 
        lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} }
    }, -- prop_bench_01a
    [-1317098115] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(-0.9, 0.0, 0.5, 180.0), [2] = vector4(0.0, 0.0, 0.5, 180.0), [3] = vector4(0.9, 0.0, 0.5, 180.0)} },
        lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} }
    }, -- prop_bench_06
    [2142033519] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.3, 0.5, 180.0), [2] = vector4(0.75, 0.3, 0.5, 180.0), [3] = vector4(1.5, 0.3, 0.5, 180.0)} } }, -- prop_busstop_02
    [1681727376] = { sit = { type = 'chair2', seats = {[1] = vector4(-0.6, 0.6, 0.5, 180.0), [2] = vector4(0.0, 0.6, 0.5, 180.0), [3] = vector4(0.6, 0.6, 0.5, 180.0)} } }, -- prop_busstop_04
    [1888204845] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(0.1, 0.3, 0.5, 180.0), [2] = vector4(0.8, 0.3, 0.5, 180.0)} },
        lay = { type = 'layside', teleportIn = false, seats = {[1] = vector4(0.55, 0.35, 0.5, 180.0)} }
    }, -- prop_busstop_05
    [-1572018818] = { 
        sit = { type = 'chair', teleportIn = true, seats = {[1] = vector4(-0.4, -0.6, 0.5, 0.0), [2] = vector4(0.4, -0.6, 0.5, 0.0), [3] = vector4(-0.4, 0.6, 0.5, 180.0), [4] = vector4(0.4, 0.6, 0.5, 180.0)} }, 
        lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(0.0, 0.1, 0.85, 180.0)} }
    }, -- prop_picnictable_01
    [-232870343] = { sit = { type = 'chair2', teleportIn = true, seats = {[1] = vector4(-0.5, 0.0, 0.5, 0.0), [2] = vector4(0.5, 0.0, 0.5, 0.0)} } },
    [1916676832] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(-0.7, 0.2, 0.5, 180.0), [2] = vector4(0.0, 0.2, 0.5, 180.0), [3] = vector4(0.7, 0.2, 0.5, 180.0)} },
        lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(0.0, 0.2, 0.5, 180.0)} }
    }, -- prop_ld_bench01
    [-763859088] = { sit = { type = 'chair2', seats = {[1] = vector4(-0.7, -0.1, 0.5, 180.0), [2] = vector4(0.0, -0.1, 0.5, 180.0), [3] = vector4(0.7, -0.1, 0.5, 180.0)} } }, -- prop_bench_04
    [-729914417] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(-0.6, 0.05, 0.5, 180.0), [2] = vector4(0.0, 0.05, 0.5, 180.0), [3] = vector4(0.6, 0.05, 0.5, 180.0)} },
        lay = { type = 'layside', seats = {[1] = vector4(0.0, -0.05, 0.5, 180.0)} }
    },
    [-1507293404] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(-0.7, 0.05, 0.5, 180.0), [2] = vector4(0.0, 0.05, 0.5, 180.0), [3] = vector4(0.7, 0.05, 0.5, 180.0)} },
        lay = { type = 'layside', seats = {[1] = vector4(0.0, 0.05, 0.5, 180.0)} }
    },
    [-128924068] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(0.0, -1.08, 0.07, 270.0), [2] = vector4(0.0, -0.375, 0.07, 270.0), [3] = vector4(0.0, 0.375, 0.07, 270.0), [4] = vector4(0.0, 1.08, 0.07, 270.0)} }
    }, -- v_med_hospseating1

    -- Couches / Sofas --
    [-1199485389] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(-0.5, -0.1, 0.48, 180.0), [2] = vector4(0.5, -0.1, 0.48, 180.0)} },
        lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(0.0, -0.20, 0.5, 180.0)} }
    }, -- prop_rub_couch04
    [-2021659595] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(-0.6, -0.1, 0.48, 180.0), [2] = vector4(0.5, -0.1, 0.45, 180.0)} },
        lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(0.10, -0.2, 0.5, 180.0)} }
    }, -- prop_rub_couch02
    [-941390908] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(-0.5, -0.1, 0.5, 180.0), [2] = vector4(0.5, -0.1, 0.5, 180.0)} },
        lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(-0.05, -0.05, 0.5, 180.0)} }
    }, -- v_res_tre_sofa
    [-591349326] = { sit = { type = 'chair2', seats = {[1] = vector4(-0.35, -0.1, 0.6, 180.0), [2] = vector4(0.35, -0.1, 0.6, 180.0)} } }, -- hei_prop_yah_seat_03
    [376180694] = { sit = { type = 'chair2', seats = {[1] = vector4(-0.35, -0.1, 0.6, 180.0), [2] = vector4(0.35, -0.1, 0.6, 180.0)} } }, -- gr_dlc_gr_yacht_props_seat_03
    [-1320300017] = { sit = { type = 'chair2', seats = {[1] = vector4(-0.35, -0.1, 0.6, 180.0), [2] = vector4(0.35, -0.1, 0.6, 180.0)} } }, -- prop_yacht_seat_02
    [1532110050] = { sit = { type = 'chair2', seats = {[1] = vector4(-0.35, -0.1, 0.6, 180.0), [2] = vector4(0.35, -0.1, 0.6, 180.0)} } }, -- p_yacht_sofa_01_s
    [267626795] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(-0.9, -0.1, 0.5, 180.0), [2] = vector4(0.0, -0.1, 0.5, 180.0), [3] = vector4(0.9, -0.1, 0.5, 180.0)} },
        lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} }
    }, -- prop_wait_bench_01
    [-70627249] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(-0.95, 0.0, 0.5, 180.0), [2] = vector4(0.0, 0.0, 0.5, 180.0), [3] = vector4(0.95, 0.0, 0.5, 180.0)} }, 
        lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} }
    }, -- prop_fib_3b_bench
    [773405192] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(0.1, -0.65, 0.0, 270.0), [2] = vector4(0.1, 0.0, 0.0, 270.0), [3] = vector4(0.1, 0.65, 0.0, 270.0)} }, 
        lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(0.1, 0.0, 0.0, 270.0)} }
    }, -- prop_ld_farm_couch02
    [544186037] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(-0.1, 0.75, 0.0, 90.0), [2] = vector4(-0.1, 0.0, 0.0, 90.0), [3] = vector4(-0.1, -0.75, 0.0, 90.0)} }, 
        lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(-0.15, 0.0, 0.0, 90.0)} }
    }, -- prop_ld_farm_couch01
    [-1841495633] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(-0.5, 0.0, 0.45, 180.0), [2] = vector4(0.5, 0.0, 0.5, 180.0)} }, 
        lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} }
    }, -- prop_rub_couch01
    [-1877459292] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(-1.25, -0.6, 0.5, 270.0), [2] = vector4(-0.5, 0.4, 0.5, 180.0), [3] = vector4(0.5, 0.4, 0.5, 180.0), [4] = vector4(1.5, 0.4, 0.5, 180.0)} }, 
        lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(-1.5, -0.3, 0.55, 270.0), [2] = vector4(0.1, 0.4, 0.5, 180.0)} }
    }, -- v_ilev_m_sofa
    [1181479993] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(-0.45, -0.1, 0.5, 180.0), [2] = vector4(0.45, -0.1, 0.5, 180.0)} }
    }, -- v_res_m_h_sofa
    [-694881216] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(-0.4, -0.1, 0.5, 180.0), [2] = vector4(0.4, -0.1, 0.5, 180.0)} },
        lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(-0.05, -0.1, 0.5, 180.0)} }
    }, -- sf_prop_sf_sofa_chefield_01a
    [1902733481] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(-1.4, -0.1, 0.5, 180.0), [2] = vector4(-0.5, -0.1, 0.5, 180.0), [3] = vector4(0.5, -0.1, 0.5, 180.0), [4] = vector4(1.5, -0.1, 0.5, 180.0)} }, 
        lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(-1.0, -0.1, 0.5, 180.0), [2] = vector4(1.0, -0.1, 0.5, 180.0)} }
    }, -- sf_prop_sf_sofa_studio_01a
    [-1460572644] = { 
        sit = { type = 'chair', seats = {[1] = vector4(-0.35, -0.06, 0.03, 180.0), [2] = vector4(0.35, -0.06, 0.03, 180.0)} }
    }, -- h4_prop_h4_couch_01a

    -- Beds --
    [1631638868] = {
        sit = { type = 'chair2', teleportIn = true, seats = {[1] = vector4(-0.3, 0.0, 0.4, 90.0), [2] = vector4(0.20, 0.0, 0.4, 270.0)} }, 
        lay = { type = 'bed', teleportIn = true, seats = {[1] = vector4(-0.05, 0.0, 0.3, 180.0)} }
    }, -- v_med_bed1
    [2117668672] = {
        sit = { type = 'chair2', teleportIn = true, seats = {[1] = vector4(-0.25, 0.0, 0.4, 90.0), [2] = vector4(0.25, 0.0, 0.4, 270.0)} }, 
        lay = { type = 'bed', teleportIn = true, seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} }
    }, -- v_med_bed2
	[-1091386327] = {
        sit = { type = 'chair2', teleportIn = true, seats = {[1] = vector4(-0.25, 0.0, 0.2, 90.0), [2] = vector4(0.25, 0.0, 0.2, 270.0)} }, 
        lay = { type = 'bed', teleportIn = true, seats = {[1] = vector4(0.0, 0.0, 0.2, 180.0)} } 
    }, -- v_med_emptybed
    [-1182962909] = {
        lay = { type = 'medical', teleportIn = true, seats = {[1] = vector4(0.0, -0.15, 1.0, 0.0)} }
    }, -- v_med_cor_emblmtable
    [-1557777900] = {
        sit = { type = 'chair2', teleportIn = true, seats = {[1] = vector4(0.7, 0.0, 0.65, 270.0), [2] = vector4(0.4, -0.95, 0.65, 180.0)} }, 
        lay = { type = 'bed', teleportIn = true, seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} }
    }, -- v_res_tt_bed
    [314496444] = {
        sit = { type = 'chair2', seats = {[1] = vector4(0.0, -0.375, 0.75, 180.0)} }, 
        lay = { type = 'bed', teleportIn = true, seats = {[1] = vector4(0.0, 0.0, 0.5, 90.0)} }
    }, -- ex_prop_exec_bed_01
    [-1673752417] = {
        sit = { type = 'chair2', seats = {[1] = vector4(0.0, -0.375, 0.75, 180.0), [2] = vector4(0.0, 0.375, 0.75, 180.0)} }, 
        lay = { type = 'bed', teleportIn = true, seats = {[1] = vector4(0.0, 0.0, 0.75, 90.0)} }
    }, -- bkr_prop_biker_campbed_01
    [262175156] = {
        sit = { type = 'chair2', seats = {[1] = vector4(0.0, -0.3748, 0.75, 180.0), [2] = vector4(0.0, 0.375, 0.75, 180.0)} }, 
        lay = { type = 'bed', teleportIn = true, seats = {[1] = vector4(0.0, 0.0, 0.75, 90.0)} }
    }, -- imp_prop_impexp_campbed_01
    [-1818341338] = {
        sit = { type = 'chair2', teleportIn = true, seats = {[1] = vector4(0.0, -0.65, 0.3, 180.0), [2] = vector4(0.0, 0.38, 0.3, 0.0)} }, 
        lay = { type = 'bed', teleportIn = true, seats = {[1] = vector4(0.2, -0.1, 0.3, 270.0)} }
    }, -- imp_prop_impexp_sofabed_01a
    [1088478360] = {
        sit = { type = 'chair2', seats = {[1] = vector4(-0.5, -0.6, 0.09, 180.0), [2] = vector4(0.5, -0.6, 0.09, 180.0)} }, 
        lay = { type = 'bed', teleportIn = true, seats = {[1] = vector4(0.0, -0.4, 0.09, 270.0)} }
    }, -- prop_t_sofa_02
    [-1964110779] = {
        sit = { type = 'chair2', seats = {[1] = vector4(-0.5, -0.6, 0.09, 180.0), [2] = vector4(0.5, -0.6, 0.09, 180.0)} }, 
        lay = { type = 'bed', teleportIn = true, seats = {[1] = vector4(0.0, -0.4, 0.09, 270.0)} }
    }, -- prop_t_sofa
    [-335052794] = {
        lay = { type = 'bed', teleportIn = true, skipSeeCheck = true, seats = {[1] = vector4(0.0, 0.0, 0.5, 90.0)} }
    }, -- v_49_motelmp_bed
    [1715961520] = { lay = { type = 'layside', seats = {[1] = vector4(0.0, 0.05, 0.0, 180.0)} } }, -- prop_beach_lilo_01
    [1677315747] = { sit = { type = 'deck', teleportIn = true, seats = {[1] = vector4(0.0, 0.0, 0.175, 180.0)} } }, -- prop_beach_ring_01

    -- Other
    [1578055800] = {
        sit = { type = 'wall', seats = {[1] = vector4(0.85, -1.30, 0.425, 180.0), [2] = vector4(0.45, 1.35, 0.55, 0.0)} }, 
        lay = { type = 'bed', teleportIn = true, seats = {[1] = vector4(0.0, 0.0, 0.275, 180.0)} }
    }, -- prop_homeles_shelter_01
    [884467146] = {
        sit = { type = 'wall', seats = {[1] = vector4(0.20, -1.15, 0.45, 100.0), [2] = vector4(1.15, 1.40, 0.74, 270.0)} }, 
        lay = { type = 'bed', teleportIn = true, teleportOut = true, seats = {[1] = vector4(0.0, 0.20, 0.3, 180.0)} }
    }, -- prop_homeles_shelter_02

    
    ---------------------
    -- Gabz Team Props --
    ---------------------

    -- Pillbox
    [-289946279] = {
        sit = { type = 'chair2', teleportIn = true, seats = {[1] = vector4(-0.1, 0.0, 1.0, 90.0),} },
        lay = { type = 'medical', teleportIn = true, seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} }
    }, -- gabz_pillbox_diagnostics_bed_02
    [-1519439119] = {
        sit = { type = 'chair2', teleportIn = true, seats = {[1] = vector4(-0.1, 0.2, 1.0, 90.0), [2] = vector4(0.1, 0.2, 1.0, 270.0), [3] = vector4(-0.01, -0.6, 1.0, 90.0), [4] = vector4(0.01, -0.6, 1.0, 270.0)} },
        lay = { type = 'medical', teleportIn = true, seats = {[1] = vector4(0.0, 0.15, 0.75, 180.0)} }
    }, -- gabz_pillbox_diagnostics_bed_03

    -- PD Props
    [1816935351] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, 0.55, 180.0)} } }, -- gabz_pdprops_chair01
    [1577885496] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.05, 0.5, 180.0)} } }, -- gabz_pdprops_chair02
    [2129125614] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.025, 0.55, 180.0)} } }, -- gabz_pdprops_chair03
    [1889748069] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, 0.05, 0.5, 180.0)} } }, -- gabz_pdprops_chair04
    [-212710979] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, -0.075, 0.55, 180.0)} } }, -- gabz_pdprops_chair05

    -- Pizzeria
    [1727909103] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, -0.1, -0.075, 180.0)} } }, -- sm_pizzeria_armchair
    [839195237] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.1, 0.06, 180.0)} } }, -- sm_pizzeria_chair_01
    [-139366965] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, -0.09, 180.0)} } }, -- sm_pizzeria_chesterfield_chair
    [-1813480463] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.4, 0.45, 0.0)} } }, -- sm_pizzeria_lounge_chair
    [-1825439518] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, 0.0, 180.0)} } }, -- sm_pizzeria_office_chair01
    [-921867112] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, 0.0, 180.0)} } }, -- sm_pizzeria_office_chair02
    [-1194295428] = { sit = { type = 'chair', seats = {[1] = vector4(-0.1, 0.0, 0.06, 270.0)} } }, -- sm_pizzeria_wooden_chair
    [220881862] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(0.45, -1.0, 0.45, 270.0), [2] = vector4(0.45, 0.0, 0.45, 270.0), [3] = vector4(0.45, 1.0, 0.45, 270.0)} }, 
        lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(0.45, 0.0, 0.45, 270.0)} }
    }, -- sm_pizzeria_lounge_sofa

    -- Studio
    [807685492] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.0, 0.5, 180.0)} } }, -- gabz_sf_prop_sf_bench_piano_01a
    [-856680438] = { sit = { type = 'chair', teleportIn = true, seats = {[1] = vector4(0.1, 0.0, 0.5, 90.0)} } }, -- gabz_sf_prop_sf_chair_stool_08a
    [-1108051153] = { sit = { type = 'chair', teleportIn = true, seats = {[1] = vector4(0.0, 0.025, 0.80, 180.0)} } }, -- gabz_sf_prop_sf_chair_stool_09a
    [-761616327] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, -0.1, 0.5, 180.0)} } }, -- gabz_sf_prop_sf_sofa_chefield_02a
    [-1332157610] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(-0.4, -0.1, 0.5, 180.0), [2] = vector4(0.4, -0.1, 0.5, 180.0)} },
        lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(-0.05, -0.1, 0.5, 180.0)} }
    }, -- gabz_sf_prop_sf_sofa_chefield_01a
    [365197747] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(-1.4, -0.1, 0.5, 180.0), [2] = vector4(-0.5, -0.1, 0.5, 180.0), [3] = vector4(0.5, -0.1, 0.5, 180.0), [4] = vector4(1.5, -0.1, 0.5, 180.0)} }, 
        lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(-1.0, -0.1, 0.5, 180.0), [2] = vector4(1.0, -0.1, 0.5, 180.0)} }
    }, -- gabz_sf_prop_sf_sofa_studio_01a

    -- Davis PD
    [-1692811878] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.05, 0.475, 180.0)} } }, -- gabz_davispd_chair01

    -- Binco
    [1488129222] = { sit = { type = 'chair2', skipSeeCheck = true, seats = {[1] = vector4(0.0, 0.15, 0.5, 0.0)} } }, -- gabz_binco_puff
    [-1637936370] = { 
        sit = { type = 'chair', seats = {[1] = vector4(0.25, 0.0, 0.25, 90.0), [2] = vector4(0.0, 0.6, 0.25, 135.0), [3] = vector4(0.0, -0.6, 0.25, 45.0)} }
    }, -- gabz_binco_sofaseats

    -- Bean Machine
    [-1222451822] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, -0.1, 0.52, 180.0)} } }, -- gabz_bmlegion_armchair
    [-1086524442] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, 0.05, 0.85, 180.0)} } }, -- gabz_bmlegion_barstool 
    [-399437949] = { sit = { type = 'chair', seats = {[1] = vector4(0.0, -0.1, 0.5, 180.0)} } }, -- gabz_bmlegion_soloffchair
    [1820665191] = { 
        sit = { type = 'chair2', seats = {[1] = vector4(0.95, -0.1, 0.52, 180.0), [2] = vector4(0.0, -0.1, 0.52, 180.0), [3] = vector4(-0.95, -0.1, 0.52, 180.0)} },
        lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(0.0, -0.15, 0.52, 180.0)} }
    }, -- gabz_bmlegion_sofa
    
    
    -----------------
    -- Other Props --
    -----------------

    -- Burgershot MLO
    [-826656936] = { sit = { type = 'chair2', seats = {[1] = vector4(0.0, -0.02, -0.01, 0.0)} } }, -- bs_ab_dinerchair
    [360080151] = { 
        sit = { type = 'chair', seats = {[1] = vector4(-0.7, 1.2, 0.0, 180.0), [2] = vector4(0.0, 1.2, 0.0, 180.0), [3] = vector4(0.7, 0.4, 0.0, 90.0), [4] = vector4(0.7, -0.4, 0.0, 90.0), [5] = vector4(0.0, -1.2, 0.0, 180.0), [6] = vector4(-0.7, -1.2, 0.0, 180.0)} },
        lay = { type = 'layside', seats = {[1] = vector4(-0.25, 1.2, 0.0, 180.0), [2] = vector4(-0.25, -1.2, 0.0, 0.0)} }
    }, -- bs_ab_burger_seat1c
    [1397737733] = { 
        sit = { type = 'chair', seats = {[1] = vector4(0.8, -0.9, 0.0, 0.0), [2] = vector4(0.0, -0.9, 0.0, 0.0), [3] = vector4(-0.9, 0.0, 0.0, 270.0), [4] = vector4(-0.9, 0.8, 0.0, 270.0)} },
        lay = { type = 'layside', seats = {[1] = vector4(0.2, -0.8, 0.0, 0.0), [2] = vector4(-0.8, 0.2, 0.0, 270.0)} }
    }, -- bs_ab_burger_seat2l
    [-164310809] = { 
        sit = { type = 'chair', seats = {[1] = vector4(-0.4, 0.0, 0.0, 180.0), [2] = vector4(0.4, 0.0, 0.0, 180.0)} },
        lay = { type = 'layside', seats = {[1] = vector4(0.0, 0.0, 0.0, 180.0)} }
    }, -- bs_ab_dinerbench
}

Config_Chair.Chair.PolyZones = {
    ------------------
    -- Vanila MLO'S --
    ------------------

    -- The default MRPD interior (for gabz's mrpd go to: gabz_mrpd)
    ['mrpd'] = {
		enabled = false,
		center = vector3(453.47, -991.84, 28.02),
		radius = 25.0,
		polys = {
            -- Captain's Office
            ['mrpd_captain_sofa'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(452.87, -975.43, 30.2, 90.0), [2] = vector4(452.87, -976.28, 30.2, 90.0), [3] = vector4(452.86, -977.12, 30.2, 90.0)} }, 
                lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(452.87, -976.28, 30.2, 90.0)} }, 
                poly = { center = vector3(452.87, -976.28, 30.2), length = 1.0, width = 3.05, height = 1.0 } 
            },

            -- Lockers
            ['mrpd_lockers_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(455.71, -987.86, 30.2, 180.0), [2] = vector4(456.49, -987.88, 30.2, 180.0), [3] = vector4(457.48, -987.89, 30.2, 180.0)} }, 
                lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(456.49, -987.88, 30.2, 180.0)} }, 
                poly = { center = vector3(456.49, -987.88, 30.2), length = 0.75, width = 3.15, height = 1.5 } 
            },
            ['mrpd_lockers_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(459.81, -987.84, 30.2, 180.0)} }, 
                lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(459.48, -987.84, 30.2, 180.0)} }, 
                poly = { center = vector3(459.59, -987.84, 30.2), length = 0.75, width = 1.25, height = 1.5 } 
            },
            ['mrpd_lockers_3'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(458.83, -993.88, 30.2, 0.0), [2] = vector4(457.77, -993.82, 30.2, 0.0)} }, 
                lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(458.29, -993.96, 30.2, 0.0)} }, 
                poly = { center = vector3(458.29, -993.96, 30.2), length = 0.75, width = 2.0, height = 1.5 } 
            },
            ['mrpd_lockers_4'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(452.97, -993.98, 30.2, 0.0), [2] = vector4(451.70, -993.86, 30.2, 0.0)} }, 
                lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(452.42, -993.88, 30.2, 0.0)} }, 
                poly = { center = vector3(452.42, -993.88, 30.2), length = 0.75, width = 2.25, height = 1.5 } 
            },
            ['mrpd_lockers_5'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(450.30, -993.82, 30.2, 0.0)} }, 
                poly = { center = vector3(450.30, -993.82, 30.2), length = 0.75, width = 1.0, height = 1.5 } 
            },
            ['mrpd_lockers_6'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(449.28, -992.96, 30.2, 270.0)} }, 
                poly = { center = vector3(449.28, -992.96, 30.2), length = 0.75, width = 1.0, height = 1.5 } 
            },

            -- Lobby
            ['mrpd_lobby_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(442.36, -987.89, 30.2, 90.0), [2] = vector4(442.36, -987.26, 30.2, 90.0), [3] = vector4(442.36, -986.64, 30.2, 90.0), [4] = vector4(442.36, -986.02, 30.2, 90.0), [5] = vector4(442.36, -985.39, 30.2, 90.0)} }, 
                poly = { center = vector3(442.36, -986.64, 30.2), length = 0.85, width = 3.35, height = 1.25 } 
            },
            ['mrpd_lobby_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(440.21, -987.81, 30.2, 270.0), [2] = vector4(440.21, -987.18, 30.2, 270.0), [3] = vector4(440.21, -986.56, 30.2, 270.0), [4] = vector4(440.21, -985.93, 30.2, 270.0), [5] = vector4(440.21, -985.31, 30.2, 270.0)} }, 
                poly = { center = vector3(440.21, -986.56, 30.2), length = 0.85, width = 3.35, height = 1.25 } 
            },
            ['mrpd_lobby_3'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(439.30, -987.80, 30.2, 90.0), [2] = vector4(439.30, -987.17, 30.2, 90.0), [3] = vector4(439.30, -986.55, 30.2, 90.0), [4] = vector4(439.30, -985.92, 30.2, 90.0), [5] = vector4(439.30, -985.30, 30.2, 90.0)} }, 
                poly = { center = vector3(439.30, -986.55, 30.2), length = 0.85, width = 3.35, height = 1.25 } 
            },

            -- Cell #1
            ['mrpd_cell_toilet_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(458.78, -993.14, 24.375, 270.0)} }, 
                poly = { center = vector3(458.78, -993.14, 24.375), length = 0.85, width = 0.85, height = 1.25 } 
            },
            ['mrpd_cell_bench_1'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(461.28, -995.80, 24.375, 0.0), [2] = vector4(460.45, -995.80, 24.375, 0.0), [3] = vector4(459.63, -995.80, 24.375, 0.0)} }, 
                lay = { type = 'layside', seats = {[1] = vector4(460.45, -995.80, 24.375, 0.0)} },
                poly = { center = vector3(460.45, -995.80, 24.375), length = 0.65, width = 2.5, height = 1.25 } 
            },

            -- Cell #2
            ['mrpd_cell_toilet_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(457.65, -996.80, 24.375, 270.0)} }, 
                poly = { center = vector3(457.65, -996.80, 24.375), length = 0.85, width = 0.85, height = 1.25 } 
            },
            ['mrpd_cell_bench_2'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(459.10, -996.63, 24.375, 180.0), [2] = vector4(459.92, -996.63, 24.375, 180.0), [3] = vector4(460.75, -996.63, 24.375, 180.0)} }, 
                lay = { type = 'layside', seats = {[1] = vector4(459.92, -996.63, 24.375, 180.0)} },
                poly = { center = vector3(459.92, -996.63, 24.375), length = 0.65, width = 2.85, height = 1.25 } 
            },

            -- Cell #3
            ['mrpd_cell_toilet_3'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(457.65, -1000.47, 24.375, 270.0)} }, 
                poly = { center = vector3(457.65, -1000.47, 24.375), length = 0.85, width = 0.85, height = 1.25 } 
            },
            ['mrpd_cell_bench_3'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(459.10, -1000.27, 24.375, 180.0), [2] = vector4(459.92, -1000.27, 24.375, 180.0), [3] = vector4(460.75, -1000.27, 24.375, 180.0)} }, 
                lay = { type = 'layside', seats = {[1] = vector4(459.92, -1000.27, 24.375, 180.0)} },
                poly = { center = vector3(459.92, -1000.27, 24.375), length = 0.65, width = 2.85, height = 1.25 } 
            }

            -- The cell beds just didn't work very well, you can attempt to do it your self, but I ain't.
            -- ['mrpd_cell_beds_1'] = {
            --     lay = { type = 'bed', seats = {[1] = vector4(458.77, -994.89, 24.45, 180.0)} }, 
            --     poly = { center = vector3(458.77, -994.89, 24.45), length = 0.85, width = 0.85, height = 1.25 } 
            -- },
        }
    },

    -- Sandy Shores Sheriff's Office
    ['sandy_so'] = {
		enabled = false,
		center = vector3(1854.98, 3686.48, 34.0),
		radius = 10.0,
		polys = {
            ['sandy_so_chair_1'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1858.59, 3689.30, 33.85, 120.0)} }, 
                poly = { center = vector3(1858.59, 3689.30, 33.9), length = 0.75, width = 0.75, height = 1.0 } 
            },
            ['sandy_so_chair_2'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1856.56, 3685.03, 33.85, 30.0)} }, 
                poly = { center = vector3(1856.56, 3685.03, 33.9), length = 0.75, width = 0.75, height = 1.0 } 
            },
            ['sandy_so_chair_3'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1852.36, 3682.61, 33.85, 30.0)} }, 
                poly = { center = vector3(1852.36, 3682.61, 33.9), length = 0.75, width = 0.75, height = 1.0 } 
            },
            ['sandy_so_sofa_1'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1859.42, 3686.66, 33.85, 30.0), [2] = vector4(1858.78, 3686.30, 33.85, 30.0)} }, 
                poly = { center = vector3(1859.10, 3686.53, 33.9), length = 0.75, width = 1.65, height = 1.0 } 
            },
            ['sandy_so_sofa_2'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1857.89, 3685.77, 33.85, 30.0), [2] = vector4(1857.28, 3685.42, 33.85, 30.0)} }, 
                poly = { center = vector3(1857.67, 3685.65, 33.9), length = 0.75, width = 1.65, height = 1.0 } 
            },
            ['sandy_so_sofa_3'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1853.71, 3683.36, 33.85, 30.0), [2] = vector4(1853.08, 3683.00, 33.85, 30.0)} }, 
                poly = { center = vector3(1853.40, 3683.20, 33.9), length = 0.75, width = 1.65, height = 1.0 } 
            }
        }
	},

    -- Paleto Bay Sheriff's Office
    ['paleto_so'] = {
		enabled = false,
		center = vector3(-447.97, 6017.46, 31.0), 
		radius = 10.0,
		polys = {
            ['paleto_so_chair_1'] = {
                sit = { type = 'chair2', seats = {[1] = vector4(-450.04, 6017.93, 31.30, 225.0)} }, 
                poly = { center = vector3(-450.04, 6017.93, 31.30), length = 0.75, width = 0.75, height = 1.0 } 
            },
            ['paleto_so_sofa_1'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-447.76, 6019.46, 31.20, 135.0), [2] = vector4(-447.25, 6018.92, 31.20, 135.0)} }, 
                poly = { center = vector3(-447.50, 6019.13, 31.30), length = 0.75, width = 1.65, height = 1.0 } 
            },
            ['paleto_so_sofa_2'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-446.57, 6018.23, 31.20, 135.0), [2] = vector4(-445.99, 6017.66, 31.20, 135.0)} }, 
                poly = { center = vector3(-446.25, 6017.91, 31.30), length = 0.75, width = 1.65, height = 1.0 } 
            }
        }
	},

    -- The default Vanilla Unicorn
    ['vanilla_unicorn'] = {
		enabled = true,
		center = vector3(116.97, -1290.39, 30.0),
		radius = 50.0,
		polys = {
            -- Strip Watch
            ['vu_strip_watch_1'] = { 
                sit = { type = 'strip_watch', seats = {[1] = vector4(119.09, -1302.68, 28.72, 30.0)} }, 
                poly = { center = vector3(119.17, -1302.75, 28.72), length = 1.0, width = 1.3, height = 1.0 }
            },
            ['vu_strip_watch_2'] = { 
                sit = { type = 'strip_watch', seats = {[1] = vector4(116.96, -1303.84, 28.72, 30.0)} }, 
                poly = { center = vector3(117.03, -1303.99, 28.72), length = 1.0, width = 1.3, height = 1.0 } 
            },
            ['vu_strip_watch_3'] = { 
                sit = { type = 'strip_watch', seats = {[1] = vector4(114.90, -1305.11, 28.72, 30.0)} }, 
                poly = { center = vector3(114.95, -1305.21, 28.72), length = 1.0, width = 1.3, height = 1.0 } 
            },
            ['vu_strip_watch_4'] = { 
                sit = { type = 'strip_watch', seats = {[1] = vector4(113.12, -1306.19, 28.72, 30.0)} }, 
                poly = { center = vector3(113.13, -1306.26, 28.72), length = 1.0, width = 1.3, height = 1.0 } 
            },
            ['vu_strip_watch_5'] = { 
                sit = { type = 'strip_watch', seats = {[1] = vector4(110.65, -1301.87, 28.72, 210.0)} }, 
                poly = { center = vector3(110.54, -1301.7 , 28.72), length = 1.0, width = 1.3, height = 1.0 } 
            },
            ['vu_strip_watch_6'] = { 
                sit = { type = 'strip_watch', seats = {[1] = vector4(112.35, -1300.84, 28.72, 210.0)} }, 
                poly = { center = vector3(112.32, -1300.67, 28.72), length = 1.0, width = 1.3, height = 1.0 } 
            },
            ['vu_strip_watch_7'] = { 
                sit = { type = 'strip_watch', seats = {[1] = vector4(114.28, -1299.71, 28.72, 210.0)} }, 
                poly = { center = vector3(114.21, -1299.57, 28.72), length = 1.0, width = 1.3, height = 1.0 } 
            },

            -- Back room
            ['vu_stool_1'] = { 
                sit = { type = 'stool', seats = {[1] = vector4(109.31, -1305.66, 28.575, 210.0)} }, 
                poly = { length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['vu_stool_2'] = { 
                sit = { type = 'stool', seats = {[1] = vector4(107.99, -1306.21, 28.575, 210.0)} }, 
                poly = { length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['vu_stool_3'] = { 
                sit = { type = 'stool', seats = {[1] = vector4(107.09, -1306.64, 28.575, 210.0)} }, 
                poly = { length = 0.45, width = 0.45, height = 0.45 } 
            },

            -- Boss Room
            ['vu_boss_chair'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(97.72, -1293.70, 28.75, 44.0)} }, 
                poly = { center = vector3(97.72, -1293.70, 28.80), length = 0.75, width = 0.75, height = 0.75 } 
            },
            ['vu_boss_sofa'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(94.03, -1290.30, 28.8, 210.0), [2] = vector4(94.52, -1289.94, 28.8, 210.0), [3] = vector4(95.22, -1289.52, 28.8, 210.0)} }, 
                lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(94.69, -1289.93, 28.8, 210.0)} }, 
                poly = { center = vector3(94.52, -1289.94, 28.75), length = 1.0, width = 2.55, height = 1.0 } 
            },

            -- Bar Area
            ['vu_chair_1'] = { 
                sit = { type = 'chair', teleportIn = true, seats = {[1] = vector4(126.05, -1288.46, 28.78, 33.0)} }, 
                poly = { center = vector3(126.05, -1288.46, 28.78), length = 0.75, width = 0.75, height = 1.0 } 
            },
            ['vu_chair_2'] = { 
                sit = { type = 'chair', teleportIn = true, seats = {[1] = vector4(126.25, -1287.13, 28.78, 130.0)} }, 
                poly = { center = vector3(126.25, -1287.13, 28.78), length = 0.75, width = 0.75, height = 1.0 } 
            },
            ['vu_chair_3'] = { 
                sit = { type = 'chair', teleportIn = true, seats = {[1] = vector4(125.16, -1285.79, 28.78, 73.0)} }, 
                poly = { center = vector3(125.16, -1285.79, 28.78), length = 0.75, width = 0.75, height = 1.0 } 
            },
            ['vu_chair_4'] = { 
                sit = { type = 'chair', teleportIn = true, seats = {[1] = vector4(124.83, -1284.71, 28.78, 123.0)} }, 
                poly = { center = vector3(124.83, -1284.71, 28.78), length = 0.75, width = 0.75, height = 1.0 } 
            },
            ['vu_chair_5'] = { 
                sit = { type = 'chair', teleportIn = true, seats = {[1] = vector4(123.45, -1283.55, 28.78, 298.0)} }, 
                poly = { center = vector3(123.45, -1283.55, 28.78), length = 0.75, width = 0.75, height = 1.0 } 
            },
            ['vu_chair_6'] = { 
                sit = { type = 'chair', teleportIn = true, seats = {[1] = vector4(124.95, -1282.68, 28.78, 122.0)} }, 
                poly = { center = vector3(124.95, -1282.68, 28.78), length = 0.75, width = 0.75, height = 1.0 } 
            },
            ['vu_chair_7'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(118.05, -1296.09, 28.78, 330.0)} }, 
                poly = { center = vector3(118.05, -1296.09, 28.78), length = 0.75, width = 0.75, height = 1.0 } 
            },

            -- "Down Stairs"
            ['vu_chair_8'] = { 
                sit = { type = 'chair', teleportIn = true, seats = {[1] = vector4(111.39, -1290.99, 27.76, 28.0)} }, 
                poly = { center = vector3(111.39, -1290.99, 27.76), length = 0.75, width = 0.75, height = 1.0 } 
            },
            ['vu_chair_9'] = { 
                sit = { type = 'chair', teleportIn = true, seats = {[1] = vector4(110.14, -1291.71, 27.76, 33.0)} }, 
                poly = { center = vector3(110.14, -1291.71, 27.76), length = 0.75, width = 0.75, height = 1.0 } 
            },
            ['vu_chair_10'] = { 
                sit = { type = 'chair', teleportIn = true, seats = {[1] = vector4(109.08, -1292.32, 27.76, 32.0)} }, 
                poly = { center = vector3(109.08, -1292.32, 27.76), length = 0.75, width = 0.75, height = 1.0 } 
            },
            ['vu_chair_11'] = { 
                sit = { type = 'chair', teleportIn = true, seats = {[1] = vector4(108.46, -1285.79, 27.76, 232.0)} }, 
                poly = { center = vector3(108.46, -1285.79, 27.76), length = 0.75, width = 0.75, height = 1.0 } 
            },
            ['vu_chair_12'] = { 
                sit = { type = 'chair', teleportIn = true, seats = {[1] = vector4(106.71, -1286.80, 27.76, 212.0)} }, 
                poly = { center = vector3(106.71, -1286.80, 27.76), length = 0.75, width = 0.75, height = 1.0 } 
            },
            ['vu_chair_13'] = { 
                sit = { type = 'chair', teleportIn = true, seats = {[1] = vector4(104.86, -1287.90, 27.76, 177.0)} }, 
                poly = { center = vector3(104.86, -1287.90, 27.76), length = 0.75, width = 0.75, height = 1.0 } 
            },

            -- Booth #1
            ['vu_booth_1'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(124.71, -1294.45, 28.76, 120.0)} }, 
                poly = { center = vector3(124.71, -1294.45, 28.76), length = 0.75, width = 0.75, height = 1.0 } 
            },
            ['vu_booth_2'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(124.31, -1295.55, 28.76, 30.0), [2] = vector4(123.61, -1296.01, 28.76, 30.0)} }, 
                lay = { type = 'layside', seats = {[1] = vector4(123.97, -1295.81, 28.76, 30.0)} },
                poly = { center = vector3(123.97, -1295.81, 28.76), length = 0.75, width = 1.75, height = 1.0 } 
            },
            ['vu_booth_3'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(122.48, -1295.64, 28.76, 300.0)} }, 
                poly = { center = vector3(122.48, -1295.64, 28.76), length = 0.75, width = 0.75, height = 1.0 } 
            },

            -- Booth #2
            ['vu_booth_4'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(121.45, -1296.30, 28.76, 120.0)} }, 
                poly = { center = vector3(121.45, -1296.30, 28.76), length = 0.75, width = 0.75, height = 1.0 } 
            },
            ['vu_booth_5'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(121.10, -1297.46, 28.76, 30.0), [2] = vector4(120.38, -1297.87, 28.76, 30.0)} }, 
                lay = { type = 'layside', seats = {[1] = vector4(120.73, -1297.66, 28.76, 30.0)} },
                poly = { center = vector3(120.73, -1297.66, 28.76), length = 0.75, width = 1.75, height = 1.0 } 
            },
            ['vu_booth_6'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(119.33, -1297.49, 28.76, 300.0)} }, 
                poly = { center = vector3(119.33, -1297.49, 28.76), length = 0.75, width = 0.75, height = 1.0 } 
            }
        }
    },

    -- Tequi-la-la
    ['tequilala'] = {
		enabled = true,
		center = vector3(-562.20, 287.40, 84.43),
		radius = 25.0,
		polys = {
            -- Basement
            ['tequilala_b_sofa_1'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-570.98, 287.95, 78.70, 85.0), [2] = vector4(-571.07, 287.26, 78.70, 85.0), [3] = vector4(-571.11, 286.58, 78.70, 85.0)} }, 
                poly = { center = vector3(-571.07, 287.26, 78.70), length = 1.0, width = 2.5, height = 1.0 } 
            },
            ['tequilala_b_sofa_2'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-574.22, 285.84, 78.70, 351.0), [2] = vector4(-574.86, 285.93, 78.70, 351.0), [3] = vector4(-575.55, 286.00, 78.70, 351.0)} }, 
                poly = { center = vector3(-574.86, 285.93, 78.70), length = 1.0, width = 2.5, height = 1.0 } 
            },
            ['tequilala_b_sofa_3'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-576.70, 287.86, 78.70, 265.0), [2] = vector4(-576.63, 288.59, 78.70, 265.0), [3] = vector4(-576.63, 289.28, 78.70, 265.0)} }, 
                poly = { center = vector3(-576.63, 288.59, 78.70), length = 1.0, width = 2.5, height = 1.0 } 
            },

            -- Ground Level
            ['tequilala_a_sofa_1'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-558.53, 292.59, 81.65, 175.0), [2] = vector4(-557.95, 292.54, 81.65, 175.0), [3] = vector4(-557.37, 292.47, 81.65, 175.0)} }, 
                poly = { center = vector3(-557.95, 292.54, 81.65), length = 0.8, width = 1.925, height = 1.2 } 
            },
            ['tequilala_a_sofa_2'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-556.62, 292.44, 81.65, 175.0), [2] = vector4(-555.98, 292.36, 81.65, 175.0)} }, 
                lay = { type = 'layside', seats = {[1] = vector4(-556.11, 292.35, 81.65, 175.0)} },
                poly = { center = vector3(-556.34, 292.41, 81.65), length = 0.8, width = 1.30, height = 1.2 } 
            },
            ['tequilala_a_sofa_3'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-555.57, 291.22, 81.65, 85.0)} }, 
                poly = { center = vector3(-555.57, 291.22, 81.65), length = 0.8, width = 0.65, height = 1.2 } 
            },
            ['tequilala_a_sofa_4'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-552.87, 277.2, 81.65, 355.0), [2] = vector4(-553.50, 277.27, 81.65, 355.0), [3] = vector4(-554.14, 277.31, 81.65, 355.0)} }, 
                lay = { type = 'layside', seats = {[1] = vector4(-553.50, 277.27, 81.65, 355.0)} },
                poly = { center = vector3(-553.50, 277.27, 81.65), length = 0.8, width = 1.9, height = 1.2 } 
            },
            ['tequilala_a_sofa_5'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-554.82, 277.40, 81.65, 355.0), [2] = vector4(-555.38, 277.45, 81.65, 355.0), [3] = vector4(-556.00, 277.51, 81.65, 355.0)} }, 
                lay = { type = 'layside', seats = {[1] = vector4(-555.38, 277.45, 81.65, 355.0)} },
                poly = { center = vector3(-555.38, 277.45, 81.65), length = 0.8, width = 1.9, height = 1.2 } 
            },

            -- Upstairs
            ['tequilala_c_sofa_1'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-561.84, 290.81, 84.85, 175.0), [2] = vector4(-561.30, 290.75, 84.85, 175.0), [3] = vector4(-560.75, 290.72, 84.85, 175.0)} }, 
                lay = { type = 'layside', seats = {[1] = vector4(-561.30, 290.75, 84.85, 175.0)} },
                poly = { center = vector3(-561.30, 290.75, 84.95), length = 0.8, width = 1.9, height = 1.2 } 
            },
            ['tequilala_c_sofa_2'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-560.01, 290.62, 84.85, 175.0), [2] = vector4(-559.40, 290.57, 84.85, 175.0), [3] = vector4(-558.81, 290.52, 84.85, 175.0)} }, 
                lay = { type = 'layside', seats = {[1] = vector4(-559.40, 290.57, 84.85, 175.0)} },
                poly = { center = vector3(-559.40, 290.57, 84.95), length = 0.8, width = 1.9, height = 1.2 } 
            }
        }
	},

    -- Coroner
    ['coroner'] = {
		enabled = true,
		center = vector3(263.0, -1355.0, 25.0),
		radius = 50.0,
		polys = {
            -- Autopsy Benches
            ['coroner_autopsy_1'] = { 
                lay = { type = 'medical', teleportIn = true, seats = {[1] = vector4(256.22, -1343.78, 24.53, 140.0)} }, 
                poly = { center = vector3(256.35, -1343.63, 24.55), length = 2.85, width = 1.1, height = 0.5 } 
            },
            ['coroner_autopsy_2'] = { 
                lay = { type = 'medical', teleportIn = true, seats = {[1] = vector4(260.16, -1347.13, 24.53, 140.0)} }, 
                poly = { center = vector3(260.31, -1346.95, 24.53), length = 2.85, width = 1.1, height = 0.5 } 
            },
            ['coroner_autopsy_3'] = { 
                lay = { type = 'medical', teleportIn = true, seats = {[1] = vector4(255.95, -1352.17, 24.53, 320.0)} }, 
                poly = { center = vector3(255.72, -1352.42, 24.53), length = 2.85, width = 1.1, height = 0.5 } 
            },
            ['coroner_autopsy_4'] = { 
                lay = { type = 'medical', teleportIn = true, seats = {[1] = vector4(251.93, -1348.91, 24.53, 320.0)} }, 
                poly = { center = vector3(251.76, -1349.10, 24.53), length = 2.85, width = 1.1, height = 0.5 } 
            },
            ['coroner_autopsy_5'] = { 
                lay = { type = 'medical', teleportIn = true, seats = {[1] = vector4(278.54, -1338.57, 24.53, 230.0)} }, 
                poly = { center = vector3(278.78, -1338.77, 24.53), length = 2.85, width = 1.1, height = 0.5 } 
            },
            ['coroner_autopsy_6'] = { 
                lay = { type = 'medical', teleportIn = true, seats = {[1] = vector4(280.86, -1335.79, 24.53, 230.0)} }, 
                poly = { center = vector3(281.06, -1336.05, 24.53), length = 2.85, width = 1.1, height = 0.5 } 
            },
            
            -- Hallway
            ['coroner_hallway_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(267.58, -1352.19, 24.0, 140.0), [2] = vector4(268.20, -1352.71, 24.0, 140.0)} }, 
                poly = { center = vector3(267.91, -1352.40, 24.0), length = 0.75, width = 1.6, height = 1.0 } 
            },
            ['coroner_hallway_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(268.85, -1353.25, 24.0, 140.0), [2] = vector4(269.43, -1353.74, 24.0, 140.0)} }, 
                poly = { center = vector3(269.20, -1353.45, 24.0), length = 0.75, width = 1.6, height = 1.0 } 
            }
        }
	},

    -- All the tatto shops around the map
    ['tattoo_shops'] = {
		enabled = true,
		radius = false,
		polys = {
            ['tattoo_sandy_shores'] = { 
                sit = { type = 'chair', teleportIn = true, seats = {[1] = vector4(1863.97, 3745.93, 32.75, 0.0)} }, 
                poly = { center = vector3(1863.97, 3745.93, 32.75), length = 1.0, width = 1.0, height = 1.4 } 
            },
            ['tattoo_paleto_bay'] = { 
                sit = { type = 'chair', teleportIn = true, seats = {[1] = vector4(-294.11, 6201.77, 31.2, 195.0)} }, 
                poly = { center = vector3(-294.11, 6201.77, 31.25), length = 1.0, width = 1.0, height = 1.35 } 
            },
            ['tattoo_el_burro_heights'] = { 
                sit = { type = 'tattoo', teleportIn = true, seats = {[1] = vector4(1322.63, -1654.06, 52.0, 360.0)} }, 
                poly = { center = vector3(1322.63, -1654.06, 52.0), length = 1.6, width = 0.9, height = 1.5, heading = 354.0 } 
            },
            ['tattoo_el_burro_heights_lay'] = { 
                lay = { type = 'tattoo', teleportIn = true, seats = {[1] = vector4(1321.20, -1655.17, 52.0, 20.0)} }, 
                poly = { center = vector3(1321.20, -1655.17, 51.55), length = 2.25, width = 0.9, height = 1.25 } 
            },
            ['tattoo_vinewood'] = { 
                sit = { type = 'tattoo', teleportIn = true, seats = {[1] = vector4(324.15, 181.25, 103.37, 120.0)} }, 
                poly = { center = vector3(324.13, 181.30, 103.37), length = 1.6, width = 0.9, height = 1.5, heading = 115.0 } 
            },
            ['tattoo_vinewood_lay'] = { 
                lay = { type = 'tattoo', teleportIn = true, seats = {[1] = vector4(325.79, 180.60, 103.21, 140.0)} },
                poly = { center = vector3(325.79, 180.60, 103.21), length = 2.25, width = 0.9, height = 1.25 } 
            },
            ['tattoo_vespucci'] = { 
                sit = { type = 'tattoo', teleportIn = true, seats = {[1] = vector4(-1154.42, -1427.65, 4.70, 352.0)} }, 
                poly = { center = vector3(-1154.38, -1427.52, 4.70), length = 1.6, width = 0.9, height = 1.5, heading = 350.0 } 
            },
            ['tattoo_vespucci_lay'] = { 
                lay = { type = 'tattoo', teleportIn = true, seats = {[1] = vector4(-1155.91, -1428.54, 4.60, 15.0)} }, 
                poly = { center = vector3(-1155.91, -1428.54, 4.60), length = 2.25, width = 0.9, height = 1.25 } 
            },
            ['tattoo_chumash'] = { 
                sit = { type = 'tattoo', teleportIn = true, seats = {[1] = vector4(-3170.55, 1077.40, 20.55, 205.0)} }, 
                poly = { center = vector3(-3170.55, 1077.30, 20.64), length = 1.6, width = 0.9, height = 1.5, heading = 200.0 } 
            },
            ['tattoo_chumash_lay'] = { 
                lay = { type = 'tattoo', teleportIn = true, seats = {[1] = vector4(-3169.76, 1078.95, 20.46, 227.0)} }, 
                poly = { center = vector3(-3169.76, 1078.95, 20.46), length = 2.25, width = 0.9, height = 1.25 } 
            }
        }
	},

    -- Trevor's Trailer
    ['trevors_trailer'] = {
		enabled = true,
		center = vector3(1973.0, 3818.0, 35.0),
		radius = 10.0,
		polys = {
            ['trevors_trailer_sofa'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1973.47, 3820.66, 32.9, 210.0), [2] = vector4(1974.11, 3820.98, 32.9, 210.0), [3] = vector4(1974.78, 3821.34, 32.9, 210.0)} }, 
                lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(1974.16, 3820.92, 32.9, 210.0)} }, 
                poly = { center = vector3(1974.09, 3821.11, 32.9), length = 1.0, width = 2.55, height = 2.15 } 
            },
            ['trevors_trailer_toilet'] = { 
                sit = { type = 'chair', teleportIn = true, seats = {[1] = vector4(1971.59, 3819.49, 33.0, 120.0)} }, 
                poly = { center = vector3(1971.59, 3819.49, 33.0), length = 0.6, width = 0.6, height = 1.0 } 
            }
        }
	},

    -- Baleto Bay Bank (Blain County Savings Bank)
    ['paleto_bank'] = {
        enabled = true,
        center = vector3(-112.37, 6467.65, 31.0), 
        radius = 10.0,
        polys = {
            ['paleto_bank_sofa_1'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-106.83, 6464.15, 31.10, 45.0), [2] = vector4(-106.28, 6464.62, 31.10, 45.0)} }, 
                poly = { center = vector3(-106.65, 6464.44, 31.20), length = 0.75, width = 1.65, height = 1.0 } 
            },
            ['paleto_bank_sofa_2'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-108.09, 6462.96, 31.10, 45.0), [2] = vector4(-108.60, 6462.45, 31.10, 45.0)} }, 
                poly = { center = vector3(-108.39, 6462.70, 31.20), length = 0.75, width = 1.65, height = 1.0 } 
            },
            ['paleto_bank_sofa_3'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-114.37, 6464.70, 31.10, 315.0), [2] = vector4(-114.92, 6465.21, 31.10, 315.0)} }, 
                poly = { center = vector3(-114.61, 6464.93, 31.20), length = 0.75, width = 1.65, height = 1.0 } 
            },
            ['paleto_bank_sofa_4'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-116.01, 6466.33, 31.10, 315.0), [2] = vector4(-116.54, 6466.86, 31.10, 315.0)} }, 
                poly = { center = vector3(-116.29, 6466.62, 31.20), length = 0.75, width = 1.65, height = 1.0 } 
            },
            ['paleto_bank_sofa_5'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-117.76, 6468.08, 31.10, 315.0), [2] = vector4(-118.29, 6468.62, 31.10, 315.0)} }, 
                poly = { center = vector3(-118.05, 6468.37, 31.20), length = 0.75, width = 1.65, height = 1.0 } 
            }
        }
    },

    ['pacific_standard'] = {
        enabled = false,
        center = vector3(248.17, 214.02, 107.02),
        radius = 30.0,
        polys = {
            -- Public Area
            ['ps_pa_chair_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(238.62, 220.15, 105.75, 295.0)} }, 
                poly = { center = vector3(238.56, 220.11, 105.62), length = 1.15, width = 1.15, height = 1.0 } 
            },
            ['ps_pa_chair_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(239.34, 218.69, 105.75, 295.0)} }, 
                poly = { center = vector3(239.26, 218.65, 105.62), length = 1.15, width = 1.15, height = 1.0 } 
            },
            ['ps_pa_chair_3'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(239.94, 217.31, 105.75, 295.0)} }, 
                poly = { center = vector3(239.86, 217.27, 105.62), length = 1.15, width = 1.15, height = 1.0 } 
            },
            ['ps_pa_chair_4'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(248.23, 212.03, 105.75, 175.0)} }, 
                poly = { length = 1.1, width = 1.12, height = 1.0 } 
            },
            ['ps_pa_chair_5'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(249.44, 211.57, 105.75, 140.0)} }, 
                poly = { length = 1.1, width = 1.12, height = 1.0 } 
            },
            ['ps_pa_chair_6'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(253.83, 209.99, 105.75, 175.0)} }, 
                poly = { length = 1.1, width = 1.12, height = 1.0 } 
            },
            ['ps_pa_chair_7'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(255.07, 209.52, 105.75, 140.0)} }, 
                poly = { length = 1.1, width = 1.12, height = 1.0 } 
            },
            ['ps_pa_chair_8'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(257.80, 211.78, 105.75, 71.0)} }, 
                poly = { center = vector3(257.82, 211.74, 105.62), length = 1.15, width = 1.15, height = 1.0 } 
            },
            ['ps_pa_chair_9'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(257.34, 210.54, 105.75, 71.0)} }, 
                poly = { center = vector3(257.38, 210.54, 105.62), length = 1.15, width = 1.15, height = 1.0 } 
            },

            -- Office
            ['ps_of_chair_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(265.28, 213.30, 109.75, 140.0)} }, 
                poly = { length = 1.15, width = 1.15, height = 1.0 } 
            },
            ['ps_of_chair_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(262.20, 206.80, 109.75, 140.0)} }, 
                poly = { length = 1.15, width = 1.15, height = 1.0 } 
            },
            ['ps_of_chair_3'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(260.73, 207.36, 109.75, 175.0)} }, 
                poly = { length = 1.15, width = 1.15, height = 1.0 } 
            },

            -- Consultations
            ['ps_ct_chair_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(245.16, 209.84, 109.75, 255.0)} }, 
                poly = { center = vector3(245.16, 209.84, 109.62), length = 1.15, width = 1.15, height = 1.0 } 
            },
            ['ps_ct_chair_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(239.53, 211.89, 109.75, 255.0)} }, 
                poly = { center = vector3(239.53, 211.89, 109.62), length = 1.15, width = 1.15, height = 1.0 } 
            },
            ['ps_ct_chair_3'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(233.90, 214.36, 109.75, 295.0)} }, 
                poly = { center = vector3(233.90, 214.36, 109.62), length = 1.15, width = 1.15, height = 1.0 } 
            },
            ['ps_ct_chair_4'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(233.20, 215.84, 109.75, 295.0)} }, 
                poly = { center = vector3(233.20, 215.84, 109.62), length = 1.15, width = 1.15, height = 1.0 } 
            },
            ['ps_ct_chair_5'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(232.43, 217.42, 109.75, 295.0)} }, 
                poly = { center = vector3(232.43, 217.42, 109.62), length = 1.15, width = 1.15, height = 1.0 } 
            },
            ['ps_ct_chair_6'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(234.06, 222.87, 109.75, 165.0)} }, 
                poly = { center = vector3(234.06, 222.87, 109.62), length = 1.15, width = 1.15, height = 1.0 } 
            },

            -- Downstairs/Vault
            ['ps_ds_chair_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(266.35, 221.99, 101.15, 115.0)} }, 
                poly = { length = 1.15, width = 1.15, height = 1.0 } 
            },
            ['ps_ds_chair_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(251.15, 217.28, 101.15, 160.0)} }, 
                poly = { length = 1.15, width = 1.15, height = 1.0 } 
            }
        }
    },

    ['pdm'] = {
		enabled = true,
		center = vector3(-57.17, -1089.03, 26.86),
		radius = 1000.0,
		polys = {
            ['pdm_couch_1'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-57.46, -1089.88, 25.91, 250.0), [2] = vector4(-57.17, -1089.08, 25.91, 250.0), [3] = vector4(-56.88, -1088.28, 25.91, 250.0)} }, 
                lay = { type = 'layside', seats = {[1] = vector4(-57.17, -1089.08, 25.91, 250.0)} },
                poly = { center = vector3(-57.17, -1089.08, 25.91), length = 1.0, width = 3.1, height = 1.0 } 
            },
            ['pdm_couch_2'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-55.39, -1087.52, 25.91, 160.0), [2] = vector4(-54.59, -1087.81, 25.91, 160.0), [3] = vector4(-53.79, -1088.10, 25.91, 160.0)} }, 
                lay = { type = 'layside', seats = {[1] = vector4(-54.59, -1087.81, 25.91, 160.0)} },
                poly = { center = vector3(-54.59, -1087.81, 25.91), length = 1.0, width = 3.1, height = 1.0 } 
            }
        }
    },

    ['lscustoms'] = {
		enabled = true,
        center = vector3(644.26, 4629.33, 34.90),
		radius = 2070.0,
		polys = {
            -- Harmony
            ['lscustoms_couch_1'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1186.50, 2639.58, 37.88, 270.0), [2] = vector4(1186.50, 2640.36, 37.88, 270.0)} },
                poly = { center = vector3(1186.40, 2639.92, 37.88), length = 1.0, width = 2.4, height = 1.0 } 
            },

            -- Beeker's Garage (Paleto Bay)
            ['lscustoms_couch_2'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(101.88, 6618.99, 31.93, 135.0), [2] = vector4(102.38, 6618.49, 31.93, 135.0)} },
                poly = { center = vector3(102.13, 6618.74, 31.93), length = 1.0, width = 2.3, height = 1.0 } 
            },
        }
    },

    -- This is only a proof of concept.
    ['wall'] = {
		enabled = true,
		center = vector3(100.20, -1388.65, 30.0),
		radius = 10.0,
		polys = {
            ['wall_1'] = { 
                sit = { type = 'wall', teleportIn = true, seats = {[1] = vector4(100.20, -1388.65, 29.41, 340.0)} }, 
                poly = { length = 0.6, width = 1.0, height = 1.0 } 
            },
        }
    },

    -- This is only a proof of concept.
    ['steps'] = {
		enabled = true,
		center = vector3(151.60, -988.22, 28.90),
		radius = 10.0,
		polys = {
            ['steps_1'] = { 
                sit = { type = 'steps', teleportIn = true, seats = {[1] = vector4(151.60, -988.22, 28.90, 160.0)} }, 
                poly = { length = 0.6, width = 1.0, height = 1.0 } 
            },
        }
    },

    -- This is only a proof of concept.
    ['ledge'] = {
		enabled = true,
		center = vector3(-126.58, -979.24, 295.23),
		radius = 10.0,
		polys = {
            ['ledge_1'] = { 
                sit = { type = 'ledge', teleportIn = true, seats = {[1] = vector4(-126.58, -979.24, 295.23, 28.0)} }, 
                poly = { length = 0.6, width = 1.0, height = 1.0 } 
            },
        }
    },
    

    ---------------------
    -- GABZ TEAM MLO'S --
    ---------------------

    -- Pillbox
    ['gabz_pillbox'] = {
        enabled = true,
        center = vector3(333.0, -582.0, 43.0),
        radius = 60.0,
        polys = {
            -- Reception Front
            ['pillbox_recept_f_1'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(298.85, -588.61, 42.8, 250.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_recept_f_2'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(298.04, -590.71, 42.8, 250.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_recept_f_3'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(301.00, -591.53, 42.8, 70.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 }
            },
            ['pillbox_recept_f_4'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(301.49, -590.34, 42.8, 70.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_recept_f_5'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(299.55, -593.55, 42.8, 340.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_recept_f_6'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(300.48, -593.93, 42.8, 340.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_recept_f_7'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(302.46, -594.67, 42.8, 342.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_recept_f_8'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(303.45, -594.97, 42.8, 338.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_recept_f_9'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(312.50, -585.76, 42.8, 160.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_recept_f_10'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(314.44, -586.45, 42.8, 160.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },

            -- Reception Back
            ['pillbox_recept_b_1'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(317.58, -595.18, 42.8, 166.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_recept_b_2'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(318.48, -595.51, 42.8, 160.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_recept_b_3'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(319.44, -595.92, 42.8, 160.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_recept_b_4'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(320.07, -597.21, 42.8, 70.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_recept_b_5'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(319.80, -598.12, 42.8, 70.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_recept_b_6'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(315.01, -599.08, 42.8, 318.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_recept_b_7'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(317.05, -599.95, 42.8, 340.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_recept_b_8'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(318.03, -600.27, 42.8, 340.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_recept_b_9'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(320.21, -601.05, 42.8, 340.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_recept_b_10'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(321.16, -601.45, 42.8, 340.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_recept_b_11'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(322.39, -601.86, 42.8, 340.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },

            -- Ward A
            ['pillbox_ward_a_1'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(311.06, -575.83, 42.8, 340.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_a_2'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(311.92, -576.14, 42.8, 340.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_a_3'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(312.73, -576.45, 42.8, 340.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_a_4'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(314.84, -577.27, 42.8, 340.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_a_5'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(319.31, -578.85, 42.8, 340.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_a_6'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(320.28, -579.13, 42.8, 340.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_a_7'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(321.08, -579.48, 42.8, 340.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_a_8'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(309.00, -570.97, 42.8, 160.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_a_9'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(311.11, -571.72, 42.8, 160.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_a_10'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(314.90, -573.04, 42.8, 160.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_a_11'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(316.95, -573.89, 42.8, 160.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_a_12'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(320.81, -575.33, 42.8, 160.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_a_13'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(322.17, -575.73, 42.8, 160.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
        
            -- Ward B
            ['pillbox_ward_b_1'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(334.57, -584.32, 42.8, 340.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_b_2'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(335.49, -584.80, 42.8, 340.0)} }, 
                poly = { length = 1.0, width = 0.9, height = 1.0 } 
            },
            ['pillbox_ward_b_3'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(337.62, -585.54, 42.8, 340.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_b_4'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(338.55, -585.83, 42.8, 340.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_b_5'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(337.88, -581.45, 42.8, 160.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_b_6'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(339.87, -582.19, 42.8, 160.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_b_7'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(342.68, -583.20, 42.8, 160.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_b_8'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(343.61, -583.48, 42.8, 160.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_b_9'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(345.58, -584.19, 42.8, 160.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },

            -- Ward B Toilets
            ['pillbox_ward_t_1'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(330.44, -584.14, 42.8, 160.0)} }, 
                poly = { length = 0.8, width = 0.8, height = 1.0 } 
            },
            ['pillbox_ward_t_2'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(332.01, -584.69, 42.8, 160.0)} }, 
                poly = { length = 0.8, width = 0.8, height = 1.0 } 
            },
            ['pillbox_ward_t_3'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(333.57, -585.23, 42.8, 160.0)} }, 
                poly = { length = 0.8, width = 0.8, height = 1.0 } 
            },
            ['pillbox_ward_t_4'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(335.15, -585.80, 42.8, 160.0)} }, 
                poly = { length = 0.8, width = 0.8, height = 1.0 } 
            },
            ['pillbox_ward_t_5'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(328.94, -590.46, 42.8, 340.0)} }, 
                poly = { length = 0.8, width = 0.8, height = 1.0 } 
            },
            ['pillbox_ward_t_6'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(330.47, -591.00, 42.8, 340.0)} }, 
                poly = { length = 0.8, width = 0.8, height = 1.0 } 
            },
            ['pillbox_ward_t_7'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(331.97, -591.56, 42.8, 340.0)} }, 
                poly = { length = 0.8, width = 0.8, height = 1.0 } 
            },
            ['pillbox_ward_t_8'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(333.49, -592.11, 42.8, 340.0)} }, 
                poly = { length = 0.8, width = 0.8, height = 1.0 } 
            },

            -- Administration
            ['pillbox_admin_1'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(335.34, -590.72, 42.8, 250.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_admin_2'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(335.61, -589.87, 42.8, 250.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_admin_3'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(336.39, -587.91, 42.8, 250.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_admin_4'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(336.72, -587.04, 42.8, 250.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_admin_5'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(339.12, -594.00, 42.8, 160.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },

            -- Ward C
            ['pillbox_ward_c_1'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(348.60, -590.85, 42.8, 250.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_2'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(348.34, -591.84, 42.8, 250.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_3'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(346.86, -595.77, 42.8, 250.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_4'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(348.96, -601.01, 42.8, 70.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_5'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(349.31, -600.05, 42.8, 70.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_6'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(354.39, -591.58, 42.8, 340.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_7'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(355.34, -591.92, 42.8, 340.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_8'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(358.22, -592.90, 42.8, 340.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_9'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(360.91, -593.96, 42.8, 340.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_10'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(361.98, -594.36, 42.8, 340.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_11'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(364.26, -591.19, 42.8, 160.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_12'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(362.15, -590.36, 42.8, 160.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 }
            },
            ['pillbox_ward_c_13'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(359.47, -589.38, 42.8, 160.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_14'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(357.41, -588.61, 42.8, 160.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_15'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(356.51, -588.37, 42.8, 160.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            }, 
            ['pillbox_ward_c_16'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(357.05, -578.78, 42.8, 70.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_17'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(357.75, -576.87, 42.8, 70.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_18'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(343.37, -589.18, 42.8, 245.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_19'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(342.73, -590.93, 42.8, 255.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_20'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(341.35, -594.01, 42.8, 250.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_21'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(340.47, -597.48, 43.0, 340.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_22'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(351.86, -601.20, 42.8, 320.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_23'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(352.94, -601.70, 42.8, 342.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_24'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(353.90, -602.04, 42.8, 340.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_25'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(353.87, -596.59, 42.8, 333.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_26'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(360.88, -598.87, 42.8, 78.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_27'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(363.26, -587.51, 42.8, 228.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_28'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(366.13, -585.02, 42.8, 70.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_29'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(366.94, -582.92, 42.8, 70.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_30'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(358.40, -583.70, 42.8, 163.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_31'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(359.34, -583.98, 42.8, 160.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            }, 
            ['pillbox_ward_c_32'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(360.25, -584.32, 42.8, 160.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_33'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(359.74, -582.60, 42.8, 336.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_c_34'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(360.72, -583.13, 42.8, 340.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },

            -- Ward D
            ['pillbox_ward_d_1'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(329.48, -592.12, 42.8, 187.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_d_2'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(331.56, -592.90, 42.8, 162.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_ward_d_3'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(332.63, -593.22, 42.8, 155.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },

            -- Locker Room
            ['pillbox_locker_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(299.50, -599.24, 42.8, 70.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_locker_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(299.82, -598.26, 42.8, 70.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_locker_3'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(300.82, -598.54, 42.8, 250.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_locker_4'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(300.47, -599.54, 42.8, 250.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_locker_5'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(295.80, -596.66, 42.8, 250.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_locker_6'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(297.21, -598.59, 43.0, 70.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 }
            },

            -- Downstairs
            ['pillbox_downstairs_1'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(353.23, -596.02, 28.3, 340.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_downstairs_2'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(354.64, -595.24, 28.3, 70.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_downstairs_3'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(354.99, -594.33, 28.3, 70.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_downstairs_4'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(356.04, -583.21, 28.3, 160.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_downstairs_5'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(354.00, -582.47, 28.3, 160.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            },
            ['pillbox_downstairs_6'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(352.89, -581.99, 28.3, 160.0)} }, 
                poly = { length = 1.0, width = 1.0, height = 1.0 } 
            }
        }
    },

    -- Mission Row Police Department
    ['gabz_mrpd'] = {
        enabled = true,
        center = vector3(471.52, -995.17, 28.04),
        radius = 45.0,
        polys = {
            -- Level 0 --
            ['mrpd_bench_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(464.46, -984.94, 25.8, 270.0), [2] = vector4(464.46, -984.13, 25.8, 270.0)} },
                poly = { center = vector3(464.46, -984.55, 25.8), length = 0.4, width = 1.5, height = 0.4 } 
            },
            ['mrpd_bench_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(464.46, -986.49, 25.80, 270.0), [2] = vector4(464.46, -985.69, 25.80, 270.0)} },
                poly = { center = vector3(464.46, -986.09, 25.8), length = 0.4, width = 1.5, height = 0.4 } 
            },
            ['mrpd_bench_3'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(464.46, -988.06, 25.80, 270.0), [2] = vector4(464.46, -987.26, 25.80, 270.0)} },
                poly = { center = vector3(464.46, -987.66, 25.8), length = 0.4, width = 1.5, height = 0.4 } 
            },

            ['mrpd_bench_4'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(478.76, -991.74, 25.80, 90.0), [2] = vector4(478.76, -992.54, 25.80, 90.0)} },
                poly = { center = vector3(478.76, -992.14, 25.8), length = 0.4, width = 1.5, height = 0.4 } 
            },
            ['mrpd_bench_5'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(478.76, -993.14, 25.80, 90.0), [2] = vector4(478.76, -993.94, 25.80, 90.0)} },
                poly = { center = vector3(478.76, -993.54, 25.8), length = 0.4, width = 1.5, height = 0.4 } 
            },

            ['mrpd_bench_6'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(482.35, -1001.64, 25.80, 90.0), [2] = vector4(482.35, -1002.44, 25.80, 90.0)} },
                poly = { center = vector3(482.35, -1002.04, 25.8), length = 0.4, width = 1.5, height = 0.4 } 
            },

            ['mrpd_bench_7'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(473.50, -1010.50, 25.80, 0.0), [2] = vector4(472.70, -1010.50, 25.80, 0.0)} },
                poly = { center = vector3(473.10, -1010.50, 25.8), length = 0.4, width = 1.5, height = 0.4 } 
            },

            -- Cells
            ['mrpd_bench_8'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(483.28, -1004.36, 25.80, 180.0), [2] = vector4(484.08, -1004.36, 25.80, 180.0)} },
                poly = { center = vector3(483.66, -1004.40, 25.8), length = 0.4, width = 1.5, height = 0.4 } 
            },
            ['mrpd_bench_9'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(484.95, -1004.40, 25.80, 180.0), [2] = vector4(485.75, -1004.40, 25.80, 180.0)} },
                poly = { center = vector3(485.35, -1004.40, 25.8), length = 0.4, width = 1.5, height = 0.4 } 
            },
            ['mrpd_bench_10'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(486.59, -1004.40, 25.80, 180.0), [2] = vector4(487.39, -1004.40, 25.80, 180.0)} },
                poly = { center = vector3(486.99, -1004.40, 25.8), length = 0.4, width = 1.5, height = 0.4 } 
            },
            ['mrpd_bench_11'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(488.27, -1006.28, 25.80, 90.0), [2] = vector4(488.27, -1007.08, 25.80, 90.0)} },
                poly = { center = vector3(488.27, -1006.68, 25.8), length = 0.4, width = 1.5, height = 0.4 } 
            },

            ['mrpd_cell_1_bed'] = {
                sit = { type = 'chair2', seats = {[1] = vector4(488.06, -1013.58, 25.78, 90.0), [2] = vector4(488.06, -1014.58, 25.78, 90.0)} },
                lay = { type = 'layside', seats = {[1] = vector4(488.06, -1014.08, 25.78, 90.0)} },
                poly = { center = vector3(488.06, -1014.08, 25.78), length = 0.85, width = 2.2, height = 0.8 } 
            },
            ['mrpd_cell_1_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(486.21, -1015.2, 25.74, 0.0)} },
                poly = { length = 0.8, width = 0.5, height = 0.5 } 
            },

            ['mrpd_cell_2_bed'] = {
                sit = { type = 'chair2', seats = {[1] = vector4(485.06, -1013.58, 25.78, 90.0), [2] = vector4(485.06, -1014.58, 25.78, 90.0)} },
                lay = { type = 'layside', seats = {[1] = vector4(485.06, -1014.08, 25.78, 90.0)} },
                poly = { center = vector3(485.06, -1014.08, 25.78), length = 0.85, width = 2.2, height = 0.8 } 
            },
            ['mrpd_cell_2_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(483.11, -1015.2, 25.74, 0.0)} },
                poly = { length = 0.8, width = 0.5, height = 0.5 } 
            },

            ['mrpd_cell_3_bed'] = {
                sit = { type = 'chair2', seats = {[1] = vector4(482.06, -1013.58, 25.78, 90.0), [2] = vector4(482.06, -1014.58, 25.78, 90.0)} },
                lay = { type = 'layside', seats = {[1] = vector4(482.06, -1014.08, 25.78, 90.0)} },
                poly = { center = vector3(482.06, -1014.08, 25.78), length = 0.85, width = 2.2, height = 0.8 } 
            },
            ['mrpd_cell_3_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(480.11, -1015.2, 25.74, 0.0)} },
                poly = { length = 0.8, width = 0.5, height = 0.5 } 
            },

            ['mrpd_cell_4_bed'] = {
                sit = { type = 'chair2', seats = {[1] = vector4(479.06, -1013.58, 25.78, 90.0), [2] = vector4(479.06, -1014.58, 25.78, 90.0)} },
                lay = { type = 'layside', seats = {[1] = vector4(479.06, -1014.08, 25.78, 90.0)} },
                poly = { center = vector3(479.06, -1014.08, 25.78), length = 0.85, width = 2.2, height = 0.8 } 
            },
            ['mrpd_cell_4_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(477.02, -1015.2, 25.74, 0.0)} },
                poly = { length = 0.8, width = 0.5, height = 0.5 } 
            },

            -- Level 1 --
            -- Captain
            ['mrpd_captain_sofa'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(462.36, -990.84, 30.2, 0.0), [2] = vector4(461.58, -990.84, 30.2, 0.0), [3] = vector4(460.88, -990.84, 30.2, 0.0)} }, 
                lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(461.58, -990.80, 30.2, 0.0)} }, 
                poly = { center = vector3(461.58, -990.84, 30.14), length = 1.0, width = 2.85, height = 1.0 } 
            },

            -- Lockers
            ['mrpd_lockers_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(463.10, -997.43, 30.2, 0.0), [2] = vector4(462.25, -997.43, 30.2, 0.0), [3] = vector4(461.40, -997.43, 30.2, 0.0), [4] = vector4(460.45, -997.43, 30.2, 0.0), [5] = vector4(459.65, -997.43, 30.2, 0.0)} }, 
                lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(462.35, -997.43, 30.2, 0.0), [2] = vector4(460.35, -997.43, 30.2, 0.0)} }, 
                poly = { center = vector3(461.43, -997.38, 30.0), length = 0.5, width = 4.25, height = 1.0 } 
            },
            ['mrpd_lockers_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(459.65, -998.10, 30.2, 180.0), [2] = vector4(460.45, -998.10, 30.2, 180.0), [3] = vector4(461.40, -998.10, 30.2, 180.0), [4] = vector4(462.25, -998.10, 30.2, 180.0), [5] = vector4(463.10, -998.10, 30.2, 180.0)} }, 
                lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(462.35, -998.10, 30.2, 180.0), [2] = vector4(460.35, -998.10, 30.2, 180.0)} }, 
                poly = { center = vector3(461.43, -998.20, 30.0), length = 0.5, width = 4.25, height = 1.0 } 
            },

            -- Toilets
            ['mrpd_toilet_1'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(472.01, -979.95, 30.2, 180.0)} },
                poly = { length = 0.6, width = 0.5, height = 1.0 } 
            },
            ['mrpd_toilet_2'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(473.19, -979.95, 30.2, 180.0)} },
                poly = { length = 0.6, width = 0.5, height = 1.0 } 
            },
            ['mrpd_toilet_3'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(474.37, -979.95, 30.2, 180.0)} },
                poly = { length = 0.6, width = 0.5, height = 1.0 } 
            },

            -- Break Room
            ['mrpd_break_sofa'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(459.40, -981.77, 30.2, 270.0), [2] = vector4(459.40, -981.07, 30.2, 270.0), [3] = vector4(459.40, -980.37, 30.2, 270.0)} }, 
                lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(459.40, -981.07, 30.2, 270.0)} }, 
                poly = { center = vector3(459.48, -981.07, 30.14), length = 1.0, width = 2.85, height = 1.0 } 
            },
            ['mrpd_break_chair_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(461.92, -977.13, 30.2, 195.0)} },
                poly = { length = 0.6, width = 0.55, height = 1.0 } 
            },
            ['mrpd_break_chair_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(462.0, -978.64, 30.2, 350.0)} },
                poly = { length = 0.6, width = 0.55, height = 1.0 } 
            },
            ['mrpd_break_chair_3'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(463.09, -977.06, 30.2, 148.0)} },
                poly = { length = 0.6, width = 0.55, height = 1.0 } 
            },
            ['mrpd_break_chair_4'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(462.95, -978.68, 30.2, 11.0)} },
                poly = { length = 0.6, width = 0.55, height = 1.0 } 
            },

            -- Level 2 --
            ['mrpd_bench_12'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(447.14, -977.10, 34.57, 180.0), [2] = vector4(447.94, -977.10, 34.57, 180.0)} },
                poly = { center = vector3(447.54, -977.10, 34.57), length = 0.4, width = 1.5, height = 0.4 } 
            },
            ['mrpd_bench_13'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(447.94, -976.40, 34.57, 0.0), [2] = vector4(447.14, -976.40, 34.57, 0.0)} },
                poly = { center = vector3(447.54, -976.40, 34.57), length = 0.4, width = 1.5, height = 0.4 } 
            },
            ['mrpd_upstairs_sofa'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(440.25, -975.47, 34.48, 270.0), [2] = vector4(440.25, -974.72, 34.48, 270.0), [3] = vector4(440.25, -973.97, 34.48, 270.0)} }, 
                lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(440.25, -974.72, 34.48, 270.0)} }, 
                poly = { center = vector3(440.25, -974.72, 34.48), length = 1.0, width = 2.85, height = 1.0 } 
            },
        }
    },

    -- Sandy Shores Sheriff's Office
    ['gabz_sandy_so'] = {
        enabled = true,
        center = vector3(1811.44, 3677.94, 33.68),
        radius = 60.0,
        polys = {
            ['sandy_so_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1835.74, 3684.91, 33.73, 210.0)} },
                poly = { length = 0.8, width = 0.6, height = 1.0 } 
            },

            -- Cell #1
            ['sandy_so_cell_1_bed'] = {
                sit = { type = 'chair2', seats = {[1] = vector4(1810.38, 3673.77, 33.67, 30.0), [2] = vector4(1809.90, 3673.50, 33.67, 30.0), [3] = vector4(1809.42, 3673.23, 33.67, 30.0)} },
                lay = { type = 'layside', seats = {[1] = vector4(1809.90, 3673.50, 33.67, 30.0)} },
                poly = { center = vector3(1809.90, 3673.50, 33.67), length = 0.85, width = 2.2, height = 0.8 } 
            },
            ['sandy_so_cell_1_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1807.95, 3674.72, 33.68, 300.0)} },
                poly = { length = 0.8, width = 0.8, height = 1.0 } 
            },

            -- Cell #2
            ['sandy_so_cell_2_bed'] = {
                sit = { type = 'chair2', seats = {[1] = vector4(1808.80, 3676.50, 33.67, 30.0), [2] = vector4(1808.33, 3676.23, 33.67, 30.0), [3] = vector4(1807.85, 3675.95, 33.67, 30.0)} },
                lay = { type = 'layside', seats = {[1] = vector4(1808.33, 3676.23, 33.67, 30.0)} },
                poly = { center = vector3(1808.33, 3676.23, 33.67), length = 0.85, width = 2.2, height = 0.8 } 
            },
            ['sandy_so_cell_2_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1806.45, 3677.32, 33.68, 300.0)} },
                poly = { length = 0.8, width = 0.8, height = 1.0 } 
            },

            -- Cell #3
            ['sandy_so_cell_3_bed'] = {
                sit = { type = 'chair2', seats = {[1] = vector4(1807.306274, 3679.103027, 33.67, 30.0), [2] = vector4(1806.829956, 3678.828125, 33.67, 30.0), [3] = vector4(1806.353638, 3678.55322, 33.67, 30.0)} },
                lay = { type = 'layside', seats = {[1] = vector4(1806.829956, 3678.828125, 33.67, 30.0)} },
                poly = { center = vector3(1806.829956, 3678.828125, 33.67), length = 0.85, width = 2.2, height = 0.8 } 
            },
            ['sandy_so_cell_3_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1804.87, 3680.06, 33.68, 300.0)} },
                poly = { length = 0.8, width = 0.8, height = 1.0 } 
            },
        }   
    },
    
    -- Pop's Diner
    ['gabz_diner'] = {
        enabled = true,
        center = vector3(1587.75, 6454.4, 26.0),
        radius = 20.0,
        polys = {
            ['diner_stool_1'] = { 
                sit = { type = 'barstool', seats = {[1] = vector4(1583.53, 6459.70, 25.91, 282.0)} }, 
                poly = { center = vector3(1583.53, 6459.70, 25.91), length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['diner_stool_2'] = { 
                sit = { type = 'barstool', seats = {[1] = vector4(1583.85, 6458.80, 25.91, 291.0)} }, 
                poly = { center = vector3(1583.85, 6458.80, 25.91), length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['diner_stool_3'] = { 
                sit = { type = 'barstool', seats = {[1] = vector4(1584.18, 6457.94, 25.91, 308.0)} }, 
                poly = { center = vector3(1584.18, 6457.94, 25.91), length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['diner_stool_4'] = { 
                sit = { type = 'barstool', seats = {[1] = vector4(1584.95, 6457.20, 25.91, 323.0)} }, 
                poly = { center = vector3(1584.95, 6457.20, 25.91), length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['diner_stool_5'] = { 
                sit = { type = 'barstool', seats = {[1] = vector4(1585.86, 6456.78, 25.91, 335.0)} }, 
                poly = { center = vector3(1585.86, 6456.78, 25.91), length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['diner_stool_6'] = { 
                sit = { type = 'barstool', seats = {[1] = vector4(1586.75, 6456.36, 25.91, 335.0)} }, 
                poly = { center = vector3(1586.75, 6456.36, 25.91), length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['diner_stool_7'] = { 
                sit = { type = 'barstool', seats = {[1] = vector4(1590.06, 6454.80, 25.91, 335.0)} }, 
                poly = { center = vector3(1590.06, 6454.80, 25.91), length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['diner_stool_8'] = { 
                sit = { type = 'barstool', seats = {[1] = vector4(1590.99, 6454.37, 25.91, 335.0)} }, 
                poly = { center = vector3(1590.99, 6454.37, 25.91), length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['diner_stool_9'] = { 
                sit = { type = 'barstool', seats = {[1] = vector4(1592.80, 6453.52, 25.91, 335.0)} }, 
                poly = { center = vector3(1592.80, 6453.52, 25.91), length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['diner_stool_10'] = { 
                sit = { type = 'barstool', seats = {[1] = vector4(1593.85, 6453.02, 25.91, 335.0)} }, 
                poly = { center = vector3(1593.85, 6453.02, 25.91), length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['diner_stool_11'] = { 
                sit = { type = 'barstool', seats = {[1] = vector4(1594.90, 6452.53, 25.91, 335.0)} }, 
                poly = { center = vector3(1594.90, 6452.53, 25.91), length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['diner_booth_1'] = { 
                sit = { type = 'diner_booth', seats = {[1] = vector4(1593.58, 6450.73, 25.5, 65.0), [2] = vector4(1593.25, 6450.01, 25.5, 65.0) } }, 
                poly = { center = vector3(1593.34, 6450.37, 25.8), length = 0.65, width = 1.7, height = 0.85 } 
            },
            ['diner_booth_2'] = { 
                sit = { type = 'diner_booth', seats = {[1] = vector4(1592.26, 6451.37, 25.5, 245.0), [2] = vector4(1591.92, 6450.64, 25.5, 245.0) } }, 
                poly = { center = vector3(1592.14, 6450.93, 25.8), length = 0.65, width = 1.7, height = 0.85 } 
            },
            ['diner_booth_3'] = { 
                sit = { type = 'diner_booth', seats = {[1] = vector4(1591.76, 6451.60, 25.5, 65.0), [2] = vector4(1591.43, 6450.88, 25.5, 65.0) } }, 
                poly = { center = vector3(1591.51, 6451.23, 25.8), length = 0.65, width = 1.7, height = 0.85 } 
            },
            ['diner_booth_4'] = { 
                sit = { type = 'diner_booth', seats = {[1] = vector4(1590.44, 6452.23, 25.5, 245.0), [2] = vector4(1590.10, 6451.50, 25.5, 245.0) } }, 
                poly = { center = vector3(1590.318237, 6451.785645, 25.8), length = 0.65, width = 1.7, height = 0.85 } 
            },
            ['diner_booth_5'] = { 
                sit = { type = 'diner_booth', seats = {[1] = vector4(1589.94, 6452.46, 25.5, 65.0), [2] = vector4(1589.60, 6451.73, 25.5, 65.0) } }, 
                poly = { center = vector3(1589.711060, 6452.068848, 25.8), length = 0.65, width = 1.7, height = 0.85 } 
            },
            ['diner_booth_6'] = { 
                sit = { type = 'diner_booth', seats = {[1] = vector4(1588.63, 6453.07, 25.5, 245.0), [2] = vector4(1588.29, 6452.34, 25.5, 245.0) } }, 
                poly = { center = vector3(1588.51, 6452.63, 25.8), length = 0.65, width = 1.7, height = 0.85 } 
            },
            ['diner_booth_7'] = { 
                sit = { type = 'diner_booth', seats = {[1] = vector4(1588.13, 6453.30, 25.5, 65.0), [2] = vector4(1587.80, 6452.58, 25.5, 65.0) } }, 
                poly = { center = vector3(1587.89, 6452.92, 25.8), length = 0.65, width = 1.7, height = 0.85 } 
            },
            ['diner_booth_8'] = { 
                sit = { type = 'diner_booth', seats = {[1] = vector4(1586.83, 6453.91, 25.5, 245.0), [2] = vector4(1586.50, 6453.18, 25.5, 245.0) } }, 
                poly = { center = vector3(1586.72, 6453.47, 25.8), length = 0.65, width = 1.7, height = 0.85 } 
            },
            ['diner_booth_9'] = { 
                sit = { type = 'diner_booth', seats = {[1] = vector4(1586.34, 6454.14, 25.5, 65.0), [2] = vector4(1586.01, 6453.42, 25.5, 65.0) } }, 
                poly = { center = vector3(1586.09, 6453.77, 25.8), length = 0.65, width = 1.7, height = 0.85 } 
            },
            ['diner_booth_10'] = { 
                sit = { type = 'diner_booth', seats = {[1] = vector4(1585.02, 6454.76, 25.5, 245.0), [2] = vector4(1584.68, 6454.04, 25.5, 245.0) } }, 
                poly = { center = vector3(1584.90, 6454.33, 25.8), length = 0.65, width = 1.7, height = 0.85 } 
            },
            ['diner_booth_11'] = { 
                sit = { type = 'diner_booth', seats = {[1] = vector4(1584.523, 6455.00, 25.5, 65.0), [2] = vector4(1584.19, 6454.27, 25.5, 65.0) } }, 
                poly = { center = vector3(1584.27, 6454.63, 25.8), length = 0.65, width = 1.7, height = 0.85 } 
            },
            ['diner_booth_12'] = { 
                sit = { type = 'diner_booth', seats = {[1] = vector4(1583.20, 6455.62, 25.5, 245.0), [2] = vector4(1582.86, 6454.90, 25.5, 245.0) } }, 
                poly = { center = vector3(1583.07, 6455.19, 25.8), length = 0.65, width = 1.7, height = 0.85 } 
            },
            ['diner_booth_13'] = { 
                sit = { type = 'diner_booth', seats = {[1] = vector4(1582.70, 6455.85, 25.5, 65.0), [2] = vector4(1582.36, 6455.13, 25.5, 65.0) } }, 
                poly = { center = vector3(1582.44, 6455.48, 25.8), length = 0.65, width = 1.7, height = 0.85 } 
            },
            ['diner_booth_14'] = { 
                sit = { type = 'diner_booth', seats = {[1] = vector4(1581.37, 6456.47, 25.5, 245.0), [2] = vector4(1581.03, 6455.75, 25.5, 245.0) } }, 
                poly = { center = vector3(1581.25, 6456.05, 25.8), length = 0.65, width = 1.7, height = 0.85 } 
            }
        }
    },

    -- Pacific Standard (Old)
    ['gabz_pacific_standard_old'] = {
        enabled = true,
        center = vector3(249.09, 214.08, 107.02),
        radius = 30.0,
        polys = {
            -- Public Area
            ['ps_pa_chair_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(238.62, 220.15, 105.75, 295.0)} }, 
                poly = { center = vector3(238.56, 220.11, 105.62), length = 1.15, width = 1.15, height = 1.0 } 
            },
            ['ps_pa_chair_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(239.34, 218.69, 105.75, 295.0)} }, 
                poly = { center = vector3(239.26, 218.65, 105.62), length = 1.15, width = 1.15, height = 1.0 } 
            },
            ['ps_pa_chair_3'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(239.94, 217.31, 105.75, 295.0)} }, 
                poly = { center = vector3(239.86, 217.27, 105.62), length = 1.15, width = 1.15, height = 1.0 } 
            },
            ['ps_pa_chair_4'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(248.24, 212.25, 105.75, 160.0)} }, 
                poly = { center = vector3(248.24, 212.25, 105.75), length = 1.0, width = 1.1, height = 1.0 } 
            },
            ['ps_pa_chair_5'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(249.42, 211.78, 105.75, 160.0)} }, 
                poly = { center = vector3(249.43, 211.78, 105.75), length = 1.0, width = 1.1, height = 1.0 } 
            },
            ['ps_pa_chair_6'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(253.89, 210.25, 105.75, 160.0)} }, 
                poly = { length = 1.1, width = 1.12, height = 1.0 } 
            },
            ['ps_pa_chair_7'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(255.12, 209.77, 105.75, 160.0)} }, 
                poly = { length = 1.1, width = 1.12, height = 1.0 } 
            },
            ['ps_pa_chair_8'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(257.80, 211.78, 105.75, 71.0)} }, 
                poly = { center = vector3(257.82, 211.74, 105.62), length = 1.15, width = 1.15, height = 1.0 } 
            },
            ['ps_pa_chair_9'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(257.34, 210.54, 105.75, 71.0)} }, 
                poly = { center = vector3(257.38, 210.54, 105.62), length = 1.15, width = 1.15, height = 1.0 } 
            },

            -- Office
            ['ps_of_chair_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(263.98, 213.85, 109.75, 160.0)} }, 
                poly = { length = 1.15, width = 1.15, height = 1.0 } 
            },
            ['ps_of_chair_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(262.21, 207.25, 109.75, 160.0)} }, 
                poly = { length = 1.15, width = 1.15, height = 1.0 } 
            },
            ['ps_of_chair_3'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(260.91, 207.68, 109.75, 160.0)} }, 
                poly = { length = 1.15, width = 1.15, height = 1.0 } 
            },

            -- Consultations
            ['ps_ct_chair_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(250.90, 207.81, 109.75, 250.0)} }, 
                poly = { center = vector3(250.79, 207.83, 109.62), length = 1.15, width = 1.15, height = 1.0 } 
            },
            ['ps_ct_chair_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(245.16, 209.84, 109.75, 249.0)} }, 
                poly = { center = vector3(245.16, 209.84, 109.62), length = 1.15, width = 1.15, height = 1.0 } 
            },
            ['ps_ct_chair_3'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(239.53, 211.89, 109.75, 249.0)} }, 
                poly = { center = vector3(239.53, 211.89, 109.62), length = 1.15, width = 1.15, height = 1.0 } 
            },
            ['ps_ct_chair_4'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(234.20, 213.91, 109.75, 249.0)} }, 
                poly = { center = vector3(234.15, 213.91, 109.62), length = 1.15, width = 1.15, height = 1.0 } 
            },
            ['ps_ct_chair_5'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(234.00, 222.82, 109.75, 159.0)} }, 
                poly = { center = vector3(234.06, 222.88, 109.62), length = 1.15, width = 1.15, height = 1.0 } 
            },
            ['ps_ct_chair_6'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(234.67, 224.66, 109.75, 340.0)} }, 
                poly = { center = vector3(234.65, 224.58, 109.62), length = 1.15, width = 1.15, height = 1.0 } 
            },

            -- Downstairs/Vault
            ['ps_ds_chair_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(265.61, 222.07, 101.15, 160.0)} }, 
                poly = { length = 1.15, width = 1.15, height = 1.0 } 
            },
            ['ps_ds_chair_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(251.11, 217.38, 101.15, 160.0)} }, 
                poly = { length = 1.15, width = 1.15, height = 1.0 } 
            },
        }
    },

    -- Park Rangers Station
    ['gabz_park_ranger'] = {
		enabled = true,
		center = vector3(381.01, 796.40, 187.87),
		radius = 20.0,
		polys = {
            -- Reception
            ['park_ranger_bench'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(384.73, 800.22, 187.03, 180.0)} }, 
                poly = { center = vector3(384.73, 800.22, 187.0), length = 0.65, width = 1.15, height = 1.25 } 
            },

            -- Cell #1
            ['park_ranger_cell_bench_1'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(380.34, 794.55, 187.05, 270.0), [2] = vector4(380.34, 795.15, 187.05, 270.0), [3] = vector4(380.34, 795.75, 187.05, 270.0)} }, 
                lay = { type = 'layside', seats = {[1] = vector4(380.34, 795.15, 187.05, 270.0)} },
                poly = { center = vector3(380.34, 795.15, 187.0), length = 0.6, width = 2.0, height = 1.25 } 
            },
            ['park_ranger_cell_toilet_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(380.62, 793.52, 186.92, 270.0)} }, 
                poly = { center = vector3(380.62, 793.52, 187.03), length = 0.85, width = 0.85, height = 1.25 } 
            },

            -- Cell #2
            ['park_ranger_cell_bench_2'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(377.14, 794.55, 187.05, 270.0), [2] = vector4(377.14, 795.15, 187.05, 270.0), [3] = vector4(377.14, 795.75, 187.05, 270.0)} }, 
                lay = { type = 'layside', seats = {[1] = vector4(377.14, 795.15, 187.05, 270.0)} },
                poly = { center = vector3(377.14, 795.15, 187.0), length = 0.6, width = 2.0, height = 1.25 } 
            },
            ['park_ranger_cell_toilet_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(377.42, 793.52, 186.92, 270.0)} }, 
                poly = { center = vector3(377.42, 793.52, 187.03), length = 0.85, width = 0.85, height = 1.25 } 
            },
            -- The cell beds just didn't work properly, so... Good luck if you want to add those!

            -- Upstairs
            ['park_ranger_chair_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(382.83, 797.80, 189.95, 350.0)} }, 
                poly = { center = vector3(382.83, 797.80, 190.0), length = 0.65, width = 0.65, height = 1.0 } 
            },
            ['park_ranger_chair_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(383.97, 799.41, 189.95, 150.0)} }, 
                poly = { center = vector3(383.97, 799.41, 190.0), length = 0.65, width = 0.65, height = 1.0 } 
            }
        }
    },

    -- Studio
    ['gabz_records'] = {
		enabled = true,
		center = vector3(501.10, -79.73, 57.66),
		radius = 25.0,
		polys = {
            ['records_stool_1'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(494.53, -71.80, 57.66, 305.0)} },
                poly = { length = 0.65, width = 0.65, height = 0.6 } 
            },
            ['records_stool_2'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(486.33, -82.60, 57.66, 270.0)} },
                poly = { length = 0.65, width = 0.65, height = 0.6 } 
            },
            ['records_couch_1'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(502.12, -68.80, 57.65, 121.0)} },
                poly = { length = 1.0, width = 1.15, height = 1.0 } 
            },
            ['records_couch_2'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(512.52, -77.07, 57.66, 136.0), [2] = vector4(513.24, -77.77, 57.66, 136.0)} },
                lay = { type = 'layside', seats = {[1] = vector4(512.88, -77.42, 57.66, 136.0)} },
                poly = { center = vector3(512.88, -77.42, 57.66), length = 0.75, width = 2.1, height = 0.8 } 
            },
            ['records_couch_3'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(514.88, -85.86, 57.66, 37.0)} },
                poly = { length = 1.0, width = 1.15, height = 1.0 } 
            },
            ['records_couch_4'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(502.94, -86.01, 57.66, 326.0)} },
                poly = { length = 1.0, width = 1.15, height = 1.0 } 
            },
            ['records_couch_5'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(493.73, -85.23, 57.66, 305.0), [2] = vector4(494.31, -86.05, 57.66, 305.0)} },
                lay = { type = 'layside', seats = {[1] = vector4(494.02, -85.64, 57.66, 305.0)} },
                poly = { center = vector3(494.02, -85.64, 57.66), length = 0.85, width = 2.05, height = 0.8 } 
            }
        }
    },

    -- Tuners
    ['gabz_tuners'] = {
		enabled = true,
		center = vector3(139.28, -3012.22, 8.06),
		radius = 25.0,
		polys = {
            -- Downstairs
            ['tuners_bench'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(154.35, -3013.50, 6.59, 90.0), [2] = vector4(154.35, -3014.60, 6.59, 90.0)} },
                lay = { type = 'layside', seats = {[1] = vector4(154.35, -3014.05, 6.59, 90.0)} },
                poly = { center = vector3(154.35, -3014.05, 6.59), length = 0.75, width = 2.25, height = 1.15 } 
            },
            ['tuners_chair_1'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(139.47, -3007.40, 6.56, 180.0)} },
                poly = { length = 1.0, width = 1.35, height = 1.15 } 
            },
            ['tuners_chair_2'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(137.52, -3007.42, 6.56, 185.0)} },
                poly = { length = 1.0, width = 1.35, height = 1.15 } 
            },
            ['tuners_couch_1'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(132.60, -3007.31, 6.56, 180.0), [2] = vector4(133.60, -3007.31, 6.56, 180.0)} },
                lay = { type = 'layside', seats = {[1] = vector4(133.10, -3007.31, 6.56, 180.0)} },
                poly = { center = vector3(133.10, -3007.31, 6.56), length = 1.0, width = 2.45, height = 1.15 } 
            },
            ['tuners_chair_3'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(135.30, -3014.15, 6.56, 122.0)} },
                poly = { length = 1.0, width = 1.35, height = 1.15 } 
            },
            ['tuners_couch_2'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(130.94, -3016.30, 6.56, 270.0), [2] = vector4(130.94, -3015.35, 6.56, 270.0), [3] = vector4(130.94, -3014.35, 6.56, 270.0)} },
                lay = { type = 'layside', seats = {[1] = vector4(130.94, -3014.8, 6.56, 270.0)} },
                poly = { center = vector3(130.94, -3015.20, 6.56), length = 1.0, width = 3.35, height = 1.15 } 
            },
            ['tuners_couch_3'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(128.82, -3016.40, 6.56, 180.0), [2] = vector4(129.80, -3016.40, 6.56, 180.0)} },
                lay = { type = 'layside', seats = {[1] = vector4(129.35, -3016.40, 6.56, 180.0)} },
                poly = { center = vector3(129.25, -3016.40, 6.56), length = 1.0, width = 2.375, height = 1.15 } 
            },

            -- Upstairs
            ['tuners_couch_4'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(132.41, -3013.67, 10.16, 270.0), [2] = vector4(132.41, -3012.67, 10.16, 270.0)} },
                lay = { type = 'layside', seats = {[1] = vector4(132.41, -3013.15, 10.16, 270.0)} },
                poly = { center = vector3(132.41, -3013.15, 10.16), length = 1.0, width = 2.5, height = 1.25 } 
            },
            ['tuners_couch_5'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(136.41, -3013.89, 10.16, 90.0), [2] = vector4(136.41, -3012.89, 10.16, 90.0)} },
                lay = { type = 'layside', seats = {[1] = vector4(136.41, -3013.37, 10.16, 90.0)} },
                poly = { center = vector3(136.41, -3013.37, 10.16), length = 1.0, width = 2.5, height = 1.25 } 
            },
            ['tuners_chair_4'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(145.09, -3013.29, 10.16, 280.0)} },
                poly = { length = 1.0, width = 1.35, height = 1.15 } 
            },
            ['tuners_couch_6'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(147.05, -3011.88, 10.16, 180.0), [2] = vector4(148.05, -3011.88, 10.16, 180.0)} },
                lay = { type = 'layside', seats = {[1] = vector4(147.55, -3011.88, 10.16, 180.0)} },
                poly = { center = vector3(147.55, -3011.88, 10.16), length = 1.0, width = 2.5, height = 1.25 } 
            },
            ['tuners_chair_5'] = { 
                sit = { type = 'chair3', seats = {[1] = vector4(150.00, -3013.04, 10.16, 87.0)} },
                poly = { length = 1.0, width = 1.35, height = 1.15 } 
            }
        }
    },

    -- Paleto Bay Sheriff's Office
    ['gabz_paleto_so'] = {
		enabled = true,
		center = vector3(-445.73, 6015.64, 27.0),
		radius = 20.0,
		polys = {
            -- Cell #1
            ['paleto_so_cell_bench_1'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-446.77, 6011.14, 27.20, 315.0), [2] = vector4(-446.35, 6010.71, 27.20, 315.0), [3] = vector4(-445.93, 6010.29, 27.20, 315.0)} }, 
                lay = { type = 'layside', seats = {[1] = vector4(-446.35, 6010.71, 27.20, 315.0)} },
                poly = { center = vector3(-446.39, 6010.68, 27.20), length = 0.80, width = 2.15, height = 1.0 } 
            },
            ['paleto_so_cell_toilet_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(-447.54, 6011.77, 27.12, 315.0)} }, 
                poly = { center = vector3(-447.54, 6011.77, 27.12), length = 0.65, width = 0.50, height = 0.8 } 
            },

            -- Cell #2
            ['paleto_so_cell_bench_2'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-449.92, 6013.72, 27.20, 315.0), [2] = vector4(-449.53, 6013.26, 27.20, 315.0), [3] = vector4(-449.07, 6012.87, 27.20, 315.0)} }, 
                lay = { type = 'layside', seats = {[1] = vector4(-449.53, 6013.26, 27.20, 315.0)} },
                poly = { center = vector3(-449.53, 6013.26, 27.20), length = 0.80, width = 2.15, height = 1.0 } 
            },
            ['paleto_so_cell_toilet_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(-450.73, 6014.43, 27.12, 315.0)} }, 
                poly = { center = vector3(-450.73, 6014.43, 27.12), length = 0.65, width = 0.50, height = 0.8 } 
            },

            -- Cell #3
            ['paleto_so_cell_bench_3'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-444.26, 6019.44, 27.20, 135.0), [2] = vector4(-443.87, 6018.98, 27.20, 135.0), [3] = vector4(-443.41, 6018.60, 27.20, 135.0)} }, 
                lay = { type = 'layside', seats = {[1] = vector4(-443.75, 6019.11, 27.20, 135.0)} },
                poly = { center = vector3(-443.874420, 6018.98, 27.20), length = 0.80, width = 2.15, height = 1.0 } 
            },
            ['paleto_so_cell_toilet_3'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(-444.90, 6020.16, 27.12, 135.0)} }, 
                poly = { center = vector3(-444.90, 6020.16, 27.12), length = 0.65, width = 0.50, height = 0.8 } 
            },

            -- Cell #4
            ['paleto_so_cell_bench_4'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-441.36, 6016.54, 27.20, 135.0), [2] = vector4(-440.94, 6016.12, 27.20, 135.0), [3] = vector4(-440.52, 6015.70, 27.20, 135.0)} }, 
                lay = { type = 'layside', seats = {[1] = vector4(-440.91, 6016.15, 27.20, 135.0)} },
                poly = { center = vector3(-440.91, 6016.15, 27.20), length = 0.80, width = 2.15, height = 1.0 } 
            },
            ['paleto_so_cell_toilet_4'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(-441.97, 6017.21, 27.12, 135.0)} }, 
                poly = { center = vector3(-441.97, 6017.21, 27.12), length = 0.65, width = 0.50, height = 0.8 } 
            }
        }
    },

    -- La Mesa Police Department
    ['gabz_lamesa_pd'] = {
        enabled = true,
		center = vector3(838.76, -1297.14, 27.75),
		radius = 35.0,
        polys = {
            -- Seats
            ['lamesa_pd_seats_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(831.30, -1285.90, 27.75, 180.0), [2] = vector4(831.92, -1285.90, 27.75, 180.0), [3] = vector4(832.55, -1285.90, 27.75, 180.0), [4] = vector4(833.17, -1285.90, 27.75, 180.0), [5] = vector4(833.80, -1285.90, 27.75, 180.0)} }, 
                poly = { center = vector3(832.55, -1285.90, 27.75), length = 0.80, width = 3.35, height = 1.25 } 
            },
            ['lamesa_pd_seats_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(834.70, -1286.79, 27.75, 90.0), [2] = vector4(834.70, -1287.42, 27.75, 90.0), [3] = vector4(834.70, -1288.04, 27.75, 90.0), [4] = vector4(834.70, -1288.67, 27.75, 90.0), [5] = vector4(834.70, -1289.29, 27.75, 90.0)} }, 
                poly = { center = vector3(834.66, -1288.04, 27.75), length = 0.80, width = 3.35, height = 1.25 } 
            },
            ['lamesa_pd_seats_4'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(831.00, -1291.68, 27.75, 90.0), [2] = vector4(831.00, -1292.31, 27.75, 90.0), [3] = vector4(831.00, -1292.93, 27.75, 90.0), [4] = vector4(831.00, -1293.56, 27.75, 90.0), [5] = vector4(831.00, -1294.18, 27.75, 90.0)} }, 
                poly = { center = vector3(831.00, -1292.93, 27.75), length = 0.70, width = 3.35, height = 1.25 } 
            },
            ['lamesa_pd_seats_5'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(831.65, -1294.18, 27.75, 270.0), [2] = vector4(831.65, -1293.56, 27.75, 270.0), [3] = vector4(831.65, -1292.93, 27.75, 270.0), [4] = vector4(831.65, -1292.31, 27.75, 270.0), [5] = vector4(831.65, -1291.68, 27.75, 270.0)} }, 
                poly = { center = vector3(831.65, -1292.93, 27.75), length = 0.70, width = 3.35, height = 1.25 } 
            },
            ['lamesa_pd_seats_6'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(845.45, -1282.18, 27.75, 270.0), [2] = vector4(845.45, -1281.56, 27.75, 270.0), [3] = vector4(845.45, -1280.93, 27.75, 270.0), [4] = vector4(845.45, -1280.31, 27.75, 270.0), [5] = vector4(845.45, -1279.68, 27.75, 270.0)} }, 
                poly = { center = vector3(845.50, -1280.93, 27.75), length = 0.80, width = 3.35, height = 1.25 } 
            },
            ['lamesa_pd_seats_7'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(853.44, -1306.45, 27.75, 180.0), [2] = vector4(854.07, -1306.45, 27.75, 180.0), [3] = vector4(854.69, -1306.45, 27.75, 180.0), [4] = vector4(855.32, -1306.45, 27.75, 180.0), [5] = vector4(855.94, -1306.45, 27.75, 180.0)} }, 
                poly = { center = vector3(854.69, -1306.45, 27.75), length = 0.80, width = 3.35, height = 1.25 } 
            },
            ['lamesa_pd_seats_8'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(856.20, -1318.62, 27.75, 270.0), [2] = vector4(856.20, -1317.99, 27.75, 270.0), [3] = vector4(856.20, -1317.37, 27.75, 270.0), [4] = vector4(856.20, -1316.74, 27.75, 270.0), [5] = vector4(856.20, -1316.12, 27.75, 270.0)} }, 
                poly = { center = vector3(856.32, -1317.37, 27.75), length = 0.80, width = 3.35, height = 1.25 } 
            },

            -- Chairs
            ['lamesa_pd_chair_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(840.65, -1304.11, 27.75, 95.0)} },
                poly = { length = 0.75, width = 0.75, height = 0.75 } 
            },
            ['lamesa_pd_chair_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(839.85, -1298.97, 27.75, 175.0)} },
                poly = { length = 0.75, width = 0.75, height = 0.75 } 
            },
            ['lamesa_pd_chair_3'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(843.24, -1298.35, 27.75, 90.0)} },
                poly = { length = 0.75, width = 0.75, height = 0.75 } 
            },
            ['lamesa_pd_chair_4'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(843.86, -1298.35, 27.75, 265.0)} },
                poly = { length = 0.75, width = 0.75, height = 0.75 } 
            },
            ['lamesa_pd_chair_5'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(847.41, -1298.56, 27.75, 270.0)} },
                poly = { length = 0.75, width = 0.75, height = 0.75 } 
            },
            ['lamesa_pd_chair_6'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(849.02, -1292.68, 27.75, 180.0)} },
                poly = { length = 0.75, width = 0.75, height = 0.75 } 
            },
            ['lamesa_pd_chair_7'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(849.02, -1291.95, 27.75, 0.0)} },
                poly = { length = 0.75, width = 0.75, height = 0.75 } 
            },
            ['lamesa_pd_chair_8'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(844.21, -1295.43, 27.75, 270.0)} },
                poly = { length = 0.75, width = 0.75, height = 0.75 } 
            },
            ['lamesa_pd_chair_9'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(843.21, -1295.38, 27.75, 85.0)} },
                poly = { length = 0.75, width = 0.75, height = 0.75 } 
            },

            -- Cell Benches
            ['lamesa_pd_cell_1'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(832.35, -1300.35, 27.75, 0.0), [2] = vector4(831.75, -1300.35, 27.75, 0.0), [3] = vector4(831.15, -1300.35, 27.75, 0.0)} }, 
                poly = { center = vector3(831.75, -1300.35, 27.75), length = 0.5, width = 2.15, height = 0.5 } 
            },
            ['lamesa_pd_cell_2'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(831.10, -1298.45, 27.75, 180.0), [2] = vector4(831.70, -1298.45, 27.75, 180.0), [3] = vector4(832.30, -1298.45, 27.75, 180.0)} }, 
                poly = { center = vector3(831.74, -1298.55, 27.75), length = 0.5, width = 2.15, height = 0.5 } 
            },
            ['lamesa_pd_cell_3'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(833.49, -1302.47, 27.75, 0.0), [2] = vector4(832.89, -1302.47, 27.75, 0.0), [3] = vector4(832.29, -1302.47, 27.75, 0.0)} }, 
                poly = { center = vector3(832.89, -1302.47, 27.75), length = 0.5, width = 2.15, height = 0.5 } 
            },
            ['lamesa_pd_cell_4'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(831.24, -1302.47, 27.75, 0.0), [2] = vector4(830.64, -1302.47, 27.75, 0.0), [3] = vector4(830.04, -1302.47, 27.75, 0.0)} }, 
                poly = { center = vector3(830.64, -1302.47, 27.75), length = 0.5, width = 2.15, height = 0.5 } 
            },
            ['lamesa_pd_cell_5'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(829.0, -1301.69, 27.75, 270.0), [2] = vector4(829.0, -1301.09, 27.75, 270.0), [3] = vector4(829.0, -1300.49, 27.75, 270.0)} }, 
                poly = { center = vector3(829.0, -1301.09, 27.75), length = 0.5, width = 2.15, height = 0.5 } 
            },
            ['lamesa_pd_cell_6'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(829.0, -1299.34, 27.75, 270.0), [2] = vector4(829.0, -1298.74, 27.75, 270.0), [3] = vector4(829.0, -1298.14, 27.75, 270.0)} }, 
                poly = { center = vector3(829.0, -1298.74, 27.75), length = 0.5, width = 2.15, height = 0.5 } 
            },
            ['lamesa_pd_cell_7'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(829.0, -1296.99, 27.75, 270.0), [2] = vector4(829.0, -1296.39, 27.75, 270.0), [3] = vector4(829.0, -1295.79, 27.75, 270.0)} }, 
                poly = { center = vector3(829.0, -1296.39, 27.75), length = 0.5, width = 2.15, height = 0.5 } 
            },
            ['lamesa_pd_cell_8'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(830.04, -1295.07, 27.75, 180.0), [2] = vector4(830.64, -1295.07, 27.75, 180.0), [3] = vector4(831.24, -1295.07, 27.75, 180.0)} }, 
                poly = { center = vector3(830.64, -1295.07, 27.75), length = 0.5, width = 2.15, height = 0.5 } 
            },
            ['lamesa_pd_cell_9'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(832.29, -1295.12, 27.75, 180.0), [2] = vector4(832.89, -1295.07, 27.75, 180.0), [3] = vector4(833.49, -1295.07, 27.75, 180.0)} }, 
                poly = { center = vector3(832.89, -1295.07, 27.75), length = 0.5, width = 2.15, height = 0.5 } 
            }
        }
    },

    -- Hayes Auto
    ['gabz_hayes'] = {
		enabled = true,
		center = vector3(-1423.64, -453.12, 35.58),
		radius = 25.0,
		polys = {
            ['hayes_stool_1'] = { 
                sit = { type = 'barstool', seats = {[1] = vector4(-1407.48, -446.79, 35.70, 210.0)} }, 
                poly = { center = vector3(-1407.48, -446.79, 35.70), length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['hayes_stool_2'] = { 
                sit = { type = 'barstool', seats = {[1] = vector4(-1422.06, -455.90, 35.70, 210.0)} }, 
                poly = { center = vector3(-1422.06, -455.83, 35.70), length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['hayes_stool_3'] = { 
                sit = { type = 'stool', seats = {[1] = vector4(-1431.13, -453.90, 35.70, 210.0)} }, 
                poly = { center = vector3(-1431.13, -453.90, 35.70), length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['hayes_bench'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-1424.03, -457.63, 35.42, 122.0), [2] = vector4(-1424.67, -456.61, 35.42, 122.0)} }, 
                poly = { center = vector3(-1424.35, -457.12, 35.42), length = 0.55, width = 2.3, height = 0.5 } 
            },
            ['hayes_couch'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-1432.88, -452.47, 35.42, 302.0), [2] = vector4(-1433.52, -451.45, 35.42, 302.0)} }, 
                lay = { type = 'layside', seats = {[1] = vector4(-1433.20, -451.96, 35.42, 302.0)} },
                poly = { center = vector3(-1433.20, -451.96, 35.42), length = 1.0, width = 3.05, height = 1.0 } 
            }
        }
    },

    -- Import Garage
    ['gabz_import'] = {
		enabled = true,
		center = vector3(957.48, -970.32, 35.58),
		radius = 200.0,
		polys = {
            ['import_couch'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(957.43, -969.66, 39.10, 94.0), [2] = vector4(957.48, -970.36, 39.10, 94.0), [3] = vector4(957.53, -971.06, 39.10, 94.0)} }, 
                lay = { type = 'layside', seats = {[1] = vector4(957.48, -970.36, 39.10, 94.0)} },
                poly = { center = vector3(957.48, -970.36, 39.10), length = 1.0, width = 2.50, height = 1.0 } 
            },
            ['import_toilet'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(951.15, -971.80, 39.06, 274.0)} }, 
                poly = { center = vector3(951.15, -971.80, 39.06), length = 0.6, width = 0.6, height = 1.0 } 
            },
            ['import_bench_1'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(938.88, -952.71, 39.02, 140.0), [2] = vector4(939.37, -953.13, 39.02, 140.0), [3] = vector4(939.91, -953.58, 39.02, 140.0), [4] = vector4(940.41, -953.99, 39.02, 140.0)} }, 
                lay = { type = 'layside', seats = {[1] = vector4(939.61, -953.39, 39.06, 140.0)} },
                poly = { center = vector3(939.61, -953.39, 38.85), length = 0.6, width = 2.85, height = 0.5 } 
            },
            ['import_bench_2'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(940.77, -946.85, 39.02, 275.0), [2] = vector4(940.71, -946.21, 39.02, 275.0), [3] = vector4(940.65, -945.51, 39.02, 275.0), [4] = vector4(940.59, -944.86, 39.02, 275.0)} }, 
                lay = { type = 'layside', seats = {[1] = vector4(940.68, -945.86, 39.06, 275.0)} },
                poly = { center = vector3(940.68, -945.86, 38.85), length = 0.6, width = 2.85, height = 0.5 } 
            },
            ['import_bench_3'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(911.58, -980.24, 39.02, 275.0), [2] = vector4(911.52, -979.60, 39.02, 275.0), [3] = vector4(911.46, -978.90, 39.02, 275.0), [4] = vector4(911.40, -978.25, 39.02, 275.0)} }, 
                lay = { type = 'layside', seats = {[1] = vector4(911.59, -979.24, 39.06, 275.0)} },
                poly = { center = vector3(911.59, -979.24, 38.85), length = 0.6, width = 2.85, height = 0.5 } 
            }
        }
    },

    -- Bolingbroke Penitentiary
    ['gabz_prison'] = { 
		enabled = true,
		center = vector3(1783.10, 2530.77, 45.70), 
		radius = 95.0, 
		polys = {
            -- Lobby/Reception
            ['prison_couch_1'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1835.96, 2580.50, 45.50, 270.0), [2] = vector4(1835.96, 2581.20, 45.50, 270.0)} }, 
                poly = { center = vector3(1836.0, 2580.85, 45.43), length = 0.8, width = 1.6, height = 1.0 } 
            },
            ['prison_couch_2'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1835.96, 2582.10, 45.50, 270.0), [2] = vector4(1835.96, 2582.80, 45.50, 270.0)} }, 
                poly = { center = vector3(1836.0, 2582.45, 45.43), length = 0.8, width = 1.6, height = 1.0 } 
            },
            ['prison_couch_3'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1843.85, 2587.79, 45.50, 0.0), [2] = vector4(1843.15, 2587.79, 45.50, 0.0)} }, 
                poly = { center = vector3(1843.5, 2587.83, 45.43), length = 0.8, width = 1.6, height = 1.0 } 
            },
            ['prison_couch_4'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1842.25, 2587.79, 45.50, 0.0), [2] = vector4(1841.55, 2587.79, 45.50, 0.0)} }, 
                poly = { center = vector3(1841.9, 2587.83, 45.43), length = 0.8, width = 1.6, height = 1.0 } 
            },
            ['prison_couch_5'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1843.53, 2591.65, 45.50, 180.0), [2] = vector4(1844.23, 2591.65, 45.50, 180.0)} }, 
                poly = { center = vector3(1843.88, 2591.65, 45.43), length = 0.8, width = 1.6, height = 1.0 } 
            },
            ['prison_couch_6'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1841.89, 2591.65, 45.50, 180.0), [2] = vector4(1842.59, 2591.65, 45.50, 180.0)} }, 
                poly = { center = vector3(1842.22, 2591.65, 45.43), length = 0.8, width = 1.6, height = 1.0 } 
            },

            -- Visitors
            ['prison_stool_1'] = { 
                sit = { type = 'stool', seats = {[1] = vector4(1832.40, 2580.57, 45.65, 90.0)} }, 
                poly = { length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['prison_stool_2'] = { 
                sit = { type = 'stool', seats = {[1] = vector4(1832.40, 2582.36, 45.65, 90.0)} }, 
                poly = { length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['prison_stool_3'] = { 
                sit = { type = 'stool', seats = {[1] = vector4(1832.40, 2584.11, 45.65, 90.0)} }, 
                poly = { length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['prison_stool_4'] = { 
                sit = { type = 'stool', seats = {[1] = vector4(1832.40, 2585.89, 45.65, 90.0)} }, 
                poly = { length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['prison_stool_5'] = { 
                sit = { type = 'stool', seats = {[1] = vector4(1832.40, 2587.59, 45.65, 90.0)} }, 
                poly = { length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['prison_stool_6'] = { 
                sit = { type = 'stool', seats = {[1] = vector4(1832.40, 2589.31, 45.65, 90.0)} }, 
                poly = { length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['prison_stool_7'] = { 
                sit = { type = 'stool', seats = {[1] = vector4(1832.40, 2590.99, 45.65, 90.0)} }, 
                poly = { length = 0.45, width = 0.45, height = 0.45 } 
            },

            -- Visitors (Inmates)
            ['prison_stool_8'] = { 
                sit = { type = 'stool', seats = {[1] = vector4(1830.30, 2591.08, 45.65, 270.0)} }, 
                poly = { length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['prison_stool_9'] = { 
                sit = { type = 'stool', seats = {[1] = vector4(1830.30, 2589.3, 45.65, 270.0)} }, 
                poly = { length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['prison_stool_10'] = { 
                sit = { type = 'stool', seats = {[1] = vector4(1830.30, 2587.55, 45.65, 270.0)} }, 
                poly = { length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['prison_stool_11'] = { 
                sit = { type = 'stool', seats = {[1] = vector4(1830.30, 2585.76, 45.65, 270.0)} }, 
                poly = { length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['prison_stool_12'] = { 
                sit = { type = 'stool', seats = {[1] = vector4(1830.30, 2584.07, 45.65, 270.0)} }, 
                poly = { length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['prison_stool_13'] = { 
                sit = { type = 'stool', seats = {[1] = vector4(1830.30, 2582.35, 45.65, 270.0)} }, 
                poly = { length = 0.45, width = 0.45, height = 0.45 } 
            },
            ['prison_stool_14'] = { 
                sit = { type = 'stool', seats = {[1] = vector4(1830.30, 2580.67, 45.65, 270.0)} }, 
                poly = { length = 0.45, width = 0.45, height = 0.45 } 
            },

            -- Infirmary
            ['prison_operating_table'] = { 
                lay = { type = 'medical', teleportIn = true, seats = {[1] = vector4(1770.24, 2586.37, 45.80, 180.0)} }, 
                poly = { length = 2.30, width = 0.65, height = 0.45 } 
            },
            ['prison_infirmary_couch_1'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1763.42, 2568.0, 45.21, 270.0), [2] = vector4(1763.42, 2568.72, 45.21, 270.0)} }, 
                poly = { center = vector3(1763.42, 2568.35, 45.21), length = 0.75, width = 1.6, height = 1.0 } 
            },
            ['prison_infirmary_couch_2'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1763.42, 2570.40, 45.21, 270.0), [2] = vector4(1763.42, 2571.11, 45.21, 270.0)} }, 
                poly = { center = vector3(1763.42, 2570.75, 45.21), length = 0.75, width = 1.6, height = 1.0 } 
            },
            ['prison_infirmary_couch_3'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1763.42, 2572.82, 45.21, 270.0), [2] = vector4(1763.42, 2573.53, 45.21, 270.0)} }, 
                poly = { center = vector3(1763.42, 2573.17, 45.21), length = 0.75, width = 1.6, height = 1.0 } 
            },

            -- Cafeteria --
            -- Table 1
            ['prison_cafe_tbl_1_seat_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1788.18, 2555.43, 45.19, 180.0)} }, 
                poly = { center = vector3(1788.18, 2555.43, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_1_seat_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1787.48, 2555.43, 45.19, 180.0)} }, 
                poly = { center = vector3(1787.48, 2555.43, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_1_seat_3'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1786.78, 2555.43, 45.19, 180.0)} }, 
                poly = { center = vector3(1786.78, 2555.43, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_1_seat_4'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1786.08, 2555.43, 45.19, 180.0)} }, 
                poly = { center = vector3(1786.08, 2555.43, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_1_seat_5'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1788.18, 2553.51, 45.19, 0.0)} }, 
                poly = { center = vector3(1788.18, 2553.51, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_1_seat_6'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1787.48, 2553.51, 45.19, 0.0)} }, 
                poly = { center = vector3(1787.48, 2553.51, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_1_seat_7'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1786.78, 2553.51, 45.19, 0.0)} }, 
                poly = { center = vector3(1786.78, 2553.51, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_1_seat_8'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1786.08, 2553.51, 45.19, 0.0)} }, 
                poly = { center = vector3(1786.08, 2553.51, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },

            -- Table 2
            ['prison_cafe_tbl_2_seat_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1788.18, 2551.81, 45.19, 180.0)} }, 
                poly = { center = vector3(1788.18, 2551.81, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_2_seat_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1787.48, 2551.81, 45.19, 180.0)} }, 
                poly = { center = vector3(1787.48, 2551.81, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_2_seat_3'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1786.78, 2551.81, 45.19, 180.0)} }, 
                poly = { center = vector3(1786.78, 2551.81, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_2_seat_4'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1786.08, 2551.81, 45.19, 180.0)} }, 
                poly = { center = vector3(1786.08, 2551.81, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_2_seat_5'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1788.18, 2549.91, 45.19, 0.0)} }, 
                poly = { center = vector3(1788.18, 2549.91, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_2_seat_6'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1787.48, 2549.91, 45.19, 0.0)} }, 
                poly = { center = vector3(1787.48, 2549.91, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_2_seat_7'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1786.78, 2549.91, 45.19, 0.0)} }, 
                poly = { center = vector3(1786.78, 2549.91, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_2_seat_8'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1786.08, 2549.91, 45.19, 0.0)} }, 
                poly = { center = vector3(1786.08, 2549.91, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },

            -- Table 3
            ['prison_cafe_tbl_3_seat_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1788.18, 2548.26, 45.19, 180.0)} }, 
                poly = { center = vector3(1788.18, 2548.26, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_3_seat_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1787.48, 2548.26, 45.19, 180.0)} }, 
                poly = { center = vector3(1787.48, 2548.26, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_3_seat_3'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1786.78, 2548.26, 45.19, 180.0)} }, 
                poly = { center = vector3(1786.78, 2548.26, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_3_seat_4'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1786.08, 2548.26, 45.19, 180.0)} }, 
                poly = { center = vector3(1786.08, 2548.26, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_3_seat_5'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1788.18, 2546.35, 45.19, 0.0)} }, 
                poly = { center = vector3(1788.18, 2546.35, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_3_seat_6'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1787.48, 2546.35, 45.19, 0.0)} }, 
                poly = { center = vector3(1787.48, 2546.35, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_3_seat_7'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1786.78, 2546.35, 45.19, 0.0)} }, 
                poly = { center = vector3(1786.78, 2546.35, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_3_seat_8'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1786.08, 2546.35, 45.19, 0.0)} }, 
                poly = { center = vector3(1786.08, 2546.35, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },

            -- Table 4
            ['prison_cafe_tbl_4_seat_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1782.36, 2555.43, 45.19, 180.0)} }, 
                poly = { center = vector3(1782.36, 2555.43, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_4_seat_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1781.66, 2555.43, 45.19, 180.0)} }, 
                poly = { center = vector3(1781.66, 2555.43, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_4_seat_3'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1780.96, 2555.43, 45.19, 180.0)} }, 
                poly = { center = vector3(1780.96, 2555.43, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_4_seat_4'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1780.26, 2555.43, 45.19, 180.0)} }, 
                poly = { center = vector3(1780.26, 2555.43, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_4_seat_5'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1782.36, 2553.51, 45.19, 0.0)} }, 
                poly = { center = vector3(1782.36, 2553.51, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_4_seat_6'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1781.66, 2553.51, 45.19, 0.0)} }, 
                poly = { center = vector3(1781.66, 2553.51, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_4_seat_7'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1780.96, 2553.51, 45.19, 0.0)} }, 
                poly = { center = vector3(1780.96, 2553.51, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_4_seat_8'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1780.26, 2553.51, 45.19, 0.0)} }, 
                poly = { center = vector3(1780.26, 2553.51, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },

            -- Table 5
            ['prison_cafe_tbl_5_seat_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1782.36, 2551.81, 45.19, 180.0)} }, 
                poly = { center = vector3(1782.36, 2551.81, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_5_seat_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1781.66, 2551.81, 45.19, 180.0)} }, 
                poly = { center = vector3(1781.66, 2551.81, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_5_seat_3'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1780.96, 2551.81, 45.19, 180.0)} }, 
                poly = { center = vector3(1780.96, 2551.81, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_5_seat_4'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1780.26, 2551.81, 45.19, 180.0)} }, 
                poly = { center = vector3(1780.26, 2551.81, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_5_seat_5'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1782.36, 2549.91, 45.19, 0.0)} }, 
                poly = { center = vector3(1782.36, 2549.91, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_5_seat_6'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1781.66, 2549.91, 45.19, 0.0)} }, 
                poly = { center = vector3(1781.66, 2549.91, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_5_seat_7'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1780.96, 2549.91, 45.19, 0.0)} }, 
                poly = { center = vector3(1780.96, 2549.91, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_5_seat_8'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1780.26, 2549.91, 45.19, 0.0)} }, 
                poly = { center = vector3(1780.26, 2549.91, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },

            -- Table 6
            ['prison_cafe_tbl_6_seat_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1782.36, 2548.26, 45.19, 180.0)} }, 
                poly = { center = vector3(1782.36, 2548.26, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_6_seat_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1781.66, 2548.26, 45.19, 180.0)} }, 
                poly = { center = vector3(1781.66, 2548.26, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_6_seat_3'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1780.96, 2548.26, 45.19, 180.0)} }, 
                poly = { center = vector3(1780.96, 2548.26, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_6_seat_4'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1780.26, 2548.26, 45.19, 180.0)} }, 
                poly = { center = vector3(1780.26, 2548.26, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_6_seat_5'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1782.36, 2546.35, 45.19, 0.0)} }, 
                poly = { center = vector3(1782.36, 2546.35, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_6_seat_6'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1781.66, 2546.35, 45.19, 0.0)} }, 
                poly = { center = vector3(1781.66, 2546.35, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_6_seat_7'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1780.96, 2546.35, 45.19, 0.0)} }, 
                poly = { center = vector3(1780.96, 2546.35, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cafe_tbl_6_seat_8'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1780.26, 2546.35, 45.19, 0.0)} }, 
                poly = { center = vector3(1780.26, 2546.35, 45.13), length = 0.35, width = 0.35, height = 0.35 } 
            },

            -- Cells --
            -- Table 1
            ['prison_cells_tbl_1_seat_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1768.26, 2490.90, 45.26, 210.0)} }, 
                poly = { center = vector3(1768.34, 2490.77, 45.26), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cells_tbl_1_seat_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1767.79, 2490.22, 45.26, 255.0)} }, 
                poly = { center = vector3(1767.89, 2490.19, 45.26), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cells_tbl_1_seat_3'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1767.86, 2489.39, 45.26, 300.0)} }, 
                poly = { center = vector3(1767.99, 2489.47, 45.26), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cells_tbl_1_seat_4'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1768.54, 2488.92, 45.26, 345.0)} }, 
                poly = { center = vector3(1768.57, 2489.02, 45.26), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cells_tbl_1_seat_5'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1769.36, 2488.99, 45.26, 30.0)} }, 
                poly = { center = vector3(1769.29, 2489.12, 45.26), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cells_tbl_1_seat_6'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1769.84, 2489.67, 45.26, 75.0)} }, 
                poly = { center = vector3(1769.74, 2489.70, 45.26), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cells_tbl_1_seat_7'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1769.77, 2490.49, 45.26, 120.0)} }, 
                poly = { center = vector3(1769.64, 2490.42, 45.26), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cells_tbl_1_seat_8'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1769.09, 2490.97, 45.26, 165.0)} }, 
                poly = { center = vector3(1769.06, 2490.87, 45.26), length = 0.35, width = 0.35, height = 0.35 } 
            },

            -- Table 2
            ['prison_cells_tbl_2_seat_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1763.16, 2487.93, 45.26, 210.0)} }, 
                poly = { center = vector3(1763.23, 2487.80, 45.26), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cells_tbl_2_seat_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1762.68, 2487.26, 45.26, 255.0)} }, 
                poly = { center = vector3(1762.79, 2487.23, 45.26), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cells_tbl_2_seat_3'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1762.76, 2486.43, 45.26, 300.0)} }, 
                poly = { center = vector3(1762.89, 2486.51, 45.26), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cells_tbl_2_seat_4'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1763.43, 2485.96, 45.26, 345.0)} }, 
                poly = { center = vector3(1763.46, 2486.06, 45.26), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cells_tbl_2_seat_5'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1764.26, 2486.03, 45.26, 30.0)} }, 
                poly = { center = vector3(1764.18, 2486.16, 45.26), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cells_tbl_2_seat_6'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1764.73, 2486.71, 45.26, 75.0)} }, 
                poly = { center = vector3(1764.63, 2486.73, 45.26), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cells_tbl_2_seat_7'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1764.66, 2487.53, 45.26, 120.0)} }, 
                poly = { center = vector3(1764.53, 2487.46, 45.26), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cells_tbl_2_seat_8'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1763.98, 2488.01, 45.26, 165.0)} }, 
                poly = { center = vector3(1763.96, 2487.90, 45.26), length = 0.35, width = 0.35, height = 0.35 } 
            },
            
            -- Table 3
            ['prison_cells_tbl_3_seat_1'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1758.49, 2485.25, 45.26, 210.0)} }, 
                poly = { center = vector3(1758.56, 2485.12, 45.26), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cells_tbl_3_seat_2'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1758.01, 2484.58, 45.26, 255.0)} }, 
                poly = { center = vector3(1758.11, 2484.55, 45.26), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cells_tbl_3_seat_3'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1758.08, 2483.75, 45.26, 300.0)} }, 
                poly = { center = vector3(1758.21, 2483.83, 45.26), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cells_tbl_3_seat_4'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1758.76, 2483.28, 45.26, 345.0)} }, 
                poly = { center = vector3(1758.79, 2483.38, 45.26), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cells_tbl_3_seat_5'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1759.59, 2483.35, 45.26, 30.0)} }, 
                poly = { center = vector3(1759.51, 2483.48, 45.26), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cells_tbl_3_seat_6'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1760.06, 2484.03, 45.26, 75.0)} }, 
                poly = { center = vector3(1759.96, 2484.05, 45.26), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cells_tbl_3_seat_7'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1759.99, 2484.85, 45.26, 120.0)} }, 
                poly = { center = vector3(1759.86, 2484.78, 45.26), length = 0.35, width = 0.35, height = 0.35 } 
            },
            ['prison_cells_tbl_3_seat_8'] = { 
                sit = { type = 'chair', seats = {[1] = vector4(1759.31, 2485.33, 45.26, 165.0)} }, 
                poly = { center = vector3(1759.28, 2485.22, 45.26), length = 0.35, width = 0.35, height = 0.35 } 
            },

            -- Cells --
            ['prison_cell_1_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1767.852, 2502.85, 45.21, 210.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },
            ['prison_cell_2_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1764.69, 2501.03, 45.21, 210.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },
            ['prison_cell_3_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1761.53, 2499.21, 45.21, 210.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },
            ['prison_cell_4_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1755.25, 2495.59, 45.21, 210.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },
            ['prison_cell_5_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1752.10, 2493.77, 45.21, 210.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },
            ['prison_cell_6_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1748.95, 2491.95, 45.21, 210.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },

            ['prison_cell_7_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1767.852, 2502.85, 49.16, 210.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },
            ['prison_cell_8_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1764.69, 2501.03, 49.16, 210.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },
            ['prison_cell_9_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1761.53, 2499.21, 49.16, 210.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },
            ['prison_cell_10_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1758.38, 2497.39, 49.16, 210.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },
            ['prison_cell_11_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1755.25, 2495.59, 49.16, 210.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },
            ['prison_cell_12_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1752.10, 2493.77, 49.16, 210.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },
            ['prison_cell_13_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1748.95, 2491.95, 49.16, 210.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },

            ['prison_cell_14_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1758.02, 2470.57, 45.21, 30.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },
            ['prison_cell_15_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1761.17, 2472.39, 45.21, 30.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },
            ['prison_cell_16_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1764.32, 2474.21, 45.21, 30.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },
            ['prison_cell_17_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1767.47, 2476.03, 45.21, 30.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },
            ['prison_cell_18_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1770.62, 2477.85, 45.21, 30.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },
            ['prison_cell_19_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1773.77, 2479.67, 45.21, 30.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },
            ['prison_cell_20_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1776.91, 2481.48, 45.21, 30.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },

            ['prison_cell_21_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1758.02, 2470.57, 49.16, 30.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },
            ['prison_cell_22_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1761.17, 2472.39, 49.16, 30.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },
            ['prison_cell_23_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1764.32, 2474.21, 49.16, 30.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },
            ['prison_cell_24_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1767.47, 2476.03, 49.16, 30.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },
            ['prison_cell_25_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1770.62, 2477.85, 49.16, 30.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },
            ['prison_cell_26_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1773.77, 2479.67, 49.16, 30.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },
            ['prison_cell_27_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1776.91, 2481.48, 49.16, 30.0)} },
                poly = { length = 0.7, width = 0.5, height = 0.6 } 
            },
        }
    },

    -- Premium Deluxe Motorsport
    ['gabz_pdm'] = {
		enabled = false,
		center = vector3(-27.63, -1099.66, 26.75),
		radius = 10.0,
		polys = {
            ['pdm_couch'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-28.06, -1099.51, 26.75, 160.0), [2] = vector4(-27.21, -1099.82, 26.75, 160.0)} }, 
                lay = { type = 'layside', seats = {[1] = vector4(-27.63, -1099.66, 26.75, 160.0)} },
                poly = { center = vector3(-27.63, -1099.66, 26.75), length = 1.1, width = 2.60, height = 1.0 } 
            }
        }
    },

    -- Harmony Repairs
    ['gabz_harmony'] = {
		enabled = true,
        center = vector3(1182.53, 2636.41, 37.60),
		radius = 15.0,
		polys = {
            -- This is a duplicate from lscustoms, it/the other will be overwriten if both gabz_harmony and lscustoms is enabled.
            ['lscustoms_couch_1'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1186.50, 2639.58, 37.88, 270.0), [2] = vector4(1186.50, 2640.36, 37.88, 270.0)} },
                poly = { center = vector3(1186.40, 2639.92, 37.88), length = 1.0, width = 2.4, height = 1.0 } 
            },

            -- Outback
            ['harmony_couch'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(1177.91, 2632.88, 37.32, 183.0), [2] = vector4(1178.66, 2632.92, 37.32, 183.0), [3] = vector4(1179.41, 2632.96, 37.32, 183.0)} },
                lay = { type = 'layside', teleportIn = true, seats = {[1] = vector4(1178.66, 2632.92, 37.32, 183.0)} },
                poly = { center = vector3(1178.66, 2632.90, 37.32), length = 1.0, width = 2.5, height = 1.0 } 
            }
        }
    },

    -- This is NOT mutually exclusive with the regular lscustoms, just an add-on if you have gabz-lscustoms
    ['gabz_lscustoms'] = {
		enabled = true,
		center = vector3(726.42, -1074.92, 24.75),
		radius = 20.0,
		polys = {
            -- Upstairs
            ['gabz_lscustoms_couch_1'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(725.29, -1071.04, 27.82, 270.0), [2] = vector4(725.29, -1069.84, 27.82, 270.0)} },
                lay = { type = 'layside', seats = {[1] = vector4(725.29, -1070.44, 27.82, 270.0)} },
                poly = { center = vector3(725.29, -1070.44, 27.82), length = 1.0, width = 3.0, height = 1.0 } 
            },

            -- Downstairs
            ['gabz_lscustoms_couch_2'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(728.15, -1079.36, 21.68, 0.0), [2] = vector4(727.0, -1079.36, 21.68, 0.0)} },
                lay = { type = 'layside', seats = {[1] = vector4(727.55, -1079.40, 21.68, 0.0)} },
                poly = { center = vector3(727.55, -1079.40, 21.68), length = 1.0, width = 3.0, height = 1.0 } 
            }
        }
    },

    -- "Thanks" gabz for fixing them, I really appreciate doing all the work only for you to fix it. I'll leave it here for people with outdated versions.
    -- ['gabz_beanmachine'] = {
	-- 	enabled = true,
	-- 	center = vector3(120.16, -1040.29, 29.03),
	-- 	radius = 20.0,
	-- 	polys = {
    --         -- Stools
    --         ['bm_stool_1'] = { 
    --             sit = { type = 'stool', seats = {[1] = vector4(125.13, -1029.05, 29.12, 122.0)} }, 
    --             poly = { length = 0.55, width = 0.55, height = 0.55 } 
    --         },
    --         ['bm_stool_2'] = { 
    --             sit = { type = 'stool', seats = {[1] = vector4(123.60, -1028.60, 29.12, 190.0)} }, 
    --             poly = { length = 0.55, width = 0.55, height = 0.55 } 
    --         },
    --         ['bm_stool_3'] = { 
    --             sit = { type = 'stool', seats = {[1] = vector4(124.51, -1032.42, 29.12, 158.0)} }, 
    --             poly = { length = 0.55, width = 0.55, height = 0.55 } 
    --         },
    --         ['bm_stool_4'] = { 
    --             sit = { type = 'stool', seats = {[1] = vector4(122.93, -1032.36, 29.12, 202.0)} }, 
    --             poly = { length = 0.55, width = 0.55, height = 0.55 } 
    --         },
    --         ['bm_stool_5'] = { 
    --             sit = { type = 'stool', seats = {[1] = vector4(122.15, -1033.39, 29.12, 250.0)} }, 
    --             poly = { length = 0.55, width = 0.55, height = 0.55 } 
    --         },
    --         ['bm_stool_6'] = { 
    --             sit = { type = 'stool', seats = {[1] = vector4(121.75, -1034.43, 29.12, 250.0)} }, 
    --             poly = { length = 0.55, width = 0.55, height = 0.55 } 
    --         },
    --         ['bm_stool_7'] = { 
    --             sit = { type = 'stool', seats = {[1] = vector4(119.10, -1041.75, 29.12, 250.0)} }, 
    --             poly = { length = 0.55, width = 0.55, height = 0.55 } 
    --         },
    --         ['bm_stool_8'] = { 
    --             sit = { type = 'stool', seats = {[1] = vector4(118.73, -1042.75, 29.12, 235.0)} }, 
    --             poly = { length = 0.55, width = 0.55, height = 0.55 } 
    --         },
    --         ['bm_stool_9'] = { 
    --             sit = { type = 'stool', seats = {[1] = vector4(118.70, -1044.01, 29.12, 295.0)} }, 
    --             poly = { length = 0.55, width = 0.55, height = 0.55 } 
    --         },
    --         ['bm_stool_10'] = { 
    --             sit = { type = 'stool', seats = {[1] = vector4(119.88, -1044.99, 29.12, 340.0)} }, 
    --             poly = { length = 0.55, width = 0.55, height = 0.55 } 
    --         },
    --         ['bm_stool_11'] = { 
    --             sit = { type = 'stool', seats = {[1] = vector4(122.45, -1046.89, 29.12, 85.0)} }, 
    --             poly = { length = 0.55, width = 0.55, height = 0.55 } 
    --         },
    --         ['bm_stool_12'] = { 
    --             sit = { type = 'stool', seats = {[1] = vector4(121.76, -1048.69, 29.12, 20.0)} }, 
    --             poly = { length = 0.55, width = 0.55, height = 0.55 } 
    --         },
    --         ['bm_stool_13'] = { 
    --             sit = { type = 'stool', seats = {[1] = vector4(117.90, -1047.80, 29.12, 25.0)} }, 
    --             poly = { length = 0.55, width = 0.55, height = 0.55 } 
    --         },
    --         ['bm_stool_14'] = { 
    --             sit = { type = 'stool', seats = {[1] = vector4(116.28, -1047.11, 29.12, 318.0)} }, 
    --             poly = { length = 0.55, width = 0.55, height = 0.55 } 
    --         },

    --         -- Chairs
    --         ['bm_chair_1'] = { 
    --             sit = { type = 'chair', seats = {[1] = vector4(114.29, -1046.07, 28.42, 337.0)} }, 
    --             poly = { length = 1.15, width = 1.15, height = 1.55 } 
    --         },
    --         ['bm_chair_2'] = { 
    --             sit = { type = 'chair', seats = {[1] = vector4(113.37, -1044.34, 28.42, 268.0)} }, 
    --             poly = { length = 1.15, width = 1.15, height = 1.55 } 
    --         }
    --     }
    -- },

    -- Pizza This...
    ['gabz_pizzeria'] = {
		enabled = true,
		center = vector3(802.05, -756.20, 27.02),
		radius = 20.0,
		polys = {
            -- Due to a fix by the Gabz Team on the 24th of april 2022 the chairs became dynamic and a model name is now used instead, so I did a lot of work for no reason. Thanks Gabz!
            -- ['pizzeria_chair_1'] = { 
            --     sit = { type = 'chair', seats = {[1] = vector4(808.05, -751.56, 26.25, 85.0)} },
            --     poly = { length = 0.65, width = 0.65, height = 0.90 } 
            -- },
            -- ['pizzeria_chair_2'] = { 
            --     sit = { type = 'chair', seats = {[1] = vector4(806.02, -751.55, 26.25, 275.0)} },
            --     poly = { length = 0.65, width = 0.65, height = 0.90 } 
            -- },
            -- ['pizzeria_chair_3'] = { 
            --     sit = { type = 'chair', seats = {[1] = vector4(804.10, -751.54, 26.25, 85.0)} },
            --     poly = { length = 0.65, width = 0.65, height = 0.90 } 
            -- },
            -- ['pizzeria_chair_4'] = { 
            --     sit = { type = 'chair', seats = {[1] = vector4(802.09, -751.55, 26.25, 275.0)} },
            --     poly = { length = 0.65, width = 0.65, height = 0.90 } 
            -- },
            -- ['pizzeria_chair_5'] = { 
            --     sit = { type = 'chair', seats = {[1] = vector4(800.11, -751.56, 26.25, 85.0)} },
            --     poly = { length = 0.65, width = 0.65, height = 0.90 } 
            -- },
            -- ['pizzeria_chair_6'] = { 
            --     sit = { type = 'chair', seats = {[1] = vector4(798.08, -751.54, 26.25, 270.0)} },
            --     poly = { length = 0.65, width = 0.65, height = 0.90 } 
            -- },
            -- ['pizzeria_chair_7'] = { 
            --     sit = { type = 'chair', seats = {[1] = vector4(799.01, -748.86, 26.25, 95.0)} },
            --     poly = { length = 0.65, width = 0.65, height = 0.90 } 
            -- },
            -- ['pizzeria_chair_8'] = { 
            --     sit = { type = 'chair', seats = {[1] = vector4(796.98, -748.77, 26.25, 265.0)} },
            --     poly = { length = 0.65, width = 0.65, height = 0.90 } 
            -- },
            -- ['pizzeria_chair_9'] = { 
            --     sit = { type = 'chair', seats = {[1] = vector4(795.10, -750.47, 26.25, 205.0)} },
            --     poly = { length = 0.65, width = 0.65, height = 0.90 } 
            -- },
            -- ['pizzeria_chair_10'] = { 
            --     sit = { type = 'chair', seats = {[1] = vector4(795.14, -752.64, 26.25, 355.0)} },
            --     poly = { length = 0.65, width = 0.65, height = 0.90 } 
            -- },
            -- ['pizzeria_chair_11'] = { 
            --     sit = { type = 'chair', seats = {[1] = vector4(799.57, -754.07, 26.25, 160.0)} },
            --     poly = { length = 0.65, width = 0.65, height = 0.90 } 
            -- },
            -- ['pizzeria_chair_12'] = { 
            --     sit = { type = 'chair', seats = {[1] = vector4(799.49, -756.07, 26.25, 5.0)} },
            --     poly = { length = 0.65, width = 0.65, height = 0.90 } 
            -- },

            -- Basement
            -- ['pizzeria_chair_13'] = { 
            --     sit = { type = 'chair', seats = {[1] = vector4(809.75, -757.30, 21.8, 170.0)} },
            --     poly = { length = 0.65, width = 0.65, height = 0.90 } 
            -- },
            -- ['pizzeria_chair_14'] = { 
            --     sit = { type = 'chair', seats = {[1] = vector4(808.59, -758.53, 21.8, 270.0)} },
            --     poly = { length = 0.65, width = 0.65, height = 0.90 } 
            -- },
            -- ['pizzeria_chair_15'] = { 
            --     sit = { type = 'chair', seats = {[1] = vector4(809.75, -759.71, 21.8, 350.0)} },
            --     poly = { length = 0.65, width = 0.65, height = 0.90 } 
            -- },

            -- Booths
            ['pizzeria_booth_1'] = { 
                sit = { type = 'diner_booth', seats = {[1] = vector4(808.41, -754.14, 26.30, 90.0), [2] = vector4(808.41, -754.89, 26.30, 90.0), [3] = vector4(808.41, -755.64, 26.30, 90.0)} }, 
                poly = { center = vector3(808.45, -754.89, 26.30), length = 0.55, width = 2.0, height = 1.0 } 
            },
            ['pizzeria_booth_2'] = { 
                sit = { type = 'diner_booth', seats = {[1] = vector4(806.95, -755.64, 26.30, 270.0), [2] = vector4(806.95, -754.89, 26.30, 270.0), [3] = vector4(806.95, -754.14, 26.30, 270.0)} }, 
                poly = { center = vector3(806.95, -754.89, 26.30), length = 0.55, width = 2.0, height = 1.0 } 
            },
            ['pizzeria_booth_3'] = { 
                sit = { type = 'diner_booth', seats = {[1] = vector4(806.36, -754.14, 26.30, 90.0), [2] = vector4(806.36, -754.89, 26.30, 90.0), [3] = vector4(806.36, -755.64, 26.30, 90.0)} }, 
                poly = { center = vector3(806.36, -754.89, 26.30), length = 0.55, width = 2.0, height = 1.0 } 
            },
            ['pizzeria_booth_4'] = { 
                sit = { type = 'diner_booth', seats = {[1] = vector4(804.85, -755.64, 26.30, 270.0), [2] = vector4(804.85, -754.89, 26.30, 270.0), [3] = vector4(804.85, -754.14, 26.30, 270.0)} }, 
                poly = { center = vector3(804.85, -754.89, 26.30), length = 0.55, width = 2.0, height = 1.0 } 
            },
            ['pizzeria_booth_5'] = { 
                sit = { type = 'diner_booth', seats = {[1] = vector4(804.25, -754.14, 26.30, 90.0), [2] = vector4(804.25, -754.89, 26.30, 90.0), [3] = vector4(804.25, -755.64, 26.30, 90.0)} }, 
                poly = { center = vector3(804.25, -754.89, 26.30), length = 0.55, width = 2.0, height = 1.0 } 
            },
            ['pizzeria_booth_6'] = { 
                sit = { type = 'diner_booth', seats = {[1] = vector4(802.75, -755.64, 26.30, 270.0), [2] = vector4(802.75, -754.89, 26.30, 270.0), [3] = vector4(802.75, -754.14, 26.30, 270.0)} }, 
                poly = { center = vector3(802.75, -754.89, 26.30), length = 0.55, width = 2.0, height = 1.0 } 
            },
            ['pizzeria_booth_7'] = { 
                sit = { type = 'diner_booth', seats = {[1] = vector4(802.15, -754.14, 26.30, 90.0), [2] = vector4(802.15, -754.89, 26.30, 90.0), [3] = vector4(802.15, -755.64, 26.30, 90.0)} }, 
                poly = { center = vector3(802.15, -754.89, 26.30), length = 0.55, width = 2.0, height = 1.0 } 
            },
            ['pizzeria_booth_8'] = { 
                sit = { type = 'diner_booth', seats = {[1] = vector4(800.65, -755.64, 26.30, 270.0), [2] = vector4(800.65, -754.89, 26.30, 270.0), [3] = vector4(800.65, -754.14, 26.30, 270.0)} }, 
                poly = { center = vector3(800.65, -754.89, 26.30), length = 0.55, width = 2.0, height = 1.0 } 
            },
            ['pizzeria_booth_9'] = { 
                sit = { type = 'diner_booth', seats = {[1] = vector4(798.98, -756.85, 26.30, 180.0), [2] = vector4(799.68, -756.85, 26.30, 180.0)} }, 
                poly = { center = vector3(799.33, -756.85, 26.30), length = 0.55, width = 1.6, height = 1.0 } 
            },
            ['pizzeria_booth_10'] = { 
                sit = { type = 'diner_booth', seats = {[1] = vector4(798.98, -758.40, 26.30, 0.0), [2] = vector4(799.68, -758.40, 26.30, 0.0)} }, 
                poly = { center = vector3(799.33, -758.40, 26.30), length = 0.55, width = 1.6, height = 1.0 } 
            },
            ['pizzeria_booth_11'] = { 
                sit = { type = 'diner_booth', seats = {[1] = vector4(798.98, -758.98, 26.30, 180.0), [2] = vector4(799.68, -758.98, 26.30, 180.0)} }, 
                poly = { center = vector3(799.33, -758.98, 26.30), length = 0.55, width = 1.6, height = 1.0 } 
            },
            ['pizzeria_booth_12'] = { 
                sit = { type = 'diner_booth', seats = {[1] = vector4(798.98, -760.50, 26.30, 0.0), [2] = vector4(799.68, -760.50, 26.30, 0.0)} }, 
                poly = { center = vector3(799.33, -760.50, 26.30), length = 0.55, width = 1.6, height = 1.0 } 
            },

            -- Lounge Area
            -- ['pizzeria_lounge_chair'] = { 
            --     sit = { type = 'chair3', seats = {[1] = vector4(796.54, -767.38, 26.25, 0.0)} }, 
            --     poly = { center = vector3(796.54, -767.45, 26.25), length = 1.25, width = 1.25, height = 1.0 } 
            -- },
            -- ['pizzeria_lounge_sofa'] = { 
            --     sit = { type = 'chair3', seats = {[1] = vector4(795.23, -765.92, 26.25, 270.0), [2] = vector4(795.23, -764.92, 26.25, 270.0), [3] = vector4(795.23, -763.92, 26.25, 270.0)} }, 
            --     poly = { center = vector3(795.12, -764.92, 26.25), length = 1.0, width = 3.60, height = 1.0 } 
            -- },

            -- Toilets
            ['pizzeria_toilet_1'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(804.48, -761.60, 26.25, 90.0)} }, 
                poly = { center = vector3(804.52, -761.60, 26.25), length = 0.65, width = 0.45, height = 1.0 } 
            },
            ['pizzeria_toilet_2'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(804.48, -763.41, 26.25, 90.0)} }, 
                poly = { center = vector3(804.48, -763.41, 26.25), length = 0.65, width = 0.45, height = 1.0 } 
            },
            ['pizzeria_toilet_3'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(804.48, -765.60, 26.25, 90.0)} }, 
                poly = { center = vector3(804.48, -765.60, 26.25), length = 0.65, width = 0.45, height = 1.0 } 
            },
            ['pizzeria_toilet_4'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(804.48, -767.44, 26.25, 90.0)} }, 
                poly = { center = vector3(804.48, -767.44, 26.25), length = 0.65, width = 0.45, height = 1.0 } 
            },

            -- Staff Lounge
            -- ['pizzeria_lounge_chair_2'] = { 
            --     sit = { type = 'chair3', seats = {[1] = vector4(796.42, -762.47, 30.74, 0.0)} }, 
            --     poly = { center = vector3(796.42, -762.55, 30.74), length = 1.25, width = 1.25, height = 1.0 } 
            -- },
            -- ['pizzeria_lounge_sofa_2'] = { 
            --     sit = { type = 'chair3', seats = {[1] = vector4(795.50, -761.42, 30.74, 270.0), [2] = vector4(795.50, -760.42, 30.74, 270.0), [3] = vector4(795.50, -759.42, 30.74, 270.0)} }, 
            --     poly = { center = vector3(795.40, -760.42, 30.74), length = 1.0, width = 3.60, height = 1.0 } 
            -- },

            -- Lockers
            ['pizzeria_lockers_bench_1'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(809.37, -759.70, 30.75, 0.0), [2] = vector4(808.62, -759.70, 30.75, 0.0), [3] = vector4(807.87, -759.70, 30.75, 0.0)} }, 
                lay = { type = 'lay', seats = {[1] = vector4(808.62, -759.67, 30.75, 0.0)} },
                poly = { center = vector3(808.62, -759.63, 30.50), length = 0.5, width = 2.2, height = 0.75 } 
            },
            ['pizzeria_lockers_bench_2'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(811.95, -759.70, 30.75, 0.0), [2] = vector4(811.20, -759.70, 30.75, 0.0)} }, 
                lay = { type = 'lay', seats = {[1] = vector4(811.95, -759.67, 30.75, 0.0)} },
                poly = { center = vector3(812.02, -759.63, 30.50), length = 0.5, width = 2.2, height = 0.75 } 
            },

            -- CEO Office
            -- ['pizzeria_office_chair_1'] = { 
            --     sit = { type = 'chair', seats = {[1] = vector4(802.56, -749.34, 30.85, 160.0)} }, 
            --     poly = { center = vector3(802.56, -749.34, 31.0), length = 1.25, width = 1.25, height = 1.40 } 
            -- },
            -- ['pizzeria_office_chair_2'] = { 
            --     sit = { type = 'chair2', seats = {[1] = vector4(802.25, -750.32, 30.72, 142.0)} }, 
            --     poly = { center = vector3(802.25, -750.32, 30.5), length = 0.75, width = 0.75, height = 0.50 } 
            -- },
            -- ['pizzeria_office_chair_3'] = { 
            --     sit = { type = 'chair', seats = {[1] = vector4(803.28, -756.32, 30.80, 90.0)} }, 
            --     poly = { center = vector3(803.28, -756.32, 30.80), length = 1.15, width = 1.15, height = 1.45 } 
            -- },
            -- ['pizzeria_office_chair_4'] = { 
            --     sit = { type = 'chair', seats = {[1] = vector4(802.18, -757.43, 30.80, 10.0)} }, 
            --     poly = { center = vector3(802.18, -757.43, 30.80), length = 1.15, width = 1.15, height = 1.45 } 
            -- },
            -- ['pizzeria_office_chair_5'] = { 
            --     sit = { type = 'chair', seats = {[1] = vector4(800.85, -757.35, 30.80, 350.0)} }, 
            --     poly = { center = vector3(800.80, -757.35, 30.80), length = 1.15, width = 1.15, height = 1.45 } 
            -- },
            -- ['pizzeria_office_chair_6'] = { 
            --     sit = { type = 'chair', seats = {[1] = vector4(798.56, -752.78, 30.82, 25.0)} }, 
            --     poly = { center = vector3(798.56, -752.81, 30.78), length = 0.75, width = 0.75, height = 1.30 } 
            -- },
            -- ['pizzeria_office_chair_7'] = { 
            --     sit = { type = 'chair', seats = {[1] = vector4(797.19, -752.78, 30.82, 345.0)} }, 
            --     poly = { center = vector3(797.19, -752.74, 30.78), length = 0.75, width = 0.75, height = 1.30 } 
            -- },
            -- ['pizzeria_office_chair_8'] = { 
            --     sit = { type = 'chair', seats = {[1] = vector4(797.88, -750.43, 30.82, 180.0)} }, 
            --     poly = { center = vector3(797.88, -750.40, 30.95), length = 0.75, width = 0.75, height = 1.50 } 
            -- },
        }
    },

    -- HATers
    ['gabz_haters'] = {
		enabled = true,
		center = vector3(-1129.66, -1444.91, 4.75), 
		radius = 10.0,
		polys = {
            ['haters_couch'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-1127.91, -1447.20, 4.75, 305.0), [2] = vector4(-1128.34, -1446.59, 4.75, 305.0)} },
                poly = { center = vector3(-1128.272, -1446.54, 4.5), length = 1.0, width = 2.5, height = 1.0 } 
            },
            ['haters_toilet'] = { 
                sit = { type = 'chair2', seats = {[1] = vector4(-1131.05, -1443.274, 4.75, 35.0)} }, 
                poly = { center = vector3(-1131.05, -1443.274, 4.75), length = 0.75, width = 0.5, height = 1.25 } 
            }
        }
    }
}
