
adminManagement = {
    Service = false,
    LockSearch = true,
    -- Options Personnel
    NoClip = false,
    Gamertags = false,
    MyName = false,
    SuppInfo = false,
    Blips = false,
    InfoReports = false,
    SongReports = false,
    isSpectateMod = false,
    object = false,
    gunInfos = false,
    objectFilter = nil,
    objectFilterUniqueId = false,
    -- Vehicles
    FreezeUnFreeze = false,
    territories = {},
    territoriesDrugs = {},
    territoriesShop = {},
    -- Players
    Players = {},
    PlayersCount = 0,
    SearchPlayer = nil,
    ZoneShow = false,
    staffList = {},
    staffsCounts = 0,
    SelectedPlayer = {},
    FreezeUnfreeze = false,
    accounts = {},
    AddJobList = {},
    AddGradeListWithJob = {},
    AddSearchJob = nil,
    SelectedPlayerJobList = {},
    searchStaff = nil,
    gestion_staff = {
        data = {},
        best = {},
    },
    SelectedJobType = 1,
    WarnList = {},
    WarnListSearch = nil,
    jobsData = {},
    -- Reports
    Reports = {},
    ReportsInfo = false,
    MyReports = 0,
    ReportsCount = 0,
    SelectedReport = {},
    Filters = false,
    FiltersList = {'Tous', 'Pris en charge', 'Non pris en charge'},
    FiltersListIndex = 1,

    -- Server
    DealerShipVehicles = {},
    DealerShipCategories = {},
    DealerShipCategoriesSelect = nil,
    SearchVehicle = nil,
    SearchVehicleCategorie = nil,
    EditCategorieType = nil,
    EditCategorieTypeList = {},
    DealerShipAddVehicleAddParentCategory = {
        name = nil,
        label = nil
    },
    DealerShipAddVehicle = {
        spawnName = nil,
        label = nil,
        price = nil,
        categorie = nil
    },
    DealerShipEditVehicle = {
        name = nil,
    },
    JobList = {},
    GradeList = {},
    ItemsList = {},
    SellingList = {},
    CreateDrugs = {
        Laboratory = {
            active = false,
            list = {
                ['weed_laboratory'] = {
                    name = 'weed_laboratory',
                    label = 'Laboratoire de Weed',
                    active = false,
                    exit = vector3(1066.15, -3183.38, -40.15),
                    exitHeading = 90.0,
                    interiorAtCoords = vector3(1051.491, -3196.536, -39.14842),
                    management = vector3(1044.605, -3194.886, -38.15789),
                    ipls = true,
                    iplsList = {
                        'weed_drying',
                        'weed_production',
                        'weed_set_up',
                        'weed_standard_equip',
                        'weed_upgrade_equip',
                        'weed_growtha_stage1',
                        'weed_growtha_stage2',
                        'weed_growtha_stage3',
                        'weed_growthb_stage1',
                        'weed_growthb_stage2',
                        'weed_growthb_stage3',
                        'weed_growthc_stage1',
                        'weed_growthc_stage2',
                        'weed_growthc_stage3',
                        'weed_growthd_stage1',
                        'weed_growthd_stage2',
                        'weed_growthd_stage3',
                        'weed_growthe_stage1',
                        'weed_growthe_stage2',
                        'weed_growthe_stage3',
                        'weed_growthf_stage1',
                        'weed_growthf_stage2',
                        'weed_growthf_stage3',
                        'weed_growthg_stage1',
                        'weed_growthg_stage2',
                        'weed_growthg_stage3',
                        'weed_growthh_stage1',
                        'weed_growthh_stage2',
                        'weed_growthh_stage3',
                        'weed_growthi_stage1',
                        'weed_growthi_stage2',
                        'weed_growthi_stage3',
                        'weed_hosea',
                        'weed_hoseb',
                        'weed_hosec',
                        'weed_hosed',
                        'weed_hosee',
                        'weed_hosef',
                        'weed_hoseg',
                        'weed_hoseh',
                        'weed_hosei',
                        'light_growtha_stage23_standard',
                        'light_growthb_stage23_standard',
                        'light_growthc_stage23_standard',
                        'light_growthd_stage23_standard',
                        'light_growthe_stage23_standard',
                        'light_growthf_stage23_standard',
                        'light_growthg_stage23_standard',
                        'light_growthh_stage23_standard',
                        'light_growthi_stage23_standard',
                        'light_growtha_stage23_upgrade',
                        'light_growthb_stage23_upgrade',
                        'light_growthc_stage23_upgrade',
                        'light_growthc_stage23_upgrade',
                        'light_growthd_stage23_upgrade',
                        'light_growthe_stage23_upgrade',
                        'light_growthf_stage23_upgrade',
                        'light_growthg_stage23_upgrade',
                        'light_growthh_stage23_upgrade',
                        'light_growthi_stage23_upgrade',
                        'weed_low_security',
                        'weed_security_upgrade',
                        'weed_chairs'
                    },
                },
                ['coke_laboratory'] = {
                    name = 'coke_laboratory',
                    label = 'Laboratoire de Coke',
                    active = false,
                    exit = vector3(1066.15, -3183.38, -40.15),
                    exitHeading = 90.0,
                    interiorAtCoords = vector3(1051.491, -3196.536, -39.14842),
                    ipls = false,
                },
                ['meth_laboratory'] = {
                    name = 'meth_laboratory',
                    label = 'Laboratoire de Meth',
                    active = false,
                    exit = vector3(1066.15, -3183.38, -40.15),
                    exitHeading = 90.0,
                    interiorAtCoords = vector3(1051.491, -3196.536, -39.14842),
                    ipls = false,
                },
            },
            Index = 1
        }
    },
    SelectedDrugs = {},
    SelectedDrugsCategorie = 'recolte',

    -- Society
    SelectedSociety = {},
    SelectedSocietyZoneTeleport = {'Blips', 'Coffre', 'Boss'},
    SelectedSocietyZoneTeleportIndex = 1,
    SelectedSocietyGrade = {},

    -- ID Unique
    UniqueIDSearch = {},
    UniqueIDSearchBoutiqueHistory = {},
    UniqueIDSearchBoutiqueHistorySearch = nil,
    WeaponSearch = nil,
    SelectedWeapon = {},
    UniqueIDPlayerInventoryWeaponSelectK = nil,

    -- Utils
    LastPlayerPos = {},

    -- Events
    EventPos = true,
    EventPosList = {'Maze Bank Arena (Scene Fashion)', 'Maze Bank Arena (Plafond Milieux)'},
    EventPosListIndex = 1,
    EventPosListData = {
        [1] = {
            pos = vector3(-329.3486328125, -1970.4323730469, 21.603454589844),
            pos2 = vector3(-325.30215454102, -1973.9567871094, 21.603446960449)
        },
        [2] = {
            pos = vector3(-323.94323730469, -1968.1636962891, 36.276332855225)
        },
    },

    -- EventFireWorksData
    EventFireWorksDef = true,
    EventPosListFireWorks = {'Fontaine de feux', 'Explosion de feux', 'Explosion étoile blanche'},
    EventPosListFireWorskIndex = 1,
    TimeFireWorks = 0,
    EventFireWorksNotDef = nil,
    EventFireWorksNotZoneDef = {},

    -- give vehicle
    vehicleModel = nil,
    vehicleLabel = nil,
    vehicleType = nil,
    vehicleBoutique = false,
    vehicleData = {},
    searchGarage = nil,
    garageSelected = {active = false, garageid = 1},
    vehicleGarageid = 1,

    -- sanctions
    jails = {},
}
local objectIndex = 1
local objectsFormatted = WorldProps.list
local objectCategories = { "Mobilier" }
function sortGroupTable(t)
    local sorted = {}
    for k, v in pairs(t) do
        sorted[#sorted + 1] = v
    end
    table.sort(sorted, function(a, b)
        return a.id < b.id
    end)
    return (sorted)
end

function adminManagement:SetCoords(player, coords)
    SetEntityCoords(player, coords)
end

secured_RegisterNetEvent('kayscore:admin:addReport', function(a, data, value)
    adminManagement.Reports = data

    if value == 'new' then
        adminManagement.ReportsCount = 0
        
        for k,v in pairs(adminManagement.Reports) do
            adminManagement.ReportsCount = adminManagement.ReportsCount + 1
        end
        
        if adminManagement.SongReports then
            secured_TriggerEvent('InteractSound_CL:PlayOnOne', 'tutu', 0.5)
        end
    end
end)

secured_RegisterNetEvent('kayscore:reports:refreh:service', function(reportList)
    adminManagement.Reports = reportList

    for k,v in pairs(adminManagement.Reports) do
        adminManagement.ReportsCount = adminManagement.ReportsCount + 1
    end
end)

secured_RegisterNetEvent('kayscore:admin:removeReport', function(v, k, data, value)
    adminManagement.Reports = data
    adminManagement.ReportsCount = 0

    for k,v in pairs(adminManagement.Reports) do
        adminManagement.ReportsCount = adminManagement.ReportsCount + 1
    end
end)

secured_RegisterNetEvent('kayscore:admin:addPlayer', function(data)
    adminManagement.Players = data
    adminManagement.PlayersCount = 0

    for k,v in pairs(adminManagement.Players) do
        adminManagement.PlayersCount = adminManagement.PlayersCount + 1
    end
end)

secured_RegisterNetEvent('kayscore:admin:addStaff', function(data)
    adminManagement.staffList = data
    adminManagement.staffsCounts = 0

    for k,v in pairs(adminManagement.staffList) do
        adminManagement.staffsCounts = adminManagement.staffsCounts + 1
    end
end)

secured_RegisterNetEvent('kayscore:admin:addStaff:service', function(id, newVal)
    adminManagement.staffList[id].service = newVal
end)

secured_RegisterNetEvent('kayscore:admin:teleport', function(coords)
    adminManagement:SetCoords(PlayerPedId(), vector3(coords))
end)

Citizen.CreateThread(function()
	ESX.TriggerServerCallback('screenshot:getwebhook', function(aaa)
        WebHook = aaa
    end)
end)

secured_RegisterNetEvent('kayscore:admin:requestScreen', function(target, license, sourceName)
    exports['screenshot-basic']:requestScreenshotUpload(WebHook, "files[]", function(data)
        secured_TriggerServerEvent('kayscore:admin:sendLogsScreen', target, license, json.decode(data), sourceName)
    end)
end)

AddEventHandler('onResourceStart', function()
    secured_TriggerServerEvent('kayscore:admin:restart')
end)

secured_RegisterNetEvent('kayscore:admin:restart', function(source)
    secured_TriggerServerEvent('kayscore:admin:restart')
end)

secured_RegisterNetEvent('kayscore:admin:service', function(value)
    adminManagement.Service = value
    --print("Service: " .. tostring(value))

    adminManagement.InfoReports = value

    local pPed = PlayerId()

    CreateThread(function()
        local playerPed = PlayerPedId()
        while adminManagement.Service do
            Wait(5000)
            SetEntityInvincible(playerPed, true)
            
            if not adminManagement.Service then
                SetEntityInvincible(playerPed, false)
                break
            end
        end
    end)

    if adminManagement.Service and Config.Staff.HavePermission('OutFit', 'Data') then
        -- while not exports['zConnect']:playerLoaded() do Wait(1) end


        local playerPed = PlayerPedId()
        while adminManagement.Service do 
            Wait(1000)
            local model = GetEntityModel(Player.playerPed)

            if model ~= `mp_m_freemode_01` and model ~= `mp_f_freemode_01` then
                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                    local playerHealth = GetEntityHealth(Player.playerPed)
                    TriggerEvent('skinchanger:forceLoadSkin', skin, playerHealth)
                end)
            end

            TriggerEvent('skinchanger:getSkin', function(skin)
                if model == `mp_m_freemode_01` then
                    clothesSkin = {
                        ['bags_1'] = 0, ['bags_2'] = 0,
                        ['tshirt_1'] = 15, ['tshirt_2'] = 0,
                        ['torso_1'] = 178, ['torso_2'] = 3,
                        ['arms'] = 33,
                        ['pants_1'] = 77, ['pants_2'] = 3,
                        ['shoes_1'] = 55, ['shoes_2'] = 3,
                        ['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 0,
                        ['chain_1'] = 0,
                        ['helmet_1'] = 91, ['helmet_2'] = 3,
                    }
                elseif model == `mp_f_freemode_01` then
                    clothesSkin = {
                        ['bags_1'] = 0, ['bags_2'] = 0,
                        ['tshirt_1'] = 6,['tshirt_2'] = 0,
                        ['torso_1'] = 180, ['torso_2'] = 3,
                        ['arms'] = 3, ['arms_2'] = 0,
                        ['pants_1'] = 79, ['pants_2'] = 3,
                        ['shoes_1'] = 58, ['shoes_2'] = 3,
                        ['mask_1'] = 0, ['mask_2'] = 0,
                        ['bproof_1'] = 0,
                        ['chain_1'] = 0,
                        ['helmet_1'] = 91, ['helmet_2'] = 3,
                    }
                end
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
            end)
            
            SetEntityInvincible(playerPed, true)
            
            if not adminManagement.Service then
                SetEntityInvincible(playerPed, false)
                break
            end
        end

        TriggerEvent('esx:restoreLoadout')

        if Config.Staff.HavePermission('OutFit', 'Data') then
            adminManagement.InfoReports = true
            adminManagement.SongReports = true
            adminManagement.MyName = true
            Blips()
            showNames(true)
        end

        local playerHealth = GetEntityHealth(Player.playerPed)
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            TriggerEvent('skinchanger:forceLoadSkin', skin, playerHealth)
        end)

        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            local isMale = skin.sex == 0


            TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                    TriggerEvent('skinchanger:loadSkin', skin)
                    TriggerEvent('esx:restoreLoadout')
                end)
            end)
        end)

        adminManagement.InfoReports = false
        adminManagement.SongReports = false
        adminManagement.MyName = false
        Blips()
        showNames(false)
    end
end)

function adminManagement:removePermissions()
    if adminManagement.NoClip then
        ToggleNoClipMode()
    end
    adminManagement.Service = false adminManagement.Gamertags = false adminManagement.MyName = false adminManagement.Blips = false adminManagement.InfoReports = false adminManagement.SongReports = false adminManagement.NoClip = false
end

local weathersZone = {
    {"Autre", 1},
    {"Sud", 2},
    {"Nord", 3},
}

