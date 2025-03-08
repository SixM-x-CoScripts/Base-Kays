local Bennys = {
    inService = false,
}

local Vehicles = {}
local PlayerData = {}
local CallsTable = {}
local CallInfo = {
    coords = {},
    raison = "",
    id = 0
}
local lsMenuIsShowed = false
local isInLSMarker = false
local myCar = {}
local vehicleClass = nil
local vehiclePrice = 150000
local shopProfitValue = 0
local shopCart = {}
local totalCartValue = 0
local canClose = false
local society = ""
local stop = false
local deleting = false
local AddBlipForCoord = AddBlipForCoord
local SetBlipRoute = SetBlipRoute
local DoesBlipExist = DoesBlipExist
local PlayerPedId = PlayerPedId
local GetEntityCoords = GetEntityCoords
local GetBlipCoords = GetBlipCoords
local GetEntityModel = GetEntityModel
local GetHashKey = GetHashKey
local GetEntityAttachedTo = GetEntityAttachedTo
local GetEntitySpeed = GetEntitySpeed
local GetVehiclePedIsIn = GetVehiclePedIsIn
local DoesEntityExist = DoesEntityExist
local NetworkGetNetworkIdFromEntity = NetworkGetNetworkIdFromEntity
local GetVehicleNumberOfPassengers = GetVehicleNumberOfPassengers
local GetPedInVehicleSeat = GetPedInVehicleSeat
local NetworkGetEntityFromNetworkId = NetworkGetEntityFromNetworkId
local NetworkDoesEntityExistWithNetworkId = NetworkDoesEntityExistWithNetworkId
local NetworkRequestControlOfEntity = NetworkRequestControlOfEntity
local NetworkHasControlOfEntity = NetworkHasControlOfEntity
local GetEntityAttachedToTowTruck = GetEntityAttachedToTowTruck
local AttachVehicleToTowTruck = AttachVehicleToTowTruck
local IsVehicleAttachedToTowTruck = IsVehicleAttachedToTowTruck
local GetVehicleClass = GetVehicleClass
local GetEntityBonePosition_2 = GetEntityBonePosition_2
local GetEntityBoneIndexByName = GetEntityBoneIndexByName
local DetachVehicleFromTowTruck = DetachVehicleFromTowTruck
local IsEntityAttachedToAnyVehicle = IsEntityAttachedToAnyVehicle
local AttachEntityToEntity = AttachEntityToEntity
local DetachEntity = DetachEntity
local SetVehicleOnGroundProperly = SetVehicleOnGroundProperly
local mainMenu = nil 
local bodyMenu = nil
local extrasMenu = nil
local colorMenu = nil
local neonMenu = nil
local upgradeMenu = nil
local cartMenu = nil
local towVehicles = { GetHashKey("flatbed"), GetHashKey("towtruck"), GetHashKey("towtruck2") }
local poundsPos = { vec3(393.643494, -1616.632080, 29.291941), vec3(1375.744019, 3598.277100, 34.894859), vec3(113.337364, 6610.078613, 31.868477) }
local tempBodyParts = nil
local tempExtras = nil
local tempColorParts = nil
local tempNeons = nil
local tempUpgrades = nil
local SongReports = false


local bodyPartIndex = {
	[1] = { modSpoilers = 1 },
	[2] = { modFrontBumper = 1 },
	[3] = { modRearBumper = 1 },
	[4] = { modSideSkirt = 1 },
	[5] = { modExhaust = 1 },
	[6] = { modGrille = 1 },
	[7] = { modHood = 1 },
	[8] = { modFender = 1 },
	[9] = { modRightFender = 1 },
	[10] = { modRoof = 1 },
	[11] = { modArmor = 1 },
	[12] = { wheels = 1 },
	[13] = { modFrontWheels = 1 },
}

local extrasIndex = {
	[1] = { modPlateHolder = 1 },
	[2] = { modVanityPlate = 1 },
	[3] = { modTrimA = 1 },
	[4] = { modOrnaments = 1 },
	[5] = { modDashboard = 1 },
	[6] = { modDial = 1 },
	[7] = { modDoorSpeaker = 1 },
	[8] = { modSeats = 1 },
	[9] = { modSteeringWheel = 1 },
	[10] = { modShifterLeavers = 1 },
	[11] = { modAPlate = 1 },
	[12] = { modSpeakers = 1 },
	[13] = { modTrunk = 1 },
	[14] = { modHydrolic = 1 },
	[15] = { modEngineBlock = 1 },
	[16] = { modAirFilter = 1 },
	[17] = { modStruts = 1 },
	[18] = { modArchCover = 1 },
	[19] = { modAerials = 1 },
	[20] = { modTrimB = 1 },
	[21] = { modTank = 1 },
	[22] = { modWindows = 1 },
	[23] = { modLivery = 1 },
	[24] = { modHorns = 1 },
}

local windowTintIndex = 1
local colorPartIndex = 1 
local colorTypeIndex = {
	[1] = 1,
	[2] = 1,
	[3] = 1,
	[5] = 1,	
}
local primaryColorIndex = 1
local secondaryColorIndex = 1
local interiorColorIndex = 1
local pearlColorIndex = 1
local primaryCustomColorIndex = { 
	[1] = { label = 'R', index = 0 }, 
	[2] = { label = 'G', index = 0 }, 
	[3] = { label = 'B', index = 0 }
}
local secondaryCustomColorIndex = { 
	[1] = { label = 'R', index = 0 }, 
	[2] = { label = 'G', index = 0 }, 
	[3] = { label = 'B', index = 0 }
}
local interiorCustomColorIndex = { 
	[1] = { label = 'R', index = 0 }, 
	[2] = { label = 'G', index = 0 }, 
	[3] = { label = 'B', index = 0 }
}
local primaryPaintFinishIndex = 1
local secondaryPaintFinishIndex = 1
local interiorPaintFinishIndex = 1
local wheelColorIndex = 1
local tyreSmokeActive = false
local smokeColorIndex = {
	[1] = { label = 'R', index = 0 }, 
	[2] = { label = 'G', index = 0 }, 
	[3] = { label = 'B', index = 0 }
}
local xenonActive = false
local xenonColorIndex = 1

local neonIndex = {
	[1] = { leftNeon = false },
	[2] = { frontNeon = false },
	[3] = { rightNeon = false },
	[4] = { backNeon = false },
	[5] = { r = 0, g = 0, b = 0 },
}
local neonIndex = { 
	[1] = { label = 'R', index = 0 }, 
	[2] = { label = 'G', index = 0 }, 
	[3] = { label = 'B', index = 0 }
}

local neon1 = false
local neon2 = false
local neon3 = false
local neon4 = false

local upgradeIndex = {
	[1] = { modArmor = 1 },
	[2] = { modEngine = 1 },
	[3] = { modTransmission = 1 },
	[4] = { modBrakes = 1 },
	[5] = { modSuspension = 1 },
	[6] = { modTurbo = false },
}

local vehPedIsIn = nil
local vehModsOld = nil
local vehModsNew = nil
local interiorColorOld = nil
local interiorColorNew = nil
local partsCart = {}

local upgradeIndex = {
	[1] = { modArmor = 1 },
	[2] = { modEngine = 1 },
	[3] = { modTransmission = 1 },
	[4] = { modBrakes = 1 },
	[5] = { modSuspension = 1 },
	[6] = { modTurbo = false },
}

