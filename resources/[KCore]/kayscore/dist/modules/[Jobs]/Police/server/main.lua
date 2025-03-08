ESX.RegisterServerCallback('kayscore:police:search', function(source, cb, player)
    local targetPlayer = ESX.GetPlayerFromId(player)

    if targetPlayer then
        local data = {}
        data[player] = {
            inventory = targetPlayer.inventory,
            loadout = targetPlayer.loadout,
            cash = targetPlayer.getAccount('cash').money,
            black_money = targetPlayer.getAccount('black_money').money,
            id = targetPlayer.source
        }
        cb(data[player])

        TriggerClientEvent('esx:showNotification', targetPlayer.source, '👮 La police vous fouille')
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('kayscore:getVehiculehInfos', function(source, cb, plate, modelName)
    local xPlayer = ESX.GetPlayerFromId(source)

    if not plate or not modelName then
        cb(nil)
        return
    end

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate AND state = 1', {
        ['@plate'] = plate
    }, function(result)
        if result[1] then
            local vehicleData = result[1]
            local vehInfo = {
                owner = vehicleData.owner,
                plate = vehicleData.plate,
                model = modelName,
                label = vehicleData.label or 'Inconnu',
                fuel = json.decode(vehicleData.fuel) or 100,
                garage = vehicleData.garage or 'Aucun',
                boutique = vehicleData.boutique == 1,
                state = vehicleData.state == 1,
                job = vehicleData.job or 'unemployed'
            }
            cb(vehInfo)
        else
            cb(nil)
        end
    end)
end)


RegisterNetEvent('kayscore:Service:delVeh', function(veh)
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name ~= "police" and xPlayer.job.name ~= "bcso" and xPlayer.job.name ~= "mecano" and xPlayer.job.name ~= "lscustom" then return end
    DeleteEntity(NetworkGetEntityFromNetworkId(veh))
end)

RegisterNetEvent('kayscore:police:menotter', function(target)
        local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "police" then return end

    local targetPlayer = ESX.GetPlayerFromId(target)

    TriggerClientEvent('kayscore:police:menotter', targetPlayer.source)
end)

RegisterNetEvent('kayscore:police:plainte:register', function(data)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('esx:showNotification', source, '📝 Plainte enregistrée avec succès')
    MySQL.Async.execute('INSERT INTO police_plainte (name, date, numberphone, reason, author) VALUES (@name, @date, @numberphone, @reason, @author)', {
        ['@name'] = data.name, 
        ['@date'] = data.date,
        ['@numberphone'] = data.numberphone, 
        ['@reason'] = data.reason,
        ['@author'] = ('%s %s'):format(xPlayer.firstname, xPlayer.lastname),
    }, function()
    end)
end)

ESX.RegisterServerCallback('kayscore:police:plainte:get', function(source, cb)
    local plaintes = {}

    MySQL.Async.fetchAll('SELECT * FROM police_plainte', {}, function(result)
        for k,v in pairs(result) do
            table.insert(plaintes, v)
        end

        cb(plaintes)
    end)
end)

RegisterNetEvent('kayscore:police:plainte:delete', function(id)
        local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "police" then return end
    MySQL.Async.execute('DELETE FROM police_plainte WHERE id = @id', {
        ['@id'] = id
    }, function()
        TriggerClientEvent('esx:showNotification', source, 'Plainte supprimée avec succès')
    end)
end)

RegisterNetEvent('kayscore:police:plainte:editReason', function(id, newReason)
        local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.execute('UPDATE police_plainte SET reason = @reason WHERE id = @id', {
        ['@id'] = id,
        ['@reason'] = newReason
    }, function()
        TriggerClientEvent('esx:showNotification', source, 'La raison de la plainte a bien était modifiée')
    end)
end)

RegisterNetEvent('kayscore:police:escoter', function(target)
        local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "police" then return end
    TriggerClientEvent('kayscore:police:escoter', target, source)
end)

RegisterNetEvent('kayscore:police:playerVehicle', function(target, vehicle, value)
            local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "police" then return end
    TriggerClientEvent('kayscore:police:playerVehicle', target, vehicle, value)
end)

