Animation = {}

Animation.Walking = {
    ["Alien"] = "move_m@alien",
    ["Blindé"] = "anim_group_move_ballistic",
    ["Arrogant"] = "move_f@arrogant@a",
    ["Courageux"] = "move_m@brave",
    ["Decontracte"] = "move_m@casual@a",
    ["Decontracte 2"] = "move_m@casual@b",
    ["Decontracte 3"] = "move_m@casual@c",
    ["Decontracte 4"] = "move_m@casual@d",
    ["Decontracte 5"] = "move_m@casual@e",
    ["Decontracte 6"] = "move_m@casual@f",
    ["Effémine"] = "move_f@chichi",
    ["Sur de soi"] = "move_m@confident",
    ["Policier"] = "move_m@business@a",
    ["Policier 2"] = "move_m@business@b",
    ["Policier 3"] = "move_m@business@c",
    ["Femme"] = "move_f@multiplayer",
    ["Homme"] = "move_m@multiplayer",
    ["Ivre"] = "move_m@drunk@a",
    ["Ivre"] = "move_m@drunk@slightlydrunk",
    ["Ivre 2"] = "move_m@buzzed",
    ["Ivre 3"] = "move_m@drunk@verydrunk",
    ["Femme 2"] = "move_f@femme@",
    ["Pompier"] = "move_characters@franklin@fire",
    ["Pompier 2"] = "move_characters@michael@fire",
    ["Pompier 3"] = "move_m@fire",
    ["Fuyard"] = "move_f@flee@a",
    ["Franklin"] = "move_p_m_one",
    ["Gangster"] = "move_m@gangster@generic",
    ["Gangster 2"] = "move_m@gangster@ng",
    ["Gangster 3"] = "move_m@gangster@var_e",
    ["Gangster 4"] = "move_m@gangster@var_f",
    ["Gangster 5"] = "move_m@gangster@var_i",
    ["Groove"] = "anim@move_m@grooving@",
    ["Garde"] = "move_m@prison_gaurd",
    ["Menotte"] = "move_m@prisoner_cuffed",
    ["Talonner"] = "move_f@heels@c",
    ["Talonner 2"] = "move_f@heels@d",
    ["Randonnée"] = "move_m@hiking",
    ["Hipster"] = "move_m@hipster@a",
    ["Clochard"] = "move_m@hobo@a",
    ["Presse"] = "move_f@hurry@a",
    ["Concierge"] = "move_p_m_zero_janitor",
    ["Concierge 2"] = "move_p_m_zero_slow",
    ["Jogging"] = "move_m@jog@",
    ["Lemar"] = "anim_group_move_lemar_alley",
    ["Lester"] = "move_heist_lester",
    ["Lester 2"] = "move_lester_caneup",
    ["Aguicheuse"] = "move_f@maneater",
    ["Argent"] = "move_m@money",
    ["Muscle"] = "move_m@muscle@a",
    ["Chic"] = "move_m@posh@",
    ["Chic 2"] = "move_f@posh@",
    ["Rapide"] = "move_m@quick",
    ["Courreur"] = "female_fast_runner",
    ["Malade"] = "move_m@sad@a",
    ["Impertinent"] = "move_m@sassy",
    ["Impertinent 2"] = "move_f@sassy",
    ["Effraye"] = "move_f@scared",
    ["Sexy"] = "move_f@sexy@a",
    ["Louche"] = "move_m@shadyped@a",
    ["Lent"] = "move_characters@jimmy@slow@",
    ["Swag"] = "move_m@swagger",
    ["Dur"] = "move_m@tough_guy@",
    ["Dur 2"] = "move_f@tough_guy@",
    ["Eboueur"] = "clipset@move@trash_fast_turn",
    ["Eboueur 2"] = "missfbi4prepp1_garbageman",
    ["Trevor"] = "move_p_m_two",
    ["Large"] = "move_m@bag",
} 

