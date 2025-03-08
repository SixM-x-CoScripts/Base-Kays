---@class Gangs
Gangs = {}
Gangs.__index = Gangs

Gangs.List = {}
Gangs.Numbers = 0

Gangs.DefaultChest = {
    ['items'] = {},
    ['weapons'] = {},
    ['accounts'] = {
        cash = 0,
        black_money = 0
    }
}
Gangs.DefaultPermissions = {
    ['*'] = {
        ['boss'] = true,
    },

    -- category
    ['items'] = {},
    ['weapons'] = {},
    ['accounts'] = {},
    ['recruit_remove_player'] = {},
    ['change_group_player'] = {},
    ['create_edit_grades'] = {},
    ['manage_members'] = {},

    -- action add
    ['items_add'] = {},
    ['weapons_add'] = { },
    ['accounts_add'] = { },

    -- action remove
    ['items_remove'] = {},
    ['weapons_remove'] = {},
    ['accounts_remove'] = {},
}

---register
---@param name string
---@param data table
---@return Gangs
---@public
---@return table
function Gangs:register(id, data)
    local self = setmetatable({}, Gangs)

    self.id = id or 0
    self.name = data.name or "Indéfini"
    self.label = data.label or "Indéfini"
    self.positions = data.positions or {}
    self.permissions = data.permissions or Gangs.DefaultPermissions
    self.circuit = data.circuit or false
    self.grades = data.grades or {}
    self.chest = data.chest or {}
    self.blips = data.blips or false
    self.list = data.listecat or "Gang"
    self.blipscolor = data.blipscolor or 0

    Gangs.List[self.name] = self    

    return self
end

---delete
---@public
function Gangs:delete()
    if not Gangs.List[self.name] then return end

    MySQL.Async.execute('DELETE FROM gangs_new WHERE name = @name', {
        ['@name'] = self.name
    })
    MySQL.Async.execute('DELETE FROM jobs WHERE name = @name', {
        ['@name'] = self.name
    })
    MySQL.Async.execute('DELETE FROM job_grades WHERE job_name = @job_name', {
        ['@job_name'] = self.name
    })

    secured_TriggerClientEvent('kayscore:gangs:delete', -1, self.name)
    TriggerEvent('esx:getAllJobs')

    Gangs.List[self.name] = nil
    self = nil
end

---refreshGangs
function Gangs:refreshGangs()
    local load = false

    Gangs.List = {}


    MySQL.Async.fetchAll('SELECT * FROM gangs_new', {}, function(result)

        Gangs.Numbers = 0

        local grades = {}

        for k,v in pairs(result) do
            grades[v.name] = {}

            MySQL.Async.fetchAll('SELECT * FROM job_grades WHERE job_name = @job_name', {
                ['@job_name'] = v.name
            }, function(result)
                for i,p in pairs(result) do
                    grades[v.name][p.name] = p
                end

                Gangs:register(v.id, {
                    id = v.id,
                    name = v.name,
                    label = v.label,
                    positions = json.decode(v.positions),
                    permissions = json.decode(v.permissions),
                    circuit = v.circuit,
                    grades = grades[v.name],
                    blips = v.blips,
                    list = v.listecat,
                    blipscolor = v.blipscolor,
                    chest = json.decode(v.chest),
                })
            end)

            Gangs.Numbers += 1
        end



        load = true
    end)

    while not load do Wait(1) end

    return load
end

