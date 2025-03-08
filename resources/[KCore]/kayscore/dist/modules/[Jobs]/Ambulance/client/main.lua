imKoWithMelee = false
local PLAYERDEADLEGIT = false
RegisterNetEvent("kayscore:ambulance:respawnPed", function(spawn)  --- TODO
    SetEntityCoordsNoOffset(Player.playerPed, spawn.coords, false, false, false, true)
	NetworkResurrectLocalPlayer(spawn.coords, spawn.heading, true, false)
    SetPlayerInvincible(Player.playerPed, false)
	TriggerEvent('playerSpawned', spawn)
	ClearPedBloodDamage(Player.playerPed)
end)
RegisterNetEvent('admin:client:addZoneAta')
AddEventHandler('admin:client:addZoneAta', function(playersIds, ataType, duration)
    ataThread(duration, ataType)
end)

Ambulance = {
    Service = false,
    Appelles = {},
    AppellesCount = 0,

    LockedButton = false,
    Time = 8,

    sAppele = nil,
    TakedAppele = false,

    MyBlip = {},

    Employeds = {},
    EmployedsCount = 0,

    Items = {
        {name = 'bandage', label = 'Rouleaux de Bandage'},
        {name = 'medikit', label = 'Trousse de Soins'}
    }
}
local ataTime = 0
local ataThreadActive = false
local ataCooldown = 0
local ataTimeRemoving = 0
local ataType = 0
local ataProps = {}
local caneModel = 'prop_cs_walking_stick'

local disabledAtaKeys = {
	{group = 2, key = 37, message = '~r~Vous ne pouvez pas sortir d\'arme en SafeZone'},
	{group = 0, key = 24, message = '~r~Vous ne pouvez pas faire ceci en SafeZone'},
	{group = 0, key = 69, message = '~r~Vous ne pouvez pas faire ceci en SafeZone'},
	{group = 0, key = 92, message = '~r~Vous ne pouvez pas faire ceci en SafeZone'},
	{group = 0, key = 106, message = '~r~Vous ne pouvez pas faire ceci en SafeZone'},
	{group = 0, key = 168, message = '~r~Vous ne pouvez pas faire ceci en SafeZone'},
	{group = 0, key = 160, message = '~r~Vous ne pouvez pas faire ceci en SafeZone'},
	{group = 0, key = 160, message = '~r~Vous ne pouvez pas faire ceci en SafeZone'},
}

function inAta()
    return ataTime > 0 
end
local bedCam = nil
function getAtaType()
    return ataType
end

function inCane()
    if ataTime > 0 and ataType == 1 then 
        return true
    end 

    return false 
end

function SecondsToClock (seconds)
    seconds = tonumber(seconds)

    if seconds <= 0 then
        return "00:00"
    else
        mins = string.format("%02.f", math.floor(seconds / 150))
        secs = string.format("%02.f", math.floor(seconds - mins * 150))
        return string.format("%s:%s", mins, secs)
    end
end

function ataThread(time, type) 
    ataTime = time
    ataType = type

    if ataTime <= 0 then 
       
        return 
    end




    ataThreadActive = true
    ataTimeRemoving = GetGameTimer()

    Citizen.CreateThread(function()
        while ataThreadActive and ataTime > 0 do 
            DisablePlayerFiring(Player.playerPed, true)
            SetCurrentPedWeapon(Player.playerPed, `WEAPON_UNARMED`, true)
            DisableControlAction(0, 21, true)
            DisableControlAction(0, 22, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 140, true)


            for i = 1, #disabledAtaKeys, 1 do
                DisableControlAction(disabledAtaKeys[i].group, disabledAtaKeys[i].key, true)

                if IsDisabledControlJustPressed(disabledAtaKeys[i].group, disabledAtaKeys[i].key) or IsDisabledControlJustReleased(disabledAtaKeys[i].group, disabledAtaKeys[i].key) then
                    SetCurrentPedWeapon(Player.playerPed, `WEAPON_UNARMED`, true)
                end
            end

            local removeTime = (GetGameTimer() - ataTimeRemoving) / 1000
            local timeRemaining = SecondsToClock(ataTime - removeTime)
            local ataMessage = ("Vous êtes limité physiquement pendant %s."):format(timeRemaining)

            if not inbed then 
                DrawMissionText(ataMessage, 0)
            end

            if ataTime - removeTime <= 0.0 then 
                ExecuteCommand(('walk %s'):format(getWalkStyle()))
                ataThreadActive = false 
                ataType = 0
                ataTime = 0
                break
            end

            Citizen.Wait(0)
        end

        ataThreadActive = false 
        ataType = 0
        ataTime = 0
    end)
end

secured_RegisterNetEvent('ata:client:update', function(ata)  ---- TODO
    if ata == nil then 
        return 
    end
    
    ataTime = ata.time == nil and 0 or ata.time
    ataType = ata.type == nil and 0 or ata.type
    ataTimeRemoving = GetGameTimer()

    if ataTime > 0 and not ataThreadActive then 
        ataThread()
    end

end)

SetEntityRagdoll = false

RegisterNetEvent('kayscore:ambulance:service', function(newVal)
    Ambulance.Service = newVal
end)

RegisterNetEvent('kayscore:ambulance:addCall', function(k,v)
    Ambulance.Appelles[k] = v
    Ambulance.AppellesCount = 0

    for k,v in pairs(Ambulance.Appelles) do
        Ambulance.AppellesCount += 1
    end
end)

RegisterNetEvent('kayscore:ambulance:removeCall', function(k)
    Ambulance.Appelles[k] = nil

    Ambulance.AppellesCount -= 1
end)

