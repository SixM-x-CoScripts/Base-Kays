local isInLtd = false
local isInPawnShop = false

AddEventHandler("ui:ltdOpen", function(items, cart, isPawnshop)
    setInInterface("ltd-job")
    isInLtd = true
    SetPlayerControl(PlayerId(), false, 12)
    SetNuiFocus(true, true)

    if isPawnshop then
        isInPawnShop = true
        SendNUIMessage({
            type = "ltdJob:setTexte",
            data = {
                buyForMe = "Ajoutez pour moi",
                buyForTarget = "Attribuez le panier",
                clearCart = "Vider le panier",
                btnAdd = "Ajoutez",
                totalPrice = "Prix total",
                filterHunger = "Nourriture",
                filterThirst = "Boisson",
                filterWeapon = "Arme",
                filterObjet = "Objet",
                filterAll = "Tout",
                logoImage = "/web/Pwn.png"
            }
        })
    else
        SendNUIMessage({
            type = "ltdJob:setTexte",
            data = {
                buyForMe = "Ajoutez pour moi",
                buyForTarget = "Attribuez le panier",
                clearCart = "Vider le panier",
                btnAdd = "Ajoutez",
                totalPrice = "Prix total",
                filterHunger = "Nourriture",
                filterThirst = "Boisson",
                filterWeapon = "Arme",
                filterObjet = "Objet",
                filterAll = "Tout",
                logoImage = "/web/LTD.png"
            }
        })
    end

    SendNUIMessage({
        type = "ltdJob:open",
        data = {
            items = items,
            cart = cart
        }
    })

    while isInLtd do
        Wait(0)

        closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        closestPosition = GetEntityCoords(GetPlayerPed(closestPlayer))

        if closestDistance ~= -1 and closestDistance <= 3.0 then
            DrawMarker(21, closestPosition.x, closestPosition.y, closestPosition.z + 0.95, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, 255, 255, 255, 170, 1, 1, 2, 0, nil, nil, 0)
        end
    end
end)

RegisterNUICallback('ltdJob:close', function(data)
    SetNuiFocus(false, false)
    SetPlayerControl(PlayerId(), true, 12)
    isInLtd = false
    isInPawnShop = false
    clearInterface()

    TriggerEvent('ltd:client:updateBasket', data.cart, isInPawnShop)
end)

RegisterNUICallback('ltdJob:clearCart', function()
    TriggerEvent('ltd:client:updateBasket', {}, isInPawnShop)
end)

RegisterNUICallback('ltdJob:buyForMe', function(data)
    SetNuiFocus(false, false)
    TriggerEvent('ltd:client:buyBasket', 1, data.cart, isInPawnShop)
end)

RegisterNUICallback('ltdJob:buyForTarget', function(data)
    SetNuiFocus(false, false)
    TriggerEvent('ltd:client:buyBasket', 2, data.cart, isInPawnShop)
end)