local boutiqueMENUOpen = true
local isInComponentsPrevisualisation = false
sortirvoitureacheter = {}

function isInPrevisualisationWeaponComponents()
    return isInComponentsPrevisualisation
end

local innnndex = 1
local liistt = {'Visualiser', 'Acheter'}

local visu = false

secured_RegisterNetEvent('kayscore:boutique:recieveboutique', function(data)
    BoutiqueConfig['Voiture'] = data
end)

local boutique = {}
boutique.currentVehicle = nil

local selectedWeaponName = nil
local weaponComponent = {}
function getBoutiquePoint()
    return InfoPlayer.coins
end
secured_RegisterNetEvent('boutique:update', function(new, total, reward)
    InfoPlayer.coins = tonumber(new)
    InfoPlayer.totalCoins = tonumber(total)
    InfoPlayer.reward = reward
end)

InfoPlayer = {
    coins = 0,
    totalCoins = 0,
    reward = false,
}

local selected = nil;

caisse_selected = nil

local scal = false

-- openMenuBoutique = function()
--     if SetEntityRagdoll then return end
--     Player.playerPed = Player.playerPed

--     if boutique.lastPos == nil then
--         boutique.lastPos = nil
--     end
--     boutique.isInVehicle = false
--     boutique.vehiclePosition = vector3(-75.16219, -819.2629, 325.1755)
--     boutique.weaponPosition = vector3(-75.16219, -819.2629, 326.1755)

--     local scaleform = gtaui.Scaleform("mp_car_stats_01")
--     scaleform:load()
--     local main = RageUI.CreateMenu('', 'Bienvenue sur notre Boutique')

--     local menuVehicle = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')



--     local weaponMenu = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
--     local weaponData_menu = RageUI.CreateSubMenu(weaponMenu, '', 'Actions Disponibles')

--     local CustomMenu = RageUI.CreateSubMenu(weaponMenu, "", 'Actions Disponibles')
--     local CustomMenuSelected = RageUI.CreateSubMenu(CustomMenu, "", 'Actions Disponibles')

--     -- new

--     local mainCaisses = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
--     local mainPack = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
--     local caisses_data = RageUI.CreateSubMenu(mainCaisses, '', 'Actions Disponibles')
    
--     local CaisseVisualSilver = RageUI.CreateSubMenu(caisses_data, '', 'Actions Disponibles')

--     local mainVehicles = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
--     local mainTestVehicles = RageUI.CreateSubMenu(mainVehicles, '', 'Actions Disponibles')

--     local BuyVipMenu = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

--     local instrumentFish = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')

--     main.Closable = true
--     mainTestVehicles.Closable = true
--     function reopenMenu()
--         main.Closable = true
--         mainTestVehicles.Closable = true
--     end

--     local VehicleSpawned = {}
--     local LastVeh = nil
--     local loadedVehicle = false

--     mainVehicles.Closed = function()
--         if boutiqueMENUOpen then
--             SetEntityRagdoll = false
--             local vehicles = ESX.Game.GetVehiclesInArea(boutique.vehiclePosition, 5.0)
    
--             for k2,v2 in pairs(vehicles) do
--                 DeleteVehicle(v2)
--             end
            
--             SetEntityCoords(Player.playerPed, boutique.lastPos)
--             FreezeEntityPosition(Player.playerPed, false)
--             SetEntityVisible(Player.playerPed, true)
    
--             SetTimeout(5000, function()
--                 if boutique.isInVehicle == true then
--                     SetEntityCoords(Player.playerPed, boutique.lastPos)
    
--                     boutique.isInVehicle = false
--                 end
--             end)
--         end
--     end

--     CustomMenuSelected.Closed = function ()
--         SetCurrentPedWeapon(PlayerPedId(), GetHashKey("weapon_unarmed"), true)
--         TriggerEvent("esx:restoreLoadout")
--         isInComponentsPrevisualisation = false
--         selected = nil
--     end

--     CustomMenuSelected.onIndexChange = function(index)
--         if (selected ~= nil) then
--             local playerData = ESX.GetPlayerData()
--             local loadout = playerData.loadout
--             local weapon = loadout[selected]
--             local k, data = ESX.GetWeapon(weapon.name)

--             if data.components ~= nil then
--                 for k, v in pairs(data.components) do
--                     RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey(weapon.name), v.hash)
--                 end
--             end

