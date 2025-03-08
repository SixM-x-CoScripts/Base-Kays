Event = {
	{
		type = "money",
		message = "Un fourgon blindé vient de se faire pété ! Viens récupérer l'argent avant la police!",
		possibleZone = {
			vector3(-481.491089, -615.890015, 31.174456),
			vector3(560.058533, -1661.171509, 28.396475),
			vector3(-206.367737, -1798.239258, 29.867615),
			vector3(592.046204, 57.550861, 92.865082),
			vector3(-1083.676392, 267.279846, 63.930317),
			vector3(-868.478027, -938.930298, 15.821384),
		},
		prop = {
			"bkr_prop_moneypack_01a",
			"bkr_prop_moneypack_02a",
			"bkr_prop_moneypack_03a",
		},
	},
}


local minute = 120*1000
local eventStarted = true
--[[Citizen.CreateThread(function()
	while true do
		Wait(2000)
		local i = math.random(1, #Event)
		local randomEvent = Event[i]
		local i = math.random(1, #randomEvent.possibleZone)
		local zone = randomEvent.possibleZone[i]
		TriggerClientEvent("kayscore:SendEvent", -1, randomEvent, zone)
		Citizen.Wait(5*minute)
		if eventStarted then
			TriggerClientEvent("kayscore:StopEvent", -1)
		end
		Citizen.Wait(60*minute)
	end
end)]]--


local eventStarted = false  -- Variable pour suivre l'état de l'événement

RegisterCommand("event", function(source,args,rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    -- Vérifiez les permissions du joueur
    if xPlayer.getGroup() == "fondateur" or xPlayer.getGroup() == "responsable" or xPlayer.getGroup() == "gerant" then
        if eventStarted then
            print("Un événement est déjà en cours.")
            xPlayer.showNotification("~r~Un événement est déjà en cours.")
        else
            print("L'Administrateur (".. GetPlayerName(source) ..") vient de démarrer l'événement.")
            eventStarted = true  -- Marquer l'événement comme démarré
            
            -- Code pour démarrer l'événement
            Wait(2000)
            local i = math.random(1, #Event)
            local randomEvent = Event[i]
            local i = math.random(1, #randomEvent.possibleZone)
            local zone = randomEvent.possibleZone[i]
            TriggerClientEvent("kayscore:SendEvent", -1, randomEvent, zone)
        end
    else
        xPlayer.showNotification("~r~Vous n'avez pas les permissions pour faire ceci.")
    end
end)

RegisterNetEvent("kayscore:Recuperer")
AddEventHandler("kayscore:Recuperer", function()
    --print("\n\n\nFIN DE L'EVENT RESELLER\n\n\n")
    TriggerClientEvent("kayscore:StopEvent", -1)
    eventStarted = false 
end)

secured_RegisterNetEvent("kayscore:GetArgent")
secured_AddEventHandler("kayscore:GetArgent", function(nombre)
	local xPlayer = ESX.GetPlayerFromId(source)
	if string.len(nombre) < 4 or nombre <= 300 then
		xPlayer.addAccountMoney('black_money', nombre)
	else
		DropPlayer(source, "Désynchronisation avec l'event de fourgon")
	end
end)