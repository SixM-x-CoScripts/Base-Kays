local inShopRobberyZone = false
local currentShopRobbery = nil
local peds = {}
local inRobbery = false
local canRob = nil

local ScreenCoords = { baseX = 0.918, baseY = 0.984, titleOffsetX = 0.012, titleOffsetY = -0.009, valueOffsetX = 0.0785, valueOffsetY = -0.0165, pbarOffsetX = 0.047, pbarOffsetY = 0.0015 }
local Sizes = { timerBarWidth = 0.165, timerBarHeight = 0.035, timerBarMargin = 0.038, pbarWidth = 0.0616, pbarHeight = 0.0105 }

local textColor = { 200, 100, 100 }
local activeBars = {}

local function createPed (model, pos, heading)
    local ped = ESX.Game.SpawnLocalPedAsync(4, model, pos, heading)
    SetEntityAsMissionEntity(ped, true, true)
    SetPedHearingRange(ped, 0.0)
    SetPedSeeingRange(ped, 0.0)
    SetPedAlertness(ped, 0.0)
    SetPedFleeAttributes(ped, 0, false)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedCombatAttributes(ped, 46, true)
    SetPedFleeAttributes(ped, 0, false)

    return ped
end

local function AddTimerBar (title, itemData)
    if not itemData then return end
    ESX.Streaming.RequestStreamedTextureDict("timerbars")

    local barIndex = #activeBars + 1
    activeBars[barIndex] = {
        title = title,
        text = itemData.text,
        textColor = itemData.color or { 255, 255, 255, 255 },
        percentage = itemData.percentage,
        endTime = itemData.endTime,
        pbarBgColor = itemData.bg or { 155, 155, 155, 255 },
        pbarFgColor = itemData.fg or { 255, 255, 255, 255 }
    }

    return barIndex
end

local function RemoveTimerBar ()
    activeBars = {}
    SetStreamedTextureDictAsNoLongerNeeded("timerbars")
end

local function UpdateTimerBar (barIndex, itemData)
    if not activeBars[barIndex] or not itemData then return end

    for k,v in pairs(itemData) do
        activeBars[barIndex][k] = v
    end
end

local function AddLongString (txt)
    local maxLen = 100
    for i = 0, string.len(txt), maxLen do
        local sub = string.sub(txt, i, math.min(i + maxLen, string.len(txt)))
        AddTextComponentString(sub)
    end
end

local function DrawText2 (intFont, strText, floatScale, intPosX, intPosY, color, boolShadow, intAlign, addWarp)
    SetTextFont(intFont)
    SetTextScale(floatScale, floatScale)

    if boolShadow then
        SetTextDropShadow(0, 0, 0, 0, 0)
        SetTextEdge(0, 0, 0, 0, 0)
    end

    SetTextColour(color[1], color[2], color[3], 255)

    if intAlign == 0 then
        SetTextCentre(true)
    else
        SetTextJustification(intAlign or 1)
        if intAlign == 2 then
            SetTextWrap(.0, addWarp or intPosX)
        end
    end

    SetTextEntry("jamyfafi")
    AddLongString(strText)
    DrawText(intPosX, intPosY)
end

local function SecondsToClock (seconds)
    seconds = tonumber(seconds)

    if seconds <= 0 then
        return "00:00"
    else
        mins = string.format("%02.f", math.floor(seconds / 60))
        secs = string.format("%02.f", math.floor(seconds - mins * 60))
        return string.format("%s:%s", mins, secs)
    end
end

