if ConfigwGunFight.NewEsx == true then 
    ESX = exports['frwk']:getSharedObject()
elseif ConfigwGunFight.Calif == true then 
    TriggerEvent(ConfigwGunFight.DeclaCalif, function(obj) ESX = obj end)
elseif ConfigwGunFight.OldEsx == true then 
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end

local CreationLobbyServeur = {}
local MapOk = nil 
local AllInventaireJoueur = {}
local JoueurTrouver = nil
local kototable = {}
local NtmFdp = {}

RegisterServerEvent("wGunFight:CreationLoby")
AddEventHandler("wGunFight:CreationLoby", function(CreationLobby)

    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    table.insert(CreationLobbyServeur, {Id = xPlayer.source , LicenceCreateur = xPlayer.identifier, Createur = xPlayer.getName(), NomLobby = CreationLobby.Name, Map = CreationLobby.Maps , NombreJoueur = 0})


end)

ESX.RegisterServerCallback('wGunFight:CallBackGun', function(source, cb)

    TableServeur = CreationLobbyServeur

	cb(TableServeur)
end)

RegisterServerEvent("wGunFight:RejoindreLobby")
AddEventHandler("wGunFight:RejoindreLobby", function(IdLobby , MapSelec)

    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    if NtmFdp[_src] == nil then 
        NtmFdp[_src] = true
    end
    

    local heure = os.date("%d/%m/%Y %X")
    local idr1= xPlayer.identifier
    local NomJoueur = xPlayer.getName()
    local contenta = {
        {
            ["color"] = '5897984',
            ["title"] = "Gun Fight",
            ["description"] = '**Joueur ID : **' ..tostring(_src) ..'\n ** Nom Joueur : **'..NomJoueur,
            ["footer"] = {
                ["text"] = heure ..'\nlicense:'..idr1,
            },
        }
    }

    TriggerEvent("wGunFight:LogJoueur",contenta)

    SetPlayerRoutingBucket(xPlayer.source, IdLobby)

    for k,v in pairs(CreationLobbyServeur) do 

        if xPlayer.source == v.Id then 

            LobbySelectionner = k 

        end

    end

    UpdateCount = json.encode(CreationLobbyServeur[LobbySelectionner].NombreJoueur)
    UpdateCountFinale = UpdateCount + 1

    CreationLobbyServeur[LobbySelectionner].NombreJoueur = ESX.Math.Round(UpdateCountFinale)

    print(IdLobby,MapSelec)
    
    TriggerClientEvent("wGunFight:SelectionArme", xPlayer.source, IdLobby, MapSelec)



end)


RegisterServerEvent("wGunFight:mort")
AddEventHandler("wGunFight:mort", function(ingame)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local _ingame = ingame


    if _ingame == false then 
        TriggerClientEvent('GunFight:revivePlayer', _source)
        print('ici 1 mort')
    end

end)


            
RegisterServerEvent("wGunFight:ReturnBucket")
AddEventHandler("wGunFight:ReturnBucket", function()

    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)

    print('ici serveur')

    SetPlayerRoutingBucket(xPlayer.source, 0)

end)

RegisterServerEvent('wGunFight:setDeathStatus')
AddEventHandler('wGunFight:setDeathStatus', function(isDead)
	local identifier = GetPlayerIdentifiers(source)[1]
	if type(isDead) ~= 'boolean' then
		print(('wGunFight: %s attempted to parse something else than a boolean to setDeathStatus!'):format(identifier))
		return
	end
	MySQL.Sync.execute('UPDATE users SET is_dead = @isDead WHERE identifier = @identifier', {
		['@identifier'] = identifier,
		['@isDead'] = isDead
	})
end)

RegisterCommand("gunfight", function(source, args, rawCommand)
    local _src = source
    local playerPed = GetPlayerPed(_src)


    if NtmFdp[_src] then
        TriggerClientEvent("samesoule",_src)
    else
        TriggerClientEvent('esx:showNotification', _src, '~r~Vous êtes pas en gunfight.')
    end
end, false)

RegisterServerEvent("wGunFight:QuitterLobby")
AddEventHandler("wGunFight:QuitterLobby", function()

    local _src = source
    local playerPed = GetPlayerPed(_src)

    local coords = vector3(-1328.005, -237.7478, 42.70232)
    SetEntityCoords(playerPed, coords)
    NtmFdp[_src] = nil
    SetPlayerRoutingBucket(_src, 0)
    TriggerClientEvent('esx:showNotification', _src, '~r~Vous avez quitté le gunfight.')

end)