CreateThread(function()   
    local injail = false

    secured_RegisterNetEvent('kayscore:admin:jail:setPlayerInJail', function(UniqueID, data)
        injail = true
        adminManagement.jails[UniqueID] = data

        SetEntityCoords(Player.playerPed, vector3(1725.819, 2537.949, 43.58538))
        SetEntityInvincible(Player.playerPed, true)

        CreateThread(function()

            exports['ui']:drawInfo('Informations Jail', {
                {title = 'Temps restant', subtitle = ('%s %s'):format(adminManagement.jails[UniqueID].time, 'minute(s)')},
                {title = 'Raison', subtitle = ('%s'):format(adminManagement.jails[UniqueID].reason)},
            })

            while injail == true do

                Wait(60000)

                adminManagement.jails[UniqueID].time -= 1

                exports['ui']:drawInfo('Informations Jail', {
                    {title = 'Temps restant', subtitle = ('%s %s'):format(adminManagement.jails[UniqueID].time, 'minute(s)')},
                    {title = 'Raison', subtitle = ('%s'):format(adminManagement.jails[UniqueID].reason)},
                })

                if adminManagement.jails[UniqueID].time < 1 then
                    secured_TriggerServerEvent('kayscore:admin:jail:remove', UniqueID, adminManagement.jails[UniqueID])
                end

                if injail == false then
                    exports['ui']:hideInfo()
                    break
                end
            end
        end)

        CreateThread(function()
            while injail == true do
                Wait(5000)

                if not injail then return end
    
                local dist = #(GetEntityCoords(Player.playerPed)-vector3(1725.819, 2537.949, 43.58538))
    
                if dist > 15 then
                    SetEntityCoords(Player.playerPed, vector3(1725.819, 2537.949, 43.58538))
                end
    
                if injail == false then
                    break
                end
            end
        end)
    end)

    secured_RegisterNetEvent('kayscore:admin:jail:remove', function(UniqueID)
        injail = false
        adminManagement.jails[tonumber(UniqueID)] = nil
        SetEntityCoords(Player.playerPed, vector3(1846.345, 2585.924, 45.67266))
        SetEntityCoords(Player.playerPed, vector3(1846.345, 2585.924, 45.67266))
        SetEntityCoords(Player.playerPed, vector3(1846.345, 2585.924, 45.67266))
        SetEntityInvincible(Player.playerPed, false)

        exports['ui']:hideInfo()
    end)
end)