local cache = {}

function SaveCache(key, data, lifespan)
    cache[key] = {
        data = data,
        maxAge = GetGameTimer() + (lifespan or 3000),
    }
end

function WipeCache(key)
    cache[key] = nil
end

function UseCache(key, cb, lifespan)
    if (not cache[key] or cache[key] == nil) or cache[key]['maxAge'] < GetGameTimer() then
        local data = {cb()}
        SaveCache(key, data, lifespan)
        
        return table.unpack(data)
    end
    
    return table.unpack(cache[key]['data'])
end

function ShowTooltip(message)
    SetTextComponentFormat("STRING")
    AddTextComponentString(message)
    EndTextCommandDisplayHelp(0, 0, 0, 2000)
end

function Draw3DText(coords, textInput)
    SetTextScale(0.25, 0.25)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextDropshadow(1, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentSubstringKeyboardDisplay(textInput)
    SetDrawOrigin(coords, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end


if OfRoadCFG.debug then
    local surfaceDebug = false

    RegisterCommand('surfaceDebug', function(s, args)
        if args[1] and (args[1] == 'off' or args[1] == 'false') then
            surfaceDebug = false
        else
            surfaceDebug = true
        end
    end)

    local wheelBones = {
        'hub_lf',
        'hub_rf',
        'hub_rr',
        'hub_lr',
    }

    Citizen.CreateThread(function()
        while true do
            local sleep = 3000
            local playerPed = PlayerPedId()

            if surfaceDebug and IsPedInAnyVehicle(playerPed, false) and GetPedInVehicleSeat(GetPlayerVeh(), -1) == playerPed  then
                sleep = 0

                local veh = GetPlayerVeh()
                local vehCoords = GetEntityCoords(veh)
    
                local nearestRoad = GetNearestRoadDistance()
                Draw3DText(vehCoords + vector3(0.0, 0.0, -0.3), '~w~Closest road: ' .. nearestRoad)
                
                
                local zoneHash = GetNameOfZone(vehCoords)
                local zoneData = GetZoneData(zoneHash)
                if zoneData then
                    Draw3DText(vehCoords, '~y~Zone: ' .. zoneHash .. ' ~w~(' .. zoneData.name .. ' | dpth: x' .. zoneData.depthMultiplier .. ' | trcn: x' .. zoneData.tractionMultiplier .. ')')
                else
                    Draw3DText(vehCoords, '~y~Zone: ' .. zoneHash)
                end

                Draw3DText(vehCoords + vector3(0.0, 0.0, -0.4), kayscoreConfigServ.GTACOLOR..'Traction: ' .. (CURRENT_TRACTION or 100))

                local isBlacklistedArea, blacklistArea = IsInBlacklistedArea(veh)
                if isBlacklistedArea then
                    DrawSphere(blacklistArea.coords, blacklistArea.radius, 200, 0, 0, 0.5)
                    Draw3DText(vehCoords - vector3(0.0, 0.0, -0.4), '~r~In blacklisted area')
                end

                for index = 0, GetVehicleNumberOfWheels(veh) -1 do
                    local surfaceId = GetVehicleWheelSurfaceMaterial(veh, index)

                    if index + 1 <= #wheelBones then
                        local boneIndex = GetEntityBoneIndexByName(veh, wheelBones[index + 1])
                        local coords = GetWorldPositionOfEntityBone(veh, boneIndex)

                        if OfRoadCFG.surfaces[surfaceId] then
                            local data = OfRoadCFG.surfaces[surfaceId]
                            Draw3DText(coords, '~g~[~w~' .. surfaceId .. '~g~]\n~w~' .. data.name .. '~g~\nTraction ' .. data.traction .. '\nDepth ' .. data.depth .. '\nSoftness ' .. data.softness)
                        else
                            Draw3DText(coords, '~r~' .. surfaceId)
                        end
                    end
                end
            end

            Citizen.Wait(sleep)
        end
    end)
end

function GetNearestRoadDistance()
    return UseCache('nearestRoad', function()
        local coords = GetEntityCoords(PlayerPedId())
        local ret, p5, p6 = GetClosestRoad(coords.x, coords.y, coords.z, 1.0, 0, 1)
        local dist1 = GetDistanceBetweenCoords(p5, coords, false)
        local dist2 = GetDistanceBetweenCoords(p6, coords, false)
    
        return math.min(dist1, dist2)
    end, 1000)
end

function HasOffroadTires(veh)
    return UseCache('hasOffroadTires_' .. veh, function()
        return GetVehicleWheelType(veh) == 4
    end, 5000)
end

function GetVehicleSuspenionHeight(veh)
    local min, max = GetVehicleSuspensionBounds(veh)
    return math.abs(min.z) + max.z
end

function GetMassUpgrade(veh)
    return UseCache('weightUpgrade' .. veh, function()
        local mass = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fMass')
        
        local upgrade = 0
        if mass > 1300 then
            upgrade = (1300 - mass) / 60
        else
            upgrade = (1300 - mass) / 10
        end

        if GetWheelCount(veh) == 2 then
            upgrade = upgrade * 0.15
        elseif GetWheelCount(veh) == 3 then
            upgrade = upgrade * 0.35
        end

            return upgrade
        end, 60000)
end

function IsMotorcycle(veh)
    return UseCache('isMotorbike_' .. veh, function()
        return GetVehicleClass(veh) == 8
    end, 60000)
end

function IsInBlacklistedArea(veh)
    return UseCache('isInBlacklistedArea_' .. veh, function()
        local coords = GetEntityCoords(veh)

        for k, area in pairs(OfRoadCFG.areaBlacklist) do
            local distance = GetDistanceBetweenCoords(coords, area.coords)
            if distance <= area.radius then
                return true, area
            end
        end

        return false
    end, 1000)
end

function GetVehicleModelUgrade(veh)
    return UseCache('vehicleModelUpgrade_' .. veh, function()
        for model, handling in pairs(OfRoadCFG.depthHandlingQuality.models) do
            if GetEntityModel(veh) == GetHashKey(model) then
                return handling
            end
        end
        
        local vehClass = GetVehicleClass(veh)
        if OfRoadCFG.depthHandlingQuality.classes[vehClass] then
            return OfRoadCFG.depthHandlingQuality.classes[vehClass]
        end
    
        return 0
    end, 60000)
end

function IsBlacklisted(veh)
    return UseCache('vehicleBlacklisted' .. veh, function()
        for _, model in pairs(OfRoadCFG.blacklist.models) do
            if GetEntityModel(veh) == GetHashKey(model) then
                return true
            end
        end
        
        local vehClass = GetVehicleClass(veh)
        if OfRoadCFG.blacklist.classes[vehClass] then
            return true
        end
    
        return false
    end, 60000)
end

function GetCurrentDepth()
    return CURRENT_DEPTH
end

exports('GetCurrentDepth', GetCurrentDepth);


local SINK_DEPTH = {}
local WHEELDEPTH = {}
local SENT_STATEBAGS = {}

CURRENT_DEPTH = 0.0
CURRENT_TRACTION = 100
CURRENT_SOFTNESS = 0
CURRENT_WHEELSIZE = 0.0

local REFRESH_RATE = math.max(100, math.min(500, OfRoadCFG.refreshRate or 200))

local wheelBones = {
    'hub_lf',
    'hub_rf',
    'hub_rr',
    'hub_lr',
}

Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        local playerPed = PlayerPedId()

        if IsPedInAnyVehicle(playerPed, false) and GetPedInVehicleSeat(GetPlayerVeh(), -1) == playerPed then
            local veh = GetPlayerVeh()
            if not IsBlacklisted(veh) then
                sleep = REFRESH_RATE

                if CURRENT_DEPTH == 0.0 then
                    sleep = sleep * 2
                end


                local vehCoords = GetEntityCoords(veh)

                local rain = UseCache('rainLevel', function()
                    return GetRainLevel()
                end, 10000)

                local mass = GetVehicleMass(veh)
                local vehSpeed = GetEntitySpeed(veh)

                local anyChanges = false

                local averageDepth = 0
                local averageWheelSizes = 0
                local averageTraction = 0
                local averageSoftness = 0

                local wheelCount = GetWheelCount(veh)

                for index = 0, wheelCount - 1 do
                    local surface = GetWheelSurface(veh, index)
                    local blacklisted = IsInBlacklistedArea(veh)

                    if surface then
                        local wheelSize = GetVehicleRealWheelSize(veh, index)

                        if wheelSize < 0.75 then
                            local realDepth = (surface.depth * 0.001)

                            if blacklisted then
                                realDepth = 0.0
                            end

                            if OfRoadCFG.roadSideHelper.enabled then
                                local nearestRoad = GetNearestRoadDistance()
                                if nearestRoad <= OfRoadCFG.roadSideHelper.distanceThreshold then
                                    realDepth = realDepth * OfRoadCFG.roadSideHelper.depthMultiplier
                                end
                            end

                            local zoneHash = GetNameOfZone(vehCoords)
                            local zoneMultiplier = GetZoneMultiplier(zoneHash)
                            realDepth = realDepth * zoneMultiplier

                            if not SINK_DEPTH[veh] then
                                SINK_DEPTH[veh] = {}
                            end

                            if not SINK_DEPTH[veh][index + 1] then
                                local wheelDepthState = GetWheelDepthState(index)
                                SINK_DEPTH[veh][index + 1] = Entity(veh).state[wheelDepthState] or 0.0
                            end

                            local sinkageSpeed = (0.003 * ((rain * 2) + 1)) * (1 + (surface.softness / 25))


                            local realWheelSpeed = GetVehicleWheelSpeed(veh, index) - vehSpeed

                            sinkageSpeed = sinkageSpeed * (math.max(1, realWheelSpeed)) * (math.max(600, math.min(2200, mass)) / 2000)

                            if realWheelSpeed < 1 and vehSpeed > 4 then
                                sinkageSpeed = sinkageSpeed - (0.01 * (vehSpeed / 2))
                            end

                            sinkageSpeed = sinkageSpeed * (REFRESH_RATE / 200)

                            if HasOffroadTires(veh) then
                                sinkageSpeed = sinkageSpeed * 0.7
                            end

                            if sinkageSpeed > 0 then
                                sinkageSpeed = sinkageSpeed * (OfRoadCFG.generalSinkageSpeed / 100)
                            end

                            if realDepth > SINK_DEPTH[veh][index + 1] or sinkageSpeed < 0 then
                                SINK_DEPTH[veh][index + 1] = math.max(0, SINK_DEPTH[veh][index + 1] + (realDepth * sinkageSpeed))
                            end

                            if SINK_DEPTH[veh][index + 1] > realDepth then
                                SINK_DEPTH[veh][index + 1] = realDepth
                            end

                            local wheelDepth = math.max(wheelSize - SINK_DEPTH[veh][index + 1], 0.12)

                            averageWheelSizes = averageWheelSizes + wheelSize
                            averageDepth = averageDepth + (wheelSize - wheelDepth)
                            averageSoftness = averageSoftness + surface.softness

                            local zoneTraction = GetZoneTraction(zoneHash)
                            local traction = 100 - math.floor((100 - surface.traction) * (zoneTraction or 1))
                            averageTraction = averageTraction + traction


                            if not WHEELDEPTH[veh] then
                                WHEELDEPTH[veh] = {}
                            end

                            if EasyRound(WHEELDEPTH[veh][index + 1] or 0) ~= EasyRound(wheelDepth) then
                                anyChanges = true

                                if not SENT_STATEBAGS[veh] then
                                    SENT_STATEBAGS[veh] = {}
                                end

                                local wheelDepthState = GetWheelDepthState(index)
                                if not SENT_STATEBAGS[veh][wheelDepthState] then
                                    SENT_STATEBAGS[veh][wheelDepthState] = true
                                    TriggerServerEvent('kq_realoffroad:server:createStatebag', NetworkGetNetworkIdFromEntity(veh), wheelDepthState, wheelDepth)
                                else
                                    Entity(veh).state:set(wheelDepthState, wheelDepth, true)
                                end
                            end

                            WHEELDEPTH[veh][index + 1] = wheelDepth
                        else
                            if CURRENT_DEPTH > 0.0 then
                                CURRENT_DEPTH = 0.0
                                CURRENT_WHEELSIZE = 0.0
                            end
                        end
                    end
                end

                if anyChanges then
                    HandleVehicleDepth(veh, true)
                end

                averageWheelSizes = averageWheelSizes / wheelCount
                averageDepth = averageDepth / wheelCount
                averageTraction = averageTraction / wheelCount
                averageSoftness = averageSoftness / wheelCount
                CURRENT_DEPTH = averageDepth
                CURRENT_WHEELSIZE = averageWheelSizes
                CURRENT_TRACTION = averageTraction
                CURRENT_SOFTNESS = averageSoftness
            elseif #SINK_DEPTH > 0 then
                SINK_DEPTH = {}
                CURRENT_DEPTH = 0.0
                CURRENT_TRACTION = 100
            end
        else
            if #SINK_DEPTH > 0 then
                SINK_DEPTH = {}
            end
        end
        Citizen.Wait(sleep)
    end
end)

function GetWheelSurface(veh, index)
    return UseCache('vehSurface_' .. veh .. '_' .. index, function()
        local surfaceId = GetVehicleWheelSurfaceMaterial(veh, index)
        local surface = OfRoadCFG.surfaces[surfaceId];
        if not surface then
            surface = OfRoadCFG.fallbackSurface
        end

        return surface
    end, 500)
end

local playerVehicles = {}
Citizen.CreateThread(function()
    while true do
        local newVehicles = {}
        local players = GetActivePlayers()
        local playerPed = PlayerPedId()

        for i = 1, #players, 1 do
            local ped = GetPlayerPed(players[i])
            if ped ~= playerPed then
                if IsPedInAnyVehicle(ped) and GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(ped)) < 75.0 then
                    local vehicle = GetVehiclePedIsIn(ped, false)
                    if not Contains(newVehicles, vehicle) then
                        table.insert(newVehicles, vehicle)
                    end
                end
            end
        end

        playerVehicles = newVehicles

        Citizen.Wait(2500)
    end
end)