---create
---@param data table
function Gangs:create(data)
    for k,v in pairs(Gangs.List) do
        if v.name == data.name then
            return
        end
    end

    MySQL.Async.execute('DELETE FROM jobs WHERE name = @name', {
        ['@name'] = data.name,
    }, function()
        MySQL.Async.execute('DELETE FROM job_grades WHERE job_name = @job_name',  {
            ['@job_name'] = data.name
        })
    end)

    MySQL.Async.execute('INSERT INTO gangs_new (name, label, positions, permissions, circuit, chest, blips, cat, blipscolor) VALUES (@name, @label, @positions, @permissions, @circuit, @chest, @blips, @cat, @blipscolor)', {
        ['@name'] = data.name or "Indéfini",
        ['@label'] = data.label or "Indéfini",
        ['@positions'] = json.encode(data.positions) or {},
        ['@permissions'] = json.encode(Gangs.DefaultPermissions),
        ['@circuit'] = false,
        ['@chest'] = json.encode(Gangs.DefaultChest),
        ['@blips'] = data.blips,
        ['@cat'] = data.listecat,
        ['@blipscolor'] = data.blipscolor
    }, function()

        MySQL.Async.execute('INSERT INTO jobs (name, label, type) VALUES (@name, @label, @type)', {
            ['@name'] = data.name,
            ['@label'] = data.label,
            ['@type'] = 0
        }, function()
            MySQL.Async.execute('INSERT INTO job_grades (job_name, grade, name, label) VALUES (@job_name, @grade, @name, @label)', {
                ['@job_name'] = data.name,
                ['@grade'] = 1,
                ['@name'] = "boss",
                ['@label'] = "Chef",
            }, function()
                -- print('job grade good')
                Wait(1000)

                TriggerEvent('esx:getAllJobs')

                local retval = Gangs:refreshGangs()

                Wait(5000)

                secured_TriggerClientEvent('kayscore:gangs:recieveGangs', -1, Gangs.List)
                sendLog(('Un nouveau groupe a étais crée (%s)'):format(data.name), {
                    author = 'Groupes',
                    fields = {
                        {title = 'Name', subtitle = data.name},
                        {title = 'Label', subtitle = data.label},
                    },
                    channel = 'create_groupes'
                })
            end)
        end)
    end)
end

---get
---@param id number
---@param name string
---@public
function Gangs:get(idorname)
    if Gangs.List[idorname] then
        return Gangs.List[idorname]
    else
        for k,v in pairs(Gangs.List) do
            if tonumber(v.id) == tonumber(idorname) then
                return Gangs.List[v.name]
            end
        end
    end 

    return false
end

---editInformations
---@param t string
---@param data string
---@public
function Gangs:editInformations(t, data, JSON)
    local dbInst = data

    if JSON then
        dbInst = json.encode(data)
    end
    
    MySQL.Async.execute(('UPDATE gangs_new SET %s = @data WHERE name = @name'):format(t), {
        ['@name'] = self.name,
        ['@data'] = dbInst
    }, function()
        self[t] = data

        secured_TriggerClientEvent('kayscore:gangs:updateGang', -1, self.name, self)
    end)
end

---createGrade
---@param gradeData table
---@public
---@return boolean
function Gangs:createGrade(gradeData)
    if self.grades[gradeData.name] then return false, 'alreadyexists' end

    local max = 0
    MySQL.Async.fetchAll('SELECT MAX(grade) FROM job_grades WHERE job_name = @job_name', {
        ['@job_name'] = self.name
    }, function(result)
        for k,v in pairs(result) do
            for i,p in pairs(v) do
                max = p + 1
            end
        end

        MySQL.Async.execute('INSERT INTO job_grades (job_name, grade, name, label) VALUES (@job_name, @grade, @name, @label)', {
            ['@job_name'] = self.name,
            ['@name'] = gradeData.name,
            ['@label'] = gradeData.label,
            ['@grade'] = max
        }, function()
            Wait(1000)

            TriggerEvent('esx:getAllJobs')

            local grade = {}

            self.grades[gradeData.name] = {
                name = gradeData.name,
                label = gradeData.label,
                grade = max,
            }
    
            secured_TriggerClientEvent('kayscore:gangs:updateGang', -1, self.name, self)
        end)
    end)

    return true
end

