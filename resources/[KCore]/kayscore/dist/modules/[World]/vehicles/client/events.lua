RegisterNetEvent('kayscore:garage:spawnVehiclePound', function(vehicle, spawnPoint)
    ESX.Game.SpawnVehicle(vehicle.model, vector3(spawnPoint.x, spawnPoint.y, spawnPoint.z), 90.0, function(vehicleSpawn)
        lib.setVehicleProperties(vehicleSpawn, vehicle)
        SetVehRadioStation(vehicleSpawn, 'OFF')
        TaskWarpPedIntoVehicle(PlayerPedId(), vehicleSpawn, -1)
    end)
end)
local buttonSeat = { [157] = -1, [158] = 0, [160] = 1, [164] = 2, [165] = 3, [159] = 4, [161] = 5, [162] = 6, [163] = 7 }
local blockShuffle = true

Citizen.CreateThread(function()

    while true do
        local attente = 1500

        local veh = GetVehiclePedIsIn(Player.playerPed, false)
        local speed = GetEntitySpeed(veh)*3.6
    
        if IsPedInAnyVehicle(Player.playerPed, false) then
            attente = 1
            for key, seat in pairs(buttonSeat) do
                if IsDisabledControlJustPressed(1, key) and IsVehicleSeatFree(veh, seat) then
                    if speed > 15 then 
                        ESX.ShowNotification("Vous ne pouvez pas changer de place, ralentissez !")
                    else
                        SetPedIntoVehicle(Player.playerPed, veh, seat)
                        blockShuffle = seat == 0
                        Citizen.Wait(2000)
                    end
                end
            end
        end
        Wait(attente)
    end
end)
RegisterNetEvent('kayscore:garages:edit:blips', function(value, id)
    if value == 'add' then
        local GarageBlip = AddBlipForCoord(Garages.garage_data.garages[id].defaultpos.x, Garages.garage_data.garages[id].defaultpos.y, Garages.garage_data.garages[id].defaultpos.z)
        SetBlipSprite(GarageBlip, Garages.garage_data.garages[id].type == 'car' and 357 or Garages.garage_data.garages[id].type == 'boat' and 427 or Garages.garage_data.garages[id].type == 'aircraft' and 557)
        SetBlipDisplay(GarageBlip, 4)
        SetBlipScale(GarageBlip, Garages.garage_data.garages[id].type == 'boat' and 0.5 or 0.5)
        SetBlipColour(GarageBlip, 42)
        SetBlipAsShortRange(GarageBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Garages.garage_data.garages[id].type == 'car' and '[TERRESTRE] Parking Public' or Garages.garage_data.garages[id].type == 'boat' and '[NAUTIQUE] Parking Public' or Garages.garage_data.garages[id].type == 'aircraft' and '[AÉRIEN] Parking Public')
        EndTextCommandSetBlipName(GarageBlip)

        Garages.garage_data.blips[id] = {
            id = GarageBlip
        }
    elseif value == 'remove' then
        RemoveBlip(Garages.garage_data.blips[id].id)
        Garages.garage_data.blips[id] = nil
    end
end)

RegisterNetEvent('kayscore:garages:setvehicleProperties', function(vehicleNetworkID, tuning, entityId, plate)
    while not NetworkDoesEntityExistWithNetworkId(vehicleNetworkID) do Citizen.Wait(200) end

    local vehicle = NetworkGetEntityFromNetworkId(vehicleNetworkID)
    while vehicle == 0 or not DoesEntityExist(vehicle) do Citizen.Wait(200) end

    CreateThread(function()
        -- if tuning.neonColor[1] == 255 and tuning.neonColor[3] == 255 and tuning.neonColor[2] == 0 then
        --     tuning.neonColor[1] = 0 
        --     tuning.neonColor[2] = 0
        --     tuning.neonColor[3] = 0
        
        --     SetVehicleNeonLightEnabled(vehicle, 0, false)
        --     SetVehicleNeonLightEnabled(vehicle, 1, false)
        --     SetVehicleNeonLightEnabled(vehicle, 2, false)
        --     SetVehicleNeonLightEnabled(vehicle, 3, false)
        -- end
        
        Wait(200)
        lib.setVehicleProperties(vehicle, tuning)
                
       
        Wait(500)

        SetVehicleNumberPlateText(vehicle, plate)
        SetVehicleDoorsLocked(vehicle, 2)

        ESX.ShowNotification('Les customisations de votre véhicule ont été appliqué avec succès')
    end)

    TriggerServerEvent('kayscore:garages:syncEntityId', GetVehicleNumberPlateText(vehicle), entityId)
end)


