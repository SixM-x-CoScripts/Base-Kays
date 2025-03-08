CreateThread(function()

    while ESX == nil do Wait(1)

    end
    
    ESX.Groups = {}
    ESX.GroupsRankRelative = {}
    ESX.ByPASS_GROUP = {}

    local GroupsRanks = {
        {name = 'fondateur', label = 'Fondateur', bypass = true},
        {name = 'developper', label = 'Dev', bypass = true},
        {name = '_dev', label = 'Fondateur', bypass = true},
        {name = 'gerant', label = 'Gérant'},
        {name = 'responsable', label = 'Résponsable'},
        {name = 'superadmin', label = 'Super Administrateur'},
        {name = 'administrateur', label = 'Administrateur'},
        {name = 'moderateur', label = 'Modérateur'},
        {name = 'helpeur', label = 'Helpeur'},
        {name = 'user', label = 'Joueur'},
    }

    local number = #GroupsRanks

    local function AddGroup(group, i)
        ExecuteCommand('add_principal group.' .. group .. ' group.' .. i)
    end

    for k,v in ipairs(GroupsRanks) do
        ESX.Groups[v.name] = true
        if v.name == 'user' then
            ESX.GroupsRankRelative[v.name] = 0
        else
            ESX.GroupsRankRelative[v.name] = number
        end
        if v.bypass then
            ESX.ByPASS_GROUP[v.name] = true
        end

        number -= 1

        if GroupsRanks[number] then
            AddGroup(v.name, GroupsRanks[number].name)
        else
            AddGroup(v.name, v.name)
        end
    end
end)