---deleteGrade
---@param gradeName string
---@public
---@return boolean
function Gangs:deleteGrade(gradeName)
    if not self.grades[gradeName] then return false end

    local perms = {}

    for k,v in pairs(self.permissions) do
        for i,p in pairs(v) do
            if i == gradeName then
                self.permissions[k][i] = nil
            end
        end
    end

    MySQL.Async.execute('DELETE FROM job_grades WHERE name = @name AND job_name = @job_name', {
        ['@name'] = gradeName,
        ['@job_name'] = self.name
    }, function()
        TriggerEvent('esx:getAllJobs')
    end)

    MySQL.Async.execute('UPDATE gangs_new SET permissions = @permissions WHERE name = @name', {
        ['@name'] = self.name,
        ['@permissions'] = json.encode(self.permissions)
    })

    self.grades[gradeName] = nil

    secured_TriggerClientEvent('kayscore:gangs:updateGang', -1, self.name, self)

    return true
end

---editGradePermissions
---@param permissions table
---@public
---@return boolean
function Gangs:editGradePermissions(perms)
    self.permissions = perms

    MySQL.Async.execute('UPDATE gangs_new SET permissions = @permissions WHERE name = @name', {
        ['@permissions'] = json.encode(self.permissions),
        ['@name'] = self.name
    })

    secured_TriggerClientEvent('kayscore:gangs:updateGang', -1, self.name, self)

    return true
end

---editGradeLabel
---@param gradeName string
---@param newLabel string
---@public
---@return boolean
function Gangs:editGradeLabel(gradeName, newLabel)
    if not self.grades[gradeName] then return false end

    self.grades[gradeName].label = newLabel

    MySQL.Async.execute('UPDATE job_grades SET label = @label WHERE name = @name and job_name = @job_name', {
        ['@label'] = newLabel,
        ['@name'] = gradeName,
        ['@job_name'] = self.name
    }, function()
        TriggerEvent('esx:getAllJobs')

        secured_TriggerClientEvent('kayscore:gangs:updateGang', -1, self.name, self)
    end)

    return true
end

---addAccountMoney
---@param account string
---@param money number
---@public
---@return boolean
function Gangs:addAccountMoney(account, money)
    self.chest["accounts"][account] = self.chest["accounts"][account] + money

    secured_TriggerClientEvent('kayscore:gangs:updateChest', -1, self.name, self.chest)

    MySQL.Async.execute('UPDATE gangs_new SET chest = @chest WHERE name = @name', {
        ['@name'] = self.name,
        ['@chest'] = json.encode(self.chest)
    })

    return true
end

---removeAccountMoney
---@param account string
---@param money number
---@public
---@return boolean
function Gangs:removeAccountMoney(account, money)
    self.chest["accounts"][account] = self.chest["accounts"][account] - money

    secured_TriggerClientEvent('kayscore:gangs:updateChest', -1, self.name, self.chest)

    MySQL.Async.execute('UPDATE gangs_new SET chest = @chest WHERE name = @name', {
        ['@name'] = self.name,
        ['@chest'] = json.encode(self.chest)
    })
    
    return true
end

---addItem
---@param data table
---@param number number
---@public
---@return boolean
function Gangs:addItem(data, number)

    local hasItem = false

    for k,v in pairs(self.chest["items"]) do
        if v.name == data.name then
            self.chest["items"][k].count += number

            hasItem = true
        end
    end

    if not hasItem then
        table.insert(self.chest["items"], {
            name = data.name,
            label = data.label,
            count = number
        })
    end

    secured_TriggerClientEvent('kayscore:gangs:updateChest', -1, self.name, self.chest)

    MySQL.Async.execute('UPDATE gangs_new SET chest = @chest WHERE name = @name', {
        ['@name'] = self.name,
        ['@chest'] = json.encode(self.chest)
    })


    return true
end

---removeItem
---@param data table
---@param number number
---@public
---@return boolean
function Gangs:removeItem(data, number)
    Wait(100)
    local fictiveItems = {}

    for k,v in pairs(self.chest["items"]) do
        if v.name == data.name then
            fictiveItems[v.name] = v

            if v.count < number then return false end

            self.chest["items"][k].count -= number

            if self.chest["items"][k].count < 1 then
                table.remove(self.chest["items"], k)
            end
        end
    end

    if not fictiveItems[data.name] then return false end

    secured_TriggerClientEvent('kayscore:gangs:updateChest', -1, self.name, self.chest)

    MySQL.Async.execute('UPDATE gangs_new SET chest = @chest WHERE name = @name', {
        ['@name'] = self.name,
        ['@chest'] = json.encode(self.chest)
    })

    return true
