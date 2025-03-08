local garbageProps = { 1437508529, 666561306, -58485588, 218085040, -1426008804, -206690185, 1143474856, -130812911, 1614656839, 1511880420, 1329570871, -1096777189, -2096124444 }
local distributorProps = { -870868698, -1126237515, -1364697528, 506770882 }
local fridgeProps = {
    GetHashKey("v_res_fridgemoda"),
    GetHashKey("v_res_fridgemodsml"),
    GetHashKey("prop_fridge_01"),
    GetHashKey("prop_fridge_03"),
    GetHashKey("prop_vend_fridge01"),
}

Citizen.CreateThread(function ()
    while GetResourceState("ox_target") ~= "started" do Citizen.Wait(0) end
        exports.ox_target:addModel(garbageProps, {
        label = "Utiliser la poubelle",
        icon = "fa-solid fa-trash",
        distance = 5.0,
        canInteract = function ()
           -- if exports["Slide"]:getInPersoMenu() then
          --      return false
         --   end

            return true
        end,
        onSelect = function (data)
            exports['inv']:openInventory()
        end
    })
    exports.ox_target:addModel(distributorProps, {
        {
            label = "Retirer",
            icon = "fa-solid fa-wallet",
            distance = 5.0,
            canInteract = function ()
               -- if exports["Slide"]:getInPersoMenu() then
                --    return false
                --end

                return true
            end,
            onSelect = function (data)
                local input = ESX.GetNumberInput("Montant")
                if input == nil then
                    return ESX.ShowNotification("~r~Le montant ne peut pas être nul")
                end

                if input <= 0 then
                    return ESX.ShowNotification("~r~Erreur lors de la transaction")
                end

                TriggerServerEvent('bank:withdraw', input)
            end
        }, {
            label = "Déposer",
            icon = "fa-solid fa-wallet",
            distance = 5.0,
            canInteract = function ()
               -- if exports["Slide"]:getInPersoMenu() then
                --    return false
               -- end

                return true
            end,
            onSelect = function (data)
                local input = ESX.GetNumberInput("Montant")
                if input == nil then
                    return ESX.ShowNotification("~r~Le montant ne peut pas être nul")
                end

                if input <= 0 then
                    return ESX.ShowNotification("~r~Erreur lors de la transaction")
                end

                TriggerServerEvent('bank:deposit', input)
            end
        }
    })
    exports.ox_target:addGlobalObject({
        {
            label = "Supprimer l'objet",
            icon = "fa-solid fa-asterisk",
            canInteract = function ()
                if adminManagement.Service then
                    return true
                end
                  return false
              end,
            onSelect = function (data)
                local entity = data.entity
                if DoesEntityExist(entity) then
                    if IsEntityAttached(entity) then
                        DetachEntity(entity, false, false)
                    end
                    SetEntityAsMissionEntity(entity, true, true)
                    DeleteEntity(entity)
                    if DoesEntityExist(entity) then
                        NetworkRequestControlOfEntity(entity)
                        DeleteEntity(entity)
                    end
                else
                    -- print("L'entité n'existe pas ou est invalide.")
                end
            end
        },
        {
            label = "Copier le model de l'objet",
            icon = "fa-solid fa-asterisk",
            canInteract = function ()
                --if exports["Slide"]:getInPersoMenu() then
                --    return false
               -- end

               -- if not ESX.StaffMod then
               --     return false
               -- end

                if ESX.GetPlayerData()["group"] == "user" then
                    return false
                end

                return true
            end,
            onSelect = function (data)
                exports['kayscore']:copyData(GetEntityModel(data.entity))
            end
        }, {
            label = "Copier les coordonées de l'objet",
            icon = "fa-solid fa-asterisk",
            canInteract = function ()
               -- if exports["Slide"]:getInPersoMenu() then
              --      return false
             --   end

             --   if not ESX.StaffMod then
             --       return false
             --   end

                if ESX.GetPlayerData()["group"] == "user" then
                    return false
                end

                return true
            end,
            onSelect = function (data)
                local coords = GetEntityCoords(data.entity)
                local heading = GetEntityHeading(data.entity)
                exports['kayscore']:copyData(('vector4(%s, %s, %s, %s)'):format(coords.x, coords.y, coords.z, heading))
            end
        }
    })
end)