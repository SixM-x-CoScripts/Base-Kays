local LeBonCoin = {}
local LeBonCoinAll = {}
local VehiclePlayer = {}
local InfosVente = {}

-- Cache Dynamique
CreateThread(function()
    MySQL.Async.fetchAll("SELECT * FROM player_leboncoin ", {}, function(result)
        for k, v in pairs(result) do 
            if not LeBonCoin[v.UniqueID] then  
                LeBonCoin[v.UniqueID] = {}
            end
            if not LeBonCoin[v.UniqueID][v.id] then
                LeBonCoin[v.UniqueID][v.id] = {}
            end
            LeBonCoin[v.UniqueID][v.id].UniqueID = v.UniqueID 
            LeBonCoin[v.UniqueID][v.id].label = v.label 
            LeBonCoin[v.UniqueID][v.id].name = v.name 
            LeBonCoin[v.UniqueID][v.id].count = v.count 
            LeBonCoin[v.UniqueID][v.id].type = v.type  
            LeBonCoin[v.UniqueID][v.id].price = v.price 
            LeBonCoin[v.UniqueID][v.id].id = v.id  
            LeBonCoin[v.UniqueID][v.id].props = json.decode(v.vehicle)
            LeBonCoin[v.UniqueID][v.id].plate = v.plate  
            table.insert(LeBonCoinAll, {
                UniqueID = LeBonCoin[v.UniqueID][v.id].UniqueID,
                label = LeBonCoin[v.UniqueID][v.id].label,
                id = LeBonCoin[v.UniqueID][v.id].id,
                name = LeBonCoin[v.UniqueID][v.id].name,
                type = LeBonCoin[v.UniqueID][v.id].type,
                count = LeBonCoin[v.UniqueID][v.id].count,
                price = LeBonCoin[v.UniqueID][v.id].price,
                props = LeBonCoin[v.UniqueID][v.id].props,
                plate = LeBonCoin[v.UniqueID][v.id].plate
            })
        end
    end)
end)

-- Get les véhicules du joueur 
ESX.RegisterServerCallback("kayscoreLpb:getplayerveh", function(source, cb)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local vehicules = {}

	MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE owner=@UniqueID and boutique =@boutique",{
        ['@UniqueID'] = xPlayer.UniqueID,
        ["@boutique"] = 0
	}, function(data) 

		for _,v in pairs(data) do
			local props = json.decode(v.vehicle)
			table.insert(vehicules, {
                typee = v.type,
                props = props, 
                plate = v.plate,
                UniqueID = v.owner
            })
		end
		cb(vehicules)
	end)
end)

-- Check si le joueur à vendu des trucs lorsqu'il était déco 
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(source)
    Wait(1000)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll("SELECT * FROM vente_leboncoin WHERE UniqueID = @UniqueID", {
        ["@UniqueID"] = xPlayer.UniqueID
    },function(result)
        if #result > 0 then 
            InfosVente[xPlayer.UniqueID] = {}
            for k, v in pairs(result) do 
                InfosVente[v.UniqueID][v.id] = {}
                InfosVente[v.UniqueID][v.id].id = v.id
                InfosVente[v.UniqueID][v.id].UniqueID = v.UniqueID
                InfosVente[v.UniqueID][v.id].id = v.id
                InfosVente[v.UniqueID][v.id].price = v.price
            end
            xPlayer.showNotification(kayscoreConfigServ.GTACOLOR.."Slide~w~Vous avez vendu des objets sur leboncoin, allez dés maintenant récupérer votre argent !")
            TriggerClientEvent("kayscoreLpb:recieveventeplayer", xPlayer.source, InfosVente[xPlayer.UniqueID])
        else
        end
    end)
end)

