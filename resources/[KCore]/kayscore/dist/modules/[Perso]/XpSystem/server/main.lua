AddEventHandler('esx:playerLoaded', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {["@identifier"] = xPlayer.identifier}, function(result)
        TriggerClientEvent('XNL_NET:XNL_SetInitialXPLevels', source, result[1].xp, true, true)
    end)
end)

RegisterNetEvent("XNL_NET:AddPlayerXP", function(xp, token)
    if xp > 1050 then
        DropPlayer(source, kayscoreConfigServ.XpSystems.KickMessage)
        return 
    end
   -- VerifyToken(source, token, 'XNL_NET:AddPlayerXP', function()
        local src = source
        local xPlayer = ESX.GetPlayerFromId(src)
        TriggerClientEvent("XNL_NET:AddPlayerXP", src, xp)
        MySQL.Async.execute("UPDATE users SET xp = xp + @xp WHERE identifier = @identifier", {["@xp"] = xp, ["@identifier"] = xPlayer.identifier}, function() end)
   -- end, function()

   -- end)
end)