ESX.RegisterServerCallback('kayscore:police:vehicle:searchPlate', function(source, cb, plate)
    local vehicle = {}
    vehicle[plate] = {}

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function(result)
        if result[1] == nil then
            vehicle[plate] = {
                plate = plate,
                owner = 'Inconnu'
            }
            cb(vehicle[plate])
            return
        end
        for k,v in pairs(result) do
            MySQL.Async.fetchAll('SELECT * FROM users WHERE UniqueID = @UniqueID', {
                ['@UniqueID'] = v.owner
            }, function(reuslt2)
                vehicle[plate] = {
                    plate = plate,
                    owner = ('%s %s'):format(reuslt2[1].firstname, reuslt2[1].lastname)
                }
                cb(vehicle[plate])
            end)
        end
    end)
end)


LSPD = {
    inService = {}
}

RegisterNetEvent('kayscore:LSPD:service', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end
    if xPlayer.job.name ~= "police" then return end

    if not LSPD.inService[xPlayer.identifier] then
        LSPD.inService[xPlayer.identifier] = true
        for id, _ in pairs(LSPD.inService) do
            local targetPlayer = ESX.GetPlayerFromIdentifier(id)
            if targetPlayer and targetPlayer.job.name == xPlayer.job.name then
                TriggerClientEvent('esx:showNotification', targetPlayer.source, ('L\'employé ~y~%s~s~ a pris son service'):format(xPlayer.name))
            end
        end
    else
        LSPD.inService[xPlayer.identifier] = nil
        for id, _ in pairs(LSPD.inService) do
            local targetPlayer = ESX.GetPlayerFromIdentifier(id)
            if targetPlayer and targetPlayer.job.name == xPlayer.job.name then
                TriggerClientEvent('esx:showNotification', targetPlayer.source, ('L\'employé ~y~%s~s~ a fini son service'):format(xPlayer.name))
            end
        end
    end
end)

secured_RegisterNetEvent('kayscore:sendappel:jobLSPD', function(data)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    MySQL.Async.execute('INSERT INTO appel_jobs (job, raison, pos, plate) VALUES (@a, @b, @c, @d)', {
        ['@a'] = data.job,
        ['@b'] = data.raison,
        ['@c'] = json.encode(data.pos),
        ['@d'] = data.plate
    }, function() end)

    local message = ('Un nouvel appel a été fait : %s, Plaque : %s'):format(data.raison, data.plate)

    for id, _ in pairs(LSPD.inService) do
        local targetPlayer = ESX.GetPlayerFromIdentifier(id)
        if targetPlayer then
            if targetPlayer.job.name == 'police' then
                if kayscoreLSPD.Police.Service then
                    TriggerClientEvent('esx:showNotification', targetPlayer.source, message)
                    TriggerClientEvent('soundmecano:playSound', source)
                end
            end
        end
    end
end)


RegisterNetEvent('kayscore:police:giveweapon', function(name, label)
        local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "police" and xPlayer.job.name ~= "gouvernement" then return end
    local xPlayerName = ('%s %s'):format(xPlayer.firstname, xPlayer.lastname)
    if not xPlayer then return end
    if xPlayer.job.name ~= 'police' and xPlayer.job.name ~= "gouvernement" then
        
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'êtes pas policier (aie aie aie)')
        logsACJob.SendLogsACJob('weapon', ('%s a tenté de se give une arme ID Unique: **%s** (trigger: policegiveweapon)'):format(xPlayer.name, xPlayer.UniqueID))
        return 
    end

    xPlayer.addWeapon(name, 255)
    LogsJobFunc.SendLogsArmurie('LSPD_armu', ('**%s** vient de prendre une arme dans le casier x1 *%s*'):format(xPlayerName, label), 'take')
end)

RegisterNetEvent('kayscore:police:renforts', function(coords, value)
     local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "police" then return end
    local players = ESX.GetExtendedPlayers('job', 'police')
    for k,v in pairs(players) do
        TriggerClientEvent('kayscore:police:renforts', v.source, coords, value)
    end
end)

