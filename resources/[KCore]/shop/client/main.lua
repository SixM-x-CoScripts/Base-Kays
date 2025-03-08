local isUiOpen = false

function OpenShop(shopType)
    TriggerServerEvent('shop:requestItems', shopType)
end

RegisterNetEvent('shop:openMenu')
AddEventHandler('shop:openMenu', function(items, shopType)
    if not isUiOpen then
        SetNuiFocus(true, true)

        SendNuiMessage(json.encode({
            action = 'open',
            items = items,
            shopType = shopType
        }))

        isUiOpen = true
    else   
        SetNuiFocus(false, false)
        SendNuiMessage(json.encode({
            action = 'close'
        }))
        isUiOpen = false
    end
end)

RegisterNetEvent('shop:openShop')
AddEventHandler('shop:openShop', function(shopType)
    OpenShop(shopType)
end)

RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
    SendNuiMessage(json.encode({
        action = 'close'
    }))
    isUiOpen = false
end)

RegisterNUICallback('closeall', function()
    SetNuiFocus(false, false)
    SendNuiMessage(json.encode({
        action = 'close'
    }))
    isUiOpen = false
end)

RegisterNUICallback('checkMoney', function(data, cb)
    TriggerServerEvent('shop:checkMoney', data)
    cb('ok')
end)

RegisterNetEvent('shop:checkoutResult')
AddEventHandler('shop:checkoutResult', function(success)
    if success then
        SendNuiMessage(json.encode({
            action = 'clearCart'
        }))
        SetNuiFocus(false, false)
        isUiOpen = false
    else
        TriggerEvent('esx:showNotification', 'Vous n\'avez pas assez d\'argent.')
    end
end)
