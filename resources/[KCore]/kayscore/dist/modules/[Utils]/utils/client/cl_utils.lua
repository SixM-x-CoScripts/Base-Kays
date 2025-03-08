LSLIFE_UTILS = {}
function LSLIFE_UTILS:openShopUi(typeShop)
    TriggerEvent('kayscore:openNuiShop', typeShop)
end
CreateThread(function()
    while not HasStreamedTextureDictLoaded("commonmenu") do Wait(150) end
    TextureMenu = CreateDui(kayscoreConfigServ.BannerMenu, 512, 128)
    local tx = CreateRuntimeTextureFromDuiHandle(CreateRuntimeTxd("Coucou"), "JSP", GetDuiHandle(TextureMenu))
    AddReplaceTexture("commonmenu", "interaction_bgd", "Coucou", "JSP")
end)

CreateThread(function()
    while not HasStreamedTextureDictLoaded("commonmenu") do Wait(150) end
    TextureMenu = CreateDui(kayscoreConfigServ.BannerButton, 512, 64)
    local tx = CreateRuntimeTextureFromDuiHandle(CreateRuntimeTxd("Ara"), "aa", GetDuiHandle(TextureMenu))
    AddReplaceTexture("commonmenu", "gradient_nav", "Ara", "ara")
end)

function LSLIFE_UTILS:SetPlayerInvincible(value)
    SetEntityInvincible(PlayerPedId(), value)
end

UTILS = {}

    UTILS.ServerColor = {
        r = kayscoreConfigServ.R,
        g = kayscoreConfigServ.G,
        b = kayscoreConfigServ.B,
        o = kayscoreConfigServ.A
    }

	UTILS.LOGOURL = kayscoreConfigServ.LogoUrl

	UTILS.COLORCODE = kayscoreConfigServ.GTACOLOR

while not ESXLoaded do Wait(1) end


PermWeaponByFramework = {}
PermWeaponByFramework.List = kayscoreConfigServ.PermanantWeapon

function kayscoreConfigServ.PermanantWeapon(weapon)
	for k,v in pairs(PermWeaponByFramework.List) do
		if k == weapon or v == weapon or tostring(k) == tostring(weapon) or tostring(v) == tostring(weapon) then
			ESX.ShowNotification("~r~Action impossible avec cette Arme !~s~")
			return true
		end
	end

	return false
end

function UTILS:verifyText(text, maxLenght, minLenght, capsNeed, speNeed, isDate)
    if text == nil then return end 
    local textLenght = string.len(text)
    local count = 0
    local spaceText = 0
	local spacesWithUpper = 0

	if textLenght > maxLenght then
        ESX.ShowNotification("Le texte contient ~r~"..(textLenght-maxLenght).."~s~ caractères en trop.")
        return nil
    elseif textLenght < minLenght then
        ESX.ShowNotification("Le texte manque de ~r~"..(minLenght-textLenght).."~s~ caractères.")
        return nil
	end

	for i in text:gmatch('[abcdefghijklmnopqrstuvwxyzåäöABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ0123456789 -]') do
		count = count + 1
	end

    if speNeed then
        if count ~= textLenght then
            ESX.ShowNotification('Les caractères spéciaux sont interdit.')
            return nil
        end
    end

	for word in string.gmatch(text, '%S+') do
		if string.match(word, '%u') then
			spacesWithUpper = spacesWithUpper + 1
		end
		spaceText = spaceText + 1
	end

	if spaceText > 4 then
        ESX.ShowNotification('Le texte contient plus que 4 espaces.')
        return nil
    end

    if capsNeed then
        if spacesWithUpper ~= spaceText then
            ESX.ShowNotification('La premiere lettre doit contenir une majuscule.')
            return nil
        end
    end

    if isDate then
        local date = utils.verifyDate(text)
        if not date then
            ESX.ShowNotification('Date invalide.')
            return nil
        end
    end

	return text
end

