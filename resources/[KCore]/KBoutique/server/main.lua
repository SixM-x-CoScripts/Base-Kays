if Boutique.Framework == "esx" then
    ESX = nil
    TriggerEvent(Boutique.getSharedObject, function(obj) ESX = obj end)
elseif Boutique.Framework == "newEsx" then 
    ESX = exports[Boutique.Extended_Name]:getSharedObject()
end

if (Boutique.Framework == "esx" or Boutique.Framework == "newEsx") then
    AddEventHandler('esx:playerLoaded', function(source)
        local identifier = GetIdentifier(source)
        local xPlayer = ESX.GetPlayerFromId(source)
    
        if identifier then
            local data = ExecuteSql('SELECT * FROM boutique WHERE citizenID = @citizenID', {
                ['@citizenID'] = identifier
            })   
            if not data or not data[1] then
                ExecuteSql('INSERT INTO boutique (citizenID, boutique_code, points) VALUES (@citizenID, @boutique_code, @points)', {
                    ['@citizenID'] = identifier,
                    ['@boutique_code'] = xPlayer.UniqueID,
                    ['@points'] = Boutique.NewArrivalCredit
                })
            end
        end
    end)
else
    AddEventHandler('playerConnecting', function()
        local source = source
        local identifier = GetIdentifier(source)
        local xPlayer = ESX.GetPlayerFromId(source)

        if identifier then
            local data = ExecuteSql('SELECT * FROM boutique WHERE citizenID = @citizenID', {
                ['@citizenID'] = identifier
            })   
            if not data or not data[1] then
                ExecuteSql('INSERT INTO boutique (citizenID, boutique_code, points) VALUES (@citizenID, @boutique_code, @points)', {
                    ['@citizenID'] = identifier,
                    ['@boutique_code'] = xPlayer.UniqueID,
                    ['@points'] = Boutique.NewArrivalCredit
                })
                
            end
        end
    end)
end

RegisterNetEvent("boutique:setPlayerBucket", function(bucket)
    local src = source
    SetPlayerRoutingBucket(src, bucket)
end)

function GetPlayerCredits(source, callback)
    local source = source
    local identifier = GetIdentifier(source)

    if identifier then
        local data = ExecuteSql('SELECT * FROM boutique WHERE citizenID = @citizenID', {
            ['@citizenID'] = identifier
        })
        if data and data[1] then   
            callback(data[1].points)
        end
    else
    end
end

RegisterNetEvent("GetPlayerCredits")
AddEventHandler("GetPlayerCredits", function()
    local source = source
    GetPlayerCredits(source, function(credits)
        local numCredits = tonumber(credits)
        TriggerClientEvent("ReceivePlayerCredit", source, numCredits) 
    end)
end)

