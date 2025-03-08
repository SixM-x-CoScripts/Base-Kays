kayscoreAmulance = {

------ JOBS -----
    ------ AMBULANCE ------
    Ambulance = {
        UIrevive = false,  ---- EMS UI MENU OR NOT
        allowedJobs = {
            ['ambulance'] = {label = "Ambulance"},
            ['ambulancesandy'] = {label = "Ambulance Sandy Shore"},
        },
    
        items = {
            ['seringue_morphine'] = {label = 'Seringe de Morphine', event = 'kayscore:ambulance:useItem', args = 'seringue_morphine'},
            ['seringue_morphine2'] = {label = 'Seringe de Morphine 2', event = 'kayscore:ambulance:useItem', args = 'seringue_morphine2'},
            ['seringue_acide'] = {label = "Seringe d'Acide", event = 'kayscore:ambulance:useItem', args = 'seringue_acide'}
        },
    
        radiographsLimb = {
            ["Radiographie (Tête)"] = "radio_tete",
            ["Radiographie (Bras gauche)"] = "radio_bras_gauche",
            ["Radiographie (Bras droit)"] = "radio_bras_droite",
            ["Radiographie (Torse) "] = "radio_torse",
            ["Radiographie (Jambe gauche)"] = "radio_jambe_gauche",
            ["Radiographie (Jambe droite)"] = "radio_jambe_droite",
        },
    
        radiographs = {
            ['ambulance'] = { menu = vec3(-1870.324097, -329.509430, 53.757198), bed = vec3(331.036804, -592.833252, 43.934608)},
            --['ambulancenord'] = {menu = vec3(330.072754, -589.841736, 43.249210), bed = vec3(331.036804, -592.833252, 43.934608)},
            ['ambulance'] = {menu = vec3(330.072754, -589.841736, 43.249210), bed = vec3(330.359375, -592.97625732422, 43.979209899902)},
            ['ambulance'] = {menu = vec3(1820.187378, 3668.676270, 34.159966), bed = vector3(1816.7454833984, 3669.5380859375, 34.729969024658)}
            --['ambulancecayo'] = {menu = vec3(330.072754, -589.841736, 43.249210), bed = vec3(331.036804, -592.833252, 43.934608)},
        },
    
        respawnCooldown = 10000, --30000
        respawns = {
            ["ambulance"] = {
                position = vector4(320.500641, -570.614197, 48.214260, 251.96334838867),
                beds = {
                    vector4(317.824158, -585.302063, 44.203972, 155.32713317871),
                    vector4(322.748383, -586.947876, 44.203979, 156.04806518555),
                    vector4(324.298157, -582.873840, 44.203976, 336.15832519531),
                    
                    vector4(309.170654, -577.690308, 44.203976, 342.46502685547),
                    vector4(307.769897, -581.382263, 44.203976, 164.58589172363),
                    vector4(311.184448, -582.716003, 44.203979, 160.72911071777),
                    
                    vector4(313.858795, -579.295044, 44.203979, 331.76776123047),
                },
            },
        },
    },

}