-- Récupérer les annonces du joueur 
secured_RegisterNetEvent("kayscoreLpb:recieveannoncelbc")
secured_AddEventHandler("kayscoreLpb:recieveannoncelbc", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not LeBonCoin[xPlayer.UniqueID] then 
        LeBonCoin[xPlayer.UniqueID] = {}
        TriggerClientEvent("kayscoreLpb:recieveclientsideannoncelbc", xPlayer.source, nil)
    else
        TriggerClientEvent("kayscoreLpb:recieveclientsideannoncelbc", xPlayer.source, LeBonCoin[xPlayer.UniqueID])
    end
end)

-- Cb toutes les annonces 
secured_RegisterNetEvent('kayscoreLpb:cballannonces')
secured_AddEventHandler('kayscoreLpb:cballannonces',function()
    secured_TriggerClientEvent('kayscoreLpb:cballannoncesafter', source, LeBonCoinAll)
end)

-- Mise en vente d'un item
secured_RegisterNetEvent("kayscoreLpb:lbcventeitem")
secured_AddEventHandler("kayscoreLpb:lbcventeitem", function(label, name, countt, price, infos)
    if kayscoreConfigServ.BlackListItem[name] ~= nil then 
        xPlayer.showNotification("Vous ne pouvez pas mettre en vente cette item")
        return
    end
    local xPlayer = ESX.GetPlayerFromId(source)
    local Verif = xPlayer.getInventoryItem(name).count >= tonumber(countt) and true or false 
    if Verif then 
        local Id1 = math.random(11111, 999999)
        local Id2 = math.random(11111, 999999)
        local Valide = Id1 + Id2 

        xPlayer.removeInventoryItem(name, tonumber(countt))
        xPlayer.showAdvancedNotification(kayscoreConfigServ.ServerName, "Leboncoin", "Vous avez déposer une annonce de x"..countt.." "..label.." au prix de ~r~"..price.."", "CHAR_CALIFORNIA", 8)
        if not LeBonCoin[xPlayer.UniqueID][Valide] then 
            LeBonCoin[xPlayer.UniqueID][Valide] = {}
            LeBonCoin[xPlayer.UniqueID][Valide].UniqueID = xPlayer.UniqueID 
            LeBonCoin[xPlayer.UniqueID][Valide].name = name
            LeBonCoin[xPlayer.UniqueID][Valide].label = label
            LeBonCoin[xPlayer.UniqueID][Valide].type = "obj"
            LeBonCoin[xPlayer.UniqueID][Valide].count = tostring(countt)
            LeBonCoin[xPlayer.UniqueID][Valide].price = tostring(price) 
            LeBonCoin[xPlayer.UniqueID][Valide].id = Valide
            table.insert(LeBonCoinAll, {
                UniqueID = LeBonCoin[xPlayer.UniqueID][Valide].UniqueID,
                label = LeBonCoin[xPlayer.UniqueID][Valide].label,
                id = LeBonCoin[xPlayer.UniqueID][Valide].id,
                name = LeBonCoin[xPlayer.UniqueID][Valide].name,
                type = LeBonCoin[xPlayer.UniqueID][Valide].type,
                count = LeBonCoin[xPlayer.UniqueID][Valide].count,
                price = LeBonCoin[xPlayer.UniqueID][Valide].price
            })
            MySQL.Async.execute("INSERT INTO player_leboncoin (UniqueID, label, name, count, type, price, id) VALUES (@UniqueID, @label, @name, @count, @type, @price, @id)", {
                ["@UniqueID"] = xPlayer.UniqueID, 
                ["@label"] = tostring(label),
                ["@name"] = tostring(name),
                ["@count"] = tostring(countt),
                ["@type"] = "obj", 
                ["@price"] = tostring(price),
                ["@id"] = Valide
            })
            xPlayer.showNotification("Votre annonce sera disponible dans quelques minutes")
            TriggerClientEvent("kayscoreLpb:recieveclientsideannoncelbc", source, LeBonCoin[xPlayer.UniqueID])
            LbcLogs(15105570, "Slide Dépot Annonce Leboncoin OBJECT", "Le joueur:\n Nom Steam: **"..xPlayer.getName()..'**\nID:**'..source.."** \nId unique : **"..xPlayer.UniqueID..'** \n\n à mis en vente un item: \nNom de l\'item: **'..label.."**\nQuantité: **"..countt.."**\nPrix: **"..price.." $**\nId Unique de l'annonce:** "..Valide.."**")
        end
    else
    end
end)