RegisterNetEvent('kayscore:ambulance:updateCall', function(k, v)
    Ambulance.Appelles[k] = v
end)

RegisterNetEvent('kayscore:ambulance:addEmployed', function(k,v)
    Ambulance.Employeds[k] = v
    Ambulance.EmployedsCount = 0

    for k,v in pairs(Ambulance.Employeds) do
        Ambulance.EmployedsCount += 1
    end
end)
OpenDefebrilateurTaMams = function()

    FreezeEntityPosition(PlayerPedId(), true)
    local maindefibrilateur = RageUI.CreateMenu("", "Défibrillateur")

    RageUI.Visible(maindefibrilateur, not RageUI.Visible(maindefibrilateur))

    while maindefibrilateur do 

        Wait(1)

        RageUI.IsVisible(maindefibrilateur, function()
        
            player, dist = ESX.Game.GetClosestPlayer()
            -- print(player, dist)
            if player ~= -1 and dist < 5 then 

                RageUI.Button("→ ~g~Nom : ~w~"..GetPlayerName(player), "Prix : 1200$", {RightLabel = "Réanimer"}, true, {
                    onSelected = function()
                        TriggerServerEvent("kayscore:reamoi", GetPlayerServerId(player))
                        RageUI.CloseAll()
                    end
                })
            else
                RageUI.Separator("~r~Aucun joueur à proximité")

            end

        
        
        end, function()
        end)

        if not RageUI.Visible(maindefibrilateur) then 
            maindefibrilateur = RMenu:DeleteType("maindefibrilateur")
            FreezeEntityPosition(PlayerPedId(), false)
        end

    end


end
RegisterNetEvent('kayscore:ambulance:removeEmployed', function(k)
    Ambulance.Employeds[k] = nil
    Ambulance.EmployedsCount = 0

    Ambulance.EmployedsCount -= 1
end)
RegisterNetEvent("kayscore:ambulance:stungun", function()  --- TODO
    Citizen.CreateThread(function()
        local start = GetGameTimer()

        while GetGameTimer() < start + 5000 do
            Citizen.Wait(0)
            DisablePlayerFiring(PlayerId(), true)
            SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
            ResetPedRagdollTimer(PlayerPedId())
        end
    end)
    SetTimecycleModifier("REDMIST_blend")
    ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 1.0)
    Citizen.Wait(5000)
    SetTransitionTimecycleModifier("hud_def_desat_Trevor", 5.0)
    Citizen.Wait(5000)
    SetTransitionTimecycleModifier('default', 5.0)
    Citizen.Wait(5000)
    ClearTimecycleModifier()
    StopGameplayCamShaking()
end)
AddEventHandler("gameEventTriggered", function(eventName, eventArguments)
    local args = {}
    if eventName == "CEventNetworkEntityDamage" then
        local victimEntity, attackEntity, damage, __, __, fatalBool, weaponUsed, __, __, __, entityType = table.unpack(eventArguments)
        args = { victimEntity, attackEntity, fatalBool == 1, weaponUsed, entityType,
            math.floor(string.unpack("f", string.pack("i4", damage)))
        }

        if GetEntityType(victimEntity) ~= 1 then return end

        if victimEntity ~= PlayerPedId() then return end
        --if isInInfectedGame() then return end

        if not weaponUsed then
            if GetEntityHealth(PlayerPedId()) > 100 and imKoWithMelee then return end 

            if not PLAYERDEADLEGIT then 
                PLAYERDEADLEGIT = true
                TriggerEvent('esx:onPlayerDeath')
            else
                TriggerEvent("kayscore:ambulance:respawnPed", {coords = GetEntityCoords(PlayerPedId()), heading = 0.0})  --- TODO
            end
        end

        if weaponUsed == `WEAPON_SHOTGUNLETAL` or weaponUsed == `WEAPON_STUNGUN` then
            if GetEntityHealth(PlayerPedId()) < 100 then
                TriggerEvent("kayscore:ambulance:respawnPed", {coords = GetEntityCoords(PlayerPedId()), heading = 0.0})
            end
            TriggerServerEvent("kayscore:ambulance:stungun")  --- TODO
            return
        end

        if (weaponUsed) then
            if GetEntityHealth(PlayerPedId()) > 100 then return end

            if (not PlayerIsDead) and PLAYERDEADLEGIT then
                PLAYERDEADLEGIT = false
                imKoWithMelee = false
            end

            if imKoWithMelee then
                TriggerEvent("kayscore:ambulance:respawnPed", {coords = GetEntityCoords(PlayerPedId()), heading = 0.0})
                return
            end

            if (GetWeaponDamageType(weaponUsed) == 2) and weaponUsed ~= -1716189206 then 
                TriggerEvent("kayscore:ambulance:respawnPed", {coords = GetEntityCoords(PlayerPedId()), heading = 0.0})
                imKoWithMelee = true
                ESX.ShowNotification("Vous venez de tomber KO.")
                Citizen.SetTimeout(10000, function()
                    imKoWithMelee = false
                    
                      if not inAta() then 
                        ataThread(60, 1)
                     end
                end)
                while imKoWithMelee do 
                    Wait(0)
                    DisablePlayerFiring(PlayerId(), true)
                    SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
                    ResetPedRagdollTimer(PlayerPedId())
                    
                end
                SetEntityHealth(PlayerPedId(), 115)
            else
                if not PLAYERDEADLEGIT then 
                    PLAYERDEADLEGIT = true

                    local sourceOfDeath = GetPedSourceOfDeath(Player.playerPed)
                    local Killer
                
                    if IsEntityAPed(sourceOfDeath) and IsPedAPlayer(sourceOfDeath) then
                        Killer = NetworkGetPlayerIndexFromPed(sourceOfDeath)
                    elseif IsEntityAVehicle(sourceOfDeath) and IsEntityAPed(GetPedInVehicleSeat(sourceOfDeath, -1)) and IsPedAPlayer(GetPedInVehicleSeat(sourceOfDeath, -1)) then
                        Killer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(sourceOfDeath, -1))
                    end
                    local deathReason
                    if (Killer == nil) or (Killer == Player.playerId) then
                        TriggerServerEvent("kayscore:ambulance:playerDiedWithoutReason")
                    else
                        TriggerServerEvent("kayscore:ambulance:playerDiedWithReason")
                    end
                else
                    TriggerEvent("kayscore:ambulance:respawnPed", {coords = GetEntityCoords(PlayerPedId()), heading = 0.0})
                end
            end
        end
    end
