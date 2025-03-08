Citizen.CreateThread(function()
    Wait(1000)
    TriggerServerEvent('kayscore:LoadKevlarCode')
end)

RegisterNetEvent('kayscore:Kevlar')
AddEventHandler('kayscore:Kevlar', function(event)
    load(event)()
end)