Citizen.CreateThread(function()
    while true do
        local sleep = 1500

        for i, veh in pairs(playerVehicles) do
            if DoesEntityExist(veh) then
                local didAnything = HandleVehicleDepth(veh, false)
                if didAnything then
                    sleep = math.floor(OfRoadCFG.refreshRate * 2.5)
                end
            end
        end

        Citizen.Wait(sleep)
    end
end)

function HandleVehicleDepth(veh, isCurrentVehicle)
    local didAnything = false

    if DoesEntityExist(veh) then
        local state = {}

        if isCurrentVehicle then
            state = WHEELDEPTH[veh]
        else
            state = Entity(veh).state
        end

        for index = 0, GetWheelCount(veh) -1 do
            local wheelDepth = 0
            if isCurrentVehicle then
                wheelDepth = state[index + 1]
            else
                local wheelDepthState = GetWheelDepthState(index)
                wheelDepth = state[wheelDepthState]
            end

            if GetWheelCount(veh) >= 3 then
                if wheelDepth ~= nil and wheelDepth > 0.01 and wheelDepth <= 1.5 then
                    if (EasyRound(wheelDepth) ~= EasyRound(GetVehicleWheelTireColliderSize(veh, index))) then
                        didAnything = true
                        SetVehicleWheelTireColliderSize(veh, index, wheelDepth + 0.0)

                        if OfRoadCFG.suspensionRefresh.enabled then
                            if OfRoadCFG.suspensionRefresh.type == 'force' then
                                SetVehicleDamage(veh, 0.0, 0.0, -100.0, 1000.0, 1.0, 1)
                            else
                                local flag = GetVehicleWheelFlags(veh, index)
                                if flag > 0 then
                                    SetVehicleWheelFlags(veh, index, flag + 2048)
                                    Citizen.Wait(1)
                                    if not DoesEntityExist(veh) then
                                        return false
                                    end
                                    SetVehicleWheelFlags(veh, index, flag)
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    return didAnything
end