--             GiveWeaponComponentToPed(PlayerPedId(), GetHashKey(weapon.name), data.components[index].hash)
--         end
--     end

    -- weaponData_menu.Closed = function()

    --     if DoesEntityExist(weaponObject) then
    --         DeleteEntity(weaponObject)
    --     end

    --     DeleteSkinCam()

    --     SetEntityCoords(Player.playerPed, boutique.lastCoords)

    --     SetEntityCollision(Player.playerPed, true)
    --     SetEntityVisible(Player.playerPed, true)
    --     FreezeEntityPosition(Player.playerPed, false)
    -- end

--     RageUI.Visible(main, not RageUI.Visible(main))
--     while main do
--         Wait(0)
--         RageUI.IsVisible(main, function()
--             RageUI.Info(('%sBoutique de %s~s~'):format(UTILS.COLORCODE, kayscoreConfigServ.ServerName), {'Code Boutique', 'Nombre de Points', 'Points Utilisé(s)'}, {ESX.PlayerData.UniqueID, InfoPlayer.coins, InfoPlayer.totalCoins})
    
--             RageUI.Button('Acheter des points boutiques', nil, {RightLabel = '→'}, true, {
--                 onSelected = function()
--                     ExecuteCommand('openUrl '..kayscoreConfigServ.Boutique)
--                 end
--             })
    
--             if InfoPlayer.reward == 0 or InfoPlayer.reward == false then
--                 RageUI.Button('Récupérer mon cadeau', nil, {}, true, {
--                     onSelected = function()
--                         RageUI.CloseAll()
--                         secured_TriggerServerEvent('kayscore:boutique:sendReward')
--                     end
--                 })
--             end
    
--             RageUI.Line()
    
--             if BoutiqueConfigg.Vehicules == true then
--                 RageUI.Button("Véhicules", 'Vous devez être en Zone Safe', {RightLabel = '→'}, GetSafeZone(), {
--                     onSelected = function()
--                         boutique.isInVehicle = true
--                         boutique.lastPos = GetEntityCoords(Player.playerPed)
--                         SetEntityVisible(Player.playerPed, false)
--                         FreezeEntityPosition(Player.playerPed, true)
--                         SetEntityCoords(Player.playerPed, vector3(boutique.vehiclePosition))
--                         RageUI.Visible(mainVehicles, true)
--                         Citizen.CreateThread(function()
--                             while boutique.isInVehicle do
--                                 if scaleform and boutique.currentVehicle ~= nil and DoesEntityExist(boutique.currentVehicle) then
--                                     local x, y, z = table.unpack(GetEntityCoords(boutique.currentVehicle))
--                                     local height = GetEntityHeight(boutique.currentVehicle, x, y, z, true, false)
--                                     local rot = GetGameplayCamRot(0)
--                                     local scale = 0.9
--                                     local size = vector3((15 * 0.8) * scale, (9 * 0.8) * scale, 1 * scale)
--                                     local coords = vector3(x, y, z + 3.4 + height)
    
--                                     scaleform:draw3D(coords, rot, size)
--                                 end
    
--                                 Citizen.Wait(0)
--                             end
--                         end)
--                     end
--                 })
--             end
    
--             if BoutiqueConfigg.Weaponss == true then
--                 RageUI.Button('Armes', nil, {RightBadge = RageUI.BadgeStyle.Star, RightLabel = ''}, true, {
--                     onSelected = function()
--                     end
--                 }, weaponMenu)
--             end
    
--             if BoutiqueConfigg.Caisses == true then
--                 RageUI.Button('Caisses Mystère', nil, {RightBadge = RageUI.BadgeStyle.Star, RightLabel = ''}, true, {
--                     onSelected = function()
--                     end
--                 }, mainCaisses)
--             end
    
--             if BoutiqueConfigg.Packs == true then
--                 RageUI.Button('Packs', nil, {RightBadge = RageUI.BadgeStyle.Star, RightLabel = ''}, true, {
--                     onSelected = function()
--                     end
--                 }, mainPack)
--             end
    
--             if BoutiqueConfigg.Fishing == true then
--                 RageUI.Button('Matériels de Pêche', nil, {RightBadge = RageUI.BadgeStyle.Star, RightLabel = ''}, true, {
--                     onSelected = function()
--                     end
--                 }, instrumentFish)
--             end
    
--             if BoutiqueConfigg.Vip == true then
--                 RageUI.Button('VIP', 'Merci de venir en ticket', {RightBadge = RageUI.BadgeStyle.Star, RightLabel = ''}, true, {
--                     onSelected = function()
--                     end
--                 }, BuyVipMenu)
--             end
--         end)
    