RegisterNetEvent('kayscore:police:removeItem', function(count, name, player, label)
        local xPlayer = ESX.GetPlayerFromId(source)
        local xPlayerTarget = ESX.GetPlayerFromId(player)
    if xPlayer.job.name ~= "police" and xPlayer.job.name ~= "gouvernement" then return end
    local m = ESX.GetPlayerFromId(source)
    if not kayscoreConfigServ.PermanantWeapon[name] then
    if not m.canCarryItem(name, 1) then TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez de place dans votre inventaire") return end	
    xPlayerTarget.removeInventoryItem(name, count)
    m.addInventoryItem(name, count)

    TriggerClientEvent('esx:showNotification', player, ('La police vous a saisis ~r~x%s~s~ %s'):format(count, label))
    end
end)

RegisterNetEvent('kayscore:police.removeWeaponPerm', function(name, player, label)
        local xPlayer = ESX.GetPlayerFromId(source)
        local xPlayerTarget = ESX.GetPlayerFromId(player)
    if xPlayer.job.name ~= "police" then return end
    local m = ESX.GetPlayerFromId(source)

    if not xPlayer then return end
    if not kayscoreConfigServ.PermanantWeapon[name] then
        if not xPlayerTarget then return end
    xPlayerTarget.removeWeapon(name)
    m.addWeapon(name)

    TriggerClientEvent('esx:showNotification', player, ('La police vous a saisis ~r~x%s~s~ %s'):format(1, label))
    end
end)

RegisterNetEvent('kayscore:police:removeMoney', function(count, player)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerTarget = ESX.GetPlayerFromId(player)
    if xPlayer.job.name ~= "police" then return end
    local m = ESX.GetPlayerFromId(source)

    xPlayerTarget.removeAccountMoney('black_money', count)
    m.addAccountMoney('black_money', count)

    TriggerClientEvent('esx:showNotification', player, ('La police vous a saisis ~r~x%s~s~ %s'):format(count, 'd\'argent sale'))
end)

RegisterNetEvent('kayscore:police:ppa', function(player)
        local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "police" then return end
    local targetPlayer = ESX.GetPlayerFromId(player)

    if targetPlayer.getAccount('bank').money < 25000 then return TriggerClientEvent('esx:showNotification', source, 'La personne n\'a a pas les sous néccéssaires') end

    targetPlayer.removeAccountMoney('bank', 25000)

    MySQL.Async.execute("INSERT INTO user_licenses (type, owner) VALUES (@type, @owner)", {
        ['@type'] = 'weapon',
        ['@owner'] = targetPlayer.identifier
    })

    local society = Society:getSociety(xPlayer.job.name)

    if not society then return end

    society.addSocietyMoney(25000)
end)

RegisterNetEvent('kayscore:police:sendCode', function(message)
            local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "police" then return end
    local players = ESX.GetExtendedPlayers('job', 'police')

    for k,v in pairs(players) do
        TriggerClientEvent('esx:showNotification', v.source, ('~y~Code LSPD~s~\n%s'):format(message))

        TriggerClientEvent('kayscore:police:sendCode', v.source)
    end
end)

ESX.RegisterServerCallback('kayscore:police:amendes', function(source, cb, player)
    local xPlayer = ESX.GetPlayerFromId(source)
    local target = ESX.GetPlayerFromId(player)
    if xPlayer.job.name ~= "police" and xPlayer.job.name ~= "bcso" then return end

    --if not target then cb({}) return end

    MySQL.Async.fetchAll('SELECT * FROM billing WHERE target = @target', {
        ['@target'] = 'society_police'
    }, function(result)
        local amendes = {}
        for k,v in pairs(result) do
            table.insert(amendes, v)
        end

        cb(amendes)
    end)
end)

RegisterNetEvent('kayscore:police.removeWeapon', function(data)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "police" or xPlayer.job.name ~= "gouvernement" then return end
    local xPlayerName = ('%s %s'):format(xPlayer.firstname, xPlayer.lastname)
    if type(data) == "string" then
        data = {data}
    end

    for _,v in ipairs(data) do
        xPlayer.removeWeapon(v)
    end

    TriggerClientEvent('esx:showNotification', source, 'Vous avez rendu vos armes de service')
    LogsJobFunc.SendLogsArmurie('LSPD_armu', ('**%s** vient de rendre ses armes de service'):format(xPlayerName), 'pose')
end)

AddEventHandler('playerDropped', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if (not xPlayer) then return; end

    for k,v in pairs(kayscoreLSPD.Police.weapons) do
        xPlayer.removeWeapon(v.name)
    end
end)

