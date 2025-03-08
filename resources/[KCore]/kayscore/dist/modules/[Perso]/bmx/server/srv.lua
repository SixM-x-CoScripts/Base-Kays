ESX.RegisterUsableItem('bmx', function(source)
    TriggerClientEvent('bmx:useBmx', source)
end)

RegisterNetEvent("bmx:addBmx", function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer.canCarryItem('bmx', 1) then TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez de place dans votre inventaire") return end
    xPlayer.addInventoryItem('bmx', 1)
    TriggerClientEvent('esx:showNotification', src, "Vous avez reçu un BMX.")
end)

RegisterNetEvent("bmx:removeBmx", function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local item = xPlayer.getInventoryItem('bmx')

  --  if item.count > 0 then
        xPlayer.removeInventoryItem('bmx', 1)
      --  TriggerClientEvent('esx:showNotification', src, "Vous avez rangé votre BMX.")
 --   else
      --  TriggerClientEvent('esx:showNotification', src, "Vous n'avez pas de BMX à ranger.")
 --   end
end)