end)
RegisterNetEvent('kayscore:ambulance:takeMyCall', function(k)
    Ambulance:AddBlip(Ambulance.Appelles[k].position)
end)

function Ambulance:openMenu()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    local appeles = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local sAppeles = RageUI.CreateSubMenu(appeles, '', 'Actions Disponibles')

    local interactions = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local openAta = RageUI.CreateSubMenu(interactions, '', 'Actions Disponibles')
    local employed = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    while main do Wait(1)
        -- Vérification des visibilités des menus principaux
        if RageUI.Visible(main) then
            RageUI.IsVisible(main, function()
                RageUI.Checkbox('Statut de l\'entreprise', 'Quand cette case est cochée votre ENTREPRISE est notée comme ouverte', Society.List[ESX.PlayerData.job.name].state, {}, {
                    onChecked = function()
                        secured_TriggerServerEvent('kayscore:jobs:updateSocietyStatus', true)
                    end,
                    onUnChecked = function()
                        secured_TriggerServerEvent('kayscore:jobs:updateSocietyStatus', false)
                    end
                })
                RageUI.Checkbox('Service', nil, Ambulance.Service, {}, {
                    onChecked = function()
                        TriggerServerEvent('kayscore:ambulance:service')
                    end,
                    onUnChecked = function()
                        TriggerServerEvent('kayscore:ambulance:service')
                    end
                })
                if Ambulance.Service == true then
                    RageUI.Button("Montrer son badge", nil, {}, true, {
                    onSelected = function()
                    ShowJobBadge(ESX.PlayerData.job.name)
                    end
                    })
                    RageUI.Button(('Liste des appel(s) (~g~%s~s~)'):format(Ambulance.AppellesCount), nil, {}, true, {
                        onSelected = function()
                            
                        end
                    }, appeles)
                    RageUI.Button('Intéractions avec une personne', nil, {}, true, {
                        onSelected = function()
                            
                        end
                    }, interactions)
                    RageUI.Button(('Liste des employés en service (~g~%s~s~)'):format(Ambulance.EmployedsCount), nil, {}, true, {
                        onSelected = function()
                            
                        end
                    }, employed)
                    
                    RageUI.Line()
                    RageUI.Button('Faire une annonce personnaliser', nil, {}, true, {
                        onSelected = function()
                        local jobName = ESX.PlayerData.job.name
                      KeyboardUtils.use('Contenu', function(msg)
                                    if msg == nil then return end
                                    secured_TriggerServerEvent('monjob:annoncer', msg, jobName)
                                end)
                        end
                    })
                end
            end)
        end

        -- Vérification des sous-menus
        if RageUI.Visible(appeles) then
            RageUI.IsVisible(appeles, function()
                for k,v in pairs(Ambulance.Appelles) do
                    RageUI.Button(v.name, nil, {RightLabel = v.take and '~g~Pris~s~' or '~r~Attente~s~'}, true, {
                        onSelected = function()
                            Ambulance.sAppele = k
                        end
                    }, sAppeles) 
                end
            end)
        end

        if RageUI.Visible(sAppeles) then
            RageUI.IsVisible(sAppeles, function()
                if Ambulance.Appelles[Ambulance.sAppele] ~= nil then
                    RageUI.Button('Prendre', nil, {}, Ambulance.Appelles[Ambulance.sAppele].take ~= true, {
                        onSelected = function()
                            Ambulance:RemoveBlip()
                            TriggerServerEvent('kayscore:ambulance:takeAppel', Ambulance.sAppele)
                        end
                    })
                    RageUI.Button('Finir/Supprimer', nil, {}, true, {
                        onSelected = function()
                            TriggerServerEvent('kayscore:ambulance:closeAppel', Ambulance.sAppele)
                            Ambulance:RemoveBlip()
                        end
                    })
                else
                    RageUI.Button('Revenir en arrière', nil, {}, true, {
                        onSelected = function()
                            RageUI.GoBack()
                        end
                    })
                end
            end)
        end

        if RageUI.Visible(interactions) then
            RageUI.IsVisible(interactions, function()
                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                RageUI.Button('Réanimer', nil, {}, true, {
                    onSelected = function()
                        if closestDistance ~= -1 and closestDistance <= 3 then
                            local playerPed = PlayerPedId()
                            TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                            drawBar(8000, 'Réanimation de la personne en cours', function()
                                secured_TriggerServerEvent('kayscore:ambulance:revive', GetPlayerServerId(closestPlayer))
                                ClearPedTasks(playerPed)

                                Ambulance:RemoveBlip()
                            end)
                        else
                            ESX.ShowNotification("Aucun joueur à proximité")
                        end
                    end
                })
                RageUI.Button('Soigner une petite blessure', nil, {}, true, {
                    onSelected = function()
                        if closestDistance ~= -1 and closestDistance <= 3 then
                            local playerPed = PlayerPedId()
                            TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                            drawBar(8000, 'Soins de la personne en cours', function()
                                TriggerServerEvent('kayscore:ambulance:heal', GetPlayerServerId(closestPlayer), 'p')
                                ClearPedTasks(playerPed)

                                Ambulance:RemoveBlip()
                            end)
                        else
                            ESX.ShowNotification("Aucun joueur à proximité")
                        end
                    end
                })
                RageUI.Button('Soigner une grande blessure', nil, {}, true, {
                    onSelected = function()
                        if closestDistance ~= -1 and closestDistance <= 3 then
                            local playerPed = PlayerPedId()
                            TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                            drawBar(8000, 'Soins de la personne en cours', function()
                                TriggerServerEvent('kayscore:ambulance:heal', GetPlayerServerId(closestPlayer), 'g')
                                ClearPedTasks(playerPed)

                                Ambulance:RemoveBlip()
                            end)
                        else
                            ESX.ShowNotification("Aucun joueur à proximité")
                        end
                    end
                })
                RageUI.Button("Mettre un ATA", nil, {RightLabel = '>'}, true, {}, openAta)
            end)
        end

        if RageUI.Visible(openAta) then
            RageUI.IsVisible(openAta, function()
                RageUI.Button("Attribuer un ATA (câne)", nil, {}, true, {
                    onSelected = function()
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                        if closestPlayer ~= -1 or closestDistance < 2.0 then
                            local input = lib.inputDialog(
                                title,
                                {
                                    { type = "input", label = "Temps (1-30) minutes" }
                                },
                                { allowCancel = true }
                            )
                            
                            local number = UTILS:verifyNumber(input[1], 1, 30, 2)

                            if number ~= nil then
                                TriggerServerEvent('ambulance:ata:server:setAta', GetPlayerServerId(closestPlayer), number, 1)
                            else
                                ESX.ShowNotification("Vous avez entré un temps invalide.")
                            end
                        else
                            return ESX.ShowNotification("Il y'a personne a proximité.")
                        end
                    end
                })

                RageUI.Button("Attribuer un ATA", nil, {}, true, {
                    onSelected = function()
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                        if closestPlayer ~= -1 or closestDistance < 2.0 then
                            local input = lib.inputDialog(
                                title,
                                {
                                    { type = "input", label = "Temps (1-30) minutes" }
                                },
                                { allowCancel = true }
                            )
                            
                            local number = UTILS:verifyNumber(input[1], 1, 30, 2)
                            
                            if number ~= nil then
                                TriggerServerEvent('ambulance:ata:server:setAta', GetPlayerServerId(closestPlayer), number, 0)
                            else
                                ESX.ShowNotification("Vous avez entré un temps invalide.")
                            end
                        else
                            return ESX.ShowNotification("Il y'a personne a proximité.")
                        end
                    end
                })
            end)
        end

        if RageUI.Visible(employed) then
            RageUI.IsVisible(employed, function()
                for k,v in pairs(Ambulance.Employeds) do
                    RageUI.Button(v.name, nil, {RightLabel = '~g~En Service~s~'}, true, {}) 
                end
            end)
        end

        -- Fermeture du menu principal
        if not RageUI.Visible(main) and not RageUI.Visible(appeles) and not RageUI.Visible(sAppeles) and not RageUI.Visible(interactions) and not RageUI.Visible(openAta) and not RageUI.Visible(employed) then
            main = RMenu:DeleteType('main')
        end
    end
