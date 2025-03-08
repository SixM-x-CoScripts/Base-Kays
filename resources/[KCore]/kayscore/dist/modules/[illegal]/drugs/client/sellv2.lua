Selldrugs = Selldrugs or {}
Selldrugs.OnSellDrugs = false
Selldrugs.PedModel = "s_m_y_dealer_01" 
Selldrugs.Ped = nil
Selldrugs.NotificationDisplayed = false
Selldrugs.PedBlip = nil

Citizen.CreateThread(function()
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(100)
    end
    ESX.PlayerData = ESX.GetPlayerData()
end)

function RequestAndWaitModel(modelName)
    if modelName and IsModelInCdimage(modelName) and not HasModelLoaded(modelName) then
        RequestModel(modelName)
        while not HasModelLoaded(modelName) do 
            Citizen.Wait(10) 
        end
    end
    if not HasModelLoaded(modelName) then
        -- print("Erreur: Le modèle " .. modelName .. " n'a pas pu être chargé.")
    end
end

function ClearAreaAroundSpawn(pos, radius)
    ClearAreaOfPeds(pos.x, pos.y, pos.z, radius, false)
    ClearAreaOfVehicles(pos.x, pos.y, pos.z, radius, false, false, false, false, false)
end

function SpawnPedForSell()
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)

    RequestAndWaitModel(Selldrugs.PedModel)
    
    if not HasModelLoaded(Selldrugs.PedModel) then
        -- print("Erreur: Modèle de PNJ non chargé.")
        return
    end

    local spawnDistance = math.random(kayscoreDrugs.Ped.SpawnDistance.min, kayscoreDrugs.Ped.SpawnDistance.max)
    local angle = math.random() * 2 * math.pi
    local spawnOffset = vector3(spawnDistance * math.cos(angle), spawnDistance * math.sin(angle), 0)
    local spawnPos = playerPos + spawnOffset

    local foundGround, groundZ = GetGroundZFor_3dCoord(spawnPos.x, spawnPos.y, spawnPos.z, false)
    if foundGround then
        spawnPos = vector3(spawnPos.x, spawnPos.y, groundZ)
    end

    ClearAreaAroundSpawn(spawnPos, 5.0)

    Selldrugs.Ped = CreatePed(4, Selldrugs.PedModel, spawnPos.x, spawnPos.y, spawnPos.z, 0.0, true, true)

    if not DoesEntityExist(Selldrugs.Ped) then
        -- print("Erreur: Le PNJ n'a pas pu être créé à la position : " .. spawnPos.x .. ", " .. spawnPos.y .. ", " .. spawnPos.z)
        return
    else
        -- print("PNJ créé avec succès à la position : " .. spawnPos.x .. ", " .. spawnPos.y .. ", " .. spawnPos.z)
    end

    SetPedCanRagdollFromPlayerImpact(Selldrugs.Ped, false)
    SetBlockingOfNonTemporaryEvents(Selldrugs.Ped, true)

    if Selldrugs.PedBlip then
        RemoveBlip(Selldrugs.PedBlip)
    end
    Selldrugs.PedBlip = AddBlipForEntity(Selldrugs.Ped)
    SetBlipSprite(Selldrugs.PedBlip, kayscoreDrugs.Ped.Blip.Sprite)
    SetBlipColour(Selldrugs.PedBlip, kayscoreDrugs.Ped.Blip.Colour)
    SetBlipScale(Selldrugs.PedBlip, kayscoreDrugs.Ped.Blip.Scale)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(kayscoreDrugs.Ped.Blip.Name)
    EndTextCommandSetBlipName(Selldrugs.PedBlip)

    MovePedToPlayer()
end

function MovePedToPlayer()
    if not Selldrugs.Ped then return end

    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)

    TaskGoStraightToCoord(Selldrugs.Ped, playerPos.x, playerPos.y, playerPos.z, 2.0, -1, 0.0, 0.0)
end

function DeleteObjects(objects)
    for _, obj in ipairs(objects) do
        if DoesEntityExist(obj) then
            SetEntityAsMissionEntity(obj, true, true)
            DeleteObject(obj)
        end
    end
end

