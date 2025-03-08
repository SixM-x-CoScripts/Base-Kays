kayscoreServ = {}

KeyboardUtils = {isActive = false}

AddEventHandler("kbi:cancel",function() 
    KeyboardUtils.isActive = false
end)

function KeyboardUtils.use(title,cb)
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
            
        end
    else
        local input = lib.inputDialog(title, {''})
        if input then
            cb(input[1])
        else
    
        end
    end
end

function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.35)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

function DrawTexteDansTaMere(x,y,z,textInput,fontId,scaleX,scaleY, Color)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
    local scale = (1/dist)*20
    local fov = (1/GetGameplayCamFov())*10.5
    local scale = scale*fov   
    SetTextScale(0.0 * scale, 0.55 * scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(Color.r, Color.g, Color.b, 255)
    SetTextDropshadow(1, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

entityEnumerator = {
    __gc = function(enum)
        if enum.destructor and enum.handle then
            enum.destructor(enum.handle)
        end

        enum.destructor = nil
        enum.handle = nil
    end
}

function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
        local iter, id = initFunc()
        if not id or id == 0 then
            disposeFunc(iter)
            return
        end

        local enum = { handle = iter, destructor = disposeFunc }
        setmetatable(enum, entityEnumerator)

        local next = true
        repeat
            coroutine.yield(id)
            next, id = moveFunc(iter)
        until not next

        enum.destructor, enum.handle = nil, nil
        disposeFunc(iter)
    end)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function GetVehicles()
    local vehicles = {}

    for vehicle in EnumerateVehicles() do
        table.insert(vehicles, vehicle)
    end

    return vehicles
end

function GetClosestVehicle(coords)
    local vehicles = GetVehicles()
    local closestDistance = -1
    local closestVehicle = -1
    local coords = coords

    if coords == nil then
        local playerPed = PlayerPedId()
        coords = GetEntityCoords(playerPed)
    end

    for i = 1, #vehicles, 1 do
        local vehicleCoords = GetEntityCoords(vehicles[i])
        local distance = GetDistanceBetweenCoords(vehicleCoords, coords.x, coords.y, coords.z, true)

        if closestDistance == -1 or closestDistance > distance then
            closestVehicle = vehicles[i]
            closestDistance = distance
        end
    end

    return closestVehicle, closestDistance
end

function DrawInstructionBarNotification(x, y, z, text)
	local px, py, pz = table.unpack(GetEntityCoords(PlayerPedId()))

	local distance = GetDistanceBetweenCoords(x, y, z, px, py, pz, false)

	if distance <= 6 then
		SetTextScale(0.35, 0.35)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextEntry("STRING")
		SetTextCentre(true)
		AddTextComponentString(text)
		SetDrawOrigin(x,y,z, 0)
		DrawText(0.0, 0.0)
		local factor = (string.len(text)) / 370
		DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
		ClearDrawOrigin()
	end
end

function stopprevue()
    RenderScriptCams(0, 0, 500, 0, 0)
    TriggerEvent("InitCamModulePause", false)
    DeleteEntity(tempVeh)
    tempVeh = nil
    tempModel = nil
    DestroyAllCams(true)
end

function RespawnPed(ped, spawn)
	SetEntityCoordsNoOffset(ped, spawn.coords, false, false, false, true)
	NetworkResurrectLocalPlayer(spawn.coords, spawn.heading, true, false)
	LSLIFE_UTILS:SetPlayerInvincible(false)
	SetPlayerInvincible(ped, false)
	TriggerEvent('playerSpawned', spawn)
	ClearPedBloodDamage(ped)
end

-- local isPrevislideabled = false
-- local sin = math.sin
-- local cos = math.cos
-- local torad = math.pi / 180

-- function GetCoordsFromGamePlayCameraPointAtSynced(ingoredEntity)
--     local action = 0
--     local distance = 1000
--     local coordsVector =  GetFinalRenderedCamCoord() ;
--     local rotationVectorUnrad = GetFinalRenderedCamRot(2);
--     local rotationVector = rotationVectorUnrad * torad
--     local directionVector =  vector3(-sin(rotationVector.z) * cos(rotationVector.x), (cos(rotationVector.z) * cos(rotationVector.x)), sin(rotationVector.x));
--     local destination =  coordsVector + directionVector * distance ;
--     local destination_temp = coordsVector + directionVector * 1 ;
--     local getentitytype = function(entity)
--        local type = GetEntityType(entity)
--        local result = "solid"
--      result = "object"
--        return result
--     end

--     if StartExpensiveSynchronousShapeTestLosProbe then 
--         local shapeTestId = StartExpensiveSynchronousShapeTestLosProbe(destination_temp, destination, 511, ingoredEntity or Player.playerPed, 4)
--         local shapeTestResult , hit , endCoords , surfaceNormal , entityHit = GetShapeTestResult(shapeTestId)
--         ground, newZ = GetGroundZFor_3dCoord(endCoords.x, endCoords.y, endCoords.z + 0.5)

--         return hit and vector3(endCoords.x, endCoords.y, newZ or endCoords.z)
--     end
-- end

-- function handlePreviewEventEntity(model, entity_type)
--     local entity = nil

--     entity_type = 'vehicle'

--     if entity_type == 'vehicle' then
--         ESX.Game.SpawnLocalObject(model, GetEntityCoords(PlayerPedId()), function(vehicle)
--             entity = vehicle
--             SetEntityCollision(vehicle, false)
--         end)
--     end

--     while not DoesEntityExist(entity) do
--         Wait(10)
--     end

--     return entity
-- end

function KeyboardInput(title)
    KeyboardUtils.use(title, function(data)
        return data
    end)
end

function drawBar(time, text, cb)
    if lib.progressBar({
        duration = time,
        label = text,
        useWhileDead = false,
        canCancel = false,
    }) then if cb then cb() end end
end

_G._VEHICLES = {
    existVehicles = {},
    myVehicles = {},
}

_G._PROPS = {
    existVehicles = {},
    myProps = {},
}

_G._PEDS = {
    existPed = {},
    myPed = {},
    pedTags = {},
    isProche = false,
}

RegisterNetEvent('ePeds:addPed', function(name,data)
    _PEDS.addPed(name,data)
end)

_PEDS.addPed = function(name,data)
    if not data then return end
    if _PEDS.List[name] then
        _PEDS.List[#_PEDS.List..name] = data
    else
        _PEDS.List[name] = data
    end
end

_PEDS.removePed = function(name)
    if not _PEDS.List[name] then return end

    _PEDS.List[name] = nil
end

Citizen.CreateThread(function()
    while true do 
        Wait(5000)
        for k,v in pairs(_PEDS.List) do 
            if #(GetEntityCoords(PlayerPedId())-v.position) < 50 then
                if _PEDS.myPed[k] == nil or not DoesEntityExist(_PEDS.myPed[k]) then 
                    ESX.Game.SpawnLocalPed(2, v.model, vector3(v.position.x, v.position.y, v.position.z-0.98), v.heading, function(ped)
                        FreezeEntityPosition(ped, true)
                        SetEntityInvincible(ped, true)
                        SetBlockingOfNonTemporaryEvents(ped, true)
                        if _PEDS.List[k].scenario.active then 
                            TaskStartScenarioInPlace(ped, _PEDS.List[k].scenario.name, _PEDS.List[k].scenario.count, true)
                        end
                        if _PEDS.List[k].weapon.active then 
                            GiveWeaponToPed(ped, GetHashKey(_PEDS.List[k].weapon.weaponName), 250, true,true)
                        end
                        _PEDS.myPed[k] = ped
                    end)
                end
            else
                if _PEDS.myPed[k] then 
                    if DoesEntityExist(_PEDS.myPed[k]) then 
                        DeleteEntity(_PEDS.myPed[k])
                        _PEDS.myPed[k] = nil
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do 
        _PEDS.isProche = false
        for k,v in pairs(_PEDS.List) do 
            if #(GetEntityCoords(PlayerPedId())-v.position) < 10 and _PEDS.myPed[k] and DoesEntityExist(_PEDS.myPed[k]) and _PEDS.List[k].floatingText.active then 
                _PEDS.isProche = true
                _PEDS.pedTags[k] = CreateFakeMpGamerTag(_PEDS.myPed[k], _PEDS.List[k].floatingText.text, true, false, 'NPC', 1)
                SetMpGamerTagColour(_PEDS.pedTags[k], 0, _PEDS.List[k].floatingText.color)
                SetMpGamerTagVisibility(_PEDS.pedTags[k], 14, true)
                SetMpGamerTagColour(_PEDS.pedTags[k], 14, _PEDS.List[k].floatingText.color)
                SetMpGamerTagAlpha(_PEDS.pedTags[k], 14, 255)
                SetMpGamerTagHealthBarColor(_PEDS.pedTags[k], _PEDS.List[k].floatingText.color)
            else
                if _PEDS.pedTags[k] then 
                    RemoveMpGamerTag(_PEDS.pedTags[k])
                    _PEDS.pedTags[k] = nil
                end
            end
        end

        if _PEDS.isProche then 
            Wait(1000)
        else
            Wait(2500)
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource ~= GetCurrentResourceName() then return end

    for k,v in pairs(_PEDS.myPed) do 
        if DoesEntityExist(v) then 
            DeleteEntity(v)
            _PEDS.myPed[k] = nil
        end
    end
end)

_PROPS.addProps = function(name,data)
    if _PROPS.List[name] then return end
    if not data then return end

    _PROPS.List[name] = data
end

_PROPS.removeProps = function(name)
    if not _PROPS.List[name] then return end

    _PROPS.List[name] = nil
end

Citizen.CreateThread(function()
    while not ESXLoaded do Wait(1) end
    while true do 
        Wait(5000)
        for k,v in pairs(_PROPS.List) do 
            if #(Player.coords-v.position) < 50 then
                if _PROPS.myProps[k] == nil or not DoesEntityExist(_PROPS.myProps[k]) then 
                    ESX.Game.SpawnLocalObject(v.model, vector3(v.position.x, v.position.y, v.position.z-0.98), function(obj)
                        _PROPS.myProps[k] = obj
                        FreezeEntityPosition(obj, true)
                    end)
                end
            else
                if _PROPS.myProps[k] then 
                    if DoesEntityExist(_PROPS.myProps[k]) then 
                        DeleteEntity(_PROPS.myProps[k])
                        _PROPS.myProps[k] = nil
                    end
                end
            end
        end
    end
end)

local ZonesListe = {
    -- ['exemple'] = {
    --     Position = vector3(761.59454345703, -967.09130859375, 25.60489654541),
    --     Dist = 15,
    --     Public = true,
    --     Job = nil,
    --     Job2 = nil,
    --     InVehicleDisable = false,
    --     Blip = {
    --         Active = false,
    --         Position = vector3(),
    --         BlipId = 0,
    --         Color = 0,
    --         Sacle = 0.6,
    --         Text = ''
    --     },
    --     ActionText =('Appuyez sur [ %sE~w~ ] pour intéragir'):format(UTILS.COLORCODE),
    --     Action = function()
    --         print('test')
    --     end
    -- }
}

local BlipsListe = {
    -- ['exemple'] = {
    --     Public = true,
    --     Jobs = {}
    --     Position = vector3(1084.9197998047, -2002.4211425781, 31.402545928955),
    --     BlipId = 253,
    --     Color = 1,
    --     Scale = 0.6,
    --     Text = '[ILLEGAL] Fonderie'
    -- }
}

AddEventHandler('onResourceStop', function(resource)
	if resource ~= GetCurrentResourceName() then return end

    for k,v in pairs(_PROPS.myProps) do 
        if DoesEntityExist(v) then 
            DeleteEntity(v)
            _PROPS.myProps[k] = nil
        end
    end
end)

_VEHICLES.addVehicles = function(name,data)
    if _VEHICLES.List[name] then return end
    if not data then return end

    _VEHICLES.List[name] = data
end

_VEHICLES.removeVehicles = function(name)
    if not _VEHICLES.List[name] then return end

    _VEHICLES.List[name] = nil
end

Citizen.CreateThread(function()
    while not ESXLoaded do Wait(1) end
    while true do 
        Wait(5000)
        for k,v in pairs(_VEHICLES.List) do 
            if #(Player.coords-v.position) < 50 then
                if _VEHICLES.myVehicles[k] == nil or not DoesEntityExist(_VEHICLES.myVehicles[k]) then 
                    ESX.Game.SpawnLocalVehicle(v.model, vector3(v.position.x, v.position.y, v.position.z-0.98), v.heading, function(vehicle)
                        _VEHICLES.myVehicles[k] = vehicle
                        FreezeEntityPosition(vehicle, true)
                        SetEntityInvincible(vehicle, true)
                        SetVehicleUndriveable(vehicle, true)
                        SetVehicleDoorsLocked(vehicle, 2)
                    end)
                end
            else
                if _VEHICLES.myVehicles[k] then 
                    if DoesEntityExist(_VEHICLES.myVehicles[k]) then 
                        DeleteEntity(_VEHICLES.myVehicles[k])
                        _VEHICLES.myVehicles[k] = nil
                    end
                end
            end
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource ~= GetCurrentResourceName() then return end

    for k,v in pairs(_VEHICLES.myVehicles) do 
        if DoesEntityExist(v) then 
            DeleteEntity(v)
            _VEHICLES.myVehicles[k] = nil
        end
    end
end)

local waitNearby = 2000

CreateThread(function()
    while not ESXLoaded do Wait(1) end
    while not Player.job do Wait(1) end 
    while not Player.job2 do Wait(1) end

    while true do
        Wait(waitNearby)
        waitNearby = 2000

        for k,v in pairs(ZonesListe) do
            if v.Position == nil then goto continue end
            if v.Dist == nil then v.Dist = 15 end

            local ped = Player.playerPed
            local distance = #(GetEntityCoords(ped)-v.Position)

            if distance > v.Dist then goto continue end

            if not v.Public then 
                if type(v.Job) ~= "table" then v.Job = {} end
                if type(v.Job2) ~= "table" then v.Job2 = {} end
                if type(v.GradesJob) ~= "table" then v.GradesJobs = {} end

                if not v.Job[Player.job.name] and not v.Job2[Player.job2.name] then
                    goto continue 
                end 

                if v.GradesJobRequire then
                    if not v.GradesJob[Player.job.grade_name] then
                        goto continue
                    end
                end
            end
            
            if v.InVehicleDisable then
                if IsPedSittingInAnyVehicle(ped) then
                    goto continue
                end
            end

            waitNearby = 1

            local position = v.Position

            if v.marker ~= nil and not v.marker then
                goto go
            end
            
            DrawMarker(25, position.x, position.y, position.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)

            ::go::

            if distance <= 1.5 then
                DrawInstructionBarNotification(position.x, position.y, position.z, v.ActionText)
                if IsControlJustPressed(1,51) then
                    v.Action()
                end
            end

            ::continue::
        end
    end
end)

function AddZones(ZoneName, data)
    while not ESXLoaded do Wait(1) end
    while not Player.job do Wait(1) end 
    while not Player.job2 do Wait(1) end
    if ZoneName == nil then return end
    
    if ZonesListe[ZoneName] ~= nil then
        ZonesListe[#ZonesListe..ZoneName] = data
    else
        ZonesListe[ZoneName] = data
    end

    if data.Blip.Active then
        if ZonesListe[ZoneName].Job == nil and ZonesListe[ZoneName].Job2 == nil then
            local blip = AddBlipForCoord(data.Blip.Position.x, data.Blip.Position.y, data.Blip.Position.z)
            SetBlipSprite(blip, data.Blip.BlipId)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, data.Blip.Scale)
            SetBlipColour(blip, data.Blip.Color)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(data.Blip.Text)
            EndTextCommandSetBlipName(blip)
        else
            if not ZonesListe[ZoneName].Job[Player.job.name] and not ZonesListe[ZoneName].Job2[Player.job2.name] then
                return
            end 
            local blip = AddBlipForCoord(data.Blip.Position.x, data.Blip.Position.y, data.Blip.Position.z)
            SetBlipSprite(blip, data.Blip.BlipId)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, data.Blip.Scale)
            SetBlipColour(blip, data.Blip.Color)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(data.Blip.Text)
            EndTextCommandSetBlipName(blip)
        end
    end
end

function RemoveZones(ZoneName)
    if ZonesListe[ZoneName] == nil then return end

    ZonesListe[ZoneName] = nil
end

function AddBlips(BlipsName, data)
    while not ESXLoaded do Wait(1) end
    while not Player.job do Wait(1) end 
    while not Player.job2 do Wait(1) end

    if BlipsListe == nil then return end
    
    if BlipsListe[BlipsName] ~= nil then
        BlipsListe[#BlipsName..ZoneName] = data
    else
        BlipsListe[BlipsName] = data
    end

    local blip = AddBlipForCoords(data.Position.x, data.Position.y, data.Position.z)
    if data.Public == true then
        SetBlipSprite(blip, data.BlipId)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, data.Scale)
        SetBlipColour(blip, data.Color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(data.Text)
        EndTextCommandSetBlipName(blip)
    else
        if not data.Jobs[Player.job.name] then return end

        SetBlipSprite(blip, data.BlipId)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, data.Scale)
        SetBlipColour(blip, data.Color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(data.Text)
        EndTextCommandSetBlipName(blip)
    end
end

exports('GetWeaponPerm', function (name)
    return kayscoreConfigServ.PermanantWeapon[name]
end)