Bennys.openInteractMenu = function()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')
    local AppelMenu = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local AppelTakeMenu = RageUI.CreateSubMenu(AppelMenu, '', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))

    while main do 
        Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Checkbox('Statut de l\'entreprise', 'Quand cette case est cochée votre ENTREPRISE est notée comme ouverte', Society.List[ESX.PlayerData.job.name].state, {}, {
                onChecked = function()
                    secured_TriggerServerEvent('kayscore:jobs:updateSocietyStatus', true)
                end,
                onUnChecked = function()
                    secured_TriggerServerEvent('kayscore:jobs:updateSocietyStatus', false)
                end
            })
            RageUI.Checkbox('Service', nil, Bennys.inService, {}, {
                onChecked = function()
                    Bennys.inService = true
                    TriggerServerEvent('kayscore:bennys:service')
                end,
                onUnChecked = function()
                    Bennys.inService = false
                    TriggerServerEvent('kayscore:bennys:service')
                end
            })
            if Bennys.inService then
                RageUI.Checkbox('Son des appels', nil, SongReports, {}, {
                    onChecked = function()
                        SongReports = true
                    end,
                    onUnChecked = function()
                        SongReports = false
                    end
                })

                RageUI.Button("Montrer son badge", nil, {}, true, {
                    onSelected = function()
                        ShowJobBadge(ESX.PlayerData.job.name)
                    end
                })

                RageUI.Button('Réparer véhicule', nil, {}, true, {
                    onSelected = function()
                        local playerPed = Player.playerPed
                        local vehicle = ESX.Game.GetVehicleInDirection()
                        local coords = GetEntityCoords(playerPed, false)
    
                        if IsPedSittingInAnyVehicle(playerPed) then
                            ESX.ShowNotification('~r~Vous ne pouvez pas faire sa a l\'intérieur d\'un véhicule')
                            return
                        end
    
                        if DoesEntityExist(vehicle) then
                            TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
                            
                            Citizen.CreateThread(function()
                                Citizen.Wait(10000)
                                SetVehicleFixed(vehicle)
                                SetVehicleDeformationFixed(vehicle)
                                SetVehicleUndriveable(vehicle, false)
                                SetVehicleEngineHealth(vehicle, 1000.0)
                                SetVehicleEngineOn(vehicle, true, true)
                                ClearPedTasksImmediately(playerPed)
                                ESX.ShowNotification('~g~Succès ~s~Le véhicule a été réparé')
                                TriggerServerEvent('kayscore:bennys:repairVehicle', GetVehicleNumberPlateText(vehicle))
                            end)
                        else
                            ESX.ShowNotification('~r~Aucun véhicule au alentours')
                        end
                    end,
                    onActive = function()
                        local vehicle = ESX.Game.GetClosestVehicle(GetEntityCoords(Player.playerPed, false), false)
                        local VehiclePos = GetEntityCoords(vehicle)
                        DrawMarker(2, VehiclePos.x, VehiclePos.y, VehiclePos.z + 1.8, 0, 0, 0, 180.0, nil, nil, 0.5, 0.5, 0.5,
                            255, 143, 0, 170, false, true, nil, true)
                    end
                })

                RageUI.Button('Crocheter', nil, {}, true, {
                    onSelected = function()
                        local playerPed = Player.playerPed
                        local vehicle = ESX.Game.GetVehicleInDirection()
                        local coords = GetEntityCoords(playerPed, false)
    
                        if IsPedSittingInAnyVehicle(playerPed) then
                            ESX.ShowNotification('~r~Vous ne pouvez pas faire sa a l\'intérieur d\'un véhicule')
                            return
                        end
    
                        if DoesEntityExist(vehicle) then
                            TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
                            Citizen.CreateThread(function()
                                Citizen.Wait(10000)
                                SetVehicleDoorsLocked(vehicle, 1)
                                SetVehicleDoorsLockedForAllPlayers(vehicle, false)
                                ClearPedTasksImmediately(playerPed)
                                ESX.ShowNotification('~g~Succès ~w~Le véhicule à été dévérouiller')
                            end)
                        else
                            ESX.ShowNotification('~r~Aucun véhicule au alentours')
                        end
                    end,
                    onActive = function()
                        local vehicle = ESX.Game.GetClosestVehicle(GetEntityCoords(Player.playerPed, false), false)
                        local VehiclePos = GetEntityCoords(vehicle)
                        DrawMarker(2, VehiclePos.x, VehiclePos.y, VehiclePos.z + 1.8, 0, 0, 0, 180.0, nil, nil, 0.5, 0.5, 0.5,
                            255, 143, 0, 170, false, true, nil, true)
                    end
                })
                
                RageUI.Button('Nettoyer', nil, {}, true, {
                    onSelected = function()
                        local playerPed = Player.playerPed
                        local vehicle = ESX.Game.GetVehicleInDirection()
                        local coords = GetEntityCoords(playerPed, false)
    
                        if IsPedSittingInAnyVehicle(playerPed) then
                            ESX.ShowNotification('~r~Vous ne pouvez pas faire sa a l\'intérieur d\'un véhicule')
                            return
                        end
    
                        if DoesEntityExist(vehicle) then
                            TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_MAID_CLEAN", 0, true)
                            Citizen.CreateThread(function()
                                Citizen.Wait(10000)
                                SetVehicleDirtLevel(vehicle, 0)
                                ClearPedTasksImmediately(playerPed)
                                ESX.ShowNotification('~g~Succès ~w~Le véhicule à été dévérouiller')
                            end)
                        else
                            ESX.ShowNotification('~r~Aucun véhicule au alentours')
                        end
                    end,
                    onActive = function()
                        local vehicle = ESX.Game.GetClosestVehicle(GetEntityCoords(Player.playerPed, false), false)
                        local VehiclePos = GetEntityCoords(vehicle)
                        DrawMarker(2, VehiclePos.x, VehiclePos.y, VehiclePos.z + 1.8, 0, 0, 0, 180.0, nil, nil, 0.5, 0.5, 0.5,
                            255, 143, 0, 170, false, true, nil, true)
                    end
                })
                
                RageUI.Button('Faire une facture', nil, {}, true, {
                    onSelected = function()
                        local player, distance = ESX.Game.GetClosestPlayer()
                        if distance == -1 or distance > 3 then return ESX.ShowNotification('Personne aux alentours') end
                        KeyboardUtils.use('Montant', function(data)
                            local data = tonumber(data)
                            if data == nil or data <= 0 then return end
                            secured_TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), ('society_%s'):format(ESX.GetPlayerData().job.name), ESX.GetPlayerData().job.label, data)
                        end)
                    end
                })
                RageUI.Line()
                RageUI.Button('Faire une annonce personnaliser', nil, {}, true, {
                    onSelected = function()
                        
                        KeyboardUtils.use('Contenu', function(msg)
                            if msg == nil then return end
                            secured_TriggerServerEvent('monjob:annoncer', msg, ESX.PlayerData.job.name)
                        end)
                    end
                })

                RageUI.Button("Centre d'appel", nil, {RightLabel = ("%s appels"):format(#CallsTable)}, true, {
                    onSelected = function()
                        CallsTable = {}
                        ESX.TriggerServerCallback('kayscore:appelRetreive:job', function(calls)
                            CallsTable = calls
                        end)
                    end
                }, AppelMenu)
            end 
        end) 

        RageUI.IsVisible(AppelMenu, function()
            if #CallsTable == 0 then
                RageUI.Separator('~r~Aucun appel en cours')
            else
                RageUI.Button('Vider la liste des appels', nil, {RightLabel = "⚠️"}, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        TriggerServerEvent('kayscore:bande:clearlatable')
                    end
                })
        
                RageUI.Line()
        
                for k, v in pairs(CallsTable) do
                    RageUI.Button('#'..k..' '..v.raison, nil, {RightLabel = '>'}, true, {
                        onSelected = function()
                            CallInfo.coords = v.pos 
                            CallInfo.raison = v.raison
                            CallInfo.id = v.id
                        end
                    }, AppelTakeMenu)
                end
            end
        end)

        RageUI.IsVisible(AppelTakeMenu, function()
            RageUI.Button('Prendre l\'appel', nil, {}, true, {
                onSelected = function()
                    SetNewWaypoint(CallInfo.coords.x, CallInfo.coords.y)
                end
            })
            RageUI.Button('Supprimer l\'appel', nil, {}, true, {
                onSelected = function()
                    TriggerServerEvent('kayscore:appelDelete:job', CallInfo.id)
                    ESX.TriggerServerCallback('kayscore:appelRetreive:job', function(calls)
                        CallsTable = calls
                    end)
                end
            }, AppelMenu)
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(AppelMenu) and not RageUI.Visible(AppelTakeMenu) then
            main = RMenu:DeleteType('main')
        end
    end
end


RegisterNetEvent('soundmecano:playSound')
AddEventHandler('soundmecano:playSound', function()
    if Bennys.inService then
        if SongReports then
            secured_TriggerEvent('InteractSound_CL:PlayOnOne', 'tutu', 0.5)
        end
    end
end)

function ClosetVehWithDisplayBennys()
    local veh = ESX.Game.GetClosestVehicle(GetEntityCoords(PlayerPedId()))
    local vCoords = GetEntityCoords(veh)
    DrawMarker(20, vCoords.x, vCoords.y, vCoords.z + 1.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 162, 0, 255, 170, 0, 1, 2, 0, nil, nil, 0)
end

RegisterCommand('F6_mecano', function()
    if ESX.PlayerData.job.name == 'mecano' or ESX.PlayerData.job.name == 'lscustom' then
        Bennys.openInteractMenu()
    end
end)
RegisterKeyMapping('F6_mecano', 'Menu Mécano', 'keyboard', 'F6')


local function actionOnVehicle(label)
    CanRagdoll(false)
    TriggerEvent("dpemotes:setCanDoAnimations", false)

    lib.progressBar({
        duration = 5000,
        label = label,
        canCancel = false,
        anim = {
            dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
            clip = "machinic_loop_mechandplayer",
            playEnter = true,
            flag = 0
        },
        disable = {
            move = true
        }
    })

    CanRagdoll(true)
    TriggerEvent("dpemotes:setCanDoAnimations", true)
end
local function isVehicleEmpty(vehicle)
    local passengers = GetVehicleNumberOfPassengers(vehicle)
    if passengers > 0 then
        return false
    end

    local isDriverSeatFree = GetPedInVehicleSeat(vehicle, -1)
    if isDriverSeatFree ~= 0 then
        return false
    end

    return true
end
-- function getCarPrice()
-- 	if vehPedIsIn then
-- 		for i = 1, #Vehicles, 1 do
-- 			if GetEntityModel(vehPedIsIn) == GetHashKey(Vehicles[i].model) then
-- 				vehiclePrice = Vehicles[i].price
-- 				break
-- 			end
-- 		end
-- 	end
-- end

-- --REFRESH INDEXES
-- function RefreshBodyPartIndex()
-- 	for k, v in pairs(vehModsOld) do
-- 		--print("k: " .. k)
-- 		for i = 1, #tempBodyParts, 1 do
-- 			if k == tempBodyParts[i]['mod'] then
-- 				--print("config: " .. tempBodyParts[i]['mod'])
-- 				bodyPartIndex[i][k] = v + (tempBodyParts[i]['mod'] ~= 'wheels' and 2 or 1)
-- 				break
-- 			end
-- 		end
-- 	end
-- end

-- function RefreshExtrasIndex()
-- 	for k, v in pairs(vehModsOld) do
-- 		for i = 1, #tempExtras, 1 do
-- 			if k == tempExtras[i]['mod'] then
-- 				extrasIndex[i][k] = v + 2
-- 				break
-- 			end
-- 		end
-- 	end
-- end

-- function RefreshPaintIndex()
-- 	windowTintIndex = vehModsOld['windowTint'] + 2
-- 	--colorPartIndex = 1 
-- 	for i = 1, #Config_Bennys.colorPalette - 2, 1 do
-- 		for k, v in pairs(Config_Bennys.colorPalette[i]) do
-- 			for x = 1, #v, 1 do
-- 				if vehModsOld['color1'] == v[x] then
-- 					colorTypeIndex[1] = vehModsOld['hasCustomColorPrimary'] == 1 and 7 or i
-- 					primaryPaintFinishIndex = i
-- 					primaryColorIndex = x
-- 				end
-- 				if vehModsOld['color2'] == v[x] then
-- 					colorTypeIndex[2] = vehModsOld['hasCustomColorSecondary'] == 1 and 7 or i
-- 					secondaryPaintFinishIndex = i
-- 					secondaryColorIndex = x
-- 				end
-- 				if vehModsOld['pearlescentColor'] == v[x] then
-- 					colorTypeIndex[3] = i
-- 					pearlColorIndex = x
-- 				end
-- 				if interiorColorOld == v[x] then
-- 					colorTypeIndex[5] = i
-- 					interiorColorIndex = x
-- 				end
-- 				if vehModsOld['wheelColor'] == v[x] then
-- 					wheelColorIndex = x
-- 				end
-- 			end
-- 		end
-- 	end
-- 	if vehModsOld['hasCustomColorPrimary'] == 1 then
-- 		primaryCustomColorIndex[1]['index'] = vehModsOld['customColorPrimary'][1]
-- 		primaryCustomColorIndex[2]['index'] = vehModsOld['customColorPrimary'][2]
-- 		primaryCustomColorIndex[3]['index'] = vehModsOld['customColorPrimary'][3]
-- 	end
-- 	if vehModsOld['hasCustomColorSecondary'] == 1 then
-- 		secondaryCustomColorIndex[1]['index'] = vehModsOld['customColorSecondary'][1]
-- 		secondaryCustomColorIndex[2]['index'] = vehModsOld['customColorSecondary'][2]
-- 		secondaryCustomColorIndex[3]['index'] = vehModsOld['customColorSecondary'][3]
-- 	end
-- 	if vehModsOld['hasCustomColorInterior'] == 1 then
-- 		interiorCustomColorIndex[1]['index'] = vehModsOld['customColorInterior'][1]
-- 		interiorCustomColorIndex[2]['index'] = vehModsOld['customColorInterior'][2]
-- 		interiorCustomColorIndex[3]['index'] = vehModsOld['customColorInterior'][3]
-- 	end
-- 	tyreSmokeActive = vehModsOld['modSmokeEnabled'] and true or false
-- 	if tyreSmokeActive then
-- 		smokeColorIndex[1]['index'] = vehModsOld['tyreSmokeColor'][1]
-- 		smokeColorIndex[2]['index'] = vehModsOld['tyreSmokeColor'][2]
-- 		smokeColorIndex[3]['index'] = vehModsOld['tyreSmokeColor'][3]
-- 	end
-- 	xenonActive = vehModsOld['modXenon'] and true or false
-- 	--[[ if xenonActive then
-- 		xenonColorIndex = vehModsOld['xenonColor'] + 2
-- 	end ]]
-- end

-- function RefreshNeonIndex()
-- 	neon1 = vehModsOld['neonEnabled'][1] and true or false
-- 	neon2 = vehModsOld['neonEnabled'][2] and true or false
-- 	neon3 = vehModsOld['neonEnabled'][3] and true or false
-- 	neon4 = vehModsOld['neonEnabled'][4] and true or false
-- 	neonIndex[1]['index'] = vehModsOld['neonColor'][1]
-- 	neonIndex[2]['index'] = vehModsOld['neonColor'][2]
-- 	neonIndex[3]['index'] = vehModsOld['neonColor'][3]
-- end

-- function RefreshUpgradeIndex()
-- 	for k, v in pairs(vehModsOld) do 
-- 		for i = 1, #tempUpgrades, 1 do
-- 			if k == tempUpgrades[i]['mod'] and tempUpgrades[i]['modType'] ~= 18 then
-- 				upgradeIndex[i][k] = v + 2
-- 				break
-- 			elseif k == tempUpgrades[i]['mod'] and tempUpgrades[i]['modType'] == 18 then
-- 				upgradeIndex[i][k] = v and true or false
-- 				break
-- 			end
-- 		end
-- 	end
-- end

-- --RESET ITEM LISTS
-- function ResetBodyPartItems()
-- 	if tempBodyParts then
-- 		for i = 1, #tempBodyParts, 1 do
-- 			if i ~= 12 then
-- 				for x = 1, #tempBodyParts[i]['items']['label'] do
-- 				    tempBodyParts[i]['items']['label'][x] = nil
-- 				end
-- 			end
-- 		end
-- 	end
-- end

-- function ResetWheelItems()
-- 	if tempBodyParts then
-- 		for x = 1, #tempBodyParts[13]['items']['label'] do
-- 		    tempBodyParts[13]['items']['label'][x] = nil
-- 		end
-- 	end
-- end

-- function ResetExtraItems()
-- 	if tempExtras then
-- 		for i = 1, #tempExtras, 1 do
-- 			for x = 1, #tempExtras[i]['items']['label'] do
-- 			    tempExtras[i]['items']['label'][x] = nil
-- 			end
-- 		end
-- 	end
-- end

-- function ResetPaintItems()
-- 	windowTintIndex = 1
-- 	colorPartIndex = 1 
-- 	colorTypeIndex[1] = 1
-- 	colorTypeIndex[2] = 1
-- 	colorTypeIndex[3] = 1
-- 	primaryColorIndex = 1
-- 	secondaryColorIndex = 1
-- 	interiorColorIndex = 1
-- 	primaryCustomColorIndex[1]['index'] = 0
-- 	primaryCustomColorIndex[2]['index'] = 0
-- 	primaryCustomColorIndex[3]['index'] = 0
-- 	secondaryCustomColorIndex[1]['index'] = 0
-- 	secondaryCustomColorIndex[2]['index'] = 0
-- 	secondaryCustomColorIndex[3]['index'] = 0
-- 	interiorCustomColorIndex[1]['index'] = 0
-- 	interiorCustomColorIndex[2]['index'] = 0
-- 	interiorCustomColorIndex[3]['index'] = 0
-- 	primaryPaintFinishIndex = 1
-- 	secondaryPaintFinishIndex = 1
-- 	interiorPaintFinishIndex = 1
-- 	pearlColorIndex = 1
-- 	wheelColorIndex = 1
-- 	tyreSmokeActive = false
-- 	smokeColorIndex[1]['index'] = 0
-- 	smokeColorIndex[2]['index'] = 0
-- 	smokeColorIndex[3]['index'] = 0
-- 	xenonActive = false
-- 	xenonColorIndex = 1
-- end

-- function ResetNeonItems()
-- 	neon1 = false
-- 	neon2 = false
-- 	neon3 = false
-- 	neon4 = false
-- 	neonIndex[1]['index'] = 0
-- 	neonIndex[2]['index'] = 0
-- 	neonIndex[3]['index'] = 0
-- end

-- function ResetUpgradeItems()
-- 	if tempUpgrades then
-- 		for i = 1, #tempUpgrades, 1 do
-- 			for x = 1, #tempUpgrades[i]['items']['label'] do
-- 			    tempUpgrades[i]['items']['label'][x] = nil
-- 			end
-- 		end
-- 	end
-- end

-- --BUILD ITEM LISTS
-- function BuildBodyPartsLabel()
-- 	local modCount = 0
-- 	local modName = ""
-- 	local label = ""
-- 	for i = 1, #tempBodyParts, 1 do
-- 		modCount = GetNumVehicleMods(vehPedIsIn, tempBodyParts[i]['modType'])
-- 		if modCount > 0 and i < 12 then
-- 			for x = 1, modCount, 1 do
-- 				--[[modName = GetModTextLabel(vehPedIsIn, tempBodyParts[i]['modType'], x)
-- 				label = GetLabelText(modName)
-- 				if label == "NULL" then
-- 					label = "Custom " .. tempBodyParts[i]['label']
-- 				end
-- 				if #label > 10 then
-- 					label = label:sub(1, 10)
-- 					print("label cut: " .. label)
-- 				end--]]
-- 				if x == 1 then
-- 					--table.insert(tempBodyParts[i]['items']['label'], "Stock " .. label .. " [" .. x .. "/" .. modCount + 1 .. "]")
-- 					table.insert(tempBodyParts[i]['items']['label'], "[" .. x .. "/" .. modCount + 1 .. "]")
-- 				end
-- 				--label = label .. " [" .. x + 1 .. "/" .. modCount + 1 .. "]"
-- 				label = "[" .. x + 1 .. "/" .. modCount + 1 .. "]"
-- 				table.insert(tempBodyParts[i]['items']['label'], label)
-- 			end
-- 		end
-- 	end
-- end

-- function BuildWheelsLabel()
-- 	local modCount = GetNumVehicleMods(vehPedIsIn, tempBodyParts[13]['modType'])
-- 	if modCount > 0 then
-- 		for x = 1, modCount, 1 do
-- 			if x == 1 then
-- 				table.insert(tempBodyParts[13]['items']['label'], "[" .. x .. "/" .. modCount + 1 .. "]")
-- 			end
-- 			label = "[" .. x + 1 .. "/" .. modCount + 1 .. "]"
-- 			table.insert(tempBodyParts[13]['items']['label'], label)
-- 		end
-- 	end
-- end

-- function BuildExtrasLabel()
-- 	local modCount = 0
-- 	local modName = ""
-- 	local label = ""
-- 	for i = 1, #tempExtras, 1 do
-- 		modCount = GetNumVehicleMods(vehPedIsIn, tempExtras[i]['modType'])
-- 		if modCount > 0 then
-- 			for x = 1, modCount, 1 do
-- 				--[[modName = GetModTextLabel(vehPedIsIn, tempExtras[i]['modType'], x)
-- 				label = GetLabelText(modName)
-- 				if label == "NULL" then
-- 					label = "Custom " .. tempExtras[i]['label']
-- 				end--]]
-- 				if x == 1 then
-- 					--table.insert(tempExtras[i]['items']['label'], "Stock " .. label .. " [" .. x .. "/" .. modCount + 1 .. "]")
-- 					table.insert(tempExtras[i]['items']['label'], "[" .. x .. "/" .. modCount + 1 .. "]")
-- 				end
-- 				--label = label .. " [" .. x + 1 .. "/" .. modCount + 1 .. "]"
-- 				label = "[" .. x + 1 .. "/" .. modCount + 1 .. "]"
-- 				table.insert(tempExtras[i]['items']['label'], label)
-- 			end
-- 		end
-- 	end
-- end

-- function BuildUpgradesLabel()
-- 	local modCount = 0
-- 	local modName = ""
-- 	local label = ""
-- 	for i = 1, #tempUpgrades, 1 do
-- 		modCount = GetNumVehicleMods(vehPedIsIn, tempUpgrades[i]['modType'])
-- 		if modCount > 0 then
-- 			for x = 1, modCount, 1 do
-- 				--[[modName = GetModTextLabel(vehPedIsIn, tempUpgrades[i]['modType'], x)
-- 				label = GetLabelText(modName)--]]
-- 				--[[if label == "NULL" then
-- 					label = "Custom " .. tempUpgrades[i]['label']
-- 				end--]]
-- 				if x == 1 then
-- 					--local label1 = tempUpgrades[i]['label']
-- 					--table.insert(tempUpgrades[i]['items']['label'], "Stock " .. label1 .. " [" .. x .. "/" .. modCount + 1 .. "]")
-- 					table.insert(tempUpgrades[i]['items']['label'], "[" .. x .. "/" .. modCount + 1 .. "]")
-- 				end
-- 				--label = label .. " [" .. x + 1 .. "/" .. modCount + 1 .. "]"
-- 				label = "[" .. x + 1 .. "/" .. modCount + 1 .. "]"
-- 				table.insert(tempUpgrades[i]['items']['label'], label)
-- 			end
-- 		end
-- 	end
-- end

-- local dev = false
-- function finishPurchase()
-- 	local vehModsNew = lib.getVehicleProperties(vehPedIsIn)
-- 	terminatePurchase()
-- end

-- function terminatePurchase()
-- 	for k, v in pairs(shopCart) do
-- 		shopCart[k] = nil
-- 	end
-- 	if lsMenuIsShowed then
-- 		SetVehicleDoorsShut(vehPedIsIn, false)
-- 		SetVehicleDoorsLockedForAllPlayers(vehPedIsIn, false)
-- 		SetVehicleDoorsLockedForPlayer(vehPedIsIn, PlayerPedId(), false)
-- 		FreezeEntityPosition(vehPedIsIn, false)
-- 		RageUI.CloseAll()
-- 	end
-- 	lsMenuIsShowed = false
-- 	stop = false
-- 	vehModsOld = nil
-- end

-- function compareMods(label, mod, modType, index, price)
-- 	local vehModsNew = lib.getVehicleProperties(vehPedIsIn)
-- 	local interiorColorNew = GetVehicleInteriorColour(vehPedIsIn)
-- 	if (mod ~= 'neonColor' and mod ~= 'tyreSmokeColor' and mod ~= 'customColorPrimary' and mod ~= 'customColorSecondary' and vehModsOld[mod] ~= vehModsNew[mod]) or 
-- 		--apenas ligar neons
-- 		(mod == 'leftNeon' and not vehModsOld['neonEnabled'][1] and vehModsNew['neonEnabled'][1]) or 
-- 		(mod == 'rightNeon' and not vehModsOld['neonEnabled'][2] and vehModsNew['neonEnabled'][2]) or 
-- 		(mod == 'frontNeon' and not vehModsOld['neonEnabled'][3] and vehModsNew['neonEnabled'][3]) or 
-- 		(mod == 'backNeon' and not vehModsOld['neonEnabled'][4] and vehModsNew['neonEnabled'][4]) or
-- 		--mudar cor da neon
-- 		(mod == 'neonColor' and (vehModsOld['neonColor'][1] ~= vehModsNew['neonColor'][1] or vehModsOld['neonColor'][2] ~= vehModsNew['neonColor'][2] or vehModsOld['neonColor'][3] ~= vehModsNew['neonColor'][3])) or
-- 		(mod == 'tyreSmokeColor' and (vehModsOld['tyreSmokeColor'][1] ~= vehModsNew['tyreSmokeColor'][1] or vehModsOld['tyreSmokeColor'][2] ~= vehModsNew['tyreSmokeColor'][2] or vehModsOld['tyreSmokeColor'][3] ~= vehModsNew['tyreSmokeColor'][3])) or
-- 		(mod == 'xenonColor' and vehModsOld['xenonColor'] ~= vehModsNew['xenonColor']) or
-- 		(mod == 'interior' and interiorColorOld ~= interiorColorNew)
-- 		-- (mod == 'customColorPrimary' and (vehModsOld['customColorPrimary'][1] ~= vehModsNew['customColorPrimary'][1] or 
-- 		-- vehModsOld['customColorPrimary'][2] ~= vehModsNew['customColorPrimary'][2] or 
-- 		-- vehModsOld['customColorPrimary'][3] ~= vehModsNew['customColorPrimary'][3])) 
-- 		-- or 
-- 		-- (mod == 'customColorSecondary' and (vehModsOld['customColorSecondary'][1] ~= vehModsNew['customColorSecondary'][1] or vehModsOld['customColorSecondary'][2] ~= vehModsNew['customColorSecondary'][2] or vehModsOld['customColorSecondary'][3] ~= vehModsNew['customColorSecondary'][3]))
-- 		 then
-- 	else
-- 		--print('removed: ' .. mod)
-- 		if (mod == 'leftNeon' and not vehModsNew['neonEnabled'][1]) and 
-- 			(mod == 'rightNeon' and not vehModsNew['neonEnabled'][2]) and 
-- 			(mod == 'frontNeon' and not vehModsNew['neonEnabled'][3]) and 
-- 			(mod == 'backNeon' and not vehModsNew['neonEnabled'][4]) then


-- 		elseif mod == 'modSmokeEnabled' then
-- 		elseif mod == 'modXenon' then
-- 		end
-- 	end
-- end

-- function calcModPrice(parcel)
-- 	local val = 0
-- 	local basePrice = 10000
-- 	if 50000 < vehiclePrice and vehiclePrice <= 100000 then
-- 		basePrice = 20000
-- 	elseif 100000 < vehiclePrice then
-- 		basePrice = 30000
-- 	end
	
-- 	val = math.round((basePrice * (parcel / 100)) * 2)
-- 	return val
-- end

-- function ValidateCustomPrice(price)
--     totalCartValue += price
-- end

-- function RemoveCustomPrice(price)
--     totalCartValue -= price
-- end


-- function findKey(obj, keyToFind)
-- 	local foundIt = false
-- 	local key = nil
-- 	for k, v in pairs(obj) do
-- 		if k == keyToFind then
-- 			foundIt = true
-- 			key = k
-- 			break
-- 		end
-- 	end
-- 	if not foundIt then
-- 		return foundIt
-- 	else
-- 		return key
-- 	end
-- end

-- Bennys.openCustomMMenu = function()
--     if GetVehiclePedIsIn(PlayerPedId(), false) == 0 then return ESX.ShowNotification('Vous devez être dans un véhicule') end

--     vehPedIsIn = GetVehiclePedIsIn(PlayerPedId( ), false)
--     vehModsOld = lib.getVehicleProperties(vehPedIsIn)

--     vehPedIsIn = GetVehiclePedIsIn(PlayerPedId(), false)
--     terminatePurchase()
--     getCarPrice()
--     vehicleClass = GetVehicleClass(vehPedIsIn)
--     --print("vehicleClass: " .. vehicleClass)
--         --RageUI.CloseAll()
--         vehModsOld = lib.getVehicleProperties(vehPedIsIn)
--         interiorColorOld = GetVehicleInteriorColour(vehPedIsIn)
--         SetVehicleModKit(vehPedIsIn, 0)

--         --resetItems
--         ResetBodyPartItems()
--         ResetWheelItems()
--         ResetExtraItems()
--         ResetPaintItems()
--         ResetNeonItems()
--         ResetUpgradeItems()
        
--         if not tempBodyParts then tempBodyParts = Config_Bennys.bodyParts end
--         if not tempExtras then tempExtras = Config_Bennys.extras end
--         if not tempColorParts then tempColorParts = Config_Bennys.colorParts end
--         if not tempNeons then tempNeons = Config_Bennys.neons end
--         if not tempUpgrades then tempUpgrades = Config_Bennys.upgrades end
        
--         if vehicleClass == 8 and #tempBodyParts[12]['wheelType'] < 8 then
--             table.insert(tempBodyParts[12]['items'], 'Jantes Moto')
--             table.insert(tempBodyParts[12]['wheelType'], 6)
--         elseif vehicleClass ~= 8 and #tempBodyParts[12]['wheelType'] == 8 then
--             table.remove(tempBodyParts[12]['items'])
--             table.remove(tempBodyParts[12]['wheelType'])
--         end

--         --refresh indexes
--         RefreshBodyPartIndex()
--         RefreshExtrasIndex()
--         RefreshPaintIndex()
--         RefreshNeonIndex()
--         RefreshUpgradeIndex()
--         --refresh item names
--         BuildBodyPartsLabel()
--         BuildWheelsLabel()
--         BuildExtrasLabel()
--         BuildUpgradesLabel()

--         lsMenuIsShowed = true
--         --SetVehicleDoorsLocked(vehPedIsIn, 4)
--         --FreezeEntityPosition(vehPedIsIn, true)
--         FreezeEntityPosition(vehPedIsIn, true)
--         SetVehicleDoorsShut(vehPedIsIn, true)
--         SetVehicleDoorsLockedForPlayer(vehPedIsIn, PlayerPedId(), true)
--         SetVehicleDoorsLockedForAllPlayers(vehPedIsIn, true)
--         myCar = vehModsOld
--     if not tempUpgrades then tempUpgrades = Bennys.upgrades end

--     totalCartValue = 0

--     local main = RageUI.CreateMenu('', 'Actions Disponibles')

--     main.Closed = function()
--         exports['obiUI']:hide()
--     end

--     local performances = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

--     performances.Closed = function()
--         if not validatePerfo then
            
--         end
--     end
--     main.Closable = false

--     SetEntityRagdoll = true
--     validate = false
--     validatePerfo = false

--     RageUI.Visible(main, not RageUI.Visible(main))
--     local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    
--     ESX.TriggerServerCallback('kayscore:custom:getVehiclesPrices', function(vehicles)
-- 		Vehicles = vehicles

--         getCarPrice(vehicle)
-- 	end)
--     FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), true)
--     while main do Wait(1)
--         exports["obiUI"]:drawInfo('Informations Prix', {
--             {titlebar = 'Custom', subtitle = '$'},
--             {titlebar2 = 'Facture', subtitle2 = totalCartValue..'$'}
--         })
--         RageUI.IsVisible(main, function()
--             RageUI.Button('Performances', nil, {}, true, {
--                 onSelected = function()

--                 end
--             }, performances)
--             RageUI.Button('Carroserie', nil, {}, true, {
--                 onSelected = function()

--                 end
--             })
--             RageUI.Button('Esthétique', nil, {}, true, {
--                 onSelected = function()
--                 end
--             })
--             RageUI.Button('Peinture', nil, {}, true, {
--                 onSelected = function()
                    
--                 end
--             })
--             RageUI.Button('Néon', nil, {}, true, {
--                 onSelected = function()
--                 end
--             })
--             RageUI.Line()
--             RageUI.Button('Annuler', nil, {Color = {BackgroundColor = {255,0,0,100}}}, true, {
--                 onSelected = function()
--                     KeyboardUtils.use('Taper Y pour valider', function(data)
--                         if data == 'y' or data == 'Y' then
--                             validate = false
--                             FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), false)
--                             RageUI.CloseAll()
--                         end
--                     end)
--                 end
--             })
--             RageUI.Button('Confirmer', nil, {Color = {BackgroundColor = {0,255,0,100}}}, true, {
--                 onSelected = function()
--                     KeyboardUtils.use('Taper Y pour valider', function(data)
--                         if data == 'y' or data == 'Y' then
--                             validate = true
--                             FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), false)
--                             RageUI.CloseAll()
--                         end
--                     end)
--                 end
--             })
--         end)