AddEventHandler('playerDropped', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if (not xPlayer) then return; end

    xPlayer.removeWeapon("WEAPON_MUSKET")
end)

RegisterNetEvent('kayscore:police:radar', function(y)
        local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= "police" then return end
    local xPlayerName = ('%s %s'):format(xPlayer.firstname, xPlayer.lastname)

    if xPlayer.job.name ~= 'police' then return end

    if y == true then
        LogsJobFunc.SendLogsRadar(('**%s** vient de poser le radar'):format(xPlayerName), 'pose')
    else
        LogsJobFunc.SendLogsRadar(('**%s** vient de prendre le radar'):format(xPlayerName), 'pose')
    end

end)





RegisterNetEvent('kayscore:police:saisi:perm', function(target)

    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(target)
   
    if not xPlayer then return end
    if xPlayer.job.name ~= "police" then return end
    local xPlayerName = ('%s %s'):format(xPlayer.firstname, xPlayer.lastname)

    local time = os.time()

   
    MySQL.Async.fetchAll('SELECT * FROM weapon_confiscate WHERE uniqueid = @uniqueid', {
        ['@uniqueid'] = xTarget.UniqueID
    }, function(result)
        if result[1] then
            TriggerClientEvent('esx:showNotification', source, 'Ses armes sont déjà saisies')
        else
            MySQL.Async.execute(' INSERT INTO weapon_confiscate (uniqueid, weapon_name, time) VALUES (@a, @b, @c)', {
                ['@a'] = xTarget.UniqueID,
                ['@b'] = 'blc_enfaite',
                ['@c'] = time
            }, function()

                TriggerClientEvent('esx:showNotification', xTarget.source, 'Vos armes PERM ont été saisies')
               -- TriggerClientEvent('esx:showNotification', source, 'Vous avez saisi les armes PERM de la personne')
                TriggerEvent('kayscore:inventory:getWeaponTime', xTarget.source)
            end)
            
        end
    end)

   

    --LogsJobFunc.SendLogsRadar(('**%s** vient de confisquer une arme perm'):format(xPlayerName), '')
end)

--RegisterCommand('checktime', function()
--    TriggerEvent('CheckTime')
--end)

RegisterNetEvent('CheckTime', function ()
  

    MySQL.Async.fetchAll('SELECT * FROM weapon_confiscate WHERE uniqueid = @uniqueid', {
        ['@uniqueid'] = 'xPlayer.UniqueID'
    }, function(result)
        for k,v in pairs(result) do
            if os.time() - v.time >  3600 then
                MySQL.Async.execute('DELETE FROM weapon_confiscate WHERE uniqueid = @uniqueid', {
                    ['@uniqueid'] = xPlayer.UniqueID
                }, function()
                end)
            else
            end
        end
    end)
end)

local JobsCam = {}
local bodyCams = {}
local carCams  = {}

-----------------------------------------------------------------------------------------
-- EVENT'S --
-----------------------------------------------------------------------------------------

RegisterNetEvent('wais:playerLoaded:bodycam', function()
    local src = source
    local Player = ESX.GetPlayerFromId(src)

    if Player.job.name == "police" or Player.job.name == "bcso" then
        if JobsCam[tostring(src)] == nil then
            JobsCam[tostring(src)] = false
        end
        TriggerClientEvent('wais:body:pload', src, bodyCams, carCams)
    end
end)

RegisterNetEvent('wais:jobCheck', function()
    local src = source
    local Player = ESX.GetPlayerFromId(src)

    if Player.job.name == "police" or Player.job.name == "bcso" then
        if JobsCam[tostring(src)] == nil then
            JobsCam[tostring(src)] = false
        end
    else
        if JobsCam[tostring(src)] ~= nil then
            JobsCam[tostring(src)] = nil
            if bodyCams[tostring(src)] ~= nil then
                bodyCams[tostring(src)] = nil
                TriggerJob(true, tostring(src), false)
            end
        end
    end
end)

RegisterNetEvent('wais:closeBodyCam:Inventory', function(source)
    local src = source
    local Player = ESX.GetPlayerFromId(src)

    if JobsCam[tostring(src)] then
        JobsCam[tostring(src)] = false
        if bodyCams[tostring(src)] ~= nil then
            bodyCams[tostring(src)] = nil
            TriggerJob(true, tostring(src), false)
            TriggerClientEvent('esx:showNotification', src, kayscoreLSPD.Police.Camera.Lang["bodycam-off"])
        end
    end
end)