end

RegisterCommand('ambulance_menu', function()
    if ESX.PlayerData.job.name == 'ambulancesandy' or ESX.PlayerData.job.name == 'ambulance' then
        Ambulance:openMenu()
    end
end)

RegisterKeyMapping('ambulance_menu', 'Menu Ambulance', 'keyboard', 'F6')


AddEventHandler('esx:onPlayerDeath', function()
    TriggerEvent('kayscore:ambulance:deathEvent')

    local PedKiller = GetPedSourceOfDeath(PlayerPedId())
    local KillerUniqueId
    local DeathCauseHash = GetPedCauseOfDeath(PlayerPedId())
    if IsEntityAPed(PedKiller) and IsPedAPlayer(PedKiller) then
        Killer = NetworkGetPlayerIndexFromPed(PedKiller)
    elseif IsEntityAVehicle(PedKiller) and IsEntityAPed(GetPedInVehicleSeat(PedKiller, -1)) and IsPedAPlayer(GetPedInVehicleSeat(PedKiller, -1)) then
        Killer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(PedKiller, -1))
    end

    TriggerServerEvent('kayscore:deadlogs:send', GetPlayerServerId(Killer))
end)

local rea = false

-- RegisterNuiCallback("contactEMS", function()
--     if Ambulance.LockedButton == true then return(
--         ESX.ShowNotification('Vous avez déjà contacté les secours')
--     ) end

--     Ambulance.LockedButton = true

--     TriggerServerEvent('kayscore:ambulance:call', GetEntityCoords(Player.playerPed))

--     ESX.ShowNotification('Vous avez contacté les EMS')
-- end)

RegisterNuiCallback("returnHopital", function()
    if time > 0 then return(
        ESX.ShowNotification(('Vous êtes dans le coma pour encore ~y~%s~s~ Minutes, vous pourrez retourner à l\'hôpital une fois que le temps sera écoulé'):format(time))
    ) end

    SetEntityRagdoll = false
    TriggerServerEvent('kayscore:ambulance:respawn')
    Ambulance.Appelles[ESX.PlayerData.UniqueID] = nil
    FreezeEntityPosition(PlayerPedId(), false)

    Config.Personalmenu.HudActive = true

    rea = true
end)

