ESX = nil
local currentPlate = ""
local currentType = 0

local job = ""
local callsign = nil
local isLoggedIn = false

local unitCooldown = false
local alertsToggled = true
local unitBlipsToggled = true
local callBlipsToggled = true

local callBlips = {}
local jobInfo = {}
local blips = {}
local playerPed = PlayerPedId()  -- Obtenir le PED du joueur actuel
local playerCoords = GetEntityCoords(playerPed)  -- Obtenir les coordonnées du joueur

Citizen.CreateThread( function()
     while ESX == nil do
        ESX = exports["frwk"]:getSharedObject()
            Citizen.Wait(0)
        end

        while ESX.GetPlayerData().job == nil do
            Citizen.Wait(10)
        end

        job = ESX.GetPlayerData().job.name
        isLoggedIn = true

         if Config.JobOne.job == job or Config.JobTwo.job == job or Config.JobThree.job == job then
        callsign = "NO CALLSIGN"
        if callsign ~= "NO CALLSIGN" then
            TriggerServerEvent('kay_dispatch:setCallSign', callsign)
        end

        updateJobInfo()

        ESX.TriggerServerCallback("kay_dispatch:getPersonalInfo", function(firstname, lastname)
            SendNUIMessage(
                {
                    type = "Init",
                    firstname = firstname,
                    lastname = lastname,
                    jobInfo = jobInfo
                }
            )
        end)
    end
        


end)


RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(JobInfo)
    job = JobInfo.name
    if Config.JobOne.job == job or Config.JobTwo.job == job or Config.JobThree.job == job then
        callsign =  "NO CALLSIGN"
        if callsign ~= "NO CALLSIGN" then
            TriggerServerEvent('kay_dispatch:setCallSign', callsign)
        end

        updateJobInfo()

        ESX.TriggerServerCallback("kay_dispatch:getPersonalInfo", function(firstname, lastname)
            SendNUIMessage(
                {
                    type = "Init",
                    firstname = firstname,
                    lastname = lastname,
                    jobInfo = jobInfo
                }
            )
        end)
    end
end)

--Shots in area
Citizen.CreateThread(
    function()
        while Config.EnableShootingAlerts do
            Citizen.Wait(10)
            local whithin = true
            local ped = PlayerPedId()
            local playerCoords = GetEntityCoords(ped)  -- Mise à jour des coordonnées ici
            local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z))  -- Récupérer le nom de la rue

            for _, v in ipairs(Config.ShootingZones) do
                local distance = #(playerCoords - v.coords)  -- Utiliser playerCoords au lieu de playerPos
                if distance < v.radius then
                    whithin = true
                end
            end

            if whithin then
                if IsPedShooting(ped) and math.random(1, 2) == 1 then
                    local gender = "unknown"
                    local model = GetEntityModel(ped)
                    if (model == GetHashKey("mp_f_freemode_01")) then
                        gender = "Genre : Femme"
                    end
                    if (model == GetHashKey("mp_m_freemode_01")) then
                        gender = "Genre : Homme"
                    end

                    -- Ajouter le nom de la rue dans l'alerte
                    TriggerServerEvent(
                        "kay_dispatch:addCall",
                        "10-31",
                        "Coup de feu",
                        {{icon = "fa-venus-mars", info = gender}, {icon = "fa-map-marker-alt", info = "Rue : " .. streetName}},
                        {playerCoords[1], playerCoords[2], playerCoords[3]},  -- Utiliser playerCoords ici
                        "police",
                        5000,
                        156,
                        1
                    )
                    Citizen.Wait(10000)
                end
            else
                Citizen.Wait(2000)
            end
        end
    end
)

AddEventHandler('onResourceStart', function (resourceName)
    if(GetCurrentResourceName() == resourceName) then
        while ESX == nil do
            Citizen.Wait(200)
        end
        
        isLoggedIn = true
        job = ESX.GetPlayerData().job.name
        currentPlate = ""
        currentType = 0
        if Config.JobOne.job == job or Config.JobTwo.job == job or Config.JobThree.job == job then
            callsign = "NO CALLSIGN"
            if callsign ~= "NO CALLSIGN" then
                TriggerServerEvent('kay_dispatch:setCallSign', callsign)
            end

            updateJobInfo()

           ESX.TriggerServerCallback("kay_dispatch:getPersonalInfo", function(firstname, lastname)
                SendNUIMessage(
                    {
                        type = "Init",
                        firstname = firstname,
                        lastname = lastname,
                        jobInfo = jobInfo
                    }
                )
            end)
        end
    end
end)

RegisterKeyMapping('dispatch', "Open Dispatch using " .. Config.OpenMenuKey, "keyboard", Config.OpenMenuKey)

