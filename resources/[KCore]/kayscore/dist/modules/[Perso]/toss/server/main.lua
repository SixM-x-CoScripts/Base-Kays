RegisterServerEvent('tossCoinServer')
AddEventHandler('tossCoinServer', function(targetPlayers, boneCoords)
    local result = math.random(0, 1) -- 0 pour pile, 1 pour face
    TriggerClientEvent('tossCoinClient', -1, result, boneCoords) -- Envoyer le résultat à tous les joueurs
end)
