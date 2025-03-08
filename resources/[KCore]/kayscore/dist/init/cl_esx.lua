ESXLoaded = false
ESX = nil
kayscoreServUI = nil

Player = {
    WeaponData = {}
}

WeaponList = {}

Citizen.CreateThread(function()
	while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		TriggerEvent('kayscoreServUI:sendShared', function(obj) kayscoreServUI = obj end)
        Citizen.Wait(0)
    end

	ESX.PlayerData = ESX.GetPlayerData()
	Player.WeaponData = ESX.GetWeaponList()
	WeaponList = ESX.GetWeaponList()

	while (not ESX.PlayerData.job) do
		ESX.PlayerData = ESX.GetPlayerData()
		ESX.PlayerData.job = ESX.GetPlayerData().job
		ESX.GetPlayerData()
		Citizen.Wait(20)
	end

	while (not ESX.PlayerData.job2) do
		ESX.PlayerData = ESX.GetPlayerData()
		ESX.PlayerData.job2 = ESX.GetPlayerData().job2
		ESX.GetPlayerData()
		Citizen.Wait(20)
	end

	while not (ESX.PlayerData.inventory) do
		ESX.PlayerData = ESX.GetPlayerData()
		ESX.PlayerData.inventory = ESX.GetPlayerData().inventory
		ESX.GetPlayerData()
		Citizen.Wait(20)
	end

	while ESX.PlayerData == nil do 
		Wait(1)
		ESX.PlayerData = ESX.GetPlayerData()
	end

	for i = 1, #Player.WeaponData, 1 do
		if Player.WeaponData[i].name == 'WEAPON_UNARMED' then
			Player.WeaponData[i] = nil
		else
			Player.WeaponData[i].hash = GetHashKey(Player.WeaponData[i].name)
		end
    end

	Wait(500)
    ESXLoaded = true
	exports["pma-voice"]:setRadioVolume(100)
	TriggerServerEvent('wais:playerLoaded:bodycam')
	TriggerServerEvent('wais:jobCheck')
end)
CreateThread(function()
    while not ESXLoaded do Wait(1) end

	local ped = PlayerPedId()

	local esxplayerdata = ESX.GetPlayerData()

	Player = {
		playerPed = ped,
		playerId = PlayerId(),
		UniqueID = esxplayerdata.UniqueID,
		coords = GetEntityCoords(ped),
		weapon = GetSelectedPedWeapon(ped),
		isInVehicle = IsPedInAnyVehicle(ped, false),
		vehicle = GetVehiclePedIsIn(ped, false),
		closestVehicle = ESX.Game.GetClosestVehicle(GetEntityCoords(ped)),
		inventory = esxplayerdata.inventory,
		loadout = esxplayerdata.loadout,
		job = esxplayerdata.job,
		job2 = esxplayerdata.job2,
		group = esxplayerdata.group,
		holsterPreset = GetResourceKvpString("HolsterPreset"),
        aimStyle = GetResourceKvpString("aimStyle"), 
	}
    while false do 
        Wait(1000)        

        if not exports['inv']:getInInventory() then
        else
        end

		local esxplayerdata = ESX.PlayerData

		local ped = PlayerPedId()
        
        Player = {
			playerPed = ped,
			playerId = PlayerId(),
			UniqueID = esxplayerdata.UniqueID,
			coords = GetEntityCoords(ped),
			weapon = GetSelectedPedWeapon(ped),
			isInVehicle = IsPedInAnyVehicle(ped, false),
			vehicle = GetVehiclePedIsIn(ped, false),
			closestVehicle = ESX.Game.GetClosestVehicle(GetEntityCoords(ped)),
			inventory = esxplayerdata.inventory,
			loadout = esxplayerdata.loadout,
			job = esxplayerdata.job,
			job2 = esxplayerdata.job2,
			group = esxplayerdata.group,
            holsterPreset = GetResourceKvpString("HolsterPreset"),
            aimStyle = GetResourceKvpString("aimStyle"),
        }

        -- for k,v in pairs(Player.inventory) do
        --     if v.name == 'kevlar' then
        --         if v.count > 1 then
		-- 			if not isNotifKevlar then
		-- 				isNotifKevlar = true

		-- 				ESX.ShowNotification('Vous ne pouvez plus marcher avec deux kevlar sur vous')
		-- 			end

        --             if not ragodoll then
        --                 ExecuteCommand('ragodoll')
        --             end
		-- 		else
		-- 			isNotifKevlar = false
        --         end
        --     end
        -- end
    end
end)
local radarHash = GetHashKey("h4_fake_islandx")
WEAPON_UNARMED = GetHashKey("WEAPON_UNARMED")
Citizen.CreateThread(function()
    Player.lastWeapon = `WEAPON_UNARMED`
    Player.deleteObjectMode = true
    Player.drunk = false
    while true do 
        Player.playerPed = PlayerPedId()
        Player.playerId = PlayerId()
        Player.coords = GetEntityCoords(Player.playerPed)
        Player.weapon = GetSelectedPedWeapon(Player.playerPed)
    
        if Player.lastWeapon ~= Player.weapon then
            TriggerEvent('kayscore:utils:changeweapon', Player.weapon)
            Player.lastWeapon = Player.weapon
        end
		SetRadarZoom(1100)
    if IsPedArmed(Player.playerPed, 6) and IsControlPressed(0, 25) then
        DisableControlAction(0, 22, true)
    end
	if GetInteriorFromEntity(Player.playerPed) == 0 then
		SetRadarAsExteriorThisFrame()
		SetRadarAsInteriorThisFrame(radarHash, 4700.0, -5145.0, 0, 0)
	end
    -- Désactivé les coups de crosses
    if IsPedArmed(Player.playerPed, 6) then
        Wait(0)
        DisableControlAction(1, 140, true)
        DisableControlAction(1, 141, true)
        DisableControlAction(1, 142, true)
    end
        SetEntityMaxHealth(Player.playerPed, 200)
        SetPedCanLosePropsOnDamage(Player.playerPed, false, 0)
        ResetPlayerStamina(Player.playerId)
        DisableControlAction(0, 80, true)
        SetPedSuffersCriticalHits(Player.playerPed, false)
        DisablePlayerVehicleRewards(Player.playerId)
        Wait(1000)
    end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:setgroup')
AddEventHandler('esx:setgroup', function(job2)
	ESX.PlayerData.job2 = job2
end)

RegisterNetEvent('esx:setGroup')
AddEventHandler('esx:setGroup', function(group, lastGroup)
	ESX.PlayerData.group = group
end)

RegisterNetEvent('esx:activateMoney')
AddEventHandler('esx:activateMoney', function(money)
    ESX.PlayerData.money = money
end)

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
	for i = 1, #ESX.PlayerData.accounts, 1 do
		if ESX.PlayerData.accounts[i].name == account.name then
			ESX.PlayerData.accounts[i] = account
			break
		end
	end
end)


