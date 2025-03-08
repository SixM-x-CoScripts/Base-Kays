adminManagement = {
    Service = {},
    Players = {},
    staffList = {},
    Reports = {},
    UniqueIDSearch = {},
    UniqueIDSearchBoutiqueHistory = {},
    ItemsList = {},
    WarnList = {},
    sanctionsList = {},

    jails = {},
}

AddEventHandler('esx:playerLoaded', function(source, xPlayer)
    local source = source

    adminManagement.Players[source] = {
        name = GetPlayerName(source),
        id = source,
        UniqueID = xPlayer.UniqueID,
        group = xPlayer.getGroup(),
        job = xPlayer.getJob(),
        job2 = xPlayer.getJob2(),
        player = xPlayer,
        identifier = xPlayer.identifier
    }

    if xPlayer.getGroup() ~= 'user' then
        adminManagement.staffList[source] = {
            name = GetPlayerName(source),
            id = source,
            UniqueID = xPlayer.UniqueID,
            group = xPlayer.getGroup(),
            job = xPlayer.getJob(),
            job2 = xPlayer.getJob2(),
            service = false
        }

        secured_TriggerClientEvent("kayscore:admin:addReport", source, nil, adminManagement.Reports)

        secured_TriggerClientEvent('kayscore:reports:refreh:service', source, adminManagement.Reports)
    end

    adminManagement:AddPlayer()
    adminManagement:UpdateStaffs()
end)

ESX.RegisterServerCallback("kayscore:admin:getJobsList", function(source, callback)
    MySQL.Async.fetchAll("SELECT * FROM jobs", {}, function(result)
      callback(result)
    end)
  end)

AddEventHandler('playerDropped', function(reason)
    local source = source

    if not adminManagement.Players[source] then return end

    local playerId = ReturnPlayerId(adminManagement.Players[source].UniqueID)
    
    if not playerId then return end

    adminManagement.Reports[playerId.id] = nil
    adminManagement:RemoveReport(kayscoreConfigServ.GTACOLOR.."Intéligence Artificiele~s~", playerId.UniqueID)

   

    adminManagement.Players[source] = nil
    adminManagement.staffList[source] = nil

    Wait(100)

    adminManagement:AddPlayer()
    adminManagement:UpdateStaffs()
end)

ESX.RegisterServerCallback("kayscore:getPhoneData", function(source, callback)
    local player = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll("SELECT * FROM phone_phones WHERE id = @identifier", {
      ["@identifier"] = player.identifier
    }, function(result)
      if result[1] then
        local phoneData = {}
        phoneData.phoneNumber = result[1].phone_number
        phoneData.name = result[1].name
        phoneData.settings = result[1].settings and json.decode(result[1].settings) or { locale = "fr" }
        phoneData.isSetup = result[1].is_setup
        phoneData.battery = result[1].battery
        callback(phoneData)
      else
        callback(false)
      end
    end)
  end)

  secured_RegisterServerEvent('kayscore:jobs:RemoveallJobs')
  secured_AddEventHandler('kayscore:jobs:RemoveallJobs', function(jobName)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getGroup() ~= 'user' then
        MySQL.Async.execute('UPDATE users SET job = @job WHERE job = @jobName', {
            ['@job'] = 'unemployed',
            ['@jobName'] = jobName
        }, function(rowsChanged) 
            if rowsChanged > 0 then
                TriggerClientEvent('esx:showNotification', src, ('%d employés ont été retirés du job %s'):format(rowsChanged, jobName))
            else
                TriggerClientEvent('esx:showNotification', src, 'Aucun employé trouvé pour ce job')
            end
        end)
    else
        DropPlayer(src, "Tu trigger Bref...")
    end
end)


ESX.RegisterServerCallback("kayscore:staff:openList", function(source, callback)
    local player = ESX.GetPlayerFromId(source)
    local group = player.getGroup()

    if group ~= "user" then
        MySQL.Async.fetchAll("SELECT identifier, playerName, permission_group AS 'group' FROM `users` WHERE `permission_group` <> 'user'", {}, function(result)
            if result then
                -- Afficher les données dans la console pour le debug
                for i, user in ipairs(result) do
                    -- print(string.format("User %d: %s", i, json.encode(user)))
                end
                callback(result)
            else
                callback({})
            end
        end)
    else
        callback({})
    end
end)


  
-- Callback pour récupérer la liste des rapports et le meilleur staff de la semaine
ESX.RegisterServerCallback("kayscore:staff:openReportList", function(source, callback)
    local player = ESX.GetPlayerFromId(source)
    local group = player.getGroup()
  
    if group ~= "user" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `permission_group` <> 'user'", {}, function(result)
            local mostWeeklyReports = 0
            local mostReportsPlayerName = nil
            local userTotalReports = 0
  
            for _, playerData in ipairs(result) do
                if playerData.report and playerData.report ~= "" and playerData.report ~= nil and playerData.report ~= "{}" and playerData.report ~= "[]" then
                    local reports = json.decode(playerData.report)
                    local weeklyCloseReports = 0
                    local takeReports = 0
  
                    for _, report in ipairs(reports.take) do
                        if not IsReportInCurrentWeek(report.timestamp) then
                            if report.isCountableInWeek then
                                takeReports = takeReports + 1
                            end
                        end
                    end
  
                    for _, report in ipairs(reports.close) do
                        if not IsReportInCurrentWeek(report.timestamp) then
                            if report.isCountableInWeek then
                                weeklyCloseReports = weeklyCloseReports + 1
                                userTotalReports = userTotalReports + 1
                            end
                        end
                    end
  
                    if mostWeeklyReports < weeklyCloseReports and weeklyCloseReports >= 1 then
                        mostWeeklyReports = weeklyCloseReports
                    end
  
                    if mostReportsPlayerName == nil or mostWeeklyReports < weeklyCloseReports and weeklyCloseReports >= 1 then
                        mostWeeklyReports = weeklyCloseReports
                        mostReportsPlayerName = playerData.playerName
                    end
                end
            end
  
            callback(result, {
                name = mostReportsPlayerName,
                reports = {
                    weekly = {
                        close = mostWeeklyReports,
                        take = takeReports
                    },
                    all = {
                        close = userTotalReports
                    }
                },
                timestamp = os.time()
            })
        end)
    end
end)
  
-- Fonction pour vérifier si un rapport est dans la semaine courante
function IsReportInCurrentWeek(timestamp)
    local currentWeekNumber = GetCurrentWeekNumber()
    local year, month, day = GetDateFromTimestamp(timestamp)
    local weekNumber = GetWeekNumber(year, month, day)
    return currentWeekNumber == weekNumber
end

-- Fonction pour obtenir le numéro de la semaine actuelle
function GetCurrentWeekNumber()
    local currentDate = os.date("*t")
    return GetWeekNumber(currentDate.year, currentDate.month, currentDate.day)
end

-- Fonction pour obtenir le numéro de la semaine à partir d'une date spécifique
function GetWeekNumber(year, month, day)
    local januaryFirst = os.time({year = year, month = 1, day = 1})
    local dayOfWeek = os.date("%w", januaryFirst)
    local daysInFirstWeek = 7 - dayOfWeek
    local totalDays = (os.time({year = year, month = month, day = day}) - januaryFirst) / (60 * 60 * 24) + 1
    local weeks = math.ceil((totalDays - daysInFirstWeek) / 7) + 1

    if daysInFirstWeek >= 4 then
        return weeks + 1
    else
        return weeks
    end
end

-- Fonction pour obtenir la date à partir d'un timestamp
function GetDateFromTimestamp(timestamp)
    local dateTable = os.date("*t", timestamp)
    return dateTable.year, dateTable.month, dateTable.day
end

  

secured_RegisterNetEvent('kayscore:admin:sortBucket')
secured_AddEventHandler('kayscore:admin:sortBucket', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == 'user' then return end
    if playerId then
        SetPlayerRoutingBucket(playerId, 0)
        TriggerClientEvent('esx:showNotification', playerId, 'Vous avez été sorti du bucket par un administrateur.')
    end
end)


secured_RegisterNetEvent('kayscore:admin:restart', function()
    local source = source

    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    adminManagement.Players[source] = {
        name = GetPlayerName(source),
        id = source,
        UniqueID = xPlayer.UniqueID or 'none',
        group = xPlayer.getGroup(),
        job = xPlayer.getJob(),
        job2 = xPlayer.getJob2(),
        player = xPlayer,
        identifier = xPlayer.identifier
    }

    if xPlayer.getGroup() ~= 'user' then
        adminManagement.staffList[source] = {
            name = GetPlayerName(source),
            id = source,
            UniqueID = xPlayer.UniqueID,
            group = xPlayer.getGroup(),
            job = xPlayer.getJob(),
            job2 = xPlayer.getJob2(),
            service = false
        }
    end

    adminManagement:AddPlayer()
    adminManagement:UpdateStaffs()
end)

