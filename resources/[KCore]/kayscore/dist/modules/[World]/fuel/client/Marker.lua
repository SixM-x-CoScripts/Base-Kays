Pump = {
    'prop_gas_pump_1d',
    'prop_gas_pump_1a',
    'prop_gas_pump_1b',
    'prop_gas_pump_1c',
    'prop_vintage_pump',
    'prop_gas_pump_old2',
    'prop_gas_pump_old3',
}

CreateThread(function()
    if CFGcxFuel.ShowBlips then
        for _,v in pairs(CFGcxFuel.FuelStation) do    
            local blip = AddBlipForCoord(v.pos)
            SetBlipSprite(blip, 361)
            SetBlipScale(blip, 0.3)
            SetBlipColour(blip, 4)
            SetBlipDisplay(blip, 4)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Station Essence")
            EndTextCommandSetBlipName(blip)
        end
    end
    while true do
        Wait(1250)
        for k,v in pairs(Pump) do
            local ClosestPump = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 1.8, GetHashKey(v), false, false)

            if ClosestPump ~= 0 and ClosestPump ~= nil then
                CurentPump = ClosestPump
                break
            else
                CurentPump = nil
            end
        end
    end
end)

CreateThread(function()
    while true do
        if CurentPump ~= nil then
            Wait(5)
            if IsPedSittingInAnyVehicle(PlayerPedId()) then
                local playerPos = GetEntityCoords(PlayerPedId())
                DrawMarker(1, playerPos.x, playerPos.y, playerPos.z - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 223, 88, 0, 155)
                DrawInstructionBarNotification(playerPos.x, playerPos.y, playerPos.z, ("Appuyez sur [ %sE~w~ ] pour intéragir"):format(UTILS.COLORCODE))
                if IsControlJustPressed(1, 51) then
                    TriggerEvent('ui:gazStation:open')
                end
            end
        else
            Wait(1250)
        end
    end
end)