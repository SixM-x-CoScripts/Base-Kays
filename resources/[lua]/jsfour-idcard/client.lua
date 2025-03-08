ESX = nil 

CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(0)
	end
end)



function IdentityRageu(infos, infos_values, dob, sid)
    local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(GetPlayerFromServerId(sid)))

    while mugshotStr == nil do
        
        mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(GetPlayerFromServerId(sid)))
        Citizen.Wait(500)
    end
    exports['inv']:closeInventory()
    ExecuteCommand('e idcard')

    Citizen.CreateThread(function()
        while true do
            
            RenderRectangle(1350, 800, 530, 260, 20, 24, 28, 255)
            RenderRectangle(1350, 860, 530, 2, 67, 74, 89, 255)

            RenderText("~bold~Carte d'identité ", 1350 + 432, 805, 0, 0.35, 255, 255, 255, 255, 1)
            RenderText('Date de naissance* ', 1350 + 377, 835, 0, 0.23, 202,203,204, 255, 1)
            RenderText(dob, 1350 + 447, 835, 0, 0.25, 255, 255, 255, 255, 0)

            for i = 1, #infos do
                RenderText(infos[i], 1350 + 150, 840 + 30 * i, 0, 0.30, 202,203,204, 255, 0)
            end
            for i = 1, #infos_values do
                RenderText(infos_values[i], 1350 + 520, 840 + 30 * i, 0, 0.30, 255, 255, 255, 255, 2)
            end

            RenderSprite(mugshotStr, mugshotStr, 1350 + 20, 800 + 100, 100, 100, 0, 255, 255, 255, 255)

            RenderSprite("identity_dict", "cross", 1350 + 510, 800, 20, 20, 0, 255, 255, 255, 255)
    
                if IsControlJustPressed(0, 177) then
                    ExecuteCommand('EmoteCancel')
                    break
                end
            
            Citizen.Wait(0)
        end
    end)
end
local open = false

-- Open ID card
RegisterNetEvent('jsfour-idcard:open')
AddEventHandler('jsfour-idcard:open', function( data, type, ok )
	open = true
	SendNUIMessage({
		action = "open",
		array  = data,
		type   = type,
		fishing_type = ok
	})

	Citizen.CreateThread(function()
		while open do
			Wait(0)
			if IsControlJustReleased(0, 322) and open or IsControlJustReleased(0, 177) and open then
				ExecuteCommand('EmoteCancel')
				SendNUIMessage({
					action = "close"
				})
				open = false
			end
		end
	end)
end)
RegisterNetEvent('Game:Client:UI:showIdentity')
AddEventHandler('Game:Client:UI:showIdentity', function(infos, infos_values, dob, sid)
    IdentityRageu(infos, infos_values, dob, sid)
end)
local function RequestAndWaitDict(dictName) -- Request une animation (dict)
	if dictName and DoesAnimDictExist(dictName) and not HasAnimDictLoaded(dictName) then
		RequestAnimDict(dictName)
		while not HasAnimDictLoaded(dictName) do Citizen.Wait(100) end
	end
end
local function RequestAndWaitModel(modelName) -- Request un modèle de véhicule
	if modelName and IsModelInCdimage(modelName) and not HasModelLoaded(modelName) then
		RequestModel(modelName)
		while not HasModelLoaded(modelName) do Citizen.Wait(100) end
	end
end

RegisterNetEvent('kayscore:id:idcard', function()
	ExecuteCommand('e idcard')
end)
RegisterNetEvent('montrer:identity')
AddEventHandler('montrer:identity', function(id)
    local player, distance = ESX.Game.GetClosestPlayer()

    TriggerServerEvent('Game:Personal:Server:identity')
    if distance ~= -1 and distance <= 3.0 then
        TriggerServerEvent('Game:Personal:Server:identity', GetPlayerServerId(player))                                
    else

    end
end)
-- Key events
-- Citizen.CreateThread(function()
-- 	while true do
-- 		Wait(0)
-- 		if IsControlJustReleased(0, 322) and open or IsControlJustReleased(0, 177) and open then
-- 			SendNUIMessage({
-- 				action = "close"
-- 			})
-- 			open = false
-- 		end
-- 	end
-- end)