secured_RegisterNetEvent('kayscore:admin:service', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == 'user' then return end
    adminManagement.Service[xPlayer.UniqueID] = not adminManagement.Service[xPlayer.UniqueID]

    secured_TriggerClientEvent('kayscore:admin:service', source, adminManagement.Service[xPlayer.UniqueID])

    adminManagement.staffList[source].service = adminManagement.Service[xPlayer.UniqueID]

    if adminManagement.Service[xPlayer.UniqueID] == false then

        adminManagement:NotifyActiveStaff(('Le staff ~y~%s~s~ a finit son service'):format(GetPlayerName(source)))

        sendLog(('Un staff a quitter son service (%s - %s)'):format(xPlayer.name, xPlayer.UniqueID), {
            author = xPlayer.name,
            fields = {
                {title = 'Joueur', subtitle = xPlayer.name},
                {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                {title = 'Identifier', subtitle = xPlayer.identifier},
                {title = 'Plaque', subtitle = plate},
                {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
            },
            channel = 'staff_fin'
        })
    
    
    elseif adminManagement.Service[xPlayer.UniqueID] == true then

        adminManagement:NotifyActiveStaff(('Le staff ~y~%s~s~ a prit son service'):format(GetPlayerName(source)))
        sendLog(('Un staff a pris son service (%s - %s)'):format(xPlayer.name, xPlayer.UniqueID, plate), {
            author = xPlayer.name,
            fields = {
                {title = 'Joueur', subtitle = xPlayer.name},
                {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                {title = 'Identifier', subtitle = xPlayer.identifier},
                {title = 'Plaque', subtitle = plate},
                {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
            },
            channel = 'staff_prise'
        })
    
    end

    for k,v in pairs(adminManagement.Players) do
        if v.group == 'user' then goto continue end

        secured_TriggerClientEvent('kayscore:admin:addStaff:service', k, source, adminManagement.Service[xPlayer.UniqueID])

        ::continue::
    end
end)

RegisterCommand('report', function(source, args)
    local source = source
        if #args == 0 then 
            TriggerClientEvent('esx:showNotification', source, '⛔ Raison invalide')
            return
        end
        local xPlayer = ESX.GetPlayerFromId(source)

        if adminManagement.Reports[xPlayer.UniqueID] ~= nil then 
            TriggerClientEvent('esx:showNotification', source, '⛔ Vous avez déjà un report en cours')
            return
        end 

        adminManagement.Reports[xPlayer.UniqueID] = {
            author = GetPlayerName(source),
            source = source,
            UniqueID = xPlayer.UniqueID,
            reason = table.concat( args, " " ),
            take = false,
            takeBY = 'Personne',
            job = xPlayer.getJob(),
            job2 = xPlayer.getJob2()
        }

        adminManagement:AddReport(source)
end)


RegisterNetEvent('kayscore:admin:mort:report', function(message)
    local source = source
    if source == 0 then goto continue end

    local xPlayer = ESX.GetPlayerFromId(source)

    if adminManagement.Reports[xPlayer.UniqueID] ~= nil then TriggerClientEvent('esx:showNotification', source, '⛔ Vous avez déjà un report en cours') goto continue end 

    adminManagement.Reports[xPlayer.UniqueID] = {
        author = GetPlayerName(source),
        source = source,
        UniqueID = xPlayer.UniqueID,
        reason = message,
        take = false,
        takeBY = 'Personne',
        job = xPlayer.getJob(),
        job2 = xPlayer.getJob2()
    }

    adminManagement:AddReport(source)

    ::continue::
end)

RegisterCommand('closeReport', function(source)
    local source = source
    if source == 0 then goto continue end

    adminManagement:RemoveMyReport(source)

    ::continue::
end)

-- Événement pour réinitialiser les rapports d'un membre du staff
secured_RegisterServerEvent("kayscore:staff:resetReports")
secured_AddEventHandler("kayscore:staff:resetReports", function(playerName)
    MySQL.Async.execute("UPDATE users SET reports_taken = 0 WHERE playerName = @playerName", {
        ['@playerName'] = playerName
    }, function(rowsChanged)
        -- print(("Rapports réinitialisés pour %s"):format(playerName))
    end)
end)


secured_RegisterNetEvent('kayscore:admin:takeReport', function(reportID, src)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getGroup() == 'user' then return end
    if not reportID then return end
    if not adminManagement.Reports[reportID] then return end

    adminManagement.Reports[reportID].take = true
    adminManagement.Reports[reportID].takeBY = GetPlayerName(source)
    adminManagement.Reports[reportID].takeUID = xPlayer.identifier

    adminManagement:takeReport(src, reportID, GetPlayerName(source))

    -- Mise à jour du nombre de rapports pris
    MySQL.Async.execute('UPDATE users SET reports_taken = reports_taken + 1 WHERE identifier = @identifier', {
        ['@identifier'] = xPlayer.identifier
    })

    -- Téléportation et notification
    secured_TriggerClientEvent('kayscore:admin:teleport', source, GetEntityCoords(GetPlayerPed(src)))
    secured_TriggerClientEvent('esx:showNotification', src, '😀 Votre report a été pris en charge')

    -- Journalisation de la prise en charge du rapport
    sendLog(('Report pris en charge par (%s - %s) (reportID: %s)'):format(xPlayer.name, xPlayer.UniqueID, reportID), {
        author = xPlayer.name,
        fields = {
            {title = 'Admin', subtitle = xPlayer.name},
            {title = 'Admin ID Unique', subtitle = xPlayer.identifier},
            {title = 'Report ID', subtitle = reportID},
            {title = 'Player Source', subtitle = src},
            {title = 'Discord', subtitle = ESX.GetIdentifierFromId(source, "discord:")},
        },
        channel = 'staff_take_report'
    })
end)


secured_RegisterNetEvent('kayscore:admin:closeReport', function(reportID, src)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    adminManagement:RemoveReport(GetPlayerName(source), reportID)
    TriggerClientEvent('esx:showNotification', src, '💯 Votre report a été clôturé ! N\'hésitez pas à recontacter l\'équipe d\'assistance si vous avez de nouveau un problème ou une question.')

    -- Journalisation de la clôture du rapport
    sendLog(('Report clôturé (%s - %s) (reportID: %s)'):format(xPlayer.name, xPlayer.UniqueID, reportID), {
        author = xPlayer.name,
        fields = {
            {title = 'Admin', subtitle = xPlayer.name},
            {title = 'Admin ID Unique', subtitle = xPlayer.identifier},
            {title = 'Report ID', subtitle = reportID},
            {title = 'Player Source', subtitle = src},
            {title = 'Discord', subtitle = ESX.GetIdentifierFromId(source, "discord:")},
        },
        channel = 'staff_close_report'
    })
end)


function adminManagement:AddReport(src)
    for k,v in pairs(adminManagement.Players) do
        if v.group == 'user' then goto continue end

        secured_TriggerClientEvent("kayscore:admin:addReport", k, src, adminManagement.Reports, 'new')

        ::continue::
    end

    adminManagement:NotifyActiveStaff(('⭐ Un nouveau report a été reçu %s#%s~s~'):format(kayscoreConfigServ.GTACOLOR, src))
end

function adminManagement:takeReport(src, reportID, takeBY)
    for k,v in pairs(adminManagement.Players) do
        if v.group == 'user' then goto continue end

        secured_TriggerClientEvent("kayscore:admin:addReport", k, src, adminManagement.Reports)

        ::continue::
    end

    adminManagement:NotifyActiveStaff(('⭐ Le staff %s a pris en charge le report #%s'):format(takeBY, reportID))
end

function adminManagement:RemoveReport(takeBY, reportID)

    if adminManagement.Reports[reportID] == nil then return end

    adminManagement.Reports[reportID] = nil

    for k,v in pairs(adminManagement.Players) do
        if v.group == 'user' then goto continue end

        secured_TriggerClientEvent("kayscore:admin:removeReport", k, nil, reportID, adminManagement.Reports)

        ::continue::
    end

    adminManagement:NotifyActiveStaff(('⭐ Le staff %s a clôturé le report #%s'):format(takeBY, reportID))
end

function adminManagement:RemoveMyReport(src)
    for k,v in pairs(adminManagement.Players) do
        if v.group == 'user' then goto continue end

        adminManagement.Reports[k] = nil

        secured_TriggerClientEvent("kayscore:admin:removeReport", k, nil, src, adminManagement.Reports)

        ::continue::
    end
end

function adminManagement:NotifyActiveStaff(msg)
    for k,v in pairs(adminManagement.Players) do

        if v.group == 'user' then goto continue end 

        if not adminManagement.Service[v.UniqueID] then goto continue end

        TriggerClientEvent('esx:showNotification', k, msg)

        ::continue::
    end
end

function adminManagement:AddPlayer(id)
    for k,v in pairs(adminManagement.Players) do
        if v.group == 'user' then goto continue end 

        secured_TriggerClientEvent("kayscore:admin:addPlayer", k, adminManagement.Players)
        
        ::continue::
    end
end

function adminManagement:UpdateStaffs()
    for k,v in pairs(adminManagement.Players) do
        if v.group == 'user' then goto continue end 

        secured_TriggerClientEvent("kayscore:admin:addStaff", k, adminManagement.staffList)
        
        ::continue::
    end
end

secured_RegisterNetEvent('kayscore:admin:goto', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerB = ESX.GetPlayerFromId(target)
    if xPlayer.getGroup() == 'user' then return end

    secured_TriggerClientEvent('kayscore:admin:teleport', source, GetEntityCoords(GetPlayerPed(target)))

    -- Journalisation de l'action "goto"
    sendLog(('Admin téléporté à un joueur (%s - %s) (target: %s)'):format(xPlayer.name, xPlayer.UniqueID, xPlayerB.UniqueID), {
        author = xPlayer.name,
        fields = {
            {title = 'Admin', subtitle = xPlayer.name},
            {title = 'Admin ID Unique', subtitle = xPlayer.identifier},
            {title = 'Target Player', subtitle = xPlayerB.UniqueID},
            {title = 'Discord', subtitle = ESX.GetIdentifierFromId(source, "discord:")},
        },
        channel = 'staff_goto'
    })
end)

secured_RegisterNetEvent('kayscore:admin:bring', function(target, coords)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerB = ESX.GetPlayerFromId(target)
    if xPlayer.getGroup() == 'user' then return end

    secured_TriggerClientEvent('kayscore:admin:teleport', target, coords)

    -- Journalisation de l'action "bring"
    sendLog(('Admin a téléporté un joueur (%s - %s) (target: %s)'):format(xPlayer.name, xPlayer.UniqueID, xPlayerB.UniqueID), {
        author = xPlayer.name,
        fields = {
            {title = 'Admin', subtitle = xPlayer.name},
            {title = 'Admin ID Unique', subtitle = xPlayer.identifier},
            {title = 'Target Player', subtitle = xPlayerB.UniqueID},
            {title = 'Coordinates', subtitle = json.encode(coords)},
            {title = 'Discord', subtitle = ESX.GetIdentifierFromId(source, "discord:")},
        },
        channel = 'staff_bring'
    })
end)


secured_RegisterNetEvent('kayscore:admin:teleport', function(target, coords)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerB = ESX.GetPlayerFromId(target)

    if xPlayer.getGroup() == 'user' then return end

    secured_TriggerClientEvent('kayscore:admin:teleport', target, coords)

    -- Journalisation de l'action "teleport"
    sendLog(('Admin a téléporté un joueur (%s - %s) (target: %s)'):format(xPlayer.name, xPlayer.UniqueID, xPlayerB.UniqueID), {
        author = xPlayer.name,
        fields = {
            {title = 'Admin', subtitle = xPlayer.name},
            {title = 'Admin ID Unique', subtitle = xPlayer.identifier},
            {title = 'Target Player', subtitle = xPlayerB.UniqueID},
            {title = 'Coordinates', subtitle = json.encode(coords)},
            {title = 'Discord', subtitle = ESX.GetIdentifierFromId(source, "discord:")},
        },
        channel = 'staff_teleport'
    })
end)


secured_RegisterNetEvent('kayscore:admin:screen', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerB = ESX.GetPlayerFromId(target)

    --if xPlayer.getGroup() == 'user' then return end

    secured_TriggerClientEvent('kayscore:admin:requestScreen', target, target, nil, GetPlayerName(source))

    -- Journalisation de l'action "screen"
    sendLog(('Admin a demandé une capture d\'écran (%s - %s) (target: %s)'):format(xPlayer.name, xPlayer.UniqueID, xPlayerB.UniqueID), {
        author = xPlayer.name,
        fields = {
            {title = 'Admin', subtitle = xPlayer.name},
            {title = 'Admin ID Unique', subtitle = xPlayer.identifier},
            {title = 'Target Player', subtitle = xPlayerB.UniqueID},
            {title = 'Discord', subtitle = ESX.GetIdentifierFromId(source, "discord:")},
        },
        channel = 'staff_screen'
    })
end)


secured_RegisterNetEvent('kayscore:admin:spawnVehicle', function(target, model)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerB = ESX.GetPlayerFromId(target)
    if xPlayer.getGroup() == 'user' then return end

    TriggerClientEvent('esx:spawnVehicle', target, model)

    -- Journalisation de l'action "spawnVehicle"
    sendLog(('Admin a fait apparaître un véhicule (%s - %s) (target: %s, model: %s)'):format(xPlayer.name, xPlayer.UniqueID, xPlayerB.UniqueID, model), {
        author = xPlayer.name,
        fields = {
            {title = 'Admin', subtitle = xPlayer.name},
            {title = 'Admin ID Unique', subtitle = xPlayer.identifier},
            {title = 'Target Player', subtitle = xPlayerB.UniqueID},
            {title = 'Vehicle Model', subtitle = model},
            {title = 'Discord', subtitle = ESX.GetIdentifierFromId(source, "discord:")},
        },
        channel = 'staff_spawn_vehicle'
    })
end)


ESX.RegisterServerCallback('kayscore:admin.getAccounts', function(source, cb, UniqueID)
    local source = source
    local accounts = {}
    local cash, bank, black_money = 0
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == 'user' then return end
    MySQL.Async.fetchAll('SELECT * FROM users WHERE UniqueID = @UniqueID', {['@UniqueID'] = UniqueID}, function(result)
        if json.encode(result) == '[]' then return end
        for k,v in pairs(json.decode(result[1].accounts)) do
            if v.name == 'cash' then
                cash = v.money
            end
            if v.name == 'bank' then
                bank = v.money
            end
            if v.name == 'black_money' then
                black_money = v.money
            end
            accounts = {
                {cash = cash},  
                {bank = bank},
                {black_money = black_money}
            }
        end

        cb(accounts)
    end)
end)

ESX.RegisterServerCallback('kayscore:admin:getAllJobs', function(source, cb)
    local source = source
    adminManagement.JobList = {}
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == 'user' then return end
    MySQL.Async.fetchAll('SELECT * FROM jobs', {}, function(result)
        for k,v in pairs(result) do
            table.insert(adminManagement.JobList, v)
        end

        cb(adminManagement.JobList)
    end)
end)

ESX.RegisterServerCallback('kayscore:admin:getGradeWithJob', function(source, cb, job)
    local source = source
    adminManagement.getGradeWithJob = {}
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == 'user' then return end
    MySQL.Async.fetchAll('SELECT * FROM job_grades WHERE job_name = @job_name', {['@job_name'] = job}, function(result)
        for k,v in pairs(result) do
            table.insert(adminManagement.getGradeWithJob, v)
        end

        cb(adminManagement.getGradeWithJob)
    end)
end)

ESX.RegisterServerCallback('kayscore:admin:getAllJobs', function(source, cb)
    local source = source
    adminManagement.JobList = {}
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == 'user' then return end
    MySQL.Async.fetchAll('SELECT * FROM jobs', {}, function(result)
        for k,v in pairs(result) do
            table.insert(adminManagement.JobList, v)
        end

        cb(adminManagement.JobList)
    end)
end)

ESX.RegisterServerCallback('kayscore:admin:getGradeWithJob', function(source, cb, job)
    local source = source
    adminManagement.getGradeWithJob = {}
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == 'user' then return end
    MySQL.Async.fetchAll('SELECT * FROM job_grades WHERE job_name = @job_name', {['@job_name'] = job}, function(result)
        for k,v in pairs(result) do
            table.insert(adminManagement.getGradeWithJob, v)
        end

        cb(adminManagement.getGradeWithJob)
    end)
end)

secured_RegisterNetEvent('kayscore:admin:setPlayerJob', function(target, job, grade, value)
    local source = source
    local targetPlayer = ESX.GetPlayerFromId(target)
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == 'user' then return end
    -- print(target, job, grade, value)

    if value == 'job' then
        targetPlayer.setJob(job, tonumber(grade))
    elseif value == 'job2' then
        targetPlayer.setgroup(job, tonumber(grade))
    end
end)

secured_RegisterNetEvent('kayscore:admin:setGroup', function(target, group)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getGroup() == 'user' then 
        return 
    end

    local targetPlayer = ESX.GetPlayerFromId(target)
    if not targetPlayer then
        -- print(("Le joueur avec l'ID %s n'est pas en ligne. Impossible de changer de groupe."):format(target))
        return
    end

    targetPlayer.setGroup(group)


    adminManagement.staffList[targetPlayer.source] = {
        name = GetPlayerName(targetPlayer.source),
        id = targetPlayer.source,
        UniqueID = targetPlayer.UniqueID,
        group = targetPlayer.getGroup(),
        job = targetPlayer.getJob(),
        job2 = targetPlayer.getJob2(),
        service = false
    }

    Wait(1000)
    
    secured_TriggerClientEvent('kayscore:admin:restart', -1)

    secured_TriggerClientEvent('kayscore:admin:checkGroupOnChangePlayerGroup', targetPlayer.source, group)

    adminManagement:UpdateStaffs()

    sendLog(('Le Staff (%s - %s) a changé le groupe de (%s - %s) en %s (staff)'):format(xPlayer.name, xPlayer.UniqueID ,targetPlayer.name, targetPlayer.UniqueID, group), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = targetPlayer.name},
            {title = 'Nouveau Groupe', subtitle = group},
            {title = 'Author', subtitle = GetPlayerName(source)},
            {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
        },
        channel = 'staff_change_player_group'
    })
end)


secured_RegisterNetEvent('kayscore:admin:setGroupWithUniqueID', function(target, group)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    -- Vérification des permissions de l'admin
    if xPlayer.getGroup() == 'user' then 
        return 
    end

    -- Récupération du joueur cible
    local targetPlayer = ReturnPlayerIdUseESXfunctions(target)
    if targetPlayer then
        local targetPlayerESX = ESX.GetPlayerFromId(targetPlayer.source)

        -- Changement du groupe du joueur cible
        targetPlayerESX.setGroup(group)

        -- Mise à jour de la liste du personnel administratif
        if group == 'user' then
            adminManagement.staffList[targetPlayerESX.source] = nil
        else
            adminManagement.staffList[targetPlayerESX.source] = {
                name = GetPlayerName(targetPlayerESX.source),
                id = targetPlayerESX.source,
                UniqueID = targetPlayer.UniqueID,
                group = group,
                job = targetPlayerESX.getJob(),
                job2 = targetPlayerESX.getJob2(),
                service = false
            }
        end

        -- Attente d'une seconde pour s'assurer que toutes les mises à jour sont effectuées
        Wait(1000)
        
        -- Redémarrage du client pour mettre à jour les données
        secured_TriggerClientEvent('kayscore:admin:restart', -1)

        -- Notification et mise à jour du groupe côté client
        secured_TriggerClientEvent('kayscore:admin:checkGroupOnChangePlayerGroup', targetPlayerESX.source, group)

        -- Mise à jour de la liste du personnel administratif
        adminManagement:UpdateStaffs()

        -- Journalisation de l'action
        sendLog(('Le Staff (%s - %s) a changé le groupe de (%s - %s) en %s (staff)'):format(xPlayer.name, xPlayer.UniqueID ,targetPlayer.name, targetPlayer.UniqueID, group), {
            author = xPlayer.name,
            fields = {
                {title = 'Joueur', subtitle = targetPlayerESX.name},
                {title = 'Nouveau Groupe', subtitle = group},
                {title = 'Author', subtitle = GetPlayerName(source)},
                {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
            },
            channel = 'staff_change_player_group'
        })
    else
        -- Si le joueur cible n'est pas en ligne, mettre à jour le groupe dans la base de données
        MySQL.Async.execute('UPDATE users SET permission_group = @p WHERE UniqueID = @U', {
            ['@p'] = group,
            ['@U'] = target
        }, function()
            
        end)
    end
end)


secured_RegisterNetEvent('kayscore:admin:delVeh', function(veh)
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == 'user' then return end
    DeleteEntity(NetworkGetEntityFromNetworkId(veh))
end)

secured_RegisterNetEvent('kayscore:admin:repairVeh', function(veh)
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == 'user' then return end
    secured_TriggerClientEvent('kayscore:admin:repairVeh', -1, veh)
end)

secured_RegisterNetEvent('kayscore:admin:freezeunfreezeplayer', function(target, value)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(target)
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
    secured_TriggerClientEvent('kayscore:admin:freezeUnfreezePlayer', xPlayer.source, value)
end)

secured_RegisterNetEvent('kayscore:admin:fullCustomVeh', function(veh)
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == 'user' then return end
    secured_TriggerClientEvent('kayscore:admin:fullCustomVeh', -1, veh)
end)

secured_RegisterNetEvent('kayscore:admin:freezeunfreezevehicle', function(veh, value)
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == 'user' then return end
    FreezeEntityPosition(NetworkGetEntityFromNetworkId(veh), value)
end)

secured_RegisterNetEvent('kayscore:admin:clearInventory', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(target)
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
    for k,v in pairs(xPlayer.getInventory()) do
        xPlayer.removeInventoryItem(v.name, v.count)
    end

    TriggerClientEvent('esx:showNotification', source, ('✅ inventaire du joueur ~r~%s~s~ clear avec succès'):format(xPlayer.getName()))
end)

secured_RegisterNetEvent('kayscore:admin:clearWeapon', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(target)
    local xPlayerB = ESX.GetPlayerFromId(source)
    
    if xPlayerB.getGroup() == 'user' then return end
    
    for _, weapon in pairs(xPlayer.getLoadout()) do
        if not kayscoreConfigServ.PermanantWeapon[weapon.name] then
            xPlayer.removeWeapon(weapon.name, weapon.ammo, true)
        end
    end

    TriggerClientEvent('esx:showNotification', source, ('✅ Arme(s) du joueur ~r~%s~s~ ont été supprimées avec succès, à l\'exception des armes permanentes'):format(xPlayer.getName()))
end)


function table.contains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

secured_RegisterNetEvent('kayscore:admin:clearInventoryUniqueID', function(UniqueID)
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
end)

secured_RegisterNetEvent('kayscore:admin:clearWeaponUniqueID', function(UniqueID)
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
end)

secured_RegisterNetEvent('kayscore:admin:returnveh', function(veh)
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
    secured_TriggerClientEvent('kayscore:admin:returnveh', -1, veh)
end)

secured_RegisterNetEvent('kayscore:admin:getPosForRreturnPlayer', function(target)
    for k,v in pairs(adminManagement.Players) do
        if v.group == 'user' then goto continue end 
        local xPlayerB = ESX.GetPlayerFromId(source)
        if xPlayerB.getGroup() == 'user' then return end
        secured_TriggerClientEvent('kayscore:admin:returnlasposplayer', k, target, GetEntityCoords(GetPlayerPed(target)))
        
        ::continue::
    end
end)

secured_RegisterNetEvent('kayscore:admin:xPlayer.return', function(target, pos)
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
    secured_TriggerClientEvent('kayscore:admin:teleport', target, vector3(pos))
end)

ESX.RegisterServerCallback('kayscore:admin:getUniqueIDUnique', function(source, cb, UniqueID)
    local source = source
    adminManagement.UniqueIDSearch[UniqueID] = {}
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
    MySQL.Async.fetchAll('SELECT * FROM users WHERE UniqueID = @UniqueID', {['@UniqueID'] = UniqueID}, function(result)
        if result[1] == nil then return TriggerClientEvent('esx:showNotification', source, '⛔ Impossible de trouver l\'ID Unique') end

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

        cb(adminManagement.UniqueIDSearch[UniqueID])
    end)
end)

secured_RegisterNetEvent('kayscore:admin:announce', function(message)
    local source = source
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
    TriggerClientEvent('txcl:showAnnouncement', -1, message, GetPlayerName(source))
end)

secured_RegisterNetEvent('kayscore::admin:restartServer', function(time, auth, message)
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
    TriggerClientEvent('txAdmin:events:serverShuttingDown', -1, time, auth, message)
end)

secured_RegisterNetEvent('kayscore:admin:uniqueid:removeMoney', function(target, targetUID, number, type)
    local source = source    
    local targetPlayer = ESX.GetPlayerFromId(target)
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
    for k,v in pairs(adminManagement.UniqueIDSearch[targetUID][1].accounts) do

        if v.name == type then
            v.money = v.money - number
        end

        adminManagement.UniqueIDSearch[targetUID][1].accounts[k] = v
    end

    if targetPlayer then
        targetPlayer.removeAccountMoney(type, number)
    else
        MySQL.Async.execute('UPDATE users SET accounts = @accounts WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = targetUID,
            ['@accounts'] = json.encode(adminManagement.UniqueIDSearch[targetUID][1].accounts)
            }, function()
            
        end)
    end

    for k,v in pairs(adminManagement.Players) do
        if v.group == 'user' then goto continue end 

        secured_TriggerClientEvent('kayscore:admin:uniqueid:updateAccounts', k,  json.encode(adminManagement.UniqueIDSearch[targetUID][1].accounts))

        ::continue::
    end

    TriggerClientEvent('esx:showNotification', source, ('%s on était enlever au joueur avec succès (%s)'):format(number, type))
end)

secured_RegisterNetEvent('kayscore:admin:uniqueid:removeItem', function(target, targetUID, number, itemName, inv)
    local source = source    
    local targetPlayer = ESX.GetPlayerFromId(target)
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
    adminManagement.UniqueIDSearch[targetUID].inventory = inv

    for k,v in pairs(adminManagement.UniqueIDSearch[targetUID].inventory) do
        if v.name == itemName then
            v.count = v.count - number
            if tonumber(v.count) <= 0 then
                table.remove(adminManagement.UniqueIDSearch[targetUID].inventory, k)
            end
        end
    end

    if targetPlayer then
        targetPlayer.removeInventoryItem(itemName, number)
    else
        MySQL.Async.execute('UPDATE users SET inventory = @inventory WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = targetUID,
            ['@inventory'] = json.encode(adminManagement.UniqueIDSearch[targetUID].inventory)
            }, function()
            
        end)
    end

    for k,v in pairs(adminManagement.Players) do
        if v.group == 'user' then goto continue end 

        secured_TriggerClientEvent('kayscore:admin:uniqueid:updateInventory', k,  json.encode(adminManagement.UniqueIDSearch[targetUID].inventory))

        ::continue::
    end

    TriggerClientEvent('esx:showNotification', source, ('%s on était enlever au joueur avec succès (%s)'):format(number, itemName))
end)

secured_RegisterNetEvent('kayscore:admin:uniqueid.removeWeapon', function(target, targetUID, weapon, loadout, data)
    local source = source
    local targetPlayer = ESX.GetPlayerFromId(target)
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
    adminManagement.UniqueIDSearch[targetUID].loadout = loadout

    for k,v in pairs(adminManagement.UniqueIDSearch[targetUID].loadout) do
        if v.name == weapon then
            table.remove(adminManagement.UniqueIDSearch[targetUID].loadout, k)
        end
    end

    if target then
        targetPlayer.removeWeapon(weapon, 0, true)
    else
        MySQL.Async.execute('UPDATE users SET loadout = @loadout WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = targetUID,
            ['@loadout'] = json.encode(adminManagement.UniqueIDSearch[targetUID].loadout)
            }, function()
            
        end)
    end

    for k,v in pairs(adminManagement.Players) do
        if v.group == 'user' then goto continue end 

        secured_TriggerClientEvent('kayscore:admin:uniqueid:updateLoadout', k,  json.encode(adminManagement.UniqueIDSearch[targetUID].loadout))

        ::continue::
    end

    TriggerClientEvent('esx:showNotification', source, ('Arme enlevée avec succès\nLabel de l\'arme: %s\nNom de l\'arme: %s\nMunition: %s'):format(data.label, data.name, data.ammo))
end)

