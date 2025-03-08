-- local function reopenCase(caseId)
--     -- Délai pour s'assurer que la notification a été affichée
--     Citizen.Wait(2000)
--     secured_TriggerEvent('kayscore:boutique:openCase', caseId)
-- end

-- local picture;
-- local CurrentAnimation = false;

-- local function selectedRandomReward(rewards)
--     local totalChance = 0

--     for k, v in pairs(rewards) do
--         totalChance += v.chance
--     end

--     local randomReward = math.random(1, totalChance)

--     local chanceCumuler = 0

--     CurrentAnimation = true

--     local mysterybox = RageUI.CreateMenu('', 'Bonne Chance ! ')

--     mysterybox.Closable = false

--     RageUI.Visible(mysterybox, not RageUI.Visible(mysterybox))

--     CreateThread(function()
--         while CurrentAnimation do
--             Wait(1)

--             RageUI.IsVisible(mysterybox, function()
--                 RageUI.Separator('~y~En attente de votre récompense...~s~')
--                 RageUI.Separator()
--                 if picture then
--                     RageUI.Separator(picture)
--                     RageUI.RenderWeapons("case", picture)
--                 end
--             end)

--             if not RageUI.Visible(mysterybox) then
--                 mysterybox = RMenu:DeleteType('mysterybox')
--             end
--         end
--     end)

--     for k, v in pairs(rewards) do
--         picture = v.label
--         Wait(100)
--         chanceCumuler += v.chance

--         RageUI.PlaySound("HUD_FREEMODE_SOUNDSET", "NAV_UP_DOWN")

--         if randomReward <= chanceCumuler then
--             Wait(5000)
--             CurrentAnimation = false
--             return v
--         end
--     end
-- end

-- secured_RegisterNetEvent('kayscore:boutique:openCase', function(caseId)
--     local case = BoutiqueConfig['Case'][caseId]

--     local reward = selectedRandomReward(case.rewards)

--     if reward.type == 'vehicle' then
--         ESX.Game.SpawnLocalVehicle(GetHashKey(reward.name), vector3(748.97686767578, -4407.44140625, -0.65416955947876), 90.0, function(vehicle)
--             vehicleProps = lib.getVehicleProperties(vehicle)

--             local plate = GeneratePlate()

--             vehicleProps.plate = plate

--             reward.vehicleProps = vehicleProps

--             secured_TriggerServerEvent('kayscore:giveBoutiqueReward', reward, reward.vehicleProps, caseId)

--             RageUI.CloseAll()
--         end)
--     else
--         secured_TriggerServerEvent('kayscore:giveBoutiqueReward', reward, nil, caseId)

--         RageUI.CloseAll()
--     end
-- end)