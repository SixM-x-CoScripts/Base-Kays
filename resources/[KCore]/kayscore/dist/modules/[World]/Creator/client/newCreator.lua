

RegisterNetEvent('CreatePerso')
AddEventHandler('CreatePerso', function()
	Citizen.CreateThread(function()
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            if skin == nil or json.encode(skin) == '[]' then
                TriggerServerEvent("SetBucket", math.random(1, 25000))
                DisplayRadar(false)
                TriggerEvent('esx:charCreator:start')
                
            end
        end)
	end)
end)
AddEventHandler('playerSpawned', function()
	Citizen.CreateThread(function()
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            if skin == nil or json.encode(skin) == '[]' then
                TriggerServerEvent("SetBucket", math.random(1, 25000))
                DisplayRadar(false)
                TriggerEvent('esx:charCreator:start')
            end
        end)
	end)
end)

RegisterNetEvent('kayscore:openCreator', function()
    TriggerServerEvent("SetBucket", math.random(1, 25000))
    DisplayRadar(false)
    DisplayRadar(false)
    TriggerEvent('esx:charCreator:start')
end)

