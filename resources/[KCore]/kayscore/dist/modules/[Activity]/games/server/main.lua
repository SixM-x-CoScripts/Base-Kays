-- CreateThread(function()
--     RegisterNetEvent('kayscore:loupToucheTouche:CreateParty', function(partyId, table)
--         GAMES.PARTY[partyId] ={}
--         GAMES.PARTY[partyId][table.type] = table

--         TriggerClientEvent('kayscore:loupToucheTouche:CreateParty', -1, partyId,  table)

--         local source = source
--         TriggerClientEvent('esx:showNotification', source, 'Partie créer avec succès')
--     end)

--     RegisterNetEvent('kayscore:loupToucheTouche:party:addPlayer', function(partyId, partyType, table)
--         GAMES.PARTY[partyId][partyType].players = table
--         GAMES.PARTY[partyId][partyType].playersNumber += 1

--         TriggerClientEvent('kayscore:loupToucheTouche:party:updatePlayers', -1, partyId, partyType, GAMES.PARTY[partyId][partyType].players, GAMES.PARTY[partyId][partyType].playersNumber)
--     end)

--     RegisterNetEvent('kayscore:loupToucheTouche:party:start', function(partyId, partyType)
--         GAMES.PARTY[partyId][partyType].launched = true

--         for k,v in pairs(GAMES.PARTY[partyId][partyType].players) do
--             local player = ReturnPlayerId(v.UniqueID)

--             if not player then goto continue end
            
--             TriggerClientEvent('kayscore:loupToucheTouche:party:start', player.id, partyId, partyType)

--             ::continue::
--         end
--     end)
-- end)