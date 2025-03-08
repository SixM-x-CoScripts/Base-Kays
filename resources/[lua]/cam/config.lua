Config = {
    AcePerm = "AllowCam.Staff",--add_ace group.superadmin AllowCam.Staff allow (a mettre dans le cfg)

    AllowPlayerAndStaff = true,--Si vous voulez que les staff et joueurs on accès mettez en true (Na pas mettre dans le cfg : add_ace group.user AllowCam.Staff allow) (Pour eviter des bugs ou autre)
    MaxDistanceForPlayer = 8,

    MaxDistanceForStaff = 15,-- mettre en false si vous voulez que les staffs non pas de limite

    Bind = {
        Pivot1 = 38,
        Pivot2 = 44,
        Down = 36,
        UP = 21,
        Left = 34,
        Right = 35,
        Front = 32,
        Back = 33,
        SpeedBetter = 15,
        SpeedSlow = 16
    },

    Commande = {
        CommandeName = "cam",
        Desc = "Mode caméra",
        Bind = "F11"
    },

    MenuName = {
        ["Pivot1"] = "Pivoter à droite",
        ["Pivot2"] = "Pivoter à gauche",
        ["Down"] = "Descendre",
        ["UP"] = "Monter",
        ["Left"] = "Gauche",
        ["Right"] = "Droite",
        ["Front"] = "Avant",
        ["Back"] = "Arrière",
    },

    BindDisable = {13, 15, 16, 24, 45, 140, 80, 30, 31, 21, 36, 44, 38, 71, 72, 59, 60, 85, 86},

    Speed = {Default = 1.0, MaxSpeed = 3, MinSpeed = 0.2}
}