local function DrawText3DDDDDDDDDD (B6zKxgVs, O3_X, DVs8kf2w, vms5, M7, v3)
    local ihKb = M7 or 7
    local JGSK, rA5U, Uc06 = table.unpack(GetGameplayCamCoords())
    M7 = GetDistanceBetweenCoords(JGSK, rA5U, Uc06, B6zKxgVs, O3_X, DVs8kf2w, 1)
    local lcBL = GetDistanceBetweenCoords(Player.coords, B6zKxgVs, O3_X, DVs8kf2w, 1) - 1.65
    local DHPxI, dx = ((1 / M7) * (ihKb * .7)) * (1 / GetGameplayCamFov()) * 100, 255;
    if lcBL < ihKb then
        dx = math.floor(255 * ((ihKb - lcBL) / ihKb))
    elseif lcBL >= ihKb then
        dx = 0
    end
    dx = v3 or dx
    SetTextFont(0)
    SetTextScale(.0 * DHPxI, .1 * DHPxI)
    SetTextColour(255, 255, 255, math.max(0, math.min(255, dx)))
    SetTextCentre(1)
    SetDrawOrigin(B6zKxgVs, O3_X, DVs8kf2w, 0)
    SetTextEntry("STRING")
    AddTextComponentString(vms5)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

local function ApuShootPlayer (ped)
    local pPed = Player.playerPed
    PlayAmbientSpeechWithVoice(ped, "SHOP_SCARED_START","MP_M_SHOPKEEP_01_PAKISTANI_MINI_01", "SPEECH_PARAMS_FORCE", 1)
    GiveWeaponToPed(ped, GetHashKey("weapon_pistol"), 0, 1, 1)
    TaskAimGunAtEntity(ped, pPed, 2000, false)
    Wait(2000)
    TaskShootAtEntity(ped, pPed, 6000, -957453492)
    Citizen.Wait(6500)
    RemoveAllPedWeapons(ped, 1)
    ClearPedTasks(ped)
end

Citizen.CreateThread(function()
    while true do
        if #activeBars > 0 then
            Citizen.Wait(0)
        else
            Citizen.Wait(500)
        end

        local safeZone = GetSafeZoneSize()
        local safeZoneX = (1.0 - safeZone) * 0.5
        local safeZoneY = (1.0 - safeZone) * 0.5

        if #activeBars > 0 then
            HideHudComponentThisFrame(6)
            HideHudComponentThisFrame(7)
            HideHudComponentThisFrame(8)
            HideHudComponentThisFrame(9)

            for i,v in pairs(activeBars) do
                local drawY = (ScreenCoords.baseY - safeZoneY) - (i * Sizes.timerBarMargin);
                DrawSprite("timerbars", "all_black_bg", ScreenCoords.baseX - safeZoneX, drawY, Sizes.timerBarWidth, Sizes.timerBarHeight, 0.0, 255, 255, 255, 160)
                DrawText2(0, v.title, 0.3, (ScreenCoords.baseX - safeZoneX) + ScreenCoords.titleOffsetX, drawY + ScreenCoords.titleOffsetY, v.textColor, false, 2)

                if v.percentage then
                    local pbarX = (ScreenCoords.baseX - safeZoneX) + ScreenCoords.pbarOffsetX;
                    local pbarY = drawY + ScreenCoords.pbarOffsetY;
                    local width = Sizes.pbarWidth * v.percentage;
                    DrawRect(pbarX, pbarY, Sizes.pbarWidth, Sizes.pbarHeight, v.pbarBgColor[1], v.pbarBgColor[2], v.pbarBgColor[3], v.pbarBgColor[4])
                    DrawRect((pbarX - Sizes.pbarWidth / 2) + width / 2, pbarY, width, Sizes.pbarHeight, v.pbarFgColor[1], v.pbarFgColor[2], v.pbarFgColor[3], v.pbarFgColor[4])
                elseif v.text then
                    DrawText2(0, v.text, 0.425, (ScreenCoords.baseX - safeZoneX) + ScreenCoords.valueOffsetX, drawY + ScreenCoords.valueOffsetY, v.textColor, false, 2)
                elseif v.endTime then
                    local remainingTime = math.floor(v.endTime - GetGameTimer())
                    DrawText2(0, SecondsToClock(remainingTime / 1000), 0.425, (ScreenCoords.baseX - safeZoneX) + ScreenCoords.valueOffsetX, drawY + ScreenCoords.valueOffsetY, remainingTime <= 0 and textColor or v.textColor, false, 2)
                end
            end
        end
    end
end)

