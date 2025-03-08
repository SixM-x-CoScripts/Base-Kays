local nombredecalls = {}
local IsEventLoaded = false

CreateThread(function()
    while true do
        Wait(7200000)
        startEvent()
    end
end)

function startEvent()
    local autoEvent_DATA = EventConfig.FourgonPosEvent.Position[math.random(1, #EventConfig.FourgonPosEvent.Position)]
    local data = {
        position = autoEvent_DATA.pos,
        reward = autoEvent_DATA.reward
    }
    TriggerClientEvent('esx:showNotification', -1, '🚚 Un fourgon blindé vient de tomber en panne ! Viens vite le casser et récupérer l\'argent avant que la police le sécurise')
    secured_TriggerClientEvent('kayscore:autoEvent:start', -1, data)
    IsEventLoaded = true
end

RegisterCommand('event2', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "fondateur" or xPlayer.getGroup() == "responsable" or xPlayer.getGroup() == "gerant" then
        Wait(2000)
        ESX.toConsole("L'^2Administrateur ^7(" .. GetPlayerName(source) .. ") vient de ^2démarrer^7 l'event /\\")
        startEvent()
    else
        xPlayer.showNotification("~r~Vous n'avez pas les permissions de faire ceci")
    end
end)

secured_RegisterNetEvent('kayscore:autoEvent:broke', function(data)
    if not IsEventLoaded then return end
    TriggerClientEvent('esx:showNotification', -1, '🚚 Fourgon Blindé\nLe véhicule vient d\'être détruit !')
    secured_TriggerClientEvent('kayscore:autoEvent:broke', -1, data)
end)

secured_RegisterNetEvent('kayscore:autoEvent:secondBroke', function(data)
    local source = source
    if not IsEventLoaded then return end
    secured_TriggerClientEvent('kayscore:autoEvent:secondBroke', source, data)
end)

secured_RegisterNetEvent('kayscore:autoEvent:take', function(obj, k, money)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not money then
        -- print(('Erreur: money est nil pour le joueur %s'):format(source))
        return
    end

    local periodtemp = 13
    local maxcall = 4
    local currentTime = os.time()

    if nombredecalls[source] == nil then
        nombredecalls[source] = {}
    end

    for i = #nombredecalls[source], 1, -1 do
        if currentTime - nombredecalls[source][i] > periodtemp then
            table.remove(nombredecalls[source], i)
        end
    end

    table.insert(nombredecalls[source], currentTime)

    -- Commenter les parties suivantes si elles causent des problèmes
    -- if #nombredecalls[source] > maxcall then
    --     if EventConfig.FourgonPosEvent.Sanction == "kick" then
    --         DropPlayer(source, "Anti Give Money Event Exploit (1)")
    --     else 
    --         ESX.BanPlayer('Anti Give Money Event Exploit (1)')
    --     end
    --     return
    -- end

    -- if tonumber(money) ~= EventConfig.FourgonPosEvent.money then
    --     if EventConfig.FourgonPosEvent.Sanction == "kick" then
    --         DropPlayer(source, "Anti Give Money Event Exploit (2)")
    --     else 
    --         ESX.BanPlayer('Anti Give Money Event Exploit (2)')
    --     end
    --     return
    -- end

    xPlayer.addAccountMoney('black_money', money)
    TriggerClientEvent('esx:showNotification', source, ('💲 ~y~+%s$~s~ d\'argent sale'):format(money))
    secured_TriggerClientEvent('kayscore:autoEvent:take', -1, obj, k)
end)


secured_RegisterNetEvent('kayscore:autoEvent:stop', function(position)
    if not IsEventLoaded then return end
    secured_TriggerClientEvent('kayscore:autoEvent:stop', -1, position)
    TriggerClientEvent('esx:showNotification', -1, '🚚 L\'événement ~y~casse de fourgon blindé~s~ vient de se terminer !')
    IsEventLoaded = false
end)
