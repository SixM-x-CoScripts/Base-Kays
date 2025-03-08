secured_RegisterServerEvent('Zigi:CreateFarmEntreprise')
secured_AddEventHandler('Zigi:CreateFarmEntreprise', function(namejob, labeljob, namerecolteitem, labelrecolteitem, PositionRecolte, nametraitementitem, labeltraitementitem, PositionTraitement, PositionVente, PositionCoffreEntreprise)
    MySQL.Async.execute("INSERT INTO `player_entreprise` (`type`, `name`, `label`, `PosVestiaire`, `PosCustom`, `PosBoss`, `namerecolteitem`, `PosRecolte`, `nametraitementitem`, `PosTraitement`, `PosVente`) VALUES (@type, @name, @label, @PosVestiaire, @PosCustom, @PosBoss, @namerecolteitem, @PosRecolte, @nametraitementitem, @PosTraitement, @PosVente) ", {
        ['@type'] = 'Farm',
        ['@name'] = namejob,
        ['@label'] = labeljob,
        ['@PosVestiaire'] = nil,
        ['@PosCustom'] = nil,
        ['@PosBoss'] = json.encode(PositionCoffreEntreprise),
        ['@namerecolteitem'] = namerecolteitem,
        ['@PosRecolte'] = json.encode(PositionRecolte),
        ['@nametraitementitem'] = nametraitementitem,
        ['@PosTraitement'] = json.encode(PositionTraitement),
        ['@PosVente'] = json.encode(PositionVente)
    })
    MySQL.Async.execute("INSERT INTO `items` (`name`, `label`) VALUES (@name, @label) ", {
        ['@name'] = namerecolteitem,
        ['@label'] = labelrecolteitem
    })
    MySQL.Async.execute("INSERT INTO `items` (`name`, `label`) VALUES (@name, @label) ", {
        ['@name'] = nametraitementitem,
        ['@label'] = labeltraitementitem
    })
    TriggerClientEvent('esx:showNotification', source, 'Le Job à été crée avec succès, Attendez le prochain reboot.')
    TriggerEvent('kayscore:RefreshFarmSociety')
end)

local EntrepriseFarmList = {}
local ListeItemRecolt = {}
local ListeItemTraitement = {}

Citizen.CreateThread(function()
    Wait(1500)
    MySQL.Async.fetchAll('SELECT * FROM player_entreprise', {}, function(Entreprise)
        for i=1, #Entreprise, 1 do
            EntrepriseFarmList[Entreprise[i].name] = {}
            EntrepriseFarmList[Entreprise[i].name].type = Entreprise[i].type 
            EntrepriseFarmList[Entreprise[i].name].name = Entreprise[i].name
            EntrepriseFarmList[Entreprise[i].name].label = Entreprise[i].label
            EntrepriseFarmList[Entreprise[i].name].PosBoss = json.decode(Entreprise[i].PosBoss)
            EntrepriseFarmList[Entreprise[i].name].RecolteItem = Entreprise[i].namerecolteitem
            EntrepriseFarmList[Entreprise[i].name].PosRecolte = json.decode(Entreprise[i].PosRecolte)
            EntrepriseFarmList[Entreprise[i].name].TraitementItem = Entreprise[i].nametraitementitem
            EntrepriseFarmList[Entreprise[i].name].PosTraitement = json.decode(Entreprise[i].PosTraitement)
            EntrepriseFarmList[Entreprise[i].name].PosVente = json.decode(Entreprise[i].PosVente)

            -- SECURISATION RECOLTE
            ListeItemRecolt[Entreprise[i].namerecolteitem] = {}
            ListeItemRecolt[Entreprise[i].namerecolteitem].name = Entreprise[i].namerecolteitem
            -- SECURISATION TRAITEMENT
            ListeItemTraitement[Entreprise[i].nametraitementitem] = {}
            ListeItemTraitement[Entreprise[i].nametraitementitem].name = Entreprise[i].nametraitementitem

        end
    end)
end)

