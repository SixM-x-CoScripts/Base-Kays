function AsxenseuropenMenu(table, t)
    local main = RageUI.CreateMenu('', 'Ascenseur')

    RageUI.Visible(main, not RageUI.Visible(main))
    FreezeEntityPosition(PlayerPedId(), true)
    while main do Wait(1)
        RageUI.IsVisible(main, function()
            for k,v in ipairs(table) do
                if v.t == t then
                    RageUI.Button(v.label, nil, {}, true, {
                        onSelected = function()
                            DoScreenFadeOut(1300)
                            RageUI.CloseAll()
                            Wait(2300)
                            SetEntityCoords(Player.playerPed, v.position)
                            DoScreenFadeIn(1300)
                        end
                    })
                end
            end
        end)

        if not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

function AsxenseuropenAcceuilMenu(job, message, label)
   local main = RageUI.CreateMenu('', 'Acceuil')

    RageUI.Visible(main, not RageUI.Visible(main))

    while main do Wait(1)
        RageUI.IsVisible(main, function()
            RageUI.Button('Appeler un membre du personnel '..label, nil, {}, not kayscoreConfigServ.Elevator.acceuil.cooldown, {
                onSelected = function()
                    TriggerServerEvent('kayscore:acceuil:sendAnnounce', job, message)

                    kayscoreConfigServ.Elevator.acceuil.cooldown = true
                    SetTimeout(120000, function()
                        kayscoreConfigServ.Elevator.acceuil.cooldown = false
                    end)
                end
            })
        end)

        if not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
        end
    end
end

RegisterNetEvent('soundjob:playSound')
AddEventHandler('soundjob:playSound', function()
    secured_TriggerEvent('InteractSound_CL:PlayOnOne', 'tutu', 0.5)
end)

CreateThread(function()
    local interval = 2000
    while true do
        Wait(interval)

        interval = 2000

        for k,v in pairs(kayscoreConfigServ.Elevator.positions) do
            
            local dist = #(GetEntityCoords(PlayerPedId())-vector3(v.position.x, v.position.y, v.position.z))

            if dist > 5 then goto continue end

            interval = 1

            DrawMarker(25, v.position.x, v.position.y, v.position.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)

            if dist < 1 then
                DrawInstructionBarNotification(v.position.x, v.position.y, v.position.z, ("Appuyez sur [ %sE~w~ ] pour intéragir"):format(UTILS.COLORCODE))
                if IsControlJustPressed(1,51) then
                    AsxenseuropenMenu(kayscoreConfigServ.Elevator.positions, v.t)
                end
            end

            ::continue::
        end

        for k,v in pairs(kayscoreConfigServ.Elevator.acceuil.pos) do 
            local dist = #(GetEntityCoords(PlayerPedId())-vector3(v.pos.x, v.pos.y, v.pos.z))

            if dist > 5 then goto con end

            interval = 1

            DrawMarker(25, v.pos.x, v.pos.y, v.pos.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)

            if dist < 1 then
                DrawInstructionBarNotification(v.pos.x, v.pos.y, v.pos.z, ("Appuyez sur [ %sE~w~ ] pour intéragir"):format(UTILS.COLORCODE))
                if IsControlJustPressed(1,51) then
                    AsxenseuropenAcceuilMenu(v.job, v.message, v.label)
                end
            end

            ::con::
        end
    end
end)