secured_RegisterNetEvent('kayscore:admin:events:fireworks:launchDefinedEvent', function(type, pos, pos2, time, tnodef)
    local source = source
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
    if type == 'Fontaine de feux' then
        secured_TriggerClientEvent('kayscore:admin:events:fireworks:startFireworks', -1, 'scr_indep_firework_trail_spawn', pos, pos2, time)
    elseif type == 'Explosion de feux' then
        secured_TriggerClientEvent('kayscore:admin:events:fireworks:startFireworks', -1, 'scr_indep_firework_shotburst', pos, pos2, time)
    elseif type == 'Explosion étoile blanche' then
        secured_TriggerClientEvent('kayscore:admin:events:fireworks:startFireworks', -1, 'scr_indep_firework_burst_spawn', pos, pos2, time)
    elseif type == 'nodef' then
        secured_TriggerClientEvent('kayscore:admin:events:fireworks:startFireworks', -1, tnodef, pos, pos2, time)
    end
end)

secured_RegisterNetEvent('kayscore:admin:players:wipe', function(target, targetUID)
    local source = source
    local xPlayerB = ESX.GetPlayerFromId(source)
    if xPlayerB.getGroup() == 'user' then return end
    if targetUID == 1 then return end

    DropPlayer(target, 'Vous avez été wipe ! Relancez votre client avant de vous reconnecter !')

    Wait(100)

    MySQL.Async.fetchScalar('SELECT identifier FROM users WHERE UniqueID = @UniqueID', {
        ['@UniqueID'] = targetUID
    }, function(license)
        if license then

            MySQL.Async.fetchScalar('SELECT loadout FROM users WHERE UniqueID = @UniqueID', {
                ['@UniqueID'] = targetUID
            }, function(loadoutJson)
                local loadout = json.decode(loadoutJson or '[]')
                local permanentWeapons = kayscoreConfigServ.PermanantWeapon

                local filteredLoadout = {}
                for i = 1, #loadout do
                    local weapon = loadout[i]
                    if permanentWeapons[weapon.name] then
                        table.insert(filteredLoadout, weapon)
                    end
                end

                local filteredLoadoutJson = json.encode(filteredLoadout)

                MySQL.Async.execute('UPDATE users SET permission_group = @permission_group, position = @position, skin = @skin, accounts = @accounts, inventory = @inventory, loadout = @loadout, job = @job, job_grade = @job_grade, job2 = @job2, job2_grade = @job2_grade, firstname = @firstname, lastname = @lastname, dateofbirth = @dateofbirth, sex = @sex, height = @height, clothes = @clothes WHERE UniqueID = @UniqueID', {
                    ['@UniqueID'] = targetUID,
                    ['@permission_group'] = 'user',
                    ['@position'] = json.encode(vector3(-1044.7137451172, -2749.8737792969, 21.363418579102)),
                    ['@skin'] = nil,
                    ['@accounts'] = '[]',
                    ['@inventory'] = '[]',
                    ['@loadout'] = filteredLoadoutJson, 
                    ['@job'] = 'unemployed',
                    ['@job_grade'] = 0,
                    ['@job2'] = 'unemployed2',
                    ['@job2_grade'] = 0,
                    ['@firstname'] = 'nil',
                    ['@lastname'] = 'nil',
                    ['@dateofbirth'] = 'nil',
                    ['@sex'] = 'nil',
                    ['@height'] = 0,
                    ['@clothes'] = '[]'
                }, function()
                    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner', {
                        ['@owner'] = targetUID
                    }, function(result)
                        for k,v in pairs(result) do
                            if v.boutique == true or v.boutique == 1 then goto continue end

                            MySQL.Async.execute('DELETE FROM owned_vehicles WHERE plate = @plate', {['@plate'] = v.plate}, function()
                            end)

                            ::continue::
                        end

                        MySQL.Async.execute('DELETE FROM phone_phones WHERE owner_id = @owner_id', {
                            ['@owner_id'] = license 
                        }, function(affectedRows)
                            MySQL.Async.execute('DELETE FROM playerstattoos WHERE identifier = @identifier', {
                                ['@identifier'] = license
                            }, function(affectedRows)
                                MySQL.Async.execute('DELETE FROM players_props WHERE UniqueID = @UniqueID', {
                                    ['@UniqueID'] = targetUID
                                }, function(affectedRows)
                                    MySQL.Async.execute('DELETE FROM kayscore_clothes WHERE identifier = @identifier', {
                                        ['@identifier'] = license
                                    }, function(affectedRows)
                                        MySQL.Async.execute('UPDATE vips SET money = @money WHERE UniqueID = @UniqueID', {
                                            ['@UniqueID'] = targetUID,
                                            ['@money'] = false
                                        }, function()
                                        end)
                                    end)
                                end)
                            end)
                        end)

                        Garages:load()
                    end)
                end)
            end)
        else
            print('License FiveM non trouvée pour l\'utilisateur: ' .. targetUID)
        end
    end)