--         RageUI.IsVisible(performances, function()
--             exports["obiUI"]:drawInfo('Informations Prix', {
--                 {titlebar = 'Custom', subtitle = '$'},
--                 {titlebar2 = 'Facture', subtitle2 = totalCartValue..'$'}
--             })
--             local menuItemCount = 0
--             for i = 1, #tempUpgrades, 1 do
--                 local modCount = GetNumVehicleMods(vehPedIsIn, tempUpgrades[i]['modType'])
--                 local upgIndex = 1
--                 if tempUpgrades[i]['mod'] == 'modTurbo' then
--                     upgIndex = upgradeIndex[i][tempUpgrades[i]['mod']] and true or false
--                     local itemLabel = tempUpgrades[i]['label'] .. " (" .. (not upgIndex and (calcModPrice(tempUpgrades[i]['items']['price'][2]) or 0) .. "$" or "0$") .. ")"
--                     RageUI.Checkbox(itemLabel, nil, upgIndex, {}, {
--                         onActive = function()
--                             ToggleVehicleMod(vehPedIsIn, tempUpgrades[i]['modType'], upgradeIndex[i][tempUpgrades[i]['mod']])
--                         end,
--                         onChecked = function()
--                             upgradeIndex[i][tempUpgrades[i]['mod']] = true

--                             lib.setVehicleProperties(vehPedIsIn, lib.getVehicleProperties(vehPedIsIn))

--                             ValidateCustomPrice(calcModPrice(tempUpgrades[i]['items']['price'][2]) or 0)
--                         end,
--                         onUnChecked = function()
--                             upgradeIndex[i][tempUpgrades[i]['mod']] = false

--                             lib.setVehicleProperties(vehPedIsIn, lib.getVehicleProperties(vehPedIsIn))

--                             RemoveCustomPrice(calcModPrice(tempUpgrades[i]['items']['price'][2]) or 0)
--                         end
--                 })
--                 menuItemCount = menuItemCount + 1
--                 elseif modCount > 0 then
--                     upgIndex = upgradeIndex[i][tempUpgrades[i]['mod']]
--                     local itemLabel = tempUpgrades[i]['label'] .. " (" .. (calcModPrice(tempUpgrades[i]['items']['price'][upgIndex]) .. "$" or "---") .. ")"

--                     RageUI.List(itemLabel, tempUpgrades[i]['items']['label'], upgIndex, nil, {}, true, {
--                         onListChange = function(Index)
--                             Indexobi = Index
--                             if upgradeIndex[i][tempUpgrades[i]['mod']] ~= Index and Index <= modCount + 1 then -- +1 para contar com o index da peça STOCK
--                                 upgradeIndex[i][tempUpgrades[i]['mod']] = Index
--                                 SetVehicleMod(vehPedIsIn, tempUpgrades[i]['modType'], Index - 2, false)
--                                 compareMods(tempUpgrades[i]['label'], tempUpgrades[i]['mod'], tempUpgrades[i]['modType'], itemIndex, calcModPrice(tempUpgrades[i]['items']['price'][Index]))
--                             end
--                         end,
--                         onSelected = function(Index)
--                             lib.setVehicleProperties(vehPedIsIn, lib.getVehicleProperties(vehPedIsIn))

--                             ValidateCustomPrice(calcModPrice(tempUpgrades[i]['items']['price'][upgIndex]) or 0)

--                             ESX.ShowNotification('Test')
--                         end
--                     })

--                     menuItemCount = menuItemCount + 1
--                 end
--             end
--         end)

