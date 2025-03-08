



local bodyCams = {}
local carCams  = {}

local aktifmi = false
local cam = nil
local inCam = false
local lastMenu
local lastCoords

local pedHeading
local targetPed

local bodycamW = false
-----------------------------------------------------------------------------------------
-- EVENT'S --
-----------------------------------------------------------------------------------------

RegisterNetEvent('wais:body:pload', function(body, cars)
    bodyCams = body
    carCams = cars
end)

RegisterNetEvent('wais:addTable:BodyCam', function(tableId, tableData)
    bodyCams[tableId] = tableData
end)

RegisterNetEvent('wais:removeTable:BodyCam', function(tableId)
    bodyCams[tableId] = nil
    local id = lib.getOpenContextMenu()
    if id == "wais_listcammenu_open" then 
        lib.hideContext()
        ESX.ShowNotification(kayscoreLSPD.Police.Camera.Lang["menu-updated"], 'error')
        listCams(lastMenu)
    end
end)

RegisterNetEvent('wais:addTable:DashCam', function(tableId, tableData)
    if carCams[tableId] == nil then 
        carCams[tableId] = tableData
    end
end)

RegisterNetEvent('wais:removeTable:DashCam', function(tableId)
    carCams[tableId] = nil
    local id = lib.getOpenContextMenu()
    if id == "wais_listcammenu_open" then 
        lib.hideContext()
        ESX.ShowNotification(kayscoreLSPD.Police.Camera.Lang["menu-updated"], 'error')
        listCams(lastMenu)
    end
end)

RegisterNetEvent('wais:AddOrRemove:DashCam', function()
    local coords = GetEntityCoords(PlayerPedId())
    local carId, carDistance = ESX.Game.GetClosestVehicle(coords)
    if carDistance <= 2 then
        local bone = GetEntityBoneIndexByName(carId, 'windscreen')
        if bone == -1 then
            bone = GetEntityBoneIndexByName(carId, 'windscreen_f')
        end
        local plate =ESX.Game.GetVehicleProperties(carId).plate
        TriggerServerEvent('wais:addDashCam', tostring(NetworkGetNetworkIdFromEntity(carId)), plate, bone)
    else
        ESX.ShowNotification(kayscoreLSPD.Police.Camera.Lang["near-vehicles"], 'error')
    end
end)

RegisterNetEvent('wais:watchBodycam', function(id)
    DoScreenFadeOut(1000)

    while not IsScreenFadedOut() do
        Wait(0)
    end

	local myPed = PlayerPedId()
	local myCoords = GetEntityCoords(myPed)
    SetEntityVisible(myPed, false)

    ESX.TriggerServerCallback('wais:getCoords', function(coords)
        SetEntityCoords(myPed, coords.x, coords.y, coords.z - 100)
        FreezeEntityPosition(myPed, true)
    end, id)

    Wait(500)

    local targetplayer = GetPlayerFromServerId(id)
    targetPed = GetPlayerPed(targetplayer)
	SetTimecycleModifier("scanline_cam_cheap")
	SetTimecycleModifierStrength(2.0)
    CreateHeliCam()
	cam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA", true)
    
	AttachCamToPedBone(cam, targetPed, 31086, 0.05, -0.025, 0.1, true)
	SetCamFov(cam, 80.0)
	RenderScriptCams(true, false, 0, 1, 0)

    inCam = true
    bodycamW = true

    DoScreenFadeIn(1000)

	while true do
        if inCam then
            local targetCoords = GetEntityCoords(targetPed)
            local distance = #(myCoords - targetCoords)
            if distance > 290 then
                SetEntityCoords(myPed, targetCoords.x, targetCoords.y, targetCoords.z - 100)
            end
        else
            break
        end
        Wait(250)
	end
end)