function WalkAwayAndDeletePed()
    if not Selldrugs.Ped then return end

    local pedPos = GetEntityCoords(Selldrugs.Ped)

    local moveDistance = math.random(10, 30)
    local angle = math.random() * 2 * math.pi
    local moveOffset = vector3(moveDistance * math.cos(angle), moveDistance * math.sin(angle), 0)

    local movePos = pedPos + moveOffset

    TaskGoStraightToCoord(Selldrugs.Ped, movePos.x, movePos.y, movePos.z, 2.0, -1, 0.0, 0.0)

    Citizen.Wait(5000)

    -- Suppression du PNJ et du blip
    SetEntityAsMissionEntity(Selldrugs.Ped, true, true)
    DeletePed(Selldrugs.Ped)
    if Selldrugs.PedBlip then
        RemoveBlip(Selldrugs.PedBlip)
        Selldrugs.PedBlip = nil
    end
    Selldrugs.Ped = nil
end

function TeleportPedInFrontOfPlayer()
    if not Selldrugs.Ped then return end

    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)
    local playerHeading = GetEntityHeading(playerPed)
    local offset = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 1.5, 0.0)
    SetEntityCoords(Selldrugs.Ped, offset.x, offset.y, offset.z)
    SetEntityHeading(Selldrugs.Ped, playerHeading - 180) 
end

function IsNearAuthorizedPosition()
    local playerPos = GetEntityCoords(PlayerPedId())
    for _, pos in pairs(kayscoreDrugs.AuthorizedPositions) do
        local dist = Vdist(playerPos.x, playerPos.y, playerPos.z, pos.x, pos.y, pos.z)
        if dist <= 100.0 then
            return true
        end
    end
    return false
end

