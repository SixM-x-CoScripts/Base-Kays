function Properties:updateTrunk(propertiesID)
    MySQL.Async.execute('UPDATE properties SET trunk = @trunk WHERE propertiesID = @propertiesID', {
        ['@propertiesID'] = propertiesID,
        ['@trunk'] = json.encode(Properties.PropertiesList[propertiesID].trunk)
    }, function()
        TriggerClientEvent('kayscore:properties:trunk:refresh', -1, propertiesID, Properties.PropertiesList[propertiesID].trunk)
    end)
end

RegisterNetEvent('kayscore:properties:trunk:updateCode', function(propertiesID, data)
    local source = source

    Properties.PropertiesList[propertiesID].trunk['code'] = data

    Properties:updateTrunk(propertiesID)
end)

RegisterNetEvent('kayscore:properties:trunk:actionsMoney', function(propertiesID, type, data, action)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerMoney = xPlayer.getAccount(type).money

    if action == 'add' then
        if xPlayerMoney < data then return TriggerClientEvent('esx:showNotification', source, '❌ Vous ne disposez pas des fonds nécessaires !') end

        Properties.PropertiesList[propertiesID].trunk['accounts'][type] += data

        xPlayer.removeAccountMoney(type, data)

        TriggerClientEvent('esx:showNotification', source, ('💲 Vous avez déspoé ~g~%s$~s~ dans le coffre'):format(data))
    elseif action == 'remove' then
        if Properties.PropertiesList[propertiesID].trunk['accounts'][type] < data then return TriggerClientEvent('esx:showNotification', source, '❌ Il n\'y a pas assez de quantité dans le coffre !') end

        Properties.PropertiesList[propertiesID].trunk['accounts'][type] -= data

        xPlayer.addAccountMoney(type, data)
        
        TriggerClientEvent('esx:showNotification', source, ('💲 Vous avez retiré ~g~%s$~s~ du coffre'):format(data))
    end

    Properties:updateTrunk(propertiesID)
end)

RegisterNetEvent('kayscore:properties:trunk:actionsCoffre', function(propertiesID, itemData, count, action, type, z, zz)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if type == 'item' then
        if action == 'add' then
            local xPlayerItemCount = xPlayer.getInventoryItem(itemData.name).count
            if xPlayerItemCount < count then return TriggerClientEvent('esx:showNotification', source, '❌ Vous ne disposez pas de la quantité nécessaires !') end
    
            if Properties.PropertiesList[propertiesID].trunk['items'][itemData.name] == nil then
                Properties.PropertiesList[propertiesID].trunk['items'][itemData.name] = {}
                Properties.PropertiesList[propertiesID].trunk['items'][itemData.name].name = itemData.name
                Properties.PropertiesList[propertiesID].trunk['items'][itemData.name].label = itemData.label
                Properties.PropertiesList[propertiesID].trunk['items'][itemData.name].count = count
            else
                Properties.PropertiesList[propertiesID].trunk['items'][itemData.name].count += count
            end
            if not kayscoreConfigServ.PermanentItem[itemData.name] then
            xPlayer.removeInventoryItem(itemData.name, count)
            end
            TriggerClientEvent('esx:showNotification', source, ('💎 Vous avez ajouté ~g~%s %s~s~ au coffre'):format(count, itemData.label))
        elseif action == 'remove' then
            if Properties.PropertiesList[propertiesID].trunk['items'][itemData.name].count < count then return TriggerClientEvent('esx:showNotification', source, '❌ Il n\'y a pas assez de quantité dans le coffre !') end
    
            Properties.PropertiesList[propertiesID].trunk['items'][itemData.name].count -= count
    
            if Properties.PropertiesList[propertiesID].trunk['items'][itemData.name].count <= 0 then
                Properties.PropertiesList[propertiesID].trunk['items'][itemData.name] = nil
            end
            if not kayscoreConfigServ.PermanentItem[itemData.name] then
            if not xPlayer.canCarryItem(itemData.name, 1) then TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez de place dans votre inventaire") return end	
            xPlayer.addInventoryItem(itemData.name, count)
            end
            TriggerClientEvent('esx:showNotification', source, ('💎 Vous avez retiré ~g~%s %s~s~ du coffre'):format(count, itemData.label))
        end
    elseif type == 'weapon' then
        if action == 'add' then
            local number = 0
            for k,v in pairs(Properties.PropertiesList[propertiesID].trunk['weapons']) do
                number += 1
            end
            Properties.PropertiesList[propertiesID].trunk['weapons'][itemData.name..number] = {}
            Properties.PropertiesList[propertiesID].trunk['weapons'][itemData.name..number].name = itemData.name
            Properties.PropertiesList[propertiesID].trunk['weapons'][itemData.name..number].label = itemData.label
            Properties.PropertiesList[propertiesID].trunk['weapons'][itemData.name..number].ammo = count
            Properties.PropertiesList[propertiesID].trunk['weapons'][itemData.name..number].number = number
            if not kayscoreConfigServ.PermanantWeapon[itemData.name] then
            xPlayer.removeWeapon(itemData.name)
            end
            TriggerClientEvent('esx:showNotification', source, ('💎 Vous avez ajouté ~g~%s %s~s~ au coffre'):format(1, itemData.label))
        elseif action == 'remove' then

            for k,v in pairs(Properties.PropertiesList[propertiesID].trunk['weapons']) do
                if v.number == z then
                    if Properties.PropertiesList[propertiesID].trunk['weapons'][k] == nil then
                        return TriggerClientEvent('esx:showNotification', source, 'Cette arme n\'est plus dans le coffre')
                    end
                end
            end

            Properties.PropertiesList[propertiesID].trunk['weapons'][zz] = nil
            if not kayscoreConfigServ.PermanantWeapon[itemData.name] then
            xPlayer.addWeapon(itemData.name, count)
            end
            TriggerClientEvent('esx:showNotification', source, ('💎 Vous avez retiré ~g~%s %s~s~ du coffre'):format(1, itemData.label))
        end
    end

    Properties:updateTrunk(propertiesID)
end)