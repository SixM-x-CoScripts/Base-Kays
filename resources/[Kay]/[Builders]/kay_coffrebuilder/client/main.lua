ESX = nil
serverInterrac = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config.option.esxGetter, function(obj) ESX = obj end)
        Citizen.Wait(10)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    while ESX.GetPlayerData().job2 == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()

    TriggerServerEvent("vCoffre:loadCoffre")

    initCoffre()
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
    ESX.PlayerData.job = job
    initCoffre()
end)

RegisterNetEvent("esx:setgroup")
AddEventHandler("esx:setgroup", function(job2)
    ESX.PlayerData.job2 = job2
    initCoffre()
end)

RegisterNetEvent("vCoffre:openMenu")
AddEventHandler("vCoffre:openMenu", function()
    if openCreateCoffre then return end
    openCoffreCreator()
end)

RegisterNetEvent("vCoffre:serverInterract")
AddEventHandler("vCoffre:serverInterract", function(information)
    serverInterrac = false
    ESX.ShowNotification(information)
end)

Keys.Register("f9", "f9", "Menu Création Coffre", function()
    TriggerServerEvent("vCoffre:openMenuCheck")
end)