-- RegisterCommand('callfake', function()
--     if Ambulance.LockedButton == true then return(
--         ESX.ShowNotification('Vous avez déjà contacté les secours')
--     ) end

--     Ambulance.LockedButton = false

--     TriggerServerEvent('kayscore:ambulance:call', GetEntityCoords(Player.playerPed))

--     ESX.ShowNotification('Vous avez contacté les EMS')
-- end)

RegisterNetEvent('kayscore:ambulance:deathEvent', function()
    if imKoWithMelee then return end

    TriggerServerEvent('kayscore:ambulance:death')

    TriggerEvent('kayscore:anticheat:bypassGodMod', true)
    local PedKiller = GetPedSourceOfDeath(Player.playerPed)
    
    local KillerUniqueId
    local DeathCauseHash = GetPedCauseOfDeath(Player.playerPed)
    local Weapon = ESX.GetWeaponHash(DeathCauseHash) == nil and "Aucune" or ESX.GetWeaponHash(DeathCauseHash).label or "Aucune"  --- TODO
    if IsEntityAPed(PedKiller) and IsPedAPlayer(PedKiller) then
        Killer = NetworkGetPlayerIndexFromPed(PedKiller)
        -- print(Killer)

        ESX.TriggerServerCallback('kayscore:ambulance:getKilerID', function(bbbb)
            KillerUniqueId = bbbb
           
        end, GetPlayerServerId(Killer))

    elseif IsEntityAVehicle(PedKiller) and IsEntityAPed(GetPedInVehicleSeat(PedKiller, -1)) and IsPedAPlayer(GetPedInVehicleSeat(PedKiller, -1)) then
        Killer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(PedKiller, -1))

        ESX.TriggerServerCallback('kayscore:ambulance:getKilerID', function(bbbb)
            
            KillerUniqueId = bbbb
          
        end, GetPlayerServerId(Killer))

    end
	local deathReason
    if (Killer == Player.playerId) then
        deathReason = 'Suicide'
    elseif (Killer == nil) then
        deathReason = 'Mort inconnu'
    else
        ESX.TriggerServerCallback('kayscore:ambulance:getKilerID', function(bbbb)
            KillerUniqueId = bbbb
           
        end, Killer)
		deathReason = "Vous avez été tué par quelqu'un"
    end
    Ambulance:launchTimer()

    rea = false
    time = 6

    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    Citizen.CreateThread(function()
		RespawnPed(playerPed, {coords = coords, heading = 0.0})
		AnimpostfxStop('DeathFailOut')
		DoScreenFadeIn(800)

	end)
    if kayscoreAmulance.Ambulance.UIrevive then
        local weapon = 	GetPedCauseOfDeath(PlayerPedId())

        -- if weapon == GetHashKey('WEAPON_UNARMED') then return end
        
        rea = false
        DisplayRadar(false)
        TriggerEvent('tempui:toggleUi', false)
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "emsYes"
        })
    
        SetEntityRagdoll = true
    
        while not rea do Wait(0)
            TriggerEvent('kayscore:anticheat:bypassGodMod', true)
            local ped = PlayerPedId()
            SetEntityInvincible(ped, true)
            SetEntityRagdoll = true
    
            if SetEntityRagdoll then
                SetPedToRagdoll(ped, 1000, 0, 0, 0, 0, 0)
            end
        end
    
        SetNuiFocus(false, false)
        SendNUIMessage({
            action = "emsNone"
        })
        SendNUIMessage({
            action = "not"
        })
        SetEntityRagdoll = false
        Ambulance.LockedButton = false
        SetEntityInvincible(PlayerPedId(), false)
        TriggerEvent('kayscore:anticheat:bypassGodMod', false)
        DisplayRadar(true)
        TriggerEvent('tempui:toggleUi', true)
    else
        exports['inv']:closeInventory()
        local main = RageUI.CreateMenu('', 'Actions Disponibles')

        main.Closable = false

        Ambulance.LockedButton = false
        
        RageUI.Visible(main, not RageUI.Visible(main))

        rea = false
        time = 6

        while main do
            Wait(1)

            RageUI.IsVisible(main, function()
                -- TriggerEvent('kayscore:anticheat:bypassGodMod', true)
                local ped = PlayerPedId()
                SetEntityInvincible(ped, true)
                SetEntityRagdoll = true
        
                if SetEntityRagdoll then
                    SetPedToRagdoll(ped, 1000, 0, 0, 0, 0, 0)
                end

                if time > 0 then 
                    RageUI.Separator(('Temps restant: ~g~%s~s~ minute(s)'):format(time))
                end

                RageUI.WLine()

                RageUI.Button('Contacter les EMS', nil, {}, not Ambulance.LockedButton, {
                    onSelected = function()
                        if Ambulance.LockedButton == true then return(
                            ESX.ShowNotification('Vous avez déjà contacté les secours')
                        ) end
                    
                        Ambulance.LockedButton = true
                    
                        TriggerServerEvent('kayscore:ambulance:call', GetEntityCoords(Player.playerPed))
                    
                        ESX.ShowNotification('Vous avez contacté les EMS')
                    end
                })
                RageUI.Button('Réaparaitre à L\'hôpital', "Vous avez 3 chance sur 10 de perdre vos objets illégaux", {}, time < 1, {
                    onSelected = function()
                        if time > 0 then return(
                            ESX.ShowNotification(('Vous êtes dans le coma pour encore ~y~%s~s~ Minutes, vous pourrez retourner à l\'hôpital une fois que le temps sera écoulé'):format(time))
                        ) end

                        RageUI.CloseAll()
                    
                        SetEntityRagdoll = false
                        TriggerServerEvent('kayscore:ambulance:respawn')
                        Ambulance.Appelles[ESX.PlayerData.UniqueID] = nil
                        FreezeEntityPosition(PlayerPedId(), false)
                        local playerPed = PlayerPedId()
                        local coords = GetEntityCoords(playerPed)
                        Citizen.CreateThread(function()
                            RespawnPed(playerPed, {coords = coords, heading = 0.0})
                            AnimpostfxStop('DeathFailOut')
                            DoScreenFadeIn(800)
                        end)

                        Wait(1000)

                        ReviveIteract()
                
                        rea = true
                    end
                })
            RageUI.Button('Réaparaitre à L\'hôpital en signalant un Freekill', "Vous avez 3 chance sur 10 de perdre vos objets illégaux", {}, time < 1, {
                    onSelected = function()
                        if deathReason == "Vous avez été tué par quelqu'un" then 
                        if time > 0 then return(
                            ESX.ShowNotification(('Vous êtes dans le coma pour encore ~y~%s~s~ Minutes, vous pourrez retourner à l\'hôpital une fois que le temps sera écoulé'):format(time))
                        ) end

                        RageUI.CloseAll()
                        ExecuteCommand('report Freekill (Report EMS Auto)')
                        SetEntityRagdoll = false
                        TriggerServerEvent('kayscore:ambulance:respawn')
                        Ambulance.Appelles[ESX.PlayerData.UniqueID] = nil
                        FreezeEntityPosition(PlayerPedId(), false)
                        local playerPed = PlayerPedId()
                        local coords = GetEntityCoords(playerPed)
                        Citizen.CreateThread(function()
                            RespawnPed(playerPed, {coords = coords, heading = 0.0})
                            AnimpostfxStop('DeathFailOut')
                            DoScreenFadeIn(800)
                        end)

                        Wait(1000)

                        ReviveIteract()
                
                        rea = true
                    else
                    ESX.ShowNotification('Vous ne vous êtes pas fais tuer par un joueur')
                    end
                end
                })
                RageUI.Button('Information de ma mort', nil, {}, true, {
                onSelected = function()
                    if deathReason == "Vous avez été tué par quelqu'un" then 
                    ESX.ShowNotification("Information de votre Mort\n" .. deathReason.."\n ID:"..KillerUniqueId)
                else
                    ESX.ShowNotification("Information de votre Mort\n" .. deathReason, "Aucun")
                    end
                end
            })

            end)

            if not RageUI.Visible(main) then
                main = RMenu:DeleteType('main')
                SetEntityRagdoll = false
                Ambulance.LockedButton = true
                SetEntityInvincible(PlayerPedId(), false)
                TriggerEvent('kayscore:anticheat:bypassGodMod', false)
                DisplayRadar(true)
            end
        end
    end