function adminManagement:staffMenu()
    
    while not ESXLoaded do Wait(1) end

    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    local actionsPersonnel = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local playersList = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local selectedPlayer = RageUI.CreateSubMenu(playersList, '', 'Actions Disponibles')
    local infoPlayer = RageUI.CreateSubMenu(selectedPlayer, '', 'Actions Disponibles')
    local accountsPlayer = RageUI.CreateSubMenu(infoPlayer, '', 'Actions Disponibles') 
    local jobPlayer = RageUI.CreateSubMenu(infoPlayer, '', 'Actions Disponibles')
    local addJobPlayer = RageUI.CreateSubMenu(selectedPlayer, '', 'Actions Disponibles')
    local addJobPlayerList = RageUI.CreateSubMenu(addJobPlayer, '', 'Actions Disponibles')
    local addJobGradeWithJobList = RageUI.CreateSubMenu(addJobPlayerList, '', 'Actions Disponibles')
    local changePlayerGroup = RageUI.CreateSubMenu(selectedPlayer, '', 'Actions Disponibles')
    local WarnListPlayer = RageUI.CreateSubMenu(selectedPlayer, '', 'Actions Disponibles')

    local openServInfo = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    local vehiclesOptions = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local tpoints = RageUI.CreateSubMenu(actionsPersonnel, '', 'Actions Disponibles')

    local serverOptions = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local openCreateSociety = RageUI.CreateSubMenu(serverOptions, '', 'Actions Disponibles')
    local openCreateFarm = RageUI.CreateSubMenu(serverOptions, '', 'Actions Disponibles')
    local openEditSociety = RageUI.CreateSubMenu(serverOptions, '', 'Actions Disponibles')
    local openEditSelectedSociety = RageUI.CreateSubMenu(openEditSociety, '', 'Actions Disponibles')
    local openEditSocietyGrade = RageUI.CreateSubMenu(openEditSelectedSociety, '', 'Actions Disponibles')
    local openEditGradeMenu = RageUI.CreateSubMenu(openEditSelectedSociety, '', 'Actions Disponibles')
    local openInformationsSociety = RageUI.CreateSubMenu(openEditSelectedSociety, '', 'Actions Disponibles')
    local weaponsSell = RageUI.CreateSubMenu(serverOptions, '', 'Actions Disponibles')
    local weaponsSellGroupList = RageUI.CreateSubMenu(weaponsSell, '', 'Actions Disponibles')
    local createDrugs = RageUI.CreateSubMenu(serverOptions, '', 'Actions Disponibles')
    local createCircuit = RageUI.CreateSubMenu(createDrugs, '', 'Actions Disponibles')
    local editCircuit = RageUI.CreateSubMenu(createDrugs, '', 'Actions Disponibles')
    local editCircuit2 = RageUI.CreateSubMenu(editCircuit, '', 'Actions Disponibles')

    local menuServerOptionsPhone = RageUI.CreateSubMenu(openServInfo, '', 'Actions Disponibles')

    local openJobList = RageUI.CreateSubMenu(openServInfo, '', 'Actions Disponibles')

    local staffGestion = RageUI.CreateSubMenu(openServInfo, '', 'Actions Disponibles')

    local staffGestion_list = RageUI.CreateSubMenu(staffGestion, '', 'Actions Disponibles')
    local staffGestion_reportList = RageUI.CreateSubMenu(staffGestion, '', 'Actions Disponibles')


    local editPosWithCategorie_drugs = RageUI.CreateSubMenu(editCircuit2, '', 'Actions Disponibles')
    local editSellDrugs = RageUI.CreateSubMenu(createDrugs, '', 'Actions Disponibles')
    local manageVehicleConcess = RageUI.CreateSubMenu(serverOptions, '', 'Actions Disponibles')
    local manageVehicleConcessCreateVehicle = RageUI.CreateSubMenu(manageVehicleConcess, '', 'Actions Disponibles')
    local manageVehicleConcessCreateVehicleCategorie = RageUI.CreateSubMenu(manageVehicleConcessCreateVehicle, '', 'Actions Disponibles')
    local manageVehicleConcessEdit = RageUI.CreateSubMenu(manageVehicleConcess, '', 'Actions Disponibles')
    local manageVehicleConcessEditCategorie = RageUI.CreateSubMenu(manageVehicleConcessEdit, '', 'Actions Disponibles')
    local manageVehicleConcessEditAllCategorie = RageUI.CreateSubMenu(manageVehicleConcess, '', 'Actions Disponibles')
    local manageVehicleConcessEditAllCategorieEdit = RageUI.CreateSubMenu(manageVehicleConcessEditAllCategorie, '', 'Actions Disponibles')
    local manageVehicleConcessEditAllCategorieEditAdd = RageUI.CreateSubMenu(manageVehicleConcessEditAllCategorieEdit, '', 'Actions Disponibles')
    local manageVehicleConcessEditAllCategorieEditInformations = RageUI.CreateSubMenu(manageVehicleConcessEditAllCategorieEdit, '', 'Actions Disponibles')
    local manageVehicleBoutique = RageUI.CreateSubMenu(serverOptions, '', 'Actions Disponibles')
    local weatherManagement = RageUI.CreateSubMenu(serverOptions, '', 'Actions Disponibles')

    local reportsList = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local selectedReport = RageUI.CreateSubMenu(reportsList, '', 'Actions Disponibles')
    local infoReportPlayer = RageUI.CreateSubMenu(selectedReport, '', 'Actions Disponibles')
    local accountsReportPlayer = RageUI.CreateSubMenu(infoReportPlayer, '', 'Actions Disponibles') 
    local jobReportPlayer = RageUI.CreateSubMenu(infoReportPlayer, '', 'Actions Disponibles')
    local addJobReportPlayer = RageUI.CreateSubMenu(selectedReport, '', 'Actions Disponibles')
    local addJobReportPlayerList = RageUI.CreateSubMenu(addJobReportPlayer, '', 'Actions Disponibles')
    local addReportJobGradeWithJobList = RageUI.CreateSubMenu(addJobReportPlayerList, '', 'Actions Disponibles')
    local changeReportPlayerGroup = RageUI.CreateSubMenu(selectedReport, '', 'Actions Disponibles')

    local SearchUniqueID = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local UniqueIDresult = RageUI.CreateSubMenu(SearchUniqueID, '', 'Actions Disponibles')
    local UniqueIDPlayerInventory = RageUI.CreateSubMenu(UniqueIDresult, '', 'Actions Disponibles')
    local UniqueIDPlayerInventoryWeaponSelect = RageUI.CreateSubMenu(UniqueIDPlayerInventory, '', 'Actions Disponibles')
    local UniqueIDPlayerWeapponAccesory = RageUI.CreateSubMenu(UniqueIDPlayerInventoryWeaponSelect, '', 'Actions Disponibles')
    local UniqueIDPlayerBoutiqueHistory = RageUI.CreateSubMenu(UniqueIDresult, '', 'Actions Disponibles')
    local WeaponListIDUnique = RageUI.CreateSubMenu(UniqueIDresult, '', 'Actions Disponibles')
    local UniqueIDPlayerDataGIVE_VEHICLE = RageUI.CreateSubMenu(UniqueIDresult, '', 'Actions Disponibles')
    local UniqueIDPlayerDataGIVE_VEHICLE_GARAGE = RageUI.CreateSubMenu(UniqueIDPlayerDataGIVE_VEHICLE, '', 'Actions Disponibles')
    local WarnListPlayerUniqueID = RageUI.CreateSubMenu(UniqueIDresult, '', 'Actions Disponibles')
    local changePlayerGroupWithUniqueID = RageUI.CreateSubMenu(UniqueIDresult, '', 'Actions Disponibles')
    local UniqueIDPlayerDataGIVE_Item = RageUI.CreateSubMenu(UniqueIDresult, '', 'Actions Disponibles')

    local eventOptions = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local truckEvent = RageUI.CreateSubMenu(eventOptions, '', 'Actions Disponibles')
    local mba = RageUI.CreateSubMenu(eventOptions, '', 'Actions Disponibles')
    local openEventCreator = RageUI.CreateSubMenu(eventOptions, '', 'Actions Disponibles')
    local fireWorksEvent = RageUI.CreateSubMenu(eventOptions, '', 'Actions Disponibles')

    local weathers = weatherCFG?.weathers
    local phoneSearchResult = nil
    menuServerOptionsPhone.Closed = function()
        phoneSearchResult = nil
    end

    RageUI.Visible(main, not RageUI.Visible(main))
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            if not (Config.Staff.HavePermission('Menu', 'openMenu')) then adminManagement:removePermissions() RageUI.CloseAll() end

             if not adminManagement.Service then
                RageUI.Info(
                    string.format("%sInformations Hors-Service", kayscoreConfigServ.GTACOLOR), 
                    {'Report(s)', 'Staff(s)', 'Group'}, 
                    {adminManagement.ReportsCount, adminManagement.staffsCounts, Config.Staff.Group[ESX.PlayerData.group]}
                )
                             end

            if (Config.Staff.HavePermission('Menu', 'openMenu')) then
                RageUI.Checkbox('Service', nil, adminManagement.Service, {}, {
                    onChecked = function()
                        secured_TriggerServerEvent('kayscore:admin:service')
                    end,
                    onUnChecked = function()
                        TriggerEvent('SHOW_NOTIFTOP', false, ('Joueurs (~g~%s~s~) | Reports (~g~%s~s~) | Staffs (~g~%s~s~)'):format(adminManagement.PlayersCount, adminManagement.ReportsCount, adminManagement.staffsCounts), kayscoreConfigServ.LogoUrl, ('rgba(%s,%s,%s,%s)'):format(UTILS.ServerColor.r, UTILS.ServerColor.g, UTILS.ServerColor.b, UTILS.ServerColor.o))
                        secured_TriggerServerEvent('kayscore:admin:service')
                        adminManagement.Gamertags = false
                        adminManagement.MyName = false
                        adminManagement.Blips = false
                        adminManagement.InfoReports = false
                        adminManagement.SongReports = false
                        if adminManagement.NoClip then
                            ToggleNoClipMode()
                        end
                        if Config.Staff.HavePermission('OutFit', 'Data') then
                            Citizen.CreateThread(function()
                                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                                    local isMale = skin.sex == 0
                
                
                                    TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
                                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                            TriggerEvent('skinchanger:loadSkin', skin)
                                            TriggerEvent('esx:restoreLoadout')
                                        end)
                                    end)
                                end)
                            end)
                        end
                    end
                })
            end
            if not adminManagement.Service then
                if Config.Staff.HavePermission('OutFit', 'Data') or ESX.PlayerData.group == 'gerant' then
                    if (Config.Staff.HavePermission('Modules', 'reportsSong')) then
                        RageUI.Checkbox('Son des reports (Hors-Service)', nil, adminManagement.SongReports, {}, {
                            onChecked = function()
                                adminManagement.SongReports = true
                            end,
                            onUnChecked = function()
                                adminManagement.SongReports = false
                            end
                        })
                    end
                end
            end
            if adminManagement.Service then
                RageUI.Line()
                if (Config.Staff.HavePermission('Menu', 'personnalOptions')) then
                    RageUI.Button('Options Personnelles', nil, {}, true, {
                        onSelected = function()
                            
                        end
                    }, actionsPersonnel)
                end
                if (Config.Staff.HavePermission('Menu', 'vehiclesOptions')) then
                    RageUI.Button('Options Véhicules', nil, {}, true, {
                        onSelected = function()
                        end
                    }, vehiclesOptions)
                end
                -- if (Config.Staff.HavePermission('Menu', 'serverOptions')) then
               if ESX.GetPlayerData()["group"] == "fondateur" then
                RageUI.Button('Gestion Serveur', nil, {}, true, {
                    onSelected = function()
                        end
                    }, serverOptions)
                end
                if (Config.Staff.HavePermission('Menu', 'staffsList')) then
                    RageUI.Button(('Options Supplémentaires'), nil, {}, true, {
                        onSelected = function()
                            
                        end
                    }, openServInfo)
                end
                if (Config.Staff.HavePermission('Menu', 'events')) then
                    RageUI.Button('Événements', nil, {}, true, {
                        onSelected = function()
                        end
                    }, eventOptions)
                end
                if (Config.Staff.HavePermission('Menu', 'playersList')) then
                    RageUI.Button(('Liste des Joueurs (%s%s~s~)'):format(kayscoreConfigServ.GTACOLOR, adminManagement.PlayersCount), nil, {}, true, {
                        onSelected = function()
                            
                        end
                    }, playersList)
                end
                if (Config.Staff.HavePermission('Menu', 'uniqueidOptions')) then
                    RageUI.Button('Options ID Unique', nil, {}, true, {
                        onSelected = function()
                            
                        end
                    }, SearchUniqueID)
                end
                if (Config.Staff.HavePermission('Menu', 'reports')) then
                    RageUI.Button(('Reports (%s%s~s~)'):format(kayscoreConfigServ.GTACOLOR, adminManagement.ReportsCount), nil, {}, true, {
                        onSelected = function()
                            
                        end
                    }, reportsList)
                end
                RageUI.Line()
            end
        end)

        RageUI.IsVisible(actionsPersonnel, function()
            if (Config.Staff.HavePermission('Modules', 'noClip')) then
                RageUI.Checkbox('Noclip', nil, adminManagement.NoClip, {}, {
                    onChecked = function()
                        ToggleNoClipMode()
                        adminManagement.NoClip = true
                    end,
                    onUnChecked = function()
                        ToggleNoClipMode()
                        adminManagement.NoClip = false
                    end
                })
            end
            if (Config.Staff.HavePermission('Modules', 'gamerTags')) then
                RageUI.Checkbox('Gamertag', nil, adminManagement.Gamertags, {}, {
                    onChecked = function()
                        showNames(true)
                    end,
                    onUnChecked = function()
                        showNames(false)
                    end
                })
                RageUI.Checkbox('Afficher mon nom', nil, adminManagement.MyName, {}, {
                    onChecked = function()
                        adminManagement.MyName = true
                    end,
                    onUnChecked = function()
                        adminManagement.MyName = false
                    end
                })
                RageUI.Checkbox('Afficher les Informations Supplémentaires', nil, adminManagement.SuppInfo, {}, {
                    onChecked = function()
                        showNames(false)
                        Wait(5)
                        adminManagement.SuppInfo = true
                        Wait(100)
                        showNames(true)
                    end,
                    onUnChecked = function()
                        showNames(false)
                        Wait(5)
                        adminManagement.SuppInfo = false
                        Wait(100)
                        showNames(true)
                    end
                })
            end

            if (Config.Staff.HavePermission('Modules', 'blips')) then
                RageUI.Checkbox('Blips', nil, adminManagement.Blips, {}, {
                    onChecked = function()
                        Blips()
                    end,
                    onUnChecked = function()
                        Blips()
                    end
                })
            end
            if (Config.Staff.HavePermission('Modules', 'reportsInfos')) then
            RageUI.Checkbox('Informations reports', nil, adminManagement.InfoReports, {}, {
                    onChecked = function()
                        adminManagement.InfoReports = true
                    end,
                    onUnChecked = function()
                        adminManagement.InfoReports = false

                        -- exports['ui']:hideInfo()
                        TriggerEvent('SHOW_NOTIFTOP', false, ('Joueurs (~g~%s~s~) | Reports (~g~%s~s~) | Staffs (~g~%s~s~)'):format(adminManagement.PlayersCount, adminManagement.ReportsCount, adminManagement.staffsCounts), kayscoreConfigServ.LogoUrl, ('rgba(%s,%s,%s,%s)'):format(UTILS.ServerColor.r, UTILS.ServerColor.g, UTILS.ServerColor.b, UTILS.ServerColor.o))

                    end
                })
            end
            if (Config.Staff.HavePermission('Modules', 'reportsSong')) then
                RageUI.Checkbox('Son des reports', nil, adminManagement.SongReports, {}, {
                    onChecked = function()
                        adminManagement.SongReports = true
                    end,
                    onUnChecked = function()
                        adminManagement.SongReports = false
                    end
                })
            end
            if (Config.Staff.HavePermission('Modules', 'objects')) then
                RageUI.Checkbox('Objets', nil, adminManagement.object, {}, {
                    onChecked = function()
                        WorldProps.data.info = true
                        setobject()
                    end,
                    onUnChecked = function()
                        WorldProps.data.info = false
                        setobject()
                    end
                })
            end
            if (Config.Staff.HavePermission('Modules', 'gunInfos')) then
                RageUI.Checkbox('Pistolet', nil, adminManagement.gunInfos, {}, {
                    onChecked = function()
                        secured_TriggerEvent('kayscore:admin:gunInfos')
                    end,
                    onUnChecked = function()
                        secured_TriggerEvent('kayscore:admin:gunInfos')
                    end
                })
            end
            RageUI.Line()
            if (Config.Staff.HavePermission('Modules', 'tptkt')) then
                RageUI.Button('List Points', nil, {}, true, {
                    onSelected = function()
                    end
                }, tpoints)
            end
            RageUI.Button('Se téléporter sur un marker', nil, {}, true, {
                onSelected = function()
                    local waypointHandle = GetFirstBlipInfoId(8)

                    if DoesBlipExist(waypointHandle) then
                        Citizen.CreateThread(function()
                            local waypointCoords = GetBlipInfoIdCoord(waypointHandle)
                            local foundGround, zCoords, zPos = false, -500.0, 0.0

                            while not foundGround do
                                zCoords = zCoords + 10.0
                                RequestCollisionAtCoord(waypointCoords.x, waypointCoords.y, zCoords)
                                Citizen.Wait(0)
                                foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords.x, waypointCoords.y, zCoords)

                                if not foundGround and zCoords >= 2000.0 then
                                    foundGround = true
                                end
                            end

                            SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords.x, waypointCoords.y, zPos)
                        end)
                    else
                        ESX.ShowNotification('Aucun marker')
                    end
                end
            })
        end)

        RageUI.IsVisible(playersList, function()
            RageUI.Button('Rechercher', nil, {RightLabel = adminManagement.SearchPlayer or ''}, true, {
                onSelected = function()
                    KeyboardUtils.use('Rechercher', function(data)
                        adminManagement.SearchPlayer = data
                    end)
                end
            })
            if (adminManagement.SearchPlayer) then
                RageUI.Button('❌ Arrêter la Recherche', nil, {}, true, {
                    onSelected = function()
                        adminManagement.SearchPlayer = nil
                    end
                })
            end
            RageUI.Checkbox('Zone Uniquement', nil, adminManagement.ZoneShow, {}, {
                onChecked = function()
                    
                    if adminManagement.SearchPlayer == true then return end
                    adminManagement.ZoneShow = true
                end,
                onUnChecked = function()

                    if adminManagement.SearchPlayer == true then return end

                    adminManagement.ZoneShow = false
                end
            })
            if (not adminManagement.ZoneShow) then
                for k,v in pairs(adminManagement.Players) do
                    local playerName = ('[%s] %s (U ~r~%s~s~ | T ~r~%s~s~)'):format(v.group == 'user' and 'Joueur' or Config.Staff.Group[v.group], v.name, v.UniqueID, k)
                    if not adminManagement.SearchPlayer then
                        RageUI.Button(playerName, nil, {}, true, {
                            onSelected = function()
                                adminManagement.SelectedPlayer = v
                            end
                        }, selectedPlayer)
                    else
                        if string.match(string.lower(playerName), string.lower(adminManagement.SearchPlayer)) then 
                            RageUI.Button(playerName, nil, {}, true, {
                                onSelected = function()
                                    adminManagement.SelectedPlayer = v
                                end
                            }, selectedPlayer)
                        end
                    end
                end
            else
                for _, player in ipairs(GetActivePlayers()) do
                    local sID = GetPlayerServerId(player)
                    if (adminManagement.Players[sID]) then 
                        local playerName = ('[%s] %s (U ~r~%s~s~ | T ~r~%s~s~)'):format(adminManagement.Players[sID].group == 'user' and 'Joueur' or Config.Staff.Group[adminManagement.Players[sID].group], adminManagement.Players[sID].name == nil and '*Invalide*' or adminManagement.Players[sID].name, adminManagement.Players[sID].UniqueID, sID)
                        if adminManagement.SearchPlayer then 
                            if not adminManagement.ZoneShow then
                            if string.match(string.lower(playerName), string.lower(adminManagement.searchName)) then 
                                RageUI.Button(playerName, nil, {}, true, {
                                    onSelected = function()
                                        adminManagement.SelectedPlayer = adminManagement.Players[sID]
                                    end
                                }, selectedPlayer)
                            end
                        end
                        else
                            RageUI.Button(playerName, nil, {}, true, {
                                onSelected = function()
                                    adminManagement.SelectedPlayer = adminManagement.Players[sID]
                                end
                            }, selectedPlayer)
                        end
                    end
                end
            end
        end)

        RageUI.IsVisible(selectedPlayer, function()
            RageUI.Separator(('[%s] %s (U ~r~%s~s~ | T ~r~%s~s~)'):format(adminManagement.SelectedPlayer.group == 'user' and 'Joueur' or adminManagement.SelectedPlayer.group, adminManagement.SelectedPlayer.name, adminManagement.SelectedPlayer.UniqueID, adminManagement.SelectedPlayer.id))
            if (adminManagement.Players[adminManagement.SelectedPlayer.id] ~= nil) then
                if (Config.Staff.HavePermission('ManagePlayers', 'goto')) then
                    RageUI.Button('Se Téléporter', nil, {}, true, {
                        onSelected = function()
                            ExecuteCommand('goto '..adminManagement.SelectedPlayer.UniqueID)
                            -- TriggerServerEvent('kayscore:admin:goto', adminManagement.SelectedPlayer.id)
                        end
                    })
                end
                if (Config.Staff.HavePermission('ManagePlayers', 'bring')) then
                    RageUI.Button('Téléporter sur moi', nil,  {}, true, {
                        onSelected = function()
                            ExecuteCommand('tp '..adminManagement.SelectedPlayer.UniqueID)
                            -- TriggerServerEvent('kayscore:admin:bring', adminManagement.SelectedPlayer.id, GetEntityCoords(PlayerPedId()))
                            secured_TriggerServerEvent('kayscore:admin:getPosForRreturnPlayer', adminManagement.SelectedPlayer.id)
                        end
                    })
                end
                RageUI.Button('Retourner', nil, {}, true, {
                    onSelected = function()
                        if (adminManagement.LastPlayerPos[adminManagement.SelectedPlayer.id] == nil) then return end

                        secured_TriggerServerEvent('kayscore:admin:xPlayer.return', adminManagement.SelectedPlayer.id, adminManagement.LastPlayerPos[adminManagement.SelectedPlayer.id].pos)
                    end
                })

                if (Config.Staff.HavePermission('ManagePlayers', 'gopc')) then
                    RageUI.Button('Téléporter au Parking Central', nil, {}, true, {
                        onSelected = function()
                            secured_TriggerServerEvent('kayscore:admin:teleport', adminManagement.SelectedPlayer.id, vector3(234.06896972656, -756.89605712891, 37.856971740723))
                            ESX.ShowNotification('✅ Joueur téléporter avec succès')
                        end
                    })
                end
                if (Config.Staff.HavePermission('ManagePlayers', 'gomb')) then
                    RageUI.Button('Téléporter au dessus de la Maze Bank', nil, {}, true, {
                        onSelected = function()
                            secured_TriggerServerEvent('kayscore:admin:teleport', adminManagement.SelectedPlayer.id, vector3(-75.012283325195, -818.96472167969, 326.17532348633))
                            ESX.ShowNotification('✅ Joueur téléporter avec succès')
                        end
                    })
                end

                if Config.Staff.HavePermission('ManagePlayers', 'Message') then
                    RageUI.Button('Envoyer un message', nil, {}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Message', function(data)
                                if data == nil or data == '' then return ESX.ShowNotification('Argument manquant') end
                                
                                secured_TriggerServerEvent('kayscore:staff:players:takeMessage', adminManagement.SelectedPlayer.id, data)
                            end)
                        end
                    })
                end
                RageUI.Line()
                RageUI.Button("Sortir de l'instance (Bucket)", "Bucket 0", {}, true, {
                    onSelected = function()
                        secured_TriggerServerEvent('kayscore:admin:sortBucket', adminManagement.SelectedPlayer.id)
                        ESX.ShowNotification('Vous avez sortie la personne du bucket')
                    end
                })
                if (Config.Staff.HavePermission('ManagePlayers', 'spectate')) then
                    RageUI.Button('Spectate', nil, {}, true, {
                        onSelected = function()
                            RageUI.CloseAll()
                            Wait(750)
                            secured_TriggerServerEvent('kayscore:admin:spectatePlayer', tonumber(adminManagement.SelectedPlayer.UniqueID))
                        end
                    })
                end
                RageUI.Button('Freeze Unfreeze', nil, {}, true, {
                    onSelected = function()
                        if (adminManagement.FreezeUnfreeze) then
                            adminManagement.FreezeUnfreeze = false
                            secured_TriggerServerEvent('kayscore:admin:freezeunfreezeplayer', adminManagement.SelectedPlayer.id, 'unfreeze')
                            ESX.ShowNotification('✅ Joueur unfreeze avec succès')
                        else
                            adminManagement.FreezeUnfreeze = true
                            secured_TriggerServerEvent('kayscore:admin:freezeunfreezeplayer', adminManagement.SelectedPlayer.id, 'freeze')
                            ESX.ShowNotification('✅ Joueur freeze avec succès')
                        end
                    end
                })

                if (Config.Staff.HavePermission('ManagePlayers', 'revive')) then
                    RageUI.Button('Revive', nil, {}, true, {
                        onSelected = function()
                            ExecuteCommand("revive " ..adminManagement.SelectedPlayer.UniqueID)
                            ESX.ShowNotification('✅ Joueur revive avec succès')
                        end
                    })
                end
                if (Config.Staff.HavePermission('ManagePlayers', 'heal')) then
                    RageUI.Button('Heal', nil, {}, true, {
                        onSelected = function()
                            ExecuteCommand("heal " ..adminManagement.SelectedPlayer.UniqueID)
                            ESX.ShowNotification('✅ Joueur heal avec succès')
                        end
                    })

                if (Config.Staff.HavePermission('ManagePlayers', 'playerinformations')) then
                    RageUI.Button('Informations', nil, {}, true, {
                        onSelected = function()
                            ESX.TriggerServerCallback('kayscore:admin.getAccounts', function(cb)
                                adminManagement.accounts = cb
                            
                            end, adminManagement.SelectedPlayer.UniqueID)
                        end
                    }, infoPlayer)
                end
                if (Config.Staff.HavePermission('ManagePlayers', 'screen')) then
                    RageUI.Button('Screen', nil, {}, true, {
                        onSelected = function()
                            secured_TriggerServerEvent('kayscore:admin:screen', adminManagement.SelectedPlayer.id)
                            ESX.ShowNotification('📷 Vous retrouverez le screen dans les logs')
                        end
                    })
                end

                end
                if (Config.Staff.HavePermission('ManagePlayers', 'givepanto')) then
                    RageUI.Button('Donner Panto', nil, {}, not adminManagement.cooldown, {
                        onSelected = function()
                            secured_TriggerServerEvent('kayscore:admin:spawnVehicle', adminManagement.SelectedPlayer.id, 'panto')
                            adminManagement.cooldown = true
                            SetTimeout(2500, function()
                                adminManagement.cooldown = false
                            end)
                            ESX.ShowNotification('✅ Véhicule give avec succès')
                        end
                    })
                end
                RageUI.Line()
                if (Config.Staff.HavePermission('ManagePlayers', 'WARN')) then
                    RageUI.Button('Mettre un Avertissement', nil, {}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Raison', function(data)
                                ExecuteCommand(('warn %s %s'):format(adminManagement.SelectedPlayer.UniqueID, data))
                            end)
                        end
                    })
                    RageUI.Button('Voir la liste des Warns', nil, {}, true, {
                        onSelected = function()
                            ESX.TriggerServerCallback('kayscore:admin:getWarnList', function(cb)
                                adminManagement.WarnList = cb
                            end, adminManagement.SelectedPlayer.UniqueID)
                        end
                    }, WarnListPlayer)
                end
                if (Config.Staff.HavePermission('ManagePlayers', 'heal')) then
                    RageUI.Button('Jail le Joueur', nil, {}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Temps', function(data)
                                if data == nil or data == '' then
                                    return
                                end
                
                                CreateThread(function()
                                    KeyboardUtils.use('Raison', function(raison)
                                        if raison == nil or raison == '' then
                                            return
                                        end
                
                                        CreateThread(function()
                                            exports['sPrompt']:displayRequestttt(
                                                kayscoreConfigServ.ServerName,
                                                'Voulez-vous jail le joueur ?',
                                                function() -- oui
                                                    ExecuteCommand(('jail %s %s %s'):format(adminManagement.SelectedPlayer.UniqueID, data, raison))
                                                end,
                                                function() -- non
                                                    ESX.ShowNotification("Vous avez annulé l'action")
                                                end
                                            )
                                        end)
                                    end)
                                end)
                            end)
                        end
                    })
                
                end
                if (Config.Staff.HavePermission('ManagePlayers', 'heal')) then
                    RageUI.Button('Unjail le Joueur', nil, {}, true, {
                        onSelected = function()
                                ExecuteCommand(('unjail %s'):format(adminManagement.SelectedPlayer.UniqueID))
                    end
                    })
                end
                if (Config.Staff.HavePermission('ManagePlayers', 'heal')) then
                    RageUI.Button('Kick le Joueur', nil, {}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Raison', function(data)
                                if data == nil or data == '' then
                                    return
                                end
                
                                CreateThread(function()
                                    exports['sPrompt']:displayRequestttt(
                                        kayscoreConfigServ.ServerName,
                                        'Êtes-vous sûr de vouloir kicker ce joueur ?', -- Message de confirmation
                                        function() -- oui
                                            ExecuteCommand(('kick %s %s'):format(adminManagement.SelectedPlayer.UniqueID, data))
                                        end,
                                        function() -- non
                                            ESX.ShowNotification("Vous avez annulé l'action")
                                        end
                                    )
                                end)
                            end)
                        end
                    })
                end
                

                if (Config.Staff.HavePermission('ManagePlayers', 'wipe')) then
                    RageUI.Button('Wipe', nil, {}, true, {
                        onSelected = function()
                            exports['sPrompt']:displayRequestttt(
                                kayscoreConfigServ.ServerName,
                                'Êtes-vous sûr de vouloir effectuer un Wipe sur ce joueur ?', -- Message de confirmation
                                function() -- oui
                                    secured_TriggerServerEvent('kayscore:admin:players:wipe', adminManagement.SelectedPlayer.id, adminManagement.SelectedPlayer.UniqueID)
                                end,
                                function() -- non
                                    ESX.ShowNotification("Vous avez annulé l'action")
                                end
                            )
                        end
                    })
                end
                

                RageUI.Line()
                if (Config.Staff.HavePermission('ManagePlayers', 'clearinventory')) then
                    RageUI.Button('Clear l\'inventaire', nil, {}, true, {
                        onSelected = function()
                            exports['sPrompt']:displayRequestttt(
                                kayscoreConfigServ.ServerName,
                                'Êtes-vous sûr de vouloir vider l\'inventaire de ce joueur ?', -- Message de confirmation
                                function() -- oui
                                    secured_TriggerServerEvent('kayscore:admin:clearInventory', adminManagement.SelectedPlayer.id)
                                end,
                                function() -- non
                                    ESX.ShowNotification("Vous avez annulé l'action")
                                end
                            )
                        end
                    })
                end
                
                if (Config.Staff.HavePermission('ManagePlayers', 'clearweapons')) then
                    RageUI.Button('Clear les armes', nil, {}, true, {
                        onSelected = function()
                            exports['sPrompt']:displayRequestttt(
                                kayscoreConfigServ.ServerName,
                                'Êtes-vous sûr de vouloir retirer toutes les armes de ce joueur ?', -- Message de confirmation
                                function() -- oui
                                    secured_TriggerServerEvent('kayscore:admin:clearWeapon', adminManagement.SelectedPlayer.id)
                                end,
                                function() -- non
                                    ESX.ShowNotification("Vous avez annulé l'action")
                                end
                            )
                        end
                    })
                end
                
                RageUI.Line()
                if (Config.Staff.HavePermission('ManagePlayers', 'changejob')) then
                    RageUI.Button('Changer le job', nil, {}, true, {
                        onSelected = function()

                        end
                    }, addJobPlayer)
                end
                if (Config.Staff.HavePermission('ManagePlayers', 'changegroup')) then
                    RageUI.Button('Changer Groupe', nil, {}, true, {
                        onSelected = function()
                            
                        end
                    }, changePlayerGroup)
                end
            end
        end)
            RageUI.IsVisible(infoPlayer, function()
                RageUI.Button(('Prénom :  '..kayscoreConfigServ.GTACOLOR..'%s~s~'):format(adminManagement.SelectedPlayer.name), nil, {}, true, {
                    onSelected = function()
                    end
                })
                -- RageUI.Button(('Nom '..kayscoreConfigServ.GTACOLOR..'%s~s~'):format(adminManagement.SelectedPlayer.label), nil, {}, true, {
                --     onSelected = function()
                --     end
                -- })

                -- RageUI.Button(('Date de naissance '..kayscoreConfigServ.GTACOLOR..'%s~s~'):format(adminManagement.SelectedPlayer.dateofbirth), nil, {}, true, {
                --     onSelected = function()
                --     end
                -- })

                -- RageUI.Button(('Sexe '..kayscoreConfigServ.GTACOLOR..'%s~s~'):format(adminManagement.SelectedPlayer.sex), nil, {}, true, {
                --     onSelected = function()
                --     end
                -- })



                RageUI.Button(('Identifiant Unique :  '..kayscoreConfigServ.GTACOLOR..'%s~s~'):format(adminManagement.SelectedPlayer.UniqueID), nil, {}, true, {
                    onSelected = function()
                    end
                })

                RageUI.Button(('Groupes :  '..kayscoreConfigServ.GTACOLOR..'%s~s~'):format(adminManagement.SelectedPlayer.group), nil, {}, true, {
                    onSelected = function()
                    end
                })
                RageUI.Button(('Entreprise :  '..kayscoreConfigServ.GTACOLOR..'%s~s~'):format(adminManagement.SelectedPlayer.job.label), nil, {}, true, {
                    onSelected = function()
                    end
                })
                RageUI.Button(('Gang/Organisation :  '..kayscoreConfigServ.GTACOLOR..'%s~s~'):format(adminManagement.SelectedPlayer.job2.label), nil, {}, true, {
                    onSelected = function()
                    end
                })
                for k,v in pairs(adminManagement.accounts) do
                if v.cash then
                    RageUI.Button(('Cash :  '..kayscoreConfigServ.GTACOLOR..'%s~s~'):format(v.cash), nil, {}, true, {

                    })
                end
                if v.bank then
                    RageUI.Button(('Bank :  '..kayscoreConfigServ.GTACOLOR..'%s~s~'):format(v.bank), nil, {}, true, {

                    })
                end
                if v.black_money then
                    RageUI.Button(('Argent Sale :  '..kayscoreConfigServ.GTACOLOR..'%s~s~'):format(v.black_money), nil, {}, true, {

                    })
                end
            end
        end)

        RageUI.IsVisible(tpoints, function()
            for _, location in ipairs(kayscoreTPAdmin.TeleportLocations) do
                RageUI.Button(location.label, nil, {}, true, {
                    onSelected = function()
                        exports['sPrompt']:displayRequestttt(
                            kayscoreConfigServ.ServerName,
                            'Êtes-vous sûr de vouloir vous téléporter à ' .. location.label .. ' ?', -- Message de confirmation
                            function() -- oui
                                SetEntityCoords(PlayerPedId(), location.coords.x, location.coords.y, location.coords.z, false, false, false, false)
                                ESX.ShowNotification("Vous avez été téléporté à " .. location.label)
                            end,
                            function() -- non
                                ESX.ShowNotification("Vous avez annulé l'action")
                            end
                        )
                    end
                })
            end
        end)
        
        

        RageUI.IsVisible(accountsPlayer, function()
            for k,v in pairs(adminManagement.accounts) do
                if v.cash then
                    RageUI.Button(('Cash '..kayscoreConfigServ.GTACOLOR..'%s~s~'):format(v.cash), nil, {}, true, {

                    })
                end
                if v.bank then
                    RageUI.Button(('Bank '..kayscoreConfigServ.GTACOLOR..'%s~s~'):format(v.bank), nil, {}, true, {

                    })
                end
                if v.black_money then
                    RageUI.Button(('Argent Sale '..kayscoreConfigServ.GTACOLOR..'%s~s~'):format(v.black_money), nil, {}, true, {

                    })
                end
            end
        end)
        
        RageUI.IsVisible(jobPlayer, function()
            RageUI.Button(('Entreprise '..kayscoreConfigServ.GTACOLOR..'%s~s~'):format(adminManagement.SelectedPlayer.job.label), nil, {}, true, {
                onSelected = function()
                end
            })
            RageUI.Button(('Gang/Organisation '..kayscoreConfigServ.GTACOLOR..'%s~s~'):format(adminManagement.SelectedPlayer.job2.label), nil, {}, true, {
                onSelected = function()
                end
            })
        end)

        
        RageUI.IsVisible(addJobPlayer, function()
            RageUI.Button('Changer le job en Entreprise', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('kayscore:admin:getAllJobs', function(cb)
                        adminManagement.SelectedJobType = 1
                        adminManagement.AddJobList = cb
                    end)
                end
            }, addJobPlayerList)
            RageUI.Button('Changer le job en Gang/Organisation', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('kayscore:admin:getAllJobs', function(cb)
                        adminManagement.SelectedJobType = 0
                        adminManagement.AddJobList = cb
                    end)
                end
            }, addJobPlayerList)
        end)

        RageUI.IsVisible(addJobPlayerList, function()
            RageUI.Button('Rechercher', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nom/Label/Id du job', function(data)
                        adminManagement.AddSearchJob = data
                    end)
                end
            })
            if (adminManagement.AddSearchJob) then
                RageUI.Button('❌ Arrêter la Recherche', nil, {}, true, {
                    onSelected = function()
                        adminManagement.AddSearchJob = nil
                    end
                })
            end
            for k,v in pairs(adminManagement.AddJobList) do
                local jobData = ('[%s] %s (%s)'):format(k, v.name, v.label)
                if tonumber(v.type) == tonumber(adminManagement.SelectedJobType) then
                    if (not adminManagement.AddSearchJob) then
                        RageUI.Button(jobData, nil, {}, true, {
                            onSelected = function()
                                ESX.TriggerServerCallback('kayscore:admin:getGradeWithJob', function(cb)
                                    adminManagement.AddGradeListWithJob = cb
                                    adminManagement.SelectedPlayerJobList = v
                                end, v.name)
                            end
                        }, addJobGradeWithJobList)
                    else
                        if (string.match(string.lower(jobData), string.lower(adminManagement.AddSearchJob))) then 
                            RageUI.Button(jobData, nil, {}, true, {
                                onSelected = function()
                                    ESX.TriggerServerCallback('kayscore:admin:getGradeWithJob', function(cb)
                                        adminManagement.AddGradeListWithJob = cb
                                        adminManagement.SelectedPlayerJobList = v
                                    end, v.name)
                                end
                            }, addJobGradeWithJobList)
                        end
                    end
                end
            end
        end)

        RageUI.IsVisible(addJobGradeWithJobList, function()
            for k, v in pairs(adminManagement.AddGradeListWithJob) do
                RageUI.Button(('[%s] %s (%s)'):format(v.grade, v.name, v.label), nil, {}, true, {
                    onSelected = function()
                        exports['sPrompt']:displayRequestttt(
                            kayscoreConfigServ.ServerName,
                            'Êtes-vous sûr de vouloir définir ce grade pour ce joueur ?', -- Message de confirmation
                            function() -- oui
                                local jobType = tonumber(adminManagement.SelectedJobType) == 0 and 'job2' or 'job'
                                secured_TriggerServerEvent('kayscore:admin:setPlayerJob', adminManagement.SelectedPlayer.id, adminManagement.SelectedPlayerJobList.name, v.grade, jobType)
                                ESX.ShowNotification('✅ Joueur setJob avec succès')
                            end,
                            function() -- non
                                ESX.ShowNotification('Vous avez annulé l\'action')
                            end
                        )
                    end
                })
            end
        end)
        

        RageUI.IsVisible(changePlayerGroup, function()
            Config.Staff.Permissions['ServerGroup'][ESX.GetPlayerData().group] = sortGroupTable(Config.Staff.Permissions['ServerGroup'][ESX.GetPlayerData().group])
            for k,v in pairs(Config.Staff.Permissions['ServerGroup'][ESX.GetPlayerData().group]) do
                RageUI.Button(v.label, nil, {}, true, {
                    onSelected = function()
                        secured_TriggerServerEvent('kayscore:admin:setGroup', adminManagement.SelectedPlayer.id, v.value)
                        ESX.ShowNotification('✅ Joueur setgroup avec succès')
                    end
                })
            end
        end)

        RageUI.IsVisible(vehiclesOptions, function()
            if (Config.Staff.HavePermission('VehiclesOptions', 'delveh')) then
                RageUI.Button('Supprimer le véhicule', nil, {}, true, {
                    onActive = function()
                        ClosetVehWithDisplay()
                    end,
                    onSelected = function()
                        local veh = ESX.Game.GetClosestVehicle(Player.coords)

                        secured_TriggerServerEvent('kayscore:admin:delVeh', NetworkGetNetworkIdFromEntity(veh))

                        ESX.ShowNotification('✅ Véhicule supprimé avec succès')
                    end
                })
            end
            if (Config.Staff.HavePermission('VehiclesOptions', 'delvehzone')) then
                RageUI.Button('Supprimer véhicules ( zone )', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Définir une zone', function(data)
                            local data = tonumber(data)

                            if data == nil then return ESX.ShowNotification("🚨 Vous devez indiquer un nombre") end

                            local veh = ESX.Game.GetVehiclesInArea(Player.coords, data)

                            for i= 1, #veh, 1 do
                                secured_TriggerServerEvent('kayscore:admin:delVeh', NetworkGetNetworkIdFromEntity(veh[i]))
                            end
    
                            ESX.ShowNotification(('✅ Véhicules supprimés dans une zone de %s mètre'):format(data))
                        end)
                    end
                })
            end
            if (Config.Staff.HavePermission('VehiclesOptions', 'repairvehzone')) then
                RageUI.Button('Réparer véhicules ( zone )', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Définir une zone', function(data)
                            local data = tonumber(data)

                            if data == nil then return ESX.ShowNotification("🚨 Vous devez indiquer un nombre") end

                            local veh = ESX.Game.GetVehiclesInArea2(GetEntityCoords(PlayerPedId()), data)

                            for i= 1, #veh, 1 do
                                secured_TriggerServerEvent('kayscore:admin:repairVeh', veh[i])
                            end
    
                            ESX.ShowNotification(('✅ Véhicules réparés dans une zone de %s mètre'):format(data))
                        end)
                    end
                })
            end
            if (Config.Staff.HavePermission('VehiclesOptions', 'repairveh')) then
                RageUI.Button('Réparer le véhicule', nil, {}, true, {
                    onActive = function()
                        ClosetVehWithDisplay()
                    end,
                    onSelected = function()
                        local veh = ESX.Game.GetClosestVehicle(Player.coords)
                        if not (veh) then
                            ESX.ShowNotification('🚨 Aucun véhicule au alentours')
                        else
                            secured_TriggerServerEvent('kayscore:admin:repairVeh', veh)
                        ESX.ShowNotification('✅ Véhicule réparé avec succès')
                        end
                    end
                })
            end
            if (Config.Staff.HavePermission('VehiclesOptions', 'cleanVehicle')) then
                RageUI.Button('Nettoyer le véhicule', nil, {}, true, {
                    onSelected = function()
                        local veh = ESX.Game.GetClosestVehicle(Player.coords)
                        SetVehicleDirtLevel(veh, 0)

                        ESX.ShowNotification('✅ Véhicule nettoyé avec succès')
                    end
                })
            end
            if (Config.Staff.HavePermission('VehiclesOptions', 'spawnveh')) then
            RageUI.Button("Crocheter le véhicule", nil, {}, true, {
                onSelected = function()
                    local veh = ESX.Game.GetClosestVehicle(Player.coords)
                    NetworkRequestControlOfEntity(veh)
                    local gameTimer = GetGameTimer()
                    while not NetworkHasControlOfEntity(veh) and gameTimer + 2000 > GetGameTimer() do
                        Citizen.Wait(0)
                    end
                    ESX.ShowNotification("Vous avez ~g~déverrouillé~s~ le véhicule.")
                    SetVehicleDoorsLockedForAllPlayers(veh, false)
                    SetEntityAsMissionEntity(veh, true, true)
                    SetVehicleDoorsLocked(veh, 1)
                    SetVehicleHasBeenOwnedByPlayer(veh, true)
                end
            })
            end
            if (Config.Staff.HavePermission('VehiclesOptions', 'spawnveh')) then
                RageUI.Button('Spawn un véhicule', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Model', function(data)
                            secured_TriggerServerEvent('kayscore:admin:spawnVehicle', GetPlayerServerId(PlayerId()), data)
                        end)
                    end
                })
            end
            if (Config.Staff.HavePermission('VehiclesOptions', 'fullcustom')) then
                RageUI.Button('Upgrade le véhicule au max', nil, {}, true, {
                    onActive = function()
                        ClosetVehWithDisplay()
                    end,
                    onSelected = function()
                        local veh = ESX.Game.GetClosestVehicle(Player.coords)

                        secured_TriggerServerEvent('kayscore:admin:fullCustomVeh', veh)
                        ESX.ShowNotification('✅ Véhicule upgrade avec succès')
                    end
                })
            end
            if (Config.Staff.HavePermission('VehiclesOptions', 'returnveh')) then
            RageUI.Button("Essence maximum", nil, {}, true, {
                onSelected = function()
                    local veh = ESX.Game.GetClosestVehicle(Player.coords)
                    AddFuel(GetVehiclePedIsIn(PlayerPedId(), false), 100)
                    ESX.ShowNotification('✅ Plein du véhicule augmenter avec succès')
                end
            })
            end
            if (Config.Staff.HavePermission('VehiclesOptions', 'returnveh')) then
                RageUI.Button('Retourner le véhicule', nil, {}, true, {
                    onActive = function()
                        ClosetVehWithDisplay()
                    end,
                    onSelected = function()
                        local veh = ESX.Game.GetClosestVehicle(Player.coords)
                        if not (veh) then
                            ESX.ShowNotification('🚨 Aucun véhicule au alentours')
                        else
                            secured_TriggerServerEvent("kayscore:admin:returnveh", NetworkGetNetworkIdFromEntity(veh))
                            ESX.ShowNotification('✅ Véhicule retourner avec succès')
                        end
                    end
                }) 
            end
            if (Config.Staff.HavePermission('VehiclesOptions', 'freezeunfreeze')) then
                RageUI.Button('Freeze Unfreeze le véhicule', nil, {}, true, {
                    onActive = function()
                        ClosetVehWithDisplay()
                    end,
                    onSelected = function()
                        local veh = ESX.Game.GetClosestVehicle(Player.coords)
                        if IsEntityPositionFrozen(veh) then
                            secured_TriggerServerEvent('kayscore:admin:freezeunfreezevehicle', NetworkGetNetworkIdFromEntity(veh), false)
                            ESX.ShowNotification('✅ Véhicule unfreeze avec succès')
                        else
                            secured_TriggerServerEvent('kayscore:admin:freezeunfreezevehicle', NetworkGetNetworkIdFromEntity(veh), true)
                            ESX.ShowNotification('✅ Véhicule freeze avec succès')
                        end
                    end
                })
            end
        end)

        RageUI.IsVisible(serverOptions, function()

            RageUI.Button('Créer une société', nil, {}, true, {
                onSelected = function()
                end
            }, openCreateSociety)
        
            RageUI.Button('Modifier une société', nil, {}, true, {
                onSelected = function()
                end
            }, openEditSociety)
        
            RageUI.Button('Créer un job farm', nil, {}, true, {
                onSelected = function()
                end
            }, openCreateFarm)
        
            RageUI.Line()
        
            if Config.Staff.HavePermission('ServerOptions', 'creategarage') then
                RageUI.Button('Gérer les garages', nil, {}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        ExecuteCommand('garages')
                    end
                })
            end
        
            if Config.Staff.HavePermission('ServerOptions', 'fondateur') then
                RageUI.Button('Gérer les véhicules et catégories des concessionnaires', nil, {}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback('kayscore:admin:dealership:refreshvehicleslist', function(cb)
                            if type(cb) == "table" then
                                adminManagement.DealerShipVehicles = cb
                            end
                        end)
                    end
                }, manageVehicleConcess)
        
                -- RageUI.Button('Gérer les véhicules de la boutique', nil, {}, true, {
                --     onSelected = function()
                --     end
                -- }, manageVehicleBoutique)
            end
        
            RageUI.Line()
        
            -- RageUI.Button("Gestion des territoires", nil, {}, true, {
            --     onSelected = function ()
            --         TriggerServerEvent("territories:openAdminMenu")
            --         RageUI.CloseAll()
            --     end
            -- })
        
            if Config.Staff.HavePermission('ServerOptions', 'creategang') then
                RageUI.Button('Gérer les gangs', nil, {}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        ExecuteCommand('gangbuilder')
                    end
                })
            end
        
            if Config.Staff.HavePermission('ServerOptions', 'CreateBlanchiment') then
                RageUI.Button('Gérer les bâtiments de blanchiment', nil, {}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        ExecuteCommand('blanchiment')
                    end
                })
            end
        
            if Config.Staff.HavePermission('ServerOptions', 'weaponsSell') then
                RageUI.Button('Gérer la vente d\'arme', nil, {}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback('kayscore:weapons:getSelling', function(cb)
                            adminManagement.SellingList = cb
                            RageUI.Visible(weaponsSell, true)
                        end)
                    end
                })
            end
        
            -- if Config.Staff.HavePermission('ServerOptions', 'createDrugs') then
            --     RageUI.Button('Gérer la drogue', nil, {}, true, {
            --         onSelected = function()
            --         end
            --     }, createDrugs)
            -- end
        
            RageUI.Line()
        
            if Config.Staff.HavePermission('ServerOptions', 'creategang') then
                RageUI.Button('Créer un doorlock', nil, {}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        ExecuteCommand('doorlock')
                    end
                })
            end
        
        end)
        
        
        RageUI.IsVisible(createDrugs, function()
                RageUI.Button('Créé Circuit', nil, {}, true, {
                    onSelected = function()
                        
                    end
                }, createCircuit)
            RageUI.Button('Edit Circuit', nil, {}, true, {
                    onSelected = function()
                        
                    end
                }, editCircuit)
        RageUI.Button('Edit Sell Drugs', nil, {}, true, {
                    onSelected = function()
                        
                    end
                }, editSellDrugs)
            
        end)
        -- RageUI.IsVisible(weatherManagement, function()
        --     RageUI.Separator(string.format("↓     %sMétéo     ~s~↓", kayscoreConfigServ.GTACOLOR))
        --     for k,v in pairs(weathersZone) do
        --         RageUI.List(v[1], weathers, v[2], "Appuyez sur ENTRER pour définir le temps.", {}, true, {
        --             onListChange = function(Index) 
        --                 v[2] = Index 
        --             end,

        --             onSelected = function(Index)
        --                 TriggerServerEvent('weather:server:setWeather', k, v[2])
        --             end
        --         })
        --     end
        
        -- end)

        RageUI.IsVisible(manageVehicleBoutique, function()
            RageUI.Button('Nom de spawn du véhicule', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nom de spawn du véhicule', function(data)
                        if data == nil or data == "" then return end

                        addvehicleboutiquename = data
                    end)
                end
            })
            RageUI.Button('Nom du véhicule', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nom du véhicule', function(data)
                        if data == nil or data == "" then return end

                        addvehicleboutiquelabel = data
                    end)
                end
            })
            RageUI.Button('Type du Véhicule', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Type du véhicule', function(data)
                        if data == nil or data == "" then return end

                        addvehicletype = data
                    end)
                end
            })
            RageUI.Button('Prix du véhicule', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Prix du véhicule', function(data)
                        local data = tonumber(data)
                        if data == nil then return end

                        addvehicleboutiqueprice = data
                    end)
                end
            })
            if addvehicleboutiquename ~= nil and addvehicleboutiquelabel ~= nil and addvehicleboutiqueprice ~= nil and addvehicletype ~= nil then
                RageUI.Button("Ajouter le véhicule", nil, {Color = {BackgroundColor = {UTILS.ServerColor.r, UTILS.ServerColor.g, UTILS.ServerColor.b, UTILS.ServerColor.o}}}, true, {
                    onSelected = function()
                        secured_TriggerServerEvent('kayscore:staff:boutique:addvehicle', addvehicleboutiquename, addvehicleboutiquelabel, addvehicleboutiqueprice, addvehicletype)
                        addvehicleboutiquename = nil
                        addvehicleboutiquelabel = nil
                        addvehicleboutiqueprice = nil
                        addvehicletype = nil
                    end
                })
            end
            RageUI.Line()
                for k, v in ipairs(BoutiqueConfig['Voiture']) do
                    RageUI.Button(("%s (%s)"):format(v.label, v.spawnName), nil, {RightLabel = ("~g~%s~s~ COINS"):format(v.price)}, true, {
                        onSelected = function()
                            exports['sPrompt']:displayRequestttt(
                                kayscoreConfigServ.ServerName,
                                ('Êtes-vous sûr de vouloir supprimer %s de la boutique ?'):format(v.label), -- Message de confirmation
                                function() -- oui
                                    secured_TriggerServerEvent('kayscore:staff:boutique:removevehicle', v.spawnName)
                                end,
                                function() -- non
                                    ESX.ShowNotification('Achat annulé')
                                end
                            )
                        end
                    })
                end
            end)
            

        RageUI.IsVisible(manageVehicleConcess, function()
            RageUI.Button('Rafraichir la liste des véhicules', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('kayscore:admin:dealership:refreshvehicleslist', function(cb)
                        if type(cb) == "table" then
                            adminManagement.DealerShipVehicles = cb
                        end
                    end)
                end
            })
            RageUI.Line()
            RageUI.Button('Catégories', nil, {RightLabel = '→'}, true, {
                onSelected = function()
                    
                end
            }, manageVehicleConcessEditAllCategorie)
            RageUI.Line()
            RageUI.Button('Ajouter un véhicule', nil, {Color = {BackgroundColor = {UTILS.ServerColor.r, UTILS.ServerColor.g, UTILS.ServerColor.b, UTILS.ServerColor.o}}}, true, {
                onSelected = function()
                    
                end
            }, manageVehicleConcessCreateVehicle)
            RageUI.Button('Rechercher', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Recherche', function(data)
                        adminManagement.SearchVehicle = data
                    end)
                end
            })
            if adminManagement.SearchVehicle then
                RageUI.Button('Stopper la recherche ❌', nil, {RightLabel = adminManagement.SearchVehicle}, true, {
                    onSelected = function()
                        adminManagement.SearchVehicle = nil
                    end
                })
            end
            if json.encode(adminManagement.DealerShipVehicles) ~= "[]" then
                RageUI.Line()
                for k,v in pairs(adminManagement.DealerShipVehicles) do
                    local vehicleInformations = ("%s [%s] (%s)"):format(v.name, v.model, v.category) 
                    if not adminManagement.SearchVehicle then
                        RageUI.Button(vehicleInformations, nil, {RightLabel = ('~g~%s$~s~ →'):format(ESX.Math.GroupDigits(v.price))}, true, {
                            onSelected = function()
                                adminManagement.DealerShipEditVehicle = v

                                RageUI.Visible(manageVehicleConcessEdit, true)
                            end
                        })
                    else
                        if string.match(string.upper(vehicleInformations), string.upper(adminManagement.SearchVehicle)) then
                            RageUI.Button(vehicleInformations, nil, {RightLabel = ('~g~%s$~s~ →'):format(ESX.Math.GroupDigits(v.price))}, true, {
                                onSelected = function()
                                    adminManagement.DealerShipEditVehicle = v

                                    RageUI.Visible(manageVehicleConcessEdit, true)
                                end
                            })
                        end
                    end
                end
            end
        end)
        
        RageUI.IsVisible(manageVehicleConcessEditAllCategorie, function()
            RageUI.Button('Concessionnaire Luxury', nil, {RightLabel = '→'}, true, {
                onSelected = function()
                    adminManagement.EditCategorieType = "vehicle_categories"

                    ESX.TriggerServerCallback('kayscore:staff:vehicles:concess:searchCategory', function(cb)
                        adminManagement.EditCategorieTypeList = cb

                        RageUI.Visible(manageVehicleConcessEditAllCategorieEdit, true)
                    end, adminManagement.EditCategorieType)
                end
            })
            RageUI.Button('Concessionnaire Deux roues', nil, {RightLabel = '→'}, true, {
                onSelected = function()
                    adminManagement.EditCategorieType = "moto_categories"

                    ESX.TriggerServerCallback('kayscore:staff:vehicles:concess:searchCategory', function(cb)
                        adminManagement.EditCategorieTypeList = cb

                        RageUI.Visible(manageVehicleConcessEditAllCategorieEdit, true)
                    end, adminManagement.EditCategorieType)
                end
            })
            RageUI.Button('Concessionnaire Nautiques', nil, {RightLabel = '→'}, true, {
                onSelected = function()
                    adminManagement.EditCategorieType = "boat_categories"

                    ESX.TriggerServerCallback('kayscore:staff:vehicles:concess:searchCategory', function(cb)
                        adminManagement.EditCategorieTypeList = cb

                        RageUI.Visible(manageVehicleConcessEditAllCategorieEdit, true)
                    end, adminManagement.EditCategorieType)
                end
            })
            RageUI.Button('Concessionnaire Aériens', nil, {RightLabel = '→'}, true, {
                onSelected = function()
                    adminManagement.EditCategorieType = "aircraft_categorie"

                    ESX.TriggerServerCallback('kayscore:staff:vehicles:concess:searchCategory', function(cb)
                        adminManagement.EditCategorieTypeList = cb

                        RageUI.Visible(manageVehicleConcessEditAllCategorieEdit, true)
                    end, adminManagement.EditCategorieType)
                end
            })
        end)

        RageUI.IsVisible(manageVehicleConcessEditAllCategorieEdit, function()
            RageUI.Button('Rafraichir la liste des categories', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('kayscore:staff:vehicles:concess:searchCategory', function(cb)
                        adminManagement.EditCategorieTypeList = cb

                        RageUI.Visible(manageVehicleConcessEditAllCategorieEdit, true)
                    end, adminManagement.EditCategorieType)
                end
            })
            RageUI.Button('Ajouter une catégorie', nil, {RightLabel = '→'}, true, {
                onSelected = function()
                    
                end
            }, manageVehicleConcessEditAllCategorieEditAdd)
            RageUI.Line()
            RageUI.Button('Rechercher', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Recherche', function(data)
                        adminManagement.SearchVehicle = data
                    end)
                end
            })
            if adminManagement.SearchVehicle then
                RageUI.Button('Stopper la recherche ❌', nil, {RightLabel = adminManagement.SearchVehicle}, true, {
                    onSelected = function()
                        adminManagement.SearchVehicle = nil
                    end
                })
            end
            RageUI.Line()
            for k,v in pairs(adminManagement.EditCategorieTypeList) do
                local categoryInformations = ("%s (%s)"):format(v.name, v.label) 
                if not adminManagement.SearchVehicle then
                    RageUI.Button(categoryInformations, nil, {RightLabel = '→'}, true, {
                        onSelected = function()
                            adminManagement.DealerShipCategoriesSelect = v.name

                            RageUI.Visible(manageVehicleConcessEditAllCategorieEditInformations, true)
                        end
                    })
                else
                    if string.match(string.upper(categoryInformations), string.upper(adminManagement.SearchVehicle)) then
                        RageUI.Button(categoryInformations, nil, {RightLabel = '→'}, true, {
                            onSelected = function()
                                adminManagement.DealerShipCategoriesSelect = v.name

                                RageUI.Visible(manageVehicleConcessEditAllCategorieEditInformations, true)
                            end
                        })
                    end
                end
            end
        end)

        RageUI.IsVisible(manageVehicleConcessEditAllCategorieEditInformations, function()
            RageUI.Separator(('Édition de la catégorie ~g~%s~s~'):format(adminManagement.DealerShipCategoriesSelect))
            RageUI.Button('Supprimer la catégorie', nil, {}, true, {
                onSelected = function()
                    exports['sPrompt']:displayRequestttt(
                        kayscoreConfigServ.ServerName,
                        'Êtes-vous sûr de vouloir supprimer cette catégorie de véhicules ?', -- Message de confirmation
                        function() -- oui
                            secured_TriggerServerEvent('kayscore:staff:vehicles:concess:categories:delete', adminManagement.EditCategorieType, adminManagement.DealerShipCategoriesSelect)
                            
                            Wait(500)
                            RageUI.GoBack()
                            ESX.TriggerServerCallback('kayscore:staff:vehicles:concess:searchCategory', function(cb)
                                adminManagement.EditCategorieTypeList = cb
                                RageUI.Visible(manageVehicleConcessEditAllCategorieEdit, true)
                            end, adminManagement.EditCategorieType)
                        end,
                        function() -- non
                            ESX.ShowNotification('Suppression annulée')
                        end
                    )
                end
            })
        end)
        

        RageUI.IsVisible(manageVehicleConcessEditAllCategorieEditAdd, function()
            RageUI.Button('Nom de la catégorie', nil, {RightLabel = adminManagement.DealerShipAddVehicleAddParentCategory.name == nil and '~r~Indéfini~s~' or adminManagement.DealerShipAddVehicleAddParentCategory.name}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nom de la catégorie', function(data)
                        if data == '' or data == nil then return end

                        adminManagement.DealerShipAddVehicleAddParentCategory.name = data
                    end)
                end
            })
            RageUI.Button('Nom d\'affiche de la catégorie', nil, {RightLabel = adminManagement.DealerShipAddVehicleAddParentCategory.label == nil and '~r~Indéfini~s~' or adminManagement.DealerShipAddVehicleAddParentCategory.label}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nom d\'affiche de la catégorie', function(data)
                        if data == '' or data == nil then return end

                        adminManagement.DealerShipAddVehicleAddParentCategory.label = data
                    end)
                end
            })
                if adminManagement.DealerShipAddVehicleAddParentCategory.name ~= nil and adminManagement.DealerShipAddVehicleAddParentCategory.label ~= nil then
                    RageUI.Button('Confirmer', nil, {Color = {BackgroundColor = {UTILS.ServerColor.r, UTILS.ServerColor.g, UTILS.ServerColor.b, UTILS.ServerColor.o}}}, true, {
                        onSelected = function()
                            exports['sPrompt']:displayRequestttt(
                                kayscoreConfigServ.ServerName,
                                'Êtes-vous sûr de vouloir ajouter cette catégorie de véhicules ?', -- Message de confirmation
                                function() -- Callback pour action confirmée
                                    secured_TriggerServerEvent('kayscore:staff:vehicles:concess:categories:add', adminManagement.EditCategorieType, adminManagement.DealerShipAddVehicleAddParentCategory)
            
                                    Wait(500)
                                    RageUI.GoBack()
                                    ESX.TriggerServerCallback('kayscore:staff:vehicles:concess:searchCategory', function(cb)
                                        adminManagement.EditCategorieTypeList = cb
                                        RageUI.Visible(manageVehicleConcessEditAllCategorieEdit, true)
                                    end, adminManagement.EditCategorieType)
                                end,
                                function() -- Callback pour annulation
                                    -- Aucune action nécessaire pour l'annulation
                                end
                            )
                        end
                    })
                end
            
                -- Ajoutez ici les autres boutons et fonctionnalités de votre interface RageUI
            end)

        RageUI.IsVisible(manageVehicleConcessEdit, function()
            RageUI.Separator(('Edition du véhicule: ~g~%s~s~ (~g~%s~s~) [~g~%s$~s~] "%s"'):format(adminManagement.DealerShipEditVehicle.name, adminManagement.DealerShipEditVehicle.model, ESX.Math.GroupDigits(adminManagement.DealerShipEditVehicle.price), adminManagement.DealerShipEditVehicle.category))
            RageUI.Line()
            RageUI.Button('Modifier le prix du véhicule', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nouveau prix', function(data)
                        local data = tonumber(data)

                        if data == nil then return end

                        secured_TriggerServerEvent('kayscore:staff:vehicles:concess:changePrice', adminManagement.DealerShipEditVehicle.id, data)

                        Wait(500)
                        RageUI.GoBack()
                        ESX.TriggerServerCallback('kayscore:admin:dealership:refreshvehicleslist', function(cb)
                            if type(cb) == "table" then
                                adminManagement.DealerShipVehicles = cb
                            end
                        end)
                    end)
                end
            })
            RageUI.Button('Renommer le véhicule', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nouveau nom', function(data)
                        if data == nil or data == '' then return end

                        secured_TriggerServerEvent('kayscore:staff:vehicles:concess:renameVehicle', adminManagement.DealerShipEditVehicle.id, data)

                        Wait(500)
                        RageUI.GoBack()
                        ESX.TriggerServerCallback('kayscore:admin:dealership:refreshvehicleslist', function(cb)
                            if type(cb) == "table" then
                                adminManagement.DealerShipVehicles = cb
                            end
                        end)
                    end)
                end
            })
            RageUI.Button('Modifier la catégorie du véhicule', nil, {RightLabel = '→'}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('kayscore:staff:vehicles:concess:catégories:fetch', function(cb)
                        if type(cb) == "table" then
                            adminManagement.DealerShipCategories = cb

                            for k,v in pairs(adminManagement.DealerShipCategories) do
                                if v.name ==  adminManagement.DealerShipEditVehicle.category then
                                    v.enable = true
                                end
                            end

                            RageUI.Visible(manageVehicleConcessEditCategorie, true)
                        end
                    end)
                end
            })