RegisterNetEvent("kayscore:vehicle:setFuel", function (vehicleNetworkID, fuel)
    while not NetworkDoesEntityExistWithNetworkId(vehicleNetworkID) do Citizen.Wait(200) end

    local vehicle = NetworkGetEntityFromNetworkId(vehicleNetworkID)
    while vehicle == 0 or not DoesEntityExist(vehicle) do Citizen.Wait(200) end

    SetFuel(vehicle, fuel)
end)


Config.WhitelistJobMeleeBike = {
    ['police'] = true,
    ['bcso'] = true,
}

Config.WeaponVehicleWL = {
    [`firetruk`] = true,
    [`riot2`] = true,
}

local fuelPomps = {
	[-2007231801] = true,
	[1339433404] = true,
	[1694452750] = true,
	[1933174915] = true,
	[-462817101] = true,
	[-469694731] = true,
	[-164877493] = true
}

AddEventHandler("player:enteredVehicle", function (vehicle, seat)
    Citizen.CreateThread(function ()
        while DoesEntityExist(vehicle) and Player.isInVehicle do
            local objects = GetGamePool("CObject")

            for _, v in pairs(objects) do
                local model = GetEntityModel(v)

                if fuelPomps[model] == nil then goto continue end

                SetEntityCollision(v, false, false)

                ::continue::
            end

            Citizen.Wait(2500)
        end
    end)
end)

AddEventHandler("player:enteredVehicle", function (vehicle)
    local targetPed = GetPedInVehicleSeat(vehicle, -1)

    if targetPed == 0 then return end
    SetPedCanBeDraggedOut(targetPed, false)
end)

AddEventHandler("player:enteredVehicle", function (vehicle)
    if not ESX.isHandsUp(Player.playerPed) then return end
    ClearPedSecondaryTask(Player.playerPed)
end)

AddEventHandler("player:enteredVehicle", function (vehicle)
    SetPedConfigFlag(Player.playerPed, 184, true)
    SetVehicleMod(vehicle, 11, GetVehicleMod(vehicle, 11), false)
end)

