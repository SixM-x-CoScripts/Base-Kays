local ESX = nil
local PlayerData = {}

Citizen.CreateThread(function()
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

	while ESX == nil do Citizen.Wait(100) end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setgroup')
AddEventHandler('esx:setgroup', function(job2)
    ESX.PlayerData.job2 = job2
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
     PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)  
	PlayerData.job = job  
	Citizen.Wait(5000) 
end)
----------------------------
----------\/Weed/\----------
----------------------------
Citizen.CreateThread(function()
    while true do
        local interval = 1000
        for _, v in pairs(Config.Weed.WeedRecolte) do
                local playerPos = GetEntityCoords(PlayerPedId())
                local distance = #(playerPos - v)
                if distance <= 10.0 then
                    interval = 0
                    if distance <= 20.0 then
                        RageUI.Text({message = "Appuyez sur ~o~[E]~s~ pour récolter de la weed", time_display = 1})
                        if IsControlJustPressed(0, 51) then
                            OpenWeedRecolte()
                        end
                    end
                end
            end
        Wait(interval)
    end
end)

function OpenWeedRecolte()
    local weedrecolte = RageUI.CreateMenu(Config.Text.recolte, Config.Text.interact)
    
    RageUI.Visible(weedrecolte, not RageUI.Visible(weedrecolte))
    FreezeEntityPosition(PlayerPedId(), true)
    
    while RageUI.Visible(weedrecolte) do
        Wait(0)
        RageUI.IsVisible(weedrecolte, true, false, true, function()
            if not IsPedUsingScenario(PlayerPedId(), "PROP_HUMAN_BUM_BIN") then
                TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
            end

            RageUI.PercentagePanel(Config.Param.load, "Récolte de la weed en cours (~o~" .. math.floor(Config.Param.load * 100) .. "%~s~)", "", "", function(_, _, percent)
                if Config.Param.load < 1.0 then
                    Config.Param.load = Config.Param.load + 0.0020
                else
                    Config.Param.load = 0
                    TriggerServerEvent('netshhh-drugs:weedrecolte')


                    ClearPedTasksImmediately(PlayerPedId())  
                    Wait(500) 
                    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
                end
            end)
        end, function()
        end)
    end
    ClearPedTasksImmediately(PlayerPedId())  
    FreezeEntityPosition(PlayerPedId(), false)
end




Citizen.CreateThread(function()
    while true do
        local interval = 1000
        for _, v in pairs(Config.Weed.WeedTraitement) do
                local playerPos = GetEntityCoords(PlayerPedId())
                local distance = #(playerPos - v)
                if distance <= 10.0 then
                    interval = 0
                    if distance <= 20.0 then
                        RageUI.Text({message = "Appuyez sur ~o~[E]~s~ pour faire des pochons de weed", time_display = 1})
                        if IsControlJustPressed(0, 51) then
                            OpenWeedTraitement()
                        end
                    end
                end
            end
        Wait(interval)
    end
end)

function OpenWeedTraitement()
    local weedtraitement = RageUI.CreateMenu(Config.Text.traitement, Config.Text.interact)

    RageUI.Visible(weedtraitement, not RageUI.Visible(weedtraitement))
        while weedtraitement do
            FreezeEntityPosition(PlayerPedId(), true)
        Wait(0)
        RageUI.IsVisible(weedtraitement, true, false, true, function()
            
            RageUI.PercentagePanel(Config.Param.load, "Traitement de la weed en cours (~o~" .. math.floor(Config.Param.load * 100) .. "%~s~)", "", "", function(_, a_, percent)
                if Config.Param.load < 1.0 then
                    Config.Param.load = Config.Param.load + 0.0020
                else
                    Config.Param.load = 0
                    TriggerServerEvent('netshhh-drugs:weedtraitement')
                end
            end)


        end, function()
        end)
        if not RageUI.Visible(weedtraitement) then
            weedtraitement = RMenu:DeleteType("weedtraitement", true)
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end


Citizen.CreateThread(function()
    while true do
        local interval = 1000
        for _, v in pairs(Config.Weed.WeedVente) do
                local playerPos = GetEntityCoords(PlayerPedId())
                local distance = #(playerPos - v)
                if distance <= 20.0 then
                    interval = 0
                    if distance <= 15.0 then
                        RageUI.Text({message = "Appuyez sur ~o~[E]~s~ pour vendre les pochons de weed", time_display = 1})
                        if IsControlJustPressed(0, 51) then
                            OpenWeedVente()
                        end
                    end
                end
            end
        Wait(interval)
    end
end)

function OpenWeedVente()
    local weedvente = RageUI.CreateMenu(Config.Text.vente, Config.Text.interact)

    RageUI.Visible(weedvente, not RageUI.Visible(weedvente))
        while weedvente do
            FreezeEntityPosition(PlayerPedId(), true)
        Wait(0)
        RageUI.IsVisible(weedvente, true, false, true, function()
            
            RageUI.PercentagePanel(Config.Param.load, "Revente des pochons de weed en cours (~o~" .. math.floor(Config.Param.load * 100) .. "%~s~)", "", "", function(_, a_, percent)
                if Config.Param.load < 1.0 then
                    Config.Param.load = Config.Param.load + 0.0020
                else
                    Config.Param.load = 0
                    TriggerServerEvent('netshhh-drugs:weedvente')
                end
            end)


        end, function()
        end)
        if not RageUI.Visible(weedvente) then
            weedvente = RMenu:DeleteType("weedvente", true)
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