-- Mise en vente d'un véhicule
secured_RegisterNetEvent("kayscoreLpb:lbcventeveh")
secured_AddEventHandler("kayscoreLpb:lbcventeveh", function(props, plate, price, label, infos, typeee)
    local CountVeh = 0
    local src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local Id1 = math.random(11111, 999999)
    local Id2 = math.random(11111, 999999)
    local Valide = Id1 + Id2 
    for k, v in pairs(VehiclePlayer) do 
        if v.UniqueID ~= xPlayer.UniqueID then return end
    end
    
    for k, v in pairs(LeBonCoinAll) do 
        if v.plate == plate then 
            xPlayer.showNotification(kayscoreConfigServ.GTACOLOR.."Slide~w~Se véhicule est déjà en vente !")
            return
        end
    end

    if LeBonCoin[xPlayer.UniqueID] then 
        for k,v in pairs(LeBonCoin[xPlayer.UniqueID]) do 
            CountVeh = CountVeh +1
        end
    end
    if CountVeh >= 5 then
        xPlayer.showNotification(kayscoreConfigServ.GTACOLOR..'Slide ~w~Vous avez déjà 5 véhicules en vente !')
        return
    end
	MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE owner=@UniqueID and plate =@plate",{
        ['@UniqueID'] = xPlayer.UniqueID,
        ["@plate"] = plate
	}, function(data) 
        if #data >= 1 then 
            -- print(typeee)
            if not LeBonCoin[xPlayer.UniqueID][Valide] then 
                LeBonCoin[xPlayer.UniqueID][Valide] = {}
                LeBonCoin[xPlayer.UniqueID][Valide].UniqueID = xPlayer.UniqueID 
                LeBonCoin[xPlayer.UniqueID][Valide].plate = plate
                LeBonCoin[xPlayer.UniqueID][Valide].type = typeee
                LeBonCoin[xPlayer.UniqueID][Valide].name = infos
                LeBonCoin[xPlayer.UniqueID][Valide].props = props
                LeBonCoin[xPlayer.UniqueID][Valide].price = tostring(price)
                LeBonCoin[xPlayer.UniqueID][Valide].id = Valide
                table.insert(LeBonCoinAll, {
                    UniqueID = LeBonCoin[xPlayer.UniqueID][Valide].UniqueID,
                    plate = LeBonCoin[xPlayer.UniqueID][Valide].plate,
                    name = LeBonCoin[xPlayer.UniqueID][Valide].name,
                    type = LeBonCoin[xPlayer.UniqueID][Valide].type,
                    props = LeBonCoin[xPlayer.UniqueID][Valide].props,
                    price = LeBonCoin[xPlayer.UniqueID][Valide].price,
                    id = LeBonCoin[xPlayer.UniqueID][Valide].id
                })
                TriggerClientEvent("kayscoreLpb:recieveclientsideannoncelbc", src, LeBonCoin[xPlayer.UniqueID])
                MySQL.Async.execute("INSERT INTO player_leboncoin (UniqueID, type, name, plate, price, vehicle, id) VALUES (@UniqueID, @type, @name, @plate, @price, @vehicle, @id)", {
                    ["@UniqueID"] = xPlayer.UniqueID, 
                    ["@type"] = typeee,
                    ["@name"] = infos,
                    ["@plate"] = plate,
                    ["@price"] = price,
                    ["@vehicle"] = json.encode(props),
                    ["@id"] = Valide
                })
                xPlayer.showNotification(kayscoreConfigServ.GTACOLOR.."Slide~w~Vous avez mis votre véhicule en vente")
                LbcLogs(15105570, "Slide Dépot d'une annonce véhicule", "Le joueur:\n Nom Steam: **"..xPlayer.getName()..'**\nID:**'..src.."** \nId unique : **"..xPlayer.UniqueID..'** \n\n à mis en vente un véhicule:\n\nPlaque: **'..plate..'**\nPrix:** '..price..'**\nId Unique de l\'annonce:**' ..Valide.."**")
                MySQL.Async.execute([[
                    DELETE FROM owned_vehicles WHERE plate = @plate
                ]], {
                    ["@plate"] = plate
                })
                xPlayer.showNotification("Votre annonce sera disponible dans quelques minutes")
                TriggerClientEvent("kayscoreLpb:recieveclientsideannoncelbc", src, LeBonCoin[xPlayer.UniqueID])
            end
        else
            xPlayer.showNotification(kayscoreConfigServ.GTACOLOR..'Slide~w~Ce véhicule ne vous appartient pas')
        end
	end)
