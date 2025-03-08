CreateThread(function()
    ESX.AddItem('crochetage_kit', 'Kit de Crochetage', 0, 1, 1.0)
end)

local Braq = {}

ESX.RegisterServerCallback('kayscore:braq:getItems', function(source, cb, id)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then
        cb("player_dont_have_crochetageItem")
        return
    end

    local cops = 0

    local players = {
        LSPD = {},
        bcso = {},
    }

    players.LSPD = ESX.GetExtendedPlayers('job', 'police')
    players.bcso = ESX.GetExtendedPlayers('job', 'bcso')

    for k,v in pairs(players.LSPD) do
        cops = cops + 1
    end

    if cops < 4 then
        TriggerClientEvent('esx:showNotification', source, 'Il n\'y a pas asser de Policier en Ville ! Minimum 4')
        cb(false)
        return
    end

    if Braq[id] then
        if (os.time() - Braq[id]) < 600 and Braq[id] ~= 0 then
            TriggerClientEvent('esx:showNotification', source, 'Cette maison a déjà était braquer, vous pourrez de nouveau la braqué dans ' .. (1800 - (os.time() - Braq[id])) .. ' Secondes')
            cb(false)
            return
        else
            Braq[id] = nil
        end
    end

    if xPlayer.getInventoryItem('crochetage_kit').count < 1 then
        cb("player_dont_have_crochetageItem")
        return
    end

    local chance = {
        [3] = true
    }

    if chance[math.random(1, 5)] then
        TriggerClientEvent('esx:showNotification', source, 'Votre kit de crochetage s\'est brisé, il vous faudrat en racheter un pour de futur braquage !')

        xPlayer.removeInventoryItem("player_dont_have_crochetageItem", 1)
    end

    cb(true)
end)

secured_RegisterNetEvent('kayscore:braq:setBraq', function(id)
    local source = source

    Braq[id] = os.time()

    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end
    
    Wait(15000)

    SetPlayerRoutingBucket(source, xPlayer.UniqueID)
end)

secured_RegisterNetEvent('kayscore:braq:police:alert', function(id)
    local players = {
        LSPD = {},
        bcso = {},
    }

    players.LSPD = ESX.GetExtendedPlayers('job', 'police')
    players.bcso = ESX.GetExtendedPlayers('job', 'bcso')

    for k,v in pairs(players.LSPD) do
        secured_TriggerClientEvent('kayscore:braq:alert', v.source, id)
    end
    for k,v in pairs(players.bcso) do
        secured_TriggerClientEvent('kayscore:braq:alert', v.source, id)
    end
end)

secured_RegisterNetEvent('kayscore:braq:recupObject', function(price)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    xPlayer.addAccountMoney('black_money', price)

    TriggerClientEvent('esx:showNotification', source, ('~r~+%s$~s~'):format(price))
    sendLog(('Le Joueur (%s - %s) viens de récupérer (%s$)'):format(xPlayer.name, xPlayer.UniqueID, price), {
        author = 'Banque',
        fields = {
            {title = 'Player', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
        },
        channel = 'braquage_maison'
    })
end)

secured_RegisterNetEvent('kayscore:braq:finish', function(id)
    local source = source

    SetPlayerRoutingBucket(source, 0)

    local players = {
        LSPD = {},
        bcso = {},
    }

    players.LSPD = ESX.GetExtendedPlayers('job', 'police')
    players.bcso = ESX.GetExtendedPlayers('job', 'bcso')

    for k,v in pairs(players.LSPD) do
        secured_TriggerClientEvent('kayscore:braq:stopalert', v.source, id)
    end
    for k,v in pairs(players.bcso) do
        secured_TriggerClientEvent('kayscore:braq:stopalert', v.source, id)
    end
end)