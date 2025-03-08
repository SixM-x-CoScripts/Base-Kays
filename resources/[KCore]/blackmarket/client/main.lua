Citizen.CreateThread(function()
    local pedCoords = XMR.PedCoords
    if XMR.Ped == nil then
       
        local pedHash = GetHashKey(XMR.PedHash) 
        RequestModel(pedHash)
        while not HasModelLoaded(pedHash) do
            Wait(1)
        end


    while true do
        local sleep = 750
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local distance = #(playerCoords - vector3(pedCoords.x, pedCoords.y, pedCoords.z))
        
        if distance < XMR.DrawDistance then
            sleep = 0
            DrawText3D(pedCoords.x, pedCoords.y, pedCoords.z+0.90, "[E] "..XMR.DrawText)
            
            if IsControlJustPressed(0, 38) then
                CASFunctions.DisplayUI()
            end
        end
        
        Citizen.Wait(sleep)
    end
end)


CASFunctions = {
    DisplayUI = function()
        local Items = {}
        for i in pairs(XMR.Items) do
            Items[#Items+1] = {
                label = XMR.Items[i].label,
                price = XMR.Items[i].price,
                imageSrc = XMR.Items[i].imageSrc,
                key = i,
                type = XMR.Items[i].type
            }
        end
        SendNUIMessage({
            action = "market",
            items = Items
        })
        SetNuiFocus(true,true)
    end
}
    



RegisterNUICallback("EscapeFromJs", function()
    SetNuiFocus(false,false)
end)


RegisterNUICallback("CompleteOrder", function(data, cb)
    print("yes")
    if not data.item or not data.price then return end
    print("none")
    if XMR.Framework == "qb" then
        QBCore.Functions.TriggerCallback("cas-server:BuyProducts",function(_)
            if (_) then
                Notify(XMR.CompleteText)
            end
            cb(_)
        end, data)
    elseif XMR.Framework == "esx" then
        ESX.TriggerServerCallback("cas-server:BuyProducts",function(_)
            if (_) then
                Notify(XMR.CompleteText)
            end
            cb(_)
        end,data)
    end
end)


function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry('STRING')
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


print('Locked by @SunnyHill')