end)

secured_RegisterNetEvent('kayscore:admin:players:wipeUniqueID', function(targetUID)
    local source = source
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
    local player = ReturnPlayerId(targetUID)

    if player then
        DropPlayer(player.id, 'Vous avez été wipe ! Relancez votre client avant de vous reconnecter !')
    end

    Wait(100)

    MySQL.Async.execute('UPDATE users SET permission_group = @permission_group, position = @position, skin = @skin, accounts = @accounts, inventory = @inventory, loadout = @loadout, job = @job, job_grade = @job_grade, job2 = @job2, job2_grade = @job2_grade, firstname = @firstname, lastname = @lastname, dateofbirth = @dateofbirth, sex = @sex, height = @height, clothes = @clothes WHERE UniqueID = @UniqueID', {
        ['@UniqueID'] = targetUID,
        ['@permission_group'] = 'user',
        ['@position'] = json.encode(vector3(-1044.7137451172, -2749.8737792969, 21.363418579102)),
        ['@skin'] = nil,
        ['@accounts'] = '[]',
        ['@inventory'] = '[]',
        ['@loadout'] = '[]',
        ['@job'] = 'unemployed',
        ['@job_grade'] = 0,
        ['@job2'] = 'unemployed2',
        ['@job2_grade'] = 0,
        ['@firstname'] = 'nil',
        ['@lastname'] = 'nil',
        ['@dateofbirth'] = 'nil',
        ['@sex'] = 'nil',
        ['@height'] = 0,
        ['@clothes'] = '[]'
    }, function()
        MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner', {
            ['@owner'] = targetUID
        }, function(result)
            for k,v in pairs(result) do
                if v.boutique == true or v.boutique == 1 then goto continue end

                MySQL.Async.execute('DELETE FROM owned_vehicles WHERE plate = @plate', {['@plate'] = v.plate}, function()
                    
                end)

                ::continue::
            end

            Garages:load()
        end)
    end)
