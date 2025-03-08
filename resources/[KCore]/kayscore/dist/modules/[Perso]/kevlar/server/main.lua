local MyClientCode = [[
    local InArmour = false

    RegisterNetEvent('kayscore:SetArmour')
    AddEventHandler('kayscore:SetArmour', function(type)

        InArmour = type
    end)

    AddEventHandler("gameEventTriggered", function(eventName, eventArguments)
        if InArmour then 
            local args = {}
            if eventName == "CEventNetworkEntityDamage" then
                local victimEntity, attackEntity, damage, _, _, fatalBool, weaponUsed, _, _, _, entityType = table.unpack(eventArguments)
                args = { victimEntity, attackEntity, fatalBool == 1, weaponUsed, entityType,
                    math.floor(string.unpack("f", string.pack("i4", damage)))
                }
                if GetEntityType(victimEntity) == 1 then 
                    if victimEntity == PlayerPedId() then 
                        if InArmour then 
                            if GetPedArmour(PlayerPedId()) == 0 then
                                TriggerServerEvent('kayscore:BreakKevlar')
                                ExecuteCommand('+ragdoll')
                                InArmour = false
                            end
                        end
                    end
                end
            end
        end
    end)

    function HasKevlar()

        return InArmour
    end
]]

-- local InArmour = false

-- RegisterNetEvent('kayscore:SetArmour')
-- AddEventHandler('kayscore:SetArmour', function(type)
--     print('kevlar', type)
--     InArmour = type
-- end)

-- AddEventHandler("gameEventTriggered", function(eventName, eventArguments, token)
--     if InArmour then 
--         local args = {}
--         if eventName == "CEventNetworkEntityDamage" then
--             local victimEntity, attackEntity, damage, _, _, fatalBool, weaponUsed, _, _, _, entityType = table.unpack(eventArguments)
--             args = { victimEntity, attackEntity, fatalBool == 1, weaponUsed, entityType,
--                 math.floor(string.unpack("f", string.pack("i4", damage)))
--             }
--             if GetEntityType(victimEntity) == 1 then 
--                 if victimEntity == PlayerPedId() then 
--                     if InArmour then 
--                         if GetPedArmour(PlayerPedId()) == 0 then
--                             TriggerServerEvent('kayscore:BreakKevlar')
--                             ExecuteCommand('+ragdoll')
--                             InArmour = false
--                         end
--                     end
--                 end
--             end
--         end
--     end
-- end)

-- function HasKevlar()

--     return InArmour
-- end

local LoadingCode = {}
RegisterNetEvent('kayscore:LoadKevlarCode')
AddEventHandler('kayscore:LoadKevlarCode', function()
    if not LoadingCode[source] then 
        LoadingCode[source] = true
        TriggerClientEvent('kayscore:Kevlar', source, MyClientCode)
    else
        DropPlayer(source, 'Duplicated code')
    end
end)

kayscoreConfigServ.eKevlar.PlayerList = {}
kayscoreConfigServ.eKevlar.KevPlayList = {}
kayscoreConfigServ.eKevlar.tokenPlayer = {}

AddEventHandler('esx:playerLoaded', function()
    local _src = source
    if not kayscoreConfigServ.eKevlar.KevPlayList[_src] then 
        kayscoreConfigServ.eKevlar.KevPlayList[_src] = _src
        kayscoreConfigServ.eKevlar.tokenPlayer[_src] = _src

    end
end)

AddEventHandler("esx:playerDropped", function(reason)
    if kayscoreConfigServ.eKevlar.KevPlayList[source] then 
        kayscoreConfigServ.eKevlar.KevPlayList[source] = nil
        kayscoreConfigServ.eKevlar.tokenPlayer[source] = nil
    end
end)

Citizen.CreateThread(function()
    while true do 
        Wait(100)
        for k,v in pairs(kayscoreConfigServ.eKevlar.PlayerList) do 
            if GetPlayerPed(k) ~= 0 then
                Wait(350)
                if GetPedArmour(GetPlayerPed(k)) == 0 and kayscoreConfigServ.eKevlar.KevPlayList[k] then 
                    kayscoreConfigServ.eKevlar.KevPlayList[k] = nil
                elseif GetPedArmour(GetPlayerPed(k)) > 0 and kayscoreConfigServ.eKevlar.KevPlayList[k] then
                    kayscoreConfigServ.eKevlar.KevPlayList[k] = GetPedArmour(GetPlayerPed(k))
                end

                if GetPedArmour(GetPlayerPed(k)) > 0 and not kayscoreConfigServ.eKevlar.KevPlayList[k] then
                    kayscoreConfigServ.eKevlar.BanAction()
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while ESX == nil do Wait(1) end 
    ESX.RegisterUsableItem('kevlar', function(source)
        --print('kevlar')
        TriggerEvent('kayscore:UseKevlar', source, 'kevlar', 100)
    end)

    ESX.RegisterUsableItem('kevlarmid', function(source)
        TriggerEvent('kayscore:UseKevlar', source, 'kevlarmid', 75)
    end)
    
    ESX.RegisterUsableItem('kevlarlow', function(source)
        TriggerEvent('kayscore:UseKevlar', source, 'kevlarlow', 50)
    end)
end)

RegisterNetEvent('getPlayerskin')
AddEventHandler('getPlayerskin', function(identifier, cb)
	MySQL.Async.fetchAll('SELECT skin FROM users WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(users)
		local user, skin = users[1]

		if user.skin then
			skin = json.decode(user.skin)
		end
		cb(skin)
	end)
end)