RegisterServerEvent('kayscore:RefreshFarmSociety', function ()
    EntrepriseFarmList = {}
    ListeItemRecolt = {}
    ListeItemTraitement = {}

    MySQL.Async.fetchAll('SELECT * FROM player_entreprise', {}, function(Entreprise)
        for i=1, #Entreprise, 1 do
            EntrepriseFarmList[Entreprise[i].name] = {}
            EntrepriseFarmList[Entreprise[i].name].type = Entreprise[i].type 
            EntrepriseFarmList[Entreprise[i].name].name = Entreprise[i].name
            EntrepriseFarmList[Entreprise[i].name].label = Entreprise[i].label
            EntrepriseFarmList[Entreprise[i].name].PosBoss = json.decode(Entreprise[i].PosBoss)
            EntrepriseFarmList[Entreprise[i].name].RecolteItem = Entreprise[i].namerecolteitem
            EntrepriseFarmList[Entreprise[i].name].PosRecolte = json.decode(Entreprise[i].PosRecolte)
            EntrepriseFarmList[Entreprise[i].name].TraitementItem = Entreprise[i].nametraitementitem
            EntrepriseFarmList[Entreprise[i].name].PosTraitement = json.decode(Entreprise[i].PosTraitement)
            EntrepriseFarmList[Entreprise[i].name].PosVente = json.decode(Entreprise[i].PosVente)

            -- SECURISATION RECOLTE
            ListeItemRecolt[Entreprise[i].namerecolteitem] = {}
            ListeItemRecolt[Entreprise[i].namerecolteitem].name = Entreprise[i].namerecolteitem
            -- SECURISATION TRAITEMENT
            ListeItemTraitement[Entreprise[i].nametraitementitem] = {}
            ListeItemTraitement[Entreprise[i].nametraitementitem].name = Entreprise[i].nametraitementitem
            print('L\'entreprise ['..Entreprise[i].name..'] à été chargé')
            print('L\'item ['..Entreprise[i].namerecolteitem..'] à été ajouté dans la Whitelist')
            print('L\'item ['..Entreprise[i].nametraitementitem..'] à été ajouté dans la Whitelist')
        end

        TriggerClientEvent('Zigi:SendEntrepriseFarmList', -1, EntrepriseFarmList)
    end)

end)

RegisterServerEvent('Zigi:initFarmSociety')
AddEventHandler('Zigi:initFarmSociety', function()
    TriggerClientEvent('Zigi:SendEntrepriseFarmList', source, EntrepriseFarmList)
end)

local PlyaerJobFarm = {}

