local weapons = {
	[`WEAPON_UNARMED`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_WOLFKNIFE`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_KNIFE`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_PENIS`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_NIGHTSTICK`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_HAMMER`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_BAT`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_CROWBAR`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_GOLFCLUB`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_BOTTLE`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_DAGGER`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_HATCHET`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_KNUCKLE`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_MACHETE`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_FLASHLIGHT`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_SWITCHBLADE`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_BATTLEAXE`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_POOLCUE`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_WRENCH`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`weapon_Slidepistol`] = {parameters = {anim = true, scoped = false, shakeCam = 0.025, infiniteAmmo = false}},
	[`WEAPON_PISTOL`] = {parameters = {anim = true, scoped = false, shakeCam = 0.025, infiniteAmmo = false}},
	[`WEAPON_PISTOL_MK2`] = {parameters = {anim = true, scoped = false, shakeCam = 0.03, infiniteAmmo = false}},
	[`weapon_glockdm`] = {parameters = {anim = true, scoped = false, shakeCam = 0.03, infiniteAmmo = false}},
	[`WEAPON_COMBATPISTOL`] = {parameters = {anim = false, scoped = false, shakeCam = 0.03, infiniteAmmo = false}},
	[`WEAPON_PISTOL50`] = {parameters = {anim = true, scoped = false, shakeCam = 0.05, infiniteAmmo = false}},
	[`WEAPON_SNSPISTOL`] = {parameters = {anim = true, scoped = false, shakeCam = 0.02, infiniteAmmo = false}},
	[`WEAPON_SNSPISTOL_MK2`] = {parameters = {anim = true, scoped = false, shakeCam = 0.025, infiniteAmmo = false}},
	[`WEAPON_HEAVYPISTOL`] = {parameters = {anim = true, scoped = false, shakeCam = 0.03, infiniteAmmo = false}},
	[`WEAPON_VINTAGEPISTOL`] = {parameters = {anim = true, scoped = false, shakeCam = 0.025, infiniteAmmo = false}},
	[`WEAPON_MARKSMANPISTOL`] = {parameters = {anim = true, scoped = false, shakeCam = 0.03, infiniteAmmo = false}},
	[`WEAPON_REVOLVER`] = {parameters = {anim = true, scoped = false, shakeCam = 0.045, infiniteAmmo = false}},
	[`WEAPON_NAVYREVOLVER`] = {parameters = {anim = true, scoped = false, shakeCam = 0.045, infiniteAmmo = false}},
	[`WEAPON_REVOLVER_MK2`] = {parameters = {anim = true, scoped = false, shakeCam = 0.055, infiniteAmmo = false}},
	[`WEAPON_DOUBLEACTION`] = {parameters = {anim = true, scoped = false, shakeCam = 0.025, infiniteAmmo = false}},
	[`WEAPON_APPISTOL`] = {parameters = {anim = true, scoped = false, shakeCam = 0.05, infiniteAmmo = false}},
	[`WEAPON_STUNGUN`] = {parameters = {anim = false, scoped = false, shakeCam = 0.01, infiniteAmmo = false}},
	[`WEAPON_FLAREGUN`] = {parameters = {anim = true, scoped = false, shakeCam = 0.01, infiniteAmmo = false}},

	[`WEAPON_MICROSMG`] = {parameters = {anim = true, onlyBag = false, scoped = false, shakeCam = 0.035, infiniteAmmo = false}},
	[`WEAPON_MACHINEPISTOL`] = {parameters = {anim = true, onlyBag = false, scoped = false, shakeCam = 0.035, infiniteAmmo = false}},
	[`WEAPON_MINISMG`] = {parameters = {anim = true, onlyBag = false, scoped = false, shakeCam = 0.035, infiniteAmmo = false}},
	[`WEAPON_TEC9MF`] = {parameters = {anim = true, onlyBag = false, scoped = false, shakeCam = 0.035, infiniteAmmo = false}},
	[`WEAPON_SMG`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.045, infiniteAmmo = false}},
	[`WEAPON_SMG_MK2`] = {parameters = {anim = true, onlyBag = false, scoped = false, shakeCam = 0.055, infiniteAmmo = false}},
	[`WEAPON_ASSAULTSMG`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.05, infiniteAmmo = false}},
	[`WEAPON_COMBATPDW`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.045, infiniteAmmo = false}},
	[`WEAPON_MG`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.07, infiniteAmmo = false}},
	[`WEAPON_COMBATMG`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.08, infiniteAmmo = false}},
	[`WEAPON_COMBATMG_MK2`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.085, infiniteAmmo = false}},
	[`WEAPON_GUSENBERG`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.05, infiniteAmmo = false}},
	[`weapon_assaultriflels`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.07, infiniteAmmo = false}},
	[`WEAPON_AKBONE`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.07, infiniteAmmo = false}},
	[`WEAPON_MILITARM4`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.07, infiniteAmmo = false}},
	[`WEAPON_REDL`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.07, infiniteAmmo = false}},
	[`WEAPON_ASSAULTRIFLE`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.07, infiniteAmmo = false}},
	[`WEAPON_SCARSC`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.07, infiniteAmmo = false}},
	[`WEAPON_OBLIVION`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.07, infiniteAmmo = false}},
	[`WEAPON_PREDATOR`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.07, infiniteAmmo = false}},
	[`WEAPON_ASSAULTRIFLE_MK2`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.075, infiniteAmmo = false}},
	[`WEAPON_CARBINERIFLE`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.06, infiniteAmmo = false}},
	[`WEAPON_CARBINERIFLE_MK2`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.065, infiniteAmmo = false}},
	[`WEAPON_ADVANCEDRIFLE`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.06, infiniteAmmo = false}},
	[`WEAPON_SPECIALCARBINE`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.06, infiniteAmmo = false}},
	[`WEAPON_SPECIALCARBINE_MK2`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.075, infiniteAmmo = false}},
	[`WEAPON_TACTICALRIFLE`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.075, infiniteAmmo = false}},
	[`WEAPON_BULLPUPRIFLE`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.05, infiniteAmmo = false}},
	[`WEAPON_BULLPUPRIFLE_MK2`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.065, infiniteAmmo = false}},
	[`WEAPON_COMPACTRIFLE`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.05, infiniteAmmo = false}},
	[`WEAPON_SCAR17FM`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.05, infiniteAmmo = false}},
	[`WEAPON_PREDATOR`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.05, infiniteAmmo = false}},
	[`WEAPON_HKUMP`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.05, infiniteAmmo = false}},
	[`WEAPON_BLASTAK`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.05, infiniteAmmo = false}},
	[`WEAPON_AKS74U`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.05, infiniteAmmo = false}},
	[`WEAPON_M4A1FM`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.05, infiniteAmmo = false}},
	[`WEAPON_REDL`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.05, infiniteAmmo = false}},
	[`WEAPON_BLACKSNIPER`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.05, infiniteAmmo = false}},
	[`WEAPON_SHOTGUNK`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.07, infiniteAmmo = false}},
	[`WEAPON_PUMPSHOTGUN`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.07, infiniteAmmo = false}},
	[`WEAPON_COACHGUN`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.07, infiniteAmmo = false}},
	[`WEAPON_PUMPSHOTGUN_MK2`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.085, infiniteAmmo = false}},
	[`WEAPON_SAWNOFFSHOTGUN`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.06, infiniteAmmo = false}},
	[`WEAPON_BULLPUPSHOTGUN`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.08, infiniteAmmo = false}},
	[`WEAPON_ASSAULTSHOTGUN`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.12, infiniteAmmo = false}},
	[`WEAPON_MUSKET`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.04, infiniteAmmo = false}},
	[`WEAPON_HEAVYSHOTGUN`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.13, infiniteAmmo = false}},
	[`WEAPON_DBSHOTGUN`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.05, infiniteAmmo = false}},
	[`WEAPON_AUTOSHOTGUN`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.08, infiniteAmmo = false}},

	[`WEAPON_SNIPERRIFLE`] = {parameters = {anim = true, onlyBag = true, scoped = true, shakeCam = 0.2, infiniteAmmo = false}},
	[`WEAPON_HEAVYSNIPER`] = {parameters = {anim = true, onlyBag = true, scoped = true, shakeCam = 0.3, infiniteAmmo = false}},
	[`WEAPON_HEAVYSNIPER_MK2`] = {parameters = {anim = true, onlyBag = true, scoped = true, shakeCam = 0.35, infiniteAmmo = false}},
	[`WEAPON_MARKSMANRIFLE`] = {parameters = {anim = true, onlyBag = true, scoped = true, shakeCam = 0.1, infiniteAmmo = false}},
	[`WEAPON_MARKSMANRIFLE_MK2`] = {parameters = {anim = true, onlyBag = true, scoped = true, shakeCam = 0.1, infiniteAmmo = false}},

	[`WEAPON_GRENADELAUNCHER`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.08, infiniteAmmo = false}},
	[`WEAPON_RPG`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.9, infiniteAmmo = false}},
	[`WEAPON_STINGER`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_MINIGUN`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.2, infiniteAmmo = false}},
	[`WEAPON_FIREWORK`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.5, infiniteAmmo = false}},
	[`WEAPON_RAILGUN`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 1.0, infiniteAmmo = false}},
	[`WEAPON_HOMINGLAUNCHER`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.9, infiniteAmmo = false}},
	[`WEAPON_COMPACTLAUNCHER`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.08, infiniteAmmo = false}},

	[`WEAPON_GRENADE`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_STICKYBOMB`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_PROXMINE`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_SMOKEGRENADE`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_BZGAS`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_MOLOTOV`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_FIREEXTINGUISHER`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = true}},
	[`WEAPON_PETROLCAN`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = true}},
	[`WEAPON_BALL`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_SNOWBALL`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_FLARE`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_PIPEBOMB`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},


	--
	[`WEAPON_katana`] = {parameters = {anim = true, scoped = false, onlyBag = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_GADGETPISTOL`] = {parameters = {anim = true, scoped = false, onlyBag = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_CASABLANCA`] = {parameters = {anim = true, scoped = false, onlyBag = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_STONE_HATCHET`] = {parameters = {anim = true, scoped = false, onlyBag = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_GLOCK`] = {parameters = {anim = true, scoped = false, onlyBag = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_MILITARM4`] = {parameters = {anim = true, scoped = false, onlyBag = true, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_MILITARYRIFLE`] = {parameters = {anim = true, scoped = false, onlyBag = true, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_DOUBLEBARRELFM`] = {parameters = {anim = true, scoped = false, onlyBag = true, shakeCam = 0, infiniteAmmo = false}},

	--
	[`WEAPON_HERTZ`] = {parameters = {anim = true, scoped = false, onlyBag = true, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_AQAK`] = {parameters = {anim = true, scoped = false, onlyBag = true, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_SPECTREAQ`] = {parameters = {anim = true, scoped = false, onlyBag = true, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_BATAQ`] = {parameters = {anim = true, scoped = false, onlyBag = true, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_UNICORN`] = {parameters = {anim = true, scoped = false, onlyBag = true, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_TRIDENT`] = {parameters = {anim = true, scoped = false, onlyBag = true, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_STEIN`] = {parameters = {anim = true, scoped = false, onlyBag = true, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_SLICE`] = {parameters = {anim = true, scoped = false, onlyBag = true, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_DEMKNIFE`] = {parameters = {anim = true, scoped = false, onlyBag = true, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_DEMHAMMER`] = {parameters = {anim = true, scoped = false, onlyBag = true, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_PUMPKIN`] = {parameters = {anim = true, scoped = false, onlyBag = true, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_CHAINSAW`] = {parameters = {anim = true, scoped = false, onlyBag = true, shakeCam = 0, infiniteAmmo = false}},
}

local unarmedHash = `WEAPON_UNARMED`
local currWeapon = unarmedHash
local holstered = true
local canFire = true

function setCanFire(state)
	canFire = state
end

local ListBags = {}
local bagList = {}

AddEventHandler("kayscore:skinchanger:sendBagConfig", function(data)
    bagList = data
end)
AddEventHandler("bags:update", function (bags)
	ListBags = bags
end)

Holster_Whitelist = {
	['WEAPON_UNARMED'] = true,
	[`WEAPON_PISTOL`] = true,
	[`WEAPON_PISTOL_MK2`] = true,
	[`WEAPON_COMBATPISTOL`] = true,
	[`WEAPON_PISTOL50`] = true,
	[`WEAPON_SNSPISTOL`] = true,
	[`WEAPON_SNSPISTOL_MK2`] = true,
	[`WEAPON_HEAVYPISTOL`] = true,
	[`WEAPON_VINTAGEPISTOL`] = true,
	[`WEAPON_MARKSMANPISTOL`] = true,
	[`WEAPON_REVOLVER`] = true,
	[`WEAPON_NAVYREVOLVER`] = true,
	[`WEAPON_REVOLVER_MK2`] = true,
	[`WEAPON_DOUBLEACTION`] = true,
	[`WEAPON_APPISTOL`] = true,
	[`WEAPON_STUNGUN`] = true,
	[`WEAPON_FLAREGUN`] = true,
	['WEAPON_COMBATPISTOL'] = true,

}

Holster_WhitelistJob = {
	['police'] = true,
	['bcso'] = true,
}

function GetFrontVehicle(ped)
	local entCoords = GetEntityCoords(ped, false)
	local offset = GetOffsetFromEntityInWorldCoords(ped, 0.0, 4.0, 0.0)
	local ray = StartShapeTestRay(entCoords, offset, 2, ped, 0)
	local _, _, _, _, result = GetShapeTestResult(ray)

	return result
end

local active = false

function IsMale(ped)
    return GetEntityModel(PlayerPedId()) == GetHashKey("mp_m_freemode_01")
end



Citizen.CreateThread(function()
	while not ESXLoaded do Wait(1) end

	

	Player.holsterPreset = GetResourceKvpString("HolsterPreset") 


	if Player.holsterPreset == nil then 
		SetResourceKvp("HolsterPreset", "SideLegHolsterAnimation")
		Player.holsterPreset = GetResourceKvpString("HolsterPreset")
		
	end

	while true do
		if active then 
			Wait(0)
		else
			Wait(500)
		end

		active = false


	
	--	if isInInfectedGame() then goto continue end

	if not IsEntityDead(Player.playerPed) and IsPedOnFoot(Player.playerPed)  then
		local newWeap = GetSelectedPedWeapon(Player.playerPed)

		if newWeap ~= currWeapon then
			active = true
			SetCurrentPedWeapon(Player.playerPed, currWeapon, true)
			local continue = true
		
			-- if (weapons[newWeap] ~= nil) and (weapons[newWeap].parameters.onlyBag) then
			-- 	local bagIndex = GetPedDrawableVariation(Player.playerPed, 5)
			-- 	if bagIndex == nil or ListBags[IsMale()] == nil or ListBags[IsMale()][bagIndex] == nil or not ListBags[IsMale()][bagIndex].weapon then
			-- 		local vehicle = GetFrontVehicle(Player.playerPed)

			-- 		if DoesEntityExist(vehicle) then
			-- 			SetVehicleDoorOpen(vehicle, 5, false, false)
			-- 			Citizen.Wait(2000)
			-- 			SetVehicleDoorShut(vehicle, 5, false)
			-- 		else
			-- 			ESX.ShowNotification("~r~Action Impossible~s~ : Vous devez disposer d'un sac ou être proche d'une voiture.")
			-- 			SetCurrentPedWeapon(ped, unarmedHash, true)
			-- 			continue = false
			-- 		end
			-- 	end
			-- end 

			if weapons[newWeap] ~= nil and weapons[newWeap].parameters.onlyBag then
				local bagIndex = GetPedDrawableVariation(Player.playerPed, 5) -- Vérifie si le joueur a un sac
		
				if bagIndex == 0 then  -- Si bagIndex est 0, le joueur n'a pas de sac
						local vehicle = GetFrontVehicle(Player.playerPed)  -- Vérifie si le joueur est à proximité d'un coffre de véhicule
		
						if DoesEntityExist(vehicle) then
								SetVehicleDoorOpen(vehicle, 5, false, false)
								Citizen.Wait(2000)
								SetVehicleDoorShut(vehicle, 5, false)
						else
								ESX.ShowNotification("~r~Action Impossible~s~ : Vous devez disposer d'un sac ou être proche d'une voiture.")
								SetCurrentPedWeapon(Player.playerPed, unarmedHash, true)
								continue = false
						end
				end
		end

				

				if continue then
					

				 	
					
					if (weapons[newWeap] ~= nil) and (weapons[newWeap].parameters.anim) then
						if holstered then
							canFire = false
							kayscoreHolsters[Player.holsterPreset].intro(Player.playerPed, newWeap, function()
								holstered = false
								canFire = true
								currWeapon = newWeap
							end)
						elseif newWeap ~= currWeapon then
							canFire = false
							kayscoreHolsters[Player.holsterPreset].outro(Player.playerPed, newWeap)
							Citizen.Wait(1000)
							kayscoreHolsters[Player.holsterPreset].intro(Player.playerPed, newWeap, function()
								holstered = false
								canFire = true
								currWeapon = newWeap
							end)
						else
							if holstered then
								canFire = false
								kayscoreHolsters[Player.holsterPreset].intro(Player.playerPed, newWeap, function()
									holstered = false
									canFire = true
								end)
								currWeapon = newWeap
							elseif newWeap ~= currWeapon then
								canFire = false
								kayscoreHolsters[Player.holsterPreset].outro(Player.playerPed, newWeap)
								kayscoreHolsters[Player.holsterPreset].intro(Player.playerPed, newWeap, function()
									holstered = false
									canFire = true
									currWeapon = newWeap
								end)
							end
						end
					else
						if not holstered and (weapons[currWeapon] ~= nil) and (weapons[currWeapon].parameters.anim) then
							canFire = false
							kayscoreHolsters[Player.holsterPreset].outro(Player.playerPed, newWeap, function()
								holstered = true
								canFire = true
							end)
							SetCurrentPedWeapon(Player.playerPed, unarmedHash, true)
							ClearPedTasks(Player.playerPed)
							SetCurrentPedWeapon(Player.playerPed, newWeap, true)
							currWeapon = newWeap
						else
							SetCurrentPedWeapon(Player.playerPed, newWeap, true)
							holstered = false
							canFire = true
							currWeapon = newWeap
						end
					end
				end
			end
		end

		if not canFire then
			DisableControlAction(0, 25, true)
			DisablePlayerFiring(Player.playerPed, true)
		end

		::continue::
	end
end)

local function canAim()
	if IsEntityDead(Player.playerPed) then
		return false
	else
		for i = 1, #kayscoreAimWeapons do
			if GetHashKey(kayscoreAimWeapons[i]) == Player.weapon then
				return true
			end
		end

		return false
	end
end

function playWeaponAnimation(animDict, animName)
    LoadAnimDict(animDict)
    TaskPlayAnim(Player.playerPed, animDict, animName, 8.0, -8.0, -1, 49, 0, 0, 0, 0)
end

Citizen.CreateThread(function()
	while not ESXLoaded do 
		Wait(1) 
	end

	Player.aimStyle = GetResourceKvpString("aimStyle") 

	if Player.aimStyle == nil then 
		SetResourceKvp("aimStyle", "Default")
		Player.aimStyle = GetResourceKvpString("aimStyle")
	end

	while true do 
		local aimStyle = Player.aimStyle 
		local ped = Player.playerPed 
		local weapon = GetSelectedPedWeapon(Player.playerPed)
		if weapon == `WEAPON_UNARMED` or aimStyle == 'Default' then 
			Wait(750)
		else
			Wait(0)
		end

		if aimStyle ~= 'Default' and (Player.vehicle == 0 or Player.vehicle == nil) and canAim() and not IsEntityDead(ped) and IsPedOnFoot(ped) then 
			local ammo = GetAmmoInClip(ped, weapon)

			if type(ammo) ~= 'boolean' then
				if aimStyle == 'Gangster' then 
					if IsPlayerFreeAiming(PlayerId()) or IsControlPressed(0, 25) or IsControlPressed(0, 24)  then
						if not IsEntityPlayingAnim(ped, "combat@aim_variations@1h@gang", "aim_variation_a", 3) then
							playWeaponAnimation("combat@aim_variations@1h@gang", "aim_variation_a")
						end
					elseif IsEntityPlayingAnim(ped, "combat@aim_variations@1h@gang", "aim_variation_a", 3) then
						ClearPedTasks(ped)
					end
					Citizen.Wait(50)
				elseif aimStyle == 'Gangster2' then 
					if IsPlayerFreeAiming(PlayerId()) or IsControlPressed(0, 25) or IsControlPressed(0, 24)  then
						if not IsEntityPlayingAnim(ped, "combat@aim_variations@1h@hillbilly", "aim_variation_a", 3) then
							playWeaponAnimation("combat@aim_variations@1h@hillbilly", "aim_variation_a")	
						end
					elseif IsEntityPlayingAnim(ped, "combat@aim_variations@1h@hillbilly", "aim_variation_a", 3) then
						ClearPedTasks(ped)
					end
					Citizen.Wait(50)
				end
			end
		end

		Citizen.Wait(0)
	end
end)
local IsInSmokeGrenade = false
local SmokeGrenadeTimer = 10
local SmokeGazImmune = false

local gazMask = {
    [36] = true,
    [46] = true,
    [129] = true,
    [130] = true,
    [166] = true,
    [175] = true,
    [177] = true
}

AddEventHandler('gameEventTriggered', function (name, args)
	if name == 'CEventNetworkEntityDamage' and args[1] == Player.playerPed and args[7] == `WEAPON_SMOKEGRENADE` then
        if not SmokeGazImmune then
            if not IsInSmokeGrenade then
                SmokeGrenadeTimer = 10
                IsInSmokeGrenade = true
                SetTimecycleModifier('default')
                SetTransitionTimecycleModifier("hud_def_desat_Trevor", 8.0)

                CreateThread(function()
                    while IsInSmokeGrenade do 
                        ExecuteCommand("e cough")
                        Wait(4500)
                    end
                    ExecuteCommand("emotecancel")
                end)

                while SmokeGrenadeTimer > 0 do
                    Citizen.Wait(1000)
                    if SmokeGrenadeTimer > 0 then
                        SmokeGrenadeTimer = SmokeGrenadeTimer - 1
                    end
                end
                IsInSmokeGrenade = false
                SmokeGrenadeTimer = 10
                SetTransitionTimecycleModifier('default', 5.0)
            end
        end
	end
end)

local attached_weapons = {}
local showWeaponsInBack = kayscoreConfigServ.WeaponInBack.showWeaponsInBack
Citizen.CreateThread(function()
    while true do
        local me = PlayerPedId()
        local selectedWeapon = GetSelectedPedWeapon(me)
        if showWeaponsInBack == true then
        for wep_name, wep_hash in pairs(kayscoreConfigServ.WeaponInBack.compatable_weapon_hashes) do
            if HasPedGotWeapon(me, wep_hash, false) and not attached_weapons[wep_name] and selectedWeapon ~= wep_hash then
                AttachWeapon(wep_name, wep_hash, kayscoreConfigServ.WeaponInBack.back_bone, kayscoreConfigServ.WeaponInBack.x, kayscoreConfigServ.WeaponInBack.y, kayscoreConfigServ.WeaponInBack.z, kayscoreConfigServ.WeaponInBack.x_rotation, kayscoreConfigServ.WeaponInBack.y_rotation, kayscoreConfigServ.WeaponInBack.z_rotation, isMeleeWeapon(wep_name))
            end
        end
	end
        for name, attached_object in pairs(attached_weapons) do
            if selectedWeapon == attached_object.hash or not HasPedGotWeapon(me, attached_object.hash, false) then
                DeleteObject(attached_object.handle)
                attached_weapons[name] = nil
            end
        end

        Wait(500)
    end
end)

function AttachWeapon(attachModel, modelHash, boneNumber, x, y, z, xR, yR, zR, isMelee)
    local bone = GetPedBoneIndex(PlayerPedId(), boneNumber)
    RequestModel(attachModel)
    while not HasModelLoaded(attachModel) do
        Wait(100)
    end

    attached_weapons[attachModel] = {
        hash = modelHash,
        handle = CreateObject(GetHashKey(attachModel), 1.0, 1.0, 1.0, true, true, false)
    }

    if isMelee then
        x = 0.11
        y = -0.14
        z = 0.0
        xR = -75.0
        yR = 185.0
        zR = 92.0
    end
    if attachModel == "prop_ld_jerrycan_01" then
        x = x + 0.3
    end

    AttachEntityToEntity(attached_weapons[attachModel].handle, PlayerPedId(), bone, x, y, z, xR, yR, zR, 1, 1, 0, 0, 2, 1)
end

function isMeleeWeapon(wep_name)
    return wep_name == "prop_golf_iron_01" or wep_name == "w_me_bat" or wep_name == "prop_ld_jerrycan_01"
end