AddEventHandler("player:enteredVehicle", function (vehicle)
    Citizen.CreateThread(function ()
        while DoesEntityExist(vehicle) and Player.vehicle == vehicle do
            local entitySpeed = GetEntitySpeed(vehicle)
            local entityModel = GetEntityModel(vehicle)
            local entityRoll = GetEntityRoll(vehicle)

            -- DESACTIVATION RETOURNER VEHICULE QUAND T RETOURNER
            if (entityRoll > 75.0 or entityRoll < -75.0) and entitySpeed < 2.0 then
                DisableControlAction(2,59,true)
                DisableControlAction(2,60,true)

            end

            -- Désactivation du controle de véhicule en l'air
            if IsEntityInAir(vehicle) and not IsThisModelABoat(entityModel) and not IsThisModelAHeli(entityModel) and not IsThisModelAPlane(entityModel) and not IsThisModelABike(entityModel) and not IsThisModelABicycle(entityModel) then
                DisableControlAction(2,59,true) -- left/right
                DisableControlAction(2,60,true) -- up/down

            end

            -- Désactivation des actions combat en moto
            if (ESX.PlayerData) then
                if Player.weapon ~= `WEAPON_UNARMED` or not Config.WhitelistJobMeleeBike[ESX.PlayerData.job2.name] then
                    DisableControlAction(0, 346, true)  -- INPUT_VEH_MELEE_LEFT
                    DisableControlAction(0, 347, true)  -- INPUT_VEH_MELEE_RIGHT

                end
            end

            -- Désactivation du shoot sur les véhicules
            if not Config.WeaponVehicleWL[model] and (IsThisModelAHeli(entityModel) or IsThisModelAPlane(entityModel) or (Player.isDriver and not ((IsThisModelABike(entityModel) or IsThisModelABicycle(entityModel)) and entitySpeed < 10.0))) then -- 10 * 3.6 ~= 36 km/h
                DisableControlAction(0, 100,  true) -- INPUT_VEH_SELECT_PREV_WEAPON
                DisableControlAction(0, 106, true)  -- Disable in-game mouse controls
                DisableControlAction(0, 92,  true)  -- Passenger Attack
                DisableControlAction(0, 257, true)  -- INPUT_ATTACK2
                DisableControlAction(0, 331, true)  -- INPUT_VEH_FLY_ATTACK2
                DisableControlAction(0, 70,  true)  -- INPUT_VEH_ATTACK2
                DisableControlAction(0, 114, true)  -- INPUT_VEH_FLY_ATTACK
                DisableControlAction(0, 99,  true)  -- INPUT_VEH_SELECT_NEXT_WEAPON
                DisableControlAction(0, 37,  true)  -- disable weapon wheel (Tab)
                DisableControlAction(0, 24,  true)  -- INPUT_ATTACK
                DisableControlAction(0, 69,  true)  -- INPUT_VEH_ATTACK
                DisablePlayerFiring(Player.playerPed, true) -- Disables firing all together if they somehow bypass inzone Mouse Disable
                if (Player.weapon ~= `WEAPON_UNARMED` or IsDisabledControlJustPressed(0, 37) or IsDisabledControlJustPressed(0, 92) or IsDisabledControlJustPressed(0, 106) or IsDisabledControlJustPressed(0, 24) or IsDisabledControlJustPressed(0, 69) or IsDisabledControlJustPressed(0, 70) or IsDisabledControlJustPressed(0, 114) or IsDisabledControlJustPressed(0, 257) or IsDisabledControlJustPressed(0, 331)) then
                    SetCurrentPedWeapon(Player.playerPed, `WEAPON_UNARMED`, true)
                end
            end
            if (GetPedInVehicleSeat(vehicle, 0) == Player.playerPed or GetPedInVehicleSeat(vehicle, 1) == Player.playerPed or  GetPedInVehicleSeat(vehicle, 2) == Player.playerPed) and GetPedInVehicleSeat(vehicle, -1) == 0 then
                DisableControlAction(0, 106, true)  -- Disable in-game mouse controls
                DisableControlAction(0, 92,  true)  -- Passenger Attack
                DisableControlAction(0, 257, true)  -- INPUT_ATTACK2
                DisableControlAction(0, 331, true)  -- INPUT_VEH_FLY_ATTACK2
                DisableControlAction(0, 70,  true)  -- INPUT_VEH_ATTACK2
                DisableControlAction(0, 114, true)  -- INPUT_VEH_FLY_ATTACK
                DisableControlAction(0, 99,  true)  -- INPUT_VEH_SELECT_NEXT_WEAPON
                DisableControlAction(0, 24,  true)  -- INPUT_ATTACK
                DisableControlAction(0, 69,  true)  -- INPUT_VEH_ATTACK
            end

            Citizen.Wait(0)
        end
    end)
end)

AddEventHandler("player:enteredDriverVehicle", function (vehicle)
    if Config.WeaponVehicleWL[GetEntityModel(vehicle)] then return end

    Citizen.CreateThread(function ()
        while DoesEntityExist(vehicle) and Player.isDriver do
            if DoesVehicleHaveWeapons(vehicle) then
                local weaponExist, hash = GetCurrentPedVehicleWeapon(Player.playerPed)
                if weaponExist then
                    DisableVehicleWeapon(true, hash, vehicle, Player.playerPed)
                end
            end

            Citizen.Wait(0)
        end
    end)
end)

AddEventHandler("player:enteredDriverVehicle", function (vehicle)
    local vehlb = GetVehiclePedIsIn(PlayerPedId(), false)
    local vehicleClass = GetVehicleClass(vehlb)
    local playerData = ESX.GetPlayerData()
    if playerData.job.name == "police" or playerData.job.name == "ambulance" or playerData.job.name == "bcso" or playerData.job.name == "gouvernement" then return end
    if vehicleClass == 18 then

    while GetVehiclePedIsIn(PlayerPedId(), false) == vehicle and GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() and vehicleClass == 18 do
        Wait(0)
        DrawMissionText("Vous ne pouvez pas conduire un véhicule de fonction.", 1)
        SetVehicleUndriveable(vehicle, true)
        end
    end
end)