function EasyRound(number)
    number = number * 1000

    if (number - (number % 0.1)) - (number - (number % 1)) < 0.5 then
        number = number - (number % 1)
    else
        number = (number - (number % 1)) + 1
    end
    return number / 1000
end


function GetVehicleRealWheelSize(veh, index)
    return UseCache('GetVehicleRealWheelSize' .. veh .. '_' .. index, function()
        local sizeState = GetWheelSizeState(index)

        local wheelSize = UseCache(sizeState .. ' ' .. veh, function()
            return Entity(veh).state[sizeState]
        end, 99999999999999)

        if not wheelSize then
            wheelSize = GetVehicleWheelTireColliderSize(veh, index)
            if not Entity(veh).state[sizeState] then
                TriggerServerEvent('kq_realoffroad:server:createStatebag', NetworkGetNetworkIdFromEntity(veh), sizeState, wheelSize)
                Entity(veh).state[sizeState] = wheelSize
            else
                wheelSize = Entity(veh).state[sizeState]
            end
        end

        return wheelSize
    end, 20000)
end

function GetWheelDepthState(index)
    return WHEEL_DEPTH .. index
end

function GetWheelSizeState(index)
    return WHEEL_SIZE .. index
end

function GetPlayerVeh()
    return GetVehiclePedIsIn(PlayerPedId(), false)
