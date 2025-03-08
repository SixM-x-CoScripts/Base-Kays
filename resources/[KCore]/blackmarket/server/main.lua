local function Content(source,data)
    local retval = false
    local items = data.item
    local price = data.price
    local method = data.method
    local xPlayer = GetPlayer(source)
    if not xPlayer then print("Error Code 18, Open ticket") return end
    for i,j in pairs(items) do
        for k in pairs(XMR.Items) do
            if j.name == XMR.Items[k].label then
                local checkMoney = RemoveMoney(source, method, price)
                if checkMoney then AddItem(source, k, j.count) retval = true end
            end
        end
    end
    return retval
end

if XMR.Framework == "qb" then
    QBCore.Functions.CreateCallback("cas-server:BuyProducts",function(source,cb,data) 
        local check = Content(source, data)
        cb(check)
    end)
elseif XMR.Framework == "esx" then
    ESX.RegisterServerCallback("cas-server:BuyProducts",function(source,cb,data) 
        local check = Content(source, data)
        cb(check)
    end)
end

print('BlackMarket XMR --> FiveUI')