local function Activity(source, itemRecolte, type, ItemTraitement, society)
    if PlyaerJobFarm[source] then
        local xPlayer = ESX.GetPlayerFromId(source)
        if type == 1 then -- Récolte
            if ListeItemRecolt[itemRecolte] == nil then
                DropPlayer(source, 'Désynchronisation avec les Entreprises de farm')
            else
                if ListeItemRecolt[itemRecolte].name == itemRecolte then
                    if not xPlayer.canCarryItem(itemRecolte, 1) then 
                        TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez de place dans votre inventaire") 
                        TriggerClientEvent('framework:stopActivity', source) 
                        return 
                    end
                    
                    -- Vérification du boost
                    local total = 1
                    if boost_farm.have(xPlayer.UniqueID) then
                        total = total * 2
                    end

                    TriggerClientEvent('framework:farmanimation', source)
                    Citizen.Wait(1500)
                    xPlayer.addInventoryItem(itemRecolte, total)
                    TriggerClientEvent('esx:showNotification', source, ('🌿 Vous avez récolté ~y~+%s~s~'):format(total))
                    sendLog(("Le Joueur (%s - %s) vient de récolter (x%s - %s) pour la société (%s) "):format(xPlayer.name, xPlayer.UniqueID, total, itemRecolte, xPlayer.job.label), {
                        author = xPlayer.job.label,
                        fields = {
                            {title = 'Player', subtitle = xPlayer.name},
                            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                            {title = 'Identifier', subtitle = xPlayer.identifier},
                            {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                        },
                        channel = 'reco_jobfarm'
                    })
                    Activity(source, itemRecolte, type, ItemTraitement, society)
                    TriggerEvent("esx:recolteentreprise", source, itemRecolte, society)
                end
            end
        elseif type == 2 then -- Traitement
            if ListeItemRecolt[itemRecolte] == nil or ListeItemTraitement[ItemTraitement] == nil then
                DropPlayer(source, 'Désynchronisation avec les Entreprises de farm')
            else
                if ListeItemRecolt[itemRecolte].name == itemRecolte and ListeItemTraitement[ItemTraitement].name == ItemTraitement then  
                    if not xPlayer.canCarryItem(ItemTraitement, 1) then 
                        TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez de place dans votre inventaire") 
                        return 
                    end	
                    local Quantity = xPlayer.getInventoryItem(itemRecolte).count
                    if Quantity <= 0 then
                        xPlayer.showNotification('Vous n\'avez rien à traiter')
                        TriggerClientEvent('framework:stopActivity', source) 
                    else
                        -- Vérification du boost
                        local total = 1
                        if boost_farm.have(xPlayer.UniqueID) then
                            total = total * 2
                        end

                        TriggerClientEvent('framework:farmanimation', source)
                        Citizen.Wait(1500)
                        xPlayer.removeInventoryItem(itemRecolte, total)
                        xPlayer.addInventoryItem(ItemTraitement, total)
                        TriggerClientEvent('esx:showNotification', source, ('🌿 Vous avez traité ~y~+%s~s~'):format(total))
                        sendLog(("Le Joueur (%s - %s) vient de traiter (x%s - %s) pour la société (%s) "):format(xPlayer.name, xPlayer.UniqueID, total, ItemTraitement, xPlayer.job.label), {
                            author = xPlayer.job.label,
                            fields = {
                                {title = 'Player', subtitle = xPlayer.name},
                                {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                                {title = 'Identifier', subtitle = xPlayer.identifier},
                                {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                            },
                            channel = 'trait_jobfarm'
                        })
                        Activity(source, itemRecolte, type, ItemTraitement, society)
                        TriggerEvent("esx:traitemententreprise", source, ItemTraitement, society)
                    end
                end
            end
        elseif type == 3 then -- Vente
            if ListeItemTraitement[ItemTraitement] == nil then
                DropPlayer(source, 'Désynchronisation avec les Entreprises de farm')
            else
                if ListeItemTraitement[ItemTraitement].name == ItemTraitement then
                    local Quantity = xPlayer.getInventoryItem(ItemTraitement).count
                    if Quantity <= 0 then
                        xPlayer.showNotification('Vous n\'avez rien à vendre')
                        TriggerClientEvent('framework:stopActivity', source) 
                    else					
                        local societyy = Society:getSociety(xPlayer.job.name)
                        TriggerClientEvent('framework:farmanimation', source)
                        Citizen.Wait(1500)
                        xPlayer.removeInventoryItem(ItemTraitement, 1)
                        societyy.addSocietyMoney(25)
                        xPlayer.addAccountMoney('bank', 25)
                        TriggerClientEvent('esx:showNotification', source, ('🌿 Vous avez vendu ~y~-1'))
                        sendLog(("Le Joueur (%s - %s) vient de vendre (x1 - %s) pour la société (%s) "):format(xPlayer.name, xPlayer.UniqueID, ItemTraitement, xPlayer.job.label), {
                            author = xPlayer.job.label,
                            fields = {
                                {title = 'Player', subtitle = xPlayer.name},
                                {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                                {title = 'Identifier', subtitle = xPlayer.identifier},
                                {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                            },
                            channel = 'vente_jobfarm'
                        })
                        Activity(source, itemRecolte, type, ItemTraitement, society)
                        TriggerEvent("esx:venteentreprise", source, ItemTraitement, society)
                    end
                end
            end
        else
            DropPlayer(source, 'Désynchronisation avec les Entreprises de farm')
        end
    end
end





RegisterServerEvent('framework:startActivity')
AddEventHandler('framework:startActivity', function(position, itemRecolte, type, ItemTraitement, society)
	if #(GetEntityCoords(GetPlayerPed(source)) - vector3(position.x, position.y, position.z)) < 100 then
		PlyaerJobFarm[source] = true
		Activity(source, itemRecolte, type, ItemTraitement, society)
	else
		TriggerEvent('Zigilpb_fantadmin:ban', source, source, 'Tricher est interdit ( Activité Légal )', 0)
	end
end)

RegisterServerEvent('framework:stopActivity')
AddEventHandler('framework:stopActivity', function()
	PlyaerJobFarm[source] = false
end)