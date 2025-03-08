
local open = false
local isCrafting = false
local mainMenu = RageUI.CreateMenu('', 'Craft des items')
mainMenu.Closed = function()
    open = false
    isCrafting = false
end

function OpenCraftMenu()
    if open then
        open = false
        RageUI.Visible(mainMenu, false)
        return
    else
        open = true
        RageUI.Visible(mainMenu, true)
        Citizen.CreateThread(function()
            while open do
                RageUI.IsVisible(mainMenu, function()
                    local job = ESX.GetPlayerData().job.name
                    local recipes = Config_craftjob.Recipes[job]
                    if recipes then
                        for craftItem, details in pairs(recipes) do
                            if details and details.ingredients then
                                local ingredientList = ""
                                for _, ingredient in ipairs(details.ingredients) do
                                    ingredientList = ingredientList .. string.format("%d x %s\n", ingredient.count, ingredient.label)
                                end
                                RageUI.Button(details.label, nil, { RightLabel = "→"}, not isCrafting, {
                                    onActive = function()
                                        RageUI.Info(kayscoreConfigServ.GTACOLOR..'Information Craft', {'Item : ', '', 'Ingrédients : ', ingredientList, '','','','',''}, {details.label})
                                    end,
                                    onSelected = function()
                                        TriggerServerEvent('craft:verifitem', job, craftItem, details.ingredients)
                                    end
                                })
                            else
                                -- print("Erreur: Détails ou ingrédients manquants pour " .. tostring(craftItem))
                            end
                        end
                    else
                        RageUI.Separator('Aucun item disponible')
                    end
                end)
                Citizen.Wait(0)
            end
        end)
    end
end


RegisterNetEvent('craft:startCrafting')

AddEventHandler('craft:startCrafting', function(job, craftItem, ingredients)
    if not isCrafting then
        isCrafting = true
        drawBar(20000, ("Craft de l'item en cours"), function()
        TriggerServerEvent('craft:craftItem', job, craftItem, ingredients)
        isCrafting = false
        end
    )
    end
end)

RegisterNetEvent('craft:insufficientItems')

AddEventHandler('craft:insufficientItems', function()
    TriggerEvent('esx:showNotification', 'Vous n\'avez pas tous les items nécessaires')
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)  -- Attente de 200 millisecondes entre chaque itération
        
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local playerData = ESX.GetPlayerData()

        if playerData then
            local jobName = playerData.job and playerData.job.name
            if jobName then
                local craftPoint = Config_craftjob.CraftPoints[jobName]
                if craftPoint then
                    local distance = #(playerCoords - vector3(craftPoint.x, craftPoint.y, craftPoint.z))
                    if distance < 3.0 then
                        DrawInstructionBarNotification(craftPoint.x, craftPoint.y, craftPoint.z, "Appuyez sur [ ~p~E~w~ ] pour intéragir")
                        if IsControlJustReleased(0, 38) then
                            OpenCraftMenu()
                        end
                    end
                end
            end
        end
    end
end)

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(100) 
--         local playerPed = PlayerPedId()
--         local playerCoords = GetEntityCoords(playerPed)

--         if ESX and ESX.GetPlayerData and ESX.GetPlayerData().job then
--             local job = ESX.GetPlayerData().job.name
--             local craftPoint = Config_craftjob.CraftPoints[job]

--             if craftPoint then
--                 local distance = #(playerCoords - vector3(craftPoint.x, craftPoint.y, craftPoint.z))
--                 if distance < 1.0 then
--                     DrawInstructionBarNotification(craftPoint.x, craftPoint.y, craftPoint.z, 'Appuyer sur E pour craft')
--                     if IsControlJustReleased(0, 38) then
--                         OpenCraftMenu()
--                     end
--                 end
--             end
--         end  
--     end  
-- end)
