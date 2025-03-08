-- local FormattedToken = "Bot "..kayscoreConfigServ.BoosterPerks.botToken

-- function DiscordRequest(method, endpoint, jsondata)
--     local data = nil
--     PerformHttpRequest("https://discordapp.com/api/"..endpoint, function(errorCode, resultData, resultHeaders)
-- 		data = {data=resultData, code=errorCode, headers=resultHeaders}
--     end, method, #jsondata > 0 and json.encode(jsondata) or "", {["Content-Type"] = "application/json", ["Authorization"] = FormattedToken})

--     while data == nil do
--         Citizen.Wait(0)
--     end
	
--     return data
-- end

-- function GetRoles(user)
-- 	local discordId = nil
-- 	for _, id in ipairs(GetPlayerIdentifiers(user)) do
-- 		if string.match(id, "discord:") then
-- 			discordId = string.gsub(id, "discord:", "")
-- 			break
-- 		end
-- 	end

-- 	if discordId then
-- 		local endpoint = ("guilds/%s/members/%s"):format(kayscoreConfigServ.BoosterPerks.discordId, discordId)
-- 		local member = DiscordRequest("GET", endpoint, {})
-- 		if member.code == 200 then
-- 			local data = json.decode(member.data)
-- 			local roles = data.roles
-- 			local found = true
-- 			return roles
-- 		else
-- 			return false
-- 		end
-- 	else
-- 		return false
-- 	end
-- end

-- function IsRolePresent(user, role)
-- 	local discordId = nil
-- 	for _, id in ipairs(GetPlayerIdentifiers(user)) do
-- 		if string.match(id, "discord:") then
-- 			discordId = string.gsub(id, "discord:", "")
-- 			break
-- 		end
-- 	end

-- 	local theRole = nil
-- 	if type(role) == "number" then
-- 		theRole = tostring(role)
-- 	else
-- 		theRole = kayscoreConfigServ.BoosterPerks.roleBoostId[role]
-- 	end

-- 	if discordId then
-- 		local endpoint = ("guilds/%s/members/%s"):format(kayscoreConfigServ.BoosterPerks.discordId, discordId)
-- 		local member = DiscordRequest("GET", endpoint, {})
-- 		if member.code == 200 then
-- 			local data = json.decode(member.data)
-- 			local roles = data.roles
-- 			local found = true
-- 			for i=1, #roles do
-- 				if roles[i] == theRole then
-- 					return true
-- 				end
-- 			end
-- 			return false
-- 		else
-- 			return false
-- 		end
-- 	else
-- 		return false
-- 	end
-- end

-- Citizen.CreateThread(function()
-- 	local guild = DiscordRequest("GET", "guilds/"..kayscoreConfigServ.BoosterPerks.discordId, {})
-- 	if guild.code == 200 then
-- 		local data = json.decode(guild.data)
-- 	end
-- end)

-- function GetIdentifierFromId(source, identifier)
-- 	identifier = identifier or 'license:'
-- 	local identifiers = GetPlayerIdentifiers(tonumber(source))

-- 	for i = 1, #identifiers, 1 do
-- 		if string.sub(identifiers[i], 1, string.len(identifier)) == identifier then
-- 			return identifiers[i]
-- 		end
-- 	end

-- 	return false
-- end

-- RegisterCommand('boost',function(source,args)
-- 	local source = source
--     local IDENTIFIER = GetIdentifierFromId(source)
--     if IsRolePresent(source, "Boost") == true then
--         MySQL.Async.fetchScalar('SELECT time FROM kayscoreConfigServ.BoosterPerks WHERE identifier = @identifier', {
--             ['@identifier'] = IDENTIFIER
--         }, function(result)
--             if result then
--                 if tonumber(result) <= os.time() then
-- 					MySQL.Async.execute('DELETE FROM kayscoreConfigServ.BoosterPerks WHERE identifier = @identifier', {
-- 						['@identifier'] = IDENTIFIER,
-- 					}, function(rowsChanged)
-- 					end)
-- 					Wait(1000)
--                     local expiration = (kayscoreConfigServ.BoosterPerks.timeDelay * 86400)

--                     if expiration < os.time() then
--                         expiration = os.time() + expiration
--                     end
    
--                     MySQL.Async.execute("INSERT INTO `kayscoreConfigServ.BoosterPerks` (`identifier`, `time`) VALUES (@identifier, @time) ", {
--                         ['@identifier'] = IDENTIFIER,
--                         ['@time'] = expiration
--                     })
--                     kayscoreConfigServ.BoosterPerks.recompense(source)
--                 else
--                     local tempsrestant = (((tonumber(result)) - os.time())/60)
--                     local day        = (tempsrestant / 60) / 24
--                     local hrs        = (day - math.floor(day)) * 24
--                     local minutes    = (hrs - math.floor(hrs)) * 60
--                     local txtday     = math.floor(day)
--                     local txthrs     = math.floor(hrs)
--                     local txtminutes = math.ceil(minutes)
-- 					kayscoreConfigServ.BoosterPerks.showNotification(source, kayscoreConfigServ.BoosterPerks.translation['TIMER']:format(txtday, txthrs, txtminutes))
--                 end
--             else
--                 local expiration = (kayscoreConfigServ.BoosterPerks.timeDelay * 86400)

--                 if expiration < os.time() then
--                     expiration = os.time() + expiration
--                 end
--                 MySQL.Async.execute("INSERT INTO `kayscoreConfigServ.BoosterPerks` (`identifier`, `time`) VALUES (@identifier, @time) ", {
--                     ['@identifier'] = IDENTIFIER,
--                     ['@time'] = expiration
--                 })
--                 kayscoreConfigServ.BoosterPerks.recompense(source)
--             end
--         end)
--     else
-- 		kayscoreConfigServ.BoosterPerks.showNotification(source, kayscoreConfigServ.BoosterPerks.translation['NOBOOST'])
--     end
-- end)