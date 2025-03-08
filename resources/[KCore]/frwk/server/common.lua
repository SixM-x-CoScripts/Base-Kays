ESX = {}
ESX.DB = {}
ESX.Players = {}
ESX.Commands = {}
ESX.CommandsSuggestions = {}
ESX.Groups = {}
ESX.GroupsRankRelative = {}
ESX.Jobs = {}
ESX.UniqueID = {}
ESX.Items = {}
ESX.UsableItemsCallbacks = {}
ESX.ServerCallbacks = {}
ESX.TimeoutCount = -1
ESX.CancelledTimeouts = {}
ESX.Pickups = {}
ESX.PickupId = 0
ESX.NOTREMOVEWEAPONS = {
	["WEAPON_COACHGUN"] = true,
	["WEAPON_SHOTGUNK"] = true,
	["WEAPON_VSCO"] = true,
	["WEAPON_BLUERIOT"] = true,
	["WEAPON_BLACKSNIPER"] = true,
	["WEAPON_ANCIENT"] = true,
	["WEAPON_SIG550"] = true,
	["WEAPON_MILITARM4"] = true,
	["WEAPON_BLASTM4"] = true,
	["WEAPON_BLASTAK"] = true,
	["WEAPON_REVOLVERULTRA"] = true,
	["WEAPON_GOLDM"] = true,
	["WEAPON_PREDATOR"] = true,
	["WEAPON_AKORUS"] = true,
	["WEAPON_REDL"] = true,
	["WEAPON_MIDASGUN"] = true,
	["WEAPON_SNAKE"] = true,
	["WEAPON_HELL"] = true,
	["WEAPON_OBLIVION"] = true,
	["WEAPON_TEC9MF"] = true,
	["WEAPON_TEC9MB"] = true,
	["WEAPON_SCARSC"] = true,
	["WEAPON_ALIEN"] = true,
	["WEAPON_MIDGARD"] = true,
	["WEAPON_SPECIALHAMMER"] = true,
	["WEAPON_PENIS"] = true,
	["WEAPON_MAZE"] = true,
	["WEAPON_GUARD"] = true,
	["WEAPON_GRAU"] = true,
	["WEAPON_SCAR17"] = true,
	["WEAPON_M19"] = true,
	["WEAPON_UZILS"] = true,
	["WEAPON_DESERTNIKE"] = true,
	["WEAPON_M4GOLDBEAST"] = true,
	["WEAPON_M4BEAST"] = true,
	["WEAPON_GLOCKDM"] = true,
	["WEAPON_357"] = true,
	["WEAPON_HELLSNIPER"] = true,
	["WEAPON_AKBONE"] = true,
	["WEAPON_SCOM"] = true,
	["WEAPON_AA"] = true,
	["WEAPON_680M"] = true,
	["WEAPON_GUTSLING"] = true,
	["WEAPON_SNAKEU"] = true,
	["WEAPON_SNAKEPER"] = true,
	["WEAPON_SNAKENADE"] = true,
	["WEAPON_ASSAULTRIFLELS"] = true,
	["WEAPON_WOLFKNIFE"] = true,
	["WEAPON_WOLFVERN"] = true,
	["WEAPON_SNIWOLF"] = true,
	["WEAPON_SMG_MK2"] = true,
	["WEAPON_SCARWHITE"] = true,
	["WEAPON_SOVEREIGN"] = true,
	["WEAPON_DIABLO"] = true,
	["WEAPON_SPONGEBOB"] = true,

	["WEAPON_SCARH"] = true,
	["WEAPON_COMPACTAK"] = true,
	["WEAPON_CANDYAXE"] = true,
	["WEAPON_CANDYAXE"] = true,
	["WEAPON_RAINBOWSMASH"] = true,
	["WEAPON_HELLOKITTY"] = true,
	["WEAPON_PATTERN"] = true,
	["WEAPON_SlidePISTOL"] = true,
	["WEAPON_SPONGEPISTOL"] = true,
	["WEAPON_GUSPURPLE"] = true,
	["WEAPON_RGXOPERATOR"] = true,
	["WEAPON_FORTSHOTGUN"] = true,
	["WEAPON_417"] = true,
}

AddEventHandler('esx:getSharedObject', function(cb)
	cb(ESX)
end)

function getSharedObject()
	return ESX
end

MySQL.ready(function()
	TriggerEvent('esx:getAllJobs')
end)

RegisterNetEvent('esx:getAllJobs', function()
	MySQL.Async.fetchAll('SELECT * FROM items', {}, function(result)
		for i = 1, #result, 1 do
			ESX.Items[result[i].name] = {
				label = result[i].label,
				weight = result[i].weight,
				canRemove = toboolean(result[i].can_remove),
				unique = toboolean(result[i].unique)
			}
		end
	end)

	MySQL.Async.fetchAll('SELECT * FROM jobs', {}, function(result)
		for i = 1, #result do
			ESX.Jobs[result[i].name] = result[i]
			ESX.Jobs[result[i].name].grades = {}
		end
	
		MySQL.Async.fetchAll('SELECT * FROM job_grades', {}, function(result2)
			for i = 1, #result2 do
				if ESX.Jobs[result2[i].job_name] then
					ESX.Jobs[result2[i].job_name].grades[tostring(result2[i].grade)] = result2[i]
				end
			end
		
			for k, v in pairs(ESX.Jobs) do
				if ESX.Table.SizeOf(v.grades) == 0 then
					ESX.Jobs[v.name] = nil
				end
			end
		end)
	end)
end)

RegisterServerEvent('esx:triggerServerCallback')
AddEventHandler('esx:triggerServerCallback', function(name, requestId, ...)
	local _source = source
	ESX.TriggerServerCallback(name, requestId, _source, function(...)
		TriggerClientEvent('esx:serverCallback', _source, requestId, ...)
	end, ...)
end)
 