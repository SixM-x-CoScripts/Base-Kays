ConfigwGunFight = {

    NewEsx = false,
    OldEsx = true,
    Calif = false,

    DeclaCalif = '::{korioz#0110}::esx:getSharedObject',

    TexteGunFight = "Appuyez sur ~INPUT_CONTEXT~ pour faire du Gun Fight",

    OxInventory = false,

    FunctionRevive = function(source)
        TriggerClientEvent('wAdminV2:revivePlayer', source)
    end,

    infoBlip = {
        showBlip = true,
        Name = "~o~Activité ~s~| PaintBall",
        Sprite = 429,
        Display = 4,
        Scale = 0.65,
        Color = 1,
        Range = true, 
        blipsposition = {

            {pos =vector3(-1328.005, -237.7478, 42.70232)},

        },

        pedposition = {

            {name = "a_m_m_beach_01", pos = vector4(-1328.005, -237.7478, 42.70232-1, 304.04312133789)},

        },

    },

    TypeDeMap = {
        {Name = "~p~ThePit~s~", Value = 1},
        {Name = "~p~PaintBall~s~", Value = 2},
        {Name = "~p~Navire Militaire~s~", Value = 3},
    },

    SpawnSelectionThePit = {

        {pos= vector3(3491.5002441406, -1236.0198974609, 69.463264465332)},
        {pos= vector3(3507.3532714844, -1259.578125, 68.541816711426)},
        {pos= vector3(3507.9025878906, -1217.7528076172, 69.453956604004)},
        {pos= vector3(3469.7282714844, -1201.1724853516, 64.284286499023)},
        {pos= vector3(3459.2785644531, -1225.9963378906, 61.572006225586)},
        {pos= vector3(3469.853515625, -1251.1007080078, 64.281394958496)},
        {pos= vector3(3491.5727539062, -1225.2043457031, 69.458831787109)},

    },


    SpawnSelectionPaintBall = {

        {pos= vector3(-70.56, -1137.08, -1.44)},
        {pos= vector3(-64.82, -1125.44, -1.44)},
        {pos= vector3(-51.08, -1122.45, -1.44)},
        {pos= vector3(-39.84, -1129.2, -1.44)},
        {pos= vector3(-35.6, -1136.91, -1.44)},
        {pos= vector3(-55.56, -1141.9, -1.44)},
        {pos= vector3(-67.06, -1135.18, -1.44)},
        {pos= vector3(-62.27, -1117.09, -1.44)},

    },

    SpawnSelectionBaseMili = {

        {pos= vector3(3098.6462402344, -4801.7622070312, 2.0370709896088)},
        {pos= vector3(3098.3474121094, -4805.8330078125, 7.0283465385437)},
        {pos= vector3(3087.2092285156, -4804.7250976562, 7.0809636116028)},
        {pos= vector3(3060.466796875, -4748.6215820312, 6.0772500038147)},
        {pos= vector3(3054.7717285156, -4744.4594726562, 10.742149353027)},
        {pos= vector3(3079.4562988281, -4687.2548828125, 6.0772891044617)},
        {pos= vector3(3035.3889160156, -4689.2548828125, 6.0772905349731)},
        {pos= vector3(3031.0686035156, -4624.30078125, 6.0773072242737)},
        {pos= vector3(3070.6591796875, -4674.677734375, 10.742069244385)},

    },
}