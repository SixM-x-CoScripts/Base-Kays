local isRequestAnim = false
local requestedemote = ''

RegisterNetEvent("SyncPlayEmote")
AddEventHandler("SyncPlayEmote", function(emote, player)
    EmoteCancel()
    Wait(300)
    if Animation.Shared[emote] ~= nil then
      if OnEmotePlay(Animation.Shared[emote]) then end return
    elseif Animation.Dances[emote] ~= nil then
      if OnEmotePlay(Animation.Dances[emote]) then end return
    end
end)

RegisterNetEvent("SyncPlayEmoteSource")
AddEventHandler("SyncPlayEmoteSource", function(emote, player)
    local pedInFront = GetPlayerPed(GetClosestPlayer())
    local heading = GetEntityHeading(pedInFront)
    local coords = GetOffsetFromEntityInWorldCoords(pedInFront, 0.0, 1.0, 0.0)
    if (Animation.Shared[emote]) and (Animation.Shared[emote].AnimationOptions) then
        local SyncOffsetFront = Animation.Shared[emote].AnimationOptions.SyncOffsetFront
        if SyncOffsetFront then
            coords = GetOffsetFromEntityInWorldCoords(pedInFront, 0.0, SyncOffsetFront, 0.0)
        end
    end
    SetEntityHeading(PlayerPedId(), heading - 180.1)
    SetEntityCoordsNoOffset(PlayerPedId(), coords.x, coords.y, coords.z, 0)
    EmoteCancel()
    Wait(300)
    if Animation.Shared[emote] ~= nil then
        if OnEmotePlay(Animation.Shared[emote]) then end return
    elseif Animation.Dances[emote] ~= nil then
        if OnEmotePlay(Animation.Dances[emote]) then end return
    end
end)

RegisterNetEvent("ClientEmoteRequestReceive")
AddEventHandler("ClientEmoteRequestReceive", function(emotename, etype)
    isRequestAnim = true
    requestedemote = emotename

    if etype == 'Dances' then
        _,_,remote = table.unpack(Animation.Dances[emotename])
    else
        _,_,remote = table.unpack(Animation.Shared[emotename])
    end

    PlaySound(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 0, 0, 1)
    ESX.ShowNotification("~b~Une personne souhaite faire une animation avec vous : "..remote)
    ESX.ShowNotification("~b~Appuyez sur Y pour accepter et N pour refuser.")
end)

Citizen.CreateThread(function()
    while true do
        if isRequestAnim then
            Wait(1)
            if IsControlJustPressed(1, 246) then
            target, distance = GetClosestPlayer()
                if(distance ~= -1 and distance < 3) then
                    if Animation.Shared[requestedemote] ~= nil then
                        _,_,_,otheremote = table.unpack(Animation.Shared[requestedemote])
                    elseif Animation.Dances[requestedemote] ~= nil then
                        _,_,_,otheremote = table.unpack(Animation.Dances[requestedemote])
                    end
                    if otheremote == nil then 
                        otheremote = requestedemote 
                    end
                    TriggerServerEvent("ServerValidEmote", GetPlayerServerId(target), requestedemote, otheremote)
                    isRequestAnim = false
                else
                    ESX.ShowNotification("~r~Il n'y a personne à proximité.")
                end
            elseif IsControlJustPressed(1, 182) and isRequestAnim then
                ESX.ShowNotification("~r~L'individu à refusé votre demande.")
                isRequestAnim = false
            end
        else
            Wait(1250)
        end
    end
end)

function GetPlayerFromPed(ped)
    for _,player in ipairs(GetActivePlayers()) do
        if GetPlayerPed(player) == ped then
            return player
        end
    end
    return -1
end

function GetPedInFront()
    local player = PlayerId()
    local plyPed = GetPlayerPed(player)
    local plyPos = GetEntityCoords(plyPed, false)
    local plyOffset = GetOffsetFromEntityInWorldCoords(plyPed, 0.0, 1.3, 0.0)
    local rayHandle = StartShapeTestCapsule(plyPos.x, plyPos.y, plyPos.z, plyOffset.x, plyOffset.y, plyOffset.z, 10.0, 12, plyPed, 7)
    local _, _, _, _, ped2 = GetShapeTestResult(rayHandle)
    return ped2
end

function MearbysOnCommand(source, args, raw)
  local NearbysCommand = ""
  for a in pairsByKeys(Animation.Shared) do
    NearbysCommand = NearbysCommand .. ""..a..", "
  end
  EmoteChatMessage(NearbysCommand)
  EmoteChatMessage(Config.Languages[lang]['emotemenucmd'])
end

function GetClosestPlayer()
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply, 0)

    for index,value in ipairs(players) do
        local target = GetPlayerPed(value)
        if(target ~= ply) then
            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
            local distance = GetDistanceBetweenCoords(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
            if(closestDistance == -1 or closestDistance > distance) then
                closestPlayer = value
                closestDistance = distance
            end
        end
    end
    return closestPlayer, closestDistance
end

function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end