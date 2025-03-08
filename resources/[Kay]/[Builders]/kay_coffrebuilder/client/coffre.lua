local allCofre = {}

RegisterNetEvent("vCoffre:loadCoffre")
AddEventHandler("vCoffre:loadCoffre", function(coffre)
    allCofre = coffre
end)

function initCoffre()
    Citizen.CreateThread(function()
        while true do
            local playerInZone = false
            local playerPos = GetEntityCoords(PlayerPedId())

            for _,v in pairs(allCofre) do
                local coffrePos = vector3(v.coffrePos.x, v.coffrePos.y, v.coffrePos.z)
                local distanceCoffrePlayer = #(coffrePos-playerPos)

                if v.job1Acces then
                    if ESX.PlayerData.job.name == v.job1Name then
                        if distanceCoffrePlayer <= 20 then
                            playerInZone = true
                            local r, g, b, o = table.unpack(Config.option.marker.markerColor)
                            DrawMarker(Config.option.marker.markerType, coffrePos.x, coffrePos.y, coffrePos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, r, g, b, o, 0, 1, 2, 0, nil, nil, 0)
                            if distanceCoffrePlayer <= 2 then
                                Visual.Subtitle(traduction("message_open_menu"):format(v.coffreName))
                                if IsControlJustPressed(0, 51) and not isOpenCoffreMenu then
                                    FreezeEntityPosition(PlayerPedId(), true)
                                    print("e")
                                    openCoffreMenu(v)
                                end
                            end
                        end
                    end
                elseif v.job2Acces then
                    if ESX.PlayerData.job2.name == v.job2Name then
                        if distanceCoffrePlayer <= 20 then
                            playerInZone = true
                            local r, g, b, o = table.unpack(Config.option.marker.markerColor)
                            DrawMarker(Config.option.marker.markerType, coffrePos.x, coffrePos.y, coffrePos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, r, g, b, o, 0, 1, 2, 0, nil, nil, 0)
                            if distanceCoffrePlayer <= 2 then
                                Visual.Subtitle(traduction("message_open_menu"):format(v.coffreName))
                                if IsControlJustPressed(0, 51) and not isOpenCoffreMenu then
                                    FreezeEntityPosition(PlayerPedId(), true)
                                    openCoffreMenu(v)
                                end
                            end
                        end
                    end
                end
            end

            if not playerInZone then
                Wait(500)
            else
                Wait(1)
            end
        end 
    end)
end
