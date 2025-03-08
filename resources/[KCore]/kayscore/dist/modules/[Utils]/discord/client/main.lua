local onlinePlayers = 0

RegisterNetEvent('kayscoreUdatePly')
AddEventHandler('kayscoreUdatePly', function(int)
	onlinePlayers = int
end)


AddEventHandler("esx:playerLoaded", function(xPlayer)
    while ESX == nil do Wait(1) end

    AddTextEntry('FE_THDR_GTAO', ('%s%s ~w~Rôleplay~w~ | ID Unique : '..kayscoreConfigServ.GTACOLOR .. xPlayer.UniqueID.. ' ~w~| Joueurs : '..kayscoreConfigServ.GTACOLOR .. onlinePlayers .. ' ~w~| Pseudo : '..kayscoreConfigServ.GTACOLOR .. GetPlayerName(Player.playerId)):format(kayscoreConfigServ.GTACOLOR, kayscoreConfigServ.ServerName))


    --if xPlayer.identifier == 'license:3b00bf052be99af33a5a68716228b98ed91b9342' or xPlayer.identifier == 'license:73368238ecbb5c69a2768471824aea691c9f16fe' then 
    --    return 
    --end
    
    SetDiscordAppId(kayscoreConfigServ.AppId)
    SetDiscordRichPresenceAsset(kayscoreConfigServ.Asset1)
    SetDiscordRichPresenceAssetSmall(kayscoreConfigServ.Asset2)
    SetDiscordRichPresenceAssetSmallText(kayscoreConfigServ.Text)
    SetRichPresence(("[%s] %s | %s/%s"):format(xPlayer.UniqueID, GetPlayerName(PlayerId()), onlinePlayers, kayscoreConfigServ.Slots))
    SetDiscordRichPresenceAction(0, "Discord", (kayscoreConfigServ.Discord))
    SetDiscordRichPresenceAction(1, "Se-Connecter", (kayscoreConfigServ.CfxConnect))
end)

Citizen.CreateThread(function()
    while true do 
        Wait(45000)

        SetRichPresence(("[%s] %s | %s/%s"):format(Player.UniqueID, GetPlayerName(PlayerId()), onlinePlayers, kayscoreConfigServ.Slots))
    end
end)

exports('getPlayersCount', function()
    return onlinePlayers
end)
