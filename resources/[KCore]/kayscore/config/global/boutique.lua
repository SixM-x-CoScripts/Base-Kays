_G.BoutiqueConfig = BoutiqueConfig or {}

BoutiqueConfig['Voiture'] = {}

BoutiqueConfig['Case'] = {
    -- Caisse 
    {label = 'Caisse Fidélité', name = 'caisse_debutanat', price = 1500, rewards = {
        {label = 'SultanRS', name = 'sultanrss', type = 'vehicle', vehicle = "car", count = 1, chance = 2},
    }},

    {label = 'Caisse Ruby', name = 'caisse_ruby', price = 2000, rewards = {
        {label = 'Pistolet', name = 'WEAPON_PISTOL', type = 'weapon', count = 1, chance = 1},
    }},

    {label = 'Caisse Confirmé', name = 'caisse_confirme', price = 3000, rewards = {
        {label = 'Seat Ibiza', name = 'ibiza2022', type = 'vehicle', vehicle = "car", count = 1, chance = 3},
        {label = 'Rs6 2022', name = 'rs62', type = 'vehicle', vehicle = "car", count = 1, chance = 1},
        {label = 'Tesla', name = 'teslapd', type = 'vehicle', vehicle = "car", count = 1, chance = 2},
        {label = 'Dinghy', name = 'dinghy', type = 'vehicle', vehicle = "boat", count = 1, chance = 2},
        {label = '700 000$', name = 'money', type = 'money', count = 700000, chance = 3},
        {label = '500 000$', name = 'money', type = 'money', count = 500000, chance = 3},
        {label = '1 000 000$', name = 'money', type = 'money', count = 1000000, chance = 2},
        {label = 'Tec 9 MF', name = 'WEAPON_TEC9MF', type = 'weapon', count = 1, chance = 1},
        {label = '4000 Coins', name = 'coins', type = 'coins', count = 4000, chance = 1},
        {label = '2500 Coins', name = 'coins', type = 'coins', count = 2500, chance = 2},
        {label = '2000 Coins', name = 'coins', type = 'coins', count = 2000, chance = 3},
    }},

    {label = 'Caisse Diamant', name = 'caisse_diamant', price = 4000, rewards = {
        {label = 'Rs3 2022', name = 'rs322', type = 'vehicle', vehicle = "car", count = 1, chance = 3},
        {label = 'Mansory Bentley Bentayga', name = 'bentaygam', type = 'vehicle', vehicle = "car", count = 1, chance = 2},
        {label = 'M8 Mansory', name = 'mansm8', type = 'vehicle', vehicle = "car", count = 1, chance = 1},
        {label = 'Swift OR', name = 'swift2', type = 'vehicle', vehicle = "aircraft", count = 1, chance = 2},
        {label = '3000 Coins', name = 'coins', type = 'coins', count = 3000, chance = 3},
        {label = '2000 Coins', name = 'coins', type = 'coins', count = 2000, chance = 3},
        {label = '5000 Coins', name = 'coins', type = 'coins', count = 5000, chance = 1},
        {label = '1 000 000$', name = 'money', type = 'money', count = 1000000, chance = 3},
        {label = '1 500 000$', name = 'money', type = 'money', count = 1500000, chance = 2},
        {label = 'Predator', name = 'WEAPON_PREDATOR', type = 'weapon', count = 1, chance = 1},
        {label = 'SNS Pistol Mk II', name = 'weapon_snspistol_mk2', type = 'weapon', count = 1, chance = 2},
        {label = 'Couteau Wolf', name = 'WEAPON_WOLFKNIFE', type = 'weapon', count = 1, chance = 3},
    }},

    {label = 'Caisse Expert', name = 'caisse_expert', price = 5000, rewards = {
        {label = 'Lamborghini Si n', name = 'rmodsianr', type = 'vehicle', vehicle = "car", count = 1, chance = 1},
        {label = 'CLS 53', name = 'CLS53', type = 'vehicle', vehicle = "car", count = 1, chance = 2},
        {label = 'Rs7 Large', name = 'rs7c8wb', type = 'vehicle', vehicle = "car", count = 1, chance = 3},
        {label = 'M3 F80', name = 'm3f80', type = 'vehicle', vehicle = "car", count = 1, chance = 3},
        {label = 'Coachgun', name = 'WEAPON_COACHGUN', type = 'weapon', count = 1, chance = 1},
        {label = 'Mini-Scar-H', name = 'WEAPON_SCARSC', type = 'weapon', count = 1, chance = 2},
        {label = 'Oblivion', name = 'WEAPON_OBLIVION', type = 'weapon', count = 1, chance = 1},
        {label = '2 000 000$', name = 'money', type = 'money', count = 2000000, chance = 1},
        {label = '1 500 000$', name = 'money', type = 'money', count = 1500000, chance = 2},
        {label = '6000 Coins', name = 'coins', type = 'coins', count = 6000, chance = 1},
        {label = '4000 Coins', name = 'coins', type = 'coins', count = 4000, chance = 2},
        {label = '3000 Coins', name = 'coins', type = 'coins', count = 3000, chance = 3},
        {label = 'Sniper Dragon', name = 'WEAPON_BLACKSNIPER', type = 'weapon', count = 1, chance = 1},
        {label = 'Double Barrel', name = 'WEAPON_DOUBLEBARRELFM', type = 'weapon', count = 1, chance = 1},
        {label = 'Vestra', name = 'vestra', type = 'vehicle', vehicle = "aircraft", count = 1, chance = 3},
        {label = 'Volatus', name = 'volatus', type = 'vehicle', vehicle = "aircraft", count = 1, chance = 2},
    }},
}

BoutiqueConfig.weapons = {
     {price = 1000, name = 'WEAPON_PISTOL', label = 'Pistolet'},
}

BoutiqueConfig.Pack = {
    {
        price = 1000, 
        label = 'Pack Test', 
        infoLine = ('~p~Boutique de kayscore~s~'), 
        infosGauche = {'Description Entreprise', 'Avantage 1', 'Avantage 2', 'Avantage 3', 'Avantage 4'},
        infosDroite = {'Description Entreprise', 'Avantage 1', 'Avantage 2', 'Avantage 3', 'Avantage 4'},
    },
    {
        price = 500, 
        label = 'Pack Test2', 
        infoLine = ('~p~Boutique de kayscore~s~'), 
        infosGauche = {'Description Pack', 'Avantage 1', 'Avantage 2', 'Avantage 3', 'Avantage 4'},
        infosDroite = {'Pack', 'Avantage 1', 'Avantage 2', 'Avantage 3', 'Avantage 4'},
    },
    -- Ajoutez d'autres packs ici
}


BoutiqueConfigg = {}
BoutiqueConfigg.Vehicules = true --@Activer le bouton Véhicules dans la boutique
BoutiqueConfigg.Weaponss = true --@Activer le bouton Armes dans la boutique
BoutiqueConfigg.Caisses = true --@Activer le bouton Caisses Mystère dans la boutique
BoutiqueConfigg.Packs = true --@Activer le bouton Packs dans la boutique
BoutiqueConfigg.Fishing = true --@Activer le bouton Pêches dans la boutique
BoutiqueConfigg.Vip = true --@Activer le bouton VIP dans la boutique
BoutiqueConfigg.Cadeau = true --@Activer le bouton Récup mon cadeau dans la boutique
