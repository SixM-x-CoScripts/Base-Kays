-- CreateThread(function()
--     if GetCurrentServerEndpoint() == '193.38.250.32:30120' then return end
--     GAMES.LOAD_INTERIORS = function()
--         for _, interior in ipairs(GAMES.INTERIORS) do
    
--             if interior.ipl ~= false then
--                 local interiorID = GetInteriorAtCoords(interior.coords.x, interior.coords.y, interior.coords.z)
    
--                 if IsValidInterior(interiorID) then
--                     PinInteriorInMemory(interiorID)
        
--                     for index,prop in pairs(interior.entitySets) do
--                         DeactivateInteriorEntitySet(interiorID, prop.name)
--                     end
        
--                     RefreshInterior(interiorID)
--                 end
--             end
--         end
    
--         Wait(1000)
    
--         for _, interior in ipairs(GAMES.INTERIORS) do
--             if interior.ipl ~= false then
--                 RequestIpl(interior.ipl)
--                 local interiorID = GetInteriorAtCoords(interior.coords.x, interior.coords.y, interior.coords.z)
--                 if IsValidInterior(interiorID) then
--                     for __, entitySet in ipairs(interior.entitySets) do
--                         if entitySet.enable then
--                             EnableInteriorProp(interiorID, entitySet.name)
--                             if entitySet.color then
--                                 SetInteriorPropColor(interiorID, entitySet.name, entitySet.color)
--                             end
--                         else
--                             DisableInteriorProp(interiorID, entitySet.name)
--                         end
--                     end
--                     RefreshInterior(interiorID)
--                 end
--             end
--         end
--     end

--     function GAMES.openGamesMenu()
--         local main = RageUI.CreateMenu('', 'Mini Jeu')
--         local games_subMenuChoice = RageUI.CreateSubMenu(main, 'Actions Disponibles')
--         local games_create = RageUI.CreateSubMenu(games_subMenuChoice, '', 'Création Mini Jeu')
--         local games_create_select_arene = RageUI.CreateSubMenu(games_create, '', 'Création Mini Jeu')
--         local games_list = RageUI.CreateSubMenu(games_subMenuChoice, '', 'Liste des parties disponibles')
--         local games_list_actions = RageUI.CreateSubMenu(games_list, '', 'Actions Disponibles')
--         local games_myGames = RageUI.CreateSubMenu(games_list, '', 'Actions Disponibles')

--         main.Closed = function()
--             exports['ui']:hideInfo()
--         end

--         RageUI.Visible(main, not RageUI.Visible(main))
--         FreezeEntityPosition(Player.playerPed, true)
--         while main do Wait(1)
--             RageUI.IsVisible(main, function()
--                 RageUI.WLine()
--                 for k,v in pairs(GAMES.MINI_JEUX) do
--                     RageUI.Button(v.label, nil, {RightLabel = '>>'}, true, {
--                         onActive = function()
--                             exports['ui']:drawInfo(v.informations.title, v.informations.data)
--                         end,
--                         onSelected = function()
--                             if not v.active then return end
--                             GAMES.PARTY_CREATE_SELECTED = k
--                             RageUI.Visible(games_subMenuChoice, true)
--                         end
--                     })
--                 end
--                 RageUI.WLine()
--             end)

--             RageUI.IsVisible(games_subMenuChoice, function()
--                 RageUI.WLine()
--                 RageUI.Button('Créer une partie', nil,{}, true, {
--                     onSelected = function()
                        
--                     end
--                 }, games_create)
--                 RageUI.Button('Liste des parties', nil, {}, true, {
--                     onSelected = function()
                        
--                     end
--                 }, games_list)
--                 RageUI.WLine()
--                 if GAMES.MY_PARTY[GAMES.PARTY_CREATE_SELECTED] then
--                     RageUI.Separator('Ma Partie')
--                     RageUI.Button(GAMES.MY_PARTY[GAMES.PARTY_CREATE_SELECTED].name, nil, {RightLabel = ('%s/%s Joueurs'):format(GAMES.PARTY[GAMES.MY_PARTY[GAMES.PARTY_CREATE_SELECTED].id][GAMES.PARTY_CREATE_SELECTED].playersNumber, GAMES.PARTY[GAMES.MY_PARTY[GAMES.PARTY_CREATE_SELECTED].id][GAMES.PARTY_CREATE_SELECTED].maxPlayers)}, true, {
--                         onSelected = function()
                            
--                         end
--                     }, games_myGames)
--                 end
--             end)

--             RageUI.IsVisible(games_myGames, function()
--                 RageUI.WLine()
--                 RageUI.WLine()
--                 if not GAMES.MY_PARTY[GAMES.PARTY_CREATE_SELECTED].launched then
--                     RageUI.Button('Lancer la partie', nil, {}, true, {
--                         onSelected = function()
--                             KeyboardUtils.use('Taper Y pour valider le lancement de la partie', function(data)
--                                 if data == 'y' or data == 'Y' then
--                                     TriggerServerEvent('kayscore:loupToucheTouche:party:start', GAMES.MY_PARTY[GAMES.PARTY_CREATE_SELECTED].id, GAMES.PARTY_CREATE_SELECTED)
--                                 end
--                             end)
--                         end
--                     })
--                 end
--             end)

--             RageUI.IsVisible(games_list, function()
--                 for k,v in pairs(GAMES.PARTY) do
--                     v = v[GAMES.PARTY_CREATE_SELECTED]
--                     RageUI.Button(('Partie de %s'):format(v.ownerName), nil, {RightLabel = ('%s/%s Joueurs'):format(v.playersNumber, v.maxPlayers)}, true, {
--                         onSelected = function()
--                             GAMES.PARTY_SELECTED = k
--                             RageUI.Visible(games_list_actions, true)
--                         end
--                     })
--                 end
--             end)

--             RageUI.IsVisible(games_list_actions, function()
--                 RageUI.Separator(('Partie séléctionnée: Partie de ~s~%s~s~'):format(GAMES.PARTY[GAMES.PARTY_SELECTED][GAMES.PARTY_CREATE_SELECTED].ownerName))
--                 RageUI.Button('Rajoindre la partie', nil, {}, true, {
--                     onSelected = function()
--                         KeyboardUtils.use('Votre nom dans la partie', function(data)
--                             if data == '' or data == nil then return end

--                             GAMES.PARTY[GAMES.PARTY_SELECTED][GAMES.PARTY_CREATE_SELECTED].players[ESX.GetPlayerData().UniqueID] = {
--                                 UniqueID = ESX.GetPlayerData().UniqueID,
--                                 name = data,
--                                 state = 'player',
--                                 wolfCount = 0,
--                             }

--                             TriggerServerEvent('kayscore:loupToucheTouche:party:addPlayer', GAMES.PARTY[GAMES.PARTY_SELECTED][GAMES.PARTY_CREATE_SELECTED].id, GAMES.PARTY_CREATE_SELECTED, GAMES.PARTY[GAMES.PARTY_SELECTED][GAMES.PARTY_CREATE_SELECTED].players)
--                         end)
--                     end
--                 })
--             end)

--             RageUI.IsVisible(games_create, function()
--                 RageUI.Button('Nom de la partie', nil, {RightLabel = GAMES.PARTY_CREATED_NAME}, true, {
--                     onSelected = function()
--                         KeyboardUtils.use('Nom de la partie', function(data)
--                             if data == nil or data == '' then return end

--                             GAMES.PARTY_CREATED_NAME = data
--                         end)
--                     end
--                 })
--                 RageUI.Button('Mon nom dans la partie', nil, {RightLabel = GAMES.PARTY_CREATED_MY_NAME}, true, {
--                     onSelected = function()
--                         KeyboardUtils.use('Nom de la partie', function(data)
--                             if data == nil or data == '' then return end

--                             GAMES.PARTY_CREATED_MY_NAME = data
--                         end)
--                     end
--                 })
--                 RageUI.Button('Temps de la partie', nil, {RightLabel = GAMES.PARTY_CREATED_TIME ~= nil and GAMES.PARTY_CREATED_TIME..' Minute(s)'}, true, {
--                     onSelected = function()
--                         KeyboardUtils.use('Temps de la partie (Minutes)', function(data)
--                             local data = tonumber(data)

--                             if data == nil then return end

--                             GAMES.PARTY_CREATED_TIME = data
--                         end)
--                     end
--                 })
--                 RageUI.Button('Map', nil, {RightLabel = GAMES.PARTY_CREATED_MAP_LABEL}, true, {
--                     onSelected = function()
                        
--                     end
--                 }, games_create_select_arene)
--                 RageUI.Button('Nombre de joueur Maximum', nil, {RightLabel = GAMES.PARTY_CREATED_MAX_PLAYERS ~= nil and GAMES.PARTY_CREATED_MAX_PLAYERS.. ' Joueurs'}, true, {
--                     onSelected = function()
--                         KeyboardUtils.use('Nombre de joueur maximum', function(data)
--                             local data = tonumber(data)

--                             if data == nil then return end

--                             GAMES.PARTY_CREATED_MAX_PLAYERS = data
--                         end)
--                     end
--                 })
--                 RageUI.WLine()
--                 RageUI.Button('Confirmer', nil, {Color = {BackgroundColor = {0,255,0,150}}}, true, {
--                     onSelected = function()
--                         if GAMES.MY_PARTY[GAMES.PARTY_CREATE_SELECTED] then return ESX.ShowNotification('Vous avez déjà une partie de créer') end
--                         GAMES.MY_PARTY[GAMES.PARTY_CREATE_SELECTED] = {
--                             type = GAMES.PARTY_CREATE_SELECTED,
--                             name = GAMES.PARTY_CREATED_NAME,
--                             time = GAMES.PARTY_CREATED_TIME,
--                             map =  GAMES.PARTY_CREATED_MAP,
--                             mapLabel = GAMES.PARTY_CREATED_MAP_LABEL,
--                             maxPlayers = GAMES.PARTY_CREATED_MAX_PLAYERS,
--                             ownerName = GAMES.PARTY_CREATED_MY_NAME,
--                             players = {
--                                 [ESX.GetPlayerData().UniqueID] = {
--                                     UniqueID = ESX.GetPlayerData().UniqueID,
--                                     name = GAMES.PARTY_CREATED_MY_NAME,
--                                     state = 'player',
--                                     wolfCount = 0,
--                                 }
--                             },
--                             playersNumber = 1,
--                             id = ESX.GetPlayerData().UniqueID,
--                             launched = false,
--                         }

--                         TriggerServerEvent('kayscore:loupToucheTouche:CreateParty', GAMES.MY_PARTY[GAMES.PARTY_CREATE_SELECTED].id, GAMES.MY_PARTY[GAMES.PARTY_CREATE_SELECTED])

--                         GAMES.PARTY_CREATED_NAME = nil
--                         GAMES.PARTY_CREATED_MY_NAME = nil
--                         GAMES.PARTY_CREATED_TIME = nil
--                         GAMES.PARTY_CREATED_MAP_LABEL = nil
--                         GAMES.PARTY_CREATED_MAX_PLAYERS = nil
--                     end
--                 })
--             end)

--             RageUI.IsVisible(games_create_select_arene, function()
--                 for k,v in pairs(GAMES.MINI_JEUX[GAMES.PARTY_CREATE_SELECTED].interiors) do
--                     RageUI.Button(v.label, nil, {}, true, {
--                         onSelected = function()
--                             GAMES.PARTY_CREATED_MAP = v.ipl
--                             GAMES.PARTY_CREATED_MAP_LABEL = v.label

--                             RageUI.GoBack()
--                         end
--                     })
--                 end
--             end)

--             if not RageUI.Visible(main) and not RageUI.Visible(games_subMenuChoice) and not RageUI.Visible(games_create) and not RageUI.Visible(games_create_select_arene) and not RageUI.Visible(games_list) and not RageUI.Visible(games_list_actions) and not RageUI.Visible(games_myGames) then
--                 main = RMenu:DeleteType('main')
--                 FreezeEntityPosition(Player.playerPed, false)
--             end
--         end
--     end

--     RegisterNetEvent('kayscore:loupToucheTouche:CreateParty', function(partyId, table)
--         GAMES.PARTY[partyId] ={}
--         GAMES.PARTY[partyId][table.type] = table
--     end)

--     RegisterNetEvent('kayscore:loupToucheTouche:party:updatePlayers', function(partyId, partyType, partyPlayers)
--         GAMES.PARTY[partyId][partyType].players = partyPlayers
--     end)

--     RegisterNetEvent('kayscore:loupToucheTouche:party:start', function(partyId, partyType)
--         RageUI.CloseAll()
--         local coords = {}
--         local ipl = false
--         for k,v in pairs(GAMES.MINI_JEUX) do
--             if k == partyType then
--                 for i,p in pairs(GAMES.MINI_JEUX[k].interiors) do
                    
--                     if p.ipl == false then
--                         coords = v.spawn
--                         ipl = p.ipl
--                         break
--                     end

--                     if p.ipl ~= false then
--                         if p.ipl == GAMES.PARTY[partyId][partyType].map then
--                             coords = p.spawn
--                             ipl = p.ipl
--                             break
--                         end
--                     end
--                 end
--             end
--         end
        
--         if ipl ~= false then
--             GAMES.LOAD_INTERIORS()
--         end

--         SetEntityCoords(Player.playerPed, vector3(coords.x, coords.y, coords.z))
--         GAMES.PARTY[partyId][partyType].launched = true

--         CreateThread(function()
--             local time = 60000
--             time = time - 1000
--             local formatted_time = tostring(time)
--             formatted_time = formatted_time:sub(1, 2)
--             exports['kayscoreServTextui']:drawText(('👋 Vous avez %s secondes pour vous dispercer'):format(formatted_time))
--             while true do 
--                 Wait(1000)

--                 if tonumber(formatted_time) > 1 then
--                     time = time - 1000
--                     local formatted_time = tostring(time)
--                     formatted_time = formatted_time:sub(1, 2)
    
--                     exports['kayscoreServTextui']:drawText(('👋 Vous avez %s secondes pour vous dispercer'):format(formatted_time))
--                 end

--                 if tonumber(formatted_time) <= 1 then
--                     break
--                 end
--             end

--             exports['kayscoreServTextui']:drawText(('👋 Temps restants: %s minutes'):format(GAMES.PARTY[partyId][partyType].time))
--             while GAMES.PARTY[partyId][partyType].launched == true do
--                 Wait(60000)
    
--                 GAMES.PARTY[partyId][partyType].time -= 1
    
--                 exports['kayscoreServTextui']:drawText(('👋 Temps restants: %s minutes'):format(GAMES.PARTY[partyId][partyType].time))

--                 if GAMES.PARTY[partyId][partyType].time <= 1 then
--                     break
--                 end
--             end

--             GAMES.PARTY[partyId][partyType].time = 60000

--             while GAMES.PARTY[partyId][partyType].launched == true do
--                 Wait(1000)

--                 GAMES.PARTY[partyId][partyType].time = GAMES.PARTY[partyId][partyType].time - 1000

--                 local time = GAMES.PARTY[partyId][partyType].time
--                 local formatted_time = tostring(time)
--                 formatted_time = formatted_time:sub(1, 2)
                
--                 exports['kayscoreServTextui']:drawText(('👋 Temps restants : %02d secondes'):format(formatted_time))

--                 if tonumber(formatted_time) < 1 then
--                     break
--                 end
--             end
--         end)
--     end)
-- end)