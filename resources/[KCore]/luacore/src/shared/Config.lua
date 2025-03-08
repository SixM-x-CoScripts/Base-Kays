ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

kayscoreConfig = {}
kayscoreConfig.IpLock = "kayscore"
kayscoreConfig.Color = "~b~"
---@class Afk
Afk = {

    Zone = vector3(-1266.943115, -3013.040771, -48.490223),
    NPC = {
        pos = vector3(259.570923, -783.117981, 30.509720),
        heading = 74.01685333252,
        name = "Slide AFK"
    },

    Leaderboard = {
        [1] = vector3(-1266.710083, -3008.387451, -48.490223),
    },

    -- ⚠️La chance est un numéro suur le total de récopenses de la caisse !!!!!!

    -- car | boat | aircraft

    Case = {

        -- Case 1

        {label = 'Caisse 1', name = 'Caisse Diamond', price = 1000, rewards = {
            {label = 'Rebla', name = 'rebla', type = 'vehicle', vehicle = "car", count = 1, chance = 3},
            {label = 'Jugular', name = 'jugular', type = 'vehicle', vehicle = "car", count = 1, chance = 3},
            {label = 'Astone Martin', name = 'rmodmartin', type = 'vehicle', vehicle = "car", count = 1, chance = 1},
            {label = 'Range-Rover Velar', name = '18velar', type = 'vehicle', vehicle = "car", count = 1, chance = 1},
            {label = 'Seashark', name = 'seashark', type = 'vehicle', vehicle = "boat", count = 1, chance = 2},
            {label = '750000$', name = 'money_750000', type = 'money', count = 750000, chance = 2},
            {label = '300000$', name = 'money_300000', type = 'money', count = 300000, chance = 3},
            {label = 'Pistolet', name = 'weapon_pistol', type = 'weapon', count = 1, chance = 1},
            {label = '3 Kevlar', name = 'armor', type = 'item', count = 3, chance = 2},
            {label = '250 Acier Traité', name = 'aciertraitement', type = 'item', count = 250, chance = 1},
            {label = 'Pioche Arc en ciel', name = 'weapon_rainbowsmash', type = 'weapon', count = 1, chance = 2},
        }},

        -- Case 2

        {label = 'Caisse 2', name = 'Caisse Ruby', price = 1500, rewards = {
            {label = 'Audi Rs4', name = 'RS4Avant', type = 'vehicle', vehicle = "car", count = 1, chance = 1},
            {label = 'BMW I8M Liberty Walk', name = 'rmodi8ks', type = 'vehicle', vehicle = "car", count = 1, chance = 1},
            {label = 'Furia', name = 'furia', type = 'vehicle', vehicle = "car", count = 1, chance = 2},
            {label = 'Dinghy', name = 'dinghy2', type = 'vehicle', vehicle = "boat", count = 1, chance = 2},
            {label = '1000000$', name = 'money_1000000', type = 'money', count = 1000000, chance = 3},
            {label = '500000$', name = 'money_500000', type = 'money', count = 500000, chance = 2},
            {label = 'Pistolet Cal50', name = 'weapon_pistol50', type = 'weapon', count = 1, chance = 3},
            {label = '1000 Coins', name = 'coins', type = 'coins', count = 1000, chance = 1},
            {label = 'Velum', name = 'velum', type = 'vehicle', vehicle = "helico", count = 1, chance = 2},
        }},
    },
}

---@class Gunfight
Gunfight = {
    Public = {
        {name = "Nuketown Zone 1", maxPlayers = 150}
    },
}

Config = {
    GoFast = {
            Pos = vector3(1628.203125, -2287.949951, 104.785881),
            Sell = vector3(114.87, 6611.87, 31.86),
            SpawnVehiculeJoueur = vector3(1632.808594, -2281.254150, 106.134003),
            SpawnJoueur = vector3(1632.808594, -2281.254150, 106.134003),
            Reward = math.random(21000, 31000), 
            
        },
    
    }    