--         RageUI.IsVisible(CustomMenu, function()
--             local playerData = ESX.GetPlayerData()
--             local loadout = playerData.loadout
    
--             if ESX.Table.SizeOf(loadout) == 0 then
--                 return RageUI.Separator("Vous n'avez pas d'arme à customiser")
--             end
    
--             for i = 1, #loadout do
--                 local weapon = loadout[i]
--                 local label = weapon.label
    
--                 if weapon.metadata ~= nil and weapon.metadata.label ~= nil then
--                     label = weapon.metadata.label
--                 end
    
--                 RageUI.Button(("%s (%s)"):format(label, weapon.label), nil, {}, true, {
--                     onSelected = function()
--                         selected = i
--                         SetCurrentPedWeapon(PlayerPedId(), GetHashKey(weapon.name), true)
--                         RageUI.Visible(CustomMenuSelected, true)
--                     end
--                 })
--             end
--         end)
    
--         RageUI.IsVisible(CustomMenuSelected, function()
--             if selected == nil then
--                 return RageUI.Separator("Chargement")
--             end
    
--             local playerData = ESX.GetPlayerData()
--             local loadout = playerData.loadout
    
--             local weaponData = loadout[selected]
--             local k, data = ESX.GetWeapon(weaponData.name)
    
--             if weaponData == nil then
--                 return RageUI.Separator("Chargement")
--             end
    
--             if data == nil or ESX.Table.SizeOf(data) == 0 then
--                 return RageUI.Separator("Aucune personnalisation disponible")
--             end
    
--             if data.components == nil or ESX.Table.SizeOf(data.components) == 0 then
--                 return RageUI.Separator("Aucune personnalisation disponible")
--             end
    
--             for k, v in pairs(data.components) do
--                 RageUI.Button(v.label, nil, {RightLabel = 250, RightBadge = RageUI.BadgeStyle.Coins}, true, {
--                     onSelected = function()
--                         secured_TriggerServerEvent("kayscore:server:BuyCustom", weaponData.name, v.hash, selected)
--                     end
--                 })
--             end
--         end)
    
--         RageUI.IsVisible(instrumentFish, function()
--             RageUI.Info(('%sBoutique de %s~s~'):format(UTILS.COLORCODE, kayscoreConfigServ.ServerName), {'Code Boutique', 'Nombre de Points', 'Points Utilisé(s)'}, {ESX.PlayerData.UniqueID, InfoPlayer.coins, InfoPlayer.totalCoins})
    
--             for k, v in ipairs(kayscoreConfigServ.Fishing.fishList.FishingRod) do
--                 if v.boutique then
--                     RageUI.Button(v.label, nil, {RightBadge = RageUI.BadgeStyle.Star, RightLabel = kayscoreConfigServ.GTACOLOR .. v.price}, true, {
--                         onSelected = function()
--                             exports['sPrompt']:displayRequest(
--                                 kayscoreConfigServ.ServerName,
--                                 ('Confirmer l\'achat de %s pour %s points ?'):format(v.label, v.price),
--                                 function()
--                                     if InfoPlayer.coins < v.price then
--                                         ESX.ShowNotification('Vous ne possédez pas les points requis')
--                                         return
--                                     end
--                                     secured_TriggerServerEvent('kayscore:fishing:boutique:buyRod', v.name, v.price)
--                                 end,
--                                 function()
--                                     ESX.ShowNotification("Achat annulé")
--                                 end
--                             )
--                         end
--                     })
--                 else
--                     RageUI.Button(v.label, 'Disponible au magasin de pêche', {RightLabel = ('~g~%s$~s~'):format(v.price)}, true, {
--                         onSelected = function()
--                             ESX.ShowNotification('Disponible au magasin de pêche')
--                         end
--                     })
--                 end
--             end
--         end)
    
