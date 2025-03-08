Config = {}

Config.GiveBlackMoney = true -- donner de l'argent sale? S'il est désactivé, il donnera de l'argent propre à la place
Config.Text = {
    ["recolte"] = "",
    ["interact"] = "Interaction",
    ["traitement"] = "",
    ["vente"] = ""
}

Config.Param = {
    load = 0.0,
}

Config.Drogue = {
    RecolteCount = 1, --- Nombre d'item give lors de la récolte
    TraitementCount = 1, --- Nombre d'item give lors du traitement
    RecolteRemove = 1, --- Nombre d'item remove lors du traitement / nombre d'item qu'il faut pour traiter
    NumberForSell = 1, --- Nombre d'item qu'il faut pour vendre
    VenteCount = 1, --- Nombre d'item vendue lors de la vente
}


----------------------------
----------\/Weed/\----------
----------------------------
Config.Weed = {
    WeedRecolte = {
        vec3(1057.673828, -3201.006592, -39.093849)
    },
    WeedTraitement = {
        vector3(2193.44, 5595.38, 53.76)
    },
    WeedVente = {
        vector3(1903.0436, -3123.5901, -70.7859)
    },
    WeedRecolteItem = "weed", -- Item à récolter
    WeedRecolteItemLabel = "Weed", -- Label de l'item récolté
    WeedTraitementItem = "weed_pooch", --- nom de l'item a give lors de la récolte
    WeedTraitementItemLabel = "Pochon De Weed", --- Label de l'item give lors de la récolte
    WeedPriceForSell = 250 --- Prix de vente
}

-----------------------------
----------\/Opium/\----------
-----------------------------
Config.Opium = {
    OpiumRecolte = {
        vector3(-1146.66, 4940.67, 222.27)
    },
    OpiumTraitement = {
        vector3(-481.387, 6265.81, 13.63469)
    },
    OpiumVente = {
        vector3(1903.0436, -3123.5901, -70.7859)
    },
    OpiumRecolteItem = "opium", -- Item à récolter
    OpiumRecolteItemLabel = "Opium", -- Label de l'item récolté
    OpiumTraitementItem = "opium_pooch", --- nom de l'item a give lors de la récolte
    OpiumTraitementItemLabel = "Pochon D'opium", --- Label de l'item give lors de la récolte
    OpiumPriceForSell = 350 --- Prix de vente
}
----------------------------
----------\/Meth/\----------
----------------------------
Config.Meth = {
    MethRecolte = {
        vector3(831.35, -2333.34, 30.33)
    },
    MethTraitement = {
        vector3(1509.34, -2102.92, 76.61)
    },
    MethVente = {
        vector3(1903.0436, -3123.5901, -70.7859)
    },
    MethRecolteItem = "meth", -- Item à récolter
    MethRecolteItemLabel = "Methamphétamine", -- Label de l'item récolté
    MethTraitementItem = "meth_pooch", --- nom de l'item a give lors de la récolte
    MethTraitementItemLabel = "Pochon De Meth", --- Label de l'item give lors de la récolte
    MethPriceForSell = 450 --- Prix de vente
}