---@class LSBCO
LSBCO = {
    ["police"] = {

    },
    ["SASPN"] = {

    },
    ["all"] = {
        Bill = {
            ['noFishingPermitDouce'] = {
                reason = 'Pêche sans Permit (Eau Douce)',
                price = 70000
            },
            ['noFishingPermitMer'] = {
                reason = 'Pêche sans Permit (Eau de Mer)',
                price = 80000
            },
            ['noFishingPermitProfonde'] = {
                reason = 'Pêche sans Permit (Eau Profonde)',
                price = 100000
            },
            ['infraction1'] = {
                reason = 'Usage abusif du Klaxon',
                price = 100
            },
            ['infraction2'] = {
                reason = 'Non respect des distances de sécurité (1.5 m)',
                price = 100
            },
            ['infraction3'] = {
                reason = 'Franchissement d\'une ligne continue ',
                price = 100
            },
            ['infraction4'] = {
                reason = 'Stationnement gênant et/ou interdit',
                price = 300
            },
            ['infraction5'] = {
                reason = 'Insulte envers un civil',
                price = 500
            },
            ['infraction6'] = {
                reason = 'Non respect d\'un véhicule prioritaire',
                price = 500
            },
            ['infraction7'] = {
                reason = 'Conduite Hors route/hors piste',
                price = 500
            },
            ['infraction8'] = {
                reason = 'Non respect d\'un feu rouge (Stop & go)',
                price = 400
            },
            ['infraction9'] = {
                reason = 'Non respect d\'un stop',
                price = 600
            },
            ['infraction10'] = {
                reason = 'Conduite avec un véhicule non en état',
                price = 600
            },
            ['infraction11'] = {
                reason = 'Demi-tour non autorisé',
                price = 300
            },
            ['infraction12'] = {
                reason = 'Participation à une manifestation illégale',
                price = 2000
            },
            ['infraction13'] = {
                reason = 'Ivresse ou consommation de stupéfiants',
                price = 2000
            },
            ['infraction14'] = {
                reason = 'Excès de vitesse <5 km',
                price = 4000
            },
            ['infraction15'] = {
                reason = 'Excès de vitesse 5 -15k/h',
                price = 5000
            },
            ['infraction16'] = {
                reason = 'Atteinte à la pudeur',
                price = 5000
            },
            ['infraction17'] = {
                reason = 'Circulation à contresens',
                price = 5000
            },
            ['infraction18'] = {
                reason = 'Dépassement dangereux (Drift, Wheeling...)',
                price = 5000
            },
            ['infraction19'] = {
                reason = 'Violation de propriété privée (Entreprise,...)',
                price = 6000
            },
            ['infraction20'] = {
                reason = 'Entrave à la circulation',
                price = 6000
            },
            ['delitmineur1'] = {
                reason = 'Menace envers un civil',
                price = 10000
            },
            ['delitmineur2'] = {
                reason = 'Coup et blessures sur civil',
                price = 20000
            },
            ['delitmineur3'] = {
                reason = 'Dégradation de biens publics',
                price = 2000
            },
            ['delitmineur4'] = {
                reason = 'Trouble à l\'ordre publique',
                price = 4000
            },
            ['delitmineur5'] = {
                reason = 'Tentative de vol de véhicule',
                price = 14000
            },
            ['delitmineur6'] = {
                reason = 'Organisation d\'une manifestation illégale',
                price = 15000
            },
            ['delitmineur7'] = {
                reason = 'Mise en danger de la vie d\'autrui',
                price = 15000
            },
            ['delitmineur8'] = {
                reason = 'Outrage envers un représentant de l\'état',
                price = 20000
            },
            ['delitmineur9'] = {
                reason = 'Outrage à Magistrat(pendant un procès)',
                price = 40000
            },
            ['delitmineur10'] = {
                reason = 'Entrave à la cour et/ou jugement',
                price = 20000
            },
            ['delitmineur11'] = {
                reason = 'Chantage',
                price = 10000
            },
            ['delitmineur12'] = {
                reason = 'Menace et/ou intimidation envers un représentant de l\'état',
                price = 65000
            },
            ['delitmineur13'] = {
                reason = 'Coup et blessures sur agent publique',
                price = 100000
            },
            ['delitmineur14'] = {
                reason = 'Entrave à une opération des forces de l\'ordre',
                price = 50000
            },
            ['delitmineur15'] = {
                reason = 'Entrave aux opérations gouvernementales',
                price = 60000
            },
            ['delitmineur16'] = {
                reason = 'Arme blanche sortie en public',
                price = 25000
            },
            ['delitmineur17'] = {
                reason = 'Possessions de produits illégaux (<10)',
                price = 30000
            },
            ['delitmineur18'] = {
                reason = 'Excès de vitesse 15 -30 km/h',
                price = 15000
            },
            ['delitmineur19'] = {
                reason = 'Refus d\'obtempérer ',
                price = 22000
            },
            ['delitmineur20'] = {
                reason = 'Délit de fuite',
                price = 20000
            },
            ['delitmineur21'] = {
                reason = 'Conduite d\'un véhicule volé ',
                price = 20000
            },
            ['delitmineur22'] = {
                reason = 'Conduite sans permis',
                price = 25000
            },
            ['delitmineur23'] = {
                reason = 'Diffamation',
                price = 25000
            },
            ['delitmineur24'] = {
                reason = 'Utilisation et/ou présentation de faux',
                price = 30000
            },
            ['delitmineur25'] = {
                reason = 'Discrimination',
                price = 15000
            },
            ['delitmineur26'] = {
                reason = 'Atteinte au droit à l\'image',
                price = 10000
            },
            ['delitmineur27'] = {
                reason = 'Harcèlement',
                price = 15000
            },
            ['delitmineur28'] = {
                reason = 'Dissimulation du visage sur la voie publique',
                price = 20000
            },
            ['delitmineur29'] = {
                reason = 'Port d\'un gilet par balle',
                price = 30000
            },
            ['delitmineur30'] = {
                reason = 'Excès de vitesse >30 km/h',
                price = 20000
            },
            ['delitmajeur1'] = {
                reason = 'Arme létale sortie en public',
                price = 25000
            },
            ['delitmajeur2'] = {
                reason = 'Non paiement d\'un salaire ',
                price = 25000
            },
            ['delitmajeur3'] = {
                reason = 'Intrusions dans les locaux de l\'état',
                price = 30000
            },
            ['delitmajeur4'] = {
                reason = 'Association de malfaiteurs',
                price = 30000
            },
            ['delitmajeur5'] = {
                reason = 'Abus de pouvoir',
                price = 50000
            },
            ['delitmajeur6'] = {
                reason = 'Vol à main armée ',
                price = 30000
            },
            ['delitmajeur7'] = {
                reason = 'Fabrication de produit stupéfiant',
                price = 35000
            },
            ['delitmajeur8'] = {
                reason = 'Vol de véhicule ',
                price = 25000
            },
            ['delitmajeur9'] = {
                reason = 'Possession de produits illégaux (10 à 48)',
                price = 50000
            },
            ['delitmajeur10'] = {
                reason = 'Escroquerie à la personne',
                price = 50000
            },
            ['delitmajeur11'] = {
                reason = 'Vente illégale d\'armes (blanches, de poing )',
                price = 50000
            },
            ['delitmajeur12'] = {
                reason = 'Trafic de produits illégaux ( 49 et +)',
                price = 60000
            },
            ['delitmajeur13'] = {
                reason = 'Agression sur un civil',
                price = 35000
            },
            ['delitmajeur14'] = {
                reason = 'Agression sur un représentant de l\'état',
                price = 45000
            },
            ['delitmajeur15'] = {
                reason = 'Port d\'arme illégale défaut de license',
                price = 30000
            },
            ['delitmajeur16'] = {
                reason = 'Port d\'arme illégale',
                price = 35000
            },
            ['delitmajeur17'] = {
                reason = 'Utilisation/ port d\'équipement illégale',
                price = 35000
            },
            ['delitmajeur18'] = {
                reason = 'Parjure (Faux témoignage)',
                price = 40000
            },
            ['delitmajeur19'] = {
                reason = 'Escroquerie à l\'entreprise',
                price = 50000
            },
            ['delitmajeur20'] = {
                reason = 'Divulgation d\'informations confidentielles',
                price = 50000
            },
            ['delitmajeur21'] = {
                reason = 'Falcification de document officiel',
                price = 65000
            },
            ['delitmajeur22'] = {
                reason = 'Usurpation d\'identité',
                price = 55000
            },
            ['delitmajeur23'] = {
                reason = 'Usurpation d\'identité d\'un magistrat',
                price = 150000
            },
            ['delitmajeur24'] = {
                reason = 'Non respect d\'une mesure d\'éloignement ',
                price = 70000
            },
            ['delitmajeur25'] = {
                reason = 'Recidive d\'infraction après jugement <30 jours',
                price = 80000
            },
            ['delitmajeur26'] = {
                reason = 'Blanchiment d\'argent',
                price = 75000
            },
            ['delitmajeur27'] = {
                reason = 'Possession d\'argent sale',
                price = 50000
            },
            ['delitmajeur28'] = {
                reason = 'Corruption',
                price = 27000
            },
            ['delitmajeur29'] = {
                reason = 'Vente de produits illégaux',
                price = 30000
            },
            ['delitmajeur30'] = {
                reason = 'Braquage de superette',
                price = 55000
            },
            ['delitmajeur31'] = {
                reason = 'Entrave à une enquête judiciaire',
                price = 45000
            },
            ['delitmajeur33'] = {
                reason = 'Non respect d\'une décision de justice',
                price = 85000
            },
            ['crime1'] = {
                reason = 'Tentative de kidnapping / séquestration',
                price = 30000
            },
            ['crime2'] = {
                reason = 'Kidnapping / Séquestration',
                price = 50000
            },
            ['crime3'] = {
                reason = 'Complicité de tir',
                price = 50000
            },
            ['crime4'] = {
                reason = 'Complicité de meurtre',
                price = 75000
            },
            ['crime5'] = {
                reason = 'Prise d\'otage sur un civil',
                price = 65000
            },
            ['crime6'] = {
                reason = 'Prise d\'otage sur représentant de l\'état',
                price = 130000
            },
            ['crime7'] = {
                reason = 'Braquage de banque',
                price = 150000
            },
            ['crime8'] = {
                reason = 'Tentative d\'homicide sur Civil',
                price = 65000
            },
            ['crime9'] = {
                reason = 'Tentative d\'homicide sur représentant de l\'état',
                price = 80000
            },
            ['crime10'] = {
                reason = 'Tir sur civil',
                price = 80000
            },
            ['crime11'] = {
                reason = 'Tir sur agent de l\'état',
                price = 100000
            },
            ['crime12'] = {
                reason = 'Meurtre sur civil',
                price = 90000
            },
            ['crime13'] = {
                reason = 'Meurtre sur agent de l\'état',
                price = 200000
            },
            ['crime14'] = {
                reason = 'Tentative d\'évasion',
                price = 65000
            },
            ['crime15'] = {
                reason = 'Evasion',
                price = 85000
            },
            ['crime16'] = {
                reason = 'Incitation à la violence',
                price = 200000
            },
            ['crimefederal1'] = {
                reason = 'Incitation à la haine ',
                price = 200000
            },
            ['crimefederal2'] = {
                reason = 'Actes de barbarie ',
                price = 250000
            },
            ['crimefederal3'] = {
                reason = 'Usage illégal d\'un moyens d\'information légal ',
                price = 150000
            },
            ['crimefederal4'] = {
                reason = 'Usage d\'une entreprise à des fins illégales',
                price = 150000
            },
            ['crimefederal5'] = {
                reason = 'Trafic d\'arme (Plusieurs éléments)',
                price = 200000
            },
            ['crimefederal6'] = {
                reason = 'Organisation de malfaiteur',
                price = 250000
            },
            ['crimefederal7'] = {
                reason = 'Chef d\'une organisation criminelle',
                price = 500000
            },
            ['crimefederal8'] = {
                reason = 'Accès à des informations confidentielles',
                price = 100000
            },
            ['crimefederal9'] = {
                reason = 'Divulgation d\'informations confidentielles',
                price = 200000
            },
            ['crimefederal10'] = {
                reason = 'Coup d\'état',
                price = 450000
            },
            ['crimefederal11'] = {
                reason = 'Tentative d\'évasion fédérale',
                price = 250000
            },
            ['crimefederal12'] = {
                reason = 'Evasion fédérale',
                price = 350000
            },
            ['crimefederal13'] = {
                reason = 'Non respect des procédures pénales',
                price = 250000
            },
            ['crimefederal14'] = {
                reason = 'Intrusions dans les locaux fédérale',
                price = 150000
            },
            ['crimefederal15'] = {
                reason = 'Commission d\'actes ripoux',
                price = 500000
            }
        },
        Codes = {
            ['code1'] = {
                buttonName = 'Code 1',
                message = 'Répondez à votre radio'
            },
            ['code2'] = {
                buttonName = 'Code 2',
                message = 'Prioritaire - allez y sans sirène et respecter le code de la route'
            },
            ['code3'] = {
                buttonName = 'Code 3',
                message = 'Urgent - Répondre avec lumières et sirènes. Intervenir en sécurité en faisant attention aux intersections'
            },
            ['code4'] = {
                buttonName = 'Code 4',
                message = 'Aucune autre assistance nécessaire, situation stable'
            },
            ['code5'] = {
                buttonName = 'Code 5',
                message = 'En surveillance, autres unités doivent éviter le lieu'
            },
            ['code6'] = {
                buttonName = 'Code 6',
                message = 'Arrivé sur scène ou déjà occupé en intervention/investigation'
            },
            ['code7'] = {
                buttonName = 'Code 7',
                message = 'Charles : Idem, suspect dangereux (mandat), attente confirmation assistance'
            },
            ['code8'] = {
                buttonName = 'Code 8',
                message = 'Notifiez les médias ou soyez avisé que les médias sont sur les lieux'
            },
            ['code9'] = {
                buttonName = 'Code 9',
                message = 'Officier en danger, a besoin d’aide en urgence'
            },
            ['code10'] = {
                buttonName = 'Code 10',
                message = 'Unités en position pour intercepter suspect en fuite'
            },
            ['code11'] = {
                buttonName = 'Code 11',
                message = 'Requête pour déploiement fusil/carabine sur scène'
            }
        },
    }
}