Citizen.CreateThread(function()
    Wait(2000)
    TriggerServerEvent('Zigi:initFarmSociety')
end)


local EntrepriseFarmList = {}
local EntrepriseFarmListLoaded = false

RegisterNetEvent('Zigi:SendEntrepriseFarmList')
AddEventHandler('Zigi:SendEntrepriseFarmList', function(Table)
    EntrepriseFarmList = Table
    EntrepriseFarmListLoaded = true
end)

local showBlips = true 


function CreateBlipsForJob()
    if showBlips then
        local jobName = ESX.PlayerData.job.name

        for _, v in pairs(EntrepriseFarmList) do
            local entreprise = v

            if jobName == entreprise.name then
                print("Creating blips for " .. entreprise.name) -- Message de débogage

                local blipRecolte = AddBlipForCoord(entreprise.PosRecolte.x, entreprise.PosRecolte.y, entreprise.PosRecolte.z)
                SetBlipSprite(blipRecolte, 1)
                SetBlipDisplay(blipRecolte, 4)
                SetBlipScale(blipRecolte, 1.0)
                SetBlipColour(blipRecolte, 1)
                SetBlipAsShortRange(blipRecolte, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("[" .. ESX.PlayerData.job.label .. "] Point de récolte")
                EndTextCommandSetBlipName(blipRecolte)

                local blipTraitement = AddBlipForCoord(entreprise.PosTraitement.x, entreprise.PosTraitement.y, entreprise.PosTraitement.z)
                SetBlipSprite(blipTraitement, 1)
                SetBlipDisplay(blipTraitement, 4)
                SetBlipScale(blipTraitement, 1.0)
                SetBlipColour(blipTraitement, 1)
                SetBlipAsShortRange(blipTraitement, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("[" .. ESX.PlayerData.job.label .. "] Point de Traitement")
                EndTextCommandSetBlipName(blipTraitement)

                local blipVente = AddBlipForCoord(entreprise.PosVente.x, entreprise.PosVente.y, entreprise.PosVente.z)
                SetBlipSprite(blipVente, 1)
                SetBlipDisplay(blipVente, 4)
                SetBlipScale(blipVente, 1.0)
                SetBlipColour(blipVente, 1)
                SetBlipAsShortRange(blipVente, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("[" .. ESX.PlayerData.job.label .. "] Point de Vente")
                EndTextCommandSetBlipName(blipVente)
            end
        end
    end
end




local farming = false
local WaitFarming = false

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        local isNearAnyPoint = false
        local activityType = 0
        local entreprise = nil
        local activityText = ""

        if ESX.PlayerData and ESX.PlayerData.job then
            local jobName = ESX.PlayerData.job.name

            for _, v in pairs(EntrepriseFarmList) do
                if jobName == v.name then
                    local posRecolteDist = Vdist2(playerCoords, vector3(v.PosRecolte.x, v.PosRecolte.y, v.PosRecolte.z))
                    local posTraitementDist = Vdist2(playerCoords, vector3(v.PosTraitement.x, v.PosTraitement.y, v.PosTraitement.z))
                    local posVenteDist = Vdist2(playerCoords, vector3(v.PosVente.x, v.PosVente.y, v.PosVente.z))

                    if posRecolteDist < 25 then
                        isNearAnyPoint = true
                        activityType = 1
                        activityText = "~p~Appuyez sur ~w~E ~p~pour commencer à récolter"
                    elseif posTraitementDist < 25 then
                        isNearAnyPoint = true
                        activityType = 2
                        activityText = "~p~Appuyez sur ~w~E ~p~pour commencer le traitement"
                    elseif posVenteDist < 25 then
                        isNearAnyPoint = true
                        activityType = 3
                        activityText = "~p~Appuyez sur ~w~E ~p~pour commencer la vente"
                    end

                    if isNearAnyPoint then
                        entreprise = v
                        DrawMarker(25, v.PosRecolte.x, v.PosRecolte.y, v.PosRecolte.z - 1, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 200, false, true, 2, nil, nil, false)
                        DrawMarker(25, v.PosTraitement.x, v.PosTraitement.y, v.PosTraitement.z - 1, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 255, 0, 200, false, true, 2, nil, nil, false)
                        DrawMarker(25, v.PosVente.x, v.PosVente.y, v.PosVente.z - 1, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 0, 255, 200, false, true, 2, nil, nil, false)
                        break
                    end
                end
            end
        end

        if isNearAnyPoint then
            if not farming then
                DrawInstructionBarNotification(entreprise.PosRecolte.x, entreprise.PosRecolte.y, entreprise.PosRecolte.z, 'Appuyez sur [ ~g~E~w~ ] pour récolter')
                DrawInstructionBarNotification(entreprise.PosTraitement.x, entreprise.PosTraitement.y, entreprise.PosTraitement.z, 'Appuyez sur [ ~g~E~w~ ] pour traiter')
                DrawInstructionBarNotification(entreprise.PosVente.x, entreprise.PosVente.y, entreprise.PosVente.z, 'Appuyez sur [ ~g~E~w~ ] pour vendre')

                if IsControlJustPressed(1, 51) then
                    farming = true
                    WaitFarming = true

                    if activityType == 1 then
                        TriggerServerEvent('framework:startActivity', entreprise.PosRecolte, entreprise.RecolteItem, 1, '0', jobName)
                    elseif activityType == 2 then
                        TriggerServerEvent('framework:startActivity', entreprise.PosTraitement, entreprise.RecolteItem, 2, entreprise.TraitementItem, jobName)
                    elseif activityType == 3 then
                        TriggerServerEvent('framework:startActivity', entreprise.PosVente, '0', 3, entreprise.TraitementItem, jobName)
                    end
                end
            else
                DrawInstructionBarNotification(entreprise.PosRecolte.x, entreprise.PosRecolte.y, entreprise.PosRecolte.z, 'Appuyez sur [ ~g~E~w~ ] pour arrêter')
                DrawInstructionBarNotification(entreprise.PosTraitement.x, entreprise.PosTraitement.y, entreprise.PosTraitement.z, 'Appuyez sur [ ~g~E~w~ ] pour arrêter')
                DrawInstructionBarNotification(entreprise.PosVente.x, entreprise.PosVente.y, entreprise.PosVente.z, 'Appuyez sur [ ~g~E~w~ ] pour arrêter')

                if IsControlJustPressed(1, 51) then
                    farming = false
                    TriggerServerEvent('framework:stopActivity')
                    Citizen.Wait(1500)
                    WaitFarming = false
                end
            end
        else
            if farming then
                farming = false
                TriggerServerEvent('framework:stopActivity')
                Citizen.Wait(1500)
                WaitFarming = false
            end
        end

        Citizen.Wait(isNearAnyPoint and 0 or 1000)
    end
end)



RegisterNetEvent('framework:farmanimation')
AddEventHandler('framework:farmanimation', function()
    local dict, anim = 'random@domestic', 'pickup_low'
    local playerPed = PlayerPedId()
    ESX.Streaming.RequestAnimDict(dict)
    TaskPlayAnim(playerPed, dict, anim, 8.0, 1.0, 1000, 16, 0.0, false, false, false)
end)

local FarmJobs = {
    inService = false,
}

function FarmJobs:openMenu()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        local Open = false

        if ESX.PlayerData and ESX.PlayerData.job then
            local jobName = ESX.PlayerData.job.name
            local jobLabel = ESX.PlayerData.job.label


            for _, v in pairs(EntrepriseFarmList) do
                local entreprise = v

                if jobName == entreprise.name then
    RageUI.Visible(main, not RageUI.Visible(main))
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Checkbox('Statut de l\'entreprise', 'Quand cette case est cochée votre ENTREPRISE est notée comme ouverte', Society.List[ESX.PlayerData.job.name].state, {}, {
                onChecked = function()
                    secured_TriggerServerEvent('kayscore:jobs:updateSocietyStatus', true)
                end,
                onUnChecked = function()
                    secured_TriggerServerEvent('kayscore:jobs:updateSocietyStatus', false)
                end
            })
            RageUI.Checkbox('Service', nil, FarmJobs.inService, {}, {
                onChecked = function()
                    FarmJobs.inService = true
                    TriggerServerEvent('kayscore:FarmJobs:service', true)
                end,
                onUnChecked = function()
                    FarmJobs.inService = false
                    TriggerServerEvent('kayscore:FarmJobs:service', false)
                end
            })
            if FarmJobs.inService then
               
                RageUI.Button('Faire une annonce personnaliser', nil, {}, true, {
                    onSelected = function()
                        local jobname = ESX.PlayerData.job.name
                  KeyboardUtils.use('Contenu', function(msg)
                                if msg == nil then return end
                                secured_TriggerServerEvent('monjob:annoncer', msg, jobname)
                            end)
                    end
                })
                RageUI.WLine()
                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                RageUI.Button('Faire une facture', nil, {}, true, {
                    onSelected = function()
                        if closestDistance ~= -1 and closestDistance <= 3 then
                            KeyboardUtils.use('Montant', function(data)
                                local data = tonumber(data)
                                if data == nil or data <= 0 then return end
    
                                secured_TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_'..jobName, (jobLabel), data)
                            end)
                        else
                            ESX.ShowNotification("Aucun joueur à proximité")
                        end
                    end
                })


                RageUI.Button('Montrer les points sur la carte', nil, {}, true, {
                    onSelected = function()
                        local jobName = ESX.PlayerData.job.name
                
                        for _, v in pairs(EntrepriseFarmList) do
                            local entreprise = v
                
                            if jobName == entreprise.name then
                                print("Creating blips for " .. entreprise.name) -- Message de débogage
                
                                -- Création du blip pour le point de récolte
                                local blipRecolte = AddBlipForCoord(entreprise.PosRecolte.x, entreprise.PosRecolte.y, entreprise.PosRecolte.z)
                                SetBlipSprite(blipRecolte, 501)
                                SetBlipDisplay(blipRecolte, 4)
                                SetBlipScale(blipRecolte, 0.6)
                                SetBlipColour(blipRecolte, 16)
                                SetBlipAsShortRange(blipRecolte, true)
                                BeginTextCommandSetBlipName("STRING")
                                AddTextComponentString("[" .. ESX.PlayerData.job.label .. "] Point de récolte")
                                EndTextCommandSetBlipName(blipRecolte)
                
                                -- Création du blip pour le point de traitement
                                local blipTraitement = AddBlipForCoord(entreprise.PosTraitement.x, entreprise.PosTraitement.y, entreprise.PosTraitement.z)
                                SetBlipSprite(blipTraitement, 501)
                                SetBlipDisplay(blipTraitement, 4)
                                SetBlipScale(blipTraitement, 0.6)
                                SetBlipColour(blipTraitement, 16)
                                SetBlipAsShortRange(blipTraitement, true)
                                BeginTextCommandSetBlipName("STRING")
                                AddTextComponentString("[" .. ESX.PlayerData.job.label .. "] Point de Traitement")
                                EndTextCommandSetBlipName(blipTraitement)
                
                                -- Création du blip pour le point de vente
                                local blipVente = AddBlipForCoord(entreprise.PosVente.x, entreprise.PosVente.y, entreprise.PosVente.z)
                                SetBlipSprite(blipVente, 501)
                                SetBlipDisplay(blipVente, 4)
                                SetBlipScale(blipVente, 0.6)
                                SetBlipColour(blipVente, 16)
                                SetBlipAsShortRange(blipVente, true)
                                BeginTextCommandSetBlipName("STRING")
                                AddTextComponentString("[" .. ESX.PlayerData.job.label .. "] Point de Vente")
                                EndTextCommandSetBlipName(blipVente)
                            end
                        end
                

                    end
                })
                


                


                RageUI.WLine()
            end
        end)
    end
end
end

        if not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
        end
    end
end
end


                function UnlockBlipButton()
                    blipButtonLocked = false
                    blipButton:setDisabled(false) 
                end

RegisterKeyMapping('FarmJobs_menu', 'Menu Job Farm', 'keyboard', 'F6')

RegisterCommand('FarmJobs_menu', function()
    local playerPed = PlayerPedId()
    local playerServerId = GetPlayerServerId(PlayerId())
    local jobName = nil
    
    if ESX and ESX.PlayerData and ESX.PlayerData.job then
        jobName = ESX.PlayerData.job.name
    end

    if jobName then
        local hasJob = false
        
        for _, v in pairs(EntrepriseFarmList) do
            if jobName == v.name then
                hasJob = true
                break
            end
        end
        
        if not hasJob then

        else
            FarmJobs:openMenu()
        end
    else
        print("Erreur: Impossible de récupérer les données du joueur.")
    end
end, false)