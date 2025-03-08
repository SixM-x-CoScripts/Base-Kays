local holdingup = false
local bank = ""
local secondsRemaining = 0
local blipRobbery = nil

RegisterNetEvent('kayscore:bank:braquage:currentlyrobbing')
AddEventHandler('kayscore:bank:braquage:currentlyrobbing', function(robb)
	holdingup = true
	bank = robb
	secondsRemaining = 300
end)

RegisterNetEvent('kayscore:bank:braquage:killblip')
AddEventHandler('kayscore:bank:braquage:killblip', function()
    RemoveBlip(blipRobbery)
end)

secured_RegisterNetEvent('kayscore:bank:braquage:setblip')
secured_AddEventHandler('kayscore:bank:braquage:setblip', function(position)
    blipRobbery = AddBlipForCoord(position.x, position.y, position.z)
    SetBlipSprite(blipRobbery, 161)
    SetBlipScale(blipRobbery, 2.0)
    SetBlipColour(blipRobbery, 3)
    PulseBlip(blipRobbery)
end)

secured_RegisterNetEvent('kayscore:bank:braquage:toofarlocal')
secured_AddEventHandler('kayscore:bank:braquage:toofarlocal', function(robb)
    holdingup = false
	ESX.ShowNotification(_U('robbery_cancelled'))
	exports['ui']:hideInfo()
	bank = ""
	secondsRemaining = 0
end)

secured_RegisterNetEvent('kayscore:bank:braquage:robberycomplete')
secured_AddEventHandler('kayscore:bank:braquage:robberycomplete', function(robb)
	holdingup = false
	ESX.ShowNotification("Le braquage est terminé ! Regarde dans ton sac l'argent(s) que tu as obtenu")
	exports['ui']:hideInfo()
	bank = ""
	secondsRemaining = 0
end)

Citizen.CreateThread(function()
	for k,v in pairs(Banks) do
		local ve = v.position
		local blip = AddBlipForCoord(ve.x, ve.y, ve.z)
		SetBlipSprite(blip, 255)
		SetBlipScale(blip, 0.6)
		SetBlipColour(blip, 75)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U('bank_robbery'))
		EndTextCommandSetBlipName(blip)
	end
end)

CreateThread(function()
    while true do
        local interval = 2000 
        local pos = GetEntityCoords(PlayerPedId())
        local playerInAnyBank = false
        local playerPed = PlayerPedId()
        local playerPos = GetEntityCoords(playerPed)

        for k, v in pairs(Banks) do
            local pos2 = v.position

            if Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0 then
                playerInAnyBank = true
                interval = 0 
                if not holdingup then
                DrawMarker(29, pos2.x, pos2.y, pos2.z, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 255, 0, 0, 255, false, false, 2, nil, nil, false)

                if Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0 then
                    if not holdingup then
                            ESX.ShowHelpNotification(_U('press_to_rob') .. v.nameofbank)

                        if IsControlJustReleased(1, 51) then
                            local weapon = GetSelectedPedWeapon(PlayerPedId())
                            if weapon == GetHashKey("WEAPON_UNARMED") then
                                ESX.ShowNotification('Tu dois avoir une arme en main pour braquer !')
                            else
                                secured_TriggerServerEvent('kayscore:bank:braquage:rob', k)
                                secured_TriggerServerEvent("kayscore:sendappel:jobLSPD", {
                                    job = "police",
                                    raison = "Braquage de banque",
                                    pos = playerPos,
                                    plate = '[]'
                                })
                            end
                        end
                    end
                end

                end
            end
        end

        if holdingup then
            if not robStarted then
                startRob()
            end

            exports['ui']:drawInfo('Braquage de Banque', {
                {title = 'Temps restant', subtitle = ('%s %s'):format(secondsRemaining, 'seconde(s)')}
            })

            local pos2 = Banks[bank].position
            if Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 7.5 then
                secured_TriggerServerEvent('kayscore:bank:braquage:toofar', bank)
                exports['ui']:hideInfo()
            end
        end



        Wait(interval)
    end
end)

function startRob()
    robStarted = true
    Citizen.CreateThread(function()
        while holdingup do
            Citizen.Wait(1000)
            if secondsRemaining > 0 then
                secondsRemaining = secondsRemaining - 1
            end
        end
    end)
end
