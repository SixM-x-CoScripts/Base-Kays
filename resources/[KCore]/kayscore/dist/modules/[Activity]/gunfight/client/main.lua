

KeyboardUtils = {isActive = false}

local CreationLobby = {}
local GestionMap = 1
local GestionJeux = 1
local GestionGamePlay = 1
local GestionTailleEquipe = 1
local CreationLobbyClient = {}
local isingame = false
local MapSelec = nil
local LicenceCreateur = nil 
local IdLobby = 0
IsDead = false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
    Wait(5000)
end)

KeyboardUtils = {isActive = false}

AddEventHandler("kbi:cancel",function() 
    KeyboardUtils.isActive = false
end)

function KeyboardUtils.use(title, cb)
    if tostring(title) == 'Taper Y pour confirmer' or tostring(title) == 'Taper Y pour valider' or tostring(title) == 'Voulez vous supprimer les reports du staff'  then
        local alert = lib.alertDialog({
            header = 'Informations',
            content = title,
            centered = true,
            cancel = true
        })

        if alert == "confirm" then
            cb("y")
        else
            -- Pas de callback si annulé
        end
    else
        local input = lib.inputDialog(title, {''})
        if input then
            cb(input[1])
        else
            -- Pas de callback si annulé
        end
    end
end

CreateThread(function()
    if ConfigwGunFight.infoBlip.showBlip then
        for k,v in pairs(ConfigwGunFight.infoBlip.blipsposition) do
            local blip = AddBlipForCoord(v.pos)
            SetBlipSprite(blip, ConfigwGunFight.infoBlip.Sprite)
            SetBlipDisplay(blip, ConfigwGunFight.infoBlip.Display)
            SetBlipScale(blip, ConfigwGunFight.infoBlip.Scale)
            SetBlipColour(blip, ConfigwGunFight.infoBlip.Color)
            SetBlipAsShortRange(blip, ConfigwGunFight.infoBlip.Range)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(ConfigwGunFight.infoBlip.Name)
            EndTextCommandSetBlipName(blip)                    
        end
    end

    for k,v in pairs (ConfigwGunFight.infoBlip.pedposition) do
        local hash = GetHashKey(v.name)
        while not HasModelLoaded(hash) do
            RequestModel(hash)
            Wait(20)
        end
        ped = CreatePed("PED_TYPE_CIVFEMALE", v.name, v.pos, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)
    end
end)

local ThePit = PolyZone:Create({
    vector2(3449.4099121094, -1180.0379638672),
    vector2(3448.923828125, -1273.1726074219),
    vector2(3523.2531738281, -1274.12109375),
    vector2(3527.5402832031, -1179.8901367188)
}, {
    name="thepit",
    minZ = 55.534744262695,
    maxZ = 75.927299499512
})

local insideThePit = false
ThePit:onPlayerInOut(function(isPointInside, point)
    insideThePit = isPointInside
end)

local PaintBall = PolyZone:Create({
    vector2(-67.440765380859, -1114.6978759766),
    vector2(-73.00910949707, -1137.8155517578),
    vector2(-38.296604156494, -1152.7124023438),
    vector2(-29.376373291016, -1127.4291992188)
}, {
    name="paintball",
    minZ = -5.0386843681335,
    maxZ = 10.144672870636
})
local insidePaintBall = false
PaintBall:onPlayerInOut(function(isPointInside, point)
    insidePaintBall = isPointInside
end)

