openCreateCoffre = false

local coffreData = {
    coffreName = nil,
    coffrePos = nil,
    coffreItem = false,
    addonInventory = nil,
    coffreWeapon = false,
    datastore = nil,
    job1Acces = false,
    job1Name = nil,
    job2Acces = false,
    job2Name = nil,
    weightSystem = false,
    maxWeight = nil,
}

menuCoffreCreate = RageUI.CreateMenu(traduction("menu_name"), traduction("menu_desc"), nil, nil, nil, nil, 0, 0, 255, 255);
menuCoffreCreate.Closed = function()
    openCreateCoffre = false
    DisplayRadar(true)
end

local function text(textSelected)
    if textSelected ~= nil then return ("~g~%s"):format(textSelected) else return traduction("define_text") end
end

local function pos(posSelected)
    if posSelected ~= nil then return traduction("text") else return traduction("define_text") end
end

function openCoffreCreator()
    openCreateCoffre = true
    DisplayRadar(false)

    RageUI.Visible(menuCoffreCreate, not RageUI.Visible(menuCoffreCreate))

    while openCreateCoffre do
        Citizen.Wait(0)

        RageUI.IsVisible(menuCoffreCreate, function()
            RageUI.Separator(traduction("separator_desc_menu"))
            RageUI.Button(traduction("button_coffre_name"), traduction("button_coffre_name_desc"), {RightLabel = text(coffreData.coffreName)}, not serverInterrac, {
                onSelected = function()
                    local value = showBox("Nom du coffre", "", 35, false)
                    if value ~= nil then
                        coffreData.coffreName = value
                    else
                        ESX.ShowNotification(traduction("not_value"))
                    end
                end,
            })
            RageUI.Button(traduction("button_pos_name"), traduction("button_pos_name_desc"), {RightLabel = pos(coffreData.coffrePos)}, not serverInterrac, {
                onSelected = function()
                    local playerPos = GetEntityCoords(PlayerPedId())
                    local markerPos = vector3(playerPos)
                    print(markerPos)
                    coffreData.coffrePos = markerPos
                end,
            })
            RageUI.Separator(traduction("separator_option"))
            RageUI.Checkbox(traduction("checkbox_iventory_name"), traduction("checkbox_iventory_name_desc"), coffreData.coffreItem, { }, {
                onChecked = function()
                    coffreData.coffreItem = true
                end,
                onUnChecked = function()
                    coffreData.coffreItem = false
                end,
                onSelected = function(Index)
                    coffreData.coffreItem = Index;
                end
            })
            if coffreData.coffreItem then
                RageUI.Separator(traduction("separator_option_item"))
                RageUI.Button(traduction("button_iventory_name"), traduction("button_iventory_name_desc"), {RightLabel = text(coffreData.addonInventory)}, not serverInterrac, {
                    onSelected = function()
                        local value = showBox("Nom du coffre", "society_", 35, false)
                        if value ~= nil then
                            coffreData.addonInventory = value
                        else
                            ESX.ShowNotification(traduction("not_value"))
                        end
                    end,
                })
                RageUI.Separator()
            else
                RageUI.Button(traduction("button_iventory_name"), traduction("button_iventory_name_desc"), {}, false, {})
            end
            RageUI.Checkbox(traduction("checkbox_weapons_name"), traduction("checkbox_weapons_name_desc"), coffreData.coffreWeapon, { }, {
                onChecked = function()
                    coffreData.coffreWeapon = true
                end,
                onUnChecked = function()
                    coffreData.coffreWeapon = false
                end,
                onSelected = function(Index)
                    coffreData.coffreWeapon = Index;
                end
            })
            if coffreData.coffreWeapon then
                RageUI.Separator(traduction("separator_option_weapon"))
                RageUI.Button(traduction("button_datastore_name"), traduction("button_datastore_name_desc"), {RightLabel = text(coffreData.datastore)}, not serverInterrac, {
                    onSelected = function()
                        local value = showBox("Nom du coffre", "society_", 35, false)
                        if value ~= nil then
                            coffreData.datastore = value
                        else
                            ESX.ShowNotification(traduction("not_value"))
                        end
                    end,
                })
                RageUI.Separator()
            else
                RageUI.Button(traduction("button_datastore_name"), traduction("button_datastore_name_desc"), {}, false, {})
            end
            RageUI.Separator(traduction("separator_permission"))
            RageUI.Checkbox(traduction("checkbox_job1_name"), traduction("checkbox_job1_name_desc"), coffreData.job1Acces, { }, {
                onChecked = function()
                    coffreData.job1Acces = true
                end,
                onUnChecked = function()
                    coffreData.job1Acces = false
                    coffreData.job1Name = nil
                end,
                onSelected = function(Index)
                    coffreData.job1Acces = Index;
                end
            })
            if coffreData.job1Acces then
                RageUI.Button(traduction("button_job1_name"), traduction("button_job1_name_desc"), {RightLabel = text(coffreData.job1Name)}, not serverInterrac, {
                    onSelected = function()
                        local value = showBox("Nom du coffre", "", 35, false)
                        if value ~= nil then
                            coffreData.job1Name = value
                        else
                            ESX.ShowNotification(traduction("not_value"))
                        end
                    end,
                })
            else
                RageUI.Button(traduction("button_job1_name"), traduction("button_job1_name_desc"), {}, false, {})
            end
            RageUI.Checkbox(traduction("checkbox_job2_name"), traduction("checkbox_job2_name_desc"), coffreData.job2Acces, { }, {
                onChecked = function()
                    coffreData.job2Acces = true
                end,
                onUnChecked = function()
                    coffreData.job2Acces = false
                    coffreData.job2Name = nil
                end,
                onSelected = function(Index)
                    coffreData.job2Acces = Index;
                end
            })
            if coffreData.job2Acces then
                RageUI.Button(traduction("button_job2_name"), traduction("button_job2_name_desc"), {RightLabel = text(coffreData.job2Name)}, not serverInterrac, {
                    onSelected = function()
                        local value = showBox("Nom du coffre", "", 35, false)
                        if value ~= nil then
                            coffreData.job2Name = value
                        else
                            ESX.ShowNotification(traduction("not_value"))
                        end
                    end,
                })
            else
                RageUI.Button(traduction("button_job2_name"), traduction("button_job2_name_desc"), {}, false, {})
            end
            if coffreData.coffreName ~= nil then
                if coffreData.coffreItem or coffreData.coffreWeapon then
                    if not coffreData.coffreItem then
                        if coffreData.coffreWeapon then
                            if (coffreData.datastore ~= nil) then
                                if coffreData.job1Acces or coffreData.job2Acces then
                                    if (coffreData.job1Name ~= nil) or (coffreData.job2Name ~= nil) then 
                                        RageUI.Button(traduction("button_valid_information"), nil, {Color = {BackgroundColor = {0, 255, 0, 245}, HightLightColor = {0, 255, 0, 245}}}, not serverInterrac, {
                                            onSelected = function()
                                                serverInterrac = true
                                                TriggerServerEvent("vCoffre:validCoffre", coffreData)
                                                RageUI.CloseAll()
                                                openCreateCoffre = false
                                                DisplayRadar(true)
                                                coffreData.coffreName = nil
                                                coffreData.coffrePos = nil
                                                coffreData.coffreItem = false
                                                coffreData.addonInventory = nil
                                                coffreData.coffreWeapon = false
                                                coffreData.datastore = nil
                                                coffreData.job1Acces = false
                                                coffreData.job1Name = nil
                                                coffreData.job2Acces = false
                                                coffreData.job2Name = nil
                                            end,
                                        })
                                    else
                                        RageUI.Button(traduction("button_not_job_name"), nil, {Color = {BackgroundColor = {255, 0, 0, 245}, HightLightColor = {255, 0, 0, 245}}}, false, {})
                                    end
                                else
                                    RageUI.Button(traduction("button_not_job"), nil, {Color = {BackgroundColor = {255, 0, 0, 245}, HightLightColor = {255, 0, 0, 245}}}, false, {})
                                end
                            else
                                RageUI.Button(traduction("button_not_datastore_name"), nil, {Color = {BackgroundColor = {255, 0, 0, 245}, HightLightColor = {255, 0, 0, 245}}}, false, {})
                            end
                        end
                    else
                        if (coffreData.addonInventory ~= nil) then
                            if not coffreData.weightSystem then
                                if not coffreData.coffreWeapon then
                                    if coffreData.job1Acces or coffreData.job2Acces then
                                        if (coffreData.job1Name ~= nil) or (coffreData.job2Name ~= nil) then 
                                            RageUI.Button(traduction("button_valid_information"), nil, {Color = {BackgroundColor = {0, 255, 0, 245}, HightLightColor = {0, 255, 0, 245}}}, not serverInterrac, {
                                                onSelected = function()
                                                    serverInterrac = true
                                                    TriggerServerEvent("vCoffre:validCoffre", coffreData)
                                                    RageUI.CloseAll()
                                                    openCreateCoffre = false
                                                    DisplayRadar(true)
                                                    coffreData.coffreName = nil
                                                    coffreData.coffrePos = nil
                                                    coffreData.coffreItem = false
                                                    coffreData.addonInventory = nil
                                                    coffreData.coffreWeapon = false
                                                    coffreData.datastore = nil
                                                    coffreData.job1Acces = false
                                                    coffreData.job1Name = nil
                                                    coffreData.job2Acces = false
                                                    coffreData.job2Name = nil
                                                end,
                                            })
                                        else
                                            RageUI.Button(traduction("button_not_job_name"), nil, {Color = {BackgroundColor = {255, 0, 0, 245}, HightLightColor = {255, 0, 0, 245}}}, false, {})
                                        end
                                    else
                                        RageUI.Button(traduction("button_not_job"), nil, {Color = {BackgroundColor = {255, 0, 0, 245}, HightLightColor = {255, 0, 0, 245}}}, false, {})
                                    end
                                else
                                    if (coffreData.datastore ~= nil) then
                                        if coffreData.job1Acces or coffreData.job2Acces then
                                            if (coffreData.job1Name ~= nil) or (coffreData.job2Name ~= nil) then 
                                                RageUI.Button(traduction("button_valid_information"), nil, {Color = {BackgroundColor = {0, 255, 0, 245}, HightLightColor = {0, 255, 0, 245}}}, not serverInterrac, {
                                                    onSelected = function()
                                                        serverInterrac = true
                                                        TriggerServerEvent("vCoffre:validCoffre", coffreData)
                                                        RageUI.CloseAll()
                                                        openCreateCoffre = false
                                                        DisplayRadar(true)
                                                        coffreData.coffreName = nil
                                                        coffreData.coffrePos = nil
                                                        coffreData.coffreItem = false
                                                        coffreData.addonInventory = nil
                                                        coffreData.coffreWeapon = false
                                                        coffreData.datastore = nil
                                                        coffreData.job1Acces = false
                                                        coffreData.job1Name = nil
                                                        coffreData.job2Acces = false
                                                        coffreData.job2Name = nil
                                                    end,
                                                })
                                            else
                                                RageUI.Button(traduction("button_not_job_name"), nil, {Color = {BackgroundColor = {255, 0, 0, 245}, HightLightColor = {255, 0, 0, 245}}}, false, {})
                                            end
                                        else
                                            RageUI.Button(traduction("button_not_job"), nil, {Color = {BackgroundColor = {255, 0, 0, 245}, HightLightColor = {255, 0, 0, 245}}}, false, {})
                                        end
                                    else
                                        RageUI.Button(traduction("button_not_datastore_name"), nil, {Color = {BackgroundColor = {255, 0, 0, 245}, HightLightColor = {255, 0, 0, 245}}}, false, {})
                                    end
                                end
                            else
                                if (coffreData.maxWeight ~= nil) then 
                                    if (coffreData.maxWeight > 0) then
                                        if not coffreData.coffreWeapon then
                                            if coffreData.job1Acces or coffreData.job2Acces then
                                                if (coffreData.job1Name ~= nil) or (coffreData.job2Name ~= nil) then 
                                                    RageUI.Button(traduction("button_valid_information"), nil, {Color = {BackgroundColor = {0, 255, 0, 245}, HightLightColor = {0, 255, 0, 245}}}, not serverInterrac, {
                                                        onSelected = function()
                                                            serverInterrac = true
                                                            TriggerServerEvent("vCoffre:validCoffre", coffreData)
                                                            RageUI.CloseAll()
                                                            openCreateCoffre = false
                                                            DisplayRadar(true)
                                                            coffreData.coffreName = nil
                                                            coffreData.coffrePos = nil
                                                            coffreData.coffreItem = false
                                                            coffreData.addonInventory = nil
                                                            coffreData.coffreWeapon = false
                                                            coffreData.datastore = nil
                                                            coffreData.job1Acces = false
                                                            coffreData.job1Name = nil
                                                            coffreData.job2Acces = false
                                                            coffreData.job2Name = nil
                                                        end,
                                                    })
                                                else
                                                    RageUI.Button(traduction("button_not_job_name"), nil, {Color = {BackgroundColor = {255, 0, 0, 245}, HightLightColor = {255, 0, 0, 245}}}, false, {})
                                                end
                                            else
                                                RageUI.Button(traduction("button_not_job"), nil, {Color = {BackgroundColor = {255, 0, 0, 245}, HightLightColor = {255, 0, 0, 245}}}, false, {})
                                            end
                                        else
                                            if (coffreData.datastore ~= nil) then
                                                if coffreData.job1Acces or coffreData.job2Acces then
                                                    if (coffreData.job1Name ~= nil) or (coffreData.job2Name ~= nil) then 
                                                        RageUI.Button(traduction("button_valid_information"), nil, {Color = {BackgroundColor = {0, 255, 0, 245}, HightLightColor = {0, 255, 0, 245}}}, not serverInterrac, {
                                                            onSelected = function()
                                                                serverInterrac = true
                                                                TriggerServerEvent("vCoffre:validCoffre", coffreData)
                                                                RageUI.CloseAll()
                                                                openCreateCoffre = false
                                                                DisplayRadar(true)
                                                                coffreData.coffreName = nil
                                                                coffreData.coffrePos = nil
                                                                coffreData.coffreItem = false
                                                                coffreData.addonInventory = nil
                                                                coffreData.coffreWeapon = false
                                                                coffreData.datastore = nil
                                                                coffreData.job1Acces = false
                                                                coffreData.job1Name = nil
                                                                coffreData.job2Acces = false
                                                                coffreData.job2Name = nil
                                                            end,
                                                        })
                                                    else
                                                        RageUI.Button(traduction("button_not_job_name"), nil, {Color = {BackgroundColor = {255, 0, 0, 245}, HightLightColor = {255, 0, 0, 245}}}, false, {})
                                                    end
                                                else
                                                    RageUI.Button(traduction("button_not_job"), nil, {Color = {BackgroundColor = {255, 0, 0, 245}, HightLightColor = {255, 0, 0, 245}}}, false, {})
                                                end
                                            else
                                                RageUI.Button(traduction("button_not_datastore_name"), nil, {Color = {BackgroundColor = {255, 0, 0, 245}, HightLightColor = {255, 0, 0, 245}}}, false, {})
                                            end
                                        end
                                    else
                                        RageUI.Button(traduction("button_invalid_weight"), nil, {Color = {BackgroundColor = {255, 0, 0, 245}, HightLightColor = {255, 0, 0, 245}}}, false, {})
                                    end
                                else
                                    RageUI.Button(traduction("button_not_weight"), nil, {Color = {BackgroundColor = {255, 0, 0, 245}, HightLightColor = {255, 0, 0, 245}}}, false, {})
                                end
                            end
                        else
                            RageUI.Button(traduction("button_not_addoninventory_name"), nil, {Color = {BackgroundColor = {255, 0, 0, 245}, HightLightColor = {255, 0, 0, 245}}}, false, {})
                        end
                    end
                else
                    RageUI.Button(traduction("button_not_type_selected"), nil, {Color = {BackgroundColor = {255, 0, 0, 245}, HightLightColor = {255, 0, 0, 245}}}, false, {})
                end
            else
                RageUI.Button(traduction("button_not_coffre_name"), nil, {Color = {BackgroundColor = {255, 0, 0, 245}, HightLightColor = {255, 0, 0, 245}}}, false, {})
            end
            RageUI.Separator()
            RageUI.Button(traduction("button_delete_information"), nil, {RightLabel = ">>", Color = {BackgroundColor = {255, 0, 0, 105}, HightLightColor = {255, 0, 0, 25}}}, not serverInterrac, {
                onSelected = function()
                    RageUI.CloseAll()
                    openCreateCoffre = false
                    DisplayRadar(true)
                    coffreData.coffreName = nil
                    coffreData.coffrePos = nil
                    coffreData.coffreItem = false
                    coffreData.addonInventory = nil
                    coffreData.coffreWeapon = false
                    coffreData.datastore = nil
                    coffreData.job1Acces = false
                    coffreData.job1Name = nil
                    coffreData.job2Acces = false
                    coffreData.job2Name = nil
                end,
            })
        end)
    end
end