end)

-- Update/Delete d'une annonce 
secured_RegisterNetEvent("kayscoreLpb:updateannoncelbc")
secured_AddEventHandler("kayscoreLpb:updateannoncelbc", function(typee, id, price, typeee)
    local xPlayer = ESX.GetPlayerFromId(source)

    local Veriflicense = LeBonCoin[xPlayer.UniqueID][id].UniqueID == xPlayer.UniqueID and true or false 
    local VerifType = typee == "delete" and "del" or typee == "price" and "newprice" or "ban"
    if LeBonCoin[xPlayer.UniqueID][id] == nil then 
        xPlayer.showNotification("Cette annonce n'est plus en ligne, elle disparaitera prochainement")
        return;
    end
    if Veriflicense then 
        if VerifType == "del" then 
            if typeee == "veh" then 
                MySQL.Async.execute("INSERT INTO owned_vehicles (owner, plate, vehicle, type, state) VALUES (@owner, @plate, @vehicle, @type, @state)", {
                    ["@owner"] = xPlayer.UniqueID, 
                    ["@plate"] = LeBonCoin[xPlayer.UniqueID][id].plate,
                    ["@vehicle"] = json.encode(LeBonCoin[xPlayer.UniqueID][id].props),
                    ["@type"] =  LeBonCoin[xPlayer.UniqueID][id].type ,
                    ["@state"] = tonumber(1)
                })
            else
                xPlayer.showNotification(kayscoreConfigServ.GTACOLOR.."Slide~w~Vous avez supprimé votre annonce ")
                xPlayer.addInventoryItem(LeBonCoin[xPlayer.UniqueID][id].name, tonumber(LeBonCoin[xPlayer.UniqueID][id].count))
                LeBonCoin[xPlayer.UniqueID][id] = nil 
            end
            for k, v in pairs(LeBonCoinAll) do 
                if v.id == id then 
                    table.remove(LeBonCoinAll, k)
                end
            end
            MySQL.Async.execute("DELETE FROM player_leboncoin WHERE id = @id", {
                ["@id"] = id,
            })
            LeBonCoin[xPlayer.UniqueID][id] = nil 
            TriggerClientEvent("kayscoreLpb:recieveclientsideannoncelbc", source, LeBonCoin[xPlayer.UniqueID])
            LbcLogs(15158332, "Suprrésion d'une annonce Leboncoin", "Le joueur:\n Nom Steam: **"..xPlayer.getName()..'**\nID:**'..source.."** \nId unique : **"..xPlayer.UniqueID..'** \n\n à supprimé l\'annonce: numéro: **'..id..'**')
           
        elseif VerifType == "newprice" then
            LeBonCoin[xPlayer.UniqueID][id].price = price 
            TriggerClientEvent("kayscoreLpb:recieveclientsideannoncelbc", source, LeBonCoin[xPlayer.UniqueID])
            MySQL.Async.execute("UPDATE leboncoin set price = @price WHERE id = @id", {
                ["@id"] = id, 
                ["@price"] = tostring(price)
            })
            for k, v in pairs(LeBonCoinAll) do 
                if v.id == id then 
                    v.price = price 
                end
            end
        else
        end
    else
    end
end)

