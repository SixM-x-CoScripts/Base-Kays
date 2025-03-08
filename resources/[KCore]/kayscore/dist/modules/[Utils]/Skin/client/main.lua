local LastSkin, PlayerLoaded, cam, isCameraActive
local FirstSpawn, zoomOffset, camOffset, heading = true, 0.0, 0.0, 90.0


AddEventHandler('playerSpawned', function()
	Citizen.CreateThread(function()
		while not PlayerLoaded do
			Citizen.Wait(100)
		end

		if FirstSpawn then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin == nil then
					TriggerEvent('skinchanger:loadSkin', {sex = 0})
				else
					TriggerEvent('skinchanger:loadSkin', skin)
				end
			end)

			FirstSpawn = false
		end
	end)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerLoaded = true
end)

AddEventHandler('esx_skin:getLastSkin', function(cb)
	cb(LastSkin)
end)

AddEventHandler('esx_skin:setLastSkin', function(skin)
	LastSkin = skin
end)

AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
		return
	  end
	TriggerServerEvent('kayscore:skin:restart')
end)

RegisterNetEvent('kayscore:skin:restart', function()
	if FirstSpawn then
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
			if skin == nil then
				TriggerEvent('skinchanger:loadSkin', {sex = 0})
			else
				TriggerEvent('skinchanger:loadSkin', skin)
			end
		end)

		FirstSpawn = false
	end
end)