AddEventHandler("player:changedVehicleSeat", function(entity, newSeat, oldSeat)
    if newSeat ~= -1 then return end
    local vehlb = GetVehiclePedIsIn(PlayerPedId(), false)
    local vehicleClass = GetVehicleClass(vehlb)
    local playerData = ESX.GetPlayerData()
    if playerData.job.name == "police" or playerData.job.name == "ambulance" or playerData.job.name == "bcso" or playerData.job.name == "gouvernement" then return end
    if vehicleClass == 18 then

    while GetVehiclePedIsIn(PlayerPedId(), false) == vehicle and GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() and vehicleClass == 18 do
        Wait(0)
        DrawMissionText("Vous ne pouvez pas conduire un véhicule de fonction.", 1)
        SetVehicleUndriveable(vehicle, true)
        end
    end
end)

local function getPlayerSeat (entity)
    local nbrPlaces = GetVehicleNumberOfPassengers(entity)
    local seat = -1

    for i = 0, nbrPlaces do
        if GetPedInVehicleSeat(entity, i) ~= Player.playerPed then goto continue end

        seat = i

        ::continue::
    end

    return seat
end

AddEventHandler("gameEventTriggered", function (event, args)
    if event ~= "CEventNetworkPlayerEnteredVehicle" then return end

    local entity = args[2]
    if not DoesEntityExist(entity) then return end

    local seat = getPlayerSeat(entity)
    local player = GetPedInVehicleSeat(entity, seat)
    if player ~= PlayerPedId() then return end

    Player.vehicle = entity
    Player.isInVehicle = true
    Player.isDriver = seat == -1 and true or false
    Player.seat = seat
    
    TriggerEvent("player:enteredVehicle", entity, seat)

    if Player.isDriver then
        TriggerEvent("player:enteredDriverVehicle", entity, seat)
    end

    Citizen.CreateThread(function ()
        while IsPedInAnyVehicle(PlayerPedId(), false) and GetVehiclePedIsIn(PlayerPedId(), false) == entity do
            if GetPedInVehicleSeat(entity, seat) ~= PlayerPedId() then
                local oldSeat = seat
                local newSeat = getPlayerSeat(entity)
                seat = newSeat

                if oldSeat == -1 and newSeat ~= -1 then
                    Player.isDriver = false
                end

                TriggerEvent("player:changedVehicleSeat", entity, newSeat, oldSeat)
            end

            Citizen.Wait(50)
        end

        TriggerEvent("player:leftVehicle", entity)

        Player.isInVehicle = false
        Player.vehicle = 0
        Player.isDriver = false
    end)
end)

exports('getPlayerVehicle', function()
    return Player.vehicle
end)

