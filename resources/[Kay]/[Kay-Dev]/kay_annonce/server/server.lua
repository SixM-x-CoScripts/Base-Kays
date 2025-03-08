RegisterCommand("annonceserv", function(source, args)
    local player = ESX.GetPlayerFromId(source)
    if not player then
        if source == 0 then
            local message = table.concat(args, " ")
            if message ~= "" then
                TriggerClientEvent("SoAnnonceSoSend", -1, "", message)
            else
                print("Veuillez fournir un message pour l'annonce")
            end
        end
        return
    end

    local hasPermission = false
    for _, group in ipairs(Shared.Perm) do
        if player.getGroup() == group then
            hasPermission = true
            break
        end
    end

    if not hasPermission then
        player.showNotification("~r~Vous n'avez pas accès à cette commande")
        return
    end

    local message = table.concat(args, " ")
    if message ~= "" then
        TriggerClientEvent("SoAnnonceSoSend", -1, "", message)
        TriggerEvent("Logs", "Joueur (ID Unique): " .. player.getIdentifier() .. " a fait l'annonce: " .. message, Shared.Logs)
    else
        player.showNotification("~r~Veuillez fournir un message pour l'annonce")
    end
end, false)

RegisterCommand("annonceserv", function(source, args)
    local player = ESX.GetPlayerFromId(source)
    if not player then return end

    local hasPermission = false
    for _, group in ipairs(Shared.Perm) do
        if player.getGroup() == group then
            hasPermission = true
            break
        end
    end

    if not hasPermission then
        player.showNotification("~r~Vous n'avez pas accès à cette commande")
        return
    end

    local message = table.concat(args, " ")
    if message ~= "" then
        for _, playerId in ipairs(GetPlayers()) do
            local targetPlayer = ESX.GetPlayerFromId(playerId)
            if targetPlayer and targetPlayer.getGroup() ~= "user" then
                TriggerClientEvent("SoAnnonceSoSend", playerId, "", message)
            end
        end
        TriggerEvent("Logs", "Joueur (ID Unique): " .. player.getIdentifier() .. " a fait l'annonce: " .. message, Shared.Logs)
    else
        player.showNotification("~r~Veuillez fournir un message pour l'annonce")
    end
end, false)

RegisterCommand("annonceserv", function(source, args)
    local player = ESX.GetPlayerFromId(source)
    if not player then return end

    local hasPermission = false
    for _, group in ipairs(Shared.Perm) do
        if player.getGroup() == group then
            hasPermission = true
            break
        end
    end

    if not hasPermission then
        player.showNotification("~r~Vous n'avez pas accès à cette commande")
        return
    end

    local radius = tonumber(args[1]) or 100
    local message = table.concat(args, " ", 2)
    if message ~= "" then
        local playerCoords = player.getCoords(true)
        for _, playerId in ipairs(GetPlayers()) do
            local targetPlayer = ESX.GetPlayerFromId(playerId)
            if targetPlayer then
                local targetCoords = targetPlayer.getCoords(true)
                local distance = #(playerCoords - targetCoords)
                if distance <= radius then
                    TriggerClientEvent("SoAnnonceSoSend", targetPlayer.source, radius, message)
                end
            end
        end
        TriggerEvent("Logs", "Joueur (ID Unique): " .. player.getIdentifier() .. " a fait l'annonce: " .. message, Shared.Logs)
    else
        player.showNotification("~r~Veuillez fournir un message pour l'annonce")
    end
end, false)

Citizen.CreateThread(function()
    local serverName = GetConvar("Kays", "")
end)
