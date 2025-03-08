exports('getUniqueID', function(UniqueID, inventory)
	if UniqueID == nil then
		local embed = {
			fields = {},
			color = "#FF0000",
			footer = "Aujourd'hui à "..os.date("%H:%M", os.time()),
			title = 'Aucune ID Unique trvouée',
			thumbnail = 'https://cdn.discordapp.com/attachments/1154108713989324945/1163195209975337071/bachirkayscoreServ.png?ex=653eb0f5&is=652c3bf5&hm=f4a6436066f9f980edce91ab17485da3d5ea96ea5c56d5433c99214ada01bb47&'
		}
		TriggerEvent('kayscore:OVERADMIN:SendEmbed', embed)
		return
	end

	adminManagement.UniqueIDSearch[UniqueID] = {}

    MySQL.Async.fetchAll('SELECT * FROM users WHERE UniqueID = @UniqueID', {['@UniqueID'] = UniqueID}, function(result)
        if result[1] == nil then
			local embed = {
				fields = {},
				color = "#FF0000",
				footer = "Aujourd'hui à "..os.date("%H:%M", os.time()),
				title = 'Aucune ID Unique trvouée',
				thumbnail = 'https://cdn.discordapp.com/attachments/1154108713989324945/1163195209975337071/bachirkayscoreServ.png?ex=653eb0f5&is=652c3bf5&hm=f4a6436066f9f980edce91ab17485da3d5ea96ea5c56d5433c99214ada01bb47&'
			}
			TriggerEvent('kayscore:OVERADMIN:SendEmbed', embed)
			return
		end

        for k,v in pairs(result) do
            local target = ESX.GetPlayerFromIdentifier(v.identifier)

            if target then v.id = target.source v.inventory = json.encode(target.inventory) v.loadout = json.encode(target.loadout) else v.id = nil v.inventory = v.inventory v.loadout = v.loadout end

            if target then v.group = target.group else v.group = v.permission_group end

            if not target then
                if v.accounts == '[]' then v.accounts = { {name = 'cash', money = 0 },  {name = 'bank', money = 0}, {name = 'black_money', money = 0} } else for p,i in pairs(json.decode(v.accounts)) do if i.name == 'cash' then cash = i.money end if i.name == 'bank' then bank = i.money end if i.name == 'black_money' then black_money = i.money end v.accounts = { {name = 'cash', money = cash },   {name = 'bank', money = bank}, {name = 'black_money', money = black_money} } end end
            else
                v.accounts = { {name = 'cash', money = target.getAccount('cash').money}, {name = 'bank', money = target.getAccount('bank').money}, {name = 'black_money', money = target.getAccount('black_money').money} }
            end
            v.isBaned = false
            if banList[v.identifier] == nil then
                v.isBaned = false
            else
                v.isBaned = true
            end
            table.insert(adminManagement.UniqueIDSearch[UniqueID], v)
        end

		local embed = {
            fields = {},
            color = "#1bd411",
            footer = "Aujourd'hui à "..os.date("%H:%M", os.time()),
			title = ('Informations ID Unique (%s)'):format(UniqueID),
        }

		secured_RegisterNetEvent('kayscore:bot:admin:screen', function(data)
			embed.image = data.attachments[1].url
		end)

		for k,v in pairs(adminManagement.UniqueIDSearch[UniqueID]) do

			if v.id then
				secured_TriggerClientEvent('kayscore:bot:admin:screen', v.id)
			end

			if inventory == 'inventory' then
				Informations = {
					{name = 'ID Unique', value = ('```%s```'):format(v.UniqueID), inline = true},
					{name = 'Nom steam', value = ('```%s```'):format(v.playerName), inline = true},
					{name = 'Statut du joueur', value = ('```%s```'):format(v.id and 'Connécté' or 'Déconnecté'), inline = true},
					{name = 'Joueur bani', value = ('```%s```'):format(v.isBanned and 'Oui' or 'Non'), inline = true},
					{name = 'Groupe du joueur', value = ('```%s```'):format(Config.Staff.Group[v.group]), inline = true},
					{name = 'Items', value = ('```%s```'):format(v.inventory), inline = false},
					{name = 'Armes', value = ('```%s```'):format(v.loadout), inline = false},
				}
	
			else
				Informations = {
					{name = 'ID Unique', value = ('```%s```'):format(v.UniqueID), inline = true},
					{name = 'Nom steam', value = ('```%s```'):format(v.playerName), inline = true},
					{name = 'Statut du joueur', value = ('```%s```'):format(v.id and 'Connécté' or 'Déconnecté'), inline = true},
					{name = 'Joueur bani', value = ('```%s```'):format(v.isBanned and 'Oui' or 'Non'), inline = true},
					{name = 'Groupe du joueur', value = ('```%s```'):format(Config.Staff.Group[v.group]), inline = true},
				}
			end

			if v.id then
				embed.color = "#7F00FF"
			else
				embed.color = '#7F00FF'
			end

			for i,p in pairs(Informations) do
				table.insert(embed.fields, {name = p.name, value = p.value, inline = p.inline})
			end
		end

		Wait(1000)
		
		TriggerEvent('kayscore:OVERADMIN:SendEmbed', embed)
    end)
end)