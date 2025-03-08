CreateThread(function()
    for k,v in pairs(kayscoreConfigServ.Fishing.fishList.Zones) do
        for i,p in pairs(v) do
            local FishingZone = AddBlipForRadius(p.position, p.radius)
            SetBlipSprite(FishingZone,1)
            SetBlipColour(FishingZone, p.color)
            SetBlipAlpha(FishingZone,100)

            local FishingZoneBlip = AddBlipForCoord(p.position)
            SetBlipSprite(FishingZoneBlip, 317)
            SetBlipColour(FishingZoneBlip, p.color)
            SetBlipScale(FishingZoneBlip, 0.5)
            SetBlipAsShortRange(FishingZoneBlip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(p.zone)
            EndTextCommandSetBlipName(FishingZoneBlip)
        end
    end

    local zone = {
        name = nil,
        label = nil,
        boost = 0,
        level = 0,
        random = math.random(3000, 15000) ,
        isFish = false,
        fish = nil,
        isKeyPressed = false,
        keyPressedTime = 0,
        elapsedTime;
    }

    function getRandomFish()
        local totalRarity = 0

        local boost = zone.boost
        boost = boost * zone.level / 10

        for k,v in pairs(kayscoreConfigServ.Fishing.fishList.FishList[zone.name]) do
            totalRarity = totalRarity + (1 / v.rarity) * boost
        end

        local randomValue = math.random() * totalRarity

        for k,v in pairs(kayscoreConfigServ.Fishing.fishList.FishList[zone.name]) do
            randomValue = randomValue - (1 / v.rarity) * boost

            if randomValue <= 0 then
                return v
            end
        end
    end

    RegisterNetEvent('kayscoreServ:fishing:updateRod', function(durr)
        zone.dura = durr
    end)

    RegisterNetEvent('kayscoreServ:fishing:zone:start', function(canName, durr)
        if kayscoreConfigServ.Fishing.fishList.IsFishing then return(
            ESX.ShowNotification('~r~Vous êtes déjà entrain de pêcher~s~')
        )
        end

        zone = {
            name = nil,
            label = nil,
            boost = 0,
            level = 0,
            random = math.random(1000, 5000) ,
            isFish = false,
            fish = nil,
            isKeyPressed = false,
            keyPressedTime = 0,
            elapsedTime;
        }
    
        for k,v in pairs(kayscoreConfigServ.Fishing.fishList.FishingRod) do
            -- print(v.name, v.fish)
            if v.name == canName then
                zone.boost = v.boost
                -- zone.dura = v.fish
                

                if v.boutique == false then
                    zone.dura = durr
                else
                    zone.dura = 'Illimité'
                end
            end
        end

    
        for k,v in pairs(kayscoreConfigServ.Fishing.fishList.Zones) do
            for i,p in pairs(v) do
                local dist = #(Player.coords-vector3(p.position.x, p.position.y, p.position.z))

                if dist > 120 then goto continue end

                zone.name = k
                zone.label = p.zone

                ::continue::
            end
        end

        if zone.name == nil then
            return(
                ESX.ShowNotification('~r~Vous n\'êtes pas dans une zone de pêche !~s~')
            )
        end

        ESX.ShowNotification(('Vous avez commencé à pêcher dans la zone: ~p~%s~s~'):format(zone.label))

        Wait(1000)


        stopfish = function()
            SetTimeout(2000, function()
                if not kayscoreConfigServ.Fishing.fishList.IsFishing then
                    exports['ui']:hideInfo()
                end
            end)
        end

        CreateThread(function()
            local waiting = 0
            if not fishing.player[Player.UniqueID] then
                ESX.TriggerServerCallback('kayscoreServ:fishing:getInformations', function(cb)
                    if not cb then return end
        
                    if not fishing.player[Player.UniqueID] then
                        fishing.player[Player.UniqueID] = cb
                    end
                end)
        
            end
    
            while not fishing.player[Player.UniqueID] do Wait(1) end
    
            local PlayerData = fishing.player[Player.UniqueID]

            zone.level = PlayerData.level
    
            kayscoreConfigServ.Fishing.fishList.IsFishing = true

            TaskStartScenarioInPlace(Player.playerPed, 'WORLD_HUMAN_STAND_FISHING')

            
            while kayscoreConfigServ.Fishing.fishList.IsFishing do
                Wait(1)

                if not zone.isFish then
                    ESX.ShowHelpNotification('[ ~INPUT_CELLPHONE_CANCEL~ ] Arrêter de pêcher')
                end

                if IsControlJustPressed(0, 177) then
                    kayscoreConfigServ.Fishing.fishList.IsFishing = false
                    zone.isFish = false
                    kayscoreConfigServ.Fishing.fishList.Lures = false
                    zone.random = math.random(1000, 5000)
                    exports['ui']:hideInfo()
                    ClearPedTasks(Player.playerPed)
                    stopfish()
                end

                exports['ui']:drawInfo('Informations Pêche', {
                    {title = 'Zone de Pêche', subtitle = zone.label},
                    {title = 'XP', subtitle = zone.level},
                    {title = 'Boost de Pêche', subtitle = ('x%s'):format(zone.boost)},
                    {title = 'Durabilité de la canne à pêche', subtitle = ('x%s'):format(zone.dura)},
                })

                if kayscoreConfigServ.Fishing.fishList.Lures == false then
                    DrawTextPrice('Acrrocher un appât à l\'hameçon')
                end

                if kayscoreConfigServ.Fishing.fishList.Lures == true then
                    waiting = waiting + 1

                    if waiting >= zone.random and not zone.isFish then

                        zone.fish = getRandomFish()

                        ESX.ShowNotification('Nouveau poisson au bout de la ligne !')

                        zone.isFish = true

                        debutFishingRod = GetGameTimer()
                    end

                    if zone.isFish == true then

                        if not zone.isKeyPressed then
                            if GetGameTimer() - debutFishingRod >= 2000 then
                                zone.isFish = false
                                kayscoreConfigServ.Fishing.fishList.Lures = false
                                zone.random = math.random(1000, 5000)
                                ESX.ShowNotification('Vous avez attendue trop longtemps, le poisson s\'est décroché.')
                            end
                        end

                        DrawInstructionBarNotification(Player.coords.x, Player.coords.y, Player.coords.z, '[~r~E~s~] pour mouliner')

                        if IsControlPressed(0,54) then
                            if not zone.isKeyPressed then
                                zone.isKeyPressed = true
                                zone.keyPressedTime = GetGameTimer()
        
                                drawBar(zone.fish.moulinage*1000, ('Moulinage en cours (%s secondes)'):format(zone.fish.moulinage), function()
                                end)
                            end
                        else
                            if zone.isKeyPressed  then
                                zone.isKeyPressed = false
                                zone.elapsedTime = GetGameTimer() - zone.keyPressedTime
                                if zone.elapsedTime >= zone.fish.moulinage*1000 then
                                    PlayerData = fishing.player[Player.UniqueID]
                                    zone.isFish = false
                                    kayscoreConfigServ.Fishing.fishList.Lures = false
                                    zone.random = math.random(1000, 5000)
                                    zone.isKeyPressed = false
                                    zone.keyPressedTime = 0
                                    zone.elapsedTime = nil
                                    -- hideBar()
                                    waiting = 0
                                    secured_TriggerServerEvent('kayscoreServ:fishing:fish:give', zone.fish.name, zone.fish.label, canName)
                                else
                                    ESX.ShowNotification('Vous avez arrêté de mouliner, le poisson est partie ! ~r~Ressayer encore~s~')
                                    zone.isFish = false
                                    kayscoreConfigServ.Fishing.fishList.Lures = false
                                    zone.random = math.random(1000, 5000)
                                    zone.isKeyPressed = false
                                    zone.keyPressedTime = 0
                                    zone.elapsedTime = nil
                                    waiting = 0
                                    -- hideBar()
                                end
                            end
                        end
                    end
                end
            end
        end)
    end)

    RegisterNetEvent('kayscoreServ:fishing:lures:activate', function(Table)
        if not kayscoreConfigServ.Fishing.fishList.IsFishing then
            return(
                ESX.ShowNotification('~r~Vous n\'êtes actuellement pas entrain de pêcher~s~')
            )
        end

        if Table[1] ~= zone.name then
            return(
                ESX.ShowNotification('~r~Vous ne pouvez pas utiliser cet appât pour ce type de pêche.~s~')
            )
        end

        if kayscoreConfigServ.Fishing.fishList.Lures == true then
            return(
                ESX.ShowNotification('~r~Vous avez déjà un appât accroché à votre canne à pêche !~s~')
            )
        end

        kayscoreConfigServ.Fishing.fishList.Lures = true

        secured_TriggerServerEvent('kayscoreServ:fishing:lures:remove', Table[2])

        ESX.ShowNotification(('Vous avez utilisé l\'appât: ~p~%s~s~'):format(Table[3]))
    end)

    RegisterNetEvent('kayscoreServ:fishing:client:updateLevel', function(level)
        zone.level = level
        fishing.player[Player.UniqueID].level = level
    end)

    RegisterNetEvent('kayscoreServ:fishing:client:stop', function()
        kayscoreConfigServ.Fishing.fishList.IsFishing = false
        zone.isFish = false
        kayscoreConfigServ.Fishing.fishList.Lures = false
        zone.random = math.random(1000, 5000)
        exports['ui']:hideInfo()
        ClearPedTasks(Player.playerPed)
        SetTimeout(2000, function()
            if not kayscoreConfigServ.Fishing.fishList.IsFishing then
                exports['ui']:hideInfo()
            end
        end)
    end)
end)