local BaseMili = PolyZone:Create({
    vector2(3014.6850585938, -4501.953125),
    vector2(3017.0212402344, -4508.0263671875),
    vector2(3020.5495605469, -4507.5815429688),
    vector2(3045.0771484375, -4572.8940429688),
    vector2(3059.4736328125, -4576.9111328125),
    vector2(3060.8969726563, -4582.029296875),
    vector2(3059.4702148438, -4583.8852539063),
    vector2(3062.2451171875, -4588.6049804688),
    vector2(3073.6357421875, -4592.0190429688),
    vector2(3079.8776855469, -4614.9633789063),
    vector2(3078.6853027344, -4615.52734375),
    vector2(3080.2514648438, -4621.0776367188),
    vector2(3082.9929199219, -4620.7368164063),
    vector2(3083.2053222656, -4624.7548828125),
    vector2(3087.404296875, -4623.0649414063),
    vector2(3090.4865722656, -4622.15625),
    vector2(3091.0705566406, -4625.4375),
    vector2(3087.7407226563, -4626.2319335938),
    vector2(3084.2465820313, -4626.6015625),
    vector2(3085.2282714844, -4630.037109375),
    vector2(3092.0439453125, -4656.7319335938),
    vector2(3130.4858398438, -4800.623046875),
    vector2(3123.2934570313, -4804.8198242188),
    vector2(3124.4045410156, -4813.0068359375),
    vector2(3122.6853027344, -4816.9052734375),
    vector2(3118.236328125, -4818.82421875),
    vector2(3118.5251464844, -4820.8310546875),
    vector2(3096.22265625, -4831.611328125),
    vector2(3095.2336425781, -4829.7426757813),
    vector2(3080.5109863281, -4833.73046875),
    vector2(3077.0637207031, -4830.5434570313),
    vector2(3075.4072265625, -4828.40625),
    vector2(3057.8129882813, -4826.4086914063),
    vector2(3045.1169433594, -4780.3461914063),
    vector2(3039.6545410156, -4771.5405273438),
    vector2(3035.6831054688, -4772.9868164063),
    vector2(3032.6706542969, -4773.9995117188),
    vector2(3031.9035644531, -4770.6840820313),
    vector2(3035.0676269531, -4770.1118164063),
    vector2(3039.2680664063, -4768.955078125),
    vector2(3019.9536132813, -4697.5541992188),
    vector2(3015.5, -4697.0278320313),
    vector2(3012.8706054688, -4698.6225585938),
    vector2(3012.05859375, -4694.8627929688),
    vector2(3015.2915039063, -4694.2822265625),
    vector2(3018.3581542969, -4693.8125),
    vector2(3014.4445800781, -4677.0825195313),
    vector2(3012.6342773438, -4658.392578125),
    vector2(3011.3696289063, -4653.2739257813),
    vector2(2990.3120117188, -4607.888671875),
    vector2(2990.6105957031, -4605.134765625),
    vector2(3012.7138671875, -4595.2548828125),
    vector2(2999.48046875, -4513.1806640625),
    vector2(3002.9926757813, -4511.9536132813),
    vector2(3001.6042480469, -4505.3891601563),
    vector2(3003.5859375, -4504.8540039063),
    vector2(3005.9597167969, -4511.58984375),
    vector2(3014.3505859375, -4508.9360351563),
    vector2(3013.1630859375, -4502.1645507813)
}, {
    name="bite2",
    minZ = -16.549530506134,
    maxZ = 54.503907203674
})
local insideBaseMili = false
BaseMili:onPlayerInOut(function(isPointInside, point)
    insideBaseMili = isPointInside
end)

AddEventHandler('esx:onPlayerDeath', function(data)
    Wait(3000)

    local playerPed = PlayerPedId()
    if isingame then
        isingame = false
        TriggerServerEvent('wGunFight:mort', isingame)
        TriggerServerEvent("wGunFight:ReturnBucket")
        Wait(1000)
    end
end)