--         RageUI.IsVisible(weaponMenu, function()
--             RageUI.Info(('%sBoutique de %s~s~'):format(UTILS.COLORCODE, kayscoreConfigServ.ServerName), {'Code Boutique', 'Nombre de Points', 'Points Utilisé(s)'}, {ESX.PlayerData.UniqueID, InfoPlayer.coins, InfoPlayer.totalCoins})
    
--             RageUI.Button('Armes', nil, {RightLabel = '→'}, true, {
--                 onSelected = function()
--                 end
--             }, weaponData_menu)
    
--             -- RageUI.Button('Customisations d\'armes', nil, {RightBadge = RageUI.BadgeStyle.Star}, false, {
--             --     onSelected = function()
--             --         isInComponentsPrevisualisation = true
--             --     end
--             -- }, CustomMenu)
--         end)
--         RageUI.IsVisible(BuyVipMenu, function()
--             if not VIP.haveVip() then
--                 RageUI.Button('Acheter le VIP (1 mois)', nil, {RightLabel = '1250 ~g~Coins'}, true, {
--                     onActive = function()
--                         RageUI.Info(('%sBoutique de %s~s~'):format(UTILS.COLORCODE, kayscoreConfigServ.ServerName), {'Avantages:', 'Accès au menu VIP', 'Salaire ~g~1500~s~', 'Fourrière ~g~Gratuite~s~'}, {''})
--                     end,
--                     onSelected = function()
--                         local v = {label = 'VIP (1 mois)', price = 1250}
--                         exports['sPrompt']:displayRequest(
--                             kayscoreConfigServ.ServerName,
--                             ('Confirmer l\'achat de %s pour %s Coins ?'):format(v.label, v.price),
--                             function()
--                                 secured_TriggerServerEvent('kayscore:vip:buy')
--                             end,
--                             function()
--                                 ESX.ShowNotification("Achat annulé")
--                             end
--                         )
--                     end
--                 })
--             else
--                 RageUI.Button('Renouveler le VIP (1 mois)', nil, {RightLabel = '1250 ~g~Coins'}, true, {
--                     onSelected = function()
--                         local v = {label = 'VIP (1 mois)', price = 1250}
--                         exports['sPrompt']:displayRequest(
--                             kayscoreConfigServ.ServerName,
--                             ('Confirmer le renouvellement de %s pour %s Coins ?'):format(v.label, v.price),
--                             function()
--                                 secured_TriggerServerEvent('kayscore:vip:renew')
--                             end,
--                             function()
--                                 ESX.ShowNotification("Renouvellement annulé")
--                             end
--                         )
--                     end
--                 })
--             end
--         end)
        
    
--         RageUI.IsVisible(weaponData_menu, function()
--             RageUI.Info(('%sBoutique de %s~s~'):format(UTILS.COLORCODE, kayscoreConfigServ.ServerName), {'Code Boutique', 'Nombre de Points', 'Points Utilisé(s)'}, {ESX.PlayerData.UniqueID, InfoPlayer.coins, InfoPlayer.totalCoins})
    
--             for k, v in ipairs(BoutiqueConfig.weapons) do
--                 RageUI.Button(v.label, nil, {RightLabel = (kayscoreConfigServ.GTACOLOR..'%s~s~'):format(v.price)}, true, {
--                     onActive = function()
--                         RageUI.RenderCaissePreview("case", v.name)
--                     end,
--                     onSelected = function()
--                         if InfoPlayer.coins >= v.price then
--                             secured_TriggerServerEvent('kayscore:weapon:paid', v.price, v.name)
--                         else
--                             ESX.ShowNotification('Vous n\'avez pas assez de points')
--                         end
--                     end
--                 })
--             end
--         end)
    
--         RageUI.IsVisible(mainCaisses, function()
--             RageUI.Info(('%sBoutique de %s~s~'):format(UTILS.COLORCODE, kayscoreConfigServ.ServerName), {'Code Boutique', 'Nombre de Points', 'Points Utilisé(s)'}, {ESX.PlayerData.UniqueID, InfoPlayer.coins, InfoPlayer.totalCoins})
--             for k,v in ipairs(BoutiqueConfig['Case']) do
--                 RageUI.Button(v.label, nil, {RightLabel = v.price}, true, {
--                     onSelected = function()
--                         caisse_selected = k

--                         RageUI.Visible(caisses_data, true)
--                     end
--                 })
--             end
--         end)    

        

--         RageUI.IsVisible(mainPack, function()
--             for k, v in ipairs(BoutiqueConfig.Pack) do
--                 RageUI.Button(v.label, nil, {RightLabel =  v.price}, true, {
--                     onActive = function()
--                         RageUI.Info(v.infoLine, v.infosGauche, v.infosDroite)
--                     end,
--                     onSelected = function()
--                         ESX.ShowNotification('Ouvre un ticket sur le discord pour pouvoir acheter le pack')
--                     end
--                 })
--             end
--         end)
        