RegisterCommand('dispatch', function()
    openDispatch()    
end, false)

RegisterCommand(Config.JobOne.callCommand, function(source, args, rawCommand)
    local msg = rawCommand:sub(5)
    local cord = GetEntityCoords(PlayerPedId())
    TriggerServerEvent("kay_dispatch:addMessage",
        msg,
        {cord[1], cord[2], cord[3]},
        Config.JobOne.job,
        5000,
        Config.callCommandSprite,
        Config.callCommandColor
    )
end, false)

RegisterCommand(Config.JobTwo.callCommand, function(source, args, rawCommand)
    local msg = rawCommand:sub(5)
    local cord = GetEntityCoords(PlayerPedId())
    TriggerServerEvent(
        "kay_dispatch:addMessage",
        msg,
        {cord[1], cord[2], cord[3]},
        Config.JobTwo.job,
        5000,
        Config.callCommandSprite,
        Config.callCommandColor
    )
end, false)

RegisterCommand(Config.JobThree.callCommand, function(source, args, rawCommand)
    local msg = rawCommand:sub(5)
    local cord = GetEntityCoords(PlayerPedId())
    TriggerServerEvent("kay_dispatch:addMessage",
        msg,
        {cord[1], cord[2], cord[3]},
        Config.JobThree.job,
        5000,
        Config.callCommandSprite,
        Config.callCommandColor
    )
end, false)

function addBlipForCall(sprite, color, coords, text)
    local alpha = 250
    local radius = AddBlipForRadius(coords, 40.0)
    local blip = AddBlipForCoord(coords)

    -- Configurer le blip principal
    SetBlipSprite(blip, sprite)
    SetBlipDisplay(blip, 8)  -- Ne sera pas affecté par le zoom
    SetBlipScale(blip, 1.0)  -- Taille fixe, indépendante du zoom
    SetBlipColour(blip, color)
    SetBlipAsShortRange(blip, false)
    SetBlipHighDetail(blip, true)

    -- Ajouter le texte au blip
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(tostring(text))
    EndTextCommandSetBlipName(blip)

    -- Configurer le rayon du blip
    SetBlipColour(radius, color)
    SetBlipAlpha(radius, alpha)
    SetBlipAsShortRange(radius, true)

    -- Ajouter les blips aux tableaux pour une gestion future
    table.insert(callBlips, blip)
    table.insert(callBlips, radius)

    -- Boucle pour réduire l'alpha du rayon jusqu'à disparition
    while alpha > 0 do
        Citizen.Wait(Config.CallBlipDisappearInterval)
        alpha = math.max(alpha - 5, 0)  -- Réduction par pas de 5 pour accélérer la disparition
        SetBlipAlpha(radius, alpha)

        -- Supprimer les blips lorsque alpha atteint 0
        if alpha == 0 then
            RemoveBlip(radius)
            RemoveBlip(blip)
            return
        end
    end
end

function addBlipsForUnits()
    ESX.TriggerServerCallback("kay_dispatch:getUnits", function(units)
        local id = GetPlayerServerId(PlayerId())

        for _, z in pairs(blips) do
            RemoveBlip(z)
        end

        blips = {}

        for k, v in pairs(units) do
            if
                k ~= id and
                    (Config.JobOne.job == v.job or Config.JobTwo.job == v.job or Config.JobThree.job == v.job)
                then
                local color = 0
                local title = ""
                if Config.JobOne.job == v.job then
                    color = Config.JobOne.blipColor
                    title = Config.JobOne.label
                end
                if Config.JobTwo.job == v.job then
                    color = Config.JobTwo.blipColor
                    title = Config.JobTwo.label
                end
                if Config.JobThree.job == v.job then
                    color = Config.JobThree.blipColor
                    title = Config.JobThree.label
                end

                -- Récupère les coordonnées de l'unité
                local unitEntity = NetworkGetEntityFromNetworkId(v.netId)
                local unitCoords = GetEntityCoords(unitEntity)

                -- Crée un blip pour cette unité à ses coordonnées
                local new_blip = AddBlipForEntity(unitEntity)

                -- Personnalise le blip
                SetBlipSprite(new_blip, Config.Sprite[v.type])
                ShowHeadingIndicatorOnBlip(new_blip, true)
                HideNumberOnBlip(new_blip)
                SetBlipScale(new_blip, 0.8)
                SetBlipCategory(new_blip, 7)
                SetBlipColour(new_blip, color)
                SetBlipAsShortRange(new_blip, false)  -- Le blip est visible sur toute la carte

                -- Ajoute un nom au blip
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("(" .. title .. ") " .. v.firstname .. " " .. v.lastname)
                EndTextCommandSetBlipName(new_blip)

                -- Stocke le blip
                blips[k] = new_blip
            end
        end
    end)