Citizen.CreateThread(function ()
    while true do
        if inShopRobberyZone == true then
            Citizen.Wait(0)
        else
            Citizen.Wait(2500)
        end

        local player = PlayerPedId()

        if inShopRobberyZone == true and currentShopRobbery ~= nil and peds[currentShopRobbery] ~= nil then
            if IsPedArmed(player, 5) or IsPedArmed(player, 1) then
                if IsPlayerFreeAiming(PlayerId()) or IsPedInMeleeCombat(player) then
                    local ped = peds[currentShopRobbery]
                    if HasEntityClearLosToEntityInFront(player, ped) and not IsPedDeadOrDying(ped, true) and #(GetEntityCoords(player) - GetEntityCoords(ped)) <= 5.0 and canRob ~= true then

                        while inRobbery == true do Citizen.Wait(2500) end

                        ESX.TriggerServerCallback("shopRobbery:canRob", function (callback)
                            canRob = callback
                        end, currentShopRobbery)

                        while canRob == nil do Citizen.Wait(0) end

                        if canRob == "rob_already" then
                            ESX.ShowNotification("~r~Il y a déjà un braquage en cours")
                        end

                        if canRob == "not_enough_cops" then
                            ESX.ShowNotification("~r~Il n'y a pas assez de policier en ville")
                        end

                        if canRob == "in_rob" then
                            ESX.ShowNotification("~r~Cette supérette est déjà en train de se faire braquer")
                        end

                        if canRob == "already_rob_today" then
                            ESX.ShowNotification("~r~Tu as déjà braqué une supérette aujourd'hui, reviens demain")
                        end

                        if canRob ~= true then
                            Citizen.Wait(15000)
                            canRob = nil
                        end

                        if canRob == true then
                            local chance = math.random(0, 99)
                            if chance >= 0 and chance <= 25 then
                                ApuShootPlayer(peds[currentShopRobbery])
                                ESX.ShowNotification('PAS DE CHANCE')
                            else
                                secured_TriggerServerEvent("shopRobbery:start", currentShopRobbery)
                            end
                        end
                    end
                end
            end
        end
    end
end)

AddEventHandler("onClientResourceStart", function (resourceName)
    if GetCurrentResourceName() ~= resourceName then return end

    while ESX == nil do Citizen.Wait(0) end

    for k, v in pairs(CONFIG_SHOP_ROBBERY.Shops) do
        local ped = createPed(v.model, v.pedPos, v.heading)
        peds[tonumber(k)] = ped
    end
end)

AddEventHandler("onResourceStop", function (resourceName)
    if GetCurrentResourceName() ~= resourceName then return end

    for _, v in pairs(peds) do
        if DoesEntityExist(v) then
            DeletePed(v)
        end
    end
end)

CreateThread(function()
    while true do
        Wait(1000)

        if inShopRobberyZone == false then
            for k,v in pairs(CONFIG_SHOP_ROBBERY.Shops) do
                if #(Player.coords-vector3(v.pos.x, v.pos.y, v.pos.z)) <= 5 then
                    inShopRobberyZone = true

                    currentShopRobbery = k
                end
            end
        end
    end
end)

RegisterNetEvent("shopRobbery:enter", function (marker)
    inShopRobberyZone = true
    currentShopRobbery = marker.args.id
end)