function DrawMissionText(msg, time)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(msg)
    DrawSubtitleTimed(time and math.ceil(time) or 0, true)
end

function UpdateSocietyMoney(money)
	Config.Personalmenu.soceityMoney = ESX.Math.GroupDigits(money)
end

Citizen.CreateThread(function()
    while true do 
        Wait(1000)
        local entityHealth = GetEntityHealth(Player.playerPed)

        if entityHealth <= 130 then 
            ExecuteCommand(("walk %s"):format("injured"))
        --elseif kayscoreLSPD.Police.HandCuffed or Config_bcso.HandCuffed then
          --  ExecuteCommand(("walk %s"):format("Handcuffs"))
       -- elseif not kayscoreLSPD.Police.HandCuffed and not inCane() and inAta() == false and not animation_pointing and not crouched then
       --     ExecuteCommand(('walk %s'):format(getWalkStyle()))
        elseif inCane() then 
            ExecuteCommand(("walk %s"):format("Lester"))
        elseif inAta() == true then 
            ExecuteCommand(("walk %s"):format("Injured"))
        end
    end
end)

AddStateBagChangeHandler(nil, nil, function(bagName, key, value) 
	if #key > 131072 then
		while true do
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		local _, _, _, hour, minute = GetUtcTime()
		NetworkOverrideClockTime(hour+1, minute, 0)
		Citizen.Wait(60000)
	end
end)