end

function openDispatch()
    if Config.JobOne.job == job or Config.JobTwo.job == job or Config.JobThree.job == job then
        SetNuiFocus(false, false)
        ESX.TriggerServerCallback("kay_dispatch:getInfo", function(units, calls, ustatus, callsigns)
            SetNuiFocus(true, true)

            SendNUIMessage(
                {
                    type = "open",
                    units = units,
                    calls = calls,
                    ustatus = ustatus,
                    job = job,
                    callsigns = callsigns,
                    id = GetPlayerServerId(PlayerId())
                }
            )
        end)
    end
end

function updateJobInfo()
    jobInfo[Config.JobOne.job] = {
        color = Config.JobOne.color,
        column = 1,
        label = Config.JobOne.label,
        canRequestLocalBackup = Config.JobOne.canRequestLocalBackup,
        canRequestOtherJobBackup = Config.JobOne.canRequestOtherJobBackup,
        forwardCall = Config.JobOne.forwardCall,
        canRemoveCall = Config.JobOne.canRemoveCall
    }
    jobInfo[Config.JobTwo.job] = {
        color = Config.JobTwo.color,
        column = 2,
        label = Config.JobTwo.label,
        canRequestLocalBackup = Config.JobTwo.canRequestLocalBackup,
        canRequestOtherJobBackup = Config.JobTwo.canRequestOtherJobBackup,
        forwardCall = Config.JobTwo.forwardCall,
        canRemoveCall = Config.JobTwo.canRemoveCall
    }
    jobInfo[Config.JobThree.job] = {
        color = Config.JobThree.color,
        column = 3,
        label = Config.JobThree.label,
        canRequestLocalBackup = Config.JobThree.canRequestLocalBackup,
        canRequestOtherJobBackup = Config.JobThree.canRequestOtherJobBackup,
        forwardCall = Config.JobThree.forwardCall,
        canRemoveCall = Config.JobThree.canRemoveCall
    }
end

RegisterNetEvent("kay_dispatch:callAdded")
AddEventHandler("kay_dispatch:callAdded", function(id, call, j, cooldown, sprite, color)
    if job == j and alertsToggled then
        SendNUIMessage(
            {
                type = "call",
                id = id,
                call = call,
                cooldown = cooldown
            }
        )

        if Config.AddCallBlips then
            addBlipForCall(sprite, color, vector3(call.coords[1], call.coords[2], call.coords[3]), id)
        end
    end
end)

RegisterNUICallback("dismissCall", function(data)
    local id = data["id"]:gsub("call_", "")

    TriggerServerEvent("kay_dispatch:unitDismissed", id)
    DeleteWaypoint()
end)

RegisterNUICallback("updatestatus", function(data)
    local id = data["id"]
    local status = data["status"]

   

    TriggerServerEvent("kay_dispatch:changeStatus", id, status)
end)

RegisterNUICallback("sendnotice", function(data)
    local caller = data["caller"]

    if Config.EnableUnitArrivalNotice then
        TriggerServerEvent("kay_dispatch:arrivalNotice", caller)
    end
end)

RegisterNetEvent("kay_dispatch:SendTextMessage")
AddEventHandler("kay_dispatch:SendTextMessage", function(msg)
   SendTextMessage(msg)
end)

RegisterNetEvent("kay_dispatch:arrivalNoticeClient")
AddEventHandler("kay_dispatch:arrivalNoticeClient", function()
    if not unitCooldown then
        SendTextMessage(Config.Text["someone_is_reacting"])
        unitCooldown = true
        Citizen.Wait(20000)
        unitCooldown = false
    end
end)

RegisterNUICallback("reqbackup", function(data)
    local j = data["job"]
    local req = data["requester"]
    local firstname = data["firstname"]
    local lastname = data["lastname"]
   SendTextMessage(Config.Text["backup_requested"])
    local cord = GetEntityCoords(PlayerPedId())
    TriggerServerEvent("kay_dispatch:addCall",
        "10-20",
        req .. " Backup niveau 1",
        {{icon = "fa-user-friends", info = firstname .. " " .. lastname}},
        {cord[1], cord[2], cord[3]},
        j
    )
end)

RegisterNUICallback(
    "toggleoffduty",
    function(data)
        ToggleDuty()
    end
)

RegisterNUICallback(
    "togglecallblips",
    function(data)
        callBlipsToggled = not callBlipsToggled

        if callBlipsToggled then
            for _, z in pairs(callBlips) do
                SetBlipDisplay(z, 4)
            end
            SendTextMessage(Config.Text["call_blips_turned_on"])
        else
            for _, z in pairs(callBlips) do
                SetBlipDisplay(z, 0)
            end

            SendTextMessage(Config.Text["call_blips_turned_off"])
        end
    end
)

