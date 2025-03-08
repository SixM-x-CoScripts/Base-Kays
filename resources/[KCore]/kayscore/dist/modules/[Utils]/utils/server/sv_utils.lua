


    UTILS = {}
    
    UTILS.ServerColor = {
        r = kayscoreConfigServ.R,
        g = kayscoreConfigServ.G,
        b = kayscoreConfigServ.B,
        o = kayscoreConfigServ.A
    }

	UTILS.LOGOURL = kayscoreConfigServ.LogoUrl

	UTILS.COLORCODE = kayscoreConfigServ.GTACOLOR


RegisterServerEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(source, xPlayer)
    TriggerClientEvent('kayscoreUdatePly', source, GetNumPlayerIndices())
end)


CreateThread(function()
    while (true) do
        TriggerClientEvent('kayscoreUdatePly', -1, GetNumPlayerIndices())

        Wait(10000)
    end
end)