end

---addWeapon
---@param data table
---@param number number
---@public
---@return boolean
function Gangs:addWeapon(data, number)

    table.insert(self.chest["weapons"], {
        name = data.name,
        label = data.label,
        count = number
    })

    secured_TriggerClientEvent('kayscore:gangs:updateChest', -1, self.name, self.chest)

    MySQL.Async.execute('UPDATE gangs_new SET chest = @chest WHERE name = @name', {
        ['@name'] = self.name,
        ['@chest'] = json.encode(self.chest)
    })

    return true
end

---removeWeapon
---@param data table
---@public
---@return boolean
function Gangs:removeWeapon(data)
    Wait(100)
    local fictiveWeapons = {}

    for k,v in pairs(self.chest["weapons"]) do
        if v.name == data.name then
            fictiveWeapons[v.name] = v

            table.remove(self.chest["weapons"], k)
        end
    end

    if not fictiveWeapons[data.name] then return false end

    secured_TriggerClientEvent('kayscore:gangs:updateChest', -1, self.name, self.chest)

    MySQL.Async.execute('UPDATE gangs_new SET chest = @chest WHERE name = @name', {
        ['@name'] = self.name,
        ['@chest'] = json.encode(self.chest)
    })

    return true
end

secured_RegisterNetEvent('kayscore:gangs:create', function(data)
    Gangs:create(data)
end)

secured_RegisterNetEvent('kayscore:gangs:staff:edit', function(data, name, label, JSON)
    local gang = Gangs:get(name)

    local source = source

    if not gang then 
        TriggerClientEvent('esx:showNotification', '~r~Ce gang n\'existe pas/plus~s~')
        return
    end

    gang:editInformations(data, label, JSON)
end)

secured_RegisterNetEvent('kayscore:gangs:staff:delete', function(gangName)
    local gang = Gangs:get(gangName)

    if not gang then return end

    gang:delete()
end)

secured_RegisterNetEvent('kayscore:gangs:gestion:grades:create', function(gangName, gradeData)
    local gang = Gangs:get(gangName)

    if not gang then return end

    local retval, reason = gang:createGrade(gradeData)

    if retval == false then
        if reason == "alreadyexists" then
            local source = source

            TriggerClientEvent('esx:showNotification', source, '~r~Ce nom de grade est déjà utilisé~s~')
        end
    end
end)

secured_RegisterNetEvent('kayscore:gangs:gestion:grades:delete', function(gangName, gradeName)
    local gang = Gangs:get(gangName)

    if not gang then return end

    local retval = gang:deleteGrade(gradeName)
end)

secured_RegisterNetEvent('kayscore:gangs:gestion:grades:editGradePermissions', function(gangName, permissions)
    local gang = Gangs:get(gangName)

    if not gang then return end

    local retval = gang:editGradePermissions(permissions)
end)

secured_RegisterNetEvent('kayscore:gangs:gestion:grades:editLabel', function(gangName, gradeName, newGradeLabel)
    local gang = Gangs:get(gangName)

    if not gang then return end

    local retval = gang:editGradeLabel(gradeName, newGradeLabel)
end)

ESX.RegisterServerCallback('kayscore:gangs:gestions:members:fetch', function(source, cb)
    local source = source

    local player = ESX.GetPlayerFromId(source)

    if not player then return end

    local MembersList = {}

    MySQL.Async.fetchAll('SELECT * FROM users WHERE job2 = @job2', {
        ['@job2'] = player.job2.name
    }, function(result)
        for k,v in pairs(result) do
            local player = ReturnPlayerId(v.UniqueID)

            if player then
                v.job2_grade = player.job2.grade_label
                v.connected = '~g~EN LIGNE~s~'
            else
                v.job2_grade = "Indéfini"
                v.connected = '~r~HORS LIGNE~s~'
            end
            table.insert(MembersList, {
                UniqueID = v.UniqueID,
                playerName = v.playerName,
                job2_grade = v.job2_grade,
                connected = v.connected,
                firstname = v.firstname,
                lastname = v.lastname
            })
        end

        cb(MembersList)
    end)
end)