--         if not RageUI.Visible(main) and not RageUI.Visible(performances) then
--             main = RMenu:DeleteType('main')
--             SetEntityRagdoll = false

--             if not validate then
--                 FreezeEntityPosition(vehicle, false)
--                 lib.setVehicleProperties(GetVehiclePedIsIn(PlayerPedId(), false), vehModsOld)
--             end

--             exports['obiUI']:hide()
--         end
--     end
-- end

-- CreateThread(function()
--     while not ESXLoaded do Wait(1) end

--     AddZones('bennys_custom', {
--         Position = vector3(-208.192, -1336.732, 31.30047),
--         Dist = 10,
--         Public = false,
--         Job = {['mecano'] = true},
--         Job2 = nil,
--         GradesJob = {},
--         InVehicleDisable = false,
--         Blip = {
--             Active = false,
--         },
--         marker = true,
--         ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
--         Action = function()
--             Bennys.openCustomMMenu()
--         end
--     })
-- end)


Citizen.CreateThread(function()
    while GetResourceState("ox_target") ~= "started" do Citizen.Wait(500) end
    
        exports.ox_target:addGlobalVehicle({
            label = "Remorquer le véhicule",
            icon = "fa-solid fa-car-side",
            name = "mechanic_towtruck_on",
            distance = 3.0,
            canInteract = function(entity)
              
    
                if lib.table.contains(towVehicles, GetEntityModel(entity)) then
                    return false
                end
    
                local vehiclesInArea = ESX.Game.GetVehiclesInArea(GetEntityCoords(PlayerPedId()), 20.0)
                local towtruck = nil
    
                for _, v in pairs(vehiclesInArea) do
                    if v == entity then goto continue end
    
                    local model = GetEntityModel(v)
    
                    if
                        model ~= GetHashKey("towtruck") and
                        model ~= GetHashKey("towtruck2")
                    then
                        goto continue
                    end
    
                    towtruck = v
    
                    ::continue::
                end
    
                if not towtruck then
                    return false
                end
    
                if IsVehicleAttachedToTowTruck(towtruck, entity) then
                    return false
                end
    
              --  if lib.table.contains(vehicleClassUnauthorized, GetVehicleClass(entity)) then
               --     return false
              --  end
    
                if GetEntitySpeed(entity) * 3.6 > 5.0 then
                    return false
                end
    
                if not isVehicleEmpty(entity) then
                    return false
                end
    
                if GetVehiclePedIsIn(PlayerPedId(), false) ~= 0 then
                    return false
                end
    
           --     if isVehicleDestroyed(entity) then
            --        return false
           --     end
    
                if isRagdoll() then
                    return false
                end
    
                            if ESX.PlayerData.job.name == 'mecano' or ESX.PlayerData.job.name == 'lscustom' then
                    return true
                end
            end,
            onSelect = function(data)
                local model = GetEntityModel(data.entity)
                if model == GetHashKey("towtruck") or model == GetHashKey("towtruck2") then
                    return ESX.ShowNotification("🔧 ~r~Vous ne pouvez pas faire ça")
                end
    
                local getClosestVehicle = ESX.Game.GetVehiclesInArea(GetEntityCoords(PlayerPedId()), 10.0)
                local towtruck = nil
    
                for _, v in pairs(getClosestVehicle) do
                    if v == data.entity then goto continue end
    
                    local model2 = GetEntityModel(v)
    
                    if model2 ~= GetHashKey("towtruck") and model2 ~= GetHashKey("towtruck2") then goto continue end
    
                    towtruck = v
    
                    ::continue::
                end
    
                if towtruck == nil then
                    return ESX.ShowNotification("🔧 ~r~Votre véhicule de dépannage est trop loin")
                end
    
                if GetEntityAttachedToTowTruck(towtruck) ~= 0 then
                    return ESX.ShowNotification("🔧 ~r~Il y a déjà un véhicule remorqué")
                end
    
                if mecanoCallGps ~= nil and DoesBlipExist(mecanoCallGps) then
                    RemoveBlip(mecanoCallGps)
                    mecanoCallGps = nil
                end
    
                local boneFrontId = GetEntityBoneIndexByName(data.entity, "neon_f")
                local boneRearId = GetEntityBoneIndexByName(data.entity, "neon_b")
                local boneFront = GetEntityBonePosition_2(data.entity, boneFrontId)
                local boneRear = GetEntityBonePosition_2(data.entity, boneRearId)
                local towtruckCoords = GetEntityCoords(towtruck)
                local distFront = #(towtruckCoords - boneFront)
                local distRear = #(towtruckCoords - boneRear)
    
                local isRear = true
                if distFront < distRear then
                    isRear = false
                end
    
            actionOnVehicle("Remorquage...")
    
            -- Vous pouvez ajouter votre logique de remorquage ici
            -- sans le TriggerServerCallback
            NetworkRequestControlOfEntity(towtruck)
            NetworkRequestControlOfEntity(data.entity)
    
            while not NetworkHasControlOfEntity(towtruck) do Citizen.Wait(200) end
            while not NetworkHasControlOfEntity(data.entity) do Citizen.Wait(200) end
    
            AttachVehicleToTowTruck(towtruck, data.entity, isRear, 0.0, 0.0, 0.0)
        end
    })
    
        exports.ox_target:addGlobalVehicle({
            label = "Détacher le véhicule",
            icon = "fa-solid fa-car-side",
            name = "mechanic_towtruck_off",
            distance = 3.0,
            canInteract = function(entity)
    
    
                if lib.table.contains(towVehicles, GetEntityModel(entity)) then
                    return false
                end
    
                local vehiclesInArea = ESX.Game.GetVehiclesInArea(GetEntityCoords(PlayerPedId()), 20.0)
                local towtruck = nil
    
                for _, v in pairs(vehiclesInArea) do
                    if v == entity then goto continue end
    
                    local model = GetEntityModel(v)
    
                    if model ~= GetHashKey("towtruck") and model ~= GetHashKey("towtruck2") then goto continue end
    
                    towtruck = v
    
                    ::continue::
                end
    
                if not towtruck then
                    return false
                end
    
                if not IsVehicleAttachedToTowTruck(towtruck, entity) then
                    return false
                end
    
            --    if lib.table.contains(vehicleClassUnauthorized, GetVehicleClass(entity)) then
             --       return false
             --   end
    
                if GetEntitySpeed(entity) * 3.6 > 5.0 then
                    return false
                end
    
                if not isVehicleEmpty(entity) then
                    return false
                end
    
                if GetVehiclePedIsIn(PlayerPedId(), false) ~= 0 then
                    return false
                end
    
                if isRagdoll() then
                    return false
                end
    
                          if ESX.PlayerData.job.name == 'mecano' or ESX.PlayerData.job.name == 'lscustom' then
                    return true
                end
            end,
            onSelect = function(data)
                if lib.table.contains(towVehicles, GetEntityModel(data.entity)) then
                    return ESX.ShowNotification("🔧 ~r~Vous ne pouvez pas faire ça")
                end
    
                local getClosestVehicle = ESX.Game.GetVehiclesInArea(GetEntityCoords(PlayerPedId()), 10.0)
                local towtruck = nil
    
                for _, v in pairs(getClosestVehicle) do
                    if v == data.entity then goto continue end
    
                    local model = GetEntityModel(v)
    
                    if model ~= GetHashKey("towtruck") and model ~= GetHashKey("towtruck2") then goto continue end
    
                    towtruck = v
    
                    ::continue::
                end
    
                if towtruck == nil then
                    return ESX.ShowNotification("🔧 ~r~Votre véhicule de dépannage est trop loin")
                end
    
                if GetEntityAttachedToTowTruck(towtruck) == 0 then
                    return ESX.ShowNotification("🔧 ~r~Aucun véhicule n'est remorqué")
                end
    
                actionOnVehicle("Détachement...")
    
                NetworkRequestControlOfEntity(towtruck)
                NetworkRequestControlOfEntity(data.entity)
    
                while not NetworkHasControlOfEntity(towtruck) do Citizen.Wait(200) end
                while not NetworkHasControlOfEntity(data.entity) do Citizen.Wait(200) end
    
    
    
                    DetachVehicleFromTowTruck(towtruck, data.entity)
                    DetachEntity(data.entity, true, true)
    
                    while not SetVehicleOnGroundProperly(data.entity) do
                        SetVehicleOnGroundProperly(data.entity)
                        Citizen.Wait(0)
                    end
    
            end
        })
    
        exports.ox_target:addGlobalVehicle({
            label = "Remorquer le véhicule",
            icon = "fa-solid fa-car-side",
            name = "mechanic_flatbed_on",
            distance = 3.0,
            canInteract = function(entity)
    
    
                if GetEntityModel(entity) == GetHashKey("flatbed") then
                    return false
                end
    
                if GetEntityAttachedTo(entity) ~= 0 then
                    return false
                end
    
              --  if lib.table.contains(vehicleClassUnauthorized, GetVehicleClass(entity)) then
               --     return false
              --  end
    
                local vehiclesInArea = ESX.Game.GetVehiclesInArea(GetEntityCoords(PlayerPedId()), 20.0)
                local flatbed = nil
    
                for _, v in pairs(vehiclesInArea) do
                    if v == entity then goto continue end
                    if GetEntityModel(v) ~= GetHashKey("flatbed") then goto continue end
    
                    flatbed = v
    
                    ::continue::
                end
    
                if not flatbed then
                    return false
                end
    
                local isAnyVehicleOnFlatbed = false
    
                for _, v in pairs(vehiclesInArea) do
                    if v == entity then goto continue end
                    if GetEntityAttachedTo(v) == 0 then goto continue end
                    if GetEntityAttachedTo(v) ~= flatbed then goto continue end
    
                    isAnyVehicleOnFlatbed = true
    
                    ::continue::
                end
    
                if isAnyVehicleOnFlatbed then
                    return false
                end
    
                if GetEntitySpeed(entity) * 3.6 > 5.0 then
                    return false
                end
    
                if not isVehicleEmpty(entity) then
                    return false
                end
    
                if GetVehiclePedIsIn(PlayerPedId(), false) ~= 0 then
                    return false
                end
    
             --   if isVehicleDestroyed(entity) then
            --        return false
            --    end
    
                if isRagdoll() then
                    return false
                end
    
                      if ESX.PlayerData.job.name == 'mecano' or ESX.PlayerData.job.name == 'lscustom' then
                    return true
                end
            end,
            onSelect = function(data)
                local model = GetEntityModel(data.entity)
                if model == GetHashKey("flatbed") then
                    return ESX.ShowNotification("🔧 ~r~Vous ne pouvez pas faire ça")
                end
    
                local getClosestVehicle = ESX.Game.GetVehiclesInArea(GetEntityCoords(PlayerPedId()), 10.0)
                local flatbed = nil
    
                for _, v in pairs(getClosestVehicle) do
                    if v == data.entity then goto continue end
                    if GetEntityModel(v) ~= GetHashKey("flatbed") then goto continue end
    
                    flatbed = v
    
                    ::continue::
                end
    
                if flatbed == nil then
                    return ESX.ShowNotification("🔧 ~r~Votre véhicule de dépannage est trop loin")
                end
    
                if IsEntityAttachedToAnyVehicle(flatbed) then
                    return ESX.ShowNotification("🔧 ~r~Il y a déjà un véhicule remorqué")
                end
    
                if mecanoCallGps ~= nil and DoesBlipExist(mecanoCallGps) then
                    RemoveBlip(mecanoCallGps)
                    mecanoCallGps = nil
                end
    
                actionOnVehicle("Remorquage...")
    
    
    
                    NetworkRequestControlOfEntity(flatbed)
                    NetworkRequestControlOfEntity(data.entity)
    
                    while not NetworkHasControlOfEntity(flatbed) do Citizen.Wait(200) end
                    while not NetworkHasControlOfEntity(data.entity) do Citizen.Wait(200) end
    
                    local boneIndex = GetEntityBoneIndexByName(flatbed, "bodyshell")
                    AttachEntityToEntity(data.entity, flatbed, boneIndex, 0.0, -2.0, 1.0, 0.0, 0.0, 0.0, false, false, true,
                        false, 0, true)
             
            end
        })
    
        exports.ox_target:addGlobalVehicle({
            label = "Détacher le véhicule",
            icon = "fa-solid fa-car-side",
            name = "mechanic_flatbed_off",
            distance = 3.0,
            canInteract = function(entity)
    
    
                if GetEntityModel(entity) == GetHashKey("flatbed") then
                    return false
                end
    
                local attachedTo = GetEntityAttachedTo(entity)
    
                if attachedTo == 0 then
                    return false
                end
    
                if GetEntityModel(attachedTo) ~= GetHashKey("flatbed") then
                    return false
                end
    
                if GetEntitySpeed(GetEntityAttachedTo(entity)) * 3.6 > 5.0 then
                    return false
                end
    
                if GetVehiclePedIsIn(PlayerPedId(), false) ~= 0 then
                    return false
                end
    
                     if ESX.PlayerData.job.name == 'mecano' or ESX.PlayerData.job.name == 'lscustom' then
                    return true
                end
            end,
            onSelect = function(data)
                local flatbed = GetEntityAttachedTo(data.entity)
                if not DoesEntityExist(flatbed) then return end
                if GetEntityModel(flatbed) ~= GetHashKey("flatbed") then return end
    
                actionOnVehicle("Détachement...")
    
                NetworkRequestControlOfEntity(flatbed)
                NetworkRequestControlOfEntity(data.entity)
    
                while not NetworkHasControlOfEntity(flatbed) do Citizen.Wait(200) end
                while not NetworkHasControlOfEntity(data.entity) do Citizen.Wait(200) end
    
    
                    DetachEntity(data.entity, true, true)
                    local boneIndex = GetEntityBoneIndexByName(flatbed, "bodyshell")
                    AttachEntityToEntity(data.entity, flatbed, boneIndex, -0.5, -10.0, 1.0, 0.0, 0.0, 0.0, true, false, true,
                        false, 0, true)
                    DetachEntity(data.entity, true, true)
    
                    while not SetVehicleOnGroundProperly(data.entity) do
                        SetVehicleOnGroundProperly(data.entity)
                        Citizen.Wait(0)
                    end
            end
        })
    
        exports.ox_target:addGlobalVehicle({
            label = "Envoyer à la fourrière",
            icon = "fa-solid fa-car-side",
            name = "mechanic_pound",
            distance = 3.0,
            canInteract = function(entity)
    
    
             --   if not isVehicleDestroyed(entity) then
             --       return false
             --   end
                if ESX.PlayerData.job.name == 'mecano' or ESX.PlayerData.job.name == 'lscustom' then
                    return true
                end
            end,
            onSelect = function(data)
                actionOnVehicle("Mise en fourrière...")
    
                TriggerServerEvent("kayscore:Service:delVeh", NetworkGetNetworkIdFromEntity(data.entity))
            end
        })
    
        exports.ox_target:addGlobalVehicle({
            label = "Mettre en fourrière",
            icon = "fa-solid fa-car-side",
            name = "mechanic_pound_2",
            distance = 3.0,
            canInteract = function()
    
    
                if not isMechanic then
                    return false
                end
    
                if not isInPoundZone then
                    return false
                end
                if ESX.PlayerData.job.name == 'mecano' or ESX.PlayerData.job.name == 'lscustom' then
                    return true
                end
            end,
            onSelect = function(data)
                actionOnVehicle("Mise en fourrière...")
    
                TriggerServerEvent("kayscore:Service:delVeh", NetworkGetNetworkIdFromEntity(data.entity))
            end
        })
    end)