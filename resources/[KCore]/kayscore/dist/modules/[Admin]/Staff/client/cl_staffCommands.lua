function ReturnPlayerId(UniqueID)
	for _,p in pairs(adminManagement.Players) do
		if p.UniqueID == tonumber(UniqueID) then
			return p
		end
	end

	return false
end

function adminManagement:StaffCommand(CommandName, permissionData, permissionName, func)
    RegisterCommand(CommandName, function(...)
        if Config.Staff.HavePermission(permissionData, permissionName) then
            func(...)
        end
    end)
end

RegisterCommand('adminMenu', function()
    if not Config.Staff.HavePermission('Menu', 'openMenu') then return end

    adminManagement:staffMenu()
end)

-- RegisterCommand('noclipAdminSlide', function()
--     NoClip()
-- end)

RegisterCommand('annonce', function(_, args)
    if Config.Staff.HavePermission('ServerOptions', 'announce') then
        if table.concat(args, ' ') == nil or table.concat(args, ' ') == '' then return end
        secured_TriggerServerEvent('kayscore:admin:announce', table.concat(args, ' '))
    end
end)

--[[ RegisterCommand('heal', function(_, args)
    if not adminManagement.Service then return end
    local player = ReturnPlayerId(args[1])
    if player then
        TriggerServerEvent('kayscore:admin:command:heal', ReturnPlayerId(args[1]).id)
    else
        TriggerServerEvent('kayscore:admin:command:heal', 0)
    end
end) ]]

RegisterCommand('staffbypass', function()
    if ESX.PlayerData.group == 'fondateur' or ESX.PlayerData.group == 'responsable' then
        secured_TriggerServerEvent('kayscore:admin:service')
        ExecuteCommand("revive")
        ExecuteCommand("Le Papillon sort ses ailes")
    else
        return ESX.ShowNotification('Erreur Ou bien mauvais grade')
    end
end)

RegisterCommand('warn', function(source, args)
    if not adminManagement.Service then return end
    if args[1] == nil then return end
    secured_TriggerServerEvent('kayscore:admin:warn', args[1], table.concat(args, ' ', 2))
end)

RegisterCommand('soundReport', function()
    if not (Config.Staff.HavePermission('Modules', 'reportsSong')) then return end
    adminManagement.SongReports = not adminManagement.SongReports
end)


RegisterKeyMapping('adminMenu', 'Menu Admin', 'keyboard', 'F10')
-- RegisterKeyMapping('noclipAdminSlide', 'Raccourci Noclip', 'keyboard', 'F11')