end)

function Ambulance:launchTimer()
    Config.Personalmenu.HudActive = false
    -- SendNUIMessage({
    --     action = 'time',
    --     time = time
    -- })
    SetTimeout(1500, function()
        SetEntityRagdoll = true
        CreateThread(function()
            while SetEntityRagdoll do 
                Wait(60000)

                time = time - 1

                -- SendNUIMessage({
                --     action = 'time',
                --     time = time
                -- })
                
                if time <= 0 then
                    SetEntityRagdoll = false
                    break
                end
            end
        end)

        CreateThread(function()
            while SetEntityRagdoll do
                Wait(1)
                DisableControlAction(0, 249, true)
            end
        end)
    end)
end
local function createBedCam()
	if not DoesCamExist(bedCam) then
        bedCam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
	end
	local playerCoords = GetEntityCoords(PlayerPedId())
	local camCoords = vector3(playerCoords.x, playerCoords.y, playerCoords.z + 2.0)

	SetCamCoord(bedCam, camCoords)
	SetCamRot(bedCam, 270.0, 0.0, 70.0, true)
    SetCamActive(bedCam, true)
    RenderScriptCams(true, true, 500, true, true)
    -- isCameraActive = true
end
local function getAvailableRespawnBed(hospital)
    local hospital = kayscoreAmulance.Ambulance.respawns["ambulance"]

    if ESX.Table.SizeOf(hospital.beds) > 0 then
        for _, bed in pairs(hospital.beds) do
            local player, distance = ESX.Game.GetClosestPlayer(vector3(bed.x, bed.y, bed.z))
            if player == -1 or distance > 1.5 then
                return bed
            end
        end
    end

	return vector4(hospital.position.x, hospital.position.y, hospital.position.z, hospital.position.w)
end
local function deleteBedCam()
    SetCamActive(bedCam, false)
    RenderScriptCams(false, true, 500, true, true)
	DestroyCam(bedCam, false)
    -- isCameraActive = false
end
exports('playerDead', function()
    return getIsDead()
end)
function ReviveIteract()
    inBed = true
        Citizen.CreateThread(function()
        while inBed do 
			DisableAllControlActions(0)
			EnableControlAction(0, 47, true)
			EnableControlAction(0, 245, true)
			EnableControlAction(0, 38, true)
            ExecuteCommand('e sleep')
            Citizen.Wait(0)
        end
    end)
    Citizen.CreateThread(function()
        local bedPos = getAvailableRespawnBed(hospital)
        
        ClearPedSecondaryTask(Player.playerPed)
        ClearPedTasksImmediately(Player.playerPed)

        ESX.Game.Teleport(Player.playerPed, bedPos)
        
        StartScreenEffect('Rampage', 0, true)
        TriggerScreenblurFadeIn(1000.0)
        Citizen.Wait(1000)

        createBedCam()

        ExecuteCommand('e sleep')
        DrawMissionText("Vous vous reposez dans le lit...", 30000)
        Citizen.Wait(30000)

        deleteBedCam()
        ESX.ShowNotification("Vous récuperez doucement.")
        if not inAta() then 
            ataThread(180, 1)
        end
        inBed = false
        ClearPedSecondaryTask(Player.playerPed)
        ClearPedTasksImmediately(Player.playerPed)
        Citizen.Wait(15000)
        TriggerScreenblurFadeOut(3000.0)
        StopScreenEffect('Rampage')

    end)