RegisterNUICallback(
    "toggleunitblips",
    function(data)
        unitBlipsToggled = not unitBlipsToggled

        if unitBlipsToggled then
            addBlipsForUnits()
            SendTextMessage(Config.Text["unit_blips_turned_on"])
        else
            for _, z in pairs(blips) do
                RemoveBlip(z)
            end

            blips = {}
            SendTextMessage(Config.Text["unit_blips_turned_off"])
        end
    end
)

RegisterNUICallback(
    "togglealerts",
    function(data)
        alertsToggled = not alertsToggled

        if alertsToggled then
            SendTextMessage(Config.Text["alerts_turned_on"])
        else
            SendTextMessage(Config.Text["alerts_turned_off"])
        end
    end
)

RegisterNUICallback(
    "copynumber",
    function(data)
        SendTextMessage(Config.Text["phone_number_copied"])
    end
)

RegisterNUICallback(
    "forwardCall",
    function(data)
        local id = data["id"]:gsub("call_", "")

        SendTextMessage(Config.Text["call_forwarded"])
        TriggerServerEvent("kay_dispatch:forwardCall", id, data["job"])
    end
)

RegisterNUICallback(
    "acceptCall",
    function(data)

       
        local id = data["id"]:gsub("call_", "")

        SetNewWaypoint(tonumber(data["x"]), tonumber(data["y"]))

        TriggerServerEvent("kay_dispatch:unitResponding", id, job)
    end
)

RegisterNUICallback(
    "changecallsign",
    function(data)

       
        local callsign = data["callsign"]


     

        TriggerServerEvent("kay_dispatch:changeCallSign",callsign)
    end
)


RegisterNetEvent("kay_dispatch:acceptCallClient")
AddEventHandler("kay_dispatch:acceptCallClient", function(id, unit)
    if unit == GetPlayerServerId(PlayerId()) then
          SendTextMessage(Config.Text["accepted"])
    end

    SendNUIMessage(
        {
            type = "accept",
            id = unit
        }
    )
end)

RegisterNUICallback("removeCall", function(data)
    local id = data["id"]:gsub("call_", "")
    TriggerServerEvent("kay_dispatch:removeCall", id)
end)

RegisterNetEvent("kay_dispatch:removeCallClient")
AddEventHandler("kay_dispatch:removeCallClient", function(id, unit)
    if unit == GetPlayerServerId(PlayerId()) then

         SendTextMessage(Config.Text["call_removed"])
    end
    SendNUIMessage(
        {
            type = "remove",
            id = id
        }
    )
end)

RegisterNUICallback("close", function(data)
    SetNuiFocus(false, false)
end)


Citizen.CreateThread( function()
    while Config.EnableMapBlipsForUnits do
        if isLoggedIn then
            if Config.JobOne.job == job or Config.JobTwo.job == job or Config.JobThree.job == job then
                if unitBlipsToggled then
                    addBlipsForUnits()
                end
            end
        end
        Citizen.Wait(5000)
    end
end)

Citizen.CreateThread( function()
    while true do
        local sleep = 5000
        if isLoggedIn then
            if Config.JobOne.job == job or Config.JobTwo.job == job or Config.JobThree.job == job then
                sleep = 1500
                status = {
                    carPlate = currentPlate,
                    type = currentType,
                    job = job,
                    netId = NetworkGetNetworkIdFromEntity(PlayerPedId())
                }

                TriggerServerEvent("kay_dispatch:playerStatus", status)
            end
        end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread( function()
    while true do
        local sleep = 5000
        if isLoggedIn then
            if Config.JobOne.job == job or Config.JobTwo.job == job or Config.JobThree.job == job then
                sleep = 1500
                local ped = PlayerPedId()
                
                if IsPedInAnyVehicle(ped) then
                    local vehicle = GetVehiclePedIsIn(ped, false)
                    local plate = GetVehicleNumberPlateText(vehicle)
                    currentPlate = plate
                    currentType = GetVehicleClass(vehicle)
                else
                    currentPlate = ""
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

--EXPORTS

exports("addCall", function(code, title, extraInfo, coords, job, cooldown, sprite, color)
    TriggerServerEvent("kay_dispatch:addCall", code, title, extraInfo, coords, job, cooldown or 5000, sprite or 11, color or 5)
end)

exports("addMessage", function(message, coords, job, cooldown, sprite, color)
    TriggerServerEvent("kay_dispatch:addMessage", message, coords, job, cooldown or 5000, sprite or 11, color or 5)
end)