Citizen.CreateThread(function()
    while not ESX do 
        Wait(10)
        
    end
    while not ESX.PlayerData do 
        Wait(10)
    
    end
    for k,v in pairs(extrasCFG) do
        if type(v) == 'table' then
            for k2,v2 in pairs(v) do
                AddZones(("extras_menu-%s-%s"):format(k, k2), {
                    Position = v2,
                    Dist = 10,
                    Public = false,
                    Job = {
                    ['taxi'] = true,
                    ['police'] = true,
                    ['bcso'] = true,
                    ['ambulance'] = true,
                    ['gouvernement'] = true
                    },
                    Job2 = nil,
                    GradesJobRequire = false,
                    GradesJob = {},
                    InVehicleDisable = false,
                    Blip = {
                        Active = false,
                    },
                    ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
                    Action = function()
                        if GetVehiclePedIsIn(PlayerPedId(), false) == 0 then
                            return ESX.ShowNotification("~r~Vous ne pouvez pas ouvrir le menu d'extra en étant à pied")
                        end

                        openExtrasMenu()
                    end
                })

                ESX.addJobBlip({
                    name = ('extras_menu-%s-%s'):format(k, k2),
                    label = ('Menu Extra %s'):format(k),
                    jobName = k,
                    category = nil,
                    position = v2,
                    sprite = 544,
                    display = 5,
                    scale = 0.5,
                    color = 0,
                })
            end
        else
            AddZones("extras_menu-"..k, {
                Position = v,
                Dist = 10,
                Public = false,
                Job = {
                ['taxi'] = true,
                ['police'] = true,
                ['bcso'] = true,
                ['ambulance'] = true,
                ['gouvernement'] = true
                },
                Job2 = nil,
                GradesJobRequire = false,
                GradesJob = {},
                InVehicleDisable = false,
                Blip = {
                    Active = false,
                },
                ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
                Action = function()
                    openExtrasMenu()
                end
            })
            ESX.addJobBlip({
                name = ('extras_menu%s'):format(k),
                label = ('Menu Extra %s'):format(k),
                jobName = k,
                category = nil,
                position = v,
                sprite = 544,
                display = 4,
                scale = 0.5,
                color = 0,
            })
        end
    end
end)

function openExtrasMenu()
    if not extrasCFG[ESX.PlayerData.job.name] then
        return
    end

    local menu = RageUI.CreateMenu('', 'Menu extras')
    menu.extrasmenu = RageUI.CreateSubMenu(menu, '', 'Liste des extras')
    menu.liveriesmenu = RageUI.CreateSubMenu(menu, '', 'Liste des liveries')

    menu.coords = Player.coords
    menu.indexList = 1
    menu.vehicle = GetVehiclePedIsIn(Player.playerPed, false)

    RageUI.Visible(menu, not RageUI.Visible(menu))

    while menu do
        Citizen.Wait(0)

        RageUI.IsVisible(menu, function()
            RageUI.Button('Extras', false, {}, true, {

            }, menu.extrasmenu)

            RageUI.Button('Liveries', false, {}, true, {

            }, menu.liveriesmenu)
        end)

        RageUI.IsVisible(menu.extrasmenu, function()
            menu.vehicle = GetVehiclePedIsUsing(Player.playerPed, false)

            if menu ~= nil then
                if menu.vehicle then
                    if GetVehicleEngineHealth(menu.vehicle) >= 700.0 then
                        for id = 0, 20 do
                            if DoesExtraExist(menu.vehicle, id) then
                                RageUI.Checkbox(("Extra N°%s"):format(id), nil, IsVehicleExtraTurnedOn(menu.vehicle, id), {}, {
                                    onChecked = function ()
                                        SetVehicleExtra(menu.vehicle, id, 0)
                                    end,
                                    onUnChecked = function ()
                                        SetVehicleExtra(menu.vehicle, id, 1)
                                    end
                                })
                            end
                        end
                    else
                        RageUI.Separator('Votre véhicule est endommagé.')
                    end
                end
            end
        end)

        RageUI.IsVisible(menu.liveriesmenu, function()
            menu.vehicle = GetVehiclePedIsUsing(Player.playerPed, false)

            if #(menu.coords - Player.coords) > 5 then
                RageUI.Visible(menu, false)
            end

            if menu.vehicle then
                if GetVehicleEngineHealth(menu.vehicle) >= 1000.0 then
                    if GetVehicleLiveryCount(menu.vehicle) == -1 then 
                        RageUI.Separator('Aucune liveries pour ce véhicule.')
                    else
                        for i = 0, GetVehicleLiveryCount(menu.vehicle) do
                            RageUI.Checkbox(("Liverie N°%s"):format(i), nil, GetVehicleLivery(menu.vehicle) == i, {}, {
                                onChecked = function()
                                    SetVehicleLivery(menu.vehicle, i, 0)
                                end,
                            })
                        end
                    end
                else
                    RageUI.Separator('Votre véhicule est endommagé.')
                end
            end
        end)

        if not RageUI.Visible(menu) and not RageUI.Visible(menu.liveriesmenu) and not RageUI.Visible(menu.extrasmenu) or #(menu.coords - Player.coords) > 5 then
            menu = RMenu:DeleteType('menu', true)
        end
    end
end