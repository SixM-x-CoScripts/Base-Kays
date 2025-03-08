_LIVRAISONS = {
    inLivraisons = false,

    myLivraisons = {},
    levels = {},
    gains = {},
    totalLivraisons = {},
    vehicle = {}
}

function _LIVRAISONS.updateLevel(player)
    MySQL.Async.execute('UPDATE livraisons SET levels = @levels, gains = @gains, livraisons = @livraisons, vehicle = @vehicle WHERE uniqueid = @uniqueid', {
        ['@uniqueid'] = player.UniqueID,
        ['@levels'] = _LIVRAISONS.levels[player.UniqueID],
        ['@gains'] = _LIVRAISONS.gains[player.UniqueID],
        ['@livraisons'] = _LIVRAISONS.totalLivraisons[player.UniqueID],
        ['@vehicle'] = json.encode(_LIVRAISONS.vehicle[player.UniqueID])
    })
end

function _LIVRAISONS.init(player)
    MySQL.Async.fetchAll('SELECT * FROM livraisons WHERE uniqueid = @uniqueid', {
        ['@uniqueid'] = player.UniqueID,
    }, function(result)
        if result[1] == nil then
            MySQL.Async.execute('INSERT INTO livraisons (uniqueid, levels, gains, livraisons, vehicle) VALUES (@uniqueid, @levels, @gains, @livraisons, @vehicle)', {
                ['@uniqueid'] = player.UniqueID,
                ['@levels'] = 0,
                ['@gains'] = 100,
                ['@livraisons'] = 0,
                ['@vehicle'] = json.encode({'boxville'})
            }, function()
                _LIVRAISONS.inLivraisons = true
                _LIVRAISONS.levels[player.UniqueID] = 0
                _LIVRAISONS.gains[player.UniqueID] = 100
                _LIVRAISONS.totalLivraisons[player.UniqueID] = 0
                _LIVRAISONS.vehicle[player.UniqueID] = {'boxville'}
            end)
        else
            _LIVRAISONS.inLivraisons = true
            _LIVRAISONS.levels[player.UniqueID] = result[1].levels
            _LIVRAISONS.gains[player.UniqueID] = result[1].gains
            _LIVRAISONS.totalLivraisons[player.UniqueID] = result[1].livraisons
            _LIVRAISONS.vehicle[player.UniqueID] = json.decode(result[1].vehicle)
        end

        _LIVRAISONS = _LIVRAISONS
    end)

    Wait(100)
    return _LIVRAISONS
end

function _LIVRAISONS.GetNewLevel(level, UniqueID)
    if level < 200 then _LIVRAISONS.vehicle[UniqueID] = {'boxville'} elseif level < 400 then _LIVRAISONS.vehicle[UniqueID] = {'mule'} end

    return _LIVRAISONS
end

ESX.RegisterServerCallback('kayscore:livraisons:getLivraisons', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)

    local livraisons = _LIVRAISONS.init(xPlayer)

    cb(livraisons)
end)

secured_RegisterNetEvent('kayscore:livraisons:startFoodUber', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    local livraisons = _LIVRAISONS.init(xPlayer)

    secured_TriggerClientEvent('kayscore:livraisons:startFoodUber', source, _LIVRAISONS.levels[xPlayer.UniqueID], _LIVRAISONS.gains[xPlayer.UniqueID], _LIVRAISONS.totalLivraisons[xPlayer.UniqueID], _LIVRAISONS.vehicle[xPlayer.UniqueID])

    TriggerClientEvent('kayscore:livraisons:setDestination', source, 'start')
end)

secured_RegisterNetEvent('kayscore:livraisons:dest', function()
    local source = source

    TriggerClientEvent('kayscore:livraisons:setDestination', source)
end)

secured_RegisterNetEvent('kayscore:livraisons:setNewLiv', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    local newlevel = math.random(10, 10)

    _LIVRAISONS.levels[xPlayer.UniqueID] += newlevel
    _LIVRAISONS.gains[xPlayer.UniqueID] = kayscoreConfigServ.Activity.Livraisons.Levels[_LIVRAISONS.levels[xPlayer.UniqueID]] or _LIVRAISONS.gains[xPlayer.UniqueID]
    _LIVRAISONS.totalLivraisons[xPlayer.UniqueID] += 1
    _LIVRAISONS.vehicle[xPlayer.UniqueID] = _LIVRAISONS.GetNewLevel(_LIVRAISONS.levels[xPlayer.UniqueID], xPlayer.UniqueID).vehicle[xPlayer.UniqueID]
    _LIVRAISONS.vehicle[xPlayer.UniqueID] = kayscoreConfigServ.Activity.Livraisons.Vehicle[_LIVRAISONS.levels[xPlayer.UniqueID]] or _LIVRAISONS.vehicle[xPlayer.UniqueID]
    if kayscoreConfigServ.Activity.Livraisons.Vehicle[_LIVRAISONS.levels[xPlayer.UniqueID]] ~= nil then
        TriggerClientEvent('esx:showNotification', source, '🚚 Une nouveau véhicule de service t\'as été fournie, retourne à l\'entrepôt pour le récupérer.')
        TriggerClientEvent('kayscore:livraisons:newVehicle', source)
    end

    TriggerClientEvent('kayscore:livraisons:update', source, _LIVRAISONS.levels[xPlayer.UniqueID], _LIVRAISONS.gains[xPlayer.UniqueID], _LIVRAISONS.totalLivraisons[xPlayer.UniqueID], _LIVRAISONS.vehicle[xPlayer.UniqueID])

        xPlayer.addAccountMoney('cash', _LIVRAISONS.gains[xPlayer.UniqueID])
    SetTimeout(2000, function()
        if _LIVRAISONS.levels[xPlayer.UniqueID] >= 500 then
            xPlayer.addAccountMoney('cash', 2000)
            TriggerClientEvent('esx:showNotification', source, '🥇 Félicitations, vous avez atteint le niveau d\'expèrience 500/500 une prime de ~y~2 000$~s~ vous a été déversé et votre niveau d\'expèrience a été réinitialisé !')
            _LIVRAISONS.levels[xPlayer.UniqueID] = 0

            _LIVRAISONS.updateLevel(xPlayer)
        end
    end)
    _LIVRAISONS.updateLevel(xPlayer)
    sendLog(('Le Player (%s - %s) a Gagné (%s- %s) XP'):format(xPlayer.name, xPlayer.UniqueID, _LIVRAISONS.levels, newlevel), {
        author = 'Vente Livraison',
        fields = {
            {title = 'Player', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = "Gain", subtitle = _LIVRAISONS.gains[xPlayer.UniqueID]},
        },
        channel = 'actLivrette'
    })
end)