RegisterNetEvent("GetCodeBoutique")
AddEventHandler("GetCodeBoutique", function()
    local source = source
    local identifier = GetIdentifier(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    if identifier then
        local data = ExecuteSql('SELECT * FROM boutique WHERE citizenID = @citizenID', {
            ['@citizenID'] = identifier
        })
        if data and data[1] then   
            TriggerClientEvent("ReceiveBoutiqueId", source, xPlayer.UniqueID)
        end
    else
    end
end)



RegisterServerEvent("DeleteCredits")
AddEventHandler("DeleteCredits", function(source, amount)
    local source = source
    local identifier = GetIdentifier(source)

    if identifier then
        local data = ExecuteSql('SELECT * FROM boutique WHERE citizenID = @citizenID', {
            ['@citizenID'] = identifier
        })
        if data and data[1] then
            local CurrentAmount = data[1].points
            local NewAmount = CurrentAmount - amount

            GetPlayerCredits(source, function(credits)
                local numCredits = tonumber(credits)
                local exec = ExecuteSql("UPDATE `boutique` SET `points`= @points WHERE citizenId = @citizenId", {
                    ['@citizenId'] = identifier,
                    ['@points'] = NewAmount 
                })
                TriggerClientEvent("ReceivePlayerCredit", source, NewAmount)
            end)
        else
        end
    else
    end
end)

RegisterServerEvent("Boutique:giveCoins")
AddEventHandler("Boutique:giveCoins", function(point, uniqueid)
    local source = source
    local identifier = GetIdentifier(source)

    if identifier then
        local result = ExecuteSql("SELECT * FROM boutique WHERE citizenID = @citizenID", {
            ['@citizenID'] = identifier
        })

        point = tonumber(point)

        if point and result and result[1] and result[1].points >= point then
            local NewAmount = result[1].points - point
            local result2 = ExecuteSql("SELECT * FROM boutique WHERE boutique_code = @boutique_code", {
                ['@boutique_code'] = uniqueid
            })

            if result2 and result2[1] then
                local receiver_identifier = result2[1].citizenID
                if receiver_identifier == identifier then
                    TriggerClientEvent("b:Notify", source, Boutique.Notifications.GiveCredits.RefuseIfYour)
                    return
                end

                ExecuteSql("UPDATE boutique SET points = @points WHERE citizenID = @citizenID", {
                    ['@citizenID'] = identifier,
                    ['@points'] = NewAmount
                })
                GetPlayerCredits(source, function(credits)
                    local numCredits = tonumber(credits)
                    TriggerClientEvent("ReceivePlayerCredit", source, numCredits) 
                end)

                local addpoint = result2[1].points + point
                local xTargetSource = GetPlayerFromIdentifier(receiver_identifier)

                ExecuteSql("UPDATE boutique SET points = @points WHERE boutique_code = @boutique_code", {
                    ['@boutique_code'] = uniqueid,
                    ['@points'] = addpoint
                })

                TriggerClientEvent("b:Notify", xTargetSource, Boutique.Notifications.GiveCredits.YouHaveReceive.." " .. point .. " "..Boutique.Notifications.GiveCredits.YouHaveReceive2.. " " .. GetPlayerName(source))
                
                GetPlayerCredits(xTargetSource, function(credits)
                    local numCredits = tonumber(credits)
                    TriggerClientEvent("ReceivePlayerCredit", xTargetSource, numCredits) 
                end)

                TriggerClientEvent("b:Notify", source, Boutique.Notifications.GiveCredits.TransferGood)
            else
                TriggerClientEvent("b:Notify", source, Boutique.Notifications.GiveCredits.TransferProblem)
            end
        else
            TriggerClientEvent("b:Notify", source, Boutique.Notifications.GiveCredits.TransferProblem)
        end
    end
end)

RegisterNetEvent("Boutique:Rewards")
AddEventHandler("Boutique:Rewards", function(type, data)
    if data == nil then
        return
    end

    local _source = source
    local citizenId = GetIdentifier(_source)
    local coinsToSubtract = data.coins or 0
    local name = data.name or ""
    local model = data.model or ""
    local count = data.count or 0
    local lootbox = data.lootbox
    local selling = data.selling

    local xPlayer
    if Boutique.Framework == "esx" or Boutique.Framework == "newEsx" then
        xPlayer = ESX.GetPlayerFromId(_source)
        if xPlayer == nil then
            return
        end
    end


    GetPlayerCredits(_source, function(credits)
        local numCredits = tonumber(credits)
        if numCredits >= coinsToSubtract then 
    
            -- Achat de véhicule
            if type == "vehicle" then
                local plate = GeneratePlate()
                local vehicleData = {model = GetHashKey(model), plate = plate, fuelLevel = 100.0}
                GiveVehicle(_source, citizenId, plate, vehicleData)

                local dataText
                if lootbox then
                    dataText = "a gagné un véhicule " .. model .. " depuis une caisse"
                else
                    dataText = "a acheté un véhicule " .. model .. " avec la plaque " .. plate .. " pour " .. coinsToSubtract .. " coins"
                end
    
                ExecuteSql("INSERT INTO boutique_history (uniqueid, data, lot) VALUES (@uniqueid, @data, @lot)", {
                    ['@uniqueid'] = xPlayer.UniqueID,
                    ['@data'] = dataText,
                    ['@lot'] = model
                })
    
                -- Envoi à Discord
                if lootbox then
                    SendToDiscord("lootbox", "Name: ``"..GetPlayerName(_source).."``\nIdentifier: ``"..citizenId.."``\nViens de gagner "..model.." depuis une lootbox")
                else
                    SendToDiscord("vehicle", "Name: ``"..GetPlayerName(_source).."``\nIdentifier: ``"..citizenId.."``\nViens d'acheter "..model.." depuis la boutique")
                end
    
            elseif type == "item" then
                GiveItem(_source, name)
                local dataText = "a acheté l'item " .. name
                ExecuteSql("INSERT INTO boutique_history (uniqueid, data, lot) VALUES (@uniqueid, @data, @lot)", {
                    ['@uniqueid'] = xPlayer.UniqueID,
                    ['@data'] = dataText,
                    ['@lot'] = name
                })
                if lootbox then
                    SendToDiscord("lootbox", "Name: ``"..GetPlayerName(_source).."``\nIdentifier: ``"..citizenId.."``\nViens de gagner "..name.." depuis une lootbox")
                else
                    SendToDiscord("item", "Name: ``"..GetPlayerName(_source).."``\nIdentifier: ``"..citizenId.."``\nViens d'acheter "..name.." depuis la boutique")
                end
    
            elseif type == "weapon" then
                GiveWeapon(_source, name)
                local dataText = "a acheté l'arme " .. name
                ExecuteSql("INSERT INTO boutique_history (uniqueid, data, lot) VALUES (@uniqueid, @data, @lot)", {
                    ['@uniqueid'] = xPlayer.UniqueID,
                    ['@data'] = dataText,
                    ['@lot'] = name
                })
                if lootbox then
                    SendToDiscord("lootbox", "Name: ``"..GetPlayerName(_source).."``\nIdentifier: ``"..citizenId.."``\nViens de gagner "..name.." depuis une lootbox")
                else
                    SendToDiscord("weapon", "Name: ``"..GetPlayerName(_source).."``\nIdentifier: ``"..citizenId.."``\nViens d'acheter "..name.." depuis la boutique")
                end
    
            elseif type == "money" then
                GiveMoney(_source, count)
                local dataText = "a acheté " .. count .. "$"
                ExecuteSql("INSERT INTO boutique_history (uniqueid, data, lot) VALUES (@uniqueid, @data, @lot)", {
                    ['@uniqueid'] = xPlayer.UniqueID,
                    ['@data'] = dataText,
                    ['@lot'] = count
                })
                if lootbox then
                    SendToDiscord("lootbox", "Name: ``"..GetPlayerName(_source).."``\nIdentifier: ``"..citizenId.."``\nViens de gagner "..count.."$ depuis une lootbox")
                else
                    SendToDiscord("money", "Name: ``"..GetPlayerName(_source).."``\nIdentifier: ``"..citizenId.."``\nViens d'acheter "..count.."$ depuis la boutique")
                end
    

            elseif type == "coins" then
                local data = ExecuteSql('SELECT * FROM boutique WHERE citizenID = @citizenID', {['@citizenID'] = citizenId})
                if data and data[1] then
                    local CurrentAmount = data[1].points
                    local NewAmount = CurrentAmount + count
                    local exec = ExecuteSql("UPDATE `boutique` SET `points`= @points WHERE citizenId = @citizenId", {
                        ['@citizenId'] = citizenId,
                        ['@points'] = NewAmount
                    })
    
                    local dataText = "a acheté " .. count .. " crédits"
                    ExecuteSql("INSERT INTO boutique_history (uniqueid, data, lot) VALUES (@uniqueid, @data, @lot)", {
                        ['@uniqueid'] = xPlayer.UniqueID,
                        ['@data'] = dataText,
                        ['@lot'] = count
                    })
    
                    SendToDiscord("coins", "Name: ``"..GetPlayerName(_source).."``\nIdentifier: ``"..citizenId.."``\nViens de gagner "..count.." crédits depuis une caisse")
                    if exec then
                        TriggerClientEvent("ReceivePlayerCredit", _source, NewAmount)
                    end
                end
                if selling then
                    SendToDiscord("selling", "Name: ``"..GetPlayerName(_source).."``\nIdentifier: ``"..citizenId.."``\nViens de revendre pour "..count.." crédits un élément d'une caisse")
                end
            end
    
            TriggerEvent("DeleteCredits", _source, coinsToSubtract)
        else
            TriggerClientEvent("b:Notify", _source, Boutique.Notifications.NoCoins)
        end
    end)
    
end)

RegisterCommand(Boutique.GiveCmdName, function(source, args, raw)
    local uniqueid = args[1]
    local point = args[2]

    if uniqueid == nil or point == nil then
        print("Usage : "..Boutique.GiveCmdName.." [id unique] [nbPoint]")
        return
    end

    if source == 0 then 
        local result = ExecuteSql("SELECT * FROM boutique WHERE boutique_code = @boutique_code", {
            ['@boutique_code'] = uniqueid
        })

        if result and result[1] then
            local CurrentAmount = result[1].points
            local NewAmount = tonumber(CurrentAmount) + tonumber(point)

            local exec = ExecuteSql("UPDATE `boutique` SET `points`= @points WHERE boutique_code = @boutique_code", {
                ['@boutique_code'] = uniqueid,
                ['@points'] = NewAmount 
            })

            if exec then
                print("Vous venez de donner " .. tostring(point) .. " à l'id boutique : " .. tostring(uniqueid).."\nIl possède maintenant "..tostring(NewAmount).." Points boutique")
                SendToDiscord("givepoint", "La console viens de donner ".. tostring(point) .." à l'id boutique : ".. tostring(uniqueid) .."\nIl possède maintenant "..tostring(NewAmount).." Points boutique")

            else
                print("Erreur lors de la mise à jour de la base de données")
            end

        else
            print("Erreur: Aucune donnée retournée de la requête SQL")
        end
    else
        print("La commande n'est pas autorisé ici!")
    end

end, false)


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
        generatedPlate = GenerateFormattedPlate(Boutique.PlateFormat)
        tablesql = Boutique.TableNameVehicle

        local result = ExecuteSql("SELECT 1 FROM "..tablesql.." WHERE plate = '"..generatedPlate.."'")
        if result[1] == nil then 
            doBreak = true
        end

        if doBreak then
            break
        end
    end

    return generatedPlate
end

function GenerateFormattedPlate(format)
    local plate = ""
    for i = 1, #format do
        local char = format:sub(i, i)
        if char == "L" then
            plate = plate .. string.upper(GetRandomLetter(1)) 
        elseif char == "N" then
            plate = plate .. GetRandomNumber(1)
        end
    end
    return plate
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
		return GetRandomLetter(length - 1) .. string.upper(Charset[math.random(1, #Charset)]) -- Conversion en majuscules
	else
		return ''
	end
end

function ExecuteSql(query, params)
    local IsBusy = true
    local result = nil
    if Boutique.Mysql == "oxmysql" then
        if MySQL == nil then
            exports.oxmysql:execute(query, params, function(data)
                result = data
                IsBusy = false
            end)
        else
            MySQL.query(query, params, function(data)
                result = data
                IsBusy = false
            end)
        end
    elseif Boutique.Mysql == "ghmattimysql" then
        exports.ghmattimysql:execute(query, params, function(data)
            result = data
            IsBusy = false
        end)
    elseif Boutique.Mysql == "mysql-async" then   
        MySQL.Async.fetchAll(query, params, function(data)
            result = data
            IsBusy = false
        end)
    end
    while IsBusy do
        Citizen.Wait(0)
    end
    return result
end