RageUI.Button('Supprimer le véhicule', nil, {Color = {BackgroundColor = {255,0,0,150}}}, true, {
    onSelected = function()
        exports['sPrompt']:displayRequestttt(
            kayscoreConfigServ.ServerName,
            'Êtes-vous sûr de vouloir supprimer ce véhicule ?', -- Message de confirmation
            function() -- Callback pour action confirmée
                secured_TriggerServerEvent('kayscore:staff:vehicles:concess:deleteVehicle', adminManagement.DealerShipEditVehicle.id)

                Wait(500)
                RageUI.GoBack()
                ESX.TriggerServerCallback('kayscore:admin:dealership:refreshvehicleslist', function(cb)
                    if type(cb) == "table" then
                        adminManagement.DealerShipVehicles = cb
                    end
                end)
            end,
            function() -- Callback pour annulation
                ESX.ShowNotification('Suppression annulée') -- Notification ajoutée pour l'annulation
            end
        )
    end
})
end)

        RageUI.IsVisible(manageVehicleConcessEditCategorie, function()
            RageUI.Button('Rechercher', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Recherche', function(data)
                        adminManagement.SearchVehicleCategorie = data
                    end)
                end
            })
            if adminManagement.SearchVehicleCategorie then
                RageUI.Button('Stopper la recherche ❌', nil, {RightLabel = adminManagement.SearchVehicleCategorie}, true, {
                    onSelected = function()
                        adminManagement.SearchVehicleCategorie = nil
                    end
                })
            end
            RageUI.Button('Confirmer les modifications', nil, {Color = {BackgroundColor = {UTILS.ServerColor.r, UTILS.ServerColor.g, UTILS.ServerColor.b, UTILS.ServerColor.o}}}, true, {
                onSelected = function()
                    secured_TriggerServerEvent('kayscore:staff:vehicles:concess:changeCategory', adminManagement.DealerShipEditVehicle.id, adminManagement.DealerShipEditVehicle.category)
                    Wait(500)
                    RageUI.GoBack()
                    ESX.TriggerServerCallback('kayscore:admin:dealership:refreshvehicleslist', function(cb)
                        if type(cb) == "table" then
                            adminManagement.DealerShipVehicles = cb

                            RageUI.GoBack()
                        end
                    end)
                end
            })
            RageUI.Line()
            for k,v in pairs(adminManagement.DealerShipCategories) do
                if adminManagement.SearchVehicleCategorie == nil then
                    RageUI.Checkbox(('%s (%s)'):format(v.label, v.name), nil, v.enable, {}, {
                        onChecked = function()
                            for k,v in pairs(adminManagement.DealerShipCategories) do
                                v.enable = false
                            end
    
                            v.enable = true
    
                            adminManagement.DealerShipEditVehicle.category = v.name
                        end,
                        onUnChecked = function()
                            for k,v in pairs(adminManagement.DealerShipCategories) do
                                v.enable = false
                            end
    
                            adminManagement.DealerShipEditVehicle.category = v.name
                        end
                    })
                else
                    if string.match(string.upper(v.name), string.upper(adminManagement.SearchVehicleCategorie)) or string.match(string.upper(v.label), string.upper(adminManagement.SearchVehicleCategorie)) then
                        RageUI.Checkbox(('%s (%s)'):format(v.label, v.name), nil, v.enable, {}, {
                            onChecked = function()
                                for k,v in pairs(adminManagement.DealerShipCategories) do
                                    v.enable = false
                                end
        
                                v.enable = true
        
                                adminManagement.DealerShipEditVehicle.category = v.name
                            end,
                            onUnChecked = function()
                                for k,v in pairs(adminManagement.DealerShipCategories) do
                                    v.enable = false
                                end
        
                                adminManagement.DealerShipEditVehicle.category = v.name
                            end
                        })
                    end
                end
            end
        end)

        RageUI.IsVisible(manageVehicleConcessCreateVehicle, function()
            RageUI.Button('Nom du Spawn', nil, {RightLabel = adminManagement.DealerShipAddVehicle.spawnName == nil and '~r~Indéfini~s~' or adminManagement.DealerShipAddVehicle.spawnName}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nom du Spawn', function(data)
                        if data == nil or data == '' then return end
                        
                        adminManagement.DealerShipAddVehicle.spawnName = data
                    end)
                end
            })
            RageUI.Button('Nom du Véhicule', nil, {RightLabel = adminManagement.DealerShipAddVehicle.label == nil and '~r~Indéfini~s~' or adminManagement.DealerShipAddVehicle.label}, true, {
                onSelected = function()
                    KeyboardUtils.use('Label du Véhicule', function(data)
                        if data == nil or data == '' then return end
                        
                        adminManagement.DealerShipAddVehicle.label = data
                    end)
                end
            })
            RageUI.Button('Prix du Véhicule', nil, {RightLabel = adminManagement.DealerShipAddVehicle.price == nil and '~r~Indéfini~s~' or ("~g~%s$~s~"):format(ESX.Math.GroupDigits(adminManagement.DealerShipAddVehicle.price))}, true, {
                onSelected = function()
                    KeyboardUtils.use('Prix du Véhicule', function(data)
                        if data == nil or data == '' then return end
                        
                        adminManagement.DealerShipAddVehicle.price = data
                    end)
                end
            })
            RageUI.Button('Catégorie', nil, {RightLabel = adminManagement.DealerShipCategoriesSelect == nil and '→' or adminManagement.DealerShipCategoriesSelect}, true, {
                onSelected = function()
                    if json.encode(adminManagement.DealerShipCategories) ~= "[]" then return end
                    ESX.TriggerServerCallback('kayscore:staff:vehicles:concess:catégories:fetch', function(cb)
                        if type(cb) == "table" then
                            adminManagement.DealerShipCategories = cb
                        end
                    end)
                end
            }, manageVehicleConcessCreateVehicleCategorie)
            if adminManagement.DealerShipAddVehicle.spawnName ~= nil and adminManagement.DealerShipAddVehicle.label ~= nil and adminManagement.DealerShipAddVehicle.price ~= nil and adminManagement.DealerShipCategoriesSelect ~= nil then
                RageUI.Button('Confirmer', nil, {Color = {BackgroundColor = {UTILS.ServerColor.r, UTILS.ServerColor.g, UTILS.ServerColor.b, UTILS.ServerColor.o}}}, true, {
                    onSelected = function()
                        secured_TriggerServerEvent('kayscore:staff:vehicles:concess:addVehicle', adminManagement.DealerShipAddVehicle, adminManagement.DealerShipCategoriesSelect)

                        adminManagement.DealerShipCategoriesSelect = nil
                        adminManagement.DealerShipAddVehicle = {
                            spawnName = nil,
                            label = nil,
                            price = nil,
                            categorie = nil
                        }
                    end
                })
            end
        end)

        RageUI.IsVisible(manageVehicleConcessCreateVehicleCategorie, function()
            RageUI.Button('Rechercher', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Recherche', function(data)
                        adminManagement.SearchVehicleCategorie = data
                    end)
                end
            })
            if adminManagement.SearchVehicleCategorie then
                RageUI.Button('Stopper la recherche ❌', nil, {RightLabel = adminManagement.SearchVehicleCategorie}, true, {
                    onSelected = function()
                        adminManagement.SearchVehicleCategorie = nil
                    end
                })
            end
            RageUI.Line()
            for k,v in pairs(adminManagement.DealerShipCategories) do
                if adminManagement.SearchVehicleCategorie == nil then
                    RageUI.Checkbox(('%s (%s)'):format(v.label, v.name), nil, v.enable, {}, {
                        onChecked = function()
                            for k,v in pairs(adminManagement.DealerShipCategories) do
                                v.enable = false
                            end
    
                            v.enable = true
    
                            adminManagement.DealerShipCategoriesSelect = v.name
                        end,
                        onUnChecked = function()
                            for k,v in pairs(adminManagement.DealerShipCategories) do
                                v.enable = false
                            end
    
                            adminManagement.DealerShipCategoriesSelect = nil
                        end
                    })
                else
                    if string.match(string.upper(v.name), string.upper(adminManagement.SearchVehicleCategorie)) or string.match(string.upper(v.label), string.upper(adminManagement.SearchVehicleCategorie)) then
                        RageUI.Checkbox(('%s (%s)'):format(v.label, v.name), nil, v.enable, {}, {
                            onChecked = function()
                                for k,v in pairs(adminManagement.DealerShipCategories) do
                                    v.enable = false
                                end
        
                                v.enable = true
        
                                adminManagement.DealerShipCategoriesSelect = v.name
                            end,
                            onUnChecked = function()
                                for k,v in pairs(adminManagement.DealerShipCategories) do
                                    v.enable = false
                                end
        
                                adminManagement.DealerShipCategoriesSelect = nil
                            end
                        })
                    end
                end
            end
        end)

        RageUI.IsVisible(openJobList, function()
            for k, v in pairs(adminManagement.jobsData) do
                RageUI.Button(('%s (%s)'):format(k, v.label), "Press ENTRER pour enlever toutes les personnes ayant ce jobs ", {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Y / N', function(data)
                            if data == "y" or data == 'Y' then
                                secured_TriggerServerEvent('kayscore:jobs:RemoveallJobs', v.name)
                            end
                        end)
                    end
                })
            end
        end)

        RageUI.IsVisible(editSellDrugs, function()
            RageUI.Button('Ajouter une position', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Message', function(data)
                        if data == nil or data == '' then
                            return
                        end

                        secured_TriggerServerEvent('kayscore:drugs:sell:addPos', GetEntityCoords(Player.playerPed), data)
                    end)
                end
            })
            RageUI.Line()
            for k,v in pairs(kayscoreDrugs.sell.Position) do
                RageUI.Button(v.pos.x..' '.. v.pos.y.. ' ' .. v.pos.z, '\n[E] pour se téléporter sur le point\n\n'..v.message, {}, true, {
                    onActive = function()
                        
                        if IsControlJustPressed(0,54) then
                            SetEntityCoords(Player.playerPed, vector3(v.pos.x, v.pos.y, v.pos.z))
                        end

                        DrawMarker(1, v.pos.x, v.pos.y, v.pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 240, 255, 0, 255, false, false, 2, false, false, false, false)
                        DrawInstructionBarNotification(v.pos.x, v.pos.y, v.pos.z+0.25, v.pos.x..' '.. v.pos.y.. ' ' .. v.pos.z)

                    end,
                    onSeleted = function()
                        KeyboardUtils('Taper Y pour supprimer la positon', function(data)
                            if data == 'y' or data == 'Y' then
                                secured_TriggerServerEvent('kayscore:drugs:sell:delete', v.id)
                            end
                        end)
                    end
                })
            end
        end)

        RageUI.IsVisible(editCircuit, function()
            for k,v in pairs(kayscoreDrugs.Items) do
                RageUI.Button(('%s (%s) (r-%s) (t-%s)'):format(v.recolte.name, v.recolte.label, #kayscoreDrugs.Drugs[k]['recolte'], #kayscoreDrugs.Drugs[k]['traitement']), nil, {RightLabel = '>>'}, true, {
                    onSelected = function()
                        adminManagement.SelectedDrugs = v
                        RageUI.Visible(editCircuit2, true)
                    end
                })
            end
        end)

        RageUI.IsVisible(editCircuit2, function()
            if json.encode(adminManagement.SelectedDrugs) ~= '[]' then
                RageUI.Separator(("Informations de la drogue ~y~%s - %s~s~"):format(adminManagement.SelectedDrugs.recolte.name, adminManagement.SelectedDrugs.recolte.label))

                RageUI.Line()

                RageUI.Button('Changer le nom', nil, {}, true, {
                    onSelected = function()
                        
                    end
                })
                RageUI.Button('Changer le label', nil, {}, true, {
                    onSelected = function()
                        
                    end
                })
                RageUI.Button('Changer le nom du pochon', nil, {}, true, {
                    onSelected = function()
                        
                    end
                })
                RageUI.Button('Changer le label du pochon', nil, {}, true, {
                    onSelected = function()
                        
                    end
                })
                RageUI.Button('Gérer les positions de recolte', nil, {RightLabel = ('~y~%s~s~'):format(#kayscoreDrugs.Drugs[adminManagement.SelectedDrugs.recolte.name]['recolte'])}, true, {
                    onSelected = function()
                        adminManagement.SelectedDrugsCategorie = 'recolte'
                    end
                }, editPosWithCategorie_drugs)
                RageUI.Button('Gérer les positions de traitement', nil, {RightLabel = ('~y~%s~s~'):format(#kayscoreDrugs.Drugs[adminManagement.SelectedDrugs.recolte.name]['traitement'])}, true, {
                    onSelected = function()
                        adminManagement.SelectedDrugsCategorie = 'traitement'
                    end
                }, editPosWithCategorie_drugs)
            end
        end)

        RageUI.IsVisible(editPosWithCategorie_drugs, function()
            RageUI.Separator(('Catégorie: ~y~%s~s~'):format(adminManagement.SelectedDrugsCategorie))
            RageUI.Button('Ajouter une position', nil, {RightLabel = ('~y~%s positions~s~'):format(#kayscoreDrugs.Drugs[adminManagement.SelectedDrugs.recolte.name][adminManagement.SelectedDrugsCategorie])}, true, {
                onSelected = function()
                    
                end
            })
            RageUI.Line()
            for k,v in pairs(kayscoreDrugs.Drugs[adminManagement.SelectedDrugs.recolte.name][adminManagement.SelectedDrugsCategorie]) do
                DrawMarker(1, v.x, v.y, v.z-1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 240, 255, 0, 255, false, false, 2, false, false, false, false)
                DrawInstructionBarNotification(v.x, v.y, v.z, (v.x..' '..v.y..' '..v.z.. ' (%s)'):format(adminManagement.SelectedDrugsCategorie))
                RageUI.Button(('[%s] (%s %s %s)'):format(k, v.x, v.y, v.z), '\n[ENTER] changer la position\n[E] supprimer la positon\n', {RightLabel = ''}, true, {
                    onActive = function()
                        DrawMarker(43, v.x, v.y, v.z-1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 240, 0, 0, 255, false, false, 2, false, false, false, false)
                        DrawInstructionBarNotification(v.x, v.y, v.z, (v.x..' '..v.y..' '..v.z.. ' (%s)'):format(adminManagement.SelectedDrugsCategorie))

                        if IsControlJustPressed(0, 54) then
                            
                        end
                    end,
                    onSelected = function()
                        
                    end
                })
            end
        end)

        RageUI.IsVisible(createCircuit, function()
            RageUI.Separator('Création d\'un circuit de drogue')
            RageUI.Checkbox('Laboratoire', nil, adminManagement.CreateDrugs.Laboratory.active, {}, {
                onChecked = function()
                    adminManagement.CreateDrugs.Laboratory.active = true
                end,
                onUnChecked = function()
                    adminManagement.CreateDrugs.Laboratory.active = false
                end
            })
            if adminManagement.CreateDrugs.Laboratory.active == false then
                RageUI.Button('Nom de la drogue', nil, {RightLabel = adminManagement.CreateDrugs.name or '~r~Indéfini~s~'}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Nom de la drogue', function(data)
                            if not data or data == '' then return end
    
                            adminManagement.CreateDrugs.name = data
                        end)
                    end
                })
                RageUI.Button('Label de la drogue', nil, {RightLabel = adminManagement.CreateDrugs.label or '~r~Indéfini~s~'}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Label de la drogue', function(data)
                            if not data or data == '' then return end
    
                            adminManagement.CreateDrugs.label = data
                        end)
                    end
                })
                RageUI.Separator('~y~↓ Récolte ↓~s~')
                RageUI.Button('Type d\'animation', nil, {RightLabel = adminManagement.CreateDrugs.recolte_animtype or '~r~Indéfini~s~'}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Type d\'animation (anim/scenario)', function(data)
                            if not data or data == '' then return end
    
                            adminManagement.CreateDrugs.recolte_animtype = data
                        end)
                    end
                })
                RageUI.Button('Dict de l\'animation', nil, {RightLabel = adminManagement.CreateDrugs.recolte_animdict or '~r~Indéfini~s~'}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Dict de l\'animation)', function(data)
                            if not data or data == '' then return end
    
                            adminManagement.CreateDrugs.recolte_animdict = data
                        end)
                    end
                })
                RageUI.Button('Animation', nil, {RightLabel = adminManagement.CreateDrugs.recolte_anim or '~g~Aucune~s~'}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Animation', function(data)
                            if not data or data == '' then 
                                adminManagement.CreateDrugs.recolte_anim = nil
                                return 
                            end
    
                            adminManagement.CreateDrugs.recolte_anim = data
                        end)
                    end
                })
                RageUI.Button('Durée de l\'animation', nil, {RightLabel = adminManagement.CreateDrugs.recolte_animtime or '~r~Indéfini~s~'}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Animation', function(data)
                            local data = tonumber(data)
                            if data == nil then return end
                
                            adminManagement.CreateDrugs.recolte_animtime = data
                        end)
                    end
                })
                RageUI.Checkbox('Marker', nil, adminManagement.CreateDrugs.recolte_marker or false, {}, {
                    onActive = function()
                        if adminManagement.CreateDrugs.recolte_marker == nil then
                            adminManagement.CreateDrugs.recolte_marker = false
                        end
                    end,
                    onChecked = function()
                        adminManagement.CreateDrugs.recolte_marker = true
                    end,
                    onUnChecked = function()
                        adminManagement.CreateDrugs.recolte_marker = false
                    end
                })
                RageUI.Button('Props (Si pas de marker)', nil, {RightLabel = adminManagement.CreateDrugs.recolte_props or '~g~Aucun~s~'}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Animation', function(data)
                            if not data or data == '' then 
                                adminManagement.CreateDrugs.recolte_props = nil
                                return 
                            end
                            adminManagement.CreateDrugs.recolte_props = data
                        end)
                    end
                })
                RageUI.Button(('Ajouter des positions à la récolte (%s) position'):format(adminManagement.CreateDrugs.posRecolte and #adminManagement.CreateDrugs.posRecolte or 0), '\n[E] pour retirer la dernnière position\n', {}, true, {
                    onActive = function()
                        if IsControlJustPressed(0, 54) then
                            adminManagement.CreateDrugs.posRecolte[#adminManagement.CreateDrugs.posRecolte] = nil
                        end
    
                        if adminManagement.CreateDrugs.posRecolte then
                            for k,v in pairs(adminManagement.CreateDrugs.posRecolte) do
                                DrawMarker(1, v.x, v.y, v.z-1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 240, 255, 0, 255, false, false, 2, false, false, false, false)
                                DrawInstructionBarNotification(v.x, v.y, v.z+0.15, ('Récolte'))
                            end
                        end
                    end,
                    onSelected = function()
                        if not adminManagement.CreateDrugs.posRecolte then
                            adminManagement.CreateDrugs.posRecolte = {}
                        end
    
                        adminManagement.CreateDrugs.posRecolte[#adminManagement.CreateDrugs.posRecolte+1] = GetEntityCoords(PlayerPedId())
                    end
                })
            RageUI.Separator('~y~↓ Traitement ↓~s~')
            RageUI.Button('Type d\'animation', nil, {RightLabel = adminManagement.CreateDrugs.traitement_animtype or '~r~Indéfini~s~'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Type d\'animation (anim/scenario)', function(data)
                        if not data or data == '' then return end
            
                        adminManagement.CreateDrugs.traitement_animtype = data
                    end)
                end
            })
            RageUI.Button('Dict de l\'animation', nil, {RightLabel = adminManagement.CreateDrugs.traitement_animdict or '~r~Indéfini~s~'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Dict de l\'animation)', function(data)
                        if not data or data == '' then return end
            
                        adminManagement.CreateDrugs.traitement_animdict = data
                    end)
                end
            })
            RageUI.Button('Animation', nil, {RightLabel = adminManagement.CreateDrugs.traitement_anim or '~g~Aucune~s~'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Animation', function(data)
                        if not data or data == '' then 
                            adminManagement.CreateDrugs.traitement_anim = nil
                            return 
                        end
            
                        adminManagement.CreateDrugs.traitement_anim = data
                    end)
                end
            })
            RageUI.Button('Durée de l\'animation', nil, {RightLabel = adminManagement.CreateDrugs.traitement_animtime or '~r~Indéfini~s~'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Animation', function(data)
                        local data = tonumber(data)
                        if data == nil then return end
            
                        adminManagement.CreateDrugs.traitement_animtime = data
                    end)
                end
            })
            RageUI.Checkbox('Marker', nil, adminManagement.CreateDrugs.traitement_marker or false, {}, {
                onActive = function()
                    if adminManagement.CreateDrugs.traitement_marker == nil then
                        adminManagement.CreateDrugs.traitement_marker = false
                    end
                end,
                onChecked = function()
                    adminManagement.CreateDrugs.traitement_marker = true
                end,
                onUnChecked = function()
                    adminManagement.CreateDrugs.traitement_marker = false
                end
            })
            RageUI.Button('Props (Si pas de marker)', nil, {RightLabel = adminManagement.CreateDrugs.traitement_props or '~g~Aucun~s~'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Animation', function(data)
                        if not data or data == '' then 
                            adminManagement.CreateDrugs.traitement_props = nil
                            return 
                        end
                        adminManagement.CreateDrugs.traitement_props = data
                    end)
                end
            })
            RageUI.Button('Nom de la drogue traitée', nil, {RightLabel = adminManagement.CreateDrugs.name_pooch or '~r~Indéfini~s~'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nom de la drogue traitée', function(data)
                        if not data or data == '' then return end

                        adminManagement.CreateDrugs.name_pooch = data
                    end)
                end
            })
            RageUI.Button('Label de la drogue traitée', nil, {RightLabel = adminManagement.CreateDrugs.label_pooch or '~r~Indéfini~s~'}, true, {
                onSelected = function()
                    KeyboardUtils.use('Label de la drogue traitée', function(data)
                        if not data or data == '' then return end

                        adminManagement.CreateDrugs.label_pooch = data
                    end)
                end
            })
            RageUI.Button(('Ajouter des positions au traitement (%s) position'):format(adminManagement.CreateDrugs.posTraitement and #adminManagement.CreateDrugs.posTraitement or 0), '\n[E] pour retirer la dernnière position\n', {}, true, {
                onActive = function()
                    if IsControlJustPressed(0, 54) then
                        adminManagement.CreateDrugs.posTraitement[#adminManagement.CreateDrugs.posTraitement] = nil
                    end

                    if adminManagement.CreateDrugs.posTraitement then
                        for k,v in pairs(adminManagement.CreateDrugs.posTraitement) do
                            DrawMarker(1, v.x, v.y, v.z-1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 240, 255, 0, 255, false, false, 2, false, false, false, false)
                            DrawInstructionBarNotification(v.x, v.y, v.z+0.15, ('Traitement'))
                        end
                    end
                end,
                onSelected = function()
                    if not adminManagement.CreateDrugs.posTraitement then
                        adminManagement.CreateDrugs.posTraitement = {}
                    end

                    adminManagement.CreateDrugs.posTraitement[#adminManagement.CreateDrugs.posTraitement+1] = GetEntityCoords(PlayerPedId())
                end
            })
            else
                RageUI.Separator('~y~↓ Mode laboratoire ↓~s~')
                for k,v in pairs(adminManagement.CreateDrugs.Laboratory.list) do
                    RageUI.Checkbox(v.label, nil, adminManagement.CreateDrugs.Laboratory.list[k].active, {}, {
                        onChecked = function()

                            for k,v in pairs(adminManagement.CreateDrugs.Laboratory.list) do
                                if v.active == true then
                                    adminManagement.CreateDrugs.Laboratory.list[k].active = false

                                    adminManagement.CreateDrugs.Laboratory.pos = nil
                                end
                            end

                            adminManagement.CreateDrugs.Laboratory.list[k].active = true
                        end,
                        onUnChecked = function()
                            adminManagement.CreateDrugs.Laboratory.list[k].active = false

                            adminManagement.CreateDrugs.Laboratory.activeLaboratory = false

                            adminManagement.CreateDrugs.Laboratory.pos = nil
                        end
                    })
                end

                for k,v in pairs(adminManagement.CreateDrugs.Laboratory.list) do
                    if v.active == true then
                        adminManagement.CreateDrugs.Laboratory.activeLaboratory = true
                        adminManagement.CreateDrugs.Laboratory.activeLaboratoryName = v.name
                    end
                end

                if adminManagement.CreateDrugs.Laboratory.activeLaboratory then
                    RageUI.Separator('~y~↓ Informations et Paramètres du laboratoire ↓~s~')
                    RageUI.Separator(('%s'):format(adminManagement.CreateDrugs.Laboratory.list[adminManagement.CreateDrugs.Laboratory.activeLaboratoryName].label))
                    RageUI.Button('Nom du laboratoire', nil, {RightLabel = not  adminManagement.CreateDrugs.Laboratory.name and '~r~Indéfini~s~' or  adminManagement.CreateDrugs.Laboratory.name}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Nom du laboratoire', function(data)
                                if data == nil or data == '' then return end

                                adminManagement.CreateDrugs.Laboratory.name = data
                            end)
                        end
                    })
                    RageUI.Button('Position du laboratoire', adminManagement.CreateDrugs.Laboratory.pos or '', {RightLabel = not adminManagement.CreateDrugs.Laboratory.pos and '~r~Indéfini~s~' or '~g~Défini~s~'}, true, {
                        onActive = function()
                            if adminManagement.CreateDrugs.Laboratory.pos then
                                v = adminManagement.CreateDrugs.Laboratory.pos
                                DrawMarker(1, v.x, v.y, v.z-1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 240, 255, 0, 255, false, false, 2, false, false, false, false)
                                DrawInstructionBarNotification(v.x, v.y, v.z, (v.x..' '..v.y..' '..v.z.. ' (Position du laboratoire)'))
                            end
                        end,
                        onSelected = function()
                            adminManagement.CreateDrugs.Laboratory.pos = Player.coords
                        end
                    })
                end
            end
            RageUI.Line()
            RageUI.Button('Confirmer', nil, {Color = {BackgroundColor = {0,255,0,150}}}, true, {
                onSelected = function()

                    if not adminManagement.CreateDrugs.Laboratory.active then
                        if json.encode(adminManagement.CreateDrugs) == '[]' then return end
                        if not adminManagement.CreateDrugs.posTraitement then return end
                        if not adminManagement.CreateDrugs.posRecolte then return end
    
                        if #adminManagement.CreateDrugs.posTraitement < 1 then return end
                        if #adminManagement.CreateDrugs.posRecolte < 1 then return end
    
                        if adminManagement.CreateDrugs.name == nil or adminManagement.CreateDrugs.label == nil then return end 
                        if adminManagement.CreateDrugs.recolte_animtype == nil or adminManagement.CreateDrugs.recolte_animdict == nil then return end
    
                        if adminManagement.CreateDrugs.traitement_animtype == nil or adminManagement.CreateDrugs.traitement_animdict == nil then return end
    
                        if adminManagement.CreateDrugs.name_pooch == nil or adminManagement.CreateDrugs.label_pooch == nil then return end
    
                        if adminManagement.CreateDrugs.recolte_animtime == nil then return end
                        if adminManagement.CreateDrugs.traitement_animtime == nil then return end 
    
                        if kayscoreDrugs.Drugs[adminManagement.CreateDrugs.name] then return ESX.ShowNotification('Cette drogue existe déjà') end
    
                        secured_TriggerServerEvent('kayscore:drugs:create', adminManagement.CreateDrugs)
                    else
                        if not adminManagement.CreateDrugs.Laboratory.activeLaboratory then return end
                        if adminManagement.CreateDrugs.Laboratory.name == nil then return end
                        if adminManagement.CreateDrugs.Laboratory.pos == nil then return end

                        secured_TriggerServerEvent('kayscore:admin:labo:create', adminManagement.CreateDrugs.Laboratory)
                    end
                end
            })
        end)

        RageUI.IsVisible(weaponsSell, function()
            RageUI.Button('Ajouter un groupe', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('kayscore:admin:getAllJobs', function(cb)
                        adminManagement.SelectedJobType = 0
                        adminManagement.AddJobList = cb

                        RageUI.Visible(weaponsSellGroupList, true)
                    end)
                end
            })
            RageUI.Line()
            for k,v in pairs(adminManagement.SellingList) do
                RageUI.Button(v.name..' - '..v.label, nil, {}, true, {
                    onSelected = function()
                        secured_TriggerServerEvent('kayscore:weapons:sell:delete', v.name)

                        RageUI.GoBack()
                    end
                })
            end
        end)

        RageUI.IsVisible(weaponsSellGroupList, function()
            RageUI.Button('Rechercher', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nom/Label/Id du job', function(data)
                        adminManagement.AddSearchJob = data
                    end)
                end
            })
            if adminManagement.AddSearchJob then
                RageUI.Button('❌ Arrêter la Recherche', nil, {}, true, {
                    onSelected = function()
                        adminManagement.AddSearchJob = nil
                    end
                })
            end
            for k,v in pairs(adminManagement.AddJobList) do
                local jobData = ('[%s] %s (%s)'):format(k, v.name, v.label)
                if tonumber(v.type) == tonumber(adminManagement.SelectedJobType) then
                    if (not adminManagement.AddSearchJob) then
                        RageUI.Button(jobData, nil, {}, true, {
                            onSelected = function()
                                secured_TriggerServerEvent('kayscore:weapons:sell:add', v)

                                RageUI.GoBack()

                                ESX.TriggerServerCallback('kayscore:admin:getAllJobs', function(cb)
                                    adminManagement.SelectedJobType = 0
                                    adminManagement.AddJobList = cb
            
                                    RageUI.Visible(weaponsSellGroupList, true)
                                end)
                            end
                        })
                    else
                        if (string.match(string.lower(jobData), string.lower(adminManagement.AddSearchJob))) then 
                            RageUI.Button(jobData, nil, {}, true, {
                                onSelected = function()
                                    secured_TriggerServerEvent('kayscore:weapons:sell:add', v)

                                    RageUI.GoBack()

                                    ESX.TriggerServerCallback('kayscore:admin:getAllJobs', function(cb)
                                        adminManagement.SelectedJobType = 0
                                        adminManagement.AddJobList = cb
                
                                        RageUI.Visible(weaponsSellGroupList, true)
                                    end)
                                end
                            })
                        end
                    end
                end
            end
        end)
    
        RageUI.IsVisible(reportsList, function()
            RageUI.Checkbox('Filtres', nil, adminManagement.Filters, {}, {
                onChecked = function()
                    adminManagement.Filters = true
                end,
                onUnChecked = function()
                    adminManagement.Filters = false
                end
            })
            if adminManagement.Filters == true then
                RageUI.List('Afficher les reports', adminManagement.FiltersList, adminManagement.FiltersListIndex, nil, {}, true, {
                    onListChange = function(Index)
                        adminManagement.FiltersListIndex = Index
                    end
                })
            end
            RageUI.Line()
            for k,v in pairs(adminManagement.Reports) do
                if not adminManagement.Filters or adminManagement.FiltersListIndex == 1 then
                    RageUI.Button((v.take and v.takeUID == ESX.PlayerData.UniqueID and '~g~'..'Report #%s (%s)' or '~r~Report #%s (%s)'):format(k, v.author), ('\n%s\n'):format(v.reason), {RightLabel = v.take == false and '❌' or '✅ '}, true, {
                        onActive = function()
                            RageUI.Info(
                                string.format("%sInformation Report", kayscoreConfigServ.GTACOLOR),
                                {'Raison : ', 'Pris par : ', "ID du joueur: " },
                                {v.reason, v.takeBY, k}
                            )
                                                    end,
                        onSelected = function()
                            adminManagement.SelectedReport = v
                        end
                    }, selectedReport)
                elseif adminManagement.Filters and adminManagement.FiltersListIndex == 2 then
                    if v.take == true then
                        RageUI.Button(('Report #%s (%s)'):format(k, v.author), ('\n%s\n'):format(v.reason), {RightLabel = v.take == false and '❌' or '✅'}, true, {
                            onActive = function()
                                RageUI.Info(
                                    string.format("%sInformation Report", kayscoreConfigServ.GTACOLOR),
                                    {'Raison : ', 'Pris par : ', "ID du joueur: " },
                                    {v.reason, v.takeBY, k}
                                )
                                                            end,
                            onSelected = function()
                                adminManagement.SelectedReport = v
                            end
                        }, selectedReport)
                    end
                elseif adminManagement.Filters and adminManagement.FiltersListIndex == 3 then
                    if v.take == false then
                        RageUI.Button(('Report #%s (%s)'):format(k, v.author), ('\n%s\n'):format(v.reason), {RightLabel = v.take == false and '❌' or '✅'}, true, {
                            onActive = function()
                                RageUI.Info(
                                    string.format("%sInformation Report", kayscoreConfigServ.GTACOLOR),
                                    {'Raison : ', 'Pris par : ', "ID du joueur: " },
                                    {v.reason, v.takeBY, k}
                                )
                                                            end,
                            onSelected = function()
                                adminManagement.SelectedReport = v
                            end
                        }, selectedReport)
                    end
                end
            end
        end)

        RageUI.IsVisible(selectedReport, function()
            RageUI.Separator(adminManagement.SelectedReport.author)
            if not adminManagement.SelectedReport.take then
                RageUI.Button('Prendre le report', nil, {}, true, {
                    onSelected = function()
                        adminManagement.SelectedReport.take = true
                        secured_TriggerServerEvent('kayscore:admin:takeReport', adminManagement.SelectedReport.UniqueID, adminManagement.SelectedReport.source)
                        secured_TriggerServerEvent('kayscore:admin:getPosForRreturnPlayer', adminManagement.SelectedReport.source)

                        Wait(300)
                        if not adminManagement.NoClip then
                            NoClip(true)
                        end
                    end
                })
            end
            RageUI.Info(
                string.format("%sInformation Report", kayscoreConfigServ.GTACOLOR),
                {'Auteur : ', "ID du joueur: " },
                {adminManagement.SelectedReport.author, adminManagement.SelectedReport.UniqueID}
            )
                        RageUI.Button('Clore le report', nil, {}, true, {
                onSelected = function()
                    secured_TriggerServerEvent('kayscore:admin:closeReport', adminManagement.SelectedReport.UniqueID, adminManagement.SelectedReport.source)
                    adminManagement.Reports[adminManagement.SelectedReport.UniqueID] = nil
                    RageUI.GoBack()
                end
            })
                if adminManagement.SelectedReport.take then
                if Config.Staff.HavePermission('ManagePlayers', 'goto') then
                    RageUI.Button('Se Téléporter', nil, {}, true, {
                        onSelected = function()
                            secured_TriggerServerEvent('kayscore:admin:goto', adminManagement.SelectedReport.source)
                        end
                    })
                end
                if Config.Staff.HavePermission('ManagePlayers', 'bring') then
                    RageUI.Button('Téléporter sur moi', nil,  {}, true, {
                        onSelected = function()
                            secured_TriggerServerEvent('kayscore:admin:bring', adminManagement.SelectedReport.source, GetEntityCoords(PlayerPedId()))
                        end
                    })
                end
                RageUI.Button('Retourner', nil, {}, true, {
                    onSelected = function()
                        if adminManagement.LastPlayerPos[adminManagement.SelectedReport.source] == nil then return end
    
                        secured_TriggerServerEvent('kayscore:admin:xPlayer.return', adminManagement.SelectedReport.source, adminManagement.LastPlayerPos[adminManagement.SelectedReport.source].pos)
                    end
                })
                if Config.Staff.HavePermission('ManagePlayers', 'gopc') then
                    RageUI.Button('Téléporter au Parking Central', nil, {}, true, {
                        onSelected = function()
                            secured_TriggerServerEvent('kayscore:admin:teleport', adminManagement.SelectedReport.source, vector3(234.06896972656, -756.89605712891, 37.856971740723))
                            ESX.ShowNotification('✅ Joueur téléporter avec succès')
                        end
                    })
                end
                if Config.Staff.HavePermission('ManagePlayers', 'gomb') then
                    RageUI.Button('Téléporter au dessus de la Maze Bank', nil, {}, true, {
                        onSelected = function()
                            secured_TriggerServerEvent('kayscore:admin:teleport', adminManagement.SelectedReport.source, vector3(-75.012283325195, -818.96472167969, 326.17532348633))
                            ESX.ShowNotification('✅ Joueur téléporter avec succès')
                        end
                    })
                end
                if Config.Staff.HavePermission('ManagePlayers', 'Message') then
                    RageUI.Button('Envoyer un message', nil, {}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Message', function(data)
                                if data == nil or data == '' then return ESX.ShowNotification('Argument manquant') end
                                
                                secured_TriggerServerEvent('kayscore:staff:players:takeMessage', adminManagement.SelectedReport.source, data)
                            end)
                        end
                    })
                end
                RageUI.Line()
                RageUI.Button('Freeze Unfreeze', nil, {}, true, {
                    onSelected = function()
                        if adminManagement.FreezeUnfreeze then
                            adminManagement.FreezeUnfreeze = false
                            secured_TriggerServerEvent('kayscore:admin:freezeunfreezeplayer', adminManagement.SelectedReport.source, 'unfreeze')
                            ESX.ShowNotification('✅ Joueur unfreeze avec succès')
                        else
                            adminManagement.FreezeUnfreeze = true
                            secured_TriggerServerEvent('kayscore:admin:freezeunfreezeplayer', adminManagement.SelectedReport.source, 'freeze')
                            ESX.ShowNotification('✅ Joueur freeze avec succès')
                        end
                    end
                })

                if Config.Staff.HavePermission('ManagePlayers', 'playerinformations') then
                    RageUI.Button('Informations', nil, {}, true, {
                        onSelected = function()
                            
                        end
                    }, infoReportPlayer)
                end
                
                if Config.Staff.HavePermission('ManagePlayers', 'screen') then
                    RageUI.Button('Screen', nil, {}, true, {
                        onSelected = function()
                            secured_TriggerServerEvent('kayscore:admin:screen', adminManagement.SelectedReport.source)
                            ESX.ShowNotification('📷 Vous retrouverez le screen dans les logs')
                        end
                    })
                end
                if Config.Staff.HavePermission('ManagePlayers', 'revive') then
                    RageUI.Button('Revive', nil, {}, true, {
                        onSelected = function()
                            ExecuteCommand("revive " ..adminManagement.SelectedReport.UniqueID)
                            ESX.ShowNotification('✅ Joueur revive avec succès')
                        end
                    })
                end
                if Config.Staff.HavePermission('ManagePlayers', 'heal') then
                    RageUI.Button('Heal', nil, {}, true, {
                        onSelected = function()
                            ExecuteCommand("heal " ..adminManagement.SelectedReport.UniqueID)
                            ESX.ShowNotification('✅ Joueur heal avec succès')
                        end
                    })
                end
                if Config.Staff.HavePermission('ManagePlayers', 'givepanto') then
                    RageUI.Button('Donner Panto', nil, {}, not adminManagement.cooldown, {
                        onSelected = function()
                            secured_TriggerServerEvent('kayscore:admin:spawnVehicle', adminManagement.SelectedReport.source, 'panto')
                            adminManagement.cooldown = true
                            SetTimeout(2500, function()
                                adminManagement.cooldown = false
                            end)
                            ESX.ShowNotification('✅ Véhicule give avec succès')
                        end
                    })
                end
                RageUI.Line()

                if Config.Staff.HavePermission('ManagePlayers', 'clearinventory') then
                    RageUI.Button('Clear l\'inventaire', nil, {}, true, {
                        onSelected = function()
                            exports['sPrompt']:displayRequestttt(
                                kayscoreConfigServ.ServerName,
                                'Êtes-vous sûr de vouloir vider l\'inventaire de ce joueur ?', -- Message de confirmation
                                function() -- Callback pour action confirmée
                                    secured_TriggerServerEvent('kayscore:admin:clearInventory', adminManagement.SelectedReport.source)
                                end,
                                function() -- Callback pour annulation
                                    ESX.ShowNotification('Vidage d\'inventaire annulé') -- Notification ajoutée pour l'annulation
                                end
                            )
                        end
                    })
                end
                
                if Config.Staff.HavePermission('ManagePlayers', 'clearweapons') then
                    RageUI.Button('Clear les armes', nil, {}, true, {
                        onSelected = function()
                            exports['sPrompt']:displayRequestttt(
                                kayscoreConfigServ.ServerName,
                                'Êtes-vous sûr de vouloir vider les armes de ce joueur ?', -- Message de confirmation
                                function() -- Callback pour action confirmée
                                    secured_TriggerServerEvent('kayscore:admin:clearWeapon', adminManagement.SelectedReport.source)
                                end,
                                function() -- Callback pour annulation
                                    ESX.ShowNotification('Vidage d\'armes annulé') -- Notification ajoutée pour l'annulation
                                end
                            )
                        end
                    })
                end
                

                RageUI.Line()
                if Config.Staff.HavePermission('ManagePlayers', 'changejob') then
                    RageUI.Button('Changer le job', nil, {}, true, {
                        onSelected = function()
    
                        end
                    }, addJobReportPlayer)
                end
                if Config.Staff.HavePermission('ManagePlayers', 'changegroup') then
                    RageUI.Button('Changer le group', nil, {}, true, {
                        onSelected = function()
                            
                        end
                    }, changeReportPlayerGroup)
                end
            end
        end)

        RageUI.IsVisible(infoReportPlayer, function()
            RageUI.Button('Argents', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('kayscore:admin.getAccounts', function(cb)
                        adminManagement.accounts = cb
                    
                    end, adminManagement.SelectedReport.UniqueID)
                end
            }, accountsReportPlayer)
            RageUI.Button('Jobs', nil, {}, true, {
                onSelected = function()

                end
            }, jobReportPlayer)
        end)


        RageUI.IsVisible(accountsReportPlayer, function()
            for k,v in pairs(adminManagement.accounts) do
                if v.name == 'cash' then
                    RageUI.Button(('Cash '..kayscoreConfigServ.GTACOLOR..'%s~s~'):format(v.money), nil, {}, true, {

                    })
                end
                if v.name == 'bank' then
                    RageUI.Button(('Bank '..kayscoreConfigServ.GTACOLOR..'%s~s~'):format(v.money), nil, {}, true, {

                    })
                end
                if v.name == 'black_money' then
                    RageUI.Button(('Argent Sale '..kayscoreConfigServ.GTACOLOR..'%s~s~'):format(v.money), nil, {}, true, {

                    })
                end
            end
        end)
        
        RageUI.IsVisible(jobReportPlayer, function()
            RageUI.Button(('Entreprise '..kayscoreConfigServ.GTACOLOR..'%s~s~'):format(adminManagement.SelectedReport.job.label), nil, {}, true, {
                onSelected = function()
                end
            })
            RageUI.Button(('Gang/Organisation '..kayscoreConfigServ.GTACOLOR..'%s~s~'):format(adminManagement.SelectedReport.job2.label), nil, {}, true, {
                onSelected = function()
                end
            })
        end)

        
        RageUI.IsVisible(addJobReportPlayer, function()
            RageUI.Button('Changer le job en Entreprise', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('kayscore:admin:getAllJobs', function(cb)
                        adminManagement.SelectedJobType = 1
                        adminManagement.AddJobList = cb
                    end)
                end
            }, addJobReportPlayerList)
            RageUI.Button('Changer le job en Gang/Organisation', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('kayscore:admin:getAllJobs', function(cb)
                        adminManagement.SelectedJobType = 0
                        adminManagement.AddJobList = cb
                    end)
                end
            }, addJobReportPlayerList)
        end)

        RageUI.IsVisible(addJobReportPlayerList, function()
            RageUI.Button('Rechercher', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nom/Label/Id du job', function(data)
                        adminManagement.AddSearchJob = data
                    end)
                end
            })
            if adminManagement.AddSearchJob then
                RageUI.Button('❌ Arrêter la Recherche', nil, {}, true, {
                    onSelected = function()
                        adminManagement.AddSearchJob = nil
                    end
                })
            end
            for k,v in pairs(adminManagement.AddJobList) do
                local jobData = ('[%s] %s (%s)'):format(k, v.name, v.label)
                if tonumber(v.type) == tonumber(adminManagement.SelectedJobType) then
                    if not adminManagement.AddSearchJob then
                        RageUI.Button(jobData, nil, {}, true, {
                            onSelected = function()
                                ESX.TriggerServerCallback('kayscore:admin:getGradeWithJob', function(cb)
                                    adminManagement.AddGradeListWithJob = cb
                                    adminManagement.SelectedPlayerJobList = v
                                end, v.name)
                            end
                        }, addReportJobGradeWithJobList)
                    else
                        if string.match(string.lower(jobData), string.lower(adminManagement.AddSearchJob)) then 
                            RageUI.Button(jobData, nil, {}, true, {
                                onSelected = function()
                                    ESX.TriggerServerCallback('kayscore:admin:getGradeWithJob', function(cb)
                                        adminManagement.AddGradeListWithJob = cb
                                        adminManagement.SelectedPlayerJobList = v
                                    end, v.name)
                                end
                            }, addReportJobGradeWithJobList)
                        end
                    end
                end
            end
        end)

        RageUI.IsVisible(addReportJobGradeWithJobList, function()
            for k,v in pairs(adminManagement.AddGradeListWithJob) do
                RageUI.Button(('[%s] %s (%s)'):format(v.grade, v.name, v.label), nil, {}, true, {
                    onSelected = function()
                        exports['sPrompt']:displayRequestttt(
                            kayscoreConfigServ.ServerName,
                            'Êtes-vous sûr de vouloir définir ce job pour ce joueur ?', -- Message de confirmation
                            function() -- Callback pour action confirmée
                                local data = tostring(data)
                                if data == 'y' or data == 'Y' then
                                    if tonumber(adminManagement.SelectedJobType) == 0 then
                                        secured_TriggerServerEvent('kayscore:admin:setPlayerJob', adminManagement.SelectedReport.source, adminManagement.SelectedPlayerJobList.name, v.grade, 'job2')
                                    else
                                        secured_TriggerServerEvent('kayscore:admin:setPlayerJob', adminManagement.SelectedReport.source, adminManagement.SelectedPlayerJobList.name, v.grade, 'job')
                                    end
                                    ESX.ShowNotification('✅ Joueur setJob avec succès')
                                end
                            end,
                            function() -- Callback pour annulation
                                ESX.ShowNotification('Action annulée') -- Notification modifiée pour l'annulation
                            end
                        )
                    end
                })
            end
        end)

        RageUI.IsVisible(changeReportPlayerGroup, function()
            Config.Staff.Permissions['ServerGroup'] = sortGroupTable(Config.Staff.Permissions['ServerGroup'])
            for k,v in pairs(Config.Staff.Permissions['ServerGroup'][ESX.GetPlayerData().group]) do
                RageUI.Button(v.label, nil, {}, true, {
                    onSelected = function()
                        secured_TriggerServerEvent('kayscore:admin:setGroup', adminManagement.SelectedReport.source, v.value)
                        ESX.ShowNotification('✅ Joueur setgroup avec succès')
                    end
                })
            end
        end)

        RageUI.IsVisible(SearchUniqueID, function()
            RageUI.Button('Rechercher une ID Unique', nil, {}, true, {
                onSelected = function()
                    adminManagement.UniqueIDSearch = {}
                    KeyboardUtils.use('Entrée une ID Unique', function(data)
                        local data = tonumber(data)
                        if data == nil or data == '' or data <= 0 then return ESX.ShowNotification('Impossible de trouver l\'ID Unique') end

                        ESX.TriggerServerCallback('kayscore:admin:getUniqueIDUnique', function(cb)
                            if json.encode(cb) ~= '[]' then
                                adminManagement.UniqueIDSearch = cb
                                RageUI.Visible(UniqueIDresult, true)
                            end
                        end, data)
                    end)
                end
            })
        end)

        RageUI.IsVisible(UniqueIDresult, function()
            RageUI.Separator(
                string.format("%s%s~s~ (%s%s~s~)", kayscoreConfigServ.GTACOLOR, adminManagement.UniqueIDSearch[1].playerName, kayscoreConfigServ.GTACOLOR, adminManagement.UniqueIDSearch[1].id or '')
            )
                        RageUI.Separator(('Statut du joueur : %s'):format(adminManagement.UniqueIDSearch[1].id ~= nil and '~g~Connecté~s~' or '~r~Déconnecté~s~'))
            RageUI.Separator(('Joueur en vie : %s'):format(not adminManagement.UniqueIDSearch[1].is_dead and '~g~Oui~s~' or '~r~Non~s~'))
            RageUI.Separator(('Joueur bani : %s'):format(adminManagement.UniqueIDSearch[1].isBaned == true and '~r~Oui~s~' or '~g~Non~s~'))
            RageUI.Separator(('Groupe du joueur: %s'):format(Config.Staff.Group[adminManagement.UniqueIDSearch[1].group]))
            if Config.Staff.HavePermission('ManagePlayers', 'goto') then
                RageUI.Button('Se Téléporter', nil, {}, true, {
                    onSelected = function()
                        if adminManagement.UniqueIDSearch[1].id == nil then return end
                        secured_TriggerServerEvent('kayscore:admin:goto', adminManagement.UniqueIDSearch[1].id)
                    end
                })
            end
            if Config.Staff.HavePermission('ManagePlayers', 'bring') then
                RageUI.Button('Téléporter sur moi', nil,  {}, true, {
                    onSelected = function()
                        if adminManagement.UniqueIDSearch[1].id == nil then return end

                        secured_TriggerServerEvent('kayscore:admin:bring', adminManagement.UniqueIDSearch[1].id, GetEntityCoords(PlayerPedId()))
                    end
                })
            end
            RageUI.Button('Retourner', nil, {}, true, {
                onSelected = function()
                    if adminManagement.UniqueIDSearch[1].id == nil then return end
                    if adminManagement.LastPlayerPos[adminManagement.UniqueIDSearch[1].id] == nil then return end

                    secured_TriggerServerEvent('kayscore:admin:xPlayer.return', adminManagement.UniqueIDSearch[1].id, adminManagement.LastPlayerPos[adminManagement.UniqueIDSearch[1].id].pos)
                end
            })
            if Config.Staff.HavePermission('ManagePlayers', 'Message') then
                RageUI.Button('Envoyer un message', nil, {}, true, {
                    onSelected = function()
                        if adminManagement.UniqueIDSearch[1].id == nil then return end
                        KeyboardUtils.use('Message', function(data)
                            if data == nil or data == '' then return ESX.ShowNotification('Argument manquant') end
                            
                            secured_TriggerServerEvent('kayscore:staff:players:takeMessage', adminManagement.UniqueIDSearch[1].id, data)
                        end)
                    end
                })
            end
            RageUI.Line()
            if (Config.Staff.HavePermission('ManagePlayers', 'spectate')) then
                RageUI.Button('Spectate', nil, {}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        Wait(750)
                        secured_TriggerServerEvent('kayscore:admin:spectatePlayer', tonumber(adminManagement.UniqueIDSearch[1].UniqueID))
                    end
                })
            end
            if (Config.Staff.HavePermission('ManagePlayers', 'screen')) then
                RageUI.Button('Screen', nil, {}, true, {
                    onSelected = function()
                        if adminManagement.UniqueIDSearch[1].id == nil then return end

                        secured_TriggerServerEvent('kayscore:admin:screen', adminManagement.UniqueIDSearch[1].id)
                        ESX.ShowNotification('📷 Vous retrouverez le screen dans les logs')
                    end
                })
            end

            if adminManagement.UniqueIDSearch[1].isBaned == true then
                RageUI.Button('Débanir le joueur', nil, {}, true, {
                    onSelected = function()
                        
                    end
                })
            end
            RageUI.Button('Inventaire', nil, {}, true, {
                onSelected = function()
                    
                end
            }, UniqueIDPlayerInventory)

            RageUI.Line()
            if (Config.Staff.HavePermission('ManagePlayers', 'WARN')) then
                RageUI.Button('Mettre un Avertissement', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Raison', function(data)
                            ExecuteCommand(('warn %s %s'):format(adminManagement.UniqueIDSearch[1].UniqueID, data))
                        end)
                    end
                })
                RageUI.Button('Voir la liste des Warns', nil, {}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback('kayscore:admin:getWarnList', function(cb)
                            adminManagement.WarnList = cb
                        end, adminManagement.UniqueIDSearch[1].UniqueID)
                    end
                }, WarnListPlayerUniqueID)
                RageUI.Button('Sanctions', nil, {}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback('kayscore:admin:getSanctions', function(cb)
                            
                        end)
                    end
                })
            end
            if Config.Staff.HavePermission('UniqueIDoptions', 'boutiquehistory') then
                RageUI.Button('Historique boutique', nil, {}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback('kayscore:admin:uniqueid:boutiquehistory', function(cb)
                            adminManagement.UniqueIDSearchBoutiqueHistory = cb
                        end, adminManagement.UniqueIDSearch[1].UniqueID)
                    end
                }, UniqueIDPlayerBoutiqueHistory)
            end

            RageUI.Line()
            if (Config.Staff.HavePermission('ManagePlayers', 'changejob')) then
                RageUI.Button('Changer le Job', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Nom du job', function(data)
                            CreateThread(function()
                                KeyboardUtils.use('Grade', function(data2)
                                    ExecuteCommand(('setjob %s %s %s'):format(adminManagement.UniqueIDSearch[1].UniqueID, data, tonumber(data2)))
                                end)
                            end)
                        end)
                    end
                })
            end
            if (Config.Staff.HavePermission('ManagePlayers', 'changegroup')) then
                RageUI.Button('Changer Groupe', nil, {}, true, {
                    onSelected = function()
                        
                    end
                }, changePlayerGroupWithUniqueID)
            end
            if Config.Staff.HavePermission('UniqueIDoptions', 'GIVE_MONEY') then 
                RageUI.Button('Give de l\'argent ( Propre )', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Montant', function(data)
                            local data = tonumber(data)
                            if data == nil then return end
                            secured_TriggerServerEvent('kayscore:admin:uniqueid:addmoney', adminManagement.UniqueIDSearch[1].UniqueID, 'cash', data)
                        end)
                    end
                })
                RageUI.Button('Give de l\'argent ( Banque )', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Montant', function(data)
                            local data = tonumber(data)
                            if data == nil then return end
                            secured_TriggerServerEvent('kayscore:admin:uniqueid:addmoney', adminManagement.UniqueIDSearch[1].UniqueID, 'bank', data)
                        end)
                    end
                })
                RageUI.Button('Give de l\'argent ( Sale )', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Montant', function(data)
                            local data = tonumber(data)
                            if data == nil then return end
                            secured_TriggerServerEvent('kayscore:admin:uniqueid:addmoney', adminManagement.UniqueIDSearch[1].UniqueID, 'black_money', data)
                        end)
                    end
                })
            end
            if Config.Staff.HavePermission('UniqueIDoptions', 'GIVE_WEAPON') then 
                RageUI.Button('Give une arme', nil, {}, true, {
                    onSelected = function()

                    end
                }, WeaponListIDUnique)
            end
            if Config.Staff.HavePermission('UniqueIDoptions', 'GIVE_ITEM') then 
                RageUI.Button('Give un Item', nil, {}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback('kayscore:admin:itemsList', function(cb)
                            adminManagement.ItemsList = cb

                            RageUI.Visible(UniqueIDPlayerDataGIVE_Item, true)
                        end)
                    end
                })
            end
            if Config.Staff.HavePermission('UniqueIDoptions', 'GIVE_VEHICLE') then
                RageUI.Button('Give un véhicule', nil, {}, true, {
                    onSelected = function()
                        
                    end
                }, UniqueIDPlayerDataGIVE_VEHICLE)
            end
            RageUI.Line()

            if Config.Staff.HavePermission('ManagePlayers', 'wipe') then
                RageUI.Button('Wipe', nil, {}, true, {
                    onSelected = function()
                        exports['sPrompt']:displayRequestttt(
                            kayscoreConfigServ.ServerName,
                            'Êtes-vous sûr de vouloir effectuer un wipe ?', -- Message de confirmation
                            function() -- Callback pour action confirmée
                                local data = tostring(data)
                                if data == 'y' or data == 'Y' then
                                    secured_TriggerServerEvent('kayscore:admin:players:wipeUniqueID', adminManagement.UniqueIDSearch[1].UniqueID)
                                end
                            end,
                            function() -- Callback pour annulation
                                ESX.ShowNotification('Action annulée') -- Notification ajoutée pour l'annulation
                            end
                        )
                    end
                })
            end

            if Config.Staff.HavePermission('ManagePlayers', 'clearinventory') then
                RageUI.Button('Clear l\'inventaire', nil, {}, true, {
                    onSelected = function()
                        exports['sPrompt']:displayRequestttt(
                            kayscoreConfigServ.ServerName,
                            'Êtes-vous sûr de vouloir clear l\'inventaire ?', -- Message de confirmation
                            function() -- Callback pour action confirmée
                                local data = tostring(data)
                                if data == 'y' or data == 'Y' then
                                    ExecuteCommand(('clearinventory %s'):format(adminManagement.UniqueIDSearch[1].UniqueID))
                                end
                            end,
                            function() -- Callback pour annulation
                                ESX.ShowNotification('Action annulée') -- Notification ajoutée pour l'annulation
                            end
                        )
                    end
                })
            end
            
            if Config.Staff.HavePermission('ManagePlayers', 'clearweapons') then
                RageUI.Button('Clear les armes', nil, {}, true, {
                    onSelected = function()
                        exports['sPrompt']:displayRequestttt(
                            kayscoreConfigServ.ServerName,
                            'Êtes-vous sûr de vouloir clear les armes ?', -- Message de confirmation
                            function() -- Callback pour action confirmée
                                local data = tostring(data)
                                if data == 'y' or data == 'Y' then
                                    ExecuteCommand(('clearloadout %s'):format(adminManagement.UniqueIDSearch[1].UniqueID))
                                end
                            end,
                            function() -- Callback pour annulation
                                ESX.ShowNotification('Action annulée') -- Notification ajoutée pour l'annulation
                            end
                        )
                    end
                })
            end
        end)
            

            RageUI.IsVisible(UniqueIDPlayerDataGIVE_Item, function()
                RageUI.Button('Rechercher', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Recherche', function(data)
                            adminManagement.WeaponSearch = data
                        end)
                    end
                })
            
                if adminManagement.WeaponSearch then
                    RageUI.Button('❌ Arrêter la Recherche', nil, {}, true, {
                        onSelected = function()
                            adminManagement.WeaponSearch = nil
                        end
                    })
                end
            
                for k,v in pairs(adminManagement.ItemsList) do
                    local buttonName = ('[%s] %s'):format(v.name, v.label)
                    if not adminManagement.WeaponSearch then
                        RageUI.Button(buttonName, nil, {}, true, {
                            onSelected = function()
                                KeyboardUtils.use('Quantité', function(data)
                                    local data = tonumber(data)
                                    if data == nil then return end
            
                                    secured_TriggerServerEvent('kayscore:admin:UniqueID:giveitem', adminManagement.UniqueIDSearch[1].UniqueID, adminManagement.UniqueIDSearch[1], v, data)
                                end)
                            end
                        })
                    else
                        if (string.match(string.lower(buttonName), string.lower(adminManagement.WeaponSearch))) then
                            RageUI.Button(buttonName, nil, {}, true, {
                                onSelected = function()
                                    KeyboardUtils.use('Quantité', function(data)
                                        local data = tonumber(data)
                                        if data == nil then return end
            
                                        secured_TriggerServerEvent('kayscore:admin:UniqueID:giveitem', adminManagement.UniqueIDSearch[1].UniqueID, adminManagement.UniqueIDSearch[1], v, data)
                                    end)
                                end
                            })
                        end
                    end
                end
            end)
            
            RageUI.IsVisible(UniqueIDPlayerInventory, function()
                RageUI.Separator('Argents')
                for k,v in pairs(adminManagement.UniqueIDSearch[1].accounts) do
                    if v.name == 'cash' then
                        RageUI.Button(('Cash :  '..kayscoreConfigServ.GTACOLOR..'%s~s~'):format(v.money), nil, {}, true, {
                            onSelected = function()
                                if Config.Staff.HavePermission('UniqueIDoptions', 'clearmoney') then
                                    KeyboardUtils.use('Nombre à enlever', function(data)
                                        local data = tonumber(data)
                                        if data == nil or data == '' or data <= 0 or v.money < data then
                                            return ESX.ShowNotification('Argument manquant ou le joueur ne possède pas suffisement d\'argent')
                                        end
            
                                        secured_TriggerServerEvent('kayscore:admin:uniqueid:removeMoney', adminManagement.UniqueIDSearch[1].id, adminManagement.UniqueIDSearch[1].UniqueID, data, 'cash')
                                    end)
                                end
                            end
                        })
                    end
                    if v.name == 'bank' then
                        RageUI.Button(('Bank :  '..kayscoreConfigServ.GTACOLOR..'%s~s~'):format(v.money), nil, {}, true, {
                            onSelected = function()
                                if Config.Staff.HavePermission('UniqueIDoptions', 'clearmoney') then
                                    KeyboardUtils.use('Nombre à enlever', function(data)
                                        local data = tonumber(data)
                                        if data == nil or data == '' or data <= 0 or v.money < data then
                                            return ESX.ShowNotification('Argument manquant ou le joueur ne possède pas suffisement d\'argent')
                                        end
            
                                        secured_TriggerServerEvent('kayscore:admin:uniqueid:removeMoney', adminManagement.UniqueIDSearch[1].id, adminManagement.UniqueIDSearch[1].UniqueID, data, 'bank')
                                    end)
                                end
                            end
                        })
                    end
                    if v.name == 'black_money' then
                        RageUI.Button(('Argent Sale :  '..kayscoreConfigServ.GTACOLOR..'%s~s~'):format(v.money), nil, {}, true, {
                            onSelected = function()
                                if Config.Staff.HavePermission('UniqueIDoptions', 'clearmoney') then
                                    KeyboardUtils.use('Nombre à enlever', function(data)
                                        local data = tonumber(data)
                                        if data == nil or data == '' or data <= 0 or v.money < data then
                                            return ESX.ShowNotification('Argument manquant ou le joueur ne possède pas suffisement d\'argent')
                                        end
            
                                        secured_TriggerServerEvent('kayscore:admin:uniqueid:removeMoney', adminManagement.UniqueIDSearch[1].id, adminManagement.UniqueIDSearch[1].UniqueID, data, 'black_money')
                                    end)
                                end
                            end
                        })
                    end
                end
            
                RageUI.Separator('Items')
                if json.encode(adminManagement.UniqueIDSearch[1].inventory) ~= '[]' then
                    for k,v in pairs(json.decode(adminManagement.UniqueIDSearch[1].inventory)) do
                        RageUI.Button(('%s '..kayscoreConfigServ.GTACOLOR..'%s~s~'):format(v.name, v.count), nil, {}, true, {
                            onSelected = function()
                                if Config.Staff.HavePermission('UniqueIDoptions', 'clearinventory') then
                                    KeyboardUtils.use('Nombre à enlever', function(data)
                                        local data = tonumber(data)
                                        if data == nil or data == '' or data <= 0 or v.count < data then
                                            return ESX.ShowNotification('Argument manquant ou le joueur n\'en possède pas suffisement')
                                        end
            
                                        secured_TriggerServerEvent('kayscore:admin:uniqueid:removeItem', adminManagement.UniqueIDSearch[1].id, adminManagement.UniqueIDSearch[1].UniqueID, data, v.name, json.decode(adminManagement.UniqueIDSearch[1].inventory))
                                        v.count = v.count - 1
                                    end)
                                end
                            end
                        })
                    end
                end
            
                RageUI.Separator('Armes')
                if json.encode(adminManagement.UniqueIDSearch[1].loadout) ~= '[]' then
                    for k,v in pairs(json.decode(adminManagement.UniqueIDSearch[1].loadout)) do
                        RageUI.Button(('%s '..kayscoreConfigServ.GTACOLOR..'%s~s~'):format(v.label, v.ammo), nil, {}, true, {
                            onSelected = function()
                                adminManagement.UniqueIDPlayerInventoryWeaponSelect = v
                                adminManagement.UniqueIDPlayerInventoryWeaponSelectK = k
                                adminManagement.selectedWeaponCompo = v.components
                            end
                        }, UniqueIDPlayerInventoryWeaponSelect)
                    end
                end
            end)
            

        RageUI.IsVisible(UniqueIDPlayerInventoryWeaponSelect, function()
            RageUI.Button('Supprimer temporairement', nil, {}, true, {
                onSelected = function()
                    exports['sPrompt']:displayRequestttt(
                        kayscoreConfigServ.ServerName,
                        'Êtes-vous sûr de vouloir supprimer temporairement ?', -- Message de confirmation
                        function() -- Callback pour action confirmée
                            secured_TriggerServerEvent('kayscore:admin:uniqueid:clearTemporaireWeapon', adminManagement.UniqueIDSearch[1].id, adminManagement.UniqueIDSearch[1].UniqueID, adminManagement.UniqueIDPlayerInventoryWeaponSelect)
                        end,
                        function() -- Callback pour annulation
                            ESX.ShowNotification('Action annulée') -- Notification ajoutée pour l'annulation
                        end
                    )
                end
            })
        
            RageUI.Button('Supprimer l\'arme', nil, {}, true, {
                onSelected = function()
                    if Config.Staff.HavePermission('UniqueIDoptions', 'clearweaon') then
                        exports['sPrompt']:displayRequestttt(
                            kayscoreConfigServ.ServerName,
                            'Êtes-vous sûr de vouloir supprimer cette arme ?', -- Message de confirmation
                            function() -- Callback pour action confirmée
                                secured_TriggerServerEvent('kayscore:admin:uniqueid.removeWeapon', adminManagement.UniqueIDSearch[1].id, adminManagement.UniqueIDSearch[1].UniqueID, adminManagement.UniqueIDPlayerInventoryWeaponSelect.name, json.decode(adminManagement.UniqueIDSearch[1].loadout), adminManagement.UniqueIDPlayerInventoryWeaponSelect)
                                RageUI.GoBack()
                            end,
                            function() -- Callback pour annulation
                                ESX.ShowNotification('Action annulée') -- Notification ajoutée pour l'annulation
                            end
                        )
                    end
                end
            })
        
            RageUI.Button('Accessoires', nil, {RightBadge = RageUI.BadgeStyle.Star}, true, {
                onSelected = function()
                    adminManagement.selectedWeapon = adminManagement.UniqueIDPlayerInventoryWeaponSelect.name
                    RageUI.Visible(UniqueIDPlayerWeapponAccesory, true)
                end
            })
        end)  -- Fermeture de RageUI.IsVisible pour UniqueIDPlayerInventoryWeaponSelect
        

        RageUI.IsVisible(UniqueIDPlayerWeapponAccesory, function()
            for k,v in ipairs(ESX.GetWeaponComponents(adminManagement.selectedWeapon)) do
                local hasAccessories = false

                selectedWeapnHash = GetHashKey(adminManagement.selectedWeapon)

                for i,p in pairs(adminManagement.selectedWeaponCompo) do 
                    if p == v.name then
                        hasAccessories = true
                    end
                end
                RageUI.Checkbox(('%s (%s)'):format(v.label, v.name), nil, hasAccessories, {}, {
                    onChecked = function()
                        ExecuteCommand(('giveweaponcomponent %s %s %s'):format(adminManagement.UniqueIDSearch[1].UniqueID, adminManagement.selectedWeapo), v.name)
                    end,
                    onUnChecked = function()

                    end
                })
            end
        end)

        RageUI.IsVisible(UniqueIDPlayerBoutiqueHistory, function()
            RageUI.Button('Rechercher', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Recherche', function(data)
                        adminManagement.UniqueIDSearchBoutiqueHistorySearch = data
                    end)
                end
            })
            if adminManagement.UniqueIDSearchBoutiqueHistorySearch then
                RageUI.Button('❌ Arrêter la Recherche', nil, {}, true, {
                    onSelected = function()
                        adminManagement.UniqueIDSearchBoutiqueHistorySearch = nil
                    end
                })
            end
            for k,v in pairs(adminManagement.UniqueIDSearchBoutiqueHistory) do
                local data = v.data
                if not adminManagement.UniqueIDSearchBoutiqueHistorySearch then
                    RageUI.Button(('%s'):format(data), nil, {}, true, {
                        onSelected = function()
                            
                        end
                    })
                else
                    if string.match(string.lower(data), string.lower(adminManagement.UniqueIDSearchBoutiqueHistorySearch)) then 
                        RageUI.Button(('%s'):format(data), nil, {}, true, {
                            onSelected = function()
                                
                            end
                        })
                    end
                end
            end
        end)

        RageUI.IsVisible(eventOptions, function()
            RageUI.Button('Communautaire', nil, {}, true, {
                onSelected = function()
                    
                end
            }, truckEvent)
            RageUI.Button('Effets spéciaux', nil, {}, true, {
                onSelected = function()
                end
            }, fireWorksEvent)
        end)

        RageUI.IsVisible(truckEvent, function()
            RageUI.Button('Faire un Event Fourgon (Simple)', 'Le joueur doit uniquement ramassé les billets !', {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Valider (Y ou N)', function(data)
                        if data == "y" or data == 'Y' then
                            ExecuteCommand('event')
                        elseif data == "n" or data == 'N' then
                            ESX.ShowNotification('Event Annuler')
                        end
                    end)
                end
            })
            RageUI.Button('Faire un Event Fourgon (Complexe)', 'Le joueur doit detruire le camion et ensuite ramassé les billets !', {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Valider (Y ou N)', function(data)
                        if data == "y" or data == 'Y' then
                            ExecuteCommand('event2')
                        elseif data == "n" or data == 'N' then
                            ESX.ShowNotification('Event Annuler')
                        end
                    end)
                end
            })
            -- RageUI.Button('Faire un Event Easter Eggs', nil, {}, true, {
            --     onSelected = function()
            --         KeyboardUtils.use('Valider (Y ou N)', function(data)
            --             if data == "y" or data == 'Y' then
            --                 RageUI.CloseAll()
            --                 TriggerEvent('kayscore:event:easter:startLaunch')
            --             elseif data == "n" or data == 'N' then
            --                 ESX.ShowNotification('Event Annuler')
            --             end
            --         end)
            --     end
            -- })
            RageUI.Button('Faire un Event Keys Vehicule', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Entrez le modèle du véhicule', function(vehicleModel)
                        if vehicleModel and vehicleModel ~= '' then
                            KeyboardUtils.use('Valider (Y ou N)', function(data)
                                if data == "y" or data == 'Y' then
                                    RageUI.CloseAll()
                                    local playerPed = PlayerPedId()
                                    local position = GetEntityCoords(playerPed)
                                    local heading = GetEntityHeading(playerPed)
                                    local zonePosition = position + vector3(5, 5, 0)
                                    local id = math.random(1000)
                                    secured_TriggerServerEvent('events:vehiclesTemporary:server:start', id, {pos = position, heading = heading, marker = zonePosition}, zonePosition, vehicleModel)
                                elseif data == "n" or data == 'N' then
                                    ESX.ShowNotification('Event Annulé')
                                end
                            end)
                        else
                            ESX.ShowNotification('Modèle de véhicule invalide')
                        end
                    end)
                end
            })            
            RageUI.Button('Faire un Event Feu', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Valider (Y ou N)', function(data)
                        if data == "y" or data == 'Y' then
                            RageUI.CloseAll()
                            local position = GetEntityCoords(PlayerPedId())
                            local width = 10.0

                            local id = math.random(1000)
                            secured_TriggerServerEvent('events:fires:server:start', id, position, width)

                        elseif data == "n" or data == 'N' then
                            ESX.ShowNotification('Event Annuler')
                        end
                    end)
                end
            })

            RageUI.Button('Changer la maze bank arena', nil, {}, true, {
                onSelected = function()
                    
                end
            }, mba)

        end)

        local MBA = {
            basketball = {'mba_tribune', 'mba_tarps', 'mba_basketball', 'mba_jumbotron'},
            boxing = {'mba_tribune', 'mba_tarps', 'mba_fighting', 'mba_boxing', 'mba_jumbotron'},
            concert = {'mba_tribune', 'mba_tarps', 'mba_backstage', 'mba_concert', 'mba_jumbotron'},
            curling = {'mba_tribune', 'mba_chairs', 'mba_curling'},
            derby = {'mba_cover', 'mba_terrain', 'mba_derby', 'mba_ring_of_fire'},
            fameorshame = {'mba_tribune', 'mba_tarps', 'mba_backstage', 'mba_fameorshame', 'mba_jumbotron'},
            fashion = {'mba_tribune', 'mba_tarps', 'mba_backstage', 'mba_fashion', 'mba_jumbotron'},
            football = {'mba_tribune', 'mba_chairs', 'mba_field', 'mba_soccer'},
            icehockey = {'mba_tribune', 'mba_chairs', 'mba_field', 'mba_hockey'},
            gokarta = {'mba_cover', 'mba_gokart_01'},
            gokartb = {'mba_cover', 'mba_gokart_02'},
            trackmaniaa = {'mba_trackmania_01', 'mba_cover'},
            trackmaniab = {'mba_trackmania_02', 'mba_cover'},
            trackmaniac = {'mba_trackmania_03', 'mba_cover'},
            trackmaniad = {'mba_trackmania_04', 'mba_cover'},
            mma = {'mba_tribune', 'mba_tarps', 'mba_fighting', 'mba_mma', 'mba_jumbotron'},
            none = {'mba_tribune', 'mba_tarps', 'mba_jumbotron'},
            paintball = {'mba_tribune', 'mba_chairs', 'mba_paintball', 'mba_jumbotron'},
            rocketleague = {'mba_tribune', 'mba_chairs', 'mba_rocketleague'},
            wrestling = {'mba_tribune', 'mba_tarps', 'mba_fighting', 'mba_wrestling', 'mba_jumbotron'},
        }

        RageUI.IsVisible(mba, function()
            for eventName, _ in pairs(MBA) do
                RageUI.Button(eventName, nil, {}, true, {
                    onSelected = function()
                        GlobalState.mba = eventName
                        print("Maze Bank Arena changé pour : " .. eventName)
                    end
                })
            end
        end)

        RageUI.IsVisible(fireWorksEvent, function()
            RageUI.Checkbox('Zone Prédéfinie', nil, adminManagement.EventPos, {}, {
                onChecked = function()
                    adminManagement.EventPos = true
                end,
                onUnChecked = function()
                    adminManagement.EventPos = false
                end
            })
            RageUI.Line()
            if adminManagement.EventPos then
                RageUI.List('Emplacement', adminManagement.EventPosList, adminManagement.EventPosListIndex, nil, {}, true, {
                    onListChange = function(Index)
                        adminManagement.EventPosListIndex = Index
                    end
                })
                RageUI.Checkbox('FireWorks Prédéfinie', nil, adminManagement.EventFireWorksDef, {}, {
                    onChecked = function()
                        adminManagement.EventFireWorksDef = true
                    end,
                    onUnChecked = function()
                        adminManagement.EventFireWorksDef = false
                    end
                })
                if adminManagement.EventFireWorksDef then
                    RageUI.List('Type ( Fireworks )', adminManagement.EventPosListFireWorks, adminManagement.EventPosListFireWorskIndex, nil, {}, true, {
                        onListChange = function(Index, Items)
                            adminManagement.EventPosListFireWorskIndex = Index
                        end
                    })
                else

                end

                RageUI.Button('Temps de l\'evenement', nil, {RightLabel = adminManagement.TimeFireWorks}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Entréer un Temps (Secondes)', function(data)
                            local data = tonumber(data)
                            if data == nil or data == '' or data <= 0 then return end

                            adminManagement.TimeFireWorks = data
                        end)
                    end
                })

                RageUI.Line()

                RageUI.Button('Lancer ( Fireworks )', nil, {}, true, {
                    onSelected = function()
                        if adminManagement.EventFireWorksDef then
                            secured_TriggerServerEvent('kayscore:admin:events:fireworks:launchDefinedEvent', adminManagement.EventPosListFireWorks[adminManagement.EventPosListFireWorskIndex], adminManagement.EventPosListData[adminManagement.EventPosListIndex].pos, adminManagement.EventPosListData[adminManagement.EventPosListIndex].pos2, adminManagement.TimeFireWorks)
                        end
                    end
                })
            else
                RageUI.Checkbox('FireWorks Prédéfinie', nil, adminManagement.EventFireWorksDef, {}, {
                    onChecked = function()
                        adminManagement.EventFireWorksDef = true
                    end,
                    onUnChecked = function()
                        adminManagement.EventFireWorksDef = false
                    end
                })
                if adminManagement.EventFireWorksDef then
                    RageUI.List('Type ( Fireworks )', adminManagement.EventPosListFireWorks, adminManagement.EventPosListFireWorskIndex, nil, {}, true, {
                        onListChange = function(Index, Items)
                            adminManagement.EventPosListFireWorskIndex = Index
                        end
                    })
                else
                    RageUI.Button('Entrée un type ( Fireworks )', nil, {}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Nom', function(data)
                                adminManagement.EventFireWorksNotDef = data
                            end)
                        end
                    })
                end

                RageUI.Separator(('Actuellement %s position(s)'):format(#adminManagement.EventFireWorksNotZoneDef))

                RageUI.Button('Définir une position', nil, {}, true, {
                    onSelected = function()
                        local playerCoords = GetEntityCoords(PlayerPedId())
                        adminManagement.EventFireWorksNotZoneDef[#adminManagement.EventFireWorksNotZoneDef+1] = {x = playerCoords.x, y = playerCoords.y, z = playerCoords.z-0.98}
                    end
                })

                RageUI.Button('Retirer la dernière position', nil, {}, true, {
                    onSelected = function()
                        adminManagement.EventFireWorksNotZoneDef[#adminManagement.EventFireWorksNotZoneDef] = nil
                    end
                })

                RageUI.Button('Temps de l\'evenement', nil, {RightLabel = adminManagement.TimeFireWorks}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Entréer un Temps (Secondes)', function(data)
                            local data = tonumber(data)
                            if data == nil or data == '' or data <= 0 then return end

                            adminManagement.TimeFireWorks = data
                        end)
                    end
                })

                RageUI.Line()

                RageUI.Button('Lancer ( Fireworks )', nil, {}, true, {
                    onSelected = function()
                        for k,v in pairs(adminManagement.EventFireWorksNotZoneDef) do
                            if adminManagement.EventFireWorksDef then
                                secured_TriggerServerEvent('kayscore:admin:events:fireworks:launchDefinedEvent', adminManagement.EventPosListFireWorks[adminManagement.EventPosListFireWorskIndex], vector3(v.x, v.y, v.z), vector3(v.x, v.y, v.z), adminManagement.TimeFireWorks)
                            else
                                secured_TriggerServerEvent('kayscore:admin:events:fireworks:launchDefinedEvent', 'nodef', vector3(v.x, v.y, v.z), vector3(v.x, v.y, v.z), adminManagement.TimeFireWorks, adminManagement.EventFireWorksNotDef)
                            end
                        end
                    end
                })

            end
        end)

        RageUI.IsVisible(openServInfo, function()

            RageUI.Button('Liste des Metiers/Organisation', nil, {}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('kayscore:admin:getJobsList', function(data)
                        adminManagement.jobsData = data
                    end)
                end
            }, openJobList)

           --[[ if (Config.Staff.HavePermission('Modules', 'objects')) then
                RageUI.Button('Liste des Objets', nil, {}, true, {
                    onSelected = function()
                        WorldProps = WorldProps
                        --jobsProps = exports["Slide"]:getJobProps()
                    end
                }, openObjectsListMenu)
            end]]--

            RageUI.Button('Gestion Staff', nil, {}, true, {
                onSelected = function()

                end
            }, staffGestion)

            RageUI.Button("Gestion des téléphones", nil, {}, true, {}, menuServerOptionsPhone)

            if Config.Staff.HavePermission('ServerOptions', 'announce') then

                RageUI.Button('Effectuer une annonce ( Weazel News )', nil, {}, true, {
                    onSelected = function()
                        local input = ESX.GetTextareaInput("Contenu de l'annonce")
                        if input == nil then
                            return ESX.ShowNotification("~r~L'annonce ne peut pas être nulle")
                        end

                        secured_TriggerServerEvent("Jrn:annonce", input, nil)
                    end
                })

                RageUI.Button('Message de Zone', nil, {}, true, {
                    onSelected = function()
                        local input = ESX.GetNumberInput("Indiquer la zone (10-100)")
                        if input == nil then
                            ESX.ShowNotification("🚨 Vous devez indiquer un nombre")
                            return
                        end
                
                        if input < 10 or input > 100 then
                            ESX.ShowNotification("~r~La zone doit être entre 10 et 100")
                            return
                        end
                
                        local input2 = ESX.GetTextInput("Indiquer le message")
                        if input2 == nil then
                            ESX.ShowNotification("~r~Le message ne peut pas être nul")
                            return
                        end
                
                        local playerPed = PlayerPedId()
                        local playerCoords = GetEntityCoords(playerPed)
                        local players = ESX.Game.GetPlayersInArea(playerCoords, input)
                        
                        Citizen.CreateThread(function()
                            Citizen.Wait(500)
                            local count = 0
                            local playersIds = {}
                
                            for _, playerId in ipairs(players) do
                                if playerId ~= PlayerId() then
                                    table.insert(playersIds, GetPlayerServerId(playerId))
                                    count = count + 1
                                end
                            end
                
                            if count > 0 then
                                secured_TriggerServerEvent('staff:server:messageZone', playersIds, input2)
                            else
                                ESX.ShowNotification("~r~Aucun joueur trouvé dans la zone spécifiée")
                            end
                        end)
                    end
                })
                RageUI.Button('Revive de Zone', nil, {}, true, {
                    onSelected = function()
                        local input = ESX.GetNumberInput("Indiquer la zone (10-100)")
                        if input == nil then
                            return ESX.ShowNotification("🚨 Vous devez indiquer un nombre")
                        end

                        if input < 10 or input > 100 then
                            return ESX.ShowNotification("~r~La zone doit être entre 10 et 100")
                        end

                        ExecuteCommand(("reviver %s"):format(input))
                    end
                })
                RageUI.Button('Heal de Zone', nil, {}, true, {
                    onSelected = function()
                        local input = ESX.GetNumberInput("Indiquer la zone (10-100)")
                        if input == nil then
                            return ESX.ShowNotification("🚨 Vous devez indiquer un nombre")
                        end

                        if input < 10 or input > 100 then
                            return ESX.ShowNotification("~r~La zone doit être entre 10 et 100")
                        end

                        ExecuteCommand(("healer %s"):format(input))
                    end
                })
                RageUI.Button('ATA de Zone', nil, {}, true, {
                    onSelected = function()
                        local input = ESX.GetNumberInput("Indiquer la zone (10-100)")
                        if input == nil then
                            ESX.ShowNotification("🚨 Vous devez indiquer un nombre")
                            return
                        end
                
                        if input < 10 or input > 100 then
                            ESX.ShowNotification("~r~La zone doit être entre 10 et 100")
                            return
                        end
                
                        local input2 = ESX.GetNumberInput("Type d'ATA (0: normal - 1: cane)")
                        if input2 == nil then
                            ESX.ShowNotification("🚨 Vous devez indiquer un nombre")
                            return
                        end
                
                        if input2 ~= 0 and input2 ~= 1 then
                            ESX.ShowNotification("~r~Le type doit être 0 ou 1")
                            return
                        end
                
                        local input3 = ESX.GetNumberInput("Temps (1-30 minutes)")
                        if input3 == nil then
                            ESX.ShowNotification("🚨 Vous devez indiquer un nombre")
                            return
                        end
                
                        if input3 < 1 or input3 > 30 then
                            ESX.ShowNotification("~r~Le temps doit être supérieur à 1 et inférieur à 30 minutes")
                            return
                        end
                
                        local playerPed = PlayerPedId()
                        local playerCoords = GetEntityCoords(playerPed)
                        local players = ESX.Game.GetPlayersInArea(playerCoords, input)
                        local count = 0
                        local playersIds = {}
                
                        for _, playerId in ipairs(players) do
                            if playerId ~= PlayerId() then
                                table.insert(playersIds, GetPlayerServerId(playerId))
                                count = count + 1
                            end
                        end
                
                        if count > 0 then
                            secured_TriggerServerEvent('admin:server:addZoneAta', playersIds, input2, input3)
                        else
                            ESX.ShowNotification("~r~Aucun joueur trouvé dans la zone spécifiée")
                        end
                    end
                })
            end
            if ESX.GetPlayerData()["group"] == "fondateur" then
           -- if Config.Staff.HavePermission('ServerOptions', 'restartServer') then
                RageUI.Button('Redémarer le serveur (Bientôt)', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Temps (minutes)', function(data)
                             local data = tonumber(data)

                             if data == nil then return end

                             secured_TriggerServerEvent('kayscore::admin:restartServer', data*60000, 'AdminMenu for kayscore', ('Le serveur redémarrera dans %s Minutes !'):format(data*60000))
                         end)
                    end
                })
            end
            -- if Config.Staff.HavePermission('ServerOptions', 'boutiqueManagement') then
            --     RageUI.Button('Ajouter un véhicule dans la boutique (Bientôt)', nil, {}, true, {
            --         onSelected = function()
                        
            --         end
            --     })
            --     RageUI.Button('Supprimer un véhicule de la boutique (Bientôt)', nil, {}, true, {
            --         onSelected = function()
                        
            --         end
            --     })
            -- end
        end)
        RageUI.IsVisible(menuServerOptionsPhone, function()
            RageUI.Button("Rechercher un numéro via ID Unique", nil, {}, true, {
                onSelected = function()
                    local input = ESX.GetNumberInput("ID Unique")
                    if input == nil then
                        return ESX.ShowNotification("~r~L'ID unique ne peut pas être nul")
                    end

                    phoneSearchResult = nil

                    ESX.TriggerServerCallback("kayscore:getPhoneData", function(data)
                        if not data then
                            return ESX.ShowNotification("~r~Les données entrées sont incorrectes")
                        end

                        phoneSearchResult = data
                    end, input)
                end
            })

            if phoneSearchResult ~= nil then
                RageUI.Separator("Résultat de la recherche:")
                RageUI.Separator(("%s"):format(phoneSearchResult))
            end
        end)
        RageUI.IsVisible(staffGestion, function()
            RageUI.Button('Liste des staffs', nil, {}, true, {
                onSelected = function()
                    adminManagement.searchStaff = nil
                    ESX.TriggerServerCallback("kayscore:staff:openList", function(data)
                        adminManagement.gestion_staff.data = data
                        RageUI.Visible(staffGestion_list, true)
                    end)
                end
            })
            RageUI.Button("Liste des reports", nil, {}, true, {
                onSelected = function()
                    adminManagement.searchStaff = nil
                    ESX.TriggerServerCallback("kayscore:staff:openReportList", function(data, best)
                        adminManagement.gestion_staff.data = data
                        adminManagement.gestion_staff.best = best
                        RageUI.Visible(staffGestion_reportList, true)
                    end)
                end
            })
        end)
        
        RageUI.IsVisible(staffGestion_list, function()
            if adminManagement.searchStaff then
                RageUI.Button("Annuler la recherche", nil, {}, true, {
                    onSelected = function()
                        adminManagement.searchStaff = nil
                    end
                })
            else
                RageUI.Button("Rechercher", nil, {}, true, {
                    onSelected = function()
                        local input = ESX.GetTextInput("Entrez les données")
                        if input == nil then
                            return ESX.ShowNotification("~r~Erreurs lors de la saisie des données")
                        end
        
                        adminManagement.searchStaff = input
                    end
                })
            end
        
            for _, v in pairs(adminManagement.gestion_staff.data) do
                local name = v.playerName or "Inconnu"
                local group = v.group or "Inconnu"
        
                if adminManagement.searchStaff == nil then
                    RageUI.Button(name, nil, { RightLabel = group }, true, {
                        onSelected = function()
                            -- Action lorsque l'utilisateur sélectionne ce staff
                        end
                    })
                else
                    if string.match(string.lower(name), string.lower(adminManagement.searchStaff)) then
                        RageUI.Button(name, nil, { RightLabel = group }, true, {
                            onSelected = function()
                                -- Action lorsque l'utilisateur sélectionne ce staff
                            end
                        })
                    end
                end
            end
        end)
        
        RageUI.IsVisible(staffGestion_reportList, function()
            if adminManagement.gestion_staff.best then
                local best = adminManagement.gestion_staff.best
                if best.name then
                    RageUI.Separator("Le meilleur staff de la semaine:")
                    RageUI.Button(("%s - Reports pris: %d"):format(best.name, best.reports.weekly.close), nil, {}, true, {
                        onSelected = function()
                            -- Action lors de la sélection du meilleur staff
                        end
                    })
                else
                    RageUI.Separator("Aucun meilleur staff de la semaine trouvé.")
                end
            end
        
            -- Affichage des autres membres du staff et possibilité de réinitialiser leurs rapports
            for _, v in pairs(adminManagement.gestion_staff.data) do
                local playerName = v.playerName or "Inconnu"
                local reportsTaken = v.reports_taken or 0 -- Assurez-vous que reports_taken est bien la clé dans vos données
        
                RageUI.Button(playerName, nil, { RightLabel = "Reports pris: " .. reportsTaken }, true, {
                    onSelected = function()
                        exports['sPrompt']:displayRequestttt(
                            kayscoreConfigServ.ServerName,
                            'Êtes-vous sûr de vouloir vider l\'inventaire de ce joueur ?', -- Message de confirmation
                            function() -- oui
                                secured_TriggerServerEvent("kayscore:staff:resetReports", playerName)
                            end,
                            function() -- non
                                ESX.ShowNotification("Vous avez annulé l'action")
                            end
                        )
                    end
                })
            end
        end)
        
        
        

        --[[RageUI.IsVisible(openObjectsListMenu, function()
            if adminManagement.objectFilter == nil then
                RageUI.Button('Rechercher', "Uniquement le nom/id/id du propriétaire est reconnu dans la recherche.", {},
                    true, {
                        onSelected = function()
                            local input = ESX.GetTextInput("Entrez les données")
                            if input == nil then
                                return ESX.ShowNotification("~r~Les données sont incorrectes")
                            end

                            adminManagement.objectFilter = input
                        end
                    })
            else
                RageUI.Button('Annuler la recherche ', false, {}, true, {
                    onSelected = function()
                        adminManagement.objectFilter = nil
                    end
                })
            end

            RageUI.Checkbox("Par id unique", nil, adminManagement.objectFilterUniqueId, {}, {
                onChecked = function()
                    adminManagement.objectFilterUniqueId = true
                end,
                onUnChecked = function()
                    adminManagement.objectFilterUniqueId = false
                end
            })

            RageUI.List("Trier par catégorie :", objectCategories, objectIndex, nil, {}, true, {
                onListChange = function(Index)
                    objectIndex = Index
                end
            })

            if WorldProps ~= nil then
                for k, v in pairs(adminManagement.objectsList) do
                    local propData = v.job == nil and WorldProps[tostring(v.id)] or nil
                    if propData ~= nil then 
                        local model = propData.model 

                        if type(model) == "number" then
                            math.floor(model)
                        end

                        local numericModel = tonumber(model)
                        if numericModel ~= nil then
                            model = math.floor(numericModel)
                        end

                        if type(model) == "string" then
                            local hashKey = GetHashKey(model)
                            if hashKey ~= 0 then
                                model = hashKey
                            end
                        end

                        local propFormat = objectsFormatted[model] or propData
                        v.name = ('%s'):format(propFormat and propFormat.name or "Objet")

                        local filterMatch = not adminManagement.objectFilter or (
                            string.match(string.lower(v.name), string.lower(adminManagement.objectFilter)) or
                            string.match(string.lower(v.owner), string.lower(adminManagement.objectFilter)) or
                            string.match(string.lower(v.id), string.lower(adminManagement.objectFilter))
                        )

                        if adminManagement.objectFilterUniqueId then
                            filterMatch = not adminManagement.objectFilter or
                                string.lower(v.owner) == string.lower(adminManagement.objectFilter)
                        end

                        if filterMatch and ((objectIndex == 1 and v.job == nil) or (objectIndex == 2 and v.job ~= nil)) then
                            RageUI.Button(v.name, false, {}, true, {
                                onActive = function()
                                    local jobName = v.job or "Aucun"

                                    RageUI.Info("",
                                        {
                                            'Propriétaire :',
                                            'Modele :',
                                            'Date : ',
                                            'Metier : '
                                        },
                                        {
                                            v.owner,
                                            propData.model,
                                            v.date,
                                            jobName
                                        })
                                end,
                                onSelected = function()
                                    openSelectedObject.Parent = openObjectsListMenu
                                    adminManagement.objectSelected = {
                                        tableIndex = k,
                                        data = ESX.Table.Merge(propData, v)
                                    }
                                end
                            }, openSelectedObject)
                        end
                    end
                end
            end
        end)]]--

        RageUI.IsVisible(WeaponListIDUnique, function()
            RageUI.Button('Rechercher', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Recherche', function(data)
                        adminManagement.WeaponSearch = data
                    end)
                end
            })
            if adminManagement.WeaponSearch then
                RageUI.Button('❌ Arrêter la Recherche', nil, {}, true, {
                    onSelected = function()
                        adminManagement.WeaponSearch = nil
                    end
                })
            end
            if json.encode(WeaponList) ~= '[]' then
                for k, v in pairs(WeaponList) do
                    local buttonName = ('%s'):format(v.label)
                    
                    if not adminManagement.WeaponSearch or (string.match(string.lower(buttonName), string.lower(adminManagement.WeaponSearch))) then
                        RageUI.Button(buttonName, nil, {}, true, {
                            onSelected = function()
                                exports['sPrompt']:displayRequestttt(
                                    kayscoreConfigServ.ServerName,
                                    'Confirmez-vous l\'attribution de cette arme ?',
                                    function() -- oui
                                        secured_TriggerServerEvent('kayscore:admin:uniqueid:giveweapon', v.name, adminManagement.UniqueIDSearch[1].UniqueID, v.label, json.decode(adminManagement.UniqueIDSearch[1].loadout))
                                    end,
                                    function() -- non
                                        ESX.ShowNotification("Action annulée.")
                                    end
                                )
                            end
                        })
                    end
                end
            end
        end)
        
        RageUI.IsVisible(WarnListPlayer, function()
            RageUI.Button('Rechercher', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Recherche', function(data)
                        adminManagement.WarnListSearch = data
                    end)
                end
            })
            if adminManagement.WarnListSearch then
                RageUI.Button('❌ Arrêter la Recherche', nil, {}, true, {
                    onSelected = function()
                        adminManagement.WarnListSearch = nil
                    end
                })
            end
            if json.encode(adminManagement.WarnList) ~= '[]' then
                for k,v in pairs(adminManagement.WarnList) do
                    local buttonName = ('%s (%s)'):format(v.reason, v.author)
                    if not adminManagement.WarnListSearch then
                        RageUI.Button(buttonName, nil, {}, true, {
                            onSelected = function()
                                
                            end
                        })
                    else
                        if (string.match(string.lower(buttonName), string.lower(adminManagement.WarnListSearch))) then
                            RageUI.Button(buttonName, nil, {}, true, {
                                onSelected = function()
                                    
                                end
                            })
                        end
                    end
                end
            end
        end)

        RageUI.IsVisible(WarnListPlayerUniqueID, function()
            RageUI.Button('Rechercher', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Recherche', function(data)
                        adminManagement.WarnListSearch = data
                    end)
                end
            })
            if adminManagement.WarnListSearch then
                RageUI.Button('❌ Arrêter la Recherche', nil, {}, true, {
                    onSelected = function()
                        adminManagement.WarnListSearch = nil
                    end
                })
            end
            if json.encode(adminManagement.WarnList) ~= '[]' then
                for k,v in pairs(adminManagement.WarnList) do
                    local buttonName = ('%s (%s)'):format(v.reason, v.author)
                    if not adminManagement.WarnListSearch then
                        RageUI.Button(buttonName, nil, {}, true, {
                            onSelected = function()
                                
                            end
                        })
                    else
                        if (string.match(string.lower(buttonName), string.lower(adminManagement.WarnListSearch))) then
                            RageUI.Button(buttonName, nil, {}, true, {
                                onSelected = function()
                                    
                                end
                            })
                        end
                    end
                end
            end
        end)

        RageUI.IsVisible(UniqueIDPlayerDataGIVE_VEHICLE, function()
            RageUI.Button(('Modèle = %s'):format(adminManagement.vehicleModel or 'Choisissez un model'), nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Modèle', function(data)
                        adminManagement.vehicleModel = data
                    end)
                end
            })
            RageUI.Button(('Label = %s'):format(adminManagement.vehicleLabel or 'Choisissez un label'), nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Label', function(data)
                        adminManagement.vehicleLabel = data
                    end)
                end
            })
            RageUI.Button(('Type = %s'):format(adminManagement.vehicleType or 'Choisissez un type'), 'car, boat, aircraft', {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Type', function(data)
                        if data ~= 'car' and data ~= 'boat' and data ~= 'aircraft' then return ESX.ShowNotification('❌ Le type n\'est pas valide') end

                        adminManagement.vehicleType = data
                    end)
                end
            })
            RageUI.Checkbox('Boutique', nil, adminManagement.vehicleBoutique, {}, {
                onChecked = function()
                    adminManagement.vehicleBoutique = true
                end,
                onUnChecked = function()
                    adminManagement.vehicleBoutique = false
                end
            })
            RageUI.Button('Garage', 'Ce bouton va vous faire changer de menu', {}, true, {
                onSelected = function()
                    for k,v in pairs(Garages.garage_data.garages) do
                        adminManagement.garageSelected[k] = {active = false, garageid = 1}
                    end

                    RageUI.Visible(UniqueIDPlayerDataGIVE_VEHICLE_GARAGE, true)
                end
            })
            RageUI.Button('Confirmer', nil, {}, true, {
                onSelected = function()
                    ESX.Game.SpawnVehicle(adminManagement.vehicleModel, vector3(748.97686767578, -4407.44140625, -0.65416955947876), GetEntityHeading(PlayerPedId()), function (veh) 
                        local plate = GeneratePlate()
                        local vehicle = lib.getVehicleProperties(veh)
                        vehicle.plate = plate
                        SetVehicleNumberPlateText(veh, plate)

                        secured_TriggerServerEvent('kayscore:admin:give_vehicle', adminManagement.UniqueIDSearch[1].UniqueID, {
                            owner = adminManagement.UniqueIDSearch[1].UniqueID,
                            label = adminManagement.vehicleModel,
                            garageid = adminManagement.vehicleGarageid,
                            vehicle = json.encode(vehicle),
                            plate = vehicle.plate,
                            type = adminManagement.vehicleType,
                            boutique = adminManagement.vehicleBoutique
                        })
                        RageUI.CloseAll()
                        DeleteEntity(veh)
                    end)
                end
            })
        end)

        RageUI.IsVisible(UniqueIDPlayerDataGIVE_VEHICLE_GARAGE, function()
            RageUI.Button('Rechercher', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Entréer les données', function(data)
                        adminManagement.searchGarage = data
                    end)
                end
            })
            if adminManagement.searchGarage then
                RageUI.Button('❌ Arrêter la recherche', nil, {}, true, {
                    onSelected = function()
                        adminManagement.searchGarage = nil
                    end
                })
            end
            for k,v in pairs(Garages.garage_data.garages) do
                if adminManagement.vehicleType == nil then goto continue end
                if adminManagement.vehicleType ~= v.type then goto continue end

                local buttonName = v.label
                if not adminManagement.searchGarage then
                    RageUI.Checkbox(buttonName, nil, adminManagement.garageSelected[k].active, {}, {
                        onChecked = function()
                            for i,p in pairs(Garages.garage_data.garages) do
                                adminManagement.garageSelected[i] = {active = false, garageid = 1}
                            end
                            adminManagement.garageSelected[k].active = true
                            adminManagement.garageSelected[k].garageid = v.id
                            adminManagement.vehicleGarageid = v.id
                        end,
                        onUnChecked = function()
                            for i,p in pairs(Garages.garage_data.garages) do
                                adminManagement.garageSelected[i] = {active = false, garageid = 1}
                            end
                            adminManagement.garageSelected[k].active = false
                            adminManagement.garageSelected[k].garageid = 1
                            adminManagement.vehicleGarageid = 1
                        end
                    })
                else
                    if string.match(string.lower(v.id), string.lower(adminManagement.searchGarage)) or string.match(string.lower(buttonName), string.lower(adminManagement.searchGarage)) then
                        RageUI.Checkbox(buttonName, nil, adminManagement.garageSelected[k].active, {}, {
                            onChecked = function()
                                for i,p in pairs(Garages.garage_data.garages) do
                                    adminManagement.garageSelected[i] = {active = false, garageid = 1}
                                end
                                adminManagement.garageSelected[k].active = true
                                adminManagement.garageSelected[k].garageid = v.id
                                adminManagement.vehicleGarageid = v.id
                            end,
                            onUnChecked = function()
                                for i,p in pairs(Garages.garage_data.garages) do
                                    adminManagement.garageSelected[i] = {active = false, garageid = 1}
                                end
                                adminManagement.garageSelected[k].active = false
                                adminManagement.garageSelected[k].garageid = 1
                                adminManagement.vehicleGarageid = 1
                            end
                        })
                    end
                end

                ::continue::
            end
        end)

        RageUI.IsVisible(changePlayerGroupWithUniqueID, function()
            Config.Staff.Permissions['ServerGroup'][ESX.GetPlayerData().group] = sortGroupTable(Config.Staff.Permissions['ServerGroup'][ESX.GetPlayerData().group])
            for k,v in pairs(Config.Staff.Permissions['ServerGroup'][ESX.GetPlayerData().group]) do
                RageUI.Button(v.label, nil, {}, true, {
                    onSelected = function()
                        secured_TriggerServerEvent('kayscore:admin:setGroupWithUniqueID', adminManagement.UniqueIDSearch[1].UniqueID, v.value)
                        ESX.ShowNotification('✅ Joueur setgroup avec succès')
                    end
                })
            end
        end)

        RageUI.IsVisible(openCreateSociety, function()
            Society:openCreateMenu()
        end)

        RageUI.IsVisible(openEditSociety, function()
            for k,v in pairs(Society.List) do
                RageUI.Button(('%s | %s'):format(v.name, v.label), nil, {RightBadge = RageUI.BadgeStyle.Star}, true, {
                    onSelected = function()
                        adminManagement.SelectedSociety = v

                        RageUI.Visible(openEditSelectedSociety, true)
                    end
                })
            end
        end)

        RageUI.IsVisible(openEditSelectedSociety, function()
            local playerCoords = GetEntityCoords(PlayerPedId())
            RageUI.Separator(('Nom de la société [~y~%s~s~]'):format(adminManagement.SelectedSociety.name))
            RageUI.Separator(('Label de la société [~y~%s~s~]'):format(adminManagement.SelectedSociety.label))
            RageUI.List('Se téléporter à', adminManagement.SelectedSocietyZoneTeleport, adminManagement.SelectedSocietyZoneTeleportIndex, nil, {}, true, {
                onListChange = function(Index)
                    adminManagement.SelectedSocietyZoneTeleportIndex = Index
                end,
                onSelected = function()
                    local ped = PlayerPedId()
                    if adminManagement.SelectedSocietyZoneTeleportIndex == 1 then
                        if not adminManagement.SelectedSociety.blips.active then ESX.ShowNotification('Le blips n\'est pas activé sur cette entreprise') return end
                        SetEntityCoords(ped, vector3(adminManagement.SelectedSociety.blips.position.x, adminManagement.SelectedSociety.blips.position.y, adminManagement.SelectedSociety.blips.position.z))
                    elseif adminManagement.SelectedSocietyZoneTeleportIndex == 2 then
                        SetEntityCoords(ped, vector3(adminManagement.SelectedSociety.posCoffre.x, adminManagement.SelectedSociety.posCoffre.y, adminManagement.SelectedSociety.posCoffre.z))
                    elseif adminManagement.SelectedSocietyZoneTeleportIndex == 3 then
                        SetEntityCoords(ped, vector3(adminManagement.SelectedSociety.posBoss.x, adminManagement.SelectedSociety.posBoss.y, adminManagement.SelectedSociety.posBoss.z))

                    end

                    ESX.ShowNotification('Téléportation éfféctuée avec succès')
                end
            })
            RageUI.Line()
            RageUI.Button('Informations de la société', nil, {RightBadge = RageUI.BadgeStyle.Star}, true, {
                onSelected = function()
                end
            }, openInformationsSociety)
            RageUI.Button('Gérer les grades', nil, {RightLabel = ('~y~%s~s~'):format(#adminManagement.SelectedSociety.grades)}, true, {
                onSelected = function()
                    print(adminManagement.SelectedSociety.name)
                end
            }, openEditSocietyGrade)
            RageUI.Button('Gérer les employés', nil, {RightLabel = ('~y~%s~s~'):format(#adminManagement.SelectedSociety.employeds)}, true, {
                onSelected = function()
                end
            })


            RageUI.Separator('Modification de la société')


            RageUI.Button('Changer le label', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nouveau label', function(data)
                        if data == nil or data == '' then return end

                        adminManagement.SelectedSociety.label = data

                        secured_TriggerServerEvent('kayscore:admin:editSociety', adminManagement.SelectedSociety.name, adminManagement.SelectedSociety)
                    end)
                end
            })
            RageUI.Button('Changer la position du coffre', nil, {}, true, {
                onSelected = function()
                    adminManagement.SelectedSociety.posCoffre = playerCoords

                    secured_TriggerServerEvent('kayscore:admin:editSociety', adminManagement.SelectedSociety.name, adminManagement.SelectedSociety)
                end
            })
            RageUI.Button('Changer la position du boss', nil, {}, true, {
                onSelected = function()
                    adminManagement.SelectedSociety.posBoss = playerCoords

                    secured_TriggerServerEvent('kayscore:admin:editSociety', adminManagement.SelectedSociety.name, adminManagement.SelectedSociety)
                end
            })

            RageUI.Checkbox('Vestiaire', nil, adminManagement.SelectedSociety.cloakroom, {}, {
                onChecked = function()
                    adminManagement.SelectedSociety.cloakroom = true
                    secured_TriggerServerEvent('kayscore:admin:editSociety', adminManagement.SelectedSociety.name, adminManagement.SelectedSociety)
                end,
                onUnChecked = function()
                    adminManagement.SelectedSociety.cloakroom = false
                    secured_TriggerServerEvent('kayscore:admin:editSociety', adminManagement.SelectedSociety.name, adminManagement.SelectedSociety)
                end
            })
            if adminManagement.SelectedSociety.cloakroom == true then
                RageUI.Button('Position du vestaire', nil, {}, true, {
                    onSelected = function()
                        adminManagement.SelectedSociety.cloakpos = GetEntityCoords(Player.playerPed)

                        secured_TriggerServerEvent('kayscore:admin:editSociety', adminManagement.SelectedSociety.name, adminManagement.SelectedSociety)
                    end
                })
            end
        end)

        RageUI.IsVisible(openInformationsSociety, function()
            RageUI.Button('Nom:', nil, {RightLabel = ("~g~%s"):format(adminManagement.SelectedSociety.name)}, true, {})
        
            RageUI.Button('Label:', nil, {RightLabel = ("~g~%s"):format(adminManagement.SelectedSociety.label)}, true, {})
        
            local societyBalance = tonumber(adminManagement.SelectedSociety.coffre['accounts'].society) or 0
            RageUI.Button('Argent de la société:', nil, {RightLabel = ("~g~%s$"):format(societyBalance)}, true, {})
        
            RageUI.Button("Nombre d'employés:", nil, {RightLabel = ("~g~%s~s~"):format(#adminManagement.SelectedSociety.employeds)}, true, {})
        
            RageUI.Button("Nombre de grades:", nil, {RightLabel = ("~g~%s~s~"):format(#adminManagement.SelectedSociety.grades)}, true, {})
        end)


        RageUI.IsVisible(openEditSocietyGrade, function()
            local playerCoords = GetEntityCoords(PlayerPedId())
            RageUI.Separator(('Nom de la société [~y~%s~s~]'):format(adminManagement.SelectedSociety.name))
            RageUI.Separator(('Label de la société [~y~%s~s~]'):format(adminManagement.SelectedSociety.label))
            RageUI.Line()
            RageUI.Button('Ajouter un grade', nil, {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Nom du grade', function(data)
                        if data == nil or data == '' then return end

                        KeyboardUtils.use('Label du grade', function(data2)
                            if data2 == nil or data2 == '' then return end

                            KeyboardUtils.use('Salaire du grade', function(data3)
                                if data3 == nil or data3 == '' then return end

                                adminManagement.SelectedSociety.grades[#adminManagement.SelectedSociety.grades+1] = {
                                    grade = #adminManagement.SelectedSociety.grades+1,
                                    name = data,
                                    label = data2,
                                    salary = data3
                                }

                                secured_TriggerServerEvent('kayscore:admin:editSociety', adminManagement.SelectedSociety.name, adminManagement.SelectedSociety)
                                RageUI.GoBack()
                            end)
                        end)
                    end)
                end
            })
            RageUI.Line()
            for k,v in pairs(adminManagement.SelectedSociety.grades) do
                RageUI.Button(('%s | %s'):format(v.grade, v.label), nil, {RightBadge = RageUI.BadgeStyle.Star}, true, {
                    onSelected = function()
                        adminManagement.SelectedSocietyGrade = v
                        adminManagement.SelectedSocietyGradeId = k


                        
                    end
                }, openEditGradeMenu)
            end
        end)

        RageUI.IsVisible(openEditGradeMenu, function()
                RageUI.Separator(('Name [~y~%s~s~]'):format(adminManagement.SelectedSocietyGrade.name))
                RageUI.Separator(('Label [~y~%s~s~]'):format(adminManagement.SelectedSocietyGrade.label))
                RageUI.Separator(('Salaire [~y~%s~s~]'):format(adminManagement.SelectedSocietyGrade.salary))
              
                RageUI.Line()
                RageUI.Button('Changer le label', nil, {}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Nouveau label', function(data)
                            if data == nil or data == '' then return end

                            adminManagement.SelectedSociety.grades[adminManagement.SelectedSocietyGradeId].label = data

                            secured_TriggerServerEvent('kayscore:admin:editSociety', adminManagement.SelectedSociety.name, adminManagement.SelectedSociety)
                        end)
                    end
                })

                    RageUI.Button('Changer le nom', nil, {}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Nouveau nom', function(data)
                                if data == nil or data == '' then return end

                                adminManagement.SelectedSociety.grades[adminManagement.SelectedSocietyGradeId].grade = data

                                secured_TriggerServerEvent('kayscore:admin:editSociety', adminManagement.SelectedSociety.name, adminManagement.SelectedSociety)
                            end)
                        end
                    })
                    RageUI.Button('Changer le salaire', nil, {}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Nouveau salaire', function(data)
                                if data == nil or data == '' then return end

                                adminManagement.SelectedSociety.grades[adminManagement.SelectedSocietyGradeId].salary = data

                                secured_TriggerServerEvent('kayscore:admin:editSociety', adminManagement.SelectedSociety.name, adminManagement.SelectedSociety)
                            end)
                        end
                    })

                    RageUI.Button('Supprimer le grade', nil, {backgroundColor = {255, 0, 0, 0}, RightLabel = '>'}, true, {
                        onSelected = function()
                            adminManagement.SelectedSociety.grades[adminManagement.SelectedSocietyGradeId] = nil

                            secured_TriggerServerEvent('kayscore:admin:editSociety', adminManagement.SelectedSociety.name, adminManagement.SelectedSociety)
                        end
                    })
        end)

         --FARMBUILDER--
         
         RageUI.IsVisible(openCreateFarm, function()
            RageUI.Button('Name du job ', nil, {}, true, {
                onSelected = function() 
                    KeyboardUtils.use('Nom du job ( sans espace )', function(string)
                        if string ~= "" then
                            namejob = string
                        end
                    end)
                end
            });
            if namejob ~= nil then
                RageUI.Separator(namejob)
            end
            RageUI.Button('Label du job ', nil, {}, true, {
                onSelected = function() 
                    KeyboardUtils.use('Label du job ( Nom affiché au joueurs )', function(string)
                        if string ~= "" then
                            labeljob = string
                        end
                    end)
                end
            });
            if labeljob ~= nil then
                RageUI.Separator(labeljob)
            end
            RageUI.Button('name de l\'item récolte', nil, {}, true, {
                onSelected = function() 
                    KeyboardUtils.use('Nom de l\'item récolte ( sans espace )', function(string)
                        if string ~= "" then
                            namerecolteitem = string
                        end
                    end)
                end
            });
            if namerecolteitem ~= nil then
                RageUI.Separator(namerecolteitem)
            end
            RageUI.Button('Label de l\'item récolte', nil, {}, true, {
                onSelected = function() 
                    KeyboardUtils.use('Label de l\'item récolte', function(string)
                        if string ~= "" then
                            labelrecolteitem = string
                        end
                    end)
                end
            });
            if labelrecolteitem ~= nil then
                RageUI.Separator(labelrecolteitem)
            end
            RageUI.Button('Position de la récolte', nil, {}, true, {
                onSelected = function() 
                    PositionRecolte = GetEntityCoords(PlayerPedId(), true)
                end
            });
            if PositionRecolte ~= nil then
                RageUI.Separator(PositionRecolte)
            end
            RageUI.Button('name de l\'item traitement ', nil, {}, true, {
                onSelected = function() 
                    KeyboardUtils.use('Nom de l\'item traitement ( sans espace )', function(string)
                        if string ~= "" then
                            nametraitementitem = string
                        end
                    end)
                end
            });
            if nametraitementitem ~= nil then
                RageUI.Separator(nametraitementitem)
            end
            RageUI.Button('Label de l\'item traitement', nil, {}, true, {
                onSelected = function() 
                    KeyboardUtils.use('Label de l\'item traitement', function(string)
                        if string ~= "" then
                            labeltraitementitem = string
                        end
                    end)
                end
            });
            if labeltraitementitem ~= nil then
                RageUI.Separator(labeltraitementitem)
            end
            RageUI.Button('Position du Traitement', nil, {}, true, {
                onSelected = function() 
                    PositionTraitement = GetEntityCoords(PlayerPedId(), true)
                end
            });
            if PositionTraitement ~= nil then
                RageUI.Separator(PositionTraitement)
            end
            RageUI.Button('Position de la vente', nil, {}, true, {
                onSelected = function() 
                    PositionVente = GetEntityCoords(PlayerPedId(), true)
                end
            });
            if PositionVente ~= nil then
                RageUI.Separator(PositionVente)
            end
            RageUI.Button(kayscoreConfigServ.GTACOLOR..'Confirmer', nil, {}, true, {
                onSelected = function() 
                    print(labeltraitementitem)
                    secured_TriggerServerEvent('Zigi:CreateFarmEntreprise', namejob, labeljob, namerecolteitem, labelrecolteitem, PositionRecolte, nametraitementitem, labeltraitementitem, PositionTraitement, PositionVente)
                    RageUI.CloseAll()
                end
            });
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(mba) and not RageUI.Visible(tpoints) and not RageUI.Visible(staffGestion_reportList) and not RageUI.Visible(openEditSocietyGrade) and not RageUI.Visible(openEditGradeMenu) and not RageUI.Visible(actionsPersonnel) and not RageUI.Visible(playersList) and not RageUI.Visible(reportsList) and not RageUI.Visible(selectedPlayer) and not RageUI.Visible(accountsPlayer) and not RageUI.Visible(jobPlayer) and not RageUI.Visible(addJobPlayer) and not RageUI.Visible(addJobPlayerList) and not RageUI.Visible(addJobGradeWithJobList) and not RageUI.Visible(changePlayerGroup) and not RageUI.Visible(infoPlayer) and not RageUI.Visible(vehiclesOptions) and not RageUI.Visible(selectedReport) and not RageUI.Visible(accountsReportPlayer) and not RageUI.Visible(jobReportPlayer) and not RageUI.Visible(addJobReportPlayer) and not RageUI.Visible(addJobReportPlayerList) and not RageUI.Visible(addReportJobGradeWithJobList) and not RageUI.Visible(changeReportPlayerGroup) and not RageUI.Visible(infoReportPlayer) and not RageUI.Visible(staffGestion_list) and not RageUI.Visible(staffGestion) and not RageUI.Visible(SearchUniqueID) and not RageUI.Visible(UniqueIDresult) and not RageUI.Visible(UniqueIDPlayerInventory) and not RageUI.Visible(menuServerOptionsPhone) and not RageUI.Visible(serverOptions) and not RageUI.Visible(eventOptions) and not RageUI.Visible(openJobList) and not RageUI.Visible(fireWorksEvent) and not RageUI.Visible(openServInfo) and not RageUI.Visible(UniqueIDPlayerBoutiqueHistory) and not RageUI.Visible(WeaponListIDUnique) and not RageUI.Visible(WarnListPlayer) and not RageUI.Visible(UniqueIDPlayerDataGIVE_VEHICLE) and not RageUI.Visible(UniqueIDPlayerDataGIVE_VEHICLE_GARAGE) and not RageUI.Visible(WarnListPlayerUniqueID) and not RageUI.Visible(changePlayerGroupWithUniqueID) and not RageUI.Visible(truckEvent) and not RageUI.Visible(openEventCreator) and not RageUI.Visible(openCreateSociety) and not RageUI.Visible(openEditSociety) and not RageUI.Visible(openEditSelectedSociety) and not RageUI.Visible(openInformationsSociety) and not RageUI.Visible(UniqueIDPlayerDataGIVE_Item) and not RageUI.Visible(weaponsSell) and not RageUI.Visible(UniqueIDPlayerInventoryWeaponSelect) and not RageUI.Visible(weaponsSellGroupList) and not RageUI.Visible(createDrugs) and not RageUI.Visible(createCircuit) and not RageUI.Visible(editCircuit) and not RageUI.Visible(editCircuit2) and not RageUI.Visible(editPosWithCategorie_drugs)  and not RageUI.Visible(editSellDrugs) and not RageUI.Visible(UniqueIDPlayerWeapponAccesory) and not RageUI.Visible(manageVehicleConcess) and not RageUI.Visible(manageVehicleConcessCreateVehicle) and not RageUI.Visible(manageVehicleConcessCreateVehicleCategorie) and not RageUI.Visible(manageVehicleConcessEdit) and not RageUI.Visible(manageVehicleConcessEditCategorie) and not RageUI.Visible(manageVehicleConcessEditAllCategorie) and not RageUI.Visible(manageVehicleConcessEditAllCategorieEdit) and not RageUI.Visible(manageVehicleConcessEditAllCategorieEditAdd) and not RageUI.Visible(manageVehicleConcessEditAllCategorieEditInformations) and not RageUI.Visible(openCreateFarm) and not RageUI.Visible(manageVehicleBoutique) and not RageUI.Visible(weatherManagement) and

        not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
        end
    end
end

AddEventHandler("staff:addTerritoryEventData", function (name)
    if Config.eventsMenu["Attaque Territoire"]["menu"]["zone"]["list"] == nil then
        Config.eventsMenu["Attaque Territoire"]["menu"]["zone"]["list"] = {}
    end

    table.insert(Config.eventsMenu["Attaque Territoire"]["menu"]["zone"]["list"], name)
end)

AddEventHandler("staff:removeTerritoryEventData", function (name)
    for k, v in pairs(Config.eventsMenu["Attaque Territoire"]["menu"]["zone"]["list"]) do
        if v ~= name then goto continue end

        table.remove(Config.eventsMenu["Attaque Territoire"]["menu"]["zone"]["list"], k)

        ::continue::
    end
end)

RegisterNetEvent('kayscore:admin:atazone', function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    ESX.ShowNotification('Vous avez été ATA par un Staff')
    ataThread(180, 1)
end)

RegisterKeyMapping('tpmarker', 'Se tp au marker', 'keyboard', 'O')
RegisterCommand('tpmarker', function()
    if (Config.Staff.HavePermission('VehiclesOptions', 'returnveh')) and adminManagement.Service then
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local waypointBlip = GetFirstBlipInfoId(8)

        if DoesBlipExist(waypointBlip) then
            local waypointCoords = GetBlipInfoIdCoord(waypointBlip)

            if IsPedInAnyVehicle(playerPed, false) then
                local vehicle = GetVehiclePedIsIn(playerPed, false)
                SetEntityCoords(vehicle, waypointCoords.x, waypointCoords.y, waypointCoords.z)
            else
                SetEntityCoords(playerPed, waypointCoords.x, waypointCoords.y, waypointCoords.z)
            end
        else
            ESX.ShowNotification('❌ Aucun waypoint')
        end
    end
end)


local lastTpTime = {} 
local cooldown = 4 * 1000  

RegisterKeyMapping('tpaleatoire', '[STAFF] TP Aléatoire J', 'keyboard', 'i')
RegisterCommand('tpaleatoire', function(source, args)
    local player = tonumber(source)
    local currentTime = GetGameTimer()  
    local playerLastTpTime = lastTpTime[player] or 0  

    if currentTime - playerLastTpTime < cooldown then  
        local timeLeft = (cooldown - (currentTime - playerLastTpTime)) / 1000 
        ESX.ShowNotification("🚨 Veuillez attendre " .. kayscoreConfigServ.GTACOLOR .. timeLeft .. " secondes ~s~avant de vous téléporter à nouveau.")
        return
    end

    if not Config.Staff.HavePermission('VehiclesOptions', 'returnveh') or not adminManagement.Service then
        return
    end

    if not adminManagement.NoClip then
        ESX.ShowNotification('🚨 Vous ne pouvez pas vous téléporter tant que le mode NoClip est désactivé !')
        return
    end

    local players = GetActivePlayers()
    local randomPlayer = players[math.random(#players)]

    if randomPlayer == PlayerId() then
        ESX.ShowNotification('🚨 Vous ne pouvez pas vous téléporter à vous-même !')
        return
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(randomPlayer)))
    SetEntityCoords(PlayerPedId(), x, y, z, false, false, false, false)
    lastTpTime[player] = currentTime  
end)

AddEventHandler('playerDropped', function()
    local player = tonumber(source)
    lastTpTime[player] = nil  
end)