OpenMenuGunFight = function()
    local open = false 
    local OpenMenuGunFight = RageUI.CreateMenu("", "Que voulez-vous faire ?", 0,80)
    local OpenMenuGunFight2 = RageUI.CreateSubMenu(OpenMenuGunFight, "", "Que voulez-vous faire ?")
    local OpenMenuGunFight3 = RageUI.CreateSubMenu(OpenMenuGunFight, "", "Que voulez-vous faire ?")
    local OpenMenuGunFight4 = RageUI.CreateSubMenu(OpenMenuGunFight3, "", "Que voulez-vous faire ?")

    OpenMenuGunFight.Closed = function()
        open = false 
        FreezeEntityPosition(PlayerPedId(), false)
    end

    if open then 
        open = false
        FreezeEntityPosition(PlayerPedId(), false)
        RageUI.Visible(OpenMenuGunFight, false)
        return
    else
        open = true
        FreezeEntityPosition(PlayerPedId(), true)
        RageUI.Visible(OpenMenuGunFight, true)
        CreateThread(function()
            while open do
                RageUI.IsVisible(OpenMenuGunFight, function()
                    RageUI.Line()

                    RageUI.Button("Créer une partie", nil, {RightLabel = "~p~→→"}, true, {}, OpenMenuGunFight2)

                    RageUI.Button("Rejoindre une partie", nil, {RightLabel = "~p~→→"}, true, {
                        onSelected = function()
                            ESX.TriggerServerCallback('wGunFight:CallBackGun', function(CreationLobbyServeur) 
                                CreationLobbyClient = CreationLobbyServeur
                            end)
                            Wait(1)
                        end
                    }, OpenMenuGunFight3)
                end)

                RageUI.IsVisible(OpenMenuGunFight3, function()
                    RageUI.Line()

                    if json.encode(CreationLobbyClient) == "[]" then 
                        RageUI.Separator("~p~Aucune Partie")
                        RageUI.Line()
                    else
                        for k,v in pairs(CreationLobbyClient) do 
                            RageUI.Button("Lobby : "..v.NomLobby, nil, {RightLabel = "~p~→→"}, true, {
                                onActive = function()
                                    RageUI.Info("Infos Lobby ", {"Créer par :","Map : ", "Typê de Jeux : ", "Combattant"}, {"~p~"..v.Createur, "~p~" .. v.Map, "~p~ Armageddon", "~p~"..v.NombreJoueur})
                                end,
                                onSelected = function()
                                    IdLobby = v.Id
                                    LicenceCreateur = v.LicenceCreateur
                                    TypeJeux = v.Type
                                    NombreEquipe = v.TailleEquipe
                                    MapSelec = v.Map
                                    JeuxSelec = v.Jeux
                                end
                            }, OpenMenuGunFight4)
                        end
                    end
                end)

                RageUI.IsVisible(OpenMenuGunFight4, function()
                    RageUI.Line()

                    RageUI.Button("Rejoindre La Partie", nil, {RightLabel = "~p~→→"}, true, {
                        onSelected = function()
                            FreezeEntityPosition(PlayerPedId(), false)
                            TriggerServerEvent('wGunFight:RejoindreLobby', IdLobby , MapSelec)
                            RageUI.CloseAll()
                            open = false
                        end
                    })
                end)

                RageUI.IsVisible(OpenMenuGunFight2, function()
                    RageUI.Line()

                    RageUI.Button("Nom Du Lobby", nil, {RightLabel = CreationLobby.Name}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Nom Du Lobby', function(data)
                                if data ~= nil and data ~= '' then
                                    CreationLobby.Name = data
                                else
                                    ESX.ShowNotification("Vous devez mettre un nom de Lobby !")
                                end
                            end)
                        end
                    })

                    RageUI.List("Map ", ConfigwGunFight.TypeDeMap, GestionMap, nil, {}, true, {
                        onListChange = function(Index, Item)
                            GestionMap = Index
                        end,
                        onSelected = function(Index, Item)
                            CreationLobby.Maps = Item.Name
                        end
                    })

                    RageUI.Line()

                    RageUI.Button("Valider", nil, {RightLabel = "~p~→→"}, true, {
                        onSelected = function()
                            if CreationLobby.Name ~= nil then 
                                if CreationLobby.Maps ~= nil then 
                                    TriggerServerEvent("wGunFight:CreationLoby", CreationLobby)
                                    Wait(100)
                                    CreationLobby = {}
                                    RageUI.GoBack()
                                else
                                    ESX.ShowNotification("Il faut définir une Map au Lobby !")
                                end
                            else
                                ESX.ShowNotification("Il faut définir un nom au Lobby !")
                            end
                        end
                    })

                    RageUI.Button("Annuler", nil, {RightLabel = "~p~→→"}, true, {
                        onSelected = function()
                            CreationLobby = {}
                            RageUI.CloseAll()
                        end
                    })
                end)

                Wait(0)
            end
        end)
    end
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

