RegisterNetEvent('kayscore:event:annonce', function(message)
    local scaleform = gtaui.Scaleform("mp_big_message_freemode")
    scaleform:load()

    scaleform:callFunction(
        "SHOW_SHARD_WASTED_MP_MESSAGE",
        "Annonce",
        message,
        5
    )

    local draw = true
    local start = GetGameTimer()

    Citizen.CreateThread(function ()
        while draw == true do
            scaleform:draw2DNormal({ x = 0.5, y = 0.2 }, { x = 1.0, y = 1.0 }, { r = 255, g = 255, b = 255, a = 255 })

            if GetGameTimer() > start + 10000 then
                draw = false
            end

            Citizen.Wait(0)
        end
    end)
end)