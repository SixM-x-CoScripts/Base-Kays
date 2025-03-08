local callbacks = nil

exports('displayPrompt', function(title, message, displayAsColumn, buttons)
    assert(type(title) == 'string' or title == nil, 'invalid title type')
    assert(type(message) == 'string' or message == nil, 'invalid message type')
    assert(type(displayAsColumn) == 'boolean' or displayAsColumn == nil, 'invalid displayAsColumn type ' .. type(displayAsColumn) .. ' / ' .. tostring(displayAsColumn))
    assert(type(buttons) == 'table', 'invalid buttons type')

    AddNuiFocus('prompt')
    AddNuiFocusKeepInput('prompt')

    local nuiButtons = {}
    callbacks = {}

    for index, data in pairs(buttons) do
        callbacks[index] = data.cb
        nuiButtons[index] = {
            text = data.text,
            style = data.style,
        }
    end

    CreateThread(function()
        while callbacks do
            -- Désactiver les contrôles clés pour éviter le mouvement du personnage
            DisableControlAction(0, 1, true) -- X axis (turn left/right)
            DisableControlAction(0, 2, true) -- Y axis (look up/down)
            DisableControlAction(0, 3, true) -- X axis (turn left/right) on foot
            DisableControlAction(0, 4, true) -- Y axis (turn up/down) on foot
            DisableControlAction(0, 5, true) -- Mouse scroll down (switch weapon)
            DisableControlAction(0, 6, true) -- Mouse scroll up (switch weapon)
            DisableControlAction(0, 16, true) -- Mouse wheel down (switch radio station)
            DisableControlAction(0, 17, true) -- Mouse wheel up (switch radio station)
            DisableControlAction(0, 24, true) -- Attack
            DisableControlAction(0, 25, true) -- Aim
            DisableControlAction(0, 30, true) -- Move up (W)
            DisableControlAction(0, 31, true) -- Move down (S)
            DisableControlAction(0, 32, true) -- Move left (A)
            DisableControlAction(0, 33, true) -- Move right (D)
            DisableControlAction(0, 34, true) -- Move left (A) in vehicle
            DisableControlAction(0, 35, true) -- Move right (D) in vehicle
            DisableControlAction(0, 44, true) -- Enter vehicle (F)
            DisableControlAction(0, 47, true) -- Special ability (G)
            DisableControlAction(0, 56, true) -- F9 (interaction menu)

            Wait(0)
        end
    end)

    SendReactMessage('setPrompt', {
        title = title,
        description = message,
        displayAsColumn = displayAsColumn or false,
        buttons = nuiButtons,
    })
end)

exports('displayRequest', function(title, message, onAccept, onDecline)
    assert(type(onAccept) == 'table' or onAccept == nil, 'invalid onAccept type ' .. type(onAccept) .. ' / ' .. tostring(onAccept))
    assert(type(onDecline) == 'table' or onDecline == nil, 'invalid _onDecline type ' .. type(onDecline) .. ' / ' .. tostring(onDecline))

    exports[GetCurrentResourceName()]:displayPrompt(title, message, false, {
        {
            text = "Refuser",
            style = { color = "red", active = true, icon = "cancel" },
            cb = onDecline,
        },
        {
            text = "Accepter",
            style = { color = "green", active = true, icon = "confirm" },
            cb = onAccept,
        }
    })
end)

exports('displayRequestttt', function(title, message, onAccept, onDecline)
    assert(type(onAccept) == 'table' or onAccept == nil, 'invalid onAccept type ' .. type(onAccept) .. ' / ' .. tostring(onAccept))
    assert(type(onDecline) == 'table' or onDecline == nil, 'invalid _onDecline type ' .. type(onDecline) .. ' / ' .. tostring(onDecline))

    exports[GetCurrentResourceName()]:displayPrompt(title, message, false, {
        {
            text = "Non",
            style = { color = "red", active = true, icon = "cancel" },
            cb = onDecline,
        },
        {
            text = "Oui",
            style = { color = "green", active = true, icon = "confirm" },
            cb = onAccept,
        }
    })
end)

exports('tesstaffoupasmgl', function(title, message, onAccept, onDecline, mgltacrutctpasmoibdv)
    assert(type(onAccept) == 'table' or onAccept == nil, 'invalid onAccept type ' .. type(onAccept) .. ' / ' .. tostring(onAccept))
    assert(type(onDecline) == 'table' or onDecline == nil, 'invalid _onDecline type ' .. type(onDecline) .. ' / ' .. tostring(onDecline))
    assert(type(mgltacrutctpasmoibdv) == 'table' or mgltacrutctpasmoibdv == nil, 'invalid onAccept type' .. type(mgltacrutctpasmoibdv) .. ' / ' .. tostring(mgltacrutctpasmoibdv))

    exports[GetCurrentResourceName()]:displayPrompt(title, message, false, {
        {
            text = "Non",
            style = { color = "red", active = true, icon = "cancel" },
            cb = onDecline,
        },
        {
            text = "Oui",
            style = { color = "green", active = true, icon = "confirm" },
            cb = onAccept,
        },
        {
            text = "Ne pas payer (STAFF)",
            style = { color = "black", active = true, icon = "confirm" },
            cb = mgltacrutctpasmoibdv,
        }
    })
end)

exports('closeRequest', function()
    RemoveNuiFocus('prompt')
    RemoveNuiFocusKeepInput('prompt')
    SendReactMessage('setPrompt', nil)
    callbacks = nil
end)

RegisterNUICallback("answer", function(data, cb)
    SendReactMessage('setPrompt', nil)
    RemoveNuiFocus('prompt')
    RemoveNuiFocusKeepInput('prompt')

	--// TODO: data.data is a list of { name, value } corresponding to the components of the prompt
    if callbacks[data.index + 1] then -- +1 because of lua<->js conversion
        callbacks[data.index + 1]()
    end
    callbacks = nil

    cb('ok')
end)