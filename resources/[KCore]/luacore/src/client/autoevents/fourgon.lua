local ObjTable = {}  -- Tableau pour stocker les objets à récupérer
local blip  -- Variable pour le blip du point de récupération
local blips = {}  -- Tableau pour les blips des objets

function removeBlips()
    -- Supprimer tous les blips et objets
    RemoveBlip(blip)
    for k,v in pairs(ObjTable) do
        RemoveBlip(blips[v])
        RemoveObj(v)
    end
end

function moneyEvent(data, zone)
    Citizen.CreateThread(function()
        -- Ajout d'une notification pour l'événement
        TriggerEvent('esx:showNotification', data.message)

        -- Création du blip pour le point de récupération avec une taille réduite
        blip = AddBlipForCoord(zone)
        SetBlipSprite(blip, 616)  -- Sprite du blip (à ajuster selon vos besoins)
        SetBlipColour(blip, 1)  -- Couleur du blip (à ajuster)
        SetBlipScale(blip, 0.8)  -- Ajuster l'échelle du blip (plus petit que par défaut)
        
        local pPed = GetPlayerPed(-1)
        local pCoords = GetEntityCoords(pPed)
        local dst = GetDistanceBetweenCoords(pCoords, zone, true)

        -- Attente jusqu'à ce que le joueur soit proche du point de récupération
        while dst > 150 do
            Wait(100)
            pPed = GetPlayerPed(-1)
            pCoords = GetEntityCoords(pPed)
            dst = GetDistanceBetweenCoords(pCoords, zone, true)
            if EventStop then return end
        end

        if not EventStop then
            -- Création du fourgon à récupérer
            local blinder = GetHashKey("Stockade")
            RequestModel(blinder)
            while not HasModelLoaded(blinder) do Wait(10) end
            local veh = CreateVehicle(blinder, zone, math.random(0.0, 180.0), 0, 0)
            SetVehicleUndriveable(veh, 1)
            FreezeEntityPosition(veh, 1)
            SetVehicleAlarm(veh, 1)
            SetVehicleAlarmTimeLeft(veh, 999999.0 * 9999)
            for i = 1, 9 do
                SetVehicleDoorOpen(veh, i, 0, 1)
            end
            table.insert(ObjTable, veh)

            -- Création des objets à récupérer
            local randomProp = data.prop[math.random(1, #data.prop)]
            RequestModel(GetHashKey(randomProp))
            while not HasModelLoaded(GetHashKey(randomProp)) do Wait(10) end
            local randomZone = vector3(zone.x + math.random(-8.0, 8.0), zone.y + math.random(-8.0, 8.0), zone.z)

            local obj = CreateObject(GetHashKey(randomProp), randomZone, 0, 0, 0)
            table.insert(ObjTable, obj)
            PlaceObjectOnGroundProperly(obj)
            FreezeEntityPosition(obj, 1)
            blips[obj] = AddBlipForEntity(obj)
            SetBlipSprite(blips[obj], 1)  -- Sprite du blip pour l'objet
            SetBlipColour(blips[obj], 2)  -- Couleur du blip pour l'objet
            SetBlipScale(blips[obj], 0.5) 
            SetEntityDrawOutline(obj, true)
			SetEntityDrawOutlineColor(255, 255, 255, 255)
			SetEntityDrawOutlineShader(1) 
-- Ajuster l'échelle du blip (plus petit que par défaut)

            -- Boucle pour la récupération de l'argent
            local ArgentRecup = 0
            while ArgentRecup < 10 do
                Wait(1)

                local oCoords = GetEntityCoords(obj)
                local ppCoord = GetEntityCoords(PlayerPedId())
                local dst = GetDistanceBetweenCoords(ppCoord, oCoords, 0)

                -- Affichage de l'instruction pour récupérer l'objet
                if dst <= 4.0 and dst > 1.5 then
                    -- DrawInstructionBarNotification(oCoords.x, oCoords.y, oCoords.z, "Récupérer")
                    ESX.ShowHelpNotification("Récupérer")
                end

                if dst < 1.5 then
                    -- DrawInstructionBarNotification(oCoords.x, oCoords.y, oCoords.z, "Appuyez sur [E] pour récupérer")
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour récupérer")
                    if not IsPedSittingInAnyVehicle(PlayerPedId()) and IsControlJustPressed(0, 38) then 
                        ExecuteCommand("e pickup")
                        PlaySoundFrontend(-1, "Bus_Schedule_Pickup", "DLC_PRISON_BREAK_HEIST_SOUNDS", 1)
                        ArgentRecup = ArgentRecup + 1
                        local nombre = math.random(80, 150)
                        TriggerEvent('esx:showNotification', '~g~+' .. nombre .. '$')
                        secured_TriggerServerEvent("kayscore:GetArgent", nombre)
                        RemoveObj(obj)

                        -- Remplacer l'objet récupéré par un nouveau
                        randomProp = data.prop[math.random(1, #data.prop)]
                        RequestModel(GetHashKey(randomProp))
                        while not HasModelLoaded(GetHashKey(randomProp)) do Wait(10) end
                        randomZone = vector3(zone.x + math.random(-8.0, 8.0), zone.y + math.random(-8.0, 8.0), zone.z)
            
                        local NewObj = CreateObject(GetHashKey(randomProp), randomZone, 0, 0, 0)
                        obj = NewObj
                        table.insert(ObjTable, obj)
                        PlaceObjectOnGroundProperly(obj)
                        FreezeEntityPosition(obj, 1)
                        blips[obj] = AddBlipForEntity(obj)
                        SetBlipSprite(blips[obj], 1)  -- Sprite du blip pour l'objet
                        SetBlipColour(blips[obj], 2)  -- Couleur du blip pour l'objet
                        SetBlipScale(blips[obj], 0.5)
                        SetEntityDrawOutline(obj, true)
                        SetEntityDrawOutlineColor(255, 255, 255, 255)
                        SetEntityDrawOutlineShader(1)   -- Ajuster l'échelle du blip (plus petit que par défaut)
                    end
                end

                if ArgentRecup >= 10 then
                    -- Envoyer l'événement de récupération au serveur
                    TriggerServerEvent("kayscore:Recuperer")
                    for k,v in pairs(ObjTable) do
                        RemoveObj(v)
                        RemoveObj(obj)
                    end
                    break
                end

                if EventStop then 
                    ArgentRecup = 99 
                    break 
                end
            end
        end

        -- Si l'événement n'a pas été complété, envoyer une notification et nettoyer
        if not sended then
            TriggerServerEvent("kayscore:Recuperer")
        end

        -- Notification si la récupération prend trop de temps
        TriggerEvent('esx:showNotification', 'Cargaison récupérée trop tard')
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)

        -- Nettoyer les objets et blips à la fin de l'événement
        removeBlips()
    end)
end

-- function DrawInstructionBarNotification(x, y, z, text)
--     local px, py, pz = table.unpack(GetEntityCoords(PlayerPedId()))
--     local distance = GetDistanceBetweenCoords(x, y, z, px, py, pz, false)

--     if distance <= 6 then
--         -- Dessiner le texte d'instruction au-dessus de l'objet
--         SetTextScale(0.35, 0.35)
--         SetTextFont(4)
--         SetTextProportional(1)
--         SetTextColour(255, 255, 255, 215)
--         SetTextEntry("STRING")
--         SetTextCentre(true)
--         AddTextComponentString(text)
--         SetDrawOrigin(x, y, z + 1.0, 0)  -- Ajouter 1.0 à z pour dessiner au-dessus de l'objet
--         DrawText(0.0, 0.0)
--         DrawRect(0.0, 0.0125, 0.017 + (string.len(text)) / 370, 0.03, 0, 0, 0, 75)
--         ClearDrawOrigin()

--     end
-- end


DrawInstructionBarNotification = function(text)
    exports.interact:ShowHelpNotification({
		message = text,
	})
end