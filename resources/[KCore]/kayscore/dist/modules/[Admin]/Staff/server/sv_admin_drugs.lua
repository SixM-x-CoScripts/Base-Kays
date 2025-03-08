local drugs_circuits = {}
drugs_laboratories = {}

local drugs_sell = {}

CreateThread(function()
    MySQL.Async.execute([[
        CREATE TABLE IF NOT EXISTS `illegal_drugs_circuits` (
            name LONGTEXT DEFAULT NULL,
            label LONGTEXT DEFAULT NULL,
            recolte LONGTEXT DEFAULT NULL,
            traitement LONGTEXT DEFAULT NULL,
            animtype LONGTEXT DEFAULT NULL,
            animdict LONGTEXT DEFAULT NULL,
            anim LONGTEXT DEFAULT NULL,
            animtime INT(11) DEFAULT NULL,
            marker BOOLEAN DEFAULT 0,
            props LONGTEXT DEFAULT NULL,
            name_pooch LONGTEXT DEFAULT NULL,
            label_pooch LONGTEXT DEFAULT NULL,
            animtype_t LONGTEXT DEFAULT NULL,
            animdict_t LONGTEXT DEFAULT NULL,
            anim_t LONGTEXT DEFAULT NULL,
            animtime_t INT(11) DEFAULT NULL,
            marker_t BOOLEAN DEFAULT 0,
            props_t LONGTEXT DEFAULT NULL
        );
    ]])

    MySQL.Async.execute([[
        CREATE TABLE IF NOT EXISTS `illegal_drugs_sell` (
            `id` INT AUTO_INCREMENT PRIMARY KEY,
            position VARCHAR(255) NOT NULL,
            message LONGTEXT NOT NULL
        )
    ]])

    local function fetch()
        MySQL.Async.fetchAll('SELECT * FROM illegal_drugs_circuits', {}, function(result)
            for k,v in pairs(result) do
                drugs_circuits[v.name] = {
                    ["name"] = v.name,
                    ["label"] = v.label,
                    ['position'] = {
                        ["recolte"] = json.decode(v.recolte),
                        ["traitement"] = json.decode(v.traitement)
                    },
                    ['data'] = {
                        ["recolte"] = {
                            name = v.name,
                            label = v.label,
                            animtype = v.animtype,
                            animdict = v.animdict,
                            anim = v.anim,
                            animtime = v.animtime,
                            marker = v.marker,
                            props = v.props
                        },
                        ["traitement"] = {
                            name = v.name_pooch,
                            label = v.label_pooch,
                            animtype = v.animtype_t,
                            animdict = v.animdict_t,
                            anim = v.anim_t,
                            animtime = v.animtime_t,
                            marker = v.marker_t,
                            props = v.props_t
                        },
                    }
                }

            end
        end)
    end
    
    fetch()

    secured_RegisterNetEvent('kayscore:drugs:load', function()
        local source = source

        secured_TriggerClientEvent('kayscore:drugs:load', source, drugs_circuits)
    end)

    secured_RegisterNetEvent('kayscore:drugs:create', function(data)
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)
	    if xPlayer.getGroup() == 'user' then return end
        if data.traitement_anim == nil then
            data.traitement_anim = 'none'
        end

        if data.recolte_anim == nil then
            data.recolte_anim = 'none'
        end

        if data.recolte_props == nil then
            data.recolte_props = 'none'
        end

        if data.traitement_props == nil then
            data.traitement_props = 'none'
        end

        if data.recolte_marker == nil then
            data.recolte_marker = false
        end

        MySQL.Async.execute('INSERT INTO drugs_circuits (name, label, recolte, traitement, animtype, animdict, anim, animtime, marker, props, name_pooch, label_pooch, animtype_t, animdict_t, anim_t, animtime_t, marker_t, props_t) VALUES (@name, @label, @recolte, @traitement, @animtype, @animdict, @anim, @animtime, @marker, @props, @name_pooch, @label_pooch, @animtype_t, @animdict_t, @anim_t, @animtime_t, @marker_t, @props_t)', {
            ['@name'] = data.name,
            ['@label'] = data.label,
            ['@recolte'] = json.encode(data.posRecolte),
            ['@traitement'] = json.encode(data.posTraitement),
            ['@animtype'] = data.recolte_animtype,
            ['@animdict'] = data.recolte_animdict,
            ['@anim'] = data.recolte_anim,
            ['@animtime'] = data.recolte_animtime,
            ['@marker'] = data.recolte_marker,
            ['@props'] = data.recolte_props,
            ['@name_pooch'] = data.name_pooch,
            ['@label_pooch'] = data.label_pooch,
            ['@animtype_t'] = data.traitement_animtype,
            ['@animdict_t'] = data.traitement_animdict,
            ['@anim_t'] = data.traitement_anim,
            ['@animtime_t'] = data.traitement_animtime,
            ['@marker_t'] = data.traitement_marker,
            ['@props_t'] = data.traitement_props
        }, function()
            TriggerClientEvent('esx:showNotification', source, 'Drogue crée avec succès')

            fetch()

            secured_TriggerClientEvent('kayscore:drugs:load', -1, drugs_circuits)

            secured_TriggerClientEvent('kayscore:drugs:refresh', -1, data.name)
        end)
    end)

    secured_RegisterNetEvent('kayscore:admin:drugs:update', function(drugsName, data)
        local xPlayer = ESX.GetPlayerFromId(source)
	    if xPlayer.getGroup() == 'user' then return end
        if not drugsName then return end
        if not data then return end
        if type(data) ~= "table" then return end

        
    end)

    local function fetchLabo()
        MySQL.Async.fetchAll('SELECT * FROM illegal_laboratory', {}, function(result)
            for k,v in pairs(result) do
                drugs_laboratories[v.id] = {
                    id = v.id,
                    name = v.name,
                    type = v.type,
                    interior = json.decode(v.interior),
                    owner = v.owner,
                    pos = json.decode(v.pos),
                }

            end
        end)
    end

    local function fetchSell()
        MySQL.Async.fetchAll('SELECT * FROM illegal_drugs_sell', {}, function(result)
            for k,v in pairs(result) do
                table.insert(drugs_sell, {
                    id = v.id,
                    pos = json.decode(v.position),
                    message = v.message,
                })
            end
        end)
    end

    CreateThread(function()
        fetchLabo()
        fetchSell()
    end)

    secured_RegisterNetEvent('kayscore:labs:fetchAll', function()
        local source = source
        TriggerClientEvent('kayscore:labs:recieve', source, drugs_laboratories)

        secured_TriggerClientEvent('kayscore:admin:drugs:sendSell', source, drugs_sell)
    end)

    secured_RegisterNetEvent('kayscore:admin:labo:create', function(data)
        local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == 'user' then return end
        MySQL.insert("INSERT INTO illegal_laboratory (name, type, interior, owner, pos) VALUES (?,?,?,?,?)", {
            data.name,
            data.activeLaboratoryName,
            json.encode({}),
            'none',
            json.encode(data.pos)
        }, function()
            fetchLabo()

            TriggerClientEvent('kayscore:labs:recieve', -1, drugs_laboratories)
        end)
    end)

    secured_RegisterNetEvent('kayscore:drugs:sell:addPos', function(pos, message)
        local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == 'user' then return end
        MySQL.Async.execute('INSERT INTO drugs_sell (positon, message) VALUES (?,?)', {
            pos = json.encode(pos),
            message = message
        })

        fetchSell()

        Wait(1000)

        secured_TriggerClientEvent('kayscore:admin:drugs:sendSell', -1, drugs_sell)
    end)

    secured_RegisterNetEvent('kayscore:drugs:sell:delete', function(id)
        local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == 'user' then return end
        MySQL.Async.execute('DELETE FROM drug_sell WHERE id = @id', {
            ['@id'] = id
        }, function()
            for k,v in pairs(drugs_sell) do
                if v.id == id then
                    table.remove(drugs_sell, k)
                end
            end

            secured_TriggerClientEvent('kayscore:admin:drugs:sendSell', -1, drugs_sell)
        end)
    end)
end)