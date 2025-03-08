

local open = false
local mainMenu = RageUI.CreateMenu('', 'Job Items')
mainMenu.Closed = function()
    open = false
end

function OpenMenu()
    if open then
        open = false
        RageUI.Visible(mainMenu, false)
    else
        open = true
        RageUI.Visible(mainMenu, true)
    end
end

RegisterCommand('fourni-menu', function()
    OpenMenu()
end, false)

local mainMenu = RageUI.CreateMenu('', 'Job Items')
mainMenu.Closed = function()
    open = false
end
function OpenMenu()
    if open then
        open = false
        RageUI.Visible(mainMenu, false)
        return
    else
        open = true
        RageUI.Visible(mainMenu, true)
        Citizen.CreateThread(function()
            while open do
                RageUI.IsVisible(mainMenu, function()
                    local job = ESX.GetPlayerData().job.name
                    local items = Config_Fournisseur.Jobs[job]
                    if items then
                        for i=1, #items, 1 do
                            local item = items[i]
                            RageUI.Button(item.label, nil, { RightLabel = "$" .. item.price }, true, {
                                onSelected = function()
                                    KeyboardUtils.use("Combien ?", function(data)
                                        local cmb = tonumber(data)
                                        if cmb == nil or cmb <= 0 then return end -- Utilisez cmb au lieu de data ici
                                        TriggerServerEvent('menu:buyItem', job, item.item, item.label, item.price, cmb) -- Utilisez cmb au lieu de data ici
                                    end)
                                end
                            })
                        end
                    else
                        RageUI.Separator('Aucun item disponible')
                    end
                end)
                Citizen.Wait(0)
            end
        end)
    end
end



local JobResto = {
    inService = false,
}

function JobResto:openMenu()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')

    local jobName = nil

    if ESX and ESX.PlayerData and ESX.PlayerData.job then
        jobName = ESX.PlayerData.job.name
    end

    if jobName and Config_Fournisseur.Jobs[jobName] then
        RageUI.Visible(main, not RageUI.Visible(main))
        while main do
            Wait(1)
            RageUI.IsVisible(main, function()
                local jobName = ESX.PlayerData.job.name
                local jobLabel = ESX.PlayerData.job.label

                RageUI.Checkbox('Statut de l\'entreprise', 'Quand cette case est cochée votre ENTREPRISE est notée comme ouverte', Society.List[ESX.PlayerData.job.name].state, {}, {
                    onChecked = function()
                        secured_TriggerServerEvent('kayscore:jobs:updateSocietyStatus', true)
                    end,
                    onUnChecked = function()
                        secured_TriggerServerEvent('kayscore:jobs:updateSocietyStatus', false)
                    end
                })
                RageUI.Checkbox('Service', nil, JobResto.inService, {}, {
                    onChecked = function()
                        JobResto.inService = true
                        TriggerServerEvent('kayscore:JobResto:service', true)
                    end,
                    onUnChecked = function()
                        JobResto.inService = false
                        TriggerServerEvent('kayscore:JobResto:service', false)
                    end
                })
                if JobResto.inService then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    RageUI.Button('Faire une facture', nil, {}, true, {
                        onSelected = function()
                            if closestDistance ~= -1 and closestDistance <= 3 then
                                KeyboardUtils.use('Montant', function(data)
                                    local amount = tonumber(data)
                                    if amount == nil or amount <= 0 then return end

                                    secured_TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_'..jobName, (jobLabel), data)
                                end)
                            else
                                ESX.ShowNotification("Aucun joueur à proximité")
                            end
                        end
                    })
                    
                    RageUI.WLine()
                    RageUI.Button('Faire une annonce personnaliser', nil, {}, true, {
                        onSelected = function()
                            local jobName = ESX.PlayerData.job.name
                      KeyboardUtils.use('Contenu', function(msg)
                                    if msg == nil then return end
                                    secured_TriggerServerEvent('monjob:annoncer', msg, jobName)
                                end)
                        end
                    })
                end
            end)
            
            if not RageUI.Visible(main) then
                RageUI.CloseAll()
                break 
            end
        end
    else

    end
end


RegisterKeyMapping('JobResto_menu', 'Menu Job Restaurant', 'keyboard', 'F6')

RegisterCommand('JobResto_menu', function()
    local playerPed = PlayerPedId()
    local jobName = nil

    if ESX and ESX.PlayerData and ESX.PlayerData.job then
        jobName = ESX.PlayerData.job.name
    end

    if jobName then
        if Config_Fournisseur.Jobs[jobName] then
            JobResto:openMenu()
        else
            --ESX.ShowNotification("Vous n'avez pas accès à ce menu.")
        end
    else
        -- print("Erreur: Impossible de récupérer les données du joueur.")
    end
end, false)


Citizen.CreateThread(function()
    for jobName, jobData in pairs(Config_Fournisseur.Jobs) do
        AddZones("fournisseur_" .. jobName, {
            Position = vector3(858.768311, -3204.768799, 5.994996),
            Dist = 10,
            Public = false,
            Job = { [jobName] = true },
            Job2 = {},
            GradesJob = {},
            InVehicleDisable = false,
            Blip = {
                Active = true,
                Position = vector3(858.768311, -3204.768799, 5.994996),
                BlipId = 176,
                Color = 3,
                Scale = 0.5,
                Text = 'Fournisseur Entreprise'
            },
            ActionText = 'Appuyez sur [ ~g~E~w~ ] pour interagir',
            Action = function()
                if ESX and ESX.PlayerData and ESX.PlayerData.job then
                    jobName = ESX.PlayerData.job.name
                end
            
                if jobName then
                    if Config_Fournisseur.Jobs[jobName] then
                        OpenMenu()
                    else
                    end
                end
            end
        })
    end
end)