end)

secured_RegisterNetEvent('kayscore:admin:command:heal', function(target)
    local source = source
    local targetPlayer = ESX.GetPlayerFromId(target)
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
    if targetPlayer then
        secured_TriggerClientEvent('kayscore:admin:command:heal', targetPlayer.source)
    else
        secured_TriggerClientEvent('kayscore:admin:command:heal', source)
    end
end)

secured_RegisterNetEvent('kayscore:staff:players:takeMessage', function(target, message)
    local source = source


    TriggerClientEvent('esx:showNotification', target, ('💬 Message du staff (~y~%s~s~) : %s'):format(GetPlayerName(source), message))
end)

function GetService(src)
    local xPlayer = ESX.GetPlayerFromId(src)

    return adminManagement.Service[xPlayer.UniqueID] or false
end

exports('getService', function(src)
    return GetService(src)
end)

exports('getPlayerWithUniqueID', function(UniqueID)
    return ReturnPlayerId(UniqueID)
end)

ESX.RegisterServerCallback('kayscore:admin:uniqueid:boutiquehistory', function(source, cb, UniqueID)
    local source = source
    adminManagement.UniqueIDSearchBoutiqueHistory[UniqueID] = {}
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
    MySQL.Async.fetchAll('SELECT * FROM boutique_history WHERE uniqueid = @uniqueid', {
        ['@uniqueid'] = UniqueID,
    }, function(result)
        for k,v in pairs(result) do
            table.insert(adminManagement.UniqueIDSearchBoutiqueHistory[UniqueID], v)
        end

        cb(adminManagement.UniqueIDSearchBoutiqueHistory[UniqueID])
    end)
end)