RegisterNetEvent('wais:watchDashcam', function(carId)
    DoScreenFadeOut(1000)

    while not IsScreenFadedOut() do
        Wait(0)
    end

    local ped = PlayerPedId()
    local myCoords = GetEntityCoords(ped)
    local vehicle = NetworkGetEntityFromNetworkId(tonumber(carId))

    ESX.TriggerServerCallback('wais:getCoordsCar', function(coords)
        SetEntityCoords(ped, coords.x, coords.y, coords.z - 100)
        FreezeEntityPosition(ped, true)
    end, tonumber(carId))

    Wait(500)

    vehicle = NetworkGetEntityFromNetworkId(tonumber(carId))

    if DoesEntityExist(vehicle) then
        SetEntityVisible(ped, false)
        AttachEntityToEntity(ped, vehicle, carCams[carId].bone, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, false, true, true, 0, false)
        SetTimecycleModifier("scanline_cam_cheap")
        SetTimecycleModifierStrength(2.0)
        CreateHeliCam()
        cam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA", true)

        AttachCamToVehicleBone(cam, vehicle, carCams[carId].bone, true, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true)
        SetCamFov(cam, 80.0)
        RenderScriptCams(true, false, 0, 1, 0)
        inCam = true
        bodycamW = false

        DoScreenFadeIn(1000)

        while true do
            if inCam then
                local vehCoords = GetEntityCoords(vehicle)
                local distance = #(myCoords - vehCoords)
                if distance > 290 then
                    SetEntityCoords(ped, vehCoords.x, vehCoords.y, vehCoords.z - 100)
                end
            else
                break
            end
            Wait(250)
        end
    else
        DoScreenFadeIn(1000)
        TriggerServerEvent('wais:removeTable:DashCam:s', tostring(carId))
    end
end)

if kayscoreLSPD.Police.Camera.DevMode then
    AddEventHandler('onClientResourceStart', function(resName)
        if (GetCurrentResourceName() == resName) then
            playerLoaded()
        end
    end)
end

AddEventHandler('wais:openMenu', function(id, title, optionsValue, menu, cb)
    if menu then 
        lib.registerContext({
            id = id,
            title = title,
            menu = menu,
            onExit = function()
                cb(true) 
            end,
            options = optionsValue
        })
    else
        lib.registerContext({
            id = id,
            title = title,
            onExit = function()
                cb(true) 
            end,
            options = optionsValue
        })
    end

    if lib.getOpenContextMenu() == nil then 
        lib.showContext(id)
    end
end)

-----------------------------------------------------------------------------------------
-- MAIN FUNCTION'S --
-----------------------------------------------------------------------------------------

function CreateHeliCam()
    local scaleform = RequestScaleformMovie("HELI_CAM")
	while not HasScaleformMovieLoaded(scaleform) do
		Wait(0)
	end
end

function InstructionButton(ControlButton)
    ScaleformMovieMethodAddParamPlayerNameString(ControlButton)
end

function InstructionButtonMessage(text)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
end

function CreateInstuctionScaleform(scaleform)
    scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
    PopScaleformMovieFunctionVoid()
    PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()
    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(1)
    InstructionButton(GetControlInstructionalButton(1, 194, true))
    InstructionButtonMessage(kayscoreLSPD.Police.Camera.Lang["exit-cam"])
    PopScaleformMovieFunctionVoid()
    PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
    PopScaleformMovieFunctionVoid()
    PushScaleformMovieFunction(scaleform, "SET_BACKGROUND_COLOUR")
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(80)
    PopScaleformMovieFunctionVoid()
    return scaleform
end

function prepareCameraSelf(ped, activating)
	DetachEntity(ped, 1, 1)
	SetEntityCollision(ped, not activating, not activating)
	SetEntityInvincible(ped, activating)
	if activating then
	  	NetworkFadeOutEntity(ped, activating, false)
	else
	  	NetworkFadeInEntity(ped, 0, false)
	end
    SetEntityVisible(ped, true)
    FreezeEntityPosition(ped, false)
    if bodycamW then
        SetFocusEntity(ped)
        NetworkSetInSpectatorMode(0, ped)
    end
    SetEntityCoords(ped, kayscoreLSPD.Police.Camera.WatchCoords.x, kayscoreLSPD.Police.Camera.WatchCoords.y, kayscoreLSPD.Police.Camera.WatchCoords.z)
end

function exitCam()
    local ped = PlayerPedId()
    cam = nil
    inCam = false
    bodycamW = false
    prepareCameraSelf(ped, false)
    RenderScriptCams(false, false, 0, 1, 0)
    Wait(100)
    SetTimecycleModifier("default")
    SetTimecycleModifierStrength(0.3)
