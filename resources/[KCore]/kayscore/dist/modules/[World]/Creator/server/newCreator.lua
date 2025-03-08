Citizen.CreateThread(function()
    --[[RegisterNetEvent('kayscore:save')
     AddEventHandler('kayscore:save', function (data)   
         local src = source
         local xPlayer = ESX.GetPlayerFromId(source)
         local firstname = data.firstname
         local lastname = data.lastname
         local dateofbirth = data.dateofbirth
         local sex = data.sex
         local Taille = data.height
         local LDN = data.ldn
 
         MySQL.Async.execute("UPDATE users SET firstname = @firstname, lastname = @lastname, dateofbirth = @dateofbirth, sex = @sex, height = @height, skin = @skin WHERE identifier = @identifier", {
             ['@identifier'] = xPlayer.identifier,
             ['@firstname'] = firstname,
             ['@lastname'] = lastname,
             ['@dateofbirth'] = dateofbirth,
             ['@sex'] = sex,
             ["@height"] = Taille,
             ["@skin"] = LDN
             
         })
     end)]]--
 
     ESX.RegisterServerCallback('kayscore:getData', function(source, cb)
         local src = source
         local xPlayer = ESX.GetPlayerFromId(source)
         MySQL.Async.fetchAll("SELECT skin FROM `users` WHERE `identifier` = @identifier",{['@identifier'] = xPlayer.identifier}, function(result)
             if json.encode(result[1].skin) == '[]' then
                 cb(true)
             else
                 cb(false)
             end
         end)
     end)
 
     RegisterNetEvent("SetBucket")
     AddEventHandler("SetBucket", function(number)
         local _src = source
         SetPlayerRoutingBucket(_src, number)
     end)
 
     --[[RegisterCommand('register', function(source, args)
         TriggerClientEvent('kayscore:openCreator', args[1])
     end)]]--
 
 end)