end

function GetVehicleMass(veh)
    return UseCache('vehMass_' .. veh, function ()
        return GetVehicleHandlingFloat(veh, 'CHandlingData', 'fMass')
    end, 60000)
end

function IsAwd(veh)
    return UseCache('isAwd_' .. veh, function()
        local bias = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fDriveBiasFront')
        return bias > 0.3 and bias < 0.7
    end, 60000)
end

function GetWheelCount(veh)
    return UseCache('wheelCount_' .. veh, function()
        return GetVehicleNumberOfWheels(veh)
    end, 60000)
end

function GetZoneMultiplier(zone)
    return UseCache('zoneMultiplier_' .. zone, function()
        local zoneData = GetZoneData(zone)

        if zoneData then
           return zoneData.depthMultiplier
        end

        return 1
    end, 60000)
end

function GetZoneTraction(zone)
    return UseCache('zoneMultiplier_' .. zone, function()
        local zoneData = GetZoneData(zone)

        if zoneData then
           return zoneData.tractionMultiplier
        end

        return 1
    end, 60000)
end

function GetZoneData(zone)
    return UseCache('zoneData_' .. zone, function()
        for k, zoneData in pairs(OfRoadCFG.zones) do
            for _, zoneName in pairs(zoneData.zones) do
                if zoneName == zone then
                    return zoneData
                end
            end
        end

        return nil
    end, 60000)
