local hasSpawned = false

local function setMBA(entitySet)
    local interior = GetInteriorAtCoords(-324.22, -1968.49, 20.60)

    if interior ~= 0 then
        local removeSets, newEntitySet = ConfigMBA.Removals.interiors, ConfigMBA.Sets[entitySet]
        local removeSigns, newSign = ConfigMBA.Removals.signs, ConfigMBA.Signs[entitySet]

        for i = 1, #removeSets do
            DeactivateInteriorEntitySet(interior, removeSets[i])
        end

        for i = 1, #removeSigns do
            RemoveIpl(removeSigns[i])
        end

        Wait(100)

        for i = 1, #newEntitySet do
            ActivateInteriorEntitySet(interior, newEntitySet[i])
        end

        if newSign then
            RequestIpl(newSign)
        end

        RefreshInterior(interior)
    end
end

CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/setmba', 'Set the maze bank arena interior.', {{ name = 'interior', help = 'The interior entity set name' }})
end)

AddEventHandler('playerSpawned', function()
    if not hasSpawned then
        setMBA(GlobalState.mba)

        hasSpawned = true
    end
end)

AddStateBagChangeHandler('mba', nil, function(bagName, key, value, _unused, replicated)
    setMBA(value)
end)