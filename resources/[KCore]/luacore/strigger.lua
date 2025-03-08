
function genTrigger(str)
    return (str:gsub('.', function (c)
        return string.format('!kayscorelemeilleurdevsah-%02X-', string.byte(c))
    end))
end

local mainEvents = {
    'playerEnteredScope',
    'playerLeftScope',
    'entityRemoved',
    'entityCreating',
    'entityCreated',
    'ptfxEvent',
    'clearPedTasksEvent',
    'giveWeaponEvent',
    'removeWeaponEvent',
    'ptFxEvent',
    'explosionEvent',
    'startProjectileEvent',
    'startprojectileevent',
    'onServerResourceStop',
    'onResourceListRefresh',
    'onResourceStart',
    'onServerResourceStart',
    'onResourceStarting',
    'onResourceStop',
    'playerConnecting',
    'playerDropped',
    'rconCommand',
    '__cfx_internal:commandFallback',
    'commandLoggerDiscord:commandWasExecuted',
    'playerJoining'
}

if IsDuplicityVersion() then

    local CachedTriggersSV = {}

    function secured_TriggerEvent(trigger, ...)
        local customTrigger = true
        local args = {...}
        if string.find(trigger, "txsv") and string.find(trigger, "txAdmin") and string.find(trigger, "cfx") and string.find(trigger, "cs-") then
            customTrigger = false
        end

        for trig in pairs(mainEvents) do
            if(string.gsub(string.gsub(string.gsub(string.gsub(trigger:lower(), "-", ""), ",", ""), "%.", ""), " ", ""):find(mainEvents[trig])) then
                customTrigger = false
                break
            end
        end

        if customTrigger == true then
            local __trigger = trigger
            if CachedTriggersSV[trigger] then
                __trigger = CachedTriggersSV[trigger]
            end
            if __trigger == trigger then
                __trigger = genTrigger(trigger)
                CachedTriggersSV[trigger] = __trigger
            end
            TriggerEvent(__trigger, table.unpack(args))
        else
            TriggerEvent(trigger, table.unpack(args))
        end
    end

    function secured_TriggerClientEvent(trigger, ...)
        local customTrigger = true
        local args = {...}
        if string.find(trigger, "txsv") and string.find(trigger, "txAdmin") and string.find(trigger, "cfx") and string.find(trigger, "cs-") then
            customTrigger = false
        end

        if customTrigger == true then
            for trig in pairs(mainEvents) do
                if(string.gsub(string.gsub(string.gsub(string.gsub(trigger:lower(), "-", ""), ",", ""), "%.", ""), " ", ""):find(mainEvents[trig])) then
                    customTrigger = false
                    break
                end
            end
        end

        if customTrigger == true then
            local __trigger = trigger
            if CachedTriggersSV[trigger] then
                __trigger = CachedTriggersSV[trigger]
            end
            if __trigger == trigger then
                __trigger = genTrigger(trigger)
                CachedTriggersSV[trigger] = __trigger
            end
            TriggerClientEvent(__trigger, table.unpack(args))
        else
            TriggerClientEvent(trigger, table.unpack(args))
        end
    end

    function secured_RegisterServerEvent(trigger, ...)
        local customTrigger = true
        local triggered = false
        local args = ...
        if string.find(trigger, "txsv") and string.find(trigger, "txAdmin") and string.find(trigger, "cfx") and string.find(trigger, "cs-") then
            customTrigger = false
        end

        if customTrigger == true then
            for trig in pairs(mainEvents) do
                if(string.gsub(string.gsub(string.gsub(string.gsub(trigger:lower(), "-", ""), ",", ""), "%.", ""), " ", ""):find(mainEvents[trig])) then
                    customTrigger = false
                    break
                end
            end
        end
        if customTrigger == true then
            local __trigger = trigger
            if CachedTriggersSV[trigger] then
                __trigger = CachedTriggersSV[trigger]
            end
            if __trigger == trigger then
                __trigger = genTrigger(trigger)
                CachedTriggersSV[trigger] = __trigger
            end
            if not args or type(args) ~= 'function' then
                RegisterServerEvent(__trigger, args)
                RegisterServerEvent(trigger, function(...)
                    
                end)
                triggered = true
            end
            if triggered == false then
                RegisterServerEvent(trigger, function(...)
                    local _src = source
                    local xPlayer = ESX.GetPlayerFromId(_src)
                    local isplayer = true
                    if type(_src) ~= 'number' then
                        isplayer = false
                    end
                    if isplayer == true then
                        if _src < 0 or GetPlayerPed(_src) < 0 then
                            isplayer = false
                        end
                    end
                    if isplayer == true then
                        local playerID = xPlayer.UniqueID 
                        local duration = 0 
                        local reason = 'Pas bien de voulour utiliser les Triggers :)' 
                        TriggerEvent('custom:banPlayer', args)
                        exports.kayscore:banPlayer({playerID, duration, reason})

                        exports['kayscore']:sendLog(('Le Player (%s - %s) viens de se faire ban pour avoir utiliser un trigger :)'):format(xPlayer.name, xPlayer.UniqueID), {
                            author = 'kayscore développements',
                            fields = {
                                {title = 'Player', subtitle = xPlayer.name},
                                {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                                {title = 'Identifier', subtitle = xPlayer.identifier},
                                {title = 'Trigger', subtitle = trigger},
                            },
                            channel = 'bantrigger'
                        })
                        CancelEvent()
                    end
                end)
                RegisterServerEvent(__trigger, args)
            end
        else
            RegisterServerEvent(trigger, args)
        end
    end
    
    function secured_RegisterNetEvent(trigger, ...)
        local customTrigger = true
        local triggered = false
        local args = ...
        if string.find(trigger, "txsv") and string.find(trigger, "txAdmin") and string.find(trigger, "cfx") and string.find(trigger, "cs-") then
            customTrigger = false
        end

        if customTrigger == true then
            for trig in pairs(mainEvents) do
                if(string.gsub(string.gsub(string.gsub(string.gsub(trigger:lower(), "-", ""), ",", ""), "%.", ""), " ", ""):find(mainEvents[trig])) then
                    customTrigger = false
                    break
                end
            end
        end
        if customTrigger == true then
            local __trigger = trigger
            if CachedTriggersSV[trigger] then
                __trigger = CachedTriggersSV[trigger]
            end
            if __trigger == trigger then
                __trigger = genTrigger(trigger)
                CachedTriggersSV[trigger] = __trigger
            end
            if not args or type(args) ~= 'function' then
                RegisterNetEvent(__trigger, args)
                RegisterNetEvent(trigger, function(...)
                    
                end)
                triggered = true
            end
            if triggered == false then
                RegisterNetEvent(trigger, function(...)
                    local _src = source
                    local xPlayer = ESX.GetPlayerFromId(_src)

                    local isplayer = true
                    if type(_src) ~= 'number' then
                        isplayer = false
                    end
                    if isplayer == true then
                        if _src < 0 or GetPlayerPed(_src) < 0 then
                            isplayer = false
                        end
                    end
                    if isplayer == true then
                        local args = {xPlayer.UniqueID, 0, 'Pas bien de voulour utiliser les Triggers :)'} 
                        TriggerEvent('custom:banPlayer', args)
                        exports['kayscore']:sendLog(('Le Player (%s - %s) viens de se faire ban pour avoir utiliser un trigger :)'):format(xPlayer.name, xPlayer.UniqueID), {
                            author = 'kayscore Meilleur Dev Sah',
                            fields = {
                                {title = 'Player', subtitle = xPlayer.name},
                                {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                                {title = 'Identifier', subtitle = xPlayer.identifier},
                                {title = 'Trigger', subtitle = trigger},
                            },
                            channel = 'bantrigger'
                        })
                        CancelEvent()
                    end
                end)
                RegisterNetEvent(__trigger, args)
            end
        else
            RegisterNetEvent(trigger, args)
        end
    end

    function secured_AddEventHandler(trigger, ...)
        local customTrigger = true
        local args = ...
        if string.find(trigger, "txsv") and string.find(trigger, "txAdmin") and string.find(trigger, "cfx") and string.find(trigger, "cs-") then
            customTrigger = false
        end

        if customTrigger == true then
            for trig in pairs(mainEvents) do
                if(string.gsub(string.gsub(string.gsub(string.gsub(trigger:lower(), "-", ""), ",", ""), "%.", ""), " ", ""):find(mainEvents[trig])) then
                    customTrigger = false
                    break
                end
            end
        end
        
        if customTrigger == true then
            local __trigger = trigger
            if CachedTriggersSV[trigger] then
                __trigger = CachedTriggersSV[trigger]
            end
            if __trigger == trigger then
                __trigger = genTrigger(trigger)
                CachedTriggersSV[trigger] = __trigger
            end
            AddEventHandler(trigger, function(...)
                local _src = source
                local xPlayer = ESX.GetPlayerFromId(_src)

                local isplayer = true
                if type(_src) ~= 'number' then
                    isplayer = false
                end
                if isplayer == true then
                    if _src < 0 or GetPlayerPed(_src) < 0 then
                        isplayer = false
                    end
                end
                if isplayer == true then
                    local aaaaa = {xPlayer.UniqueID, 0, 'Pas bien de voulour utiliser les Triggers :)'} 
                    TriggerEvent('custom:banPlayer', aaaaa)
                    exports['kayscore']:sendLog(('Le Player (%s - %s) viens de se faire ban pour avoir utiliser un trigger :)'):format(xPlayer.name, xPlayer.UniqueID), {
                        author = 'kayscore Meilleur Dev Sah',
                        fields = {
                            {title = 'Player', subtitle = xPlayer.name},
                            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                            {title = 'Identifier', subtitle = xPlayer.identifier},
                            {title = 'Trigger', subtitle = trigger},
                        },
                        channel = 'bantrigger'
                    })
                    CancelEvent()
                end
            end)
            AddEventHandler(__trigger, args)
        else
            AddEventHandler(trigger, args)
        end
    end
    
else
    
    local CachedTriggersCL = {}

    function secured_TriggerServerEvent(trigger, ...)
        local customTrigger = true
        local args = {...}
        if string.find(trigger, "txsv") and string.find(trigger, "txAdmin") and string.find(trigger, "cfx") and string.find(trigger, "cs-") then
            customTrigger = false
        end

        if customTrigger == true then
            for trig in pairs(mainEvents) do
                if(string.gsub(string.gsub(string.gsub(string.gsub(trigger:lower(), "-", ""), ",", ""), "%.", ""), " ", ""):find(mainEvents[trig])) then
                    customTrigger = false
                    break
                end
            end
        end

        if customTrigger == true then
            local __trigger = trigger
            if CachedTriggersCL[trigger] then
                __trigger = CachedTriggersCL[trigger]
            end
            if __trigger == trigger then
                __trigger = genTrigger(trigger)
                CachedTriggersCL[trigger] = __trigger
            end
            TriggerServerEvent(__trigger, table.unpack(args))
        else
            TriggerServerEvent(trigger, table.unpack(args))
        end
    end

    function secured_TriggerEvent(trigger, ...)
        local customTrigger = true
        local args = {...}
        if string.find(trigger, "txsv") and string.find(trigger, "txAdmin") and string.find(trigger, "cfx") and string.find(trigger, "cs-") then
            customTrigger = false
        end

        for trig in pairs(mainEvents) do
            if(string.gsub(string.gsub(string.gsub(string.gsub(trigger:lower(), "-", ""), ",", ""), "%.", ""), " ", ""):find(mainEvents[trig])) then
                customTrigger = false
                break
            end
        end

        if customTrigger == true then
            local __trigger = trigger
            if CachedTriggersCL[trigger] then
                __trigger = CachedTriggersCL[trigger]
            end
            if __trigger == trigger then
                __trigger = genTrigger(trigger)
                CachedTriggersCL[trigger] = __trigger
            end
            TriggerEvent(__trigger, table.unpack(args))
        else
            TriggerEvent(trigger, table.unpack(args))
        end
    end

    function secured_RegisterNetEvent(trigger, ...)
        local customTrigger = true
        local triggered = false
        local args = ...
        if string.find(trigger, "txsv") and string.find(trigger, "txAdmin") and string.find(trigger, "cfx") and string.find(trigger, "cs-") then
            customTrigger = false
        end

        if customTrigger == true then
            for trig in pairs(mainEvents) do
                if(string.gsub(string.gsub(string.gsub(string.gsub(trigger:lower(), "-", ""), ",", ""), "%.", ""), " ", ""):find(mainEvents[trig])) then
                    customTrigger = false
                    break
                end
            end
        end

        if customTrigger == true then
            local __trigger = trigger
            if CachedTriggersCL[trigger] then
                __trigger = CachedTriggersCL[trigger]
            end
            if __trigger == trigger then
                __trigger = genTrigger(trigger)
                CachedTriggersCL[trigger] = __trigger
            end
            if not args or type(args) ~= 'function' then
                RegisterNetEvent(__trigger, args)
                triggered = true
            end
            if triggered == false then
                RegisterNetEvent(__trigger, args)
            end
        else
            RegisterNetEvent(trigger, args)
        end
    end

    function secured_AddEventHandler(trigger, ...)
        local customTrigger = true
        local args = ...
        if string.find(trigger, "txsv") and string.find(trigger, "txAdmin") and string.find(trigger, "cfx") and string.find(trigger, "cs-") then
            customTrigger = false
        end

        if customTrigger == true then
            for trig in pairs(mainEvents) do
                if(string.gsub(string.gsub(string.gsub(string.gsub(trigger:lower(), "-", ""), ",", ""), "%.", ""), " ", ""):find(mainEvents[trig])) then
                    customTrigger = false
                    break
                end
            end
        end

        if customTrigger == true then
            local __trigger = trigger
            if CachedTriggersCL[trigger] then
                __trigger = CachedTriggersCL[trigger]
            end
            if __trigger == trigger then
                __trigger = genTrigger(trigger)
                CachedTriggersCL[trigger] = __trigger
            end
            AddEventHandler(__trigger, args)
        else
            AddEventHandler(trigger, args)
        end
    end
end