--Achat d'un item 
secured_RegisterNetEvent("kayscoreLpb:buyobjlbc")
secured_AddEventHandler("kayscoreLpb:buyobjlbc", function(id, UniqueID, quant)
    local xPlayer = ESX.GetPlayerFromId(source)
    local tPlayer = ESX.GetPlayerFromUniqueID(UniqueID)
    if LeBonCoin[UniqueID][id] == nil then 
        xPlayer.showNotification("Cette annonce n'est plus en ligne, elle disparaitera prochainement")
        return
    end
    if xPlayer.UniqueID == UniqueID then xPlayer.showNotification("Vous ne pouvez pas acheté votre propre bien") return end 
    
    if LeBonCoin[UniqueID][id].count >= quant then 
        if xPlayer.getAccount('cash').money >= tonumber(LeBonCoin[UniqueID][id].price)*tonumber(quant) then
            if xPlayer.canCarryItem(LeBonCoin[UniqueID][id].name, tonumber(quant)) then
                if tPlayer ~= nil then 
                    tPlayer.addAccountMoney('bank', tonumber(LeBonCoin[UniqueID][id].price*0.95)*tonumber(quant))
                    tPlayer.showNotification(kayscoreConfigServ.GTACOLOR.."Slide~w~Vous avez vendu ~r~x"..quant.." de ~s~~r~"..LeBonCoin[UniqueID][id].label.."~s~Vous avez reçu l'argent sur votre compte bancaire")
                else
                    -- ADD L ARGENT AU JOUEUR QUAND IL EST PAS CO
                    MySQL.Async.execute("INSERT INTO vente_leboncoin (UniqueID, price) VALUES (@UniqueID, @price)", {
                        ["@UniqueID"] = UniqueID,
                        ["@price"] = tonumber(LeBonCoin[UniqueID][id].price*0.95)*tonumber(quant)
                    })
                end
                TriggerEvent('esx_addonaccount:getSharedAccount', 'society_leboncoin', function(account)
                    account.addMoney(LeBonCoin[UniqueID][id].price*5/100)
                end)
                xPlayer.removeAccountMoney('cash', tonumber(LeBonCoin[UniqueID][id].price)*tonumber(quant))
                xPlayer.addInventoryItem(LeBonCoin[UniqueID][id].name, tonumber(quant))

                if tonumber(quant) == tonumber(LeBonCoin[UniqueID][id].count) then 
                    LbcLogs(1752220, "Achat d'un object le bon coin", "Le joueur \nNom Steam: **"..xPlayer.getName()..'**\nID:**'..xPlayer.source.."** \nId unique : **"..xPlayer.UniqueID..'** à acheté un les object de:\n**'..UniqueID.."**\nPrix: **"..LeBonCoin[UniqueID][id].price..'**\nLabel: **'..LeBonCoin[UniqueID][id].label..'**\nQuantité: **'..quant..'**\nId Unique de l\'annonce: **'..id.."**")
                    for k, v in pairs(LeBonCoinAll) do 
                        if v.id == id then 
                            table.remove(LeBonCoinAll, k)
                        end
                    end
                    LeBonCoin[UniqueID][id] = nil
                    MySQL.Async.execute("DELETE FROM player_leboncoin WHERE id = @id", {
                        ["@id"] = id,
                    })
                else
                    LeBonCoin[UniqueID][id].count = tonumber(LeBonCoin[UniqueID][id].count) - tonumber(quant)
                    for k, v in pairs(LeBonCoinAll) do 
                        if v.id == id then 
                            v.count = tonumber(v.count) - tonumber(quant)

                        end
                    end
                    MySQL.Async.execute("UPDATE leboncoin set count = count - @count WHERE id = @id", {
                        ["@id"] = id,
                        ["@count"] = tonumber(quant)
                    })
                    LbcLogs(1752220, "Achat d'un object le bon coin", "Le joueur \nNom Steam: **"..xPlayer.getName()..'**\nID:**'..xPlayer.source.."** \nId unique : **"..xPlayer.UniqueID..'** à acheté un les object de:\n**'..UniqueID.."\nPrix: **"..LeBonCoin[UniqueID][id].price..'**\nLabel: **'..LeBonCoin[UniqueID][id].label..'\nQuantité: **'..LeBonCoin[UniqueID][id].count..'\nId Unique de l\'annonce: **'..id.."")
                end
                Wait(10)

                if tPlayer ~= nil then 
                    TriggerClientEvent("kayscoreLpb:recieveclientsideannoncelbc", tPlayer.source, LeBonCoin[UniqueID])
                end
                TriggerClientEvent("kayscoreLpb:recieveclientsideannoncelbc", xPlayer.source, LeBonCoin[xPlayer.UniqueID])
            else
                xPlayer.showNotification(kayscoreConfigServ.GTACOLOR..'Slide ~w~Vous êtes trop lourd pour acheter ces objets.')
            end
        else
            xPlayer.showNotification("Vous n'avez pas les fonds nécéssaires")
        end
    else
        xPlayer.showNotification(kayscoreConfigServ.GTACOLOR..'Slide ~w~Il n\'y a pas assez d\'objets dans cette annonce.')
    end
end)