-----------------------------
----------\/Opium/\----------
-----------------------------
Citizen.CreateThread(function()
    while true do
        local interval = 1000
        for _, v in pairs(Config.Opium.OpiumRecolte) do
                local playerPos = GetEntityCoords(PlayerPedId())
                local distance = #(playerPos - v)
                if distance <= 10.0 then
                    interval = 0
                    if distance <= 20.0 then
                        RageUI.Text({message = "Appuyez sur ~o~[E]~s~ pour récolter de l'opium", time_display = 1})
                        if IsControlJustPressed(0, 51) then
                            OpenOpiumRecolte()
                        end
                    end
                end
            end
        Wait(interval)
    end
end)

function OpenOpiumRecolte()
    local opiumrecolte = RageUI.CreateMenu(Config.Text.recolte, Config.Text.interact)

    RageUI.Visible(opiumrecolte, not RageUI.Visible(opiumrecolte))
        while opiumrecolte do
            FreezeEntityPosition(PlayerPedId(), true)
        Wait(0)
        RageUI.IsVisible(opiumrecolte, true, false, true, function()
            
            RageUI.PercentagePanel(Config.Param.load, "Récolte de l'opium en cours (~o~" .. math.floor(Config.Param.load * 100) .. "%~s~)", "", "", function(_, a_, percent)
                if Config.Param.load < 1.0 then
                    Config.Param.load = Config.Param.load + 0.0020
                else
                    Config.Param.load = 0
                    TriggerServerEvent('netshhh-drugs:opiumrecolte')
                end
            end)


        end, function()
        end)
        if not RageUI.Visible(opiumrecolte) then
            opiumrecolte = RMenu:DeleteType("opiumrecolte", true)
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end


Citizen.CreateThread(function()
    while true do
        local interval = 1000
        for _, v in pairs(Config.Opium.OpiumTraitement) do
                local playerPos = GetEntityCoords(PlayerPedId())
                local distance = #(playerPos - v)
                if distance <= 10.0 then
                    interval = 0
                    if distance <= 20.0 then
                        RageUI.Text({message = "Appuyez sur ~o~[E]~s~ pour faire des pochons d'opium", time_display = 1})
                        if IsControlJustPressed(0, 51) then
                            OpenOpiumTraitement()
                        end
                    end
                end
            end
        Wait(interval)
    end
end)

function OpenOpiumTraitement()
    local opiumtraitement = RageUI.CreateMenu(Config.Text.traitement, Config.Text.interact)

    RageUI.Visible(opiumtraitement, not RageUI.Visible(opiumtraitement))
        while opiumtraitement do
            FreezeEntityPosition(PlayerPedId(), true)
        Wait(0)
        RageUI.IsVisible(opiumtraitement, true, false, true, function()
            
            RageUI.PercentagePanel(Config.Param.load, "Traitement de l'opium en cours (~o~" .. math.floor(Config.Param.load * 100) .. "%~s~)", "", "", function(_, a_, percent)
                if Config.Param.load < 1.0 then
                    Config.Param.load = Config.Param.load + 0.0020
                else
                    Config.Param.load = 0
                    TriggerServerEvent('netshhh-drugs:opiumtraitement')
                end
            end)


        end, function()
        end)
        if not RageUI.Visible(opiumtraitement) then
            opiumtraitement = RMenu:DeleteType("opiumtraitement", true)
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end


Citizen.CreateThread(function()
    while true do
        local interval = 1000
        for _, v in pairs(Config.Opium.OpiumVente) do
                local playerPos = GetEntityCoords(PlayerPedId())
                local distance = #(playerPos - v)
                if distance <= 10.0 then
                    interval = 0
                    if distance <= 20.0 then
                        RageUI.Text({message = "Appuyez sur ~o~[E]~s~ pour vendre les pochons d'opium", time_display = 1})
                        if IsControlJustPressed(0, 51) then
                            OpenOpiumVente()
                        end
                    end
                end
            end
        Wait(interval)
    end
end)

function OpenOpiumVente()
    local opiumvente = RageUI.CreateMenu(Config.Text.vente, Config.Text.interact)

    RageUI.Visible(opiumvente, not RageUI.Visible(opiumvente))
        while opiumvente do
            FreezeEntityPosition(PlayerPedId(), true)
        Wait(0)
        RageUI.IsVisible(opiumvente, true, false, true, function()
            
            RageUI.PercentagePanel(Config.Param.load, "Revente des pochons d'opium en cours (~o~" .. math.floor(Config.Param.load * 100) .. "%~s~)", "", "", function(_, a_, percent)
                if Config.Param.load < 1.0 then
                    Config.Param.load = Config.Param.load + 0.0020
                else
                    Config.Param.load = 0
                    TriggerServerEvent('netshhh-drugs:opiumvente')
                end
            end)


        end, function()
        end)
        if not RageUI.Visible(opiumvente) then
            opiumvente = RMenu:DeleteType("opiumvente", true)
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

