CreateThread(function()
    while not ESXLoaded do Wait(1) end

    secured_TriggerServerEvent('kayscore:weapons:load')
end)