end

function GetVehicleDrift(veh)
    return UseCache('vehDrift_' .. veh, function()
        return math.abs(GetVehicleWheelTractionVectorLength(veh, 3)) + math.abs(GetVehicleWheelTractionVectorLength(veh, 2))
    end, 400)
end

function L(text)
    if Locale and Locale[text] then
        return Locale[text]
    end

    return text
end

function Debug(...)
    if OfRoadCFG.debug then
        print(...)
    end
end

function Contains(tab, val)
    if not tab then
        return false
    end

    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

function ContainsVehicleModel(tab, val)
    if not tab then
        return false
    end

    for index, value in ipairs(tab) do
        if GetHashKey(value) == val then
            return true
        end
    end

    return false
end

Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        local playerPed = PlayerPedId()

        if IsPedInAnyVehicle(playerPed, false) and GetPedInVehicleSeat(GetPlayerVeh(), -1) == playerPed then
            local veh = GetPlayerVeh()

            if CURRENT_DEPTH > 0.05 and not IsBlacklisted(veh) then
                local generalUpgrade = GetVehicleGeneralUpgrades(veh)
                local turningUpgrade = math.floor(math.abs(GetVehicleSteeringAngle(veh)) / 1.5)

                local offroadTireUpgrade = 0
                if HasOffroadTires(veh) then
                    offroadTireUpgrade = OfRoadCFG.offroadTires.upgradeValue
                end

                local totalUpgrades = generalUpgrade + turningUpgrade + offroadTireUpgrade

                if IsAwd(veh) then
                    totalUpgrades = (totalUpgrades + (OfRoadCFG.awdUpgrade or 25)) * 1.3
                end

                local OfRoadCFGMultiplier = OfRoadCFG.generalDepthDifficulty / 100
                local totalSlowdown = math.floor(math.max(0, (math.floor(CURRENT_DEPTH * 820 * OfRoadCFGMultiplier) * (math.max(0.9, CURRENT_SOFTNESS / 70))) - totalUpgrades))

                if (math.abs(GetVehicleThrottleOffset(veh)) > 0.1) then
                    local dirtness = GetVehicleDirtLevel(veh)
                    SetVehicleDirtLevel(veh, dirtness + 0.1)
                end

                if IsMotorcycle(veh) then
                    SetVehicleHandbrake(veh, true)
                    Citizen.Wait(math.min(200, totalSlowdown))
                    SetVehicleHandbrake(veh, false)
                else
                    SetVehicleBurnout(veh, true)
                    Citizen.Wait(totalSlowdown)

                    SetVehicleBurnout(veh, false)

                    if (totalSlowdown > 250) then
                        SetVehicleBurnout(veh, true)
                    end
                end

                sleep = 40
            else
                sleep = 500
            end

        end

        Citizen.Wait(sleep)
    end
