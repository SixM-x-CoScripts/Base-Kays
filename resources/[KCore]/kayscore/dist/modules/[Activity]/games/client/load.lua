-- CreateThread(function()
--     _PEDS.addPed('event_MBA', {
--         model = 'a_m_m_hasjew_01',
--         position = vector3(-296.7705, -1919.236, 30.14923),
--         heading = 237.27188110352,
--         scenario = {
--             active = true,
--             name = 'WORLD_HUMAN_CLIPBOARD',
--             count = 0,
--         },
--         weapon = {
--             active = false,
--             weaponName = 'weapon_assaultrifle',
--         },
--         floatingText = {
--             active = true,
--             text = 'Créateur de Jeu',
--             color = 0,
--         },
--     })
--     AddZones('event_MBA', {
--         Position = vector3(-296.0998, -1919.755, 30.14577),
--         Dist = 10,
--         Public = true,
--         Job = nil,
--         Job2 = nil,
--         GradesJob = {},
--         InVehicleDisable = true,
--         Blip = {
--             Active = false,
--         },
--         marker = true,
--         ActionText =('Appuyez sur [ %sE~w~ ] pour intéragir'):format(UTILS.COLORCODE),
--         Action = function()
--             GAMES.openGamesMenu()
--         end
--     })
-- end)