Animation.Emotes = {
    ["signefamilies"] = {
        "amb@code_human_in_car_mp_actions@gang_sign_b@low@ps@base",
        "idle_a",
        "Signe families",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
        }
    },
    ["signefamilies2"] = {
        "amb@code_human_in_car_mp_actions@gang_sign_b@std@rps@base",
        "idle_a",
        "Signe families 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
        }
    },
    ["signevagos"] = {
        "amb@code_human_in_car_mp_actions@v_sign@std@rds@base",
        "idle_a",
        "Signe vagos",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
        }
    },
    ["signevagos2"] = {
        "mp_player_int_upperv_sign",
        "mp_player_int_v_sign",
        "Signe vagos 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
        }
    },
    ["drink"] = {
        "mp_player_inteat@pnq", 
        "loop", 
        "Boire", 
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2500,
        },
    },
    ["jpbox"] = {
        "mp_am_hold_up", 
        "purchase_beerbox_shopkeeper", 
        "Acheter une boîte", 
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jch"] = {
        "amb@code_human_police_investigate@idle_b", 
        "idle_f", 
        "Investigation", 
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 7000,
        }
    },
    ["jgangsign5"] = {
        "anim@mp_player_intupperdock", 
        "idle_a", 
        "Signe de gang", 
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2500,
        }
    },
    ["jcheckwatch"] = {
        "amb@code_human_wander_idles_fat@male@idle_a", 
        "idle_a_wristwatch", 
        "Regarder l'heure", 
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 5000,
        }
    },
    ["jpicking"] = {
        "amb@prop_human_movie_bulb@idle_a", 
        "idle_a", 
        "Choisir", 
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2500,
        }
    },
    ["jgangaim"] = {
        "combat@aim_variations@1h@gang", 
        "aim_variation_b", 
        "Pointer avec une arme", 
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
        }
    },
    ["jshowboobs"] = {"mini@strip_club@backroom@", "stripper_b_backroom_idle_b", "Montrer ses seins", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 6000,
    }},
    ["jcleanleg"] = {"mini@strip_club@backroom@", "stripper_c_leadin_backroom_idle_a", "Nettoyer son pantalon", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 6000,
    }},
    ["jshowboobs2"] = {"mini@strip_club@idles@stripper", "stripper_idle_05", "Montrer ses seins 2", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 6000,
    }},
    ["jlockcar"] = {"anim@mp_player_intmenu@key_fob@", "fob_click", "Fermer la voiture", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 2500,
    }},
    ["jselfie5"] = {"cellphone@self", "selfie", "Selfie 1", AnimationOptions =
    {
        EmoteMoving = false,
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
    }},
    ["jselfiewc"] = {"cellphone@self@franklin@", "west_coast", "Selfie 2", AnimationOptions =
    {
        EmoteMoving = false,
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
    }},
    ["jselfie3"] = {"cellphone@self@michael@", "finger_point", "Selfie 3", AnimationOptions =
    {
        EmoteMoving = false,
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
    }},
    ["jselfie4"] = {"cellphone@self@franklin@", "chest_bump", "Selfie 4", AnimationOptions =
    {
        EmoteMoving = false,
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
    }},
    ["jSelfie1"] = {"cellphone@self@trevor@", "throat_slit", "Selfie 5", AnimationOptions =
    {
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["jSelfie2"] = {"cellphone@self@trevor@", "proud_finger", "Selfie 6", AnimationOptions =
    {
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["oob2"] = {"rcmfanatic3leadinoutef_3_mcs_1", "fra_outofbreath_loop", "Essouflé", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["damn3"] = {"misscommon@response", "damn", "Damn", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jkhaby"] = {"missarmenian3@simeon_tauntsidle_b", "areyounotman", "Khaby", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jdepressed"] = {"oddjobs@bailbond_hobodepressed", "base", "Dépressif", AnimationOptions =
    {
     EmoteMoving = true,
    }},
    ["jcarsign"] = {"amb@code_human_in_car_mp_actions@gang_sign_a@bodhi@rds@base", "idle_a", "Signe de gang en voiture", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 2500,
    }},
    ["jcarsign2"] = {"amb@code_human_in_car_mp_actions@gang_sign_a@low@ds@base", "idle_a", "Signe de gang en voiture 2", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 2500,
    }},
    ["jcarlowrider"] = {"anim@veh@lowrider@low@front_ds@arm@base", "sit", "Lowrider style - Voiture", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteLoop = true,
    }},
    ["jcarlowrider2"] = {"anim@veh@lowrider@std@ds@arm@music@mexicanidle_a", "idle", "Lowrider style mexicain · Car  ~y~XD ~c~1.0", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteLoop = true,
    }},
    ["handsow"] = {"rcmjosh1", "idle", "Mains sur la taille", AnimationOptions =
    {
        EmoteMoving = true,
    }},
    ["washhand"] = {"missheist_agency3aig_23", "urinal_sink_loop", "Se laver les mains", AnimationOptions =
    {
     EmoteMoving = true,
    }},
    ["jleaningwallback"] = {"anim@amb@casino@peds@", "amb_world_human_leaning_male_wall_back_mobile_idle_a", "Posé sur le mur - Homme", AnimationOptions =
    {
     Prop = "prop_npc_phone_02",
     PropBone = 28422,
     PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
     EmoteLoop = true,
     EmoteMoving = true,
    }},
    ["stop"] = {"anim@amb@casino@peds@", "mini_strip_club_idles_bouncer_stop_stop", "Stop", AnimationOptions =
    {
        EmoteMoving = true,
    }},
    ["chill"] = {"switch@trevor@scares_tramp", "trev_scares_tramp_idle_tramp", "Chill", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["cloudgaze"] = {"switch@trevor@annoys_sunbathers", "trev_annoys_sunbathers_loop_girl", "Allongé chill", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["cloudgaze2"] = {"switch@trevor@annoys_sunbathers", "trev_annoys_sunbathers_loop_guy", "Allongé chill 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["prone"] = {"missfbi3_sniping", "prone_dave", "A plat ventre", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["pullover"] = {"misscarsteal3pullover", "pull_over_right", "Montrer du doigt", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 1300,
    }},
    ["idle"] = {"anim@heists@heist_corona@team_idles@male_a", "idle", "Pose debout", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["idle8"] = {"amb@world_human_hang_out_street@male_b@idle_a", "idle_b", "Pose debout 8"},
    ["idle9"] = {"friends@fra@ig_1", "base_idle", "Pose debout 9", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["idle10"] = {"mp_move@prostitute@m@french", "idle", "Pose debout 10", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["idle11"] = {"random@countrysiderobbery", "idle_a", "Pose debout 11", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["idle2"] = {"anim@heists@heist_corona@team_idles@female_a", "idle", "Pose debout 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["idle3"] = {"anim@heists@humane_labs@finale@strip_club", "ped_b_celebrate_loop", "Pose debout 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["idle4"] = {"anim@mp_celebration@idles@female", "celebration_idle_f_a", "Pose debout 4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["idle5"] = {"anim@mp_corona_idles@female_b@idle_a", "idle_a", "Pose debout 5", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["idle6"] = {"anim@mp_corona_idles@male_c@idle_a", "idle_a", "Pose debout 6", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["idle7"] = {"anim@mp_corona_idles@male_d@idle_a", "idle_a", "Pose debout 7", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["wait3"] = {"amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_a", "Attendre 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["idledrunk"] = {"random@drunk_driver_1", "drunk_driver_stand_loop_dd1", "Pose debout bourré", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["idledrunk2"] = {"random@drunk_driver_1", "drunk_driver_stand_loop_dd2", "Pose debout bourré 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["idledrunk3"] = {"missarmenian2", "standing_idle_loop_drunk", "Pose debout bourré 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["airguitar"] = {"anim@mp_player_intcelebrationfemale@air_guitar", "air_guitar", "Air Guitar"},
    ["airsynth"] = {"anim@mp_player_intcelebrationfemale@air_synth", "air_synth", "Air Piano"},
    ["argue"] = {"misscarsteal4@actor", "actor_berating_loop", "Pourquoi ?", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["argue2"] = {"oddjobs@assassinate@vice@hooker", "argue_a", "Pourquoi ? 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["bartender"] = {"anim@amb@clubhouse@bar@drink@idle_a", "idle_a_bartender", "Se tenir à une barre", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["blowkiss"] = {"anim@mp_player_intcelebrationfemale@blow_kiss", "blow_kiss", "Plein de bisous"},
    ["blowkiss2"] = {"anim@mp_player_intselfieblow_kiss", "exit", "Plein de bisous 2", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 2000
 
    }},
    ["curtsy"] = {"anim@mp_player_intcelebrationpaired@f_f_sarcastic", "sarcastic_left", "Révérence"},
    ["bringiton"] = {"misscommon@response", "bring_it_on", "Hola", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 3000
    }},
    ["comeatmebro"] = {"mini@triathlon", "want_some_of_this", "Viens vers moi", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 2000
    }},
    ["cop2"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Policier 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["cop3"] = {"amb@code_human_police_investigate@idle_a", "idle_b", "Policier 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["crossarms"] = {"amb@world_human_hang_out_street@female_arms_crossed@idle_a", "idle_a", "Croiser les bras", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["crossarms2"] = {"amb@world_human_hang_out_street@male_c@idle_a", "idle_b", "Croiser les bras 2", AnimationOptions =
    {
        EmoteMoving = true,
    }},
    ["crossarms3"] = {"anim@heists@heist_corona@single_team", "single_team_loop_boss", "Croiser les bras 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["crossarms4"] = {"random@street_race", "_car_b_lookout", "Croiser les bras 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["crossarms5"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Croiser les bras 5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["foldarms2"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Bras croisés 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["crossarms6"] = {"random@shop_gunstore", "_idle", "Croiser les bras 6", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["foldarms"] = {"anim@amb@business@bgen@bgen_no_work@", "stand_phone_phoneputdown_idle_nowork", "Bras croisés", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["crossarmsside"] = {"rcmnigel1a_band_groupies", "base_m2", "Croiser les bras penché", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["damn"] = {"gestures@m@standing@casual", "gesture_damn", "Damn", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 1000
    }},
    ["damn2"] = {"anim@am_hold_up@male", "shoplift_mid", "Damn 2", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 1000
    }},
    ["pointdown"] = {"gestures@f@standing@casual", "gesture_hand_down", "Pointer vers le bas", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 1000
    }},
    ["surrender"] = {"random@arrests@busted", "idle_a", "Se rendre", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["facepalm2"] = {"anim@mp_player_intcelebrationfemale@face_palm", "face_palm", "Main sur le visage 2", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 8000
    }},
    ["facepalm"] = {"random@car_thief@agitated@idle_a", "agitated_idle_a", "Main sur le visage", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 8000
    }},
    ["facepalm3"] = {"missminuteman_1ig_2", "tasered_2", "Main sur le visage 3", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 8000
    }},
    ["facepalm4"] = {"anim@mp_player_intupperface_palm", "idle_a", "Main sur le visage 4", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteLoop = true,
    }},
    ["fallover"] = {"random@drunk_driver_1", "drunk_fall_over", "Tomber au sol"},
    ["fallover2"] = {"mp_suicide", "pistol", "Tomber au sol 2"},
    ["fallover3"] = {"mp_suicide", "pill", "Tomber au sol 3"},
    ["fallover4"] = {"friends@frf@ig_2", "knockout_plyr", "Tomber au sol 4"},
    ["fallover5"] = {"anim@gangops@hostage@", "victim_fail", "Tomber au sol 5"},
    ["fallasleep"] = {"mp_sleep", "sleep_loop", "Dormir debout", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteLoop = true,
    }},
    ["fightme"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_c", "S'échauffer"},
    ["fightme2"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_e", "S'échauffer 2"},
    ["finger"] = {"anim@mp_player_intselfiethe_bird", "idle_a", "Doigt d'honneur", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["finger2"] = {"anim@mp_player_intupperfinger", "idle_a_fp", "Doigt d'honneur 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["handshake"] = {"mp_ped_interaction", "handshake_guy_a", "Poignée de main", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 3000
    }},
    ["handshake2"] = {"mp_ped_interaction", "handshake_guy_b", "Poignée de main 2", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 3000
    }},
    ["wait4"] = {"amb@world_human_hang_out_street@Female_arm_side@idle_a", "idle_a", "Attendre 4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["wait5"] = {"missclothing", "idle_storeclerk", "Attendre 5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wait6"] = {"timetable@amanda@ig_2", "ig_2_base_amanda", "Attendre 6", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wait7"] = {"rcmnigel1cnmt_1c", "base", "Attendre 7", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wait8"] = {"rcmjosh1", "idle", "Attendre 8", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wait9"] = {"rcmjosh2", "josh_2_intp1_base", "Attendre 9", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wait10"] = {"timetable@amanda@ig_3", "ig_3_base_tracy", "Attendre 10", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wait11"] = {"misshair_shop@hair_dressers", "keeper_base", "Attendre 11", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["hiking"] = {"move_m@hiking", "idle", "Randonnée", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["hug"] = {"mp_ped_interaction", "kisses_guy_a", "Calin"},
    ["hug2"] = {"mp_ped_interaction", "kisses_guy_b", "Calin 2"},
    ["hug3"] = {"mp_ped_interaction", "hugs_guy_a", "Calin 3"},
    ["inspect"] = {"random@train_tracks", "idle_e", "Inspecter"},
    ["jazzhands"] = {"anim@mp_player_intcelebrationfemale@jazz_hands", "jazz_hands", "Faire coucou", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 6000,
    }},
    ["jog2"] = {"amb@world_human_jog_standing@male@idle_a", "idle_a", "Jogging 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["jog3"] = {"amb@world_human_jog_standing@female@idle_a", "idle_a", "Jogging 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["jog4"] = {"amb@world_human_power_walker@female@idle_a", "idle_a", "Jogging 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["jog5"] = {"move_m@joy@a", "walk", "Jogging 5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["jumpingjacks"] = {"timetable@reunited@ig_2", "jimmy_getknocked", "Jumping Jacks", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["kneel2"] = {"rcmextreme3", "idle", "S'accroupir", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["kneel3"] = {"amb@world_human_bum_wash@male@low@idle_a", "idle_a", "Genou au sol", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["knock"] = {"timetable@jimmy@doorknock@", "knockdoor_idle", "Toquer", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteLoop = true,
    }},
    ["knock2"] = {"missheistfbi3b_ig7", "lift_fibagent_loop", "Toquer 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["knucklecrunch"] = {"anim@mp_player_intcelebrationfemale@knuckle_crunch", "knuckle_crunch", "Se craquer les doigts", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["lapdance"] = {"mp_safehouse", "lap_dance_girl", "Danse sexy"},
    ["lean2"] = {"amb@world_human_leaning@female@wall@back@hand_up@idle_a", "idle_a", "Posé sur un mur 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["lean3"] = {"amb@world_human_leaning@female@wall@back@holding_elbow@idle_a", "idle_a", "Posé sur un mur 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["lean4"] = {"amb@world_human_leaning@male@wall@back@foot_up@idle_a", "idle_a", "Posé sur un mur 4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["lean5"] = {"amb@world_human_leaning@male@wall@back@hands_together@idle_b", "idle_b", "Posé sur un mur 5", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["leanflirt"] = {"random@street_race", "_car_a_flirt_girl", "Montrer ses fesses", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["leanbar2"] = {"amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", "S'accouder 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["leanbar3"] = {"anim@amb@nightclub@lazlow@ig1_vip@", "clubvip_base_laz", "S'accouder 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["leanbar4"] = {"anim@heists@prison_heist", "ped_b_loop_a", "S'accouder 4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["leanhigh"] = {"anim@mp_ferris_wheel", "idle_a_player_one", "S'accouder en hauteur", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["leanhigh2"] = {"anim@mp_ferris_wheel", "idle_a_player_two", "S'accouder en hauteur 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["leanside"] = {"timetable@mime@01_gc", "idle_a", "S'accouder avec flow", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["leanside2"] = {"misscarstealfinale", "packer_idle_1_trevor", "S'accouder avec flow 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["leanside3"] = {"misscarstealfinalecar_5_ig_1", "waitloop_lamar", "S'accouder avec flow 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["leanside4"] = {"misscarstealfinalecar_5_ig_1", "waitloop_lamar", "S'accouder avec flow 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["leanside5"] = {"rcmjosh2", "josh_2_intp1_base", "S'accouder avec flow 5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["me"] = {"gestures@f@standing@casual", "gesture_me_hard", "Moi?", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 1000
    }},
    ["mechanic"] = {"mini@repair", "fixing_a_ped", "Mécanicien", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["mechanic2"] = {"amb@world_human_vehicle_mechanic@male@base", "idle_a", "Mechanic 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["mechanic3"] = {"anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", "Mechanic 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["mechanic4"] = {"anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", "Mechanic 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["medic2"] = {"amb@medic@standing@tendtodead@base", "base", "Médecin 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["meditate"] = {"rcmcollect_paperleadinout@", "meditiate_idle", "Méditer", AnimationOptions = -- CHANGE ME
    {
        EmoteLoop = true,
    }},
    ["meditate2"] = {"rcmepsilonism3", "ep_3_rcm_marnie_meditating", "Méditer 2", AnimationOptions = -- CHANGE ME
    {
        EmoteLoop = true,
    }},
    ["meditate3"] = {"rcmepsilonism3", "base_loop", "Méditer 3", AnimationOptions = -- CHANGE ME
    {
        EmoteLoop = true,
    }},
    ["metal"] = {"anim@mp_player_intincarrockstd@ps@", "idle_a", "Metal", AnimationOptions = -- CHANGE ME
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["no"] = {"anim@heists@ornate_bank@chat_manager", "fail", "Non", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["no2"] = {"mp_player_int_upper_nod", "mp_player_int_nod_no", "Non 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["nosepick"] = {"anim@mp_player_intcelebrationfemale@nose_pick", "nose_pick", "Se curer le nez", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["noway"] = {"gestures@m@standing@casual", "gesture_no_way", "Non 3", AnimationOptions =
    {
        EmoteDuration = 1500,
        EmoteMoving = true,
    }},
    ["ok"] = {"anim@mp_player_intselfiedock", "idle_a", "Ok", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["outofbreath"] = {"re@construction", "out_of_breath", "Essouflé 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["push"] = {"missfinale_c2ig_11", "pushcar_offcliff_f", "Pousser", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["push2"] = {"missfinale_c2ig_11", "pushcar_offcliff_m", "Pousser 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["point"] = {"gestures@f@standing@casual", "gesture_point", "Désigner", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["pushup"] = {"amb@world_human_push_ups@male@idle_a", "idle_d", "Faire des pompes", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["countdown"] = {"random@street_race", "grid_girl_race_start", "Acclamer", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["pointright"] = {"mp_gun_shop_tut", "indicate_right", "Désigner à droite", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["salute"] = {"anim@mp_player_intincarsalutestd@ds@", "idle_a", "Salut militaire", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["salute2"] = {"anim@mp_player_intincarsalutestd@ps@", "idle_a", "Salut militaire 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["salute3"] = {"anim@mp_player_intuppersalute", "idle_a", "Salut militaire 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["scared"] = {"random@domestic", "f_distressed_loop", "Effrayé", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["scared2"] = {"random@homelandsecurity", "knees_loop_girl", "Effrayé 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["screwyou"] = {"misscommon@response", "screw_you", "Va te faire", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["shakeoff"] = {"move_m@_idles@shake_off", "shakeoff_1", "S'essuyer", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 3500,
    }},
    ["shot"] = {"random@dealgonewrong", "idle_a", "Blessé au sol", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sleep"] = {"timetable@tracy@sleep@", "idle_c", "Dormir", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["shrug"] = {"gestures@f@standing@casual", "gesture_shrug_hard", "Je ne sais pas", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 1000,
    }},
    ["shrug2"] = {"gestures@m@standing@casual", "gesture_shrug_hard", "Je ne sais pas 2", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 1000,
    }},
    ["sit"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_idle_nowork", "S'asseoir au sol", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sit2"] = {"rcm_barry3", "barry_3_sit_loop", "S'asseoir au sol 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sit3"] = {"amb@world_human_picnic@male@idle_a", "idle_a", "S'asseoir au sol 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sit4"] = {"amb@world_human_picnic@female@idle_a", "idle_a", "S'asseoir au sol 4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sit5"] = {"anim@heists@fleeca_bank@ig_7_jetski_owner", "owner_idle", "S'asseoir au sol 5", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sit6"] = {"timetable@jimmy@mics3_ig_15@", "idle_a_jimmy", "S'asseoir au sol 6", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sit7"] = {"anim@amb@nightclub@lazlow@lo_alone@", "lowalone_base_laz", "S'asseoir au sol 7", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sit8"] = {"timetable@jimmy@mics3_ig_15@", "mics3_15_base_jimmy", "S'asseoir au sol 8", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sit9"] = {"amb@world_human_stupor@male@idle_a", "idle_a", "S'asseoir au sol 9", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sitlean"] = {"timetable@tracy@ig_14@", "ig_14_base_tracy", "S'asseoir sur un rebord", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sitsad"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_sleeping-noworkfemale", "Pleurer au sol", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sitscared"] = {"anim@heists@ornate_bank@hostages@hit", "hit_loop_ped_b", "Effrayé au sol", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sitscared2"] = {"anim@heists@ornate_bank@hostages@ped_c@", "flinch_loop", "Effrayé au sol 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sitscared3"] = {"anim@heists@ornate_bank@hostages@ped_e@", "flinch_loop", "Effrayé au sol 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sitdrunk"] = {"timetable@amanda@drunk@base", "base", "Bourré au sol", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sitchair2"] = {"timetable@ron@ig_5_p3", "ig_5_p3_base", "S'asseoir sur une chaise 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sitchair3"] = {"timetable@reunited@ig_10", "base_amanda", "S'asseoir sur une chaise 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sitchair4"] = {"timetable@ron@ig_3_couch", "base", "S'asseoir sur une chaise 4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sitchair5"] = {"timetable@jimmy@mics3_ig_15@", "mics3_15_base_tracy", "S'asseoir sur une chaise 5", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sitchair6"] = {"timetable@maid@couch@", "base", "S'asseoir sur une chaise 6", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sitchairside"] = {"timetable@ron@ron_ig_2_alt1", "ig_2_alt1_base", "S'asseoir sur le côté", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["situp"] = {"amb@world_human_sit_ups@male@idle_a", "idle_a", "Faire des abdos", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["clapangry"] = {"anim@arena@celeb@flat@solo@no_props@", "angry_clap_a_player_a", "Applaudir énervé", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["slowclap3"] = {"anim@mp_player_intupperslow_clap", "idle_a", "Applaudir lentement 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["clap"] = {"amb@world_human_cheering@male_a", "base", "Applaudir", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["slowclap"] = {"anim@mp_player_intcelebrationfemale@slow_clap", "slow_clap", "Applaudir lentement", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["slowclap2"] = {"anim@mp_player_intcelebrationmale@slow_clap", "slow_clap", "Applaudir lentement 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["smell"] = {"move_p_m_two_idles@generic", "fidget_sniff_fingers", "Sentir une odeur", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["stickup"] = {"random@countryside_gang_fight", "biker_02_stickup_loop", "Pointer avec une arme", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["stumble"] = {"misscarsteal4@actor", "stumble", "Étourdi", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["stunned"] = {"stungun@standing", "damage", "Se faire taser", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sunbathe"] = {"amb@world_human_sunbathe@male@back@base", "base", "Bronzer", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sunbathe2"] = {"amb@world_human_sunbathe@female@back@base", "base", "Bronzer 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sunbathe3"] = {"amb@world_human_sunbathe@male@front@base", "base", "Bronzer 3", AnimationOptions =
 {
     EmoteLoop = true,
 }},
 ["standfire"] = {"amb@world_human_stand_fire@male@base", "base", "Se réchauffer les mains", AnimationOptions =
 {
     EmoteLoop = true,
 }},
    ["t"] = {"missfam5_yoga", "a2_pose", "Bras en T", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["t2"] = {"mp_sleep", "bind_pose_180", "Bras en V", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["think5"] = {"mp_cp_welcome_tutthink", "b_think", "Penser 5", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 2000,
    }},
    ["think"] = {"misscarsteal4@aliens", "rehearsal_base_idle_director", "Penser", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["think3"] = {"timetable@tracy@ig_8@base", "base", "Penser 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
 
    ["think2"] = {"missheist_jewelleadinout", "jh_int_outro_loop_a", "Penser 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["thumbsup3"] = {"anim@mp_player_intincarthumbs_uplow@ds@", "enter", "Pouces en l'air", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 3000,
    }},
    ["thumbsup2"] = {"anim@mp_player_intselfiethumbs_up", "idle_a", "Pouce en l'air 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["thumbsup"] = {"anim@mp_player_intupperthumbs_up", "idle_a", "Pouce en l'air", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["type"] = {"anim@heists@prison_heiststation@cop_reactions", "cop_b_idle", "Écrire au clavier", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["type2"] = {"anim@heists@prison_heistig1_p1_guard_checks_bus", "loop", "Écrire au clavier 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["type3"] = {"mp_prison_break", "hack_loop", "Écrire au clavier 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["type4"] = {"mp_fbi_heist", "loop", "Écrire au clavier 4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["warmth"] = {"amb@world_human_stand_fire@male@idle_a", "idle_a", "Se chauffer les mains 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wave4"] = {"random@mugging5", "001445_01_gangintimidation_1_female_idle_b", "Coucou 4", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 3000,
    }},
    ["wave2"] = {"anim@mp_player_intcelebrationfemale@wave", "wave", "Coucou 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wave3"] = {"friends@fra@ig_1", "over_here_idle_a", "Coucou 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wave"] = {"friends@frj@ig_1", "wave_a", "Coucou", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wave5"] = {"friends@frj@ig_1", "wave_b", "Coucou 5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wave6"] = {"friends@frj@ig_1", "wave_c", "Coucou 6", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wave7"] = {"friends@frj@ig_1", "wave_d", "Coucou 7", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wave8"] = {"friends@frj@ig_1", "wave_e", "Coucou 8", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wave9"] = {"gestures@m@standing@casual", "gesture_hello", "Coucou 9", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["whistle"] = {"taxi_hail", "hail_taxi", "Siffler", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 1300,
    }},
    ["whistle2"] = {"rcmnigel1c", "hailing_whistle_waive_a", "Siffler 2", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 2000,
    }},
    ["yeah"] = {"anim@mp_player_intupperair_shagging", "idle_a", "Copuler", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["lift"] = {"random@hitch_lift", "idle_f", "Faire du stop", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["lol"] = {"anim@arena@celeb@flat@paired@no_props@", "laugh_a_player_b", "Se moquer", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["lol2"] = {"anim@arena@celeb@flat@solo@no_props@", "giggle_a_player_b", "Se moquer 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["statue2"] = {"fra_0_int-1", "cs_lamardavis_dual-1", "Statue 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["statue3"] = {"club_intro2-0", "csb_englishdave_dual-0", "Statue 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["gangsign"] = {"mp_player_int_uppergang_sign_a", "mp_player_int_gang_sign_a", "Signe de gang", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["gangsign2"] = {"mp_player_int_uppergang_sign_b", "mp_player_int_gang_sign_b", "Signe de gang 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["passout"] = {"missarmenian2", "drunk_loop", "Allongé sur le ventre", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["passout2"] = {"missarmenian2", "corpse_search_exit_ped", "Allongé sur le dos", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["passout3"] = {"anim@gangops@morgue@table@", "body_search", "Allongé droit", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["passout4"] = {"mini@cpr@char_b@cpr_def", "cpr_pumpchest_idle", "Allongé sur le dos 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["passout5"] = {"random@mugging4", "flee_backward_loop_shopkeeper", "Allongé en cachant son visage", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["petting"] = {"creatures@rottweiler@tricks@", "petting_franklin", "Opérer", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["crawl"] = {"move_injured_ground", "front_loop", "Ramper", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["flip2"] = {"anim@arena@celeb@flat@solo@no_props@", "cap_a_player_a", "Faire un salto 2"},
    ["flip"] = {"anim@arena@celeb@flat@solo@no_props@", "flip_a_player_a", "Faire un salto"},
    ["slide"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_a_player_a", "Glisser"},
    ["slide2"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_b_player_a", "Glisser 2"},
    ["slide3"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_c_player_a", "Glisser 3"},
    ["slugger"] = {"anim@arena@celeb@flat@solo@no_props@", "slugger_a_player_a", "Faire du baseball"},
    ["flipoff"] = {"anim@arena@celeb@podium@no_prop@", "flip_off_a_1st", "Faire un doigt au public", AnimationOptions =
    {
        EmoteMoving = true,
    }},
    ["flipoff2"] = {"anim@arena@celeb@podium@no_prop@", "flip_off_c_1st", "Faire un doigt au public 2", AnimationOptions =
    {
        EmoteMoving = true,
    }},
    ["bow"] = {"anim@arena@celeb@podium@no_prop@", "regal_c_1st", "Révérence 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["bow2"] = {"anim@arena@celeb@podium@no_prop@", "regal_a_1st", "Révérence 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["keyfob"] = {"anim@mp_player_intmenu@key_fob@", "fob_click", "Déverrouiller", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = true,
        EmoteDuration = 1000,
    }},
    ["golfswing"] = {"rcmnigel1d", "swing_a_mark", "Faire du golf"},
    ["eat"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Manger", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 3000,
    }},
    ["reaching"] = {"move_m@intimidation@cop@unarmed", "idle", "Holster", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wait"] = {"random@shop_tattoo", "_idle_a", "Attendre", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wait2"] = {"missbigscore2aig_3", "wait_for_van_c", "Attendre 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wait12"] = {"rcmjosh1", "idle", "Attendre 12", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["wait13"] = {"rcmnigel1a", "base", "Attendre 13", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["lapdance2"] = {"mini@strip_club@private_dance@idle", "priv_dance_idle", "Danse sexy 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["lapdance3"] = {"mini@strip_club@private_dance@part2", "priv_dance_p2", "Lapdance 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["twerk"] = {"switch@trevor@mocks_lapdance", "001443_01_trvs_28_idle_stripper", "Twerk", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["slap"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_slap", "Giffler", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
        EmoteDuration = 2000,
    }},
    ["headbutt"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_headbutt", "Coup de boule"},
    ["fishdance"] = {"anim@mp_player_intupperfind_the_fish", "idle_a", "Danse du poisson", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["peace"] = {"mp_player_int_upperpeace_sign", "mp_player_int_peace_sign", "Peace", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["peace2"] = {"anim@mp_player_intupperpeace", "idle_a", "Peace 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["cpr"] = {"mini@cpr@char_a@cpr_str", "cpr_pumpchest", "Massage cardiaque", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["cpr2"] = {"mini@cpr@char_a@cpr_str", "cpr_pumpchest", "Massage cardiaque 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["ledge"] = {"missfbi1", "ledge_loop", "Faire l'avion accroupi", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["airplane"] = {"missfbi1", "ledge_loop", "Faire l'avion", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["peek"] = {"random@paparazzi@peek", "left_peek_a", "Se montrer", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["cough"] = {"timetable@gardener@smoking_joint", "idle_cough", "Tousser", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["stretch"] = {"mini@triathlon", "idle_e", "S'échauffer 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["stretch2"] = {"mini@triathlon", "idle_f", "S'échauffer 4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["stretch3"] = {"mini@triathlon", "idle_d", "S'échauffer 5", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["stretch4"] = {"rcmfanatic1maryann_stretchidle_b", "idle_e", "S'échauffer 6", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["celebrate"] = {"rcmfanatic1celebrate", "celebrate", "Célébrer", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["punching"] = {"rcmextreme2", "loop_punching", "Frapper", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["superhero"] = {"rcmbarry", "base", "Super héro", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["superhero2"] = {"rcmbarry", "base", "Super héro 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["mindcontrol"] = {"rcmbarry", "mind_control_b_loop", "Contrôle de l'esprit", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["mindcontrol2"] = {"rcmbarry", "bar_1_attack_idle_aln", "Contrôle de l'esprit 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["clown"] = {"rcm_barry2", "clown_idle_0", "Clown", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["clown2"] = {"rcm_barry2", "clown_idle_1", "Clown 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["clown3"] = {"rcm_barry2", "clown_idle_2", "Clown 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["clown4"] = {"rcm_barry2", "clown_idle_3", "Clown 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["clown5"] = {"rcm_barry2", "clown_idle_6", "Clown 5", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["tryclothes"] = {"mp_clothing@female@trousers", "try_trousers_neutral_a", "Essayer des vêtements", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["tryclothes2"] = {"mp_clothing@female@shirt", "try_shirt_positive_a", "Essayer des vêtements 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["tryclothes3"] = {"mp_clothing@female@shoes", "try_shoes_positive_a", "Essayer des vêtements 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["nervous2"] = {"mp_missheist_countrybank@nervous", "nervous_idle", "Nerveux 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["nervous"] = {"amb@world_human_bum_standing@twitchy@idle_a", "idle_c", "Nerveux", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["nervous3"] = {"rcmme_tracey1", "nervous_loop", "Nerveux 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["uncuff"] = {"mp_arresting", "a_uncuff", "Démenotter", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["namaste"] = {"timetable@amanda@ig_4", "ig_4_base", "Namaste", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["dj"] = {"anim@amb@nightclub@djs@dixon@", "dixn_dance_cntr_open_dix", "DJ", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["threaten"] = {"random@atmrobberygen", "b_atm_mugging", "Pointer une arme sur la tempe", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["radio"] = {"random@arrests", "generic_radio_chatter", "Radio", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["pull"] = {"random@mugging4", "struggle_loop_b_thief", "Tirer un objet", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["bird"] = {"random@peyote@bird", "wakeup", "Faire l'oiseau"},
    ["chicken"] = {"random@peyote@chicken", "wakeup", "Faire la poule", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["bark"] = {"random@peyote@dog", "wakeup", "Faire le chien"},
    ["rabbit"] = {"random@peyote@rabbit", "wakeup", "Faire le lapin"},
    ["spiderman"] = {"missexile3", "ex03_train_roof_idle", "Spiderman", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["boi"] = {"special_ped@jane@monologue_5@monologue_5c", "brotheradrianhasshown_2", "Menacer avec la main", AnimationOptions =
    {
       EmoteMoving = true,
       EmoteDuration = 3000,
    }},
    ["adjust"] = {"missmic4", "michael_tux_fidget", "Ajuster", AnimationOptions =
    {
       EmoteMoving = true,
       EmoteDuration = 4000,
    }},
    ["handsup"] = {"missminuteman_1ig_2", "handsup_base", "Mains en l'air", AnimationOptions =
    {
       EmoteMoving = true,
       EmoteLoop = true,
    }},
    ["pee"] = {"misscarsteal2peeing", "peeing_loop", "Uriner", AnimationOptions =
    {
        EmoteStuck = true,
        PtfxAsset = "scr_amb_chop",
        PtfxName = "ent_anim_dog_peeing",
        PtfxNoProp = true,
        PtfxPlacement = {-0.05, 0.3, 0.0, 0.0, 90.0, 90.0, 1.0},
        PtfxInfo = "Appuyez et maintenez ~b~G~w~ pour uriner.",
        PtfxWait = 3000,
    }},
 
 -----------------------------------------------------------------------------------------------------------
 ------ These are Scenarios, some of these dont work on women and some other issues, but still good to have.
 -----------------------------------------------------------------------------------------------------------
 
    ["atm"] = {"Scenario", "PROP_HUMAN_ATM", "ATM"},
    ["bbq"] = {"MaleScenario", "PROP_HUMAN_BBQ", "Barbecue"},
    ["bumbin"] = {"Scenario", "PROP_HUMAN_BUM_BIN", "Fouiller dans une poubelle"},
    ["bumsleep"] = {"Scenario", "WORLD_HUMAN_BUM_SLUMPED", "Dormir dans la rue"},
    ["cheer"] = {"Scenario", "WORLD_HUMAN_CHEERING", "Applaudir"},
    ["chinup"] = {"Scenario", "PROP_HUMAN_MUSCLE_CHIN_UPS", "Faire des tractions"},
    ["clipboard2"] = {"MaleScenario", "WORLD_HUMAN_CLIPBOARD", "Presse-papiers 2"},
    ["copbeacon"] = {"MaleScenario", "WORLD_HUMAN_CAR_PARK_ATTENDANT", "Faire la circulation"},
    ["filmshocking"] = {"Scenario", "WORLD_HUMAN_MOBILE_FILM_SHOCKING", "Filmer en étant choqué"},
    ["flex"] = {"Scenario", "WORLD_HUMAN_MUSCLE_FLEX", "Flex"},
    ["guard"] = {"Scenario", "WORLD_HUMAN_GUARD_STAND", "Garde"},
    ["hammer"] = {"Scenario", "WORLD_HUMAN_HAMMERING", "Marteau"},
    ["hangout"] = {"Scenario", "WORLD_HUMAN_HANG_OUT_STREET", "Croiser les bras"},
    ["impatient"] = {"Scenario", "WORLD_HUMAN_STAND_IMPATIENT", "Impatient"},
    ["janitor"] = {"Scenario", "WORLD_HUMAN_JANITOR", "Concierge"},
    ["jog"] = {"Scenario", "WORLD_HUMAN_JOG_STANDING", "Jogging"},
    ["kneel"] = {"Scenario", "CODE_HUMAN_MEDIC_KNEEL", "Soigner"},
    ["leafblower"] = {"MaleScenario", "WORLD_HUMAN_GARDENER_LEAF_BLOWER", "Souffler les feuilles"},
    ["lean"] = {"Scenario", "WORLD_HUMAN_LEANING", "S'appuyer"},
    ["leanbar"] = {"Scenario", "PROP_HUMAN_BUM_SHOPPING_CART", "S'appuyer sur une barre"},
    ["lookout"] = {"Scenario", "CODE_HUMAN_CROSS_ROAD_WAIT", "Regarder autour de soi"},
    ["maid"] = {"Scenario", "WORLD_HUMAN_MAID_CLEAN", "Nettoyer"},
    ["medic"] = {"Scenario", "CODE_HUMAN_MEDIC_TEND_TO_DEAD", "Médecin"},
    ["musician"] = {"MaleScenario", "WORLD_HUMAN_MUSICIAN", "Musicien"},
    ["notepad2"] = {"Scenario", "CODE_HUMAN_MEDIC_TIME_OF_DEATH", "Prendre des notes 2"},
    ["parkingmeter"] = {"Scenario", "PROP_HUMAN_PARKING_METER", "Parcomètre"},
    ["party"] = {"Scenario", "WORLD_HUMAN_PARTYING", "Faire la fête"},
    ["texting"] = {"Scenario", "WORLD_HUMAN_STAND_MOBILE", "Envoyer un message"},
    ["prosthigh"] = {"Scenario", "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS", "Se prostituer"},
    ["prostlow"] = {"Scenario", "WORLD_HUMAN_PROSTITUTE_LOW_CLASS", "Se prostituer 2"},
    ["puddle"] = {"Scenario", "WORLD_HUMAN_BUM_WASH", "Jetter de l'eau"},
    ["record"] = {"Scenario", "WORLD_HUMAN_MOBILE_FILM_SHOCKING", "Filmer"},
    ["sitchair"] = {"ScenarioObject", "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", "S'asseoir sur une chaise"},
    -- ["smoke"] = {"Scenario", "WORLD_HUMAN_SMOKING", "Smoke"},
    ["smokeweed"] = {"MaleScenario", "WORLD_HUMAN_DRUG_DEALER", "Fumer de la drogue"},
    ["statue"] = {"Scenario", "WORLD_HUMAN_HUMAN_STATUE", "Statue"},
    ["sunbathe3"] = {"Scenario", "WORLD_HUMAN_SUNBATHE", "Bronzer"},
    ["sunbatheback"] = {"Scenario", "WORLD_HUMAN_SUNBATHE_BACK", "Bronzer sur le dos"},
    ["weld"] = {"Scenario", "WORLD_HUMAN_WELDING", "Souder"},
    ["windowshop"] = {"Scenario", "WORLD_HUMAN_WINDOW_SHOP_BROWSE", "Regarder une vitrine"},
    ["yoga"] = {"Scenario", "WORLD_HUMAN_YOGA", "Yoga"},
    ["karate"] = {"anim@mp_player_intcelebrationfemale@karate_chops", "karate_chops", "Karaté"},
    ["karate2"] = {"anim@mp_player_intcelebrationmale@karate_chops", "karate_chops", "Karaté 2"},
    ["cutthroat"] = {"anim@mp_player_intcelebrationmale@cut_throat", "cut_throat", "Menacer"},
    ["cutthroat2"] = {"anim@mp_player_intcelebrationfemale@cut_throat", "cut_throat", "Menacer 2"},
    ["mindblown"] = {"anim@mp_player_intcelebrationmale@mind_blown", "mind_blown", "Avoir la tête qui explose", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 4000
    }},
    ["mindblown2"] = {"anim@mp_player_intcelebrationfemale@mind_blown", "mind_blown", "Avoir la tête qui explose 2", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 4000
    }},
    ["boxing"] = {"anim@mp_player_intcelebrationmale@shadow_boxing", "shadow_boxing", "Boxer", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 4000
    }},
    ["boxing2"] = {"anim@mp_player_intcelebrationfemale@shadow_boxing", "shadow_boxing", "Boxer 2", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 4000
    }},
    ["stink"] = {"anim@mp_player_intcelebrationfemale@stinker", "stinker", "Sentir une odeur puante", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["think4"] = {"anim@amb@casino@hangout@ped_male@stand@02b@idles", "idle_a", "Penser 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["adjusttie"] = {"clothingtie", "try_tie_positive_a", "Ajuster sa cravate", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 5000
    }},
    ["jreactiona"] = {"random@shop_robbery_reactions@", "absolutely", "Réagir positivement", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jreactanger"] = {"random@shop_robbery_reactions@", "anger_a", "Réagir énervé", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jreactwhy"] = {"random@shop_robbery_reactions@", "is_this_it", "Réagir confusément", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jreactscrew"] = {"random@shop_robbery_reactions@", "screw_you", "Réagir en faisant un doigt", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jreactshock"] = {"random@shop_robbery_reactions@", "shock", "Réagir de manière choquée", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jreactgoodc"] = {"missclothing", "good_choice_storeclerk", "Réagir en faisant le bon choix", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jtrynewc"] = {"clothingtie", "try_tie_neutral_c", "Essayer de nouveaux vêtements", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jtrynewc2"] = {"clothingtie", "try_tie_neutral_d", "Essayer de nouveaux vêtements 2", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jreacteasy"] = {"gestures@m@car@std@casual@ds", "gesture_easy_now", "Réagir calmement", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jreactıwill"] = {"gestures@m@car@std@casual@ds", "gesture_i_will", "Réagir 2", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jreactnoway"] = {"gestures@m@car@std@casual@ds", "gesture_no_way", "Réagir négativement", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jreactbye"] = {"gestures@f@standing@casual", "gesture_bye_hard", "Réagir en disant aurevoir", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jreacthello"] = {"gestures@f@standing@casual", "gesture_hello", "Réagir en disant bonjour", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
       ["jlookatplayer"] = {"friends@frl@ig_1", "look_lamar", "Regarder à droite", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
      ["jreactgreat"] = {"mp_cp_welcome_tutgreet", "greet", "Réagir en disant oui", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jfakepunch"] = {"missarmenian2", "fake_punch_walk_by_lamar", "Faux coup", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 5000,
    }},
       ["jreactdamn"] = {"missheist_jewel", "damn", "Réagir en étant blazé", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
      ["jimtellingyou"] = {"missheist_jewel", "im_telling_you", "Je te le dis", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jreactno"] = {"missheist_jewel", "despair", "Réagir en disant non", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jdontkillme"] = {"missheist_jewel", "manageress_kneel_loop", "Ne me tue pas", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jbangbang"] = {"anim@mp_player_intcelebrationfemale@bang_bang", "bang_bang", "Pan pan", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jtryshirtn"] = {"clothingshirt", "try_shirt_negative_a", "Tester un tshirt trop large", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jtryshirtp"] = {"clothingshirt", "try_shirt_positive_a", "Tester un tshirt adapté", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
       ["jtryshoes"] = {"clothingshoes", "try_shoes_positive_d", "Tester des chaussures", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
     ["jtryshoes2"] = {"clothingshoes", "try_shoes_positive_c", "Tester des chaussures 2", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
     ["joverhere"] = {"friends@fra@ig_1", "over_here_idle_a", "Par ici", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
     ["jwashingface"] = {"missmic2_washing_face", "michael_washing_face", "Se débarbouiller le visage", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 5000,
    }},
     ["jlastday"] = {"misstrevor1", "ortega_outro_loop_ort", "Dernier jour", AnimationOptions =
    {
     EmoteLoop = true,
    }},
     ["jtryg"] = {"mp_clothing@female@glasses", "try_glasses_positive_a", "Essayer des lunettes · Female", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
     ["jpickup"] = {"pickup_object", "pickup_low", "Ramasser", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jstretchl"] = {"switch@franklin@bed", "stretch_long", "S'étirer", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jhos"] = {"amb@world_human_hang_out_street@male_a@idle_a", "idle_a", "Discussion de rue · Homme", AnimationOptions =
    {
     EmoteLoop = true,
    }},
    ["jhos2"] = {"amb@world_human_hang_out_street@male_c@base", "base", "Discussion de rue 2 · Homme", AnimationOptions =
    {
     EmoteLoop = true,
    }},
    ["jguardaim"] = {"guard_reactions", "1hand_aiming_cycle", "Viser tel un garde", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jgready"] = {"switch@franklin@getting_ready", "002334_02_fras_v2_11_getting_dressed_exit", "Se préparer", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jlao"] = {"move_clown@p_m_two_idles@", "fidget_look_at_outfit", "Regarder sa tenue", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 6000,
    }},
    ["jtoilet"] = {"switch@trevor@on_toilet", "trev_on_toilet_loop", "Déféquer", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 5000,
    }},
    ["jtoilet2"] = {"timetable@trevor@on_the_toilet", "trevonlav_struggleloop", "Déféquer 2", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 5000,
    }},
    ["jcovermale2"] = {"amb@code_human_cower@male@base", "base", "Se cacher · Homme", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jvalet"] = {"anim@amb@world_human_valet@normal@base@", "base_a_m_y_vinewood_01", "Faire le croupier", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jvalet2"] = {"anim@amb@world_human_valet@formal_right@base@", "base_a_m_y_vinewood_01", "Faire le croupier 2", AnimationOptions =
    {
     EmoteMoving = true,
     EmoteLoop = true,
    }},
    ["jsunbathem"] = {"amb@world_human_sunbathe@male@back@idle_a", "idle_c", "Bronzer sur le dos · Homme", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
    }},
    ["jsunbathem2"] = {"amb@world_human_sunbathe@male@front@base", "base", "Bronzer sur le ventre 2 · Homme", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jleancar"] = {"anim@scripted@carmeet@tun_meet_ig2_race@", "base", "Se poser contre une voiture", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["jcheckout"] = {"anim@amb@carmeet@checkout_car@male_a@idles", "idle_b", "Vérifier · Femme", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jcheckout2"] = {"anim@amb@carmeet@checkout_car@male_c@idles", "idle_a", "Vérifier 2 · Homme", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jcheckout"] = {"anim@amb@carmeet@checkout_car@female_d@base", "base", "Vérifier 3 · Femme", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jreadmessages"] = {"anim@amb@carmeet@take_photos@male_a@base", "base", "Lire des messages · Homme", AnimationOptions =
    {
        EmoteMoving = false,
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
    }},
    ["jreadmessages2"] = {"anim@amb@carmeet@take_photos@female_b@base", "base", "Lire des messages · Femme", AnimationOptions =
    {
        EmoteMoving = false,  
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
    }},
    ["jlistenmusic"] = {"anim@amb@carmeet@listen_music@male_a@trans", "a_trans_d", "Écouter de la musique", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 5000,
    }},
    ["jogger"] = {"move_f@jogger", "idle", "Faire du jogging · Femme", AnimationOptions =
    {
        EmoteDuration = 2500,
        EmoteMoving = true,
    }},
    ["jogger2"] = {"move_m@jogger", "idle", "Faire du jogging · Homme", AnimationOptions =
    {
        EmoteDuration = 2500,
        EmoteMoving = true,
    }},
    ["jwtf"] = {"mini@triathlon", "wot_the_fuck", "Wot The Fuck", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jucdt"] = {"mini@triathlon", "u_cant_do_that", "Tu ne peux pas faire ça", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jwarmup"] = {"mini@triathlon", "ig_2_gen_warmup_01", "S'échauffer", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 5000,
    }},
    ["jwarmup2"] = {"mini@triathlon", "ig_2_gen_warmup_02", "S'échauffer 2", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 5000,
    }},
    ["jwarmup3"] = {"mini@triathlon", "jog_idle_f", "S'échauffer 3", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 5000,
    }},
    ["jwarmup4"] = {"mini@triathlon", "jog_idle_e", "S'échauffer 4", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 5000,
    }},
    ["jhmassage"] = {"missheistfbi3b_ig8_2", "cpr_loop_paramedic", "Massage cardiaque", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jpassout"] = {"missheistfbi3b_ig8_2", "cower_loop_victim", "Allongé sur le dos", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jddealer"] = {"amb@world_human_drug_dealer_hard@male@base", "base", "Pose de vente de drogue", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jswatch"] = {"amb@world_human_strip_watch_stand@male_c@idle_a", "idle_b", "Regarder un strip tease · Homme", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jcheckw"] = {"amb@world_human_bum_wash@male@high@base", "base", "Vérifier l'eau", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 5000,
    }},
    ["jwaitt"] = {"oddjobs@taxi@", "idle_a", "Attendre le taxi", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 5000,
    }},
    ["jnoway"] = {"oddjobs@towingpleadingbase", "base", "Pas du tout", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jtsomething"] = {"oddjobs@bailbond_hobohang_out_street_c", "idle_c", "Dire quelque chose", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jlfh"] = {"oddjobs@assassinate@old_lady", "looking_for_help", "Chercher de l'aide", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 5000,
    }},
    ["jmstretch"] = {"oddjobs@assassinate@multi@", "idle_a", "Montrer ses muscles", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 5000,
    }},
    ["jdj"] = {"anim@mp_player_intcelebrationmale@dj", "dj", "DJ", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jdj2"] = {"anim@scripted@nightclub@dj@dj_moodm@", "moodm_cdj_left_a_12", "DJ 2", AnimationOptions =
    { 
        EmoteLoop = true,
    }},
    ["jdj3"] = {"anim@amb@nightclub@djs@switch@dixn_djset_switchover@", "dix_end_bg_female1", "DJ 3", AnimationOptions =
    {
     EmoteLoop = true,
    }},
    ["jdj4"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", "trans_dance_facedj_li_to_mi_11_v1_male^3", "DJ 4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jlmic"] = {"anim@veh@lowrider@std@ds@arm@music@hiphopidle_a", "idle", "Écouter de la musique en voiture", AnimationOptions =
    {
     EmoteMoving = true,
     EmoteDuration = 2500,
    }},
    ["jgotc"] = {"random@getawaydriver@thugs", "base_a", "Pointer une personne qui est en voiture", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["jvsad"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_sleeping-noworkfemale", "Très triste", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jdgrave"] = {"anim@amb@drug_field_workers@rake@male_a@base", "base", "Récolter de la terre 2", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        Prop = 'prop_tool_shovel006',
        PropBone = 28422,
        PropPlacement = {0.0, 0.1, -0.6, 0.0, 0.0, 180.0},
    }},
    ["jbow3"] = {"missheistdockssetup1ig_10@base", "talk_pipe_base_worker1", "Attendre accroupi", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 2500,
    }},
    ["jweeding"] = {"anim@amb@drug_field_workers@weeding@male_a@base", "base", "Vomir au sol · Male", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jlookplan"] = {"missheist_agency2aig_4", "look_plan_c_worker2", "Regarder une carte", AnimationOptions =
    {
     EmoteMoving = false,
     EmoteDuration = 5000,
    }},
    ["jgangdrink"] = {"amb@world_human_drinking_fat@beer@male@base", "base", "Boire de l'alcool - Gang", AnimationOptions =
    {
        Prop = 'prop_cs_beer_bot_40oz_03',
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["jgangdrink"] = {"amb@world_human_drinking_fat@beer@male@idle_a", "idle_b", "Boire de l'alcool - Gang 2", AnimationOptions =
    {
        Prop = 'prop_cs_beer_bot_40oz_03',
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["jmleaning"] = {"amb@world_human_leaning@male@wall@back@mobile@base", "base", "Posé au téléphone · Homme", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    }},
    ["jthanks"] = {"random@arrests", "thanks_male_05", "Merci", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jtextingmale"] = {"amb@world_human_stand_mobile_fat@male@text@base", "base", "Envoyer des messages · Homme", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteLoop = true,
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    }},
    ["jffb"] = {"timetable@trevor@skull_loving_bear", "skull_loving_bear", "Enc*ler par derrière", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jsitchair7"] = {"timetable@reunited@ig_10", "isthisthebest_jimmy", "S'asseoir sur une chaise 7", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jsitchair8"] = {"timetable@michael@on_sofabase", "sit_sofa_base", "S'asseoir sur une chaise 8", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jsitchair9"] = {"timetable@trevor@smoking_meth@base", "base", "S'asseoir sur une chaise 9", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jsitchair10"] = {"timetable@tracy@ig_7@base", "base", "S'asseoir sur une chaise 10", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jstandingt"] = {"amb@world_human_bum_standing@twitchy@base", "base", "Arranger les ongles", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jstandingfit"] = {"amb@world_human_jog_standing@male@fitbase", "base", "Courir sur place", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jstandingm"] = {"anim@amb@casino@hangout@ped_male@stand@03b@base", "base", "Se tenir la hanche · Homme", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jstandingf"] = {"anim@amb@casino@hangout@ped_female@stand@02a@base", "base", "Se tenir la main · Femme", AnimationOptions =
    {
        EmoteLoop = true,
    }},
}

Animation.Dances = {
    ["jdrill"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_13_v1_male^3", "Drill · Homme", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jdrill2"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_13_v2_male^1", "Drill · Homme 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jdrill3"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v2_male^4", "Drill · Homme 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jdrill4"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_male^4", "Drill · Homme 4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jdrill5"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v2_male^5", "Drill · Homme 5", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jDrill6"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_17_male^5", "Drill · Homme 6", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jdrill7"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_right_up", "Drill · Solo 1", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jdrill8"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "med_center", "Drill · Solo 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["jdrill9"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_right_down", "Drill · Solo 3", AnimationOptions =
    {
        EmoteLoop = true,
    }}, 
    ["jdrill10"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_center", "Drill · Solo 4", AnimationOptions =
    {
         EmoteLoop = true,
    }}, 
    ["jDrill11"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_left_down", "Drill · Solo 5", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dance2"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_down", "Danse 2 · Homme", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dance3"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "high_center", "Danse 3 · Homme", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dance4"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_up", "Danse 4 · Homme", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["danceupper"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center", "Danse Upper · Femme", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["danceupper2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center_up", "Danse Upper 2 · Femme", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["danceshy"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "low_center", "Danse Timide · Homme", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["danceshy2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center_down", "Danse Timide 2 · Femme", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["danceslow"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "low_center", "Danse Lente · Homme", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["Salsor"] = {"anim@mp_player_intuppersalsa_roll", "idle_a", "Danse des mains", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["unclej"] = {"anim@mp_player_intcelebrationfemale@uncle_disco", "uncle_disco", "Oncle Josh", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dance7"] = {"misschinese2_crystalmazemcs1_ig", "dance_loop_tao", "Danse 7", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dance8"] = {"missfbi3_sniping", "dance_m_default", "Danse 8", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancesilly"] = {"special_ped@mountain_dancer@monologue_3@monologue_3a", "mnt_dnc_buttwag", "Danse Silly · Homme 1", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancesilly2"] = {"move_clown@p_m_zero_idles@", "fidget_short_dance", "Danse Silly · Homme 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancesilly3"] = {"move_clown@p_m_two_idles@", "fidget_short_dance", "Danse Silly · Homme 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancesilly4"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_11_buttwiggle_b_laz", "Danse Silly · Femme 4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancesilly5"] = {"timetable@tracy@ig_5@idle_a", "idle_a", "Danse Silly · Homme 5", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancesilly6"] = {"timetable@tracy@ig_8@idle_b", "idle_d", "Danse Silly · Homme 6", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dance9"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_center_up", "Danse · Femme 9", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancesilly8"] = {"anim@mp_player_intcelebrationfemale@the_woogie", "the_woogie", "Danse Silly · Femme 8", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["dancesilly7"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "high_center", "Danse Silly · Femme 7", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["dance5"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "med_center", "Danse 5", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["danceglowstick"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_13_mi_hi_sexualgriding_laz", "Danse Glowsticks", AnimationOptions =
    {
        Prop = 'ba_prop_battle_glowstick_01',
        PropBone = 28422,
        PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
        SecondProp = 'ba_prop_battle_glowstick_01',
        SecondPropBone = 60309,
        SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["danceglowstick2"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_12_mi_hi_bootyshake_laz", "Danse Glowsticks 2", AnimationOptions =
    {
        Prop = 'ba_prop_battle_glowstick_01',
        PropBone = 28422,
        PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
        SecondProp = 'ba_prop_battle_glowstick_01',
        SecondPropBone = 60309,
        SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
        EmoteLoop = true,
    }},
    ["danceglowstick3"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_09_mi_hi_bellydancer_laz", "Danse Glowsticks 3", AnimationOptions =
    {
        Prop = 'ba_prop_battle_glowstick_01',
        PropBone = 28422,
        PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
        SecondProp = 'ba_prop_battle_glowstick_01',
        SecondPropBone = 60309,
        SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
        EmoteLoop = true,
    }},
    ["dancehorse"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_15_handup_laz", "Danse Horse", AnimationOptions =
    {
        Prop = "ba_prop_battle_hobby_horse",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["dancehorse2"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_hi_11_handup_laz", "Danse Horse 2", AnimationOptions =
    {
        Prop = "ba_prop_battle_hobby_horse",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
    }},
    ["dancehorse3"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_11_hu_shimmy_laz", "Danse Horse 3", AnimationOptions =
    {
        Prop = "ba_prop_battle_hobby_horse",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,  
     }},
    ["jmonkeyd"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "high_center", "Danse singe", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["jmonkeyd2"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "high_center_down", "Danse singe 2", AnimationOptions =
    {
         EmoteLoop = true
    }},
    ["jmonkeyd3"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "med_center_down", "Danse singe 3", AnimationOptions =
    {
          EmoteLoop = true
    }},
    ["jrightdown"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "med_right_down", "Danse solo", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["jlowdance"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "low_center", "Danse lente · Femme ", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["jlowdance2"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "high_center", "Danse lente 2 · Femme", AnimationOptions =
        {
        EmoteLoop = true
        }
    },
    ["jhiphop"] = {"anim@amb@nightclub@mini@dance@dance_paired@dance_d@", "ped_a_dance_idle", "Danse Hip Hop", AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jhiphop2"] = {"anim@amb@nightclub@mini@dance@dance_paired@dance_b@", "ped_a_dance_idle", "Danse Hip Hop 2", AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jhiphop3"] = {"anim@amb@nightclub@mini@dance@dance_paired@dance_a@", "ped_a_dance_idle", "Danse Hip Hop 3", AnimationOptions =
        {
            EmoteLoop = true
        }
    },
}

Animation.Props = {
    ["umbrella"] = {"amb@world_human_drinking@coffee@male@base", "base", "Parapluie", AnimationOptions =
    {
        Prop = "p_amb_brolly_01",
        PropBone = 57005,
        PropPlacement = {0.15, 0.005, 0.0, 87.0, -20.0, 180.0},
        --
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["notepad"] = {"missheistdockssetup1clipboard@base", "base", "Prendre des notes", AnimationOptions =
    {
        Prop = 'prop_notepad_01',
        PropBone = 18905,
        PropPlacement = {0.1, 0.02, 0.05, 10.0, 0.0, 0.0},
        SecondProp = 'prop_pencil_01',
        SecondPropBone = 58866,
        SecondPropPlacement = {0.11, -0.02, 0.001, -120.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["box"] = {"anim@heists@box_carry@", "idle", "Carton", AnimationOptions =
    {
        Prop = "hei_prop_heist_box",
        PropBone = 60309,
        PropPlacement = {0.025, 0.08, 0.255, -145.0, 290.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["rose"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Rose", AnimationOptions =
    {
        Prop = "prop_single_rose",
        PropBone = 18905,
        PropPlacement = {0.13, 0.15, 0.0, -100.0, 0.0, -20.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["bong"] = {"anim@safehouse@bong", "bong_stage3", "Bang", AnimationOptions =
    {
        Prop = 'hei_heist_sh_bong_01',
        PropBone = 18905,
        PropPlacement = {0.10,-0.25,0.0,95.0,190.0,180.0},
    }},
    ["suitcase"] = {"missheistdocksprep1hold_cellphone", "static", "Valise", AnimationOptions =
    {
        Prop = "prop_ld_suitcase_01",
        PropBone = 57005,
        PropPlacement = {0.39, 0.0, 0.0, 0.0, 266.0, 60.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["suitcase2"] = {"missheistdocksprep1hold_cellphone", "static", "Valise 2", AnimationOptions =
    {
        Prop = "prop_security_case_01",
        PropBone = 57005,
        PropPlacement = {0.10, 0.0, 0.0, 0.0, 280.0, 53.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["mugshot"] = {"mp_character_creation@customise@male_a", "loop", "Mugshot", AnimationOptions =
    {
        Prop = 'prop_police_id_board',
        PropBone = 58868,
        PropPlacement = {0.12, 0.24, 0.0, 5.0, 0.0, 70.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["coffee"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Café", AnimationOptions =
    {
        Prop = 'p_amb_coffeecup_01',
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["whiskey"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Whisky", AnimationOptions =
    {
        Prop = 'prop_drink_whisky',
        PropBone = 28422,
        PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["beer"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Bière", AnimationOptions =
    {
        Prop = 'prop_amb_beer_bottle',
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["cup"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Verre", AnimationOptions =
    {
        Prop = 'prop_plastic_cup_02',
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["donut"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Donut", AnimationOptions =
    {
        Prop = 'prop_amb_donut',
        PropBone = 18905,
        PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
        EmoteMoving = true,
    }},
    ["burger"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Burger", AnimationOptions =
    {
        Prop = 'prop_cs_burger_01',
        PropBone = 18905,
        PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
        EmoteMoving = true,
    }},
    ["sandwich"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Sandwich", AnimationOptions =
    {
        Prop = 'prop_sandwich_01',
        PropBone = 18905,
        PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
        EmoteMoving = true,
    }},
    ["soda"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Soda", AnimationOptions =
    {
        Prop = 'prop_ecola_can',
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["egobar"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Barre chocolatée", AnimationOptions =
    {
        Prop = 'prop_choc_ego',
        PropBone = 60309,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteMoving = true,
    }},
    ["wine"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Coupe de vin", AnimationOptions =
    {
        Prop = 'prop_drink_redwine',
        PropBone = 18905,
        PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["flute"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Flute", AnimationOptions =
    {
        Prop = 'prop_champ_flute',
        PropBone = 18905,
        PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["champagne"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Champagne", AnimationOptions =
    {
        Prop = 'prop_drink_champ',
        PropBone = 18905,
        PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    -- ["cigar"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Cigar", AnimationOptions =
    -- {
    --     Prop = 'prop_cigar_02',
    --     PropBone = 47419,
     --    PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
     --    EmoteMoving = true,
     --    EmoteDuration = 2600
    -- }},
    -- ["cigar2"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Cigar 2", AnimationOptions =
    -- {
  --       Prop = 'prop_cigar_01',
   --      PropBone = 47419,
    --     PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
    --     EmoteMoving = true,
   --      EmoteDuration = 2600
   --  }},
    ["guitar"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitare", AnimationOptions =
    {
        Prop = 'prop_acc_guitar_01',
        PropBone = 24818,
        PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["guitar2"] = {"switch@trevor@guitar_beatdown", "001370_02_trvs_8_guitar_beatdown_idle_busker", "Guitare 2", AnimationOptions =
    {
        Prop = 'prop_acc_guitar_01',
        PropBone = 24818,
        PropPlacement = {-0.05, 0.31, 0.1, 0.0, 20.0, 150.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["guitarelectric"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitare électrique", AnimationOptions =
    {
        Prop = 'prop_el_guitar_01',
        PropBone = 24818,
        PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["guitarelectric2"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitare électrique 2", AnimationOptions =
    {
        Prop = 'prop_el_guitar_03',
        PropBone = 24818,
        PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["book"] = {"cellphone@", "cellphone_text_read_base", "Livre", AnimationOptions =
    {
        Prop = 'prop_novel_01',
        PropBone = 6286,
        PropPlacement = {0.15, 0.03, -0.065, 0.0, 180.0, 90.0}, -- This positioning isnt too great, was to much of a hassle
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["bouquet"] = {"impexp_int-0", "mp_m_waremech_01_dual-0", "Bouquet", AnimationOptions =
    {
        Prop = 'prop_snow_flower_02',
        PropBone = 24817,
        PropPlacement = {-0.29, 0.40, -0.02, -90.0, -90.0, 0.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["teddy"] = {"impexp_int-0", "mp_m_waremech_01_dual-0", "Ourson", AnimationOptions =
    {
        Prop = 'v_ilev_mr_rasberryclean',
        PropBone = 24817,
        PropPlacement = {-0.20, 0.46, -0.016, -180.0, -90.0, 0.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["backpack"] = {"move_p_m_zero_rucksack", "idle", "Sac à dos", AnimationOptions =
    {
        Prop = 'p_michael_backpack_s',
        PropBone = 24818,
        PropPlacement = {0.07, -0.11, -0.05, 0.0, 90.0, 175.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["clipboard"] = {"missfam4", "base", "Prendre des notes 2", AnimationOptions =
    {
        Prop = 'p_amb_clipboard_01',
        PropBone = 36029,
        PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["map"] = {"amb@world_human_tourist_map@male@base", "base", "Carte", AnimationOptions =
    {
        Prop = 'prop_tourist_map_01',
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["beg"] = {"amb@world_human_bum_freeway@male@base", "base", "Tenir une pancarte", AnimationOptions =
    {
        Prop = 'prop_beggers_sign_03',
        PropBone = 58868,
        PropPlacement = {0.19, 0.18, 0.0, 5.0, 0.0, 40.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["makeitrain"] = {"anim@mp_player_intupperraining_cash", "idle_a", "Pluie de billets", AnimationOptions =
    {
        Prop = 'prop_anim_cash_pile_01',
        PropBone = 60309,
        PropPlacement = {0.0, 0.0, 0.0, 180.0, 0.0, 70.0},
        EmoteMoving = true,
        EmoteLoop = true,
        PtfxAsset = "scr_xs_celebration",
        PtfxName = "scr_xs_money_rain",
        PtfxPlacement = {0.0, 0.0, -0.09, -80.0, 0.0, 0.0, 1.0},
        PtfxInfo = "Press ~y~G~w~ / to make it rain.",
        PtfxWait = 500,
    }},
    ["camera"] = {"amb@world_human_paparazzi@male@base", "base", "Caméra", AnimationOptions =
    {
        Prop = 'prop_pap_camera_01',
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
        PtfxAsset = "scr_bike_business",
        PtfxName = "scr_bike_cfid_camera_flash",
        PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0},
        PtfxInfo = "Appuyez sur ~b~G~w~ pour utiliser l'appareil photo.",
        PtfxWait = 200,
    }},
    ["champagnespray"] = {"anim@mp_player_intupperspray_champagne", "idle_a", "Pluie de champagne", AnimationOptions =
    {
        Prop = 'ba_prop_battle_champ_open',
        PropBone = 28422,
        PropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0},
        EmoteMoving = true,
        EmoteLoop = true,
        PtfxAsset = "scr_ba_club",
        PtfxName = "scr_ba_club_champagne_spray",
        PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        PtfxInfo = "Appuyez et maintenez ~b~G~s~ pour éjecter le champagne.",
        PtfxWait = 500,
    }},
    ["joint"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Joint", AnimationOptions =
    {
        Prop = 'p_cs_joint_02',
        PropBone = 47419,
        PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
        EmoteMoving = true,
        EmoteDuration = 2600
    }},
  --  ["cig"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Cigarette", AnimationOptions =
  --  {
 --       Prop = 'prop_amb_ciggy_01',
 --       PropBone = 47419,
 --       PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
--        EmoteMoving = true,
 --       EmoteDuration = 2600
  --  }},
    ["brief3"] = {"missheistdocksprep1hold_cellphone", "static", "Valise 3", AnimationOptions =
    {
        Prop = "prop_ld_case_01",
        PropBone = 57005,
        PropPlacement = {0.10, 0.0, 0.0, 0.0, 280.0, 53.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["tablet"] = {"amb@world_human_tourist_map@male@base", "base", "Tablette", AnimationOptions =
    {
        Prop = "prop_cs_tablet",
        PropBone = 28422,
        PropPlacement = {0.0, -0.03, 0.0, 20.0, -90.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["tablet2"] = {"amb@code_human_in_bus_passenger_idles@female@tablet@idle_a", "idle_a", "Tablette 2", AnimationOptions =
    {
        Prop = "prop_cs_tablet",
        PropBone = 28422,
        PropPlacement = {-0.05, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["phonecall"] = {"cellphone@", "cellphone_call_listen_base", "Appeler", AnimationOptions =
    {
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["phone"] = {"cellphone@", "cellphone_text_read_base", "Téléphone", AnimationOptions =
    {
        Prop = "prop_npc_phone_02",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["clean"] = {"timetable@floyd@clean_kitchen@base", "base", "Nettoyer", AnimationOptions =
    {
        Prop = "prop_sponge_01",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["clean2"] = {"amb@world_human_maid_clean@", "base", "Nettoyer 2", AnimationOptions =
    {
        Prop = "prop_sponge_01",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["jclean3"] = {"switch@franklin@cleaning_car", "001946_01_gc_fras_v2_ig_5_base", "Nettoyer 3", AnimationOptions =
    {
     Prop = "prop_sponge_01",
     PropBone = 28422,
     PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
     EmoteLoop = true,
     EmoteMoving = true,
 }},
 ["jmicro"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Tenir un micro", AnimationOptions =
    {
        Prop = "p_ing_microphonel_01",
        PropBone = 18905,
        PropPlacement = {0.11, 0.03, 0.03, -100.0, 0.0, -10.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["jmicro2"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Tenir un micro 2", AnimationOptions =
    {
        Prop = "prop_microphone_02",
        PropBone = 18905,
        PropPlacement = {0.11, 0.03, 0.03, -100.0, 0.0, -10.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["jmicro3"] = {"missfra1", "mcs2_crew_idle_m_boom", "Tenir un micro 3", AnimationOptions =
    {
        Prop = "prop_v_bmike_01",
        PropBone = 28422,
        PropPlacement = {-0.08, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteMoving = true,
        EmoteLoop = true
    }},
    ["jcamerabig"] = {"missfinale_c2mcs_1", "fin_c2_mcs_1_camman", "Tenir une caméra", AnimationOptions =
    {
        Prop = "prop_v_cam_01",
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["jdgrave1"] = {"anim@amb@drug_field_workers@rake@male_a@base", "base", "Récolter de la terre", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteLoop = true,
        Prop = 'prop_tool_shovel006',
        PropBone = 28422,
        PropPlacement = {0.0, 0.1, -0.6, 0.0, 0.0, 180.0},
     }},
}

Animation.Expressions = {
    ["Enerve"] = {"Expression", "mood_angry_1"},
    ["Ivre"] = {"Expression", "mood_drunk_1"},
    ["Idiot"] = {"Expression", "pose_injured_1"},
    ["Electrocute"] = {"Expression", "electrocuted_1"},
    ["Grincheux"] = {"Expression", "effort_1"},
    ["Grincheux 2"] = {"Expression", "mood_drivefast_1"},
    ["Grincheux 3"] = {"Expression", "pose_angry_1"},
    ["Heureux"] = {"Expression", "mood_happy_1"},
    ["Blesse"] = {"Expression", "mood_injured_1"},
    ["Joyeux"] = {"Expression", "mood_dancing_low_1"},
    ["Essouffle"] = {"Expression", "smoking_hold_1"},
    ["Yeux Ouverts"] = {"Expression", "pose_normal_1"},
    ["Clin D'oeil"] = {"Expression", "pose_aiming_1"},
    ["Choque"] = {"Expression", "shocked_1"},
    ["Choque 2"] = {"Expression", "shocked_2"},
    ["Dormir"] = {"Expression", "mood_sleeping_1"},
    ["Dormir 2"] = {"Expression", "dead_1"},
    ["Dormir 3"] = {"Expression", "dead_2"},
    ["Satisfait"] = {"Expression", "mood_smug_1"},
    ["Speculatif"] = {"Expression", "mood_aiming_1"},
    ["Stressé"] = {"Expression", "mood_stressed_1"},
    ["Bouder"] = {"Expression", "mood_sulk_1"},
    ["Etrange"] = {"Expression", "effort_2"},
    ["Etrange 2"] = {"Expression", "effort_3"}, 
    ["Fumer"] = {"Expression", "smoking_hold_1"},
}

Animation.Shared = {
    ["handshake"] = {"mp_ped_interaction", "handshake_guy_a", "Handshake", "Poignée de main 2", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 3000,
        SyncOffsetFront = 0.9
    }},
    ["handshake2"] = {"mp_ped_interaction", "handshake_guy_b", "Handshake 2", "Poignée de main", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 3000
    }},
    ["hug"] = {"mp_ped_interaction", "kisses_guy_a", "Hug", "Calin 2", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 5000,
        SyncOffsetFront = 1.05,
    }},
    ["hug2"] = {"mp_ped_interaction", "kisses_guy_b", "Hug 2", "Calin", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 5000,
        SyncOffsetFront = 1.13
    }},
    ["bro"] = {"mp_ped_interaction", "hugs_guy_a", "Bro", "Check 2", AnimationOptions =
    {
         SyncOffsetFront = 1.14
    }},
    ["bro2"] = {"mp_ped_interaction", "hugs_guy_b", "Bro 2", "Check", AnimationOptions =
    {
         SyncOffsetFront = 1.14
    }},
    ["give"] = {"mp_common", "givetake1_a", "Give", "Donner 2", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 2000
    }},
    ["give2"] = {"mp_common", "givetake1_b", "Give 2", "Donner", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteDuration = 2000
    }},
    ["baseball"] = {"anim@arena@celeb@flat@paired@no_props@", "baseball_a_player_a", "Baseball", "Batte de baseball"},
    ["baseballthrow"] = {"anim@arena@celeb@flat@paired@no_props@", "baseball_a_player_b", "Baseball Throw", "Baseball"},
    ["stickup"] = {"random@countryside_gang_fight", "biker_02_stickup_loop", "Stick Up", "Mains en l'air", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["stickupscared"] = {"missminuteman_1ig_2", "handsup_base", "Stickup Scared", "Pointer avec une arme", AnimationOptions =
    {
       EmoteMoving = true,
       EmoteLoop = true,
    }},
    ["punch"] = {"melee@unarmed@streamed_variations", "plyr_takedown_rear_lefthook", "Punch", "Prendre un coup de poing"},
    ["punched"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_cross_r", "Punched", "Mettre un coup de poing"},
    ["headbutt"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_headbutt", "Headbutt", "Prendre un coup de boule"},
    ["headbutted"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_headbutt", "Headbutted", "Mettre un coup de boule"},
    ["slap2"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_backslap", "Slap 2", "Prendre une claque 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
        EmoteDuration = 2000,
    }},
    ["slap"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_slap", "Slap", "Prendre une claque", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
        EmoteDuration = 2000,
    }},
    ["slapped"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_slap", "Slapped", "Mettre une claque"},
    ["slapped2"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_backslap", "Slapped 2", "Mettre une claque 2"},
 }