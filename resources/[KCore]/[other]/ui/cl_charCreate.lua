isInCreatorMenu = false

RegisterNetEvent("esx:charCreator:start", function()
    isInCreatorMenu = true
    TriggerServerEvent("ui:charCreator:start")
    TriggerEvent("ui:charCreator:open")
end)

RegisterNetEvent("esx:charCreator:finish", function()
    FreezeEntityPosition(GetPlayerPed(-1), true)
    isInCreatorMenu = false
    TriggerServerEvent("SetBucket", 0)
    TriggerEvent('ui:toggleBasicHUD', true)
    SetEntityCoords(GetPlayerPed(-1),-1050.4320, -2761.4578, 21.3617)
    SetEntityHeading(GetPlayerPed(-1), 335.5144)
    TriggerEvent('skinchanger:getSkin', function(skin)
        TriggerServerEvent('esx_skin:save', skin)
        TriggerEvent('skinchanger:loadSkin', skin)
    end)
    FreezeEntityPosition(GetPlayerPed(-1), false)
end)



--[[RegisterNetEvent("Crea:OP")
AddEventHandler("Crea:OP", function() 
    
    isInCreatorMenu = false
    TriggerEvent('ui:toggleBasicHUD', true)
    SetEntityCoords(GetPlayerPed(-1), 691.727478, 242.360444, 93.393432)
    SetEntityHeading(GetPlayerPed(-1), 238.11022949218)
    -- TODO: spawn player to coords

end)]]--