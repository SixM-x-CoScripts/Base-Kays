CreateThread(function()
    local loaded = false

    secured_RegisterNetEvent('kayscore:drugs:load', function(table)
        for k,v in pairs(table) do
            kayscoreDrugs.Drugs[v.name] = {
                ["recolte"] = v.position.recolte,
                ["traitement"] = v.position.traitement
            }
            kayscoreDrugs.Items[v.name] = {
                ["recolte"] = {
                    name = v.data.recolte.name,
                    label = v.data.recolte.label,
                    animtype = v.data.recolte.animtype,
                    animdict = v.data.recolte.animdict,
                    anim = v.data.recolte.anim,
                    animtime = v.data.recolte.animtime,
                    marker = v.data.recolte.marker,
                    props = v.data.recolte.props
                },
                ["traitement"] = {
                    name = v.data.traitement.name,
                    label = v.data.traitement.label,
                    animtype = v.data.traitement.animtype,
                    animdict = v.data.traitement.animdict,
                    anim = v.data.traitement.anim,
                    animtime = v.data.traitement.animtime,
                    marker = v.data.traitement.marker,
                    props = v.data.traitement.props
                }
            }

            secured_TriggerServerEvent('kayscore:drugs:addTable', kayscoreDrugs.Items)
        end
    
        loaded = true
    end)

    secured_RegisterNetEvent('kayscore:drugs:refresh', function(d)
        for k,v in pairs(kayscoreDrugs.Drugs) do
            if k ~= d then return end
            for i,p in pairs(kayscoreDrugs.Drugs[k]) do
                for _,z in pairs(kayscoreDrugs.Drugs[k][i]) do
                    kayscoreDrugs.RandomZone[i..k] = kayscoreDrugs.Drugs[k][i][math.random(1, #kayscoreDrugs.Drugs[k][i])]
                end
            end
        end
    
        for _,z in pairs(kayscoreDrugs.Drugs) do
            if _ ~= d then return end
            for k,v in pairs(kayscoreDrugs.Drugs[_]) do
                if not kayscoreDrugs.Items[_][k].marker then
                    ESX.Game.SpawnLocalObject(kayscoreDrugs.Items[_][k].props, vector3(kayscoreDrugs.RandomZone[k.._].x, kayscoreDrugs.RandomZone[k.._].y, kayscoreDrugs.RandomZone[k.._].z-0.98), function(obj)
                        FreezeEntityPosition(obj, true)
                        kayscoreDrugs.objSpawn[obj] = obj
        
        
                    end)
                end
            end
        end
    end)
    
    Wait(1000)

    secured_TriggerServerEvent('kayscore:drugs:load')

    while not loaded do Wait(1) end

    function kayscoreDrugs:drugs(item, type)
        Player.playerPed = PlayerPedId()
        local ped = Player.playerPed
    
        ClearPedTasksImmediately(Player.playerPed)
        FreezeEntityPosition(ped, true)
    
        if kayscoreDrugs.Items[item][type].animtype == 'anim' then
            local dict, anim = kayscoreDrugs.Items[item][type].animdict, kayscoreDrugs.Items[item][type].anim
    
            ESX.Streaming.RequestAnimDict(dict)
            TaskPlayAnim(ped, dict, anim, -1.0, -1.0, 3000, 0, 0, true, true, true)
        else
            TaskStartScenarioInPlace(ped, 'PROP_HUMAN_BUM_BIN', 0, true)
        end
    
        Citizen.Wait(kayscoreDrugs.Items[item][type].animtime)
    
        ClearPedTasks(ped)
        FreezeEntityPosition(ped, false)
    
        secured_TriggerServerEvent('kayscore:drugs:drugs', item, type)
    end
    
    function DeleteProps()
        for k,v in pairs(kayscoreDrugs.objSpawn) do
            DeleteObject(v)
        end
    
        for _,z in pairs(kayscoreDrugs.Drugs) do
            for k,v in pairs(kayscoreDrugs.Drugs[_]) do
                if not kayscoreDrugs.Items[_][k].marker then
                    ESX.Game.SpawnLocalObject(kayscoreDrugs.Items[_][k].props, vector3(kayscoreDrugs.RandomZone[k.._].x, kayscoreDrugs.RandomZone[k.._].y, kayscoreDrugs.RandomZone[k.._].z-0.98), function(obj)
                        FreezeEntityPosition(obj, true)
                        kayscoreDrugs.objSpawn[obj] = obj
        
        
                    end)
                end
    
                ::continue::
            end
        end
    end
    
    CreateThread(function()
    
        for k,v in pairs(kayscoreDrugs.Drugs) do
            for i,p in pairs(kayscoreDrugs.Drugs[k]) do
                for _,z in pairs(kayscoreDrugs.Drugs[k][i]) do
                    kayscoreDrugs.RandomZone[i..k] = kayscoreDrugs.Drugs[k][i][math.random(1, #kayscoreDrugs.Drugs[k][i])]
                end
            end
        end
    
        for _,z in pairs(kayscoreDrugs.Drugs) do
            for k,v in pairs(kayscoreDrugs.Drugs[_]) do
                if not kayscoreDrugs.Items[_][k].marker then
                    ESX.Game.SpawnLocalObject(kayscoreDrugs.Items[_][k].props, vector3(kayscoreDrugs.RandomZone[k.._].x, kayscoreDrugs.RandomZone[k.._].y, kayscoreDrugs.RandomZone[k.._].z-0.98), function(obj)
                        FreezeEntityPosition(obj, true)
                        kayscoreDrugs.objSpawn[obj] = obj
        
        
                    end)
                end
            end
        end
        
        while true do 
            Wait(kayscoreDrugs.Wait)
            kayscoreDrugs.Wait = 2000
            
            for _,z in pairs(kayscoreDrugs.Drugs) do
                for k,v in pairs(kayscoreDrugs.Drugs[_]) do
                    local distance = #(GetEntityCoords(PlayerPedId())-vector3(kayscoreDrugs.RandomZone[k.._].x, kayscoreDrugs.RandomZone[k.._].y, kayscoreDrugs.RandomZone[k.._].z))
    
                    if distance > 20 then goto continue end
    
                    kayscoreDrugs.Wait = 1
    
                    if kayscoreDrugs.Items[_][k].marker then
                        DrawMarker(21, kayscoreDrugs.RandomZone[k.._].x, kayscoreDrugs.RandomZone[k.._].y, kayscoreDrugs.RandomZone[k.._].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, tonumber(UTILS.ServerColor.r), tonumber(UTILS.ServerColor.g), tonumber(UTILS.ServerColor.b), 255, false, false, 2, false, false, false, false)
                    end
    
                    if distance < 1.5 then
                        DrawInstructionBarNotification(kayscoreDrugs.RandomZone[k.._].x, kayscoreDrugs.RandomZone[k.._].y, kayscoreDrugs.RandomZone[k.._].z, "Appuyez sur [ ~g~E~w~ ] pour intéragir")
                        if IsControlJustPressed(1,51) then
                            kayscoreDrugs:drugs(_, k)
                            kayscoreDrugs.RandomZone[k.._] = kayscoreDrugs.Drugs[_][k][math.random(1, #kayscoreDrugs.Drugs[_][k])]
    
                            if not kayscoreDrugs.Items[_][k].marker then
                                DeleteProps()
                            end
                        end
                    end
    
                    ::continue::
                end
            end
        end
    end)
    
    AddEventHandler('onResourceStop', function()
        for k,v in pairs(kayscoreDrugs.objSpawn) do
            DeleteObject(v)
            kayscoreDrugs.objSpawn[k] = nil
        end
    end)
end)