end
function Ambulance:AddBlip(coords)
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, 1)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.5)
    SetBlipColour(blip, 42)
    SetBlipAsShortRange(blip, true)
    EndTextCommandSetBlipName(blip)
    SetBlipRoute(blip, 1)
    Ambulance.MyBlip[blip] = blip
end

function Ambulance:RemoveBlip()
    for k,v in pairs(Ambulance.MyBlip) do
        RemoveBlip(v)
        SetBlipRoute(v, 0)
    end
end

local time = 8

secured_RegisterNetEvent('kayscore:admin:revive', function()
    --if not adminManagement.Service then return end
    rea = true
    RageUI.CloseAll()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    DoScreenFadeOut(800)
    Wait(1000)
    SetEntityRagdoll = false
    time = 8
    ESX.ShowNotification('Vous avez été réanimé par un Staff')
    --ataThread(180, 1)
    TriggerServerEvent('kayscore:ambulance:sql:removedead')
    DoScreenFadeIn(800)
    Citizen.CreateThread(function()
		RespawnPed(playerPed, {coords = coords, heading = 0.0})
		AnimpostfxStop('DeathFailOut')
	end)

    
    
    ExecuteCommand(('walk %s'):format(getWalkStyle()))
    SendNUIMessage({
        action = "emsNone"
    })
    SendNUIMessage({
        action = "not"
    })
    Config.Personalmenu.HudActive = true
end)

secured_RegisterNetEvent('kayscore:ambulance:revive', function()
    rea = true
    RageUI.CloseAll()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    DoScreenFadeOut(800)
    Wait(1000)
    SetEntityRagdoll = false
    time = 8
    ESX.ShowNotification('Vous avez été réanimé par un EMS')
    ataThread(180, 1)
    TriggerServerEvent('kayscore:ambulance:sql:removedead')
    DoScreenFadeIn(800)
    Citizen.CreateThread(function()
		RespawnPed(playerPed, {coords = coords, heading = 0.0})
		AnimpostfxStop('DeathFailOut')
	end)

    
    
    ExecuteCommand(('walk %s'):format(getWalkStyle()))
    SendNUIMessage({
        action = "emsNone"
    })
    SendNUIMessage({
        action = "not"
    })
    Config.Personalmenu.HudActive = true
end)

RegisterNetEvent('kayscore:ambulance:heal', function(type)
    local ped = PlayerPedID5
    ExecuteCommand(('walk %s'):format(getWalkStyle()))
    if type == 'p' then
        SetEntityHealth(ped, GetEntityHealth(ped) + 50)
    else

        SetEntityHealth(ped, 200)
    end
end)

-- RegisterNetEvent('kayscore:ambulance:onPlayerDeath', function()
--     print(imKoWithMelee)
--     if imKoWithMelee then return end
--     -- local weapon = 	GetPedCauseOfDeath(PlayerPedId())

--     -- if weapon == GetHashKey('WEAPON_UNARMED') then return end

--     TriggerServerEvent('kayscore:ambulance:deathReturn')

--     rea = false
--     time = 8

--     local playerPed = PlayerPedId()
--     local coords = GetEntityCoords(playerPed)
--     Citizen.CreateThread(function()
-- 		RespawnPed(playerPed, {coords = coords, heading = 0.0})
-- 		AnimpostfxStop('DeathFailOut')
-- 		DoScreenFadeIn(800)

--         Ambulance:launchTimer()
-- 	end)
-- end)

function Ambulance:openPharmacieMenu()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            for k,v in pairs(Ambulance.Items) do
                RageUI.Button(v.label, nil, {RightLabel = '~g~GRATUIT~s~'}, true, {
                    onSelected = function()
                        TriggerServerEvent('kayscore:ambulance:buyitem', v.name)
                    end
                })
            end
        end)

        if not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

function Ambulance:openBossMenu(job)
    local main = RageUI.CreateMenu('', 'Actions Disponibles')
    local accountGestion = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Button('Gestion des comptes', nil, {}, true, {
                onSelected = function()
                    RefrehEntrepriseMoney()
                end
            }, accountGestion)
        end)

        RageUI.IsVisible(accountGestion, function()
            RageUI.Separator('Compte de la société')
            RageUI.Button('Argent de la société: '..Config.Personalmenu.soceityMoney, nil, {}, true, {
                onSelected = function()
                end
            })
            RageUI.Line()
            RageUI.Button('Déposer de l\'argent', 'Argent en banque', {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Montant à déposer', function(data)
                        local data = tonumber(data)
                        if data == nil or data <= 0  then return end

                        TriggerServerEvent('kayscore:ambulance:moneyBoss', ('society_%s'):format("ambulance"), data, 'deposit')
                    end)
                end
            })
            RageUI.Button('Prendre de l\'argent', 'Argent du coffre', {}, true, {
                onSelected = function()
                    KeyboardUtils.use('Montant à prendre', function(data)
                        local data = tonumber(data)
                        if data == nil or data <= 0  then return end

                        TriggerServerEvent('kayscore:ambulance:moneyBoss', ('society_%s'):format("ambulance"), data, 'remove')
                    end)
                end
            })
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(accountGestion) then 
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