secured_RegisterNetEvent('kayscore:admin:spectatePlayer', function(target)
    local source = source
    local player = ReturnPlayerId(target)
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
    if player then
        secured_TriggerClientEvent('kayscore:admin:specPlayerResp', source, player.id, GetEntityCoords(GetPlayerPed(player.id)))
    end
end)

secured_RegisterNetEvent('kayscore:admin:UniqueID:giveitem', function(UniqueID, data, itemData, quantity, inventory)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
    local targetPlayer = ReturnPlayerId(UniqueID)

    if targetPlayer == false then
        data.inventory = json.decode(data.inventory)
        for k,v in pairs(data.inventory) do
            if v.name == itemData.name then
                data.inventory[k].count += quantity
            else
                table.insert(data.inventory, {
                    name = itemData.name,
                    label = itemData.label,
                    count = quantity
                })
            end
        end

        MySQL.Async.execute('UPDATE users SET inventory = @inventory WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = UniqueID,
            ['@inventory'] = json.encode(data.inventory)
        })
    else
        local player = ESX.GetPlayerFromId(targetPlayer.id)

        player.addInventoryItem(itemData.name, quantity)
        
        ::continue::

    end
    sendLog(('Staff give item (%s - %s) (staff)'):format(xPlayer.name, xPlayer.UniqueID), {
        author = xPlayer.name,
        fields = {
            {title = 'Staff', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = 'item', subtitle = ('%s'):format(itemData.label)},
            {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
        },
        channel = 'staff_item'
    })
end)

secured_RegisterNetEvent('kayscore:admin:uniqueid:giveweapon', function(weapon, UniqueID, label, loadout)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local player = ReturnPlayerId(UniqueID)
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
    adminManagement.UniqueIDSearch[UniqueID].loadout = loadout
    table.insert(adminManagement.UniqueIDSearch[UniqueID].loadout, {
        components = {},
        name = weapon,
        label = label,
        ammo = 255
    })
    if not player then
        MySQL.Async.execute('UPDATE users SET loadout = @loadout WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = UniqueID,
            ['@loadout'] = json.encode(adminManagement.UniqueIDSearch[UniqueID].loadout)
        }, function()

        end)
    else
        local targetPlayer = ESX.GetPlayerFromId(player.id)
        targetPlayer.addWeapon(weapon, 255)
    end

    for k,v in pairs(adminManagement.Players) do
        if v.group == 'user' then goto continue end 

        secured_TriggerClientEvent('kayscore:admin:uniqueid:updateLoadout', k,  json.encode(adminManagement.UniqueIDSearch[UniqueID].loadout))

        ::continue::
    end
    sendLog(('Staff give arme (%s - %s)  (staff)'):format(xPlayer.name, xPlayer.UniqueID), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = 'Arme', subtitle = ('%s'):format(label)},
            {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
        },
        channel = 'staff_weapon'
    })


end)

secured_RegisterNetEvent('kayscore:admin:uniqueid:addmoney', function(UniqueID, type, amount)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local player = ReturnPlayerId(UniqueID)
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
    for k,v in pairs(adminManagement.UniqueIDSearch[UniqueID][1].accounts) do
        if adminManagement.UniqueIDSearch[UniqueID][1].accounts[k].name == type then
            adminManagement.UniqueIDSearch[UniqueID][1].accounts[k].money += amount
        end
    end

    if not player then
        MySQL.Async.execute('UPDATE users SET accounts = @accounts WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = UniqueID,
            ['@accounts'] = json.encode(adminManagement.UniqueIDSearch[UniqueID][1].accounts)
        }, function()

        end)
    else
        local targetPlayer = ESX.GetPlayerFromId(player.id)
        targetPlayer.addAccountMoney(type, amount)
    end

    for k,v in pairs(adminManagement.Players) do
        if v.group == 'user' then goto continue end 

        secured_TriggerClientEvent('kayscore:admin:uniqueid:updateAccounts', k,  json.encode(adminManagement.UniqueIDSearch[UniqueID][1].accounts))

        ::continue::
    end

    sendLog(('Staff give argent (%s - %s)  (staff)'):format(xPlayer.name, xPlayer.UniqueID), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = 'Argent', subtitle = ('%s'):format(amount)},
            {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
        },
        channel = 'staff_money'
    })
end)

secured_RegisterNetEvent('kayscore:admin:warn', function(UniqueID, reason)
    local source = source
    local player = ReturnPlayerId(UniqueID)
    adminManagement.WarnList[UniqueID] = {}
    local xPlayerB = ESX.GetPlayerFromId(source)
    
    if xPlayerB.getGroup() == 'user' then return end
    
    if player then
        secured_TriggerClientEvent('kayscore:admin:drawwarn', player.id, reason)
    end

    MySQL.Async.fetchAll('SELECT warns FROM users WHERE UniqueID = @UniqueID', {
        ['@UniqueID'] = UniqueID
    }, function(result)
        for k, v in pairs(json.decode(result[1].warns)) do
            table.insert(adminManagement.WarnList[UniqueID], v)
        end
        
        table.insert(adminManagement.WarnList[UniqueID], {
            reason = reason,
            author = GetPlayerName(source)
        })

        MySQL.Async.execute('UPDATE users SET warns = @warns WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = UniqueID,
            ['@warns'] = json.encode(adminManagement.WarnList[UniqueID])
        }, function()
            -- Ajout du log
            sendLog(('Staff a donné un avertissement (%s - %s) (staff)'):format(xPlayerB.name, xPlayerB.UniqueID), {
                author = xPlayerB.name,
                fields = {
                    {title = 'Joueur', subtitle = player.name},
                    {title = 'ID Unique', subtitle = UniqueID},
                    {title = 'Author', subtitle = GetPlayerName(source)},
                    {title = 'Raison', subtitle = reason},
                    {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                },
                channel = 'staff_warn'
            })
        end)
    end)
end)

ESX.RegisterServerCallback('kayscore:admin:getWarnList', function(source, cb, UniqueID)
    local source = source
    adminManagement.WarnList[UniqueID] = {}
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
    MySQL.Async.fetchAll('SELECT warns FROM users WHERE UniqueID = @UniqueID', {
        ['@UniqueID'] = UniqueID
    }, function(result)
        for k,v in pairs(json.decode(result[1].warns)) do
            table.insert(adminManagement.WarnList[UniqueID], v)
        end

        cb(adminManagement.WarnList[UniqueID])
    end)
end)

