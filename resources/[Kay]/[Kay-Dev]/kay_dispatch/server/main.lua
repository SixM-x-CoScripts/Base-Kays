ESX = nil

Id = 0

Units = {}
Calls = {}
callSigns = {}
UnitStatus = {}

Names = {}

ESX = exports["frwk"]:getSharedObject()

MySQL.ready(
    function()
        MySQL.Async.fetchAll(
            "SELECT identifier,firstname,lastname FROM users WHERE 1",
            {},
            function(info)
                for _, v in ipairs(info) do
                    Names[v.identifier] = {firstname = v.firstname, lastname = v.lastname}
                end
            end
        )
    end
)

-- AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
--     local result = MySQL.Sync.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", {
--         ['@identifier'] = xPlayer.identifier
--     })

--     local dafirstname = result[1].firstname
--     local dalastname  = result[1].lastname
--     Names[xPlayer.identifier] = {firstname = dafirstname, lastname = dalastname}
-- end) 

RegisterServerEvent("kay_dispatch:playerStatus")
AddEventHandler("kay_dispatch:playerStatus", function(status)
    local src = source

    if status.carPlate ~= "" then
        Units[src] = {plate = status.carPlate, type = status.type, job = status.job, netId = status.netId}
    else
        Units[src] = {plate = math.random(1111,9999), type = 22, job = status.job, netId = status.netId}
    end
end)

RegisterServerEvent("kay_dispatch:removePlayer")
AddEventHandler("kay_dispatch:removePlayer", function()
    local src = source

    Units[src] = nil
end)

RegisterServerEvent("kay_dispatch:removeCall")
AddEventHandler("kay_dispatch:removeCall", function(id)
    local src = source

    if #Calls[tonumber(id)].respondingUnits == 0 then
        Calls[tonumber(id)] = nil
        TriggerClientEvent("kay_dispatch:removeCallClient", -1, id, src)
    else
        TriggerClientEvent('kay_dispatch:SendTextMessage', src, Config.Text['active_units_error'])
    end
end)

RegisterServerEvent("kay_dispatch:unitResponding")
AddEventHandler("kay_dispatch:unitResponding", function(id, job)
    local src = source
   
    if Calls[tonumber(id)] ~= nil then
        table.insert(Calls[tonumber(id)].respondingUnits, {unit = src, type = job})
        TriggerClientEvent("kay_dispatch:acceptCallClient", src, id, src)

    else
       TriggerClientEvent('kay_dispatch:SendTextMessage', src, Config.Text['cant_accept_call'])
    end
end)

RegisterServerEvent("kay_dispatch:changeStatus")
AddEventHandler("kay_dispatch:changeStatus", function(userid, status)
    UnitStatus[tostring(userid)] = status
   
end)

RegisterServerEvent("kay_dispatch:unitDismissed")
AddEventHandler("kay_dispatch:unitDismissed", function(id)
    local src = source
    local count = 1

    for _, v in ipairs(Calls[tonumber(id)].respondingUnits) do
        if v.unit == src then
            table.remove(Calls[tonumber(id)].respondingUnits, count)
        end
        count = count + 1
    end
end)

RegisterServerEvent("kay_dispatch:forwardCall")
AddEventHandler("kay_dispatch:forwardCall", function(id, job)
    local add = true
    for _, v in ipairs(Calls[tonumber(id)].job) do
        if v == job then
            add = false
        end
    end

    if add then
        table.insert(Calls[tonumber(id)].job, job)

        TriggerClientEvent("kay_dispatch:callAdded", -1, tonumber(id), Calls[tonumber(id)], job, 5000)
    end
end)

RegisterServerEvent("kay_dispatch:addMessage")
AddEventHandler("kay_dispatch:addMessage", function(message, location, job, cooldown, sprite, color)
    local src = source
    local identifier = ESX.GetPlayerFromId(src).getIdentifier()
        local phone =
            MySQL.Sync.fetchScalar(
            "SELECT phone_number FROM users WHERE identifier = @identifier ",
            {["@identifier"] = identifier}
        )
    Calls[Id] = {
        code = "",
        title = "",
        extraInfo = {},
        respondingUnits = {},
        coords = location,
        job = {job},
        phone = phone,
        message = message,
        type = "message",
        caller = src,
        id = Id
    }

    TriggerClientEvent("kay_dispatch:callAdded", -1, Id, Calls[Id], job, cooldown or 5000, sprite or 11, color or 5)

    Id = Id + 1
end)