Citizen.CreateThread(function()
    while ESX == nil do Wait(1) end
    AddZones('pharmacie_emssandy', {
        Position = vector3(1768.037842, 3639.960693, 34.852558),
        Dist = 10,
        Public = false,
        Job = {['ambulancesandy'] = true},
        Job2 = nil,
        GradesJobRequire = false,
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = false,
            -- Position = vector3(2745.4719238281, 3477.0629882813, 55.671112060547),
            -- BlipId = 605,
            -- Color = 46,
            -- Scale = 0.6,
            -- Text = '[SERVICE] Supermarché'
        },
        ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
        Action = function()
            Ambulance:openPharmacieMenu()
        end
    })
    AddZones('pharmacie_ems', {
        Position = vec3(297.985870, -592.665527, 43.269871),
        Dist = 10,
        Public = false,
        Job = {['ambulance'] = true},
        Job2 = nil,
        GradesJobRequire = false,
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = false,
            -- Position = vector3(2745.4719238281, 3477.0629882813, 55.671112060547),
            -- BlipId = 605,
            -- Color = 46,
            -- Scale = 0.6,
            -- Text = '[SERVICE] Supermarché'
        },
        ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
        Action = function()
            Ambulance:openPharmacieMenu()
        end
    })
    AddZones('defibrilateur_emssandy', {
        Position = vector3(1761.809082, 3638.135498, 34.851868),
        Dist = 10,
        Public = true,
        Job = nil,
        Job2 = nil,
        GradesJobRequire = false,
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = false,
            -- Position = vector3(2745.4719238281, 3477.0629882813, 55.671112060547),
            -- BlipId = 605,
            -- Color = 46,
            -- Scale = 0.6,
            -- Text = '[SERVICE] Supermarché'
        },
        ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
        Action = function()
            OpenDefebrilateurTaMams()
        end
    })
    AddZones('defibrilateur_ems', {
        Position = vec3(300.601837, -588.521118, 43.269863),
        Dist = 10,
        Public = true,
        Job = nil,
        Job2 = nil,
        GradesJobRequire = false,
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = false,
            -- Position = vector3(2745.4719238281, 3477.0629882813, 55.671112060547),
            -- BlipId = 605,
            -- Color = 46,
            -- Scale = 0.6,
            -- Text = '[SERVICE] Supermarché'
        },
        ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
        Action = function()
            OpenDefebrilateurTaMams()
        end
    })
    -- AddZones('boss_ems', {
    --     Position = vector3(-458.6014, -297.2721, 34.91079),
    --     Dist = 10,
    --     Public = false,
    --     Job = {['ambulance'] = true},
    --     Job2 = nil,
    --     GradesJobRequire = true,
    --     GradesJob = {['boss'] = true},
    --     InVehicleDisable = true,
    --     Blip = {
    --         Active = false,
    --         -- Position = vector3(2745.4719238281, 3477.0629882813, 55.671112060547),
    --         -- BlipId = 605,
    --         -- Color = 46,
    --         -- Scale = 0.6,
    --         -- Text = '[SERVICE] Supermarché'
    --     },
    --     ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
    --     Action = function()
    --         Ambulance:openBossMenu()
    --     end
    -- })
end)

-- AddEventHandler('esx_newui:updateBasics', function(status)
-- 	for k,v in pairs(status) do
-- 		if v.name == "hunger" then
-- 			TriggerEvent('esx:status:update', v.name, v.percent)
-- 		end
-- 		if v.name == "thirst" then
-- 			TriggerEvent('esx:status:update', v.name, v.percent)
-- 		end
-- 	end
-- end)

-- RegisterNetEvent('esx:status:update', function(statusName, newCount)
--     if statusName == 'food' or statusName == 'drink' then
--         if threadStatus == true and newCount >= 1 then 
--             threadStatus = false
--         end
--     end
    
--     if statusName == 'hunger' then 
--         if newCount <= 25 and newCount >= 11 then
--             ESX.ShowNotification('Je commence à avoir faim...')
--         end

--         if newCount <= 10 and newCount >= 6 then
--             ESX.ShowNotification('Je commence à avoir vraiment très faim...')
--         end

--         if newCount <= 5 then
--             ESX.ShowNotification('Il faut que je mange en urgence.')
--         end

--         if newCount == 0 then
--             if threadStatus == true then return end
    
--             threadStatus = true
    
--             while threadStatus and not (playerIsDead()) do 
--                 Wait(1000)
--                 local health = GetEntityHealth(Player.playerPed)

--                 SetEntityHealth(Player.playerPed, health-1)
--                 ExecuteCommand('ragodoll')
--             end
--             threadStatus = false
--         end
--         return
--     end

--     if statusName == 'tshirt' then 
--         if newCount <= 25 and newCount >= 11 then
--             ESX.ShowNotification('Je commence à avoir soif...')
--         end

--         if newCount <= 10 and newCount >= 6 then
--             ESX.ShowNotification('Je commence à avoir vraiment très soif...')
--         end

--         if newCount <= 5 then
--             ESX.ShowNotification('Je dois boire en urgence.')
--         end

--         if newCount == 0 then
--             if threadStatus == true then return end
    
--             threadStatus = true
    
--             while threadStatus and not (playerIsDead()) do 
--                 Wait(1000)
--                 local health = GetEntityHealth(Player.playerPed)

--                 SetEntityHealth(Player.playerPed, health-1)
--                 ExecuteCommand('ragodoll')
--             end
--             threadStatus = false
--         end
--         return
--     end
-- end)

function getIsDead()
    return SetEntityRagdoll
end

exports('geIsDead', function()
    return getIsDead()
end)