secured_RegisterNetEvent('kayscore:gangs:manage:demotePlayer', function(targetUniqueID)
    local source = source
    local sourcePlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ReturnPlayerId(targetUniqueID)

    if targetPlayer then
        local xTargetPlayer = ESX.GetPlayerFromId(targetPlayer.id)
        if xTargetPlayer.job2.name ~= sourcePlayer.job2.name then
            return TriggerClientEvent('esx:showNotification', source, "~r~Vous ne pouvez pas rétrograder ce joueur car il n'est pas dans le même gang que vous.")
        end

        xTargetPlayer.setJob('unemployed2', 0)
    else
        MySQL.Async.fetchScalar('SELECT job2 FROM users WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = targetUniqueID
        }, function(job2)
            if job2 ~= sourcePlayer.job2.name then
                return TriggerClientEvent('esx:showNotification', source, "~r~Vous ne pouvez pas rétrograder ce joueur car il n'est pas dans le même gang que vous.")
            end

            MySQL.Async.execute('UPDATE users SET job2 = @job2, job2_grade = @job2_grade WHERE UniqueID = @UniqueID', {
                ['@UniqueID'] = targetUniqueID,
                ['@job2'] = 'unemployed2',
                ['@job2_grade'] = 0
            }, function()
                TriggerClientEvent('esx:showNotification', source, "~g~Le joueur a été rétrogradé avec succès.")
            end)
        end)
    end
end)


ESX.RegisterServerCallback('kayscore:gangs:interaction:requestPlayerInventory', function(source, cb, target)
    local player = ESX.GetPlayerFromId(target)

    if not player then return end
    
    local inventory = {
        items = player.inventory,
        weapons = player.loadout,
        accounts = player.accounts
    }

    cb(inventory)
end)

Gangs.CagoulePlayers = {}

secured_RegisterNetEvent('kayscore:gangs:interaction:cagoulePlayer', function(target)
    local source = source
    local player = ESX.GetPlayerFromId(source)

    if not player then return end


    if not Gangs.CagoulePlayers[target] then
        if player.getInventoryItem('cagoule').count < 1 then TriggerClientEvent('esx:showNotification', source, '~r~Vous devez posseder une cagoule sur vous~s~') return end
        Gangs.CagoulePlayers[target] = true

        secured_TriggerClientEvent('kayscore:gangs:interaction:cagoulePlayer', target, true)

        player.removeInventoryItem('cagoule', 1)

        TriggerClientEvent('esx:showNotification', source, "La personne a était cagoulé")
    else
        Gangs.CagoulePlayers[target] = false

        secured_TriggerClientEvent('kayscore:gangs:interaction:cagoulePlayer', target, false)

        player.addInventoryItem('cagoule', 1)
        
        TriggerClientEvent('esx:showNotification', source, "La personne a était décagoulé")
    end
end)

secured_RegisterNetEvent('kayscore:gangs:interaction:recruitPlayer', function(target, gangName, grade)
    local player = ESX.GetPlayerFromId(target)

    if not player then return end

    player.setgroup(gangName, grade)
end)

secured_RegisterNetEvent('kayscore:gangs:interaction:removePlayer', function(target, gangName, grade)
    local player = ESX.GetPlayerFromId(target)

    if not player then return end

    player.setgroup("unemployed2", 0)
end)

