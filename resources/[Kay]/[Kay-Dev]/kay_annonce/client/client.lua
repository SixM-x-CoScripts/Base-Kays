-- client.lua Debug Version

-- Écoute de l'événement
RegisterNetEvent("SoAnnonceSoSend")
AddEventHandler("SoAnnonceSoSend", function(param, message)
    local data = {
        action = "displayAnnonce",  -- Cette clé doit correspondre à celle attendue dans ui.html
        message = message
    }
    if type(param) == "number" and param > 0 then
        data.radius = param
    end

    print("DEBUG: Envoi du message NUI : " .. json.encode(data))
    SendNUIMessage(data)
end)

-- Commande pour tester manuellement l'envoi de l'annonce
RegisterCommand("testannonce", function(source, args)
    local testMessage = table.concat(args, " ")
    if testMessage == "" then
        testMessage = "Test d'annonce"
    end
    TriggerEvent("SoAnnonceSoSend", 0, testMessage)
end, false)

-- Désactive le focus NUI si nécessaire
SetNuiFocus(false, false)