--         RageUI.IsVisible(caisses_data, function()
--                   RageUI.Info(('%sBoutique de %s~s~'):format(UTILS.COLORCODE, kayscoreConfigServ.ServerName), {'Code Boutique', 'Nombre de Points', 'Points Utilisé(s)'}, {ESX.PlayerData.UniqueID, InfoPlayer.coins, InfoPlayer.totalCoins})
--                   RageUI.Button('Acheter la caisse', nil, {RightLabel = BoutiqueConfig['Case'][caisse_selected].price}, true, {
--                     onSelected = function()
--                         -- Afficher la demande de confirmation
--                         exports['sPrompt']:displayRequestttt(
--                             'Confirmer l\'achat',
--                             'Tapez ~g~Y~s~ pour confirmer l\'achat de la caisse au prix de ~r~' .. BoutiqueConfig['Case'][caisse_selected].price .. '~s~ coins',
--                             function() -- Oui
--                                 if InfoPlayer.coins < BoutiqueConfig['Case'][caisse_selected].price then
--                                     ESX.ShowNotification('Vous ne possédez pas les coins nécessaires')
--                                     return
--                                 end
                
--                                 -- Jouer le son de confirmation et déclencher l'événement de paiement
--                                 RageUI.PlaySound("HUD_AWARDS", "FLIGHT_SCHOOL_LESSON_PASSED")
--                                 secured_TriggerServerEvent('kayscore:boutique:paidCase', caisse_selected)
--                             end,
--                             function() -- Non
--                                 ESX.ShowNotification("Vous avez annulé l'achat")
--                             end
--                         )
--                     end
--                 })
                
--             RageUI.Button('Visualiser les lots', nil, {RightBadge = RageUI.BadgeStyle.Star}, true, {

--             }, CaisseVisualSilver)
--         end)

--         RageUI.IsVisible(CaisseSilver, function()

--         end)