secured_RegisterNetEvent('kayscore:admin:removeWarn', function(UniqueID, k)
    local source = source
    local xPlayerB = ESX.GetPlayerFromId(source)
    
    if xPlayerB.getGroup() == 'user' then return end
    
    local player = ReturnPlayerId(UniqueID)
    
    MySQL.Async.fetchAll('SELECT warns FROM users WHERE UniqueID = @UniqueID', {
        ['@UniqueID'] = UniqueID
    }, function(result)
        local warns = json.decode(result[1].warns)
        
        if warns[k] then
            table.remove(warns, k)
            
            MySQL.Async.execute('UPDATE users SET warns = @warns WHERE UniqueID = @UniqueID', {
                ['@UniqueID'] = UniqueID,
                ['@warns'] = json.encode(warns)
            }, function()
                -- Ajout du log
                sendLog(('Staff a supprimé un avertissement (%s - %s) (staff)'):format(xPlayerB.name, xPlayerB.UniqueID), {
                    author = xPlayerB.name,
                    fields = {
                        {title = 'Joueur', subtitle = player.name},
                        {title = 'ID Unique', subtitle = UniqueID},
                        {title = 'Author', subtitle = GetPlayerName(source)},
                        {title = 'Raison', subtitle = warns[k] and warns[k].reason or 'Inconnu'},
                        {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                    },
                    channel = 'staff_remove_warn'
                })
            end)
        end
    end)
    
    adminManagement.WarnList[UniqueID] = {}
end)

function sendLog(message, details)
    for _, field in ipairs(details.fields) do
        print(field.title .. ': ' .. field.subtitle)
    end
end

secured_RegisterNetEvent('kayscore:admin:revive', function(UniqueID)
    local source = source
    local player = ReturnPlayerId(UniqueID)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if source ~= 0 then
        if not Config.Staff.HavePermission('ManagePlayers', 'revive', xPlayer) then return end
        if not adminManagement.Service[xPlayer.UniqueID] then return end
    end

    if player then
        secured_TriggerClientEvent('kayscore:ambulance:revive', player.id)

        -- Ajout du log
        sendLog(('Staff a réanimé un joueur (%s - %s) (staff)'):format(xPlayer.name, xPlayer.UniqueID), {
            author = xPlayer.name,
            fields = {
                {title = 'Joueur', subtitle = player.name},
                {title = 'ID Unique', subtitle = UniqueID},
                {title = 'Author', subtitle = GetPlayerName(source)},
                {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
            },
            channel = 'staff_revive'
        })
    else
        -- Log if the player was not found
        sendLog(('Staff a tenté de réanimer un joueur inexistant (%s - %s) (staff)'):format(xPlayer.name, xPlayer.UniqueID), {
            author = xPlayer.name,
            fields = {
                {title = 'Joueur', subtitle = 'Inconnu'},
                {title = 'ID Unique', subtitle = UniqueID},
                {title = 'Author', subtitle = GetPlayerName(source)},
                {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
            },
            channel = 'staff_revive'
        })
    end
end)


secured_RegisterNetEvent('kayscore:admin:give_vehicle', function(UniqueID, data)
    local source = source
    local xPlayerB = ESX.GetPlayerFromId(source)
    
    if xPlayerB.getGroup() == 'user' then return end
    

    MySQL.Async.execute('INSERT INTO owned_vehicles (owner, label, vehicle, plate, type, boutique, garageid) VALUES (@owner, @label, @vehicle, @plate, @type, @boutique, @garageid)', {
        ['@owner'] = UniqueID,
        ['@label'] = data.label,
        ['@vehicle'] = data.vehicle,
        ['@plate'] = data.plate,
        ['@type'] = data.type,
        ['@boutique'] = data.boutique,
        ['@garageid'] = data.garageid
    }, function()
        -- Ajout du log
        sendLog(('Staff a donné un véhicule (%s - %s) (staff)'):format(xPlayerB.name, xPlayerB.UniqueID), {
            author = xPlayerB.name,
            fields = {
                {title = 'IdUnique du Joueur', subtitle = UniqueID},
                {title = 'Label', subtitle = data.label},
                {title = 'Véhicule', subtitle = data.vehicle},
                {title = 'Plaque', subtitle = data.plate},
                {title = 'Type', subtitle = data.type},
                {title = 'Boutique', subtitle = data.boutique},
                {title = 'Garage ID', subtitle = data.garageid},
                {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
            },
            channel = 'staff_give_vehicle'
        })
        
        Garages:load()
    end)
end)

secured_RegisterNetEvent('kayscore:admin:editSociety', function(societyName, newSocietyData)
    local society = Society:getSociety(societyName)
    local xPlayerB = ESX.GetPlayerFromId(source)
    
    if xPlayerB.getGroup() == 'user' then return end
    if not society then return end

    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    society.name = newSocietyData.name
    society.label = newSocietyData.label
    society.permissions = newSocietyData.permissions
    society.coffre = newSocietyData.coffre
    society.posCoffre = newSocietyData.posCoffre
    society.posBoss = newSocietyData.posBoss
    society.grades = newSocietyData.grades
    society.employeds = newSocietyData.employeds
    society.state = newSocietyData.state
    society.blips = newSocietyData.blips
    society.cloakroom = newSocietyData.cloakroom
    society.cloakpos = newSocietyData.cloakpos
    society.tax = newSocietyData.tax -- Assurez-vous que ce champ est bien défini dans newSocietyData

    for k,v in pairs(society.grades) do 
    end

    MySQL.Sync.execute('UPDATE society_data SET name = @name, label = @label, permissions = @permissions, coffre = @coffre, blips = @blips, posCoffre = @posCoffre, posBoss = @posBoss, tax = @tax, cloakroom = @cloakroom, cloakpos = @cloakpos WHERE name = @name', {
        ['@name'] = society.name,
        ['@label'] = society.label,
        ['@permissions'] = json.encode(society.permissions),
        ['@coffre'] = json.encode(society.coffre),
        ['@blips'] = json.encode(society.blips),
        ['@posCoffre'] = json.encode(society.posCoffre),
        ['@posBoss'] = json.encode(society.posBoss),
        ['@tax'] = society.tax,
        ['@cloakroom'] = society.cloakroom,
        ['@cloakpos'] = json.encode(society.cloakpos)
    }) 

    -- update table job grade
    for _, grade in ipairs(society.grades) do
        MySQL.Sync.execute('UPDATE job_grades SET label = @label WHERE job_name = @society AND name = @name', {
            ['@name'] = grade.name,
            ['@label'] = grade.label,
            ['@society'] = society.name
        })
    end

    -- Ajout du log
    sendLog(('Staff a modifié une société (%s - %s) (staff)'):format(xPlayer.name, xPlayer.UniqueID), {
        author = xPlayer.name,
        fields = {
            {title = 'Société', subtitle = societyName},
            {title = 'Nouveau Nom', subtitle = newSocietyData.name},
            {title = 'Nouveau Label', subtitle = newSocietyData.label},
            {title = 'Nouvelles Permissions', subtitle = json.encode(newSocietyData.permissions)},
            {title = 'Nouveau Coffre', subtitle = json.encode(newSocietyData.coffre)},
            {title = 'Nouveaux Blips', subtitle = json.encode(newSocietyData.blips)},
            {title = 'Nouvelle Position Coffre', subtitle = json.encode(newSocietyData.posCoffre)},
            {title = 'Nouvelle Position Boss', subtitle = json.encode(newSocietyData.posBoss)},
            {title = 'Nouvelle Taxe', subtitle = tostring(newSocietyData.tax)},
            {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
        },
        channel = 'staff_edit_society'
    })

    -- print('updated society infos')
    secured_TriggerClientEvent('kayscore:society:updateWithSocietyName', societyName, newSocietyData)
    TriggerClientEvent('esx:showNotification', source, 'Société modifiée avec succès')
end)

secured_RegisterNetEvent('kayscore:admin:updateGrade', function(society, grade, newName, newLabel)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == 'user' then return end
    if not xPlayer then return end
        MySQL.Sync.execute('UPDATE job_grades SET name = @a, SET label = @b WHERE job_name = @society AND WHERE name =', {
            ['@a'] = society.grades[1].name,
            ['@b'] = society.grades[1].label,
            ['@society'] = society.name
        
        })
    TriggerClientEvent('esx:showNotification', source, 'Société supprimé avec succès')
end)

ESX.RegisterServerCallback('kayscore:admin:itemsList', function(source, cb)
    local itemsList = {}
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
    MySQL.Async.fetchAll('SELECT * FROM items', {}, function(result)
        for k,v in pairs(result) do
            table.insert(itemsList, v)
        end

        cb(itemsList)
    end)
end)

ESX.RegisterServerCallback('kayscore:admin:getSanctions', function(source, cb)
    local source = source 
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
    if not xPlayer then return end

    adminManagement.sanctionsList[xPlayer.UniqueID] = {}

    --@todo GET SANCTIONS LIST
end)

ESX.RegisterServerCallback('kayscore:admin:uniqueid.addWeaponCompenent:playerConnected', function(source, player, playerrr, weaponName, hash)
    local xPlayer = ESX.GetPlayerFromId(playerrr)
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end

    if not xPlayer then return end

    xPlayer.addWeaponComponent(weaponName, hash)

    for k,v in pairs(xPlayer.loadout) do
        if v.name == weaponName then
            cb(v.component)
        end
    end
end)

ESX.RegisterServerCallback('kayscore:admin:dealership:refreshvehicleslist', function(source, cb)
    local dealership_vehicles = {}
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
    local re = false

    MySQL.Async.fetchAll('SELECT * FROM vehicules', {}, function(result)
        for k,v in pairs(result) do
            dealership_vehicles[v.id] = v
        end

        re = true
    end)

    while re == false do Wait(1) end

    cb(dealership_vehicles)
end)

ESX.RegisterServerCallback('kayscore:staff:vehicles:concess:catégories:fetch', function(source, cb)
    local vehicle_categorie = {}
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
    MySQL.Async.fetchAll('SELECT * FROM moto_categories', {}, function(result)
        for k,v in pairs(result) do
            v.enable = false
            table.insert(vehicle_categorie, v)
        end
    end)
    MySQL.Async.fetchAll('SELECT * FROM boat_categories', {}, function(result)
        for k,v in pairs(result) do
            v.enable = false
            table.insert(vehicle_categorie, v)
        end

    end)
    MySQL.Async.fetchAll('SELECT * FROM aircraft_categorie', {}, function(result)
        for k,v in pairs(result) do
            v.enable = false
            table.insert(vehicle_categorie, v)
        end


    end)
    MySQL.Async.fetchAll('SELECT * FROM vehicle_categories', {}, function(result)
        for k,v in pairs(result) do
            v.enable = false
            table.insert(vehicle_categorie, v)
        end

    end)

    while json.encode(vehicle_categorie) == "[]" do Wait(1) end

    cb(vehicle_categorie)
end)

secured_RegisterNetEvent('kayscore:staff:vehicles:concess:addVehicle', function(data, categorie)
    local source = source
    local xPlayerB = ESX.GetPlayerFromId(source)

    if xPlayerB.getGroup() == 'user' then return end

    local jobs = {
        ['motorcycles'] = "motodealer",
        ['boat'] = 'boatdealer',
        ['aircraft'] = "airdealer"
    }
    
    MySQL.Async.execute('INSERT INTO vehicules (job, name, model, price, category) VALUES (@job, @name, @model, @price, @category)', {
        ['@job'] = jobs[categorie] or "cardealer",
        ['@name'] = data.label,
        ['@model'] = data.spawnName,
        ['@price'] = data.price,
        ['@category'] = categorie
    }, function()
        TriggerClientEvent('esx:showNotification', source, 'Véhicule ajouté avec succès')

        -- Ajout du log
        sendLog(('Staff a ajouté un véhicule au concess (%s - %s) (staff)'):format(xPlayerB.name, xPlayerB.UniqueID), {
            author = xPlayerB.name,
            fields = {
                {title = 'Nom du Véhicule', subtitle = data.label},
                {title = 'Modèle', subtitle = data.spawnName},
                {title = 'Prix', subtitle = tostring(data.price)},
                {title = 'Catégorie', subtitle = categorie},
                {title = 'Job', subtitle = jobs[categorie] or "cardealer"},
                {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
            },
            channel = 'staff_add_vehicle_concess'
        })
    end)
end)

secured_RegisterNetEvent('kayscore:staff:vehicles:concess:deleteVehicle', function(id)
    local source = source
    local xPlayerB = ESX.GetPlayerFromId(source)
    
    if xPlayerB.getGroup() == 'user' then return end

    MySQL.Async.execute('DELETE FROM vehicules WHERE id = @id', {
        ['@id'] = id
    }, function()
            TriggerClientEvent('esx:showNotification', source, 'Véhicule supprimé avec succès')
            
            -- Ajout du log
            sendLog(('Staff a supprimé un véhicule (%s - %s) (staff)'):format(xPlayerB.name, xPlayerB.UniqueID), {
                author = xPlayerB.name,
                fields = {
                    {title = 'ID du Véhicule', subtitle = tostring(id)},
                    {title = 'Author', subtitle = GetPlayerName(source)},
                    {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                },
                channel = 'staff_delete_vehicle'
            })

    end)
end)

secured_RegisterNetEvent('kayscore:staff:vehicles:concess:changeCategory', function(id, name)
    local source = source
    local xPlayerB = ESX.GetPlayerFromId(source)
    
    if xPlayerB.getGroup() == 'user' then return end

    MySQL.Async.execute('UPDATE vehicules SET category = @category WHERE id = @id', {
        ['@id'] = id,
        ['@category'] = name,
    }, function()
            TriggerClientEvent('esx:showNotification', source, 'Catégorie du véhicule mise à jour avec succès')

            -- Ajout du log
            sendLog(('Staff a changé la catégorie d\'un véhicule (%s - %s) (staff)'):format(xPlayerB.name, xPlayerB.UniqueID), {
                author = xPlayerB.name,
                fields = {
                    {title = 'ID du Véhicule', subtitle = tostring(id)},
                    {title = 'Nouvelle Catégorie', subtitle = name},
                    {title = 'Author', subtitle = GetPlayerName(source)},
                    {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                },
                channel = 'staff_change_vehicle_category'
            })

    end)
end)

secured_RegisterNetEvent('kayscore:staff:vehicles:concess:changePrice', function(id, price)
    local source = source
    local xPlayerB = ESX.GetPlayerFromId(source)
    
    if xPlayerB.getGroup() == 'user' then return end

    MySQL.Async.execute('UPDATE vehicules SET price = @price WHERE id = @id', {
        ['@id'] = id,
        ['@price'] = price,
    }, function()
            TriggerClientEvent('esx:showNotification', source, 'Prix du véhicule mis à jour avec succès')

            -- Ajout du log
            sendLog(('Staff a changé le prix d\'un véhicule (%s - %s) (staff)'):format(xPlayerB.name, xPlayerB.identifier), {
                author = xPlayerB.name,
                fields = {
                    {title = 'ID du Véhicule', subtitle = tostring(id)},
                    {title = 'Nouveau Prix', subtitle = tostring(price)},
                    {title = 'Author', subtitle = GetPlayerName(source)},
                    {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                },
                channel = 'staff_change_vehicle_price'
            })
    end)
end)


ESX.RegisterServerCallback('kayscore:staff:vehicles:concess:searchCategory', function(source, cb, type)
    local xPlayerB = ESX.GetPlayerFromId(source)
	if xPlayerB.getGroup() == 'user' then return end
    local return_result = {}
    local c = false
    MySQL.Async.fetchAll(('SELECT * FROM %s'):format(type), {}, function(result)
        for k,v in pairs(result) do
            table.insert(return_result, v)
        end

        c = true
    end)

    while not c do Wait(1) end

    cb(return_result)
end)

secured_RegisterNetEvent('kayscore:staff:vehicles:concess:categories:add', function(category, data)
    local source = source
    local xPlayerB = ESX.GetPlayerFromId(source)
    
    if xPlayerB.getGroup() == 'user' then return end

    MySQL.Async.execute(('INSERT INTO %s (name, label) VALUES (@name, @label)'):format(category), {
        ['@name'] = data.name,
        ['@label'] = data.label,
    }, function()
            TriggerClientEvent('esx:showNotification', source, 'Catégorie ajoutée avec succès')

            -- Ajout du log
            sendLog(('Staff a ajouté une nouvelle catégorie de véhicules (%s - %s) (staff)'):format(xPlayerB.name, xPlayerB.UniqueID), {
                author = xPlayerB.name,
                fields = {
                    {title = 'Nom', subtitle = data.name},
                    {title = 'Label', subtitle = data.label},
                    {title = 'Catégorie', subtitle = category},
                    {title = 'Author', subtitle = GetPlayerName(source)},
                    {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                },
                channel = 'staff_add_vehicle_category'
            })

    end)
end)


secured_RegisterNetEvent('kayscore:staff:vehicles:concess:categories:delete', function(type, name)
    local source = source
    local xPlayerB = ESX.GetPlayerFromId(source)
    
    if xPlayerB.getGroup() == 'user' then return end

    MySQL.Async.execute(('DELETE FROM %s WHERE name = @name'):format(type), {
        ['@name'] = name,
    }, function()
            TriggerClientEvent('esx:showNotification', source, 'Catégorie supprimée avec succès')

            -- Ajout du log
            sendLog(('Staff a supprimé une catégorie de véhicules (%s - %s) (staff)'):format(xPlayerB.name, xPlayerB.UniqueID), {
                author = xPlayerB.name,
                fields = {
                    {title = 'Nom', subtitle = name},
                    {title = 'Type', subtitle = type},
                    {title = 'Author', subtitle = GetPlayerName(source)},
                    {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                },
                channel = 'staff_delete_vehicle_category'
            })

    end)
end)


CreateThread(function()
    Wait(10000)

end)


-- Événement pour changer le grade d'un joueur
secured_RegisterServerEvent("kayscore:staff:changeGrade")
secured_AddEventHandler("kayscore:staff:changeGrade", function(playerName, newGrade)
    local source = source
    local xPlayerB = ESX.GetPlayerFromId(source)
    
    if xPlayerB.getGroup() == 'user' then return end

    -- Vérifiez que le nouveau grade est valide
    local isValidGrade = false
    for _, grade in ipairs(grades) do
        if grade.name == newGrade then
            isValidGrade = true
            break
        end
    end

    if not isValidGrade then
        return
    end

    -- Implémentez ici la logique pour changer le grade du joueur
    MySQL.Async.execute("UPDATE users SET permission_group = @newGrade WHERE playerName = @playerName", {
        ['@newGrade'] = newGrade,
        ['@playerName'] = playerName
    }, function()

            -- Ajout du log
            sendLog(('Staff a changé le grade de %s en %s (staff)'):format(playerName, newGrade), {
                author = xPlayerB.name,
                fields = {
                    {title = 'Joueur', subtitle = playerName},
                    {title = 'Nouveau Grade', subtitle = newGrade},
                    {title = 'Author', subtitle = GetPlayerName(source)},
                    {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
                },
                channel = 'staff_change_player_grade'
            })

    end)
end)




