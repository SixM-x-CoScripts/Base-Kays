local enterprisePermissions = {}
local organisationPermissions = {}

local enterpriseData = {
    recruit = {
        job = nil,
        created = {}
    },
    promote = {
        job = nil,
        created = {}
    }
}

local organisationData = {
    recruit = {
        job = nil,
        created = {}
    },
    promote = {
        job = nil,
        created = {}
    }
}

Citizen.CreateThread(function ()
    while GetResourceState("ox_target") ~= "started" do Citizen.Wait(0) end

    exports.ox_target:addGlobalPlayer({
        {
            label = "ID du joueur",
            icon = "fa-solid fa-id-card-clip",
            canInteract = function ()
               -- if exports["Slide"]:getInPersoMenu() then
               --     return false
             --   end

                return true
            end,
            onSelect = function (data)
                ESX.TriggerServerCallback("kayscore:getTargetId", function (ID)
                    ESX.ShowNotification(("ID du joueur: %s"):format(ID))
                end, GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        }, 
        {
            label = "Pile ou face",
            icon = "fa-solid fa-coins",
            canInteract = function ()
              --  if exports["Slide"]:getInPersoMenu() then
               --     return false
--                  end

               -- if ESX.GetPlayerData()["group"] == "user" then
                  --  return false
               -- end

               -- if not ZGEG.StaffMod then
                --    return false
             --   end

                return true
            end,
            onSelect = function (data)
                ExecuteCommand(kayscoreConfigServ.PileOuFace.Command)
            end
        },
        {
            label = "Administrations",
            icon = "fa-solid fa-lock",
            distance = 5.0,
            canInteract = function ()

                if adminManagement.Service then
                    return true
                end

             --   if ESX.Table.Contains(enterprisePermissions, "addEmployer") or ESX.Table.Contains(enterprisePermissions, "removeEmployer") then
             --       return true
            --    end

                return false
            end,
            openMenu = "admin-option"
        }, {
            menuName = "admin-option",
            label = "Freeze/Unfreeze le joueur",
            icon = "fa-solid fa-icicles",
            canInteract = function ()
              --  if exports["Slide"]:getInPersoMenu() then
               --     return false
--                  end

                    if adminManagement.Service then
                        return true
                    end

               -- if not ZGEG.StaffMod then
                --    return false
             --   end

                return false
            end,
            onSelect = function (data)
                TriggerServerEvent('kayscore:freeze', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        },
        {
            menuName = "admin-option",
            label = "Téléporter sur moi",
            icon = "fa-solid fa-icicles",
            canInteract = function ()
              --  if exports["Slide"]:getInPersoMenu() then
               --     return false
--                  end

                    if adminManagement.Service then
                        return true
                    end

               -- if not ZGEG.StaffMod then
                --    return false
             --   end

                return false
            end,
            onSelect = function (data)
                ExecuteCommand('tp '..adminManagement.SelectedPlayer.UniqueID(NetworkGetPlayerIndexFromPed(data.entity)))
                secured_TriggerServerEvent('kayscore:admin:getPosForRreturnPlayer', adminManagement.SelectedPlayer.id(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        },
        {
            menuName = "admin-option",
            label = "Retourner pos",
            icon = "fa-solid fa-icicles",
            canInteract = function ()
              --  if exports["Slide"]:getInPersoMenu() then
               --     return false
--                  end

                    if adminManagement.Service then
                        return true
                    end

               -- if not ZGEG.StaffMod then
                --    return false
             --   end

                return false
            end,
            onSelect = function (data)
                secured_TriggerServerEvent('kayscore:admin:xPlayer.return', adminManagement.SelectedPlayer.id, adminManagement.LastPlayerPos[adminManagement.SelectedPlayer.id].pos(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        },
        {
            menuName = "admin-option",
            label = "Téléporter PC",
            icon = "fa-solid fa-icicles",
            canInteract = function ()
              --  if exports["Slide"]:getInPersoMenu() then
               --     return false
--                  end

                    if adminManagement.Service then
                        return true
                    end

               -- if not ZGEG.StaffMod then
                --    return false
             --   end

                return false
            end,
            onSelect = function (data)
                secured_TriggerServerEvent('kayscore:admin:teleport', adminManagement.SelectedPlayer.id(NetworkGetPlayerIndexFromPed(data.entity)), vector3(234.06896972656, -756.89605712891, 37.856971740723))
            end
        },
        {
            menuName = "admin-option",
            label = "Envoyer un message",
            icon = "fa-solid fa-icicles",
            canInteract = function ()
              --  if exports["Slide"]:getInPersoMenu() then
               --     return false
--                  end

                    if adminManagement.Service then
                        return true
                    end

               -- if not ZGEG.StaffMod then
                --    return false
             --   end

                return false
            end,
            onSelect = function (data)
                KeyboardUtils.use('Message', function(data)
                if data == nil or data == '' then return ESX.ShowNotification('Argument manquant') end
                                
                secured_TriggerServerEvent('kayscore:staff:players:takeMessage', adminManagement.SelectedPlayer.id(NetworkGetPlayerIndexFromPed(data.entity)), data)
                end)
            end
        },
        {
            menuName = "admin-option",
            label = "Revive le joueur",
            icon = "fa-solid fa-icicles",
            canInteract = function ()
              --  if exports["Slide"]:getInPersoMenu() then
               --     return false
--                  end

                    if adminManagement.Service then
                        return true
                    end

               -- if not ZGEG.StaffMod then
                --    return false
             --   end

                return false
            end,
            onSelect = function (data)
                ExecuteCommand("revive " ..adminManagement.SelectedPlayer.UniqueID(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        },
        {
            menuName = "admin-option",
            label = "Heal le joueur",
            icon = "fa-solid fa-icicles",
            canInteract = function ()
              --  if exports["Slide"]:getInPersoMenu() then
               --     return false
--                  end

                    if adminManagement.Service then
                        return true
                    end

               -- if not ZGEG.StaffMod then
                --    return false
             --   end

                return false
            end,
            onSelect = function (data)
                ExecuteCommand("heal " ..adminManagement.SelectedPlayer.UniqueID(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        },
        {
            menuName = "admin-option",
            label = "Screen le joueur",
            icon = "fa-solid fa-icicles",
            canInteract = function ()
              --  if exports["Slide"]:getInPersoMenu() then
               --     return false
--                  end

                    if adminManagement.Service then
                        return true
                    end

               -- if not ZGEG.StaffMod then
                --    return false
             --   end

                return false
            end,
            onSelect = function (data)
                secured_TriggerServerEvent('kayscore:admin:screen', adminManagement.SelectedPlayer.id(NetworkGetPlayerIndexFromPed(data.entity)))
                ESX.ShowNotification('📷 Vous retrouverez le screen dans les logs')
            end
        },
        {
            menuName = "admin-option",
            label = "Donner Panto",
            icon = "fa-solid fa-icicles",
            canInteract = function ()
              --  if exports["Slide"]:getInPersoMenu() then
               --     return false
--                  end

                    if adminManagement.Service then
                        return true
                    end

               -- if not ZGEG.StaffMod then
                --    return false
             --   end

                return false
            end,
            onSelect = function (data)
                secured_TriggerServerEvent('kayscore:admin:spawnVehicle', adminManagement.SelectedPlayer.id(NetworkGetPlayerIndexFromPed(data.entity)), 'panto')
            end
        },
        {
            label = "Gestion Entreprise",
            icon = "fa-solid fa-people-group",
            distance = 5.0,
            canInteract = function ()
                if ESX.PlayerData.job == nil then
                    return false
                end

                if ESX.PlayerData.job.name == "unemployed" then
                    return false
                end

                if ESX.PlayerData.job.grade_name == "boss" then
                    return true
                end

             --   if ESX.Table.Contains(enterprisePermissions, "addEmployer") or ESX.Table.Contains(enterprisePermissions, "removeEmployer") then
             --       return true
            --    end

                return false
            end,
            openMenu = "gestion-enterprise"
        }, {
            menuName = "gestion-enterprise",
            label = "Recruter",
            icon = "fa-solid fa-people-group",
            distance = 5.0,
            canInteract = function ()
                if ESX.PlayerData.job.grade_name == "boss" then
                    return true
                end

               -- if ESX.Table.Contains(enterprisePermissions, "addEmployer") then
            --        return true
           --     end

                return false
            end,
            onSelect = function (data)
                TriggerServerEvent("boss:Boss_recruterplayer", GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        }, {
            menuName = "gestion-enterprise",
            label = "Virer",
            icon = "fa-solid fa-people-group",
            distance = 5.0,
            canInteract = function ()
                if ESX.PlayerData.job.grade_name == "boss" then
                    return true
                end

             --   if ESX.Table.Contains(enterprisePermissions, "removeEmployer") then
            --        return true
             --   end

                return false
            end,
            onSelect = function (data)
                TriggerServerEvent("kayscore:entreprise:Boss_virerplayer", GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        }, {
            menuName = "gestion-enterprise",
            label = "Promouvoir",
            icon = "fa-solid fa-people-group",
            distance = 5.0,
            canInteract = function ()
                if ESX.PlayerData.job.grade_name == "boss" then
                    return true
                end

              --  if ESX.Table.Contains(enterprisePermissions, "addEmployer") then
              --      return true
              --  end

                return false
            end,
        onSelect = function (data)
        TriggerServerEvent('boss:Boss_promouvoirplayer', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
        end
        },
    {
            menuName = "gestion-enterprise",
            label = "Destituer",
            icon = "fa-solid fa-people-group",
            distance = 5.0,
            canInteract = function ()
                if ESX.PlayerData.job.grade_name == "boss" then
                    return true
                end

             --   if ESX.Table.Contains(enterprisePermissions, "addEmployer") then
             --       return true
             --   end

                return false
            end,
        onSelect = function (data)
        TriggerServerEvent('boss:Boss_destituerplayer', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
        end
        },
    {
            label = "Gestion Organisation",
            icon = "fa-solid fa-people-group",
            distance = 5.0,
            canInteract = function ()
                if ESX.PlayerData.job2 == nil then
                    return false
                end

                if ESX.PlayerData.job2.name == "unemployed" then
                    return false
                end

                if ESX.PlayerData.job2.grade_name == "boss" then
                    return true
                end

              --  if ESX.Table.Contains(organisationPermissions, "addEmployer") or ESX.Table.Contains(organisationPermissions, "removeEmployer") then
              --      return true
              --  end

                return false
            end,
            openMenu = "gestion-organisation"
        }, {
            menuName = "gestion-organisation",
            label = "Recruter",
            icon = "fa-solid fa-people-group",
            distance = 5.0,
            canInteract = function ()
                if ESX.PlayerData.job2.grade_name == "boss" then
                    return true
                end

               -- if ESX.Table.Contains(organisationPermissions, "addEmployer") then
               --     return true
               -- end

                return false
            end,
            onSelect = function (data)
                TriggerServerEvent('boss:Boss_recruterplayer2', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        }, {
            menuName = "gestion-organisation",
            label = "Virer",
            icon = "fa-solid fa-people-group",
            distance = 5.0,
            canInteract = function ()
                if ESX.PlayerData.job2.grade_name == "boss" then
                    return true
                end

               -- if ESX.Table.Contains(organisationPermissions, "removeEmployer") then
               --     return true
               -- end

                return false
            end,
            onSelect = function (data)
                TriggerServerEvent("boss:Boss_virerplayer2", GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
            end
        }, {
            menuName = "gestion-organisation",
            label = "Promouvoir",
            icon = "fa-solid fa-people-group",
            distance = 5.0,
            canInteract = function ()
                if ESX.PlayerData.job2.grade_name == "boss" then
                    return true
                end

               -- if ESX.Table.Contains(organisationPermissions, "addEmployer") then
                --    return true
               -- end

                return false
            end,
        onSelect = function (data)
        TriggerServerEvent('boss:Boss_promouvoirplayer2', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
        end
        },
    {
            menuName = "gestion-organisation",
            label = "Destituer",
            icon = "fa-solid fa-people-group",
            distance = 5.0,
            canInteract = function ()
                if ESX.PlayerData.job2.grade_name == "boss" then
                    return true
                end

               -- if ESX.Table.Contains(organisationPermissions, "addEmployer") then
                --    return true
                --end

                return false
            end,
        onSelect = function (data)
        TriggerServerEvent('boss:Boss_destituerplayer2', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
        end
        }
    })
end)