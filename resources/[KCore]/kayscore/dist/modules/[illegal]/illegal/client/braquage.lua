local inNotif = false
local inBraquage = false

function CONFIG_BRAQUAGE_MAISON.Start(id)
    inNotif = false
    inBraquage = false

    inBraquage = true
    secured_TriggerServerEvent('kayscore:braq:setBraq', id)
    secured_TriggerServerEvent('kayscore:braq:police:alert', id)

    ESX.ShowNotification('Vous Crocheter la sérrure ...')

    RequestAnimDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')
    while not HasAnimDictLoaded('anim@amb@clubhouse@tutorial@bkr_tut_ig3@') do
        Citizen.Wait(0)
    end
    TaskPlayAnim(Player.playerPed, 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@' , 'machinic_loop_mechandplayer' ,8.0, -8.0, -1, 1, 0, false, false, false )

    Wait(10000)

    inNotif = true

    CreateThread(function()
        while inNotif do Wait(1)
            ESX.ShowHelpNotification("Appuyez sur ~r~E~s~ pour enfoncer la porte")

            if IsControlJustPressed(0, 54) then
                inNotif = false
            end
        end

        ExecuteCommand('e push2')

        Wait(8000)

        ESX.ShowNotification('Porte Enfoncée avec succès')

        DoScreenFadeOut(2000)
        Wait(2500)
        SetEntityCoords(Player.playerPed, CONFIG_BRAQUAGE_MAISON.List[id].interior)
        DoScreenFadeIn(2000)

        local fakeTable = CONFIG_BRAQUAGE_MAISON.List[id].objects

        CreateThread(function()

            local blips = {}

            for k,v in pairs(fakeTable) do
                blips[k] = AddBlipForCoord(v.position.x, v.position.y, v.position.z)
                SetBlipSprite(blips[k], 1)
                SetBlipScale(blips[k], 0.5)
                SetBlipColour(blips[k], 1)
                SetBlipAsShortRange(blips[k], true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString('Objet à Voler')
                EndTextCommandSetBlipName(blips[k])
            end

            while inBraquage do 
                Wait(1)

                if #fakeTable < 1 then
                    --@todo

                    DoScreenFadeOut(2000)
                    Wait(2500)
                    SetEntityCoords(Player.playerPed, CONFIG_BRAQUAGE_MAISON.List[id].position)
                    DoScreenFadeIn(2000)

                    secured_TriggerServerEvent('kayscore:braq:finish', id)

                    inBraquage = false

                    ESX.ShowNotification('Le braquage est terminé ! Cours avant que la police t\'intercepte !')
                end

                Player.coords = GetEntityCoords(Player.playerPed)

                DrawInstructionBarNotification(Player.coords.x, Player.coords.y, Player.coords.z, ("%s%s~s~ Objets restants"):format(UTILS.COLORCODE, #fakeTable))
                
                for k,v in pairs(fakeTable) do
                    DrawMarker(21, v.position.x, v.position.y, v.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)

                    if #(Player.coords-vector3(v.position.x, v.position.y, v.position.z)) < 2 then
                        ESX.ShowHelpNotification('E pour ~r~Voler~s~')

                        if IsControlJustPressed(0, 54) then

                            local dict, anim = 'random@domestic', 'pickup_low'

                            ESX.Streaming.RequestAnimDict(dict)
                            TaskPlayAnim(Player.playerPed, dict, anim, -1.0, -1.0, 3000, 0, 0, true, true, true)

                            Citizen.Wait(2000)

                            ClearPedTasks(Player.playerPed)
                            FreezeEntityPosition(Player.playerPed, false)

                            RemoveBlip(blips[k])

                            secured_TriggerServerEvent('kayscore:braq:recupObject', v.price)

                            table.remove(fakeTable, k)
                        end
                    end
                end
            end 
        end)
    end)
end

function OpenInteractBraquage(id)
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(Player.playerPed, true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Button('Commencer à Braquer cette Propriété', nil, {RightLabel = '→'}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('kayscore:braq:getItems', function(cb)
                        if cb == "player_dont_have_crochetageItem" then
                            ESX.ShowNotification('~r~Vous ne possedez pas de Kit de Crochetage sur vous !~s~')

                            return
                        end

                        if not cb then return end

                        RageUI.CloseAll()

                        CONFIG_BRAQUAGE_MAISON.Start(id)
                    end, id)
                end
            })
        end)

        if not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(Player.playerPed, false)
        end
    end
end

CONFIG_BRAQUAGE_MAISON.ADDBLIP = {}

secured_RegisterNetEvent('kayscore:braq:alert', function(id)
    local mansion = CONFIG_BRAQUAGE_MAISON.List[id]

    if not mansion then return end

    local position = mansion.position

    CONFIG_BRAQUAGE_MAISON.ADDBLIP[id] = AddBlipForCoord(position.x, position.y, position.z)
    SetBlipSprite(CONFIG_BRAQUAGE_MAISON.ADDBLIP[id] , 161)
    SetBlipScale(CONFIG_BRAQUAGE_MAISON.ADDBLIP[id] , 2.0)
    SetBlipColour(CONFIG_BRAQUAGE_MAISON.ADDBLIP[id], 1)
    PulseBlip(CONFIG_BRAQUAGE_MAISON.ADDBLIP[id])

    ESX.ShowNotification('Un braquage de Maison est actuellement en cours.... La position a était défini sur votre GPS !')
end)

secured_RegisterNetEvent('kayscore:braq:stopalert', function(id)
    if not CONFIG_BRAQUAGE_MAISON.ADDBLIP[id] then return end

    RemoveBlip(CONFIG_BRAQUAGE_MAISON.ADDBLIP[id])

    CONFIG_BRAQUAGE_MAISON.ADDBLIP[id] = nil
end)

CreateThread(function()
    while not ESXLoaded do Wait(1) end

    local interval = 2000
    while true do
        Wait(interval)

        interval = 2000

        for k,v in pairs(CONFIG_BRAQUAGE_MAISON.List) do
            local dist = #(Player.coords-v.position)

            if dist > 15 then goto continue end

            if not inBraquage then
                interval = 1

                DrawMarker(25, v.position.x, v.position.y, v.position.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)
    
                if dist < 2 then
                    DrawInstructionBarNotification(v.position.x, v.position.y, v.position.z, ("Appuyez sur [%s E ~s~] pour intéragir"):format(UTILS.COLORCODE))
    
                    if IsControlJustPressed(0,54) then
                        OpenInteractBraquage(k)
                    end
                end
            end

            ::continue::
        end
    end
end)

CreateThread(function()
    
    AddZones('illegal_shop', {
        Position = kayscoreConfigServ.IllegalShops.Pos,
        Dist = 10,
        Public = true,
        Job = nil,
        Job2 = nil,
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = false,
        },
        ActionText = 'Appuyez sur [ '..kayscoreConfigServ.GTACOLOR..'E~w~ ] pour intéragir',
        Action = function()
            exports['shop']:OpenShop('illegal')
        end
    })

    for k,v in pairs(CONFIG_BRAQUAGE_MAISON.List) do
        local blip = AddBlipForCoord(v.position.x, v.position.y, v.position.z)
        SetBlipSprite(blip, 586)
        SetBlipScale(blip, 0.5)
        SetBlipColour(blip, 17)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.name)
        EndTextCommandSetBlipName(blip)
    end
end)