end

function openCamsMenu()
    lastCoords = GetEntityCoords(PlayerPedId())
    local options = {
        {
            title = kayscoreLSPD.Police.Camera.Lang["bodycam-list"],
            description = kayscoreLSPD.Police.Camera.Lang["bodycam-list-desc"],
            icon = 'video',
            onSelect = function()
                listCams('bodycam')
            end,
        },
        {
            title = kayscoreLSPD.Police.Camera.Lang["dashcam-list"],
            description = kayscoreLSPD.Police.Camera.Lang["dashcam-list-desc"],
            icon = 'clapperboard',
            onSelect = function()
                listCams('dashcam')
            end,
        },
    }

    TriggerEvent('wais:openMenu', 'wais_cammenu_open', kayscoreLSPD.Police.Camera.Lang["main-menu-title"], options, nil, function(data)
    
    end)
end

function listCams(types)
    lastMenu = types
    local name
    local elements = {}

    if types == "bodycam" then
        if not next(bodyCams) then
            ESX.ShowNotification(kayscoreLSPD.Police.Camera.Lang["no-active-cam"], 'error')
            return
        end

        name = "Bodycam"
        for k, v in pairs(bodyCams) do
            elements[#elements + 1] = {
                title = v.gradeLabel.. ' - ' .. v.names,
                description = kayscoreLSPD.Police.Camera.Lang["watch-bodycam"]:format(v.names),
                icon = 'video',
                onSelect = function()
                    TriggerEvent('wais:watchBodycam', tonumber(k))
                end,
            }
        end
    elseif types == "dashcam" then
        if not next(carCams) then
            ESX.ShowNotification(kayscoreLSPD.Police.Camera.Lang["no-active-cam"], 'error')
            return
        end
        
        name = "Dashcam"
        for k, v in pairs(carCams) do
            elements[#elements + 1] = {
                title = v.plate.. ' - ' .. v.names,
                description = kayscoreLSPD.Police.Camera.Lang["watch-dashcam"]:format(v.names),
                icon = 'video',
                onSelect = function()
                    TriggerEvent('wais:watchDashcam', k)
                end,
            }
        end
    end

    TriggerEvent('wais:openMenu', 'wais_listcammenu_open', name..' List', elements, 'wais_cammenu_open', function(data) 
    
    end)
end

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.28, 0.28)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextDropshadow(0)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 250
    DrawRect(_x,_y +0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
end

-----------------------------------------------------------------------------------------
-- COMMAND'S --
-----------------------------------------------------------------------------------------

RegisterKeyMapping('bodyexit', 'Bodycam Exit', 'keyboard', 'back')
RegisterCommand('bodyexit', function()
    if inCam then
        exitCam()
    end
end)

-----------------------------------------------------------------------------------------
-- THREAD'S --
-----------------------------------------------------------------------------------------

CreateThread(function()
    while true do
        local sleep = 1000
        if ESXLoaded then
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            if ESX.PlayerData.job.name == "police" or ESX.PlayerData.job.name == "bcso" and not inCam then
                local distance = #(coords - kayscoreLSPD.Police.Camera.WatchCoords)
                if distance <= 4 then
                    sleep = 5
                    DrawText3D(kayscoreLSPD.Police.Camera.WatchCoords.x, kayscoreLSPD.Police.Camera.WatchCoords.y, kayscoreLSPD.Police.Camera.WatchCoords.z, kayscoreLSPD.Police.Camera.Lang["e-button-text"])
                    if IsControlJustPressed(0, 38) then
                        openCamsMenu()
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

CreateThread(function()
    while true do
        local sleep = 1000
        if ESXLoaded then
            if inCam then
                sleep = 1
                if bodycamW then
                    pedHeading = GetEntityHeading(targetPed)
                    SetCamRot(cam, 0, 0, pedHeading, 2)
                end
                local instructions = CreateInstuctionScaleform("instructional_buttons")
                DrawScaleformMovieFullscreen(instructions, 255, 255, 255, 255, 0)
            else
                sleep = 1000
            end
        end
        Wait(sleep)
    end
end)