Citizen.CreateThread(function()
    for _, pos in pairs(kayscoreDrugs.AuthorizedPositions) do
        local blip = AddBlipForCoord(pos.x, pos.y, pos.z)
        SetBlipSprite(blip, kayscoreDrugs.Blip.sprite)
        SetBlipDisplay(blip, kayscoreDrugs.Blip.display)
        SetBlipScale(blip, kayscoreDrugs.Blip.scale)
        SetBlipColour(blip, kayscoreDrugs.Blip.color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(kayscoreDrugs.Blip.name)
        EndTextCommandSetBlipName(blip)
    end
end)

secured_RegisterNetEvent("sDrugs:DeactivateSell")
secured_AddEventHandler("sDrugs:DeactivateSell", function()
    Selldrugs.OnSellDrugs = false
    Selldrugs.NotificationDisplayed = false
    WalkAwayAndDeletePed()
end)

RegisterCommand("drugs", function()
    local playerPed = PlayerPedId()

    if IsPedInAnyVehicle(playerPed, false) then
        return ESX.ShowNotification("~r~Vous ne pouvez pas vendre de la drogue dans un véhicule.")
    end

    if kayscoreDrugs.BlackListedJobs[ESX.GetPlayerData().job.name] then 
        return ESX.ShowNotification('~r~Vous ne pouvez pas vendre de la drogue en étant dans une entreprise publique~s~') 
    end
    
    if not IsNearAuthorizedPosition() then
        return ESX.ShowNotification("~r~Vous n'êtes pas dans une zone autorisée pour vendre de la drogue.")
    end

    ESX.TriggerServerCallback('sDrugs:GetPoliceCount', function(policeCount, saspnCount)
        local playerPos = GetEntityCoords(playerPed)
        local isInNorth = playerPos.y >= 2000.0

        if isInNorth then
            if saspnCount < 0 then
                return ESX.ShowNotification("~r~Il doit y avoir au moins 2 membres du SASPN en ligne pour vendre de la drogue ici.")
            end
        else
            if policeCount < 0 then
                return ESX.ShowNotification("~r~Il doit y avoir au moins 2 membres du SASP en ligne pour vendre de la drogue.")
            end
        end

        secured_TriggerServerEvent("sDrugs:CheckAndActivateDrugsSell")
    end)
end)



secured_RegisterNetEvent("sDrugs:StartDrugsSell")
secured_AddEventHandler('sDrugs:StartDrugsSell', function()
    if not Selldrugs.OnSellDrugs then
        Citizen.Wait(100)
        ESX.ShowNotification("Vous avez ~b~activé~s~ la vente de drogues.")

        ESX.ShowNotification("Un client arrive...")
        Selldrugs.OnSellDrugs = true
        Selldrugs.NotificationDisplayed = false
        SpawnPedForSell()
        
    else
        ESX.ShowNotification("Vous avez ~r~désactivé~s~ la vente de drogues.")
        Selldrugs.OnSellDrugs = false
        Selldrugs.NotificationDisplayed = false
        WalkAwayAndDeletePed()
    end
end)

function RequestAndWaitDict(dictName)
    if dictName and DoesAnimDictExist(dictName) and not HasAnimDictLoaded(dictName) then
        RequestAnimDict(dictName)
        while not HasAnimDictLoaded(dictName) do 
            Citizen.Wait(10) 
        end
    end
    if not HasAnimDictLoaded(dictName) then
        -- print("Erreur: L'animation " .. dictName .. " n'a pas pu être chargée.")
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)

        if Selldrugs.OnSellDrugs then
            if not IsNearAuthorizedPosition() then
                ESX.ShowNotification("~r~Vous vous êtes éloigné trop loin de la zone autorisée, la vente est désactivée.")
                secured_TriggerEvent('sDrugs:DeactivateSell')
            else
                if Selldrugs.Ped then
                    local playerPed = PlayerPedId()
                    local playerPos = GetEntityCoords(playerPed)
                    local pedPos = GetEntityCoords(Selldrugs.Ped)
                    local dist = Vdist(playerPos, pedPos)

                    if dist <= kayscoreDrugs.DistanceToSell then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~o~vendre votre drogue~s~.")

                        if IsControlJustPressed(0, 38) then

                            -- RequestAndWaitDict("mp_common")
                            -- RequestAndWaitModel('hei_prop_heist_cash_pile')

                            local itemConfig = kayscoreDrugs.SaleItems[1] -- On prend le premier article de vente comme exemple
                            -- local cCreate = CreateObject(GetHashKey(itemConfig.props), 0, 0, 0, true)
                            -- local oCreate = CreateObject(GetHashKey('hei_prop_heist_cash_pile'), 0, 0, 0, true)

                            -- AttachEntityToEntity(cCreate, playerPed, GetPedBoneIndex(playerPed, 57005), 0.13, 0.02, 0.0, -90.0, 0, 0, 1, 1, 0, 1, 0, 1)
                            -- AttachEntityToEntity(oCreate, Selldrugs.Ped, GetPedBoneIndex(Selldrugs.Ped, 57005), 0.13, 0.02, 0.0, -90.0, 0, 0, 1, 1, 0, 1, 0, 1)

                            TaskPlayAnim(playerPed, itemConfig.anim[1], itemConfig.anim[2], 8.0, 8.0, -1, 0, 1, false, false, false)
                            TaskPlayAnim(Selldrugs.Ped, itemConfig.anim[1], itemConfig.anim[2], 8.0, 8.0, -1, 0, 1, false, false, false)

                            -- Citizen.Wait(10)

                            -- AttachEntityToEntity(oCreate, playerPed, GetPedBoneIndex(playerPed, 57005), 0.13, 0.02, 0.0, -90.0, 0, 0, 1, 1, 0, 1, 0, 1)
                            -- AttachEntityToEntity(cCreate, Selldrugs.Ped, GetPedBoneIndex(Selldrugs.Ped, 57005), 0.13, 0.02, 0.0, -90.0, 0, 0, 1, 1, 0, 1, 0, 1)

                            -- Citizen.Wait(75)

                            local chance = math.random(0, 100)
                            if chance <= 15 then
                                ESX.ShowNotification("~r~La personne ne veut pas de votre marchandise.")
                                
                                if playerPos.y >= 2000.0 then
                                    secured_TriggerServerEvent("kayscore:sendappel:jobLSPD", {
                                        job = "saspn",
                                        raison = "Vente de drogue",
                                        pos = playerPos,
                                        plate = '[]'
                                    })
                                else
                                    secured_TriggerServerEvent("kayscore:sendappel:jobLSPD", {
                                        job = "police",
                                        raison = "Vente de drogue",
                                        pos = playerPos,
                                        plate = '[]'
                                    })
                                end

                                Selldrugs.NotificationDisplayed = false
                            else
                                secured_TriggerServerEvent('sDrugs:SellDrugs', 1) -- On vend 1 unité (peut être ajusté)
                            end

                            Citizen.Wait(500)
                            -- DeleteObjects({cCreate, oCreate})
                            WalkAwayAndDeletePed()
                            
                            if Selldrugs.OnSellDrugs then
                                SpawnPedForSell()
                            end
                        end
                    elseif Selldrugs.NotificationDisplayed then
                        Selldrugs.NotificationDisplayed = false
                    end
                end
            end
        end
    end
end)