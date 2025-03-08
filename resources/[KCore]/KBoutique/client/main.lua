if Boutique.Framework == "esx" then
    ESX = nil
    Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent(Boutique.getSharedObject, function(obj) ESX = obj end)
            Citizen.Wait(500)
        end
    end)
elseif Boutique.Framework == "newEsx" then 
    ESX = exports[Boutique.Extended_Name]:getSharedObject()
end

RegisterNUICallback("boutique:testVehicle", function(data, cb)

    local isInSafeZone = exports.kayscore:inSafeZone()

    if not isInSafeZone then
        Notify("Vous devez être en SafeZone pour tester un véhicule.")
        cb(false)
        return
    end

    local player = PlayerId()
    local ped = PlayerPedId()
    local testBucket = GetPlayerServerId(player)
    TriggerServerEvent("boutique:setPlayerBucket", testBucket)

    NetworkSetEntityInvisibleToNetwork(ped, true)
    SetEntityVisible(ped, true)

    state = false
    SetNuiFocus(state, state)
    SendNUIMessage({type = "toggleState", state = state})

    posessaie = GetEntityCoords(ped)

    local car = GetHashKey(data.model)
    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local vehicle = CreateVehicle(car, Boutique.TestVeh.PositionStart, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetPedIntoVehicle(ped, vehicle, -1)
    SetVehicleDoorsLocked(vehicle, 4)

    Notify(Boutique.TestVeh.NotificationsStart)

    local timer = Boutique.TestVeh.Timer
    local breakable = false
    while not breakable do
        Wait(1000)
        timer = timer - 1

        for i, notify in ipairs(Boutique.TestVeh.Notifications) do
            if timer == notify.time then
                Notify(notify.message)
            end
        end

        if timer <= 0 then
            DeleteEntity(vehicle)
            SetEntityCoords(ped, posessaie)
            breakable = true
            break
        end
    end

    TriggerServerEvent("boutique:setPlayerBucket", 0) 
    NetworkSetEntityInvisibleToNetwork(ped, false)
    SetEntityVisible(ped, true)

    state = true
    SetNuiFocus(state, state)
    SendNUIMessage({type = "toggleState", state = state})

    cb(true)
end)

RegisterNUICallback("boutique:buyVehicle", function(data, cb)
    Notify(Boutique.Notifications.BuyVeh.." "..data.label)
    TriggerServerEvent("Boutique:Rewards", "vehicle", {model = data.model, coins = data.coins})
    cb(true)
end)

RegisterNUICallback("boutique:buyWeapon", function(data, cb)
    Notify(Boutique.Notifications.BuyWeapon.." "..data.label)
    TriggerServerEvent("Boutique:Rewards", "weapon", {name = data.name, coins = data.coins})
    cb(true)
end)

RegisterNUICallback("boutique:buyMoney", function(data, cb)
    Notify(Boutique.Notifications.BuyMoney.." "..data.label)
    TriggerServerEvent("Boutique:Rewards", "money", {count = data.count, coins = data.coins})
    cb(true)
end)

RegisterNUICallback("boutique:giveCoins", function(data, cb)
    TriggerServerEvent("Boutique:giveCoins", data.count, data.storeCode)
    cb(true)
end)

--RegisterNUICallback("boutique:useCodePromo", function(data, cb)
--    print(json.encode(data))
--    cb(true)
--end)

RegisterNUICallback("boutique:buyCase", function(data, cb)

    TriggerServerEvent("DeleteCredits", GetPlayerServerId(PlayerId()), data.caseCoins)

    print(json.encode(data))
    cb(true)
end)

RegisterNUICallback("boutique:winCase", function(data, cb)

    print(data.gain.type)

    if data.sell then 
        TriggerServerEvent("Boutique:Rewards", "coins", {count = data.gain.sell, coins = 0, selling = true})
    else
        if data.gain.type == "Vehicle" then 
            TriggerServerEvent("Boutique:Rewards", "vehicle", {model = data.gain.item, coins = 0, lootbox = true})
        elseif data.gain.type == "item" then 
            print('ici Client')
            TriggerServerEvent("Boutique:Rewards", "item", {name = data.gain.item, coins = 0, lootbox = true})
        elseif data.gain.type == "Money" then 
            TriggerServerEvent("Boutique:Rewards", "money", {count = data.gain.item, coins = 0, lootbox = true})
        elseif data.gain.type == "Coin" then 
            TriggerServerEvent("Boutique:Rewards", "coins", {count = data.gain.item, coins = 0, lootbox = true})
        -- elseif data.gain.type == "weapon" then
        --     TriggerServerEvent("Boutique:Rewards", "weapon", {name = data.gain.item, coins = 0, lootbox = true})
        end
    end

    cb(true)
end)

local state = false
RegisterNUICallback("boutique:hide", function(data, cb)
    state = false
    SetNuiFocus(state, state)
    cb(true)
end)

RegisterKeyMapping(Boutique.CmdName, Boutique.DescKeyParameter, Boutique.defaultMapper, Boutique.KeyOpen)

RegisterCommand(Boutique.CmdName, function()
    state = not state

    if (state) then
        TriggerServerEvent("GetCodeBoutique")
        TriggerServerEvent("GetPlayerCredits")
        SendNUIMessage({type = "setBoutiqueName", name = Boutique.Name})
        SendNUIMessage({type = "setVehicles", vehicles = Boutique.Vehicles})
        SendNUIMessage({type = "setWeapons", weapons = Boutique.Weapons})
        SendNUIMessage({type = "setMoney", money = Boutique.Money})
        SendNUIMessage({type = "setTebex", tebex = Boutique.Tebex})
        SendNUIMessage({type = "setCases", cases = Boutique.Cases})
    end

    SendNUIMessage({type = "toggleState", state = state})
    SetNuiFocus(state, state)
end)

RegisterNetEvent("ReceiveBoutiqueId")
AddEventHandler("ReceiveBoutiqueId", function(id)
    SendNUIMessage({type = "setStoreCode", storeCode = id})
end)

RegisterNetEvent("ReceivePlayerCredit")
AddEventHandler("ReceivePlayerCredit", function(coins)
    SendNUIMessage({type = "setCoins", coins = coins})
end)

RegisterNetEvent("b:Notify")
AddEventHandler("b:Notify", function(notify)
    Notify(notify)
end)