----------------------------
----------\/Meth/\----------
----------------------------
Citizen.CreateThread(function()
    while true do
        local interval = 1000
        for _, v in pairs(Config.Meth.MethRecolte) do
                local playerPos = GetEntityCoords(PlayerPedId())
                local distance = #(playerPos - v)
                if distance <= 10.0 then
                    interval = 0
                    if distance <= 20.0 then
                        RageUI.Text({message = "Appuyez sur ~o~[E]~s~ pour récolter de la meth", time_display = 1})
                        if IsControlJustPressed(0, 51) then
                            OpenMethRecolte()
                        end
                    end
                end
            end
        Wait(interval)
    end
end)

function OpenMethRecolte()
    local methrecolte = RageUI.CreateMenu(Config.Text.recolte, Config.Text.interact)

    RageUI.Visible(methrecolte, not RageUI.Visible(methrecolte))
        while methrecolte do
            FreezeEntityPosition(PlayerPedId(), true)
        Wait(0)
        RageUI.IsVisible(methrecolte, true, false, true, function()
            
            RageUI.PercentagePanel(Config.Param.load, "Récolte de la meth en cours (~o~" .. math.floor(Config.Param.load * 100) .. "%~s~)", "", "", function(_, a_, percent)
                if Config.Param.load < 1.0 then
                    Config.Param.load = Config.Param.load + 0.0020
                else
                    Config.Param.load = 0
                    TriggerServerEvent('netshhh-drugs:methrecolte')
                end
            end)


        end, function()
        end)
        if not RageUI.Visible(methrecolte) then
            methrecolte = RMenu:DeleteType("methrecolte", true)
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end


Citizen.CreateThread(function()
    while true do
        local interval = 1000
        for _, v in pairs(Config.Meth.MethTraitement) do
                local playerPos = GetEntityCoords(PlayerPedId())
                local distance = #(playerPos - v)
                if distance <= 10.0 then
                    interval = 0
                    if distance <= 20.0 then
                        RageUI.Text({message = "Appuyez sur ~o~[E]~s~ pour faire des pochons de meth", time_display = 1})
                        if IsControlJustPressed(0, 51) then
                            OpenMethTraitement()
                        end
                    end
                end
            end
        Wait(interval)
    end
end)

function OpenMethTraitement()
    local methtraitement = RageUI.CreateMenu(Config.Text.traitement, Config.Text.interact)

    RageUI.Visible(methtraitement, not RageUI.Visible(methtraitement))
        while methtraitement do
            FreezeEntityPosition(PlayerPedId(), true)
        Wait(0)
        RageUI.IsVisible(methtraitement, true, false, true, function()
            
            RageUI.PercentagePanel(Config.Param.load, "Traitement de la meth en cours (~o~" .. math.floor(Config.Param.load * 100) .. "%~s~)", "", "", function(_, a_, percent)
                if Config.Param.load < 1.0 then
                    Config.Param.load = Config.Param.load + 0.0020
                else
                    Config.Param.load = 0
                    TriggerServerEvent('netshhh-drugs:methtraitement')
                end
            end)


        end, function()
        end)
        if not RageUI.Visible(methtraitement) then
            methtraitement = RMenu:DeleteType("methtraitement", true)
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end


Citizen.CreateThread(function()
    while true do
        local interval = 1000
        for _, v in pairs(Config.Meth.MethVente) do
                local playerPos = GetEntityCoords(PlayerPedId())
                local distance = #(playerPos - v)
                if distance <= 10.0 then
                    interval = 0
                    if distance <= 20.0 then
                        RageUI.Text({message = "Appuyez sur ~o~[E]~s~ pour vendre les pochons de meth", time_display = 1})
                        if IsControlJustPressed(0, 51) then
                            OpenMethVente()
                        end
                    end
                end
            end
        Wait(interval)
    end
end)

function OpenMethVente()
    local methvente = RageUI.CreateMenu(Config.Text.vente, Config.Text.interact)

    RageUI.Visible(methvente, not RageUI.Visible(methvente))
        while methvente do
            FreezeEntityPosition(PlayerPedId(), true)
        Wait(0)
        RageUI.IsVisible(methvente, true, false, true, function()
            
            RageUI.PercentagePanel(Config.Param.load, "Revente des pochons de meth en cours (~o~" .. math.floor(Config.Param.load * 100) .. "%~s~)", "", "", function(_, a_, percent)
                if Config.Param.load < 1.0 then
                    Config.Param.load = Config.Param.load + 0.0020
                else
                    Config.Param.load = 0
                    TriggerServerEvent('netshhh-drugs:methvente')
                end
            end)


        end, function()
        end)
        if not RageUI.Visible(methvente) then
            methvente = RMenu:DeleteType("methvente", true)
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end