RegisterNetEvent('kayscore:BreakKevlar')
AddEventHandler('kayscore:BreakKevlar', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if kayscoreConfigServ.eKevlar.KevPlayList[src] then 
        kayscoreConfigServ.eKevlar.KevPlayList[src] = nil
    end
    TriggerEvent('getPlayerskin', xPlayer.identifier, function(skin)
        if skin.sex == 0 then
            local clothesSkin = {
                ['bproof_1'] = 0, 
                ['bproof_2'] = 0,
            }
            TriggerClientEvent(kayscoreConfigServ.eKevlar.loadClothesEvent, src, skin, clothesSkin)
        else
            local clothesSkin = {
                ['bproof_1'] = 0, 
                ['bproof_2'] = 0,
            }
            TriggerEvent(kayscoreConfigServ.eKevlar.loadClothesEvent, src, skin, clothesSkin)
        end
    end)
end)

AddEventHandler('kayscore:UseKevlar', function(src, type, count)
    local src = src
    local xPlayer = ESX.GetPlayerFromId(src)

    if (xPlayer) then 
        if xPlayer.getInventoryItem(type).count > 0 then
            if not kayscoreConfigServ.eKevlar.KevPlayList[src] then
              xPlayer.removeInventoryItem(type, 1)
              kayscoreConfigServ.eKevlar.KevPlayList[src] = count
              SetPedArmour(GetPlayerPed(src), count)
                -- print('identifier '..xPlayer.identifier)
              TriggerEvent('getPlayerskin', xPlayer.identifier, function(skin)
                  if skin.sex == 0 then
                      local clothesSkin = {
                          ['bproof_1'] = kayscoreConfigServ.eKevlar.skin.male.kevID, 
                          ['bproof_2'] = kayscoreConfigServ.eKevlar.skin.male.textureID,
                      }
                      TriggerClientEvent(kayscoreConfigServ.eKevlar.loadClothesEvent, src, skin, clothesSkin)
                  else
                      local clothesSkin = {
                          ['bproof_1'] = kayscoreConfigServ.eKevlar.skin.female.kevID, 
                          ['bproof_2'] = kayscoreConfigServ.eKevlar.skin.female.textureID,
                      }
                      TriggerEvent(kayscoreConfigServ.eKevlar.loadClothesEvent, src, skin, clothesSkin)

                  end
              end)
              TriggerClientEvent('kayscore:SetArmour', src, true)
              sendLog(("Le Joueur (%s - %s) viens d'utiliser son kevlar"):format(xPlayer.name, xPlayer.UniqueID ), {
                author = society,
                fields = {
                    {title = 'Player', subtitle = xPlayer.name},
                    {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                    {title = 'Identifier', subtitle = xPlayer.identifier},
                },
                channel = 'kevlar'
            })
            else
                xPlayer.showNotification('Vous avez déjà un kevlar')
            end
        end
    end
end)

RegisterNetEvent('kayscore:RemoveKevlar')
AddEventHandler('kayscore:RemoveKevlar', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if kayscoreConfigServ.eKevlar.KevPlayList[src] and GetPedArmour(GetPlayerPed(src)) > 0 then
        if GetPedArmour(GetPlayerPed(src)) > 24 and GetPedArmour(GetPlayerPed(src)) < 50 then
            xPlayer.addInventoryItem('kevlarlow', 1) 
            kayscoreConfigServ.eKevlar.KevPlayList[src] = nil
        elseif GetPedArmour(GetPlayerPed(src)) > 49 and GetPedArmour(GetPlayerPed(src)) < 75 then
            xPlayer.addInventoryItem('kevlarmid', 1) 
            kayscoreConfigServ.eKevlar.KevPlayList[src] = nil
        elseif GetPedArmour(GetPlayerPed(src)) > 74 and GetPedArmour(GetPlayerPed(src)) <= 100 then
            xPlayer.addInventoryItem('kevlar', 1) 
            kayscoreConfigServ.eKevlar.KevPlayList[src] = nil
        end
        TriggerEvent('getPlayerskin', xPlayer.identifier, function(skin)
            if skin.sex == 0 then
                local clothesSkin = {
                    ['bproof_1'] = 0, 
                    ['bproof_2'] = 0,
                }
                TriggerClientEvent(kayscoreConfigServ.eKevlar.loadClothesEvent, src, skin, clothesSkin)
            else
                local clothesSkin = {
                    ['bproof_1'] = 0, 
                    ['bproof_2'] = 0,
                }
                TriggerEvent(kayscoreConfigServ.eKevlar.loadClothesEvent, src, skin, clothesSkin)
            end
        end)
        SetPedArmour(GetPlayerPed(src), 0)
        xPlayer.showNotification('Votre kevlar à été remis dans votre inventaire')
        TriggerClientEvent('kayscore:SetArmour', src, false)
    else
        xPlayer.showNotification('Vous n\'avez pas de kevlar')
    end
end)

AddEventHandler('playerDropped', function (reason)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if (xPlayer) then
        if kayscoreConfigServ.eKevlar.KevPlayList[src] then
            if kayscoreConfigServ.eKevlar.KevPlayList[src] > 24 and kayscoreConfigServ.eKevlar.KevPlayList[src] < 50 then
                xPlayer.addInventoryItem('kevlarlow', 1) 
            elseif kayscoreConfigServ.eKevlar.KevPlayList[src] > 49 and kayscoreConfigServ.eKevlar.KevPlayList[src] < 75 then
                xPlayer.addInventoryItem('kevlarmid', 1) 
            elseif kayscoreConfigServ.eKevlar.KevPlayList[src] > 74 and kayscoreConfigServ.eKevlar.KevPlayList[src] <= 100 then
                xPlayer.addInventoryItem('kevlar', 1) 
            end
        end
    end
end)