secured_RegisterNetEvent("shopRobbery:exit", function (marker)
    local ped = peds[currentShopRobbery]
    if ped ~= nil then
        ClearPedTasksImmediately(ped)
    end

    secured_TriggerServerEvent("shopRobbery:cancelRobbery", currentShopRobbery)

    inShopRobberyZone = false
    currentShopRobbery = nil

    if inRobbery == true then
        ESX.ShowNotification("~r~Vous vous êtes trop éloigné, APU s'est caché et a fermé la caisse")
    end

    inRobbery = false
    canRob = nil
    SetFakeWantedLevel(0)
    RemoveTimerBar()
    ReleaseScriptAudioBank("Alarms")
end)

RegisterNetEvent("shopRobbery:respawnPed", function (shopID)
    local pedData = CONFIG_SHOP_ROBBERY.Shops[shopID]
    if pedData == nil then return end

    local ped = peds[shopID]
    if DoesEntityExist(ped) then
        DeletePed(ped)
    end

    local newPed = createPed(pedData.model, pedData.pedPos, pedData.heading)
    peds[shopID] = newPed
    canRob = nil
    SetFakeWantedLevel(0)
end)

secured_RegisterNetEvent("shopRobbery:start", function (shopID)
    local player = PlayerPedId()
    local ped = peds[shopID]
    local soundID = GetSoundId()
    local pedCoords = GetEntityCoords(ped)
    local shop = CONFIG_SHOP_ROBBERY.Shops[shopID]
    local street = GetStreetNameFromHashKey(GetStreetNameAtCoord(shop.pos.x, shop.pos.y, shop.pos.z))
    local bar = AddTimerBar("Menace :", { percentage = 0.0, bg = { 100, 0, 0, 255 }, fg = { 200, 0, 0, 255 } })
    local bag = nil
    local scared = 0

    RequestScriptAudioBank("Alams")
    PlaySoundFromCoord(soundID, "Burglar_Bell", pedCoords.x, pedCoords.y, pedCoords.z, "Generic_Alarms", true, 15.0, false)
    PlaySoundFrontend(soundID, "Object_Dropped_Remote", "GTAO_FM_Events_Soundset", false)
    ActivatePhysics(ped)
    PlayPedAmbientSpeechWithVoiceNative(ped, "SHOP_HURRYING", "MP_M_SHOPKEEP_01_PAKISTANI_MINI_01", "SPEECH_PARAMS_FORCE", true)
    SetFakeWantedLevel(2)

    inRobbery = true

    Citizen.CreateThread(function ()
        while inRobbery do
            Citizen.Wait(0)

            if IsPedDeadOrDying(ped) then
                inRobbery = false
                ESX.ShowNotification("~r~Apu est mort, il ne peut plus vous fournir la recette du jour")
                secured_TriggerServerEvent("shopRobbery:cancelRobbery", shopID)
            end

            if not IsPedArmed(player, 5) then   
                ESX.ShowNotification("~r~Vous avez rangé votre arme, Apu s'est caché et a fermé la caisse")
                inRobbery = false
                secured_TriggerServerEvent("shopRobbery:cancelRobbery", shopID)
            end

            if bag ~= nil and DoesEntityExist(bag) and #(GetEntityCoords(player) - GetEntityCoords(bag)) > 15.0 then
                DeleteObject(bag)
            end
        end
    end)

    Citizen.CreateThread(function ()
        secured_TriggerServerEvent("shopRobbery:callPolice", street, shopID)

        ESX.Streaming.RequestAnimDict("missheist_agency2ahands_up")
        TaskPlayAnim(ped, "missheist_agency2ahands_up", "handsup_anxious", 8.0, -8.0, -1, 1, 0, false, false, false)
        SetEntityAnimSpeed(ped, "missheist_agency2ahands_up", "handsup_anxious", 1.0)

        if IsPedArmed(player, 5) then
            SetEntityAnimSpeed(ped, "missheist_agency2ahands_up", "handsup_anxious", 1.3)
        end

        while scared < 50 do
            Citizen.Wait(750)
            UpdateTimerBar(bar, { percentage = scared / 50 })
            scared = scared + 1
        end

        ESX.Streaming.RequestAnimDict("mp_am_hold_up")
        TaskPlayAnim(ped, "mp_am_hold_up", "holdup_victim_20s", 8.0, -8.0, -1, 2, 0, false, false, false)
        RemoveAnimDict("mp_am_hold_up")

        PlayPedAmbientSpeechWithVoiceNative(ped, "SHOP_HURRYING", "MP_M_SHOPKEEP_01_PAKISTANI_MINI_01", "SPEECH_PARAMS_FORCE", true)

        while not IsEntityPlayingAnim(ped, "mp_am_hold_up", "holdup_victim_20s", 3) do Citizen.Wait(0) end

        Citizen.Wait(10800)

        local cashRegister = GetClosestObjectOfType(pedCoords.x, pedCoords.y, pedCoords.z, 5.0, GetHashKey("prop_till_01"))
        if DoesEntityExist(cashRegister) then
            local cashRegisterPos = GetEntityCoords(cashRegister)
            CreateModelSwap(cashRegisterPos.x, cashRegisterPos.y, cashRegisterPos.z, 0.5, GetHashKey("prop_till_01"), GetHashKey("prop_till_01_dam"), false)
            PlayPedAmbientSpeechWithVoiceNative(ped, "BUMP", "A_F_M_BEACH_01_WHITE_FULL_01", "SPEECH_PARAMS_FORCE", true)
        end

        Citizen.Wait(200)

        ESX.Streaming.RequestModel("prop_poly_bag_01")
        bag = CreateObject("prop_poly_bag_01", pedCoords, false)
        while not DoesEntityExist(bag) do Citizen.Wait(0) end

        AttachEntityToEntity(bag, ped, GetPedBoneIndex(ped, 60309), 0.1, -0.11, 0.08, 0.0, -75.0, -75.0, true, true, false, false, 2, true)
        Citizen.Wait(10000)

        DetachEntity(bag, true, false)
        SetEntityHeading(bag, CONFIG_SHOP_ROBBERY.Shops[shopID].heading)
        ApplyForceToEntity(bag, 3, 0.0, 50.0, 0.0, 0.0, 0.0, 0.0, 0, true, true, false, false, true)

        while inRobbery do
            local bagPos = GetEntityCoords(bag)
            if #(GetEntityCoords(player) - bagPos) <= 1.5 then
                DrawText3DDDDDDDDDD(bagPos.x, bagPos.y, bagPos.z, "Appuyez sur ~p~E~s~ pour ~p~ramasser le sac~s~", 12)

                if IsControlJustPressed(0, 51) then
                    ESX.ShowNotification('~r~+15000$~s~')
                    ESX.Streaming.RequestAnimDict("random@domestic")
                    TaskPlayAnim(player, "random@domestic", "pickup_low", 8.0, -8.0, -1, 0, 1, 0, 0, 0)

                    Citizen.Wait(1000)

                    PlaySoundFrontend(-1, "Bus_Schedule_Pickup", "DLC_PRISON_BREAK_HEIST_SOUNDS", false)

                    RemoveTimerBar()
                    StopSound(GetSoundId())
                    ReleaseScriptAudioBank("Alarms")
                    SetFakeWantedLevel(0)
                    DeleteObject(bag)

                    secured_TriggerServerEvent("shopRobbery:endRobbery", shopID)
                    inRobbery = false
                end
            end

            Citizen.Wait(0)
        end
    end)
end)

secured_RegisterNetEvent('police:fastCallCoords', function(x, y, z)
    SetNewWaypoint(x, y)
    local blipRenfort = AddBlipForCoord(x, y, z)
    SetBlipSprite(blipRenfort, 161)
    SetBlipScale(blipRenfort, 2.0)
    SetBlipColour(blipRenfort,1)

    PulseBlip(blipRenfort)

    CreateThread(function()
        Wait(3 * 60000)
        if DoesBlipExist(blipRenfort) then
            RemoveBlip(blipRenfort)
        end
    end)
end)