RegisterServerEvent("ServerEmoteRequest")
AddEventHandler("ServerEmoteRequest", function(playerId, emotename, etype)
    local playerSrc = source

    local xPlayer = ESX.GetPlayerFromId(playerSrc)
    if (xPlayer == nil) then return end

    local xTarget = ESX.GetPlayerFromId(playerId)
    if (xTarget == nil) then return end

    xPlayer.showNotification("~b~Requête envoyé à l'individu le plus proche.")

	TriggerClientEvent("ClientEmoteRequestReceive", xTarget.source, emotename, etype)
end)

RegisterServerEvent("ServerValidEmote") 
AddEventHandler("ServerValidEmote", function(target, requestedemote, otheremote)
	TriggerClientEvent("SyncPlayEmote", source, otheremote, source)
	TriggerClientEvent("SyncPlayEmoteSource", target, requestedemote)
end)