RegisterNetEvent('wais:addDashCam', function(carId, plate, boneId)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    
    if carCams[carId] == nil then
        TriggerClientEvent('esx:showNotification', src, kayscoreLSPD.Police.Camera.Lang["dashcam-on"])
        carCams[carId] = {bone = boneId, plate = plate, names = Player.variables.firstName .. ' ' .. Player.variables.lastName}
        TriggerJob(false, carId, true)
    else
        TriggerClientEvent('esx:showNotification', src, kayscoreLSPD.Police.Camera.Lang["dashcam-off"])
        TriggerEvent('wais:removeTable:DashCam:s', tostring(carId))
    end
end)

RegisterNetEvent('wais:removeTable:DashCam:s', function(tableId)
    if carCams[tableId] ~= nil then
        carCams[tableId] = nil
        TriggerJob(false, tableId, false)
    end
end)

AddEventHandler('playerDropped', function(reason)
    local src = source
    if JobsCam[tostring(src)] ~= nil then
        JobsCam[tostring(src)] = nil
        if bodyCams[tostring(src)] ~= nil then
            bodyCams[tostring(src)] = nil
            TriggerJob(true, tostring(src), false)
        end
    end
end)

-----------------------------------------------------------------------------------------
-- CALLBACK'S --
-----------------------------------------------------------------------------------------

ESX.RegisterServerCallback('wais:getCoords', function(source, cb, id)
    local ped = GetPlayerPed(id)
    local playerCoords = GetEntityCoords(ped)
    cb(playerCoords)
end)

ESX.RegisterServerCallback('wais:getCoordsCar', function(source, cb, id)
    local coords = GetEntityCoords(NetworkGetEntityFromNetworkId(id))
    cb(coords)
end)

ESX.RegisterUsableItem(kayscoreLSPD.Police.Camera.Items.bodycam, function(source, item)
    local src = source
    local Player = ESX.GetPlayerFromId(src)

    if JobsCam[tostring(src)] ~= nil then
        if not JobsCam[tostring(src)] then
            JobsCam[tostring(src)] = true
            if bodyCams[tostring(src)] == nil then
                bodyCams[tostring(src)] = {gradeLabel = Player.job.grade_label, names = Player.variables.firstName .. ' ' .. Player.variables.lastName}
                TriggerJob(true, tostring(src), true)
                TriggerClientEvent('esx:showNotification', src, kayscoreLSPD.Police.Camera.Lang["bodycam-on"])
            end
        else
            JobsCam[tostring(src)] = false
            if bodyCams[tostring(src)] ~= nil then
                bodyCams[tostring(src)] = nil
                TriggerJob(true, tostring(src), false)
                TriggerClientEvent('esx:showNotification', src, kayscoreLSPD.Police.Camera.Lang["bodycam-off"])
            end
        end
    end
end)

ESX.RegisterUsableItem(kayscoreLSPD.Police.Camera.Items.dashcam, function(source, item)
    local src = source
    local Player = ESX.GetPlayerFromId(src)

    if JobsCam[tostring(src)] ~= nil then
        TriggerClientEvent('wais:AddOrRemove:DashCam', src)
    end
end)

-----------------------------------------------------------------------------------------
-- FUNCTION'S --
-----------------------------------------------------------------------------------------

function TriggerJob(bodyCam, tableId, add)
    if bodyCam then
        for k, v in pairs(JobsCam) do
            if add then
                TriggerClientEvent('wais:addTable:BodyCam', k, tableId, bodyCams[tableId])
            else
                TriggerClientEvent('wais:removeTable:BodyCam', k, tableId)
            end
        end
    else
        for k, v in pairs(JobsCam) do
            if add then
                TriggerClientEvent('wais:addTable:DashCam', k, tableId, carCams[tableId])
            else
                TriggerClientEvent('wais:removeTable:DashCam', k, tableId)
            end
        end
    end
end

-----------------------------------------------------------------------------------------
-- COMMAND'S --
-----------------------------------------------------------------------------------------