RegisterServerEvent("kay_dispatch:addCall")
AddEventHandler("kay_dispatch:addCall", function(code, title, info, location, job, cooldown, sprite, color)
    Calls[Id] = {
        code = code,
        title = title,
        extraInfo = info,
        respondingUnits = {},
        coords = location,
        job = {job},
        type = "call",
        id = Id
    }

    TriggerClientEvent("kay_dispatch:callAdded", -1, Id, Calls[Id], job, cooldown or 3500, sprite or 11, color or 5)

    Id = Id + 1
end)


RegisterServerEvent("kay_dispatch:changeCallSign")
AddEventHandler("kay_dispatch:changeCallSign", function(callsign)
        local src = source
        if string.len(callsign) <= 4 then
        local Player = ESX.GetPlayerFromId(src)
        Player.set("callsign", callsign)
        callSigns[src] = callsign
        TriggerClientEvent('kay_dispatch:SendTextMessage', src, Config.Text['callsign_changed'])
    else
  TriggerClientEvent('kay_dispatch:SendTextMessage', src, Config.Text['callsign_char_long'])
    end
end)


RegisterServerEvent("kay_dispatch:arrivalNotice")
AddEventHandler("kay_dispatch:arrivalNotice", function(caller)
    if caller ~= nil then
        TriggerClientEvent("kay_dispatch:arrivalNoticeClient", caller)
    end
end)

RegisterCommand("callsign", function(source, args, rawCommand)

      local src = source
    local Player = ESX.GetPlayerFromId(src)

    if Player.getJob().name == Config.JobOne.job or Player.getJob().name == Config.JobTwo.job or Player.getJob().name == Config.JobThree.job then
    if string.len(args[1]) <= 4 then
      
        local Player = ESX.GetPlayerFromId(src)
        Player.set("callsign", args[1])
        callSigns[src] = args[1]
        TriggerClientEvent('kay_dispatch:SendTextMessage', src, Config.Text['callsign_changed'])
    else
        TriggerClientEvent('kay_dispatch:SendTextMessage', src, Config.Text['callsign_char_long'])
    end
else
 TriggerClientEvent('kay_dispatch:SendTextMessage', src, Config.Text['no_permission'])
end


end)



RegisterServerEvent("kay_dispatch:setCallSign")
AddEventHandler("kay_dispatch:setCallSign", function(callsign)
    local src = source
    callSigns[src] = callsign
end)

ESX.RegisterServerCallback("kay_dispatch:getPersonalInfo", function(source, cb)
    local identifier = ESX.GetPlayerFromId(source).getIdentifier()
    local firstname = Names[identifier].firstname
    local lastname = Names[identifier].lastname
    cb(firstname, lastname)

end)

ESX.RegisterServerCallback("kay_dispatch:getInfo", function(source, cb)
    local generated = {}

    for k, v in pairs(Units) do
        if ESX.GetPlayerFromId(k) then
            local identifier = ESX.GetPlayerFromId(k).getIdentifier()           
            local firstname = Names[identifier].firstname
            local lastname = Names[identifier].lastname
            local job = ESX.GetPlayerFromId(k).job.name

            if generated[v.plate] == nil then

                generated[v.plate] = {
                    type = Config.Icons[v.type],
                    units = {{id = k, name = firstname .. " " .. lastname, job = job}},
                    job = v.job -- not sure why this is still neede leaving
                }
            else
                table.insert(generated[v.plate].units, {id = k, name = firstname .. " " .. lastname, job = job})
            end
        end
    end
    cb(generated, Calls, UnitStatus, callSigns)
end)

ESX.RegisterServerCallback("kay_dispatch:getUnits", function(source, cb)
    local generated = {}

    for k, v in pairs(Units) do
        local player = ESX.GetPlayerFromId(k)
        if player then
            local identifier = player.getIdentifier()
            if Names[identifier] and Names[identifier].firstname and Names[identifier].lastname then
                local firstname = Names[identifier].firstname
                local lastname = Names[identifier].lastname

                generated[k] = {
                    netId = v.netId,
                    firstname = firstname,
                    lastname = lastname,
                    type = v.type,
                    job = v.job
                }
            end
        end
    end
    cb(generated)
end)
