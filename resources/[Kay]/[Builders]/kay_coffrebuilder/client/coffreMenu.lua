local playerIventory, playerWeapons, coffreInventory, coffreWeapons = {}, {}, {}, {}
isOpenCoffreMenu = false

local function getPlayerJob()
    ESX.TriggerServerCallback("vCoffre:playerData", function(data)
        playerIventory = {}
        playerWeapons = {}
        for i = 1, #data.inventory, 1 do
            local playerItem = data.inventory[i]
            if playerItem.count > 0 then
                table.insert(playerIventory, {
                    label = playerItem.label,
                    nombre = playerItem.count,
                    name = playerItem.name
                })
            end
        end

        for i = 1, #data.weapons, 1 do
            local playerWeapon = data.weapons[i]
            table.insert(playerWeapons, {
                label = ESX.GetWeaponLabel(playerWeapon.name),
                munitions = playerWeapon.ammo,
                name = playerWeapon.name,
            })
        end
    end)
end

local function getCoffreItSAMS(coffreSelected)
    ESX.TriggerServerCallback("vCoffre:coffreItSAMS", function(itSAMS)
        coffreInventory = {}
        for i = 1, #itSAMS, 1 do
            local itSAMSStock = itSAMS[i]
            if itSAMSStock.count > 0 then
                table.insert(coffreInventory, {
                    label = itSAMSStock.label,
                    nombre = itSAMSStock.count,
                    name = itSAMSStock.name,
                })
            end
        end
    end, coffreSelected)
end

local function getCoffreWeapons(coffreSelected)
    ESX.TriggerServerCallback("vCoffre:coffreWeapons", function(weapons)
        coffreWeapons = {}
        for i = 1, #weapons, 1 do
            local weaponsStock = weapons[i]
            table.insert(coffreWeapons, {
                label = ESX.GetWeaponLabel(weaponsStock.name),
                munitions = weaponsStock.ammo,
                name = weaponsStock.name,
            })
        end
    end, coffreSelected)
end

menuCoffre = RageUI.CreateMenu(traduction("menu_coffre_name"), traduction("menu_coffre_desc"), nil, nil, nil, nil, 0, 0, 255, 255);
menuCoffre.Closed = function()
    isOpenCoffreMenu = false
    FreezeEntityPosition(PlayerPedId(), false)
    DisplayRadar(true)
end

openItemDeposit = RageUI.CreateSubMenu(menuCoffre, traduction("menu_coffre_name"), traduction("menu_coffre_desc"));
openItemDeposit.Closed = function()
end

openItemRecup = RageUI.CreateSubMenu(menuCoffre, traduction("menu_coffre_name"), traduction("menu_coffre_desc"));
openItemRecup.Closed = function()
end

openWeaponDeposit = RageUI.CreateSubMenu(menuCoffre, traduction("menu_coffre_name"), traduction("menu_coffre_desc"));
openWeaponDeposit.Closed = function()
end

openWeaponRecup = RageUI.CreateSubMenu(menuCoffre, traduction("menu_coffre_name"), traduction("menu_coffre_desc"));
openWeaponRecup.Closed = function()
end

function openCoffreMenu(coffreSelected)
    isOpenCoffreMenu = true
    DisplayRadar(false)
    getPlayerJob()

    if coffreSelected.coffreItem then
        getCoffreItSAMS(coffreSelected.addonInventory)
    end
    if coffreSelected.coffreWeapon then
        getCoffreWeapons(coffreSelected.datastore)
    end

    RageUI.Visible(menuCoffre, not RageUI.Visible(menuCoffre))

    while isOpenCoffreMenu do
        Citizen.Wait(0)

        RageUI.IsVisible(menuCoffre, function()
            RageUI.Separator(traduction("separator_coffre_name"):format(coffreSelected.coffreName))
            if coffreSelected.coffreItem then
                RageUI.Button(traduction("button_deposit_item_name"), traduction("button_deposit_item_name_desc"), {}, not serverInterrac, {}, openItemDeposit)
                RageUI.Button(traduction("button_recup_item_name"), traduction("button_recup_item_name_desc"), {}, not serverInterrac, {}, openItemRecup)
            end
            if coffreSelected.coffreWeapon then
                RageUI.Button(traduction("button_deposit_weapon_name"), traduction("button_deposit_weapon_name_desc"), {}, not serverInterrac, {}, openWeaponDeposit)
                RageUI.Button(traduction("button_recup_weapon_name"), traduction("button_recup_weapon_name_desc"), {}, not serverInterrac, {}, openWeaponRecup)
            end
        end)
        RageUI.IsVisible(openItemDeposit, function()
            for _,v in pairs(playerIventory) do
                RageUI.Button(traduction("button_deposit_item_selected_name"):format(v.label), nil, {RightLabel = traduction("rightlabel_total"):format(v.nombre)}, not serverInterrac, {
                    onSelected = function()
                        local value = tonumber(showBox(traduction("ckeckbox_montant"), "", 5, true))
                        if value ~= nil then
                            if value <= v.nombre then
                                serverInterrac = true
                                TriggerServerEvent("vCoffre:setItSAMS", coffreSelected, "deposit", v.name, value)
                                getPlayerJob()
                                getCoffreItSAMS(coffreSelected.addonInventory)
                            else
                                ESX.ShowNotification(traduction("item_selected_sup"))
                            end
                        else
                            ESX.ShowNotification(traduction("not_value"))
                        end
                    end,    
                })
            end
        end)
        RageUI.IsVisible(openItemRecup, function()
            for _,v in pairs(coffreInventory) do
                RageUI.Button(traduction("button_deposit_item_selected_name"):format(v.label), nil, {RightLabel = traduction("rightlabel_total"):format(v.nombre)}, not serverInterrac, {
                    onSelected = function()
                        local value = tonumber(showBox(traduction("ckeckbox_montant"), "", 5, true))
                        if value ~= nil then
                            if value <= v.nombre then
                                serverInterrac = true
                                TriggerServerEvent("vCoffre:setItSAMS", coffreSelected, "recup", v.name, value)
                                getPlayerJob()
                                getCoffreItSAMS(coffreSelected.addonInventory)
                            else
                                ESX.ShowNotification(traduction("item_selected_sup"))
                            end
                        else
                            ESX.ShowNotification(traduction("not_value"))
                        end
                    end,    
                })
            end
        end)
        RageUI.IsVisible(openWeaponDeposit, function()
            for _,v in pairs(playerWeapons) do
                RageUI.Button(traduction("button_deposit_item_selected_name"):format(v.label), nil, {RightLabel = traduction("rightlabel_total"):format(v.munitions)}, not serverInterrac, {
                    onSelected = function()
                        serverInterrac = true
                        TriggerServerEvent("vCoffre:setWeapons", coffreSelected, "deposit", v)
                        getPlayerJob()
                        getCoffreWeapons(coffreSelected.datastore)
                    end,   
                })
            end
        end)
        RageUI.IsVisible(openWeaponRecup, function()
            for _,v in pairs(coffreWeapons) do
                RageUI.Button(traduction("button_deposit_item_selected_name"):format(v.label), nil, {RightLabel = traduction("rightlabel_total"):format(v.munitions)}, not serverInterrac, {
                    onSelected = function()
                        serverInterrac = true
                        TriggerServerEvent("vCoffre:setWeapons", coffreSelected, "recup", v)
                        getPlayerJob()
                        getCoffreWeapons(coffreSelected.datastore)
                    end,   
                })
            end
        end)
    end
end