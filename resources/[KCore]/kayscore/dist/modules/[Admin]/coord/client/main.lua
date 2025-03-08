RegisterCommand(kayscoreConfigServ.DevOptions.CoordsCMD, function(source, args, rawCommand)
	SendNUIMessage({
		type = 'copy',
		coords = ("%s"):format(GetEntityCoords(PlayerPedId()))
	})
end)

RegisterCommand(kayscoreConfigServ.DevOptions.CoordsHCMD, function(source, args, rawCommand)
	SendNUIMessage({
		type = 'copy',
		coords = ("%s"):format(GetEntityHeading(PlayerPedId()))
	})
end)

RegisterCommand(kayscoreConfigServ.DevOptions.CoordsJsonCMD, function(source,args)
	local playerPosition = GetEntityCoords(PlayerPedId())
	SendNUIMessage({
		type = 'copy',
		coords = ('{"x" : %s, "y" : %s, "z" : %s}'):format(playerPosition.x, playerPosition.y, playerPosition.z)
	})
end)

RegisterCommand('copyData', function(source,args)
	SendNUIMessage({
		type = 'copy',
		coords = table.concat(args, " ")
	})
end)

RegisterCommand("openUrl", function(source,args)
	SendNUIMessage({
		type = "openUrl",
		link = tostring(args[1])
	})
end)