function UTILS:verifyNumber(number, minNumber, maxNumber, maxNumberLengh)
    if number == nil or maxNumberLengh == nil then 
        return
    end

    local count = 0
    if #tostring(number) > maxNumberLengh then
        ESX.ShowNotification("~r~"..(#number - maxNumberLengh).."~s~ chiffre(s) en trop.")
        return nil
    end

    for i in tostring(number):gmatch('[1234567890]') do
        count = count + 1
    end

    if count ~= #tostring(number) then
        ESX.ShowNotification("Ce n'est pas un nombre.")
        return nil
    end

    number = tonumber(number) or 0

    if number > maxNumber then
        ESX.ShowNotification("~r~Le nombre doit être inférieur a "..maxNumber..".")
        return nil
    end

    if number < minNumber then
        ESX.ShowNotification("~r~Le nombre doit être supérieur a "..minNumber..".")
        return nil
    end

    return number
end

exports('getParmanantWeapon', function(weapon)
	return kayscoreConfigServ.PermanantWeapon(weapon)
end)

local isNotifKevlar = false


-- Citizen.CreateThread( function()
-- 	local resetCounter = 0
-- 	local jumpDisabled = false
  	
--   	while true do
--         Citizen.Wait(750)

-- 		if jumpDisabled and resetCounter > 0 and IsPedJumping(Player.playerPed) and not (GetPedParachuteState(Player.playerPed) == 1)then
-- 			SetPedToRagdoll(Player.playerPed, 500, 500, 3, 0, 0, 0)
-- 			resetCounter = 0
-- 		end

-- 		if not jumpDisabled and IsPedJumping(Player.playerPed) then
-- 			jumpDisabled = true
-- 			resetCounter = 10
-- 			Citizen.Wait(1200)
-- 		end

-- 		if resetCounter > 0 then
-- 			resetCounter = resetCounter - 1
-- 		else
-- 			if jumpDisabled then
-- 				resetCounter = 0
-- 				jumpDisabled = false
-- 			end
-- 		end
-- 	end
-- end)

AddEventHandler('onResourceStart', function(resourceName)

    if GetCurrentResourceName() ~= resourceName then return end

    exports['ui']:hideInfo()
    ClearPedTasks(Player.playerPed)
end)

Citizen.CreateThread(function()
    for i = 1, 12 do
        Citizen.InvokeNative(0xDC0F817884CDD856, i, false)
    end
end)

Citizen.CreateThread(function()
    while not NetworkIsSessionStarted() do
        Citizen.Wait(0)
    end

    -- Désactivation des PNJ agressif
	for _, relationshipGroup in ipairs(kayscoreConfigServ.PNJ.RelationshipGroups) do
		SetRelationshipBetweenGroups(1, relationshipGroup, `PLAYER`)
	end

    -- Désactivation dispatch
	for i = 1, 15 do
		EnableDispatchService(i, false)
	end

    -- Désactivation des drops d'arme LSPD
	for _, weapon in ipairs(kayscoreConfigServ.PNJ.PickupWeapons) do
		ToggleUsePickupsForPlayer(Player.playerId, weapon, false)
	end

    -- Désactivation des spawn police
	SetCreateRandomCopsNotOnScenarios(false)
	SetCreateRandomCops(false)

    -- Suppresion de certains spawn de véhicule
	for _, model in pairs(kayscoreConfigServ.PNJ.SuppressedVehiclesModels) do
		SetVehicleModelIsSuppressed(model, true)
	end

    -- Suppression de certains spawn de peds
	for _, model in pairs(kayscoreConfigServ.PNJ.SuppressedPedsModels) do
		SetPedModelIsSuppressed(model, true)
	end

    SetWeaponsNoAutoswap(true)

    SetMaxWantedLevel(0)
    SetPoliceIgnorePlayer(Player.playerId, true)
    SetDispatchCopsForPlayer(Player.playerId, false)
    SetGarbageTrucks(0)
	SetRandomBoats(0)
	SetRandomTrains(0)
    SetRadarAsExteriorThisFrame()
    SetRadarAsInteriorThisFrame(`h4_fake_islandx`, vec(4700.0, -5145.0), 0, 0)
    SetPedCanBeDraggedOut(Player.playerPed, false)
end)

Citizen.CreateThread(function()
    local ped = PlayerPedId()
    while true do
        Citizen.Wait(5)
        if IsControlPressed(0, 25)
            then DisableControlAction(0, 22, true)
        end
        if IsPedArmed(ped, 6) then
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
          end
    end
end)