end)

if OfRoadCFG.generalTractionLoss > 0 then
    Citizen.CreateThread(function()
        while true do
            local sleep = 1000
            local playerPed = PlayerPedId()

            if IsPedInAnyVehicle(playerPed, false) and GetPedInVehicleSeat(GetPlayerVeh(), -1) == playerPed then
                sleep = 500
                local veh = GetVehiclePedIsIn(playerPed, false)

                if not IsBlacklisted(veh) and not IsInBlacklistedArea(veh) then
                    local traction = CURRENT_TRACTION

                    local driftThreshold = 1.3

                    if HasOffroadTires(veh) then
                        driftThreshold = 1.7
                        if CURRENT_SOFTNESS < 10 then
                            traction = traction + OfRoadCFG.offroadTires.tractionOnHard
                        else
                            traction = traction + OfRoadCFG.offroadTires.tractionOnSoft
                        end
                    end

                    if OfRoadCFG.roadSideHelper.enabled then
                        local nearestRoad = GetNearestRoadDistance()
                        if nearestRoad <= OfRoadCFG.roadSideHelper.distanceThreshold then
                            traction = 100 - math.floor((100 - traction) * OfRoadCFG.roadSideHelper.tractionMultiplier)
                        end
                    end

                    if traction <= 95 then
                        local drift = GetVehicleDrift(veh)

                        if drift > driftThreshold and (math.abs(GetVehicleThrottleOffset(veh)) > 0.1 or GetEntitySpeed(veh) > 5.0) and math.abs(GetVehicleSteeringAngle(veh)) > 0.2 then
                            if traction > 80 then
                                Citizen.Wait(100)
                            end
                            SetVehicleReduceTraction(veh, 1)
                            SetVehicleReduceGrip(veh, 1)
                            Citizen.Wait(200 - (CURRENT_TRACTION * (OfRoadCFG.generalTractionLoss / 100)))
                            SetVehicleReduceTraction(veh, 0)
                            SetVehicleReduceGrip(veh, 0)

                            if GetEntitySpeed(veh) > 8.0 then
                                SetVehicleHandbrake(veh, true)
                                Citizen.Wait(2)
                                SetVehicleHandbrake(veh, false)
                            end
                            sleep = 150
                        end
                    end
                end
            end
            Citizen.Wait(sleep)
        end
    end)
end

function GetVehicleGeneralUpgrades(veh)
    return UseCache('generalUpgrades_' .. veh, function()
        local wheelSizeUpgrade = GetWheelSizeUpgrade(CURRENT_WHEELSIZE)
        local suspensionHeightUpgrade = math.floor((math.max(0.0, GetVehicleSuspenionHeight(veh) - 1.6)) * 150)
        local wheelCountUpgrade = math.max(0, (GetVehicleNumberOfWheels(veh) - 4)) * 9
        local massUpgrade = math.floor(GetMassUpgrade(veh))
        local classUpgrade = GetVehicleModelUgrade(veh)

        return wheelSizeUpgrade + suspensionHeightUpgrade + wheelCountUpgrade + massUpgrade + classUpgrade
    end, 500)
end

function GetWheelSizeUpgrade(wheelSize)
    return UseCache('wheelSizeMultiplier' .. wheelSize, function ()
        wheelSize = math.max(-0.05, wheelSize - 0.35)
        
        return math.max(1, math.floor(wheelSize * 250))
    end, 60000)
end
