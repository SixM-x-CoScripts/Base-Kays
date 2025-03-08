local function estJour()
  local currentHour = tonumber(os.date("%H"))
  return currentHour >= 6 and currentHour < 20
end

local LtdInService = {}

AddEventHandler('esx:playerLoaded', function(source, xPlayer)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local job = xPlayer.getJob().name
    if job == 'ltd_ballas' or job == 'ltd_f4l' or job == 'ltd_paletobay' then
        LtdInService[source] = {inService = false}
        updateLtdInServiceCount()
    end
end)

AddEventHandler('esx:playerDropped', function(playerId)
    if LtdInService[playerId] then
        LtdInService[playerId] = nil
        updateLtdInServiceCount()
    end
end)

RegisterServerEvent('LtdInserviceTacpt')
AddEventHandler('LtdInserviceTacpt', function(inService)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerId = source
    if LtdInService[playerId] then
        LtdInService[playerId].inService = inService
        updateLtdInServiceCount()
    end
end)

function updateLtdInServiceCount()
    local totalLTD = 0
    for _, data in pairs(LtdInService) do
        if data.inService then
            totalLTD = totalLTD + 1
        end
    end
    TriggerClientEvent('updateLTDCount', -1, totalLTD)
end

ESX.RegisterServerCallback('getLTDPlayersCount', function(source, cb)
    local totalLTD = 0
    for _, data in pairs(LtdInService) do
        if data.inService then
            totalLTD = totalLTD + 1
        end
    end
    cb(totalLTD)
end)

RegisterNetEvent("ltd:server:sellBasket")
AddEventHandler("ltd:server:sellBasket", function(items, buyerType, target)
    local player = ESX.GetPlayerFromId(source)
    if target then
        Tplayer = ESX.GetPlayerFromId(target)
    end
    local society = kayscoreLTD.ltdCFG.societies[player.job.name]
    if not society then return end

    local totalCost = 0
    for item, quantity in pairs(items) do
        local itemCost = kayscoreLTD.ltdCFG.catalogs[society.catalogId][item] * quantity
        totalCost = totalCost + itemCost
    end

    if buyerType == 1 then
        local bankMoney = player.getAccount('bank').money
        if totalCost <= bankMoney then
            player.removeAccountMoney('bank', totalCost)
            for item, quantity in pairs(items) do
                if item ~= "totalPrice" then
                    player.addInventoryItem(item, quantity)
                end
            end
            TriggerClientEvent("ltd:client:updateBasket", player.source, {}, false)
        else
            TriggerClientEvent("esx:showNotification", player.source, "Vous n'avez pas assez d'argent")
            return
        end
    else
        TriggerClientEvent("ltd:client:sendBasketRequest", target, totalPrice, true, totalCost, items, target, player.source)
    end
end)


RegisterNetEvent("ltd:server:resetDataLTD")
AddEventHandler("ltd:server:resetDataLTD", function()
    local player = ESX.GetPlayerFromId(source)
    local society = kayscoreLTD.ltdCFG.societies[player.job.name]
    if not society then return end

    if player.job.grade_name == "boss" then
        MySQL.Async.fetchAll("SELECT * FROM player_ltdsales", {}, function(results)
            for _, sale in pairs(results) do
                MySQL.Async.execute("TRUNCATE TABLE player_ltdsales", {
                })
            end
            player.showNotification("Vous avez supprimé toutes les données de ventes avec succès")
        end)
    end
end)
ESX.RegisterServerCallback("ltd:server:requestEmployeesHistory", function(source, cb)
  local player = ESX.GetPlayerFromId(source)
  local salesData = {}

  MySQL.Async.fetchAll("SELECT * FROM player_ltdsales WHERE job = @j", {['@j'] = player.job.name}, function(sales)
      for _, sale in pairs(sales) do
          MySQL.Async.fetchAll("SELECT * FROM users WHERE UniqueID = @c", {['@c'] = sale.uid}, function(users)
              for _, user in pairs(users) do
                  table.insert(salesData, {
                      day = json.decode(sale.day),
                      night = json.decode(sale.night),
                      playerName = user.firstname .. " " .. user.lastname
                  })
              end
              cb(salesData)
          end)
      end
  end)
end)
RegisterNetEvent("ltd:server:sendBasketResponse")
AddEventHandler("ltd:server:sendBasketResponse", function(accepted, totalPrice, paymentMethod, target, items, employe)
    if not accepted then
        TriggerClientEvent("esx:showNotification", employe, "Le joueur a refusé la facture")
        TriggerClientEvent("esx:showNotification", target, "Vous avez refusé la facture")
        return
    else
        TriggerClientEvent("esx:showNotification", employe, "Le joueur a accepté la facture")
    end

    local payer = ESX.GetPlayerFromId(source)
    local receiver = ESX.GetPlayerFromId(employe)
    local society = Society:getSociety(receiver.job.name)
    if payer and receiver then
        local account = payer.getAccount(paymentMethod)
        if account.money >= totalPrice then
            payer.removeAccountMoney(paymentMethod, totalPrice)
            for item, quantity in pairs(items) do
                if item ~= "totalPrice" then
                    payer.addInventoryItem(item, quantity)
                end
            end
            society.addSocietyMoney(totalPrice)
            MySQL.Async.fetchAll("SELECT * FROM player_ltdsales WHERE uid = @u", {['@u'] = receiver.UniqueID}, function(sales)
                if #sales == 0 then
                    if estJour() then
                        MySQL.Async.execute("INSERT INTO player_ltdsales (uid, job, day, night) VALUES (@u, @j, @d, @n)", {
                            ['@u'] = receiver.UniqueID,
                            ['@j'] = receiver.job.name,
                            ['@d'] = json.encode({sales = 1, amount = totalPrice}),
                            ['@n'] = json.encode({sales = 0, amount = 0})
                        })
                    else
                        MySQL.Async.execute("INSERT INTO player_ltdsales (uid, job, day, night) VALUES (@u, @j, @d, @n)", {
                            ['@u'] = receiver.UniqueID,
                            ['@j'] = receiver.job.name,
                            ['@d'] = json.encode({sales = 0, amount = 0}),
                            ['@n'] = json.encode({sales = 1, amount = totalPrice})
                        })
                    end
                    return
                end

                if estJour() then
                    local daySales = json.decode(sales[1].day)
                    daySales.sales = daySales.sales + 1
                    daySales.amount = daySales.amount + totalPrice
                    MySQL.Async.execute("UPDATE player_ltdsales SET day = @d WHERE uid = @u", {
                        ['@u'] = payer.UniqueID,
                        ['@d'] = json.encode(daySales)
                    })
                else
                    local nightSales = json.decode(sales[1].night)
                    nightSales.sales = nightSales.sales + 1
                    nightSales.amount = nightSales.amount + totalPrice
                    MySQL.Async.execute("UPDATE player_ltdsales SET night = @n WHERE uid = @u", {
                        ['@u'] = payer.UniqueID,
                        ['@n'] = json.encode(nightSales)
                    })
                end
            end)
        end
    end
end)