secured_RegisterNetEvent('kayscore:gangs:chest:accounts:add', function(gangName, account, count)
    local source = source

    local player = ESX.GetPlayerFromId(source)

    if not player then return end
    Wait(300)
    local gang = Gangs:get(gangName)

    if not gang then return end

    if player.getAccount(account).money < count then
        return TriggerClientEvent('esx:showNotification', source, 'Vous ne disposez pas des fonds requis pour établir votre action')
    end

    player.removeAccountMoney(account, count)

    gang:addAccountMoney(account, count)

    TriggerClientEvent('esx:showNotification', source, ('Vous avez pris %s%s$~s~ du coffre de votre groupe illégal'):format(kayscoreConfigServ.GTACOLOR, count))
    sendLog(("Le Joueur (%s - %s) viens de déposer (%s$ - %s) dans le coffre de groupe (%s)"):format(player.name, player.UniqueID, count, account, gangName), {
        author = 'Groupes',
        fields = {
            {title = 'Player', subtitle = player.name},
            {title = 'ID Unique', subtitle = player.UniqueID},
            {title = 'Identifier', subtitle = player.identifier},
            {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
        },
        channel = 'depot_groupes_argent'
    })
end)

secured_RegisterNetEvent('kayscore:gangs:chest:accounts:remove', function(gangName, account, count)
    local source = source

    local player = ESX.GetPlayerFromId(source)

    if not player then return end
    Wait(300)
    local gang = Gangs:get(gangName)

    if not gang then return end

    if gang.chest["accounts"][account] < count then
        return TriggerClientEvent('esx:showNotification', source, 'Votre groupe illégal ne dispose pas des fonds requis pour établir votre action')
    end

    player.addAccountMoney(account, count)

    gang:removeAccountMoney(account, count)

    TriggerClientEvent('esx:showNotification', source, ('Vous avez retiré %s%s$~s~ du coffre de votre groupe illégal'):format(kayscoreConfigServ.GTACOLOR, count))
    sendLog(("Le Joueur (%s - %s) viens de prendre (%s$ - %s) dans le coffre de groupe (%s)"):format(player.name, player.UniqueID, count, account, gangName), {
        author = 'Groupes',
        fields = {
            {title = 'Player', subtitle = player.name},
            {title = 'ID Unique', subtitle = player.UniqueID},
            {title = 'Identifier', subtitle = player.identifier},
            {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
        },
        channel = 'retirer_groupes_argent'
    })
end)

secured_RegisterNetEvent('kayscore:gangs:chest:items:add', function(gangName, v, number)
    local source = source

    local player = ESX.GetPlayerFromId(source)

    if not player then return end
    Wait(300)
    local gang = Gangs:get(gangName)

    if not gang then return end

    if player.getInventoryItem(v.name).count < number then 
        return TriggerClientEvent('esx:showNotification', source, 'Vous ne disposez pas de la quantité défini')
    end
    if not kayscoreConfigServ.PermanentItem[v.name] then
    player.removeInventoryItem(v.name, number)

    gang:addItem(v, number)
    sendLog(("Le Joueur (%s - %s) viens déposer l'item (%s - x%s) dans le coffre de groupe (%s)"):format(player.name, player.UniqueID, v.name, number, gangName), {
        author = 'Groupes',
        fields = {
            {title = 'Player', subtitle = player.name},
            {title = 'ID Unique', subtitle = player.UniqueID},
            {title = 'Identifier', subtitle = player.identifier},
            {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
        },
        channel = 'depot_groupes'
    })
    end
end)

secured_RegisterNetEvent('kayscore:gangs:chest:items:remove', function(gangName, v, number)
    local source = source

    local player = ESX.GetPlayerFromId(source)

    if not player then return end
    Wait(300)
    local gang = Gangs:get(gangName)

    if not gang then return end

    local fictiveItems = {}

    for k,p in pairs(gang.chest["items"]) do
        fictiveItems[p.name] = p
        if p.name == v.name then
            if p.count < number then 
                TriggerClientEvent('esx:showNotification', source, 'Il n\'y en a pas asser dans le coffre')
                return
            end
        end
    end

    if not fictiveItems[v.name] then 
        TriggerClientEvent('esx:showNotification', source, 'Il n\'y en a pas asser dans le coffre') 
        return 
    end 
    if not player.canCarryItem(v.name, 1) then TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez de place dans votre inventaire") return end
    local retval = gang:removeItem(v, number)


    if retval then
        player.addInventoryItem(v.name, number)
        sendLog(("Le Joueur (%s - %s) viens retirer l'item (%s - x%s) dans le coffre de groupe (%s)"):format(player.name, player.UniqueID, v.name, number, gangName), {
            author = 'Groupes',
            fields = {
                {title = 'Player', subtitle = player.name},
                {title = 'ID Unique', subtitle = player.UniqueID},
                {title = 'Identifier', subtitle = player.identifier},
                {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
            },
            channel = 'retirer_groupes'
        })
    else
        TriggerClientEvent('esx:showNotification', source, 'Il n\'y en a pas asser dans le coffre') 
    end
end)

secured_RegisterNetEvent('kayscore:gangs:chest:weapons:add', function(gangName, v, number)
    local source = source

    local player = ESX.GetPlayerFromId(source)

    if not player then return end
    Wait(300)
    local gang = Gangs:get(gangName)

    if not gang then return end
    if not kayscoreConfigServ.PermanantWeapon[v.name] then
    player.removeWeapon(v.name)

    gang:addWeapon(v, number)
    sendLog(("Le Joueur (%s - %s) viens déposer l'arme (%s) dans le coffre de groupe (%s)"):format(player.name, player.UniqueID, v.name, gangName), {
        author = 'Groupes',
        fields = {
            {title = 'Player', subtitle = player.name},
            {title = 'ID Unique', subtitle = player.UniqueID},
            {title = 'Identifier', subtitle = player.identifier},
            {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
        },
        channel = 'depot_groupes_armes'
    })
    end
end)

secured_AddEventHandler('kayscore:admin:restart', function()
    local source = source

    if source == 0 then return end

    secured_TriggerClientEvent('kayscore:gangs:recieveGangs', source, Gangs.List)
end)

secured_RegisterNetEvent('kayscore:gangs:chest:weapons:remove', function(gangName, v)
    local source = source
    local player = ESX.GetPlayerFromId(source)

    if not player then return end
    Wait(300)
    local gang = Gangs:get(gangName)

    if not gang then return end

    -- Vérification si le joueur possède déjà l'arme
    if player.hasWeapon(v.name) then
        TriggerClientEvent('esx:showNotification', source, 'Vous possédez déjà cette arme.')
        return
    end

    local retval = gang:removeWeapon(v)

    if retval then
        player.addWeapon(v.name, v.count)
        sendLog(("Le Joueur (%s - %s) viens retirer l'arme (%s) dans le coffre de groupe (%s)"):format(player.name, player.UniqueID, v.name, gangName), {
            author = 'Groupes',
            fields = {
                {title = 'Player', subtitle = player.name},
                {title = 'ID Unique', subtitle = player.UniqueID},
                {title = 'Identifier', subtitle = player.identifier},
                {title = "Discord", subtitle = ESX.GetIdentifierFromId(source, "discord:")},
            },
            channel = 'retirer_groupes_armes'
        })
    else
        TriggerClientEvent('esx:showNotification', source, 'Il n\'y en a pas assez dans le coffre')
    end
end)




AddEventHandler("esx:playerLoaded", function(source, xPlayer)
    local source = source

    secured_TriggerClientEvent('kayscore:gangs:recieveGangs', source, Gangs.List)
end)

CreateThread(function()
    MySQL.Async.execute([[
        CREATE TABLE IF NOT EXISTS `gangs_new` (
            id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
            name LONGTEXT DEFAULT NULL,
            label LONGTEXT DEFAULT NULL,
            positions LONGTEXT DEFAULT NULL,
            permissions LONGTEXT DEFAULT NULL,
            circuit LONGTEXT DEFAULT NULL,
            chest LONGTEXT DEFAULT NULL,
            cat LONGTEXT DEFAULT NULL,
            blips BOOLEAN DEFAULT NULL,
            blipscolor LONGTEXT DEFAULT NULL
        );
    ]])

    Gangs:refreshGangs()
end)