-- Achat d'un véhicule
secured_RegisterNetEvent("kayscoreLpb:achatveh")
secured_AddEventHandler("kayscoreLpb:achatveh", function(id, UniqueID)

    local xPlayer = ESX.GetPlayerFromId(source)
    local tPlayer = ESX.GetPlayerFromUniqueID(UniqueID)
    if LeBonCoin[UniqueID][id] == nil then 
        xPlayer.showNotification("Cette annonce n'est plus en ligne, elle disparaitera prochainement")
        return;
    end
    local VerifPlate = UniqueID == LeBonCoin[UniqueID][id].UniqueID and true or false 
    if xPlayer.UniqueID == UniqueID then xPlayer.showNotification("Vous ne pouvez pas acheté votre propre bien") return end 
    if VerifPlate then 
        local money = xPlayer.getAccount('cash').money >= tonumber(LeBonCoin[UniqueID][id].price) and 'cash' or xPlayer.getAccount('bank').money >= tonumber(LeBonCoin[UniqueID][id].price) and 'bank' or "nomoney" 
        if money == 'cash' then 
            xPlayer.removeAccountMoney('cash', tonumber(LeBonCoin[UniqueID][id].price))
        elseif money == "bank" then 
            xPlayer.removeAccountMoney('bank', tonumber(LeBonCoin[UniqueID][id].price))
        else
            xPlayer.showNotification("Vous ne disposez pas des fonds pour faire cela")
            return
        end
        if tPlayer ~= nil then 
            tPlayer.addAccountMoney('bank', tonumber(LeBonCoin[UniqueID][id].price)*0.95)
            tPlayer.showNotification(kayscoreConfigServ.GTACOLOR.."Slide~w~Vous avez votre véhicule ~r~"..LeBonCoin[UniqueID][id].plate.."~s~Vous avez reçu l'argent sur votre compte bancaire")
        else
           -- ADD L ARGENT AU JOUEUR QUAND IL EST PAS CO
            MySQL.Async.execute("INSERT INTO vente_leboncoin (UniqueID, price) VALUES (@UniqueID, @price)", {
                ["@UniqueID"] = UniqueID,
                ["@price"] = tonumber(LeBonCoin[UniqueID][id].price*0.95)
            })
        end
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_leboncoin', function(account)
            account.addMoney(LeBonCoin[UniqueID][id].price*5/100)
        end)
        MySQL.Async.execute("INSERT INTO owned_vehicles (owner, plate, vehicle, type, state) VALUES (@owner, @plate, @vehicle, @type, @state)", {
            ["@owner"] = xPlayer.UniqueID, 
            ["@plate"] = LeBonCoin[UniqueID][id].plate,
            ["@vehicle"] = json.encode(LeBonCoin[UniqueID][id].props),
            ["@type"] =  LeBonCoin[UniqueID][id].type ,
            ["@state"] = tonumber(1)
        })

        for k, v in pairs(LeBonCoinAll) do 
            if v.id == id then 
                table.remove(LeBonCoinAll, k)
            end
        end
        MySQL.Async.execute("DELETE FROM player_leboncoin WHERE id = @id", {
            ["@id"] = id
        })
        LbcLogs(1752220, "Achat d'un véhicule le bon coin", "Le joueur \nNom Steam: **"..xPlayer.getName()..'**\nID:**'..xPlayer.source.."** \nId unique : **"..xPlayer.UniqueID..'** à acheté de le véhicule de:\n**'..UniqueID.."\n**Prix: **"..LeBonCoin[UniqueID][id].price..'**\nId Unique de l\'annonce: **'..id.."**\nPlaque: **"..LeBonCoin[UniqueID][id].plate.."**")
        LeBonCoin[UniqueID][id] = nil
        xPlayer.showNotification(kayscoreConfigServ.GTACOLOR.."Slide~w~Vous venez d'acheté le véhicule !")
    end
end)

--Event lorsque le joueur récupère son argent
secured_RegisterNetEvent("kayscoreLpb:recupmoneyvente")
secured_AddEventHandler("kayscoreLpb:recupmoneyvente", function(id, UniqueID, price)
    local xPlayer = ESX.GetPlayerFromId(source)
    local verif = InfosVente[xPlayer.UniqueID][id].UniqueID == UniqueID and true or false 

    if verif then 
        if InfosVente[xPlayer.UniqueID][id].price == price then 
            xPlayer.addAccountMoney('bank', tonumber(InfosVente[xPlayer.UniqueID][id].price))
            xPlayer.showNotification(kayscoreConfigServ.GTACOLOR.."Slide~w~Vous avez encaisser une somme de ~r~"..price.."")
            InfosVente[xPlayer.UniqueID][id] = nil 
            TriggerClientEvent("kayscoreLpb:recieveventeplayer", source, InfosVente[xPlayer.UniqueID])
            MySQL.Async.execute("DELETE FROM vente_leboncoin WHERE id = @id", {
                ["@id"] = id 
            })
            pirnt("okokokokok")
        else
    
        end
    else

    end
end)

-- Mise un bucket du joueur 
secured_RegisterNetEvent("kayscoreLpb:bucketlbcplayer")
secured_AddEventHandler("kayscoreLpb:bucketlbcplayer", function(active)
    if #(GetEntityCoords(GetPlayerPed(source)) - vector3(228.85, -751.67, 30.82)) < 50 then 
        if active then 
            SetPlayerRoutingBucket(source, source)
        else
            SetPlayerRoutingBucket(source, 0)
        end
    else
    end 
end)
secured_RegisterNetEvent('kayscore:getInformations',function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if LeBonCoin[xPlayer.UniqueID] then
        TriggerClientEvent('kayscoreLpblegrosfdp:sendLBCInfo', source, LeBonCoin[xPlayer.UniqueID], LeBonCoinAll)
    else
        TriggerClientEvent('kayscoreLpblegrosfdp:sendLBCInfo', source, nil, LeBonCoinAll)
    end
end)