--         RageUI.IsVisible(CaisseVisualSilver, function()
--                   RageUI.Info(('%sBoutique de %s~s~'):format(UTILS.COLORCODE, kayscoreConfigServ.ServerName), {'Code Boutique', 'Nombre de Points', 'Points Utilisé(s)'}, {ESX.PlayerData.UniqueID, InfoPlayer.coins, InfoPlayer.totalCoins})
--             for k,v in ipairs(BoutiqueConfig['Case'][caisse_selected].rewards) do
--                 RageUI.Button(v.label, nil, {RightLabel = ('%s/%s Chance'):format(v.chance, #BoutiqueConfig['Case'][caisse_selected].rewards)}, true, {
--                     onSelected = function()
                        
--                     end,
--                     onActive = function()
--                     end
--                 })
--             end
--         end)

--         RageUI.IsVisible(mainVehicles, function()
--                   RageUI.Info(('%sBoutique de %s~s~'):format(UTILS.COLORCODE, kayscoreConfigServ.ServerName), {'Code Boutique', 'Nombre de Points', 'Points Utilisé(s)'}, {ESX.PlayerData.UniqueID, InfoPlayer.coins, InfoPlayer.totalCoins})
--             SetEntityRagdoll = true
--             for k,v in pairs(BoutiqueConfig['Voiture']) do
--                 RageUI.List(v.label.. (" [%s]"):format(v.type), liistt, innnndex, nil, {RightLabel = (kayscoreConfigServ.GTACOLOR..'%s~s~'):format(v.price)}, true, {
--                     onListChange = function(Index)
--                         innnndex = Index
--                     end,
--                     onActive = function()
--                         if vehicleHeading then
--                             SetEntityHeading(boutique.currentVehicle, vehicleHeading)
--                             vehicleHeading = vehicleHeading + 0.2
                
--                             if not scal then
--                                 SetEntityCollision(boutique.currentVehicle, false)
--                                 SetVehicleDoorsLocked(boutique.currentVehicle, 2)
--                                 SetVehicleDirtLevel(boutique.currentVehicle, 0.0)
--                                 FreezeEntityPosition(boutique.currentVehicle, true)
--                                 SetModelAsNoLongerNeeded(v.spawnName)
--                                 SetPedIntoVehicle(Player.playerPed, boutique.currentVehicle, -1)
--                                 scal = true
--                                 local name = ("%s"):format(v.label)
--                                 local maxSpeed = GetVehicleModelEstimatedMaxSpeed(GetEntityModel(boutique.currentVehicle)) * 1.25
--                                 local acceleration = GetVehicleModelAcceleration(GetEntityModel(boutique.currentVehicle)) * 200
--                                 local braking = GetVehicleModelMaxBraking(GetEntityModel(boutique.currentVehicle)) * 100;
--                                 local traction = GetVehicleModelMaxTraction(GetEntityModel(boutique.currentVehicle)) * 25
                
--                                 if scaleform then
--                                     scaleform:callFunction(
--                                         "SET_VEHICLE_INFOR_AND_STATS",
--                                         name,
--                                         --("Coffre : %sKG"):format(CoffreVehicle.Limit[GetEntityModel(vehicle)] ~= nil and CoffreVehicle.Limit[GetEntityModel(vehicle)] or 50),
--                                         "Informations :",
--                                         "icon",
--                                         "Vitesse max",
--                                         "Accélération",
--                                         "Frein",
--                                         "Suspension",
--                                         maxSpeed,
--                                         acceleration,
--                                         braking,
--                                         traction
--                                     )
--                                 end
--                             end
--                         end
--                     end,
--                     onSelected = function()
--                         if innnndex == 1 then
--                             if IsModelValid(v.spawnName) then
--                                 RequestModel(v.spawnName)
--                                 while not HasModelLoaded(v.spawnName) do
--                                     Citizen.Wait(0)
--                                 end
--                                 DeleteVehicle(boutique.currentVehicle)
--                                 ESX.Game.SpawnLocalVehicle(v.spawnName, boutique.vehiclePosition, 90.0, function(vehicle)
--                                     scal = false
--                                     boutique.currentVehicle = vehicle
--                                     vehicleHeading = GetEntityHeading(vehicle)
--                                 end)
--                             end
--                         elseif innnndex == 2 then
--                             local PlayerPed = Player.playerPed
--                             exports['sPrompt']:displayRequest(
--                                 kayscoreConfigServ.ServerName,
--                                 ('Confirmer l\'achat de %s pour %s points ?'):format(v.label, v.price),
--                                 function() -- Oui
--                                     if InfoPlayer.coins < v.price then 
--                                         ESX.ShowNotification('Vous ne possédez pas les points requis pour cet article')
--                                         return
--                                     end
--                                     buyVehicle(v.spawnName, v.label, v.price, v.type)
--                                 end,
--                                 function() -- Non
--                                     ESX.ShowNotification("Achat annulé")
--                                 end
--                             )
--                         end
--                     end
--                 })
                
--             end
--         end)

--         RageUI.IsVisible(mainTestVehicles, function()
--             RageUI.Separator(('Il vous reste : '..kayscoreConfigServ.GTACOLOR..'%s~s~ secondes'):format(IsTimeBoutique or 10))
--         end)


--         if not RageUI.Visible(main) and
--             not RageUI.Visible(mainCaisses) and
--             not RageUI.Visible(mainPack) and
--             not RageUI.Visible(CaisseSilver) and
--             not RageUI.Visible(CaisseVisualSilver) and
--             not RageUI.Visible(CustomMenu) and
--             not RageUI.Visible(CustomMenuSelected) and
--             not RageUI.Visible(mainVehicles) and
--             not RageUI.Visible(mainTestVehicles) and
--             not RageUI.Visible(BuyVipMenu) and

--             not RageUI.Visible(weaponMenu) and
--             not RageUI.Visible(weaponData_menu) and
--             not RageUI.Visible(caisses_data) and
--             not RageUI.Visible(instrumentFish) and

--             not RageUI.Visible(main) then
--             main = RMenu:DeleteType('main')
--             DeleteEntity(VehicleSpawned[LastVeh])
--             if LastVeh ~= nil then
--                 VehicleSpawned[LastVeh] = nil
--                 LastVeh = nil
--             end
--             if (scaleform) then
--                 SetScaleformMovieAsNoLongerNeeded(scaleform.id)
--                 scaleform = nil
--             end         
--             boutique.isInVehicle = false
--         end

--     end
-- end

-- function LunchTimerBoutique()
-- 	Citizen.CreateThread(function()
-- 		while true do
-- 			Wait(1*10*100)
-- 			if IsTimeBoutique >= 1 then
-- 				IsTimeBoutique = IsTimeBoutique-1
--             end
-- 			if IsTimeBoutique < 1 then
--                 IsTimeFinish = true
--                 exit = false
--                 while not NetworkHasControlOfEntity(oldVehBoutiqueTest) do
--                     Wait(1)
--                 end
--                 boutiqueMENUOpen = true
--                 SetEntityCoords(Player.playerPed, boutique.lastPos)
--                 RageUI.CloseAll()
--                 reopenMenu()
--                 stopprevue()
--                 DeleteEntity(oldVehBoutiqueTest)
--                 IsTimeBoutique = nil
--                 reopenBoutiqueMenu = true
--                 openMenuBoutique()
--                 boutique.isInVehicle = true
--                 SetEntityVisible(Player.playerPed, true)
--                 FreezeEntityPosition(Player.playerPed, false)

--                 Wait(100)

--                 local camCoords = GetOffsetFromEntityInWorldCoords(tempVeh, 3.0, 2.0, 2.0)
--                 loadedVehicle = true
-- 				break
--             end
-- 		end
--         Wait(1*200*100)
--         IsTimeRetest = true
-- 	end)
-- end

function DisableVehicleExitbOUTIUE()
    Citizen.CreateThread(function()
        while exit do
            Wait(0)
            DisableControlAction(0, 75, true)
        end
    end)
end

function camVeh()
    local camvoiture = CreateCam("DEFAULT_SCRIPTED_CAMERA", false)
    SetCamActive(camvoiture, true)
    SetCamParams(camvoiture, vector3(-70.918083190918, -823.94683837891, 327.41213989258) , 0.0 , 0.0 , 42.516128540039, 42.2442, 0, 1, 1, 2)
    SetCamFov(camvoiture, 60.0 --[[ distance (Field Of View) ]])
    RenderScriptCams(true, true --[[ activer l'animation ]], 2000 --[[ temps de l'animation ]], true, true)
end

RegisterCommand('kayscoreBoutique', function()
    openMenuBoutique()
end)

local NumberCharset = {}
local Charset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end

for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

function GeneratePlate()
	local generatedPlate
	local doBreak = false

	while true do
		Citizen.Wait(2)
		math.randomseed(GetGameTimer())

			generatedPlate = string.upper(GetRandomLetter(4) .. GetRandomNumber(4))

		ESX.TriggerServerCallback('boutique:verifierplaquedispo', function (isPlateTaken)
			if not isPlateTaken then
				doBreak = true
			end
		end, generatedPlate)

		if doBreak then
			break
		end
	end

	return generatedPlate
end

-- mixing async with sync tasks
function IsPlateTaken(plate)
	local callback = 'waiting'

	ESX.TriggerServerCallback('boutique:verifierplaquedispo', function(isPlateTaken)
		callback = isPlateTaken
	end, plate)

	while type(callback) == 'string' do
		Citizen.Wait(0)
	end

	return callback
end

function GetRandomNumber(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end

buyVehicle = function(spawnName, label, price, type)
    local plate = GeneratePlate()
        ESX.Game.SpawnVehicle(spawnName, vector3(748.97686767578, -4407.44140625, -0.65416955947876), GetEntityHeading(Player.playerPed), function (vehicle)                                            table.insert(sortirvoitureacheter, vehicle)
        SetEntityVisible(vehicle, false)
        local vehicleProps = lib.getVehicleProperties(sortirvoitureacheter[#sortirvoitureacheter])
        vehicleProps.plate = plate
        vehicleProps.neonEnabled = {false, false, false, false}
        vehicleProps.neonColor = {0, 0, 0}
        Wait(100)
        SetVehicleNumberPlateText(sortirvoitureacheter[#sortirvoitureacheter], plate)
        secured_TriggerServerEvent('shopBoutique:vehicule', vehicleProps, plate, price, label, type)
        Wait(10)
        DeleteEntity(vehicle)
    end)
end

-- Keys.Register("F1", "SlideBoutique", "Menu Boutique", function()
--     if boutiqueMENUOpen then
--         openMenuBoutique()
--     end
-- end)

-- AddEventHandler('onResourceStart', function(resource)
--     if GetCurrentResourceName() == resource then
--         secured_TriggerServerEvent('boutique:load')
--     end
-- end)

Citizen.CreateThread(function()
    for num, vehicle in ipairs(BoutiqueConfig['Voiture']) do
        AddTextEntryByHash(GetHashKey(vehicle.spawnName), vehicle.label)
    end
end)