local PlayerGender = nil
local IsPlaying = false

RegisterCommand(kayscoreConfigServ.PileOuFace.Command,function(source, args)
    if IsPlaying then
        return
    end
    IsPlaying = true

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(PlayerPedId())

    TriggerEvent('skinchanger:getSkin', function(skin)
        PlayerGender = skin.sex == 0 and 'male' or 'female'
    end)

    local animDict2 = PlayerGender == 'male' and 'anim@mp_player_intcelebrationmale@coin_roll_and_toss' or 'anim@mp_player_intcelebrationfemale@coin_roll_and_toss'
    local animDict1 = 'anim@mp_player_intuppercoin_roll_and_toss'

    local coinModel = `vw_prop_vw_coin_01a`

    ESX.Streaming.RequestAnimDict(animDict1)
    ESX.Streaming.RequestAnimDict(animDict2)
    ESX.Streaming.RequestModel(coinModel)

    local coin = CreateObject(coinModel, playerCoords.x, playerCoords.y, playerCoords.z, true, false, false)
    SetEntityAsNoLongerNeeded(coin)

    AttachEntityToEntity(coin, playerPed, GetPedBoneIndex(playerPed,28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 1, 2, 1)
    TaskPlayAnim(playerPed, animDict1, 'enter', 8.0, 8.0, -1, 0, 0, false, false, false)
    Citizen.Wait(4100)

    TaskPlayAnim(playerPed, animDict1, 'idle_a', 8.0, 0.5, -1, 0, 0, false, false, false)
    Citizen.Wait(2000)

    TaskPlayAnim(playerPed, animDict2, 'coin_roll_and_toss', 20.0, 4.0, -1, 0, 0, false, false, false)
    Citizen.Wait(2500)

    local boneCoords = GetPedBoneCoords(playerPed, 28422, 0.0, 0.0, 0.0)
    local nearbyPlayers = ESX.Game.GetClosestPlayerInRadius(GetEntityCoords(PlayerPedId()), 20.0)
    TriggerServerEvent('tossCoinServer', nearbyPlayers, boneCoords)

    if PlayerGender == 'male' then
        Citizen.Wait(500)
    end

    TaskPlayAnim(playerPed, animDict1, 'exit', 4.0, 8.0, -1, 0, 0, false, false, false)
    Citizen.Wait((GetAnimDuration(animDict1, 'exit')*1000))

    SetModelAsNoLongerNeeded(coinModel)
    RemoveAnimDict(animDict1)
    RemoveAnimDict(animDict2)
    ESX.Game.DeleteEntity(coin)
    IsPlaying = false
end,false)

RegisterNetEvent('tossCoinClient', function(result, coords)
    if not ESXLoaded then return end
    local text = result == 1 and kayscoreConfigServ.PileOuFace.TextPile or kayscoreConfigServ.PileOuFace.TextFace
    local timeout = GetGameTimer() + 2000

    while GetGameTimer() < timeout do
        local vectorCoords = vector3(coords.x, coords.y, coords.z)
        ESX.Game.Utils.DrawText3D(vectorCoords, text, 0.75, 4)
        Citizen.Wait(0)
    end
end)