CreateThread(function()
    while true do 
        local interval = 750
        local playerPos = GetEntityCoords(PlayerPedId())
        for k,v in pairs(ConfigwGunFight.infoBlip.blipsposition) do
            local dist = #(v.pos-playerPos)
            if dist <= 2.2 then
                interval = 0
                ESX.ShowHelpNotification(ConfigwGunFight.TexteGunFight)
                if IsControlJustPressed(0, 51) then
                    OpenMenuGunFight()
                end
            end
        end

        if isingame and MapSelec == "~p~ThePit~s~" then 
            if not insideThePit then 
                local FuturCoordsIndex4 = math.random(#ConfigwGunFight.SpawnSelectionThePit)
                local FuturCoords4 = ConfigwGunFight.SpawnSelectionThePit[FuturCoordsIndex4].pos
                SetEntityCoords(PlayerPedId(), FuturCoords4)
            end
        elseif isingame and MapSelec == "~p~PaintBall~s~" then 
            if not insidePaintBall then 
                local FuturCoordsIndex5 = math.random(#ConfigwGunFight.SpawnSelectionPaintBall)
                local FuturCoords5 = ConfigwGunFight.SpawnSelectionPaintBall[FuturCoordsIndex5].pos
                SetEntityCoords(PlayerPedId(), FuturCoords5)
            end
        elseif isingame and MapSelec == "~p~Navire Militaire~s~" then 
            if not insideBaseMili then 
                local FuturCoordsIndex7 = math.random(#ConfigwGunFight.SpawnSelectionBaseMili)
                local FuturCoords7 = ConfigwGunFight.SpawnSelectionBaseMili[FuturCoordsIndex7].pos
                SetEntityCoords(PlayerPedId(), FuturCoords7)
            end
        end

        Wait(interval)
    end
end)

RegisterNetEvent('wGunFight:SelectionArme')
AddEventHandler('wGunFight:SelectionArme',function(IdLobby, MapSelec)
    isingame = true 
    FreezeEntityPosition(PlayerPedId(), false)

    if MapSelec == "~p~ThePit~s~" then 
        local FuturCoordsIndex3 = math.random(#ConfigwGunFight.SpawnSelectionThePit)
        local FuturCoords3 = ConfigwGunFight.SpawnSelectionThePit[FuturCoordsIndex3].pos
        SetEntityCoords(PlayerPedId(), FuturCoords3)
    elseif MapSelec == "~p~PaintBall~s~" then 
        local FuturCoordsIndex6 = math.random(#ConfigwGunFight.SpawnSelectionPaintBall)
        local FuturCoords6 = ConfigwGunFight.SpawnSelectionPaintBall[FuturCoordsIndex6].pos
        SetEntityCoords(PlayerPedId(), FuturCoords6)
    elseif MapSelec == "~p~Navire Militaire~s~" then 
        local FuturCoordsIndex8 = math.random(#ConfigwGunFight.SpawnSelectionBaseMili)
        local FuturCoords8 = ConfigwGunFight.SpawnSelectionBaseMili[FuturCoordsIndex8].pos
        SetEntityCoords(PlayerPedId(), FuturCoords8)
    end

    local playerPed = PlayerPedId()
    local allWeapons = {
        "weapon_dagger", "weapon_bat", "weapon_bottle", "weapon_crowbar", "weapon_unarmed",
        "weapon_flashlight", "weapon_golfclub", "weapon_hammer", "weapon_hatchet", "weapon_knuckle",
        "weapon_knife", "weapon_machete", "weapon_switchblade", "weapon_nightstick", "weapon_wrench",
        "weapon_battleaxe", "weapon_poolcue", "weapon_stone_hatchet", "weapon_pistol", "weapon_pistol_mk2",
        "weapon_combatpistol", "weapon_appistol", "weapon_stungun", "weapon_pistol50", "weapon_snspistol",
        "weapon_snspistol_mk2", "weapon_heavypistol", "weapon_vintagepistol", "weapon_flaregun",
        "weapon_marksmanpistol", "weapon_revolver", "weapon_revolver_mk2", "weapon_doubleaction",
        "weapon_raypistol", "weapon_ceramicpistol", "weapon_navyrevolver", "weapon_gadgetpistol",
        "weapon_microsmg", "weapon_smg", "weapon_smg_mk2", "weapon_assaultsmg", "weapon_combatpdw",
        "weapon_machinepistol", "weapon_minismg", "weapon_raycarbine", "weapon_pumpshotgun",
        "weapon_pumpshotgun_mk2", "weapon_sawnoffshotgun", "weapon_assaultshotgun", "weapon_bullpupshotgun",
        "weapon_musket", "weapon_heavyshotgun", "weapon_dbshotgun", "weapon_autoshotgun", "weapon_assaultrifle",
        "weapon_assaultrifle_mk2", "weapon_carbinerifle", "weapon_carbinerifle_mk2", "weapon_advancedrifle",
        "weapon_specialcarbine", "weapon_specialcarbine_mk2", "weapon_bullpuprifle", "weapon_bullpuprifle_mk2",
        "weapon_compactrifle", "weapon_militaryrifle", "weapon_heavyrifle", "weapon_tacticalrifle",
        "weapon_mg", "weapon_combatmg", "weapon_combatmg_mk2", "weapon_gusenberg", "weapon_sniperrifle",
        "weapon_heavysniper", "weapon_heavysniper_mk2", "weapon_marksmanrifle", "weapon_marksmanrifle_mk2",
        "weapon_rpg", "weapon_grenadelauncher", "weapon_grenadelauncher_smoke", "weapon_minigun",
        "weapon_firework", "weapon_railgun", "weapon_hominglauncher", "weapon_compactlauncher",
        "weapon_rayminigun", "weapon_grenade", "weapon_bzgas", "weapon_molotov", "weapon_stickybomb",
        "weapon_proxmine", "weapon_snowball", "weapon_pipebomb", "weapon_ball", "weapon_smokegrenade",
        "weapon_flare", "weapon_petrolcan", "gadget_parachute", "weapon_fireextinguisher","weapon_hkump","weapon_mcxspear",
        "weapon_G17GEN5", "weapon_scar17fm","weapon_katana", "weapon_honeybadgercod", "weapon_fn509","weapon_fireaxe", "weapon_glitchpopvandal",
        "weapon_DOUBLEBARREL", "weapon_M6IC", "weapon_victusxmr", "weapon_ak47neonride", "weapon_awpredline",
    }

    for _, weapon in ipairs(allWeapons) do
        local weaponHash = GetHashKey(weapon)
        if HasPedGotWeapon(playerPed, weaponHash, false) then
            SetPedInfiniteAmmo(playerPed, true, weaponHash)
        end
    end
    return
end)

RegisterNetEvent('GunFight:revivePlayer')
AddEventHandler('GunFight:revivePlayer', function()
    local playerPed = PlayerPedId()
    TriggerEvent('uniq-deathscreen:client:hide_ui')
    local coords = GetEntityCoords(playerPed)
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, GetEntityHeading(playerPed), true, false)
    SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
    FreezeEntityPosition(playerPed, false)
    TriggerEvent('wGunFight:SelectionArme',IdLobby, MapSelec)
    TriggerServerEvent('wGunFight:RejoindreLobby',IdLobby , MapSelec)
end)

RegisterNetEvent('samesoule')
AddEventHandler('samesoule',function()
    OpenMenuLeave()
end)

OpenMenuLeave = function(IdLobby)
    local open2 = false 
    local OpenMenuLeave = RageUI.CreateMenu("", "Que voulez-vous faire ?", 0,80)

    OpenMenuLeave.Closed = function()
        open2 = false 
    end

    if open2 == true then 
        open2 = false
        RageUI.Visible(OpenMenuLeave, false)
        return
    else
        open2 = true
        Wait(1000)
        FreezeEntityPosition(PlayerPedId(), true)
        RageUI.Visible(OpenMenuLeave, true)
        CreateThread(function()
            while open2 do
                RageUI.IsVisible(OpenMenuLeave, function()
                    RageUI.Line()

                    RageUI.Button("Quitter Le Lobby", nil, {RightLabel = "~p~→→"}, true, {
                        onSelected = function()
                            local playerPed = PlayerPedId()
                            local allWeapons = {
                                "weapon_dagger", "weapon_bat", "weapon_bottle", "weapon_crowbar", "weapon_unarmed",
                                "weapon_flashlight", "weapon_golfclub", "weapon_hammer", "weapon_hatchet", "weapon_knuckle",
                                "weapon_knife", "weapon_machete", "weapon_switchblade", "weapon_nightstick", "weapon_wrench",
                                "weapon_battleaxe", "weapon_poolcue", "weapon_stone_hatchet", "weapon_pistol", "weapon_pistol_mk2",
                                "weapon_combatpistol", "weapon_appistol", "weapon_stungun", "weapon_pistol50", "weapon_snspistol",
                                "weapon_snspistol_mk2", "weapon_heavypistol", "weapon_vintagepistol", "weapon_flaregun",
                                "weapon_marksmanpistol", "weapon_revolver", "weapon_revolver_mk2", "weapon_doubleaction",
                                "weapon_raypistol", "weapon_ceramicpistol", "weapon_navyrevolver", "weapon_gadgetpistol",
                                "weapon_microsmg", "weapon_smg", "weapon_smg_mk2", "weapon_assaultsmg", "weapon_combatpdw",
                                "weapon_machinepistol", "weapon_minismg", "weapon_raycarbine", "weapon_pumpshotgun",
                                "weapon_pumpshotgun_mk2", "weapon_sawnoffshotgun", "weapon_assaultshotgun", "weapon_bullpupshotgun",
                                "weapon_musket", "weapon_heavyshotgun", "weapon_dbshotgun", "weapon_autoshotgun", "weapon_assaultrifle",
                                "weapon_assaultrifle_mk2", "weapon_carbinerifle", "weapon_carbinerifle_mk2", "weapon_advancedrifle",
                                "weapon_specialcarbine", "weapon_specialcarbine_mk2", "weapon_bullpuprifle", "weapon_bullpuprifle_mk2",
                                "weapon_compactrifle", "weapon_militaryrifle", "weapon_heavyrifle", "weapon_tacticalrifle",
                                "weapon_mg", "weapon_combatmg", "weapon_combatmg_mk2", "weapon_gusenberg", "weapon_sniperrifle",
                                "weapon_heavysniper", "weapon_heavysniper_mk2", "weapon_marksmanrifle", "weapon_marksmanrifle_mk2",
                                "weapon_rpg", "weapon_grenadelauncher", "weapon_grenadelauncher_smoke", "weapon_minigun",
                                "weapon_firework", "weapon_railgun", "weapon_hominglauncher", "weapon_compactlauncher",
                                "weapon_rayminigun", "weapon_grenade", "weapon_bzgas", "weapon_molotov", "weapon_stickybomb",
                                "weapon_proxmine", "weapon_snowball", "weapon_pipebomb", "weapon_ball", "weapon_smokegrenade",
                                "weapon_flare", "weapon_petrolcan", "gadget_parachute", "weapon_fireextinguisher","weapon_hkump","weapon_mcxspear",
                                "weapon_G17GEN5", "weapon_scar17fm","weapon_katana", "weapon_honeybadgercod", "weapon_fn509","weapon_fireaxe", "weapon_glitchpopvandal",
                                "weapon_DOUBLEBARREL", "weapon_M6IC", "weapon_victusxmr", "weapon_ak47neonride", "weapon_awpredline",
                            }

                            for _, weapon in ipairs(allWeapons) do
                                local weaponHash = GetHashKey(weapon)
                                if HasPedGotWeapon(playerPed, weaponHash, false) then
                                    SetPedInfiniteAmmo(playerPed, false, weaponHash)
                                end
                            end

                            FreezeEntityPosition(PlayerPedId(), false)
                            TriggerServerEvent('wGunFight:QuitterLobby')
                            MapSelec = nil 
                            IdLobby = 0
                            isingame = false
                            RageUI.CloseAll()
                            open2 = false
                        end
                    })
                end)
                Wait(0)
            end
        end)
    end
end
