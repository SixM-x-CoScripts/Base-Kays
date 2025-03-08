function OpenMobileWeazelActionsMenu()
	local menu = RageUI.CreateMenu("", "Actions Disponibles")
    local openObjetMenu = RageUI.CreateSubMenu(menu, "", "Actions Disponibles")

	RageUI.Visible(menu, not RageUI.Visible(menu))

	while menu do
		Citizen.Wait(0)
		RageUI.IsVisible(menu, function()
		                    RageUI.Button("Montrer son badge", nil, {}, true, {
                onSelected = function()
                ShowJobBadge(ESX.PlayerData.job.name)
                end
                })
            RageUI.Button('Facture', nil, {}, true, {
                onSelected = function()
					local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
					if closestPlayer == -1 or closestDistance > 3.0 then
						ESX.ShowNotification('Aucun joueur au alentours')
					else
                        local input = ESX.GetNumberInput("Montant de la facture")
                        if input == nil then
                            return ESX.ShowNotification("~r~Le montant de la facture ne peut pas être nul")
                        end

                        secured_TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'weazelnews', 'WeazelNews', input)
					end
                end
            })
            RageUI.Button('Annonce', nil, {}, true, {
                onSelected = function()
                    local input = ESX.GetTextareaInput("Écrivez votre message")
                    if input == nil then
                        return ESX.ShowNotification("~r~Le message ne peut pas être nul")
                    end

                    secured_TriggerServerEvent("Jrn:annonce", input)
                end
            })
            RageUI.Button('Objets', nil, {}, true, {
                onSelected = function()

                end
            }, openObjetMenu)
            
            RageUI.Checkbox('Statut de l\'entreprise', 'Si la case est cochée votre entreprise est notée comme ouverture dans la liste.', Society.List[ESX.PlayerData.job.name].state, {}, {
                onChecked = function()
					secured_TriggerServerEvent('kayscore:jobs:updateSocietyStatus', true)
                end,

                onUnChecked = function()
				secured_TriggerServerEvent('kayscore:jobs:updateSocietyStatus', false)
                end,
            })
		end, function()
		end)

        RageUI.IsVisible(openObjetMenu, function()
            RageUI.Button('Caméra épaule', nil, {}, true, {
                onSelected = function()
                    TriggerEvent('Cam:ToggleCam')
                end
            })
            RageUI.Button('Micro main gauche', nil, {}, true, {
                onSelected = function()
                    TriggerEvent('Mic:ToggleMic')
                end
            })
            RageUI.Button('Micro perche', nil, {}, true, {
                onSelected = function()
                    TriggerEvent('Mic:ToggleBMic')
                end
            })
        end)

		if not RageUI.Visible(menu) and not RageUI.Visible(openObjetMenu) then
			menu = RMenu:DeleteType('menu', true)
		end
	end
end

Citizen.CreateThread(function()
        AddZones('weazel_publicPoint', {
        Position = kayscoreGlobal.WeazelNewsJob.PosAcceuil,
        Dist = 5,
        Public = true,
        Job = nil,
        Job2 = nil,
        GradesJobRequire = false,
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = false,
        },
        ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
        Action = function()
            openPublicWeazelPoint()
        end
    })


    _PEDS.addPed('weazel_secretaire', {
        model = 'a_f_y_femaleagent',
        position = vector3(-590.0178, -920.2650, 23.8691),
        heading = 188.4430,
        scenario = {
            active = true,
            name = "WORLD_HUMAN_CLIPBOARD",
            count = 0,
        },
        weapon = {
            active = false,
            weaponName = 'weapon_heavysniper',
        },
        floatingText = {
            active = true,
            text = 'Brigite',
            color = 34,
        },
    })
end)

function openPublicWeazelPoint()
	local menu = RageUI.CreateMenu("", "Actions Disponibles")

	RageUI.Visible(menu, not RageUI.Visible(menu))

	while menu do
		Citizen.Wait(0)
		RageUI.IsVisible(menu, function()
			RageUI.Button("Envoyer un message", nil, {}, true, {onSelected = function()
                local input = ESX.GetTextInput("Écrivez votre message")
                if input == nil then
                    return ESX.ShowNotification("~r~Le message ne peut pas être nul")
                end

                TriggerServerEvent('kayscore:weazelnews:newInformations', input)
			end})
            RageUI.Button("Demander un RDV", nil, {}, true, {onSelected = function()
                local input = ESX.GetTextInput("Écrivez votre message")
                if input == nil then
                    return ESX.ShowNotification("~r~Le message ne peut pas être nul")
                end

                TriggerServerEvent('kayscore:weazelnews:getRdv', input)
			end})
		end, function()
		end)

		if not RageUI.Visible(menu) then
			menu = RMenu:DeleteType('menu', true)
		end
	end
end
-- cam 
local holdingCam = false
local usingCam = false
local holdingMic = false
local usingMic = false
local holdingBmic = false
local usingBmic = false
local camModel = "prop_v_cam_01"
local camanimDict = "missfinale_c2mcs_1"
local camanimName = "fin_c2_mcs_1_camman"
local micModel = "p_ing_microphonel_01"
local micanimDict = "missheistdocksprep1hold_cellphone"
local micanimName = "hold_cellphone"
local bmicModel = "prop_v_bmike_01"
local bmicanimDict = "missfra1"
local bmicanimName = "mcs2_crew_idle_m_boom"
local bmic_net = nil
local mic_net = nil
local cam_net = nil
local UI = { 
	x =  0.000 ,
	y = -0.001 ,
}

local fov_max = 70.0
local fov_min = 5.0
local zoomspeed = 10.0
local speed_lr = 8.0
local speed_ud = 8.0

local camera = false
local fov = (fov_max+fov_min)*0.5

RegisterNetEvent("Cam:ToggleCam")
AddEventHandler("Cam:ToggleCam", function()
    if not holdingCam then
        local hash_props = GetHashKey(camModel)
        RequestModel(hash_props)
        while not HasModelLoaded(hash_props) do
            Citizen.Wait(100)
        end
		
        local playerPed = PlayerPedId()
        local plyCoords = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 0.0, -5.0)
        local camspawned = CreateObject(hash_props, plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
        Citizen.Wait(1000)
        local netid = ObjToNet(camspawned)
        SetNetworkIdExistsOnAllMachines(netid, true)
        NetworkSetNetworkIdDynamic(netid, true)
        SetNetworkIdCanMigrate(netid, false)
        AttachEntityToEntity(camspawned, playerPed, GetPedBoneIndex(playerPed, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
        TaskPlayAnim(GetPlayerPed(Player.playerId), 1.0, -1, -1, 50, 0, 0, 0, 0) -- 50 = 32 + 16 + 2
        TaskPlayAnim(GetPlayerPed(Player.playerId), camanimDict, camanimName, 1.0, -1, -1, 50, 0, 0, 0, 0)

        cam_net = netid
        holdingCam = true
        while holdingCam do
            local playerPed = PlayerPedId() 

            if holdingCam then
                while not HasAnimDictLoaded(camanimDict) do
                    RequestAnimDict(camanimDict)
                    Citizen.Wait(100)
                end
    
                if not IsEntityPlayingAnim(PlayerPedId(), camanimDict, camanimName, 3) then
                    TaskPlayAnim(GetPlayerPed(Player.playerId), 1.0, -1, -1, 50, 0, 0, 0, 0) -- 50 = 32 + 16 + 2
                    TaskPlayAnim(GetPlayerPed(Player.playerId), camanimDict, camanimName, 1.0, -1, -1, 50, 0, 0, 0, 0)
                end
                    
                DisablePlayerFiring(Player.playerId, true)
                DisableControlAction(0,25,true) -- disable aim
                DisableControlAction(0, 44,  true) -- INPUT_COVER
                DisableControlAction(0,37,true) -- INPUT_SELECT_WEAPON
                SetCurrentPedWeapon(Player.playerPed, GetHashKey("WEAPON_UNARMED"), true)
                ESX.ShowHelpNotification("Pour entrer dans la vision caméra apppuyer sur ~INPUT_PICKUP~ \nPour allez dans la caméra bande noir appuyez sur ~INPUT_INTERACTION_MENU~")
            else
                break
            end

            Wait(0)
        end
    else
        local playerPed = PlayerPedId()
        ClearPedSecondaryTask(playerPed)
        DetachEntity(NetToObj(cam_net), 1, 1)
        DeleteEntity(NetToObj(cam_net))
        cam_net = nil
        holdingCam = false
        usingCam = false
        TriggerEvent('hud:toggleHUD', true)
        DisplayRadar(true)
    end
end)
function HideHUDThisFrame()
	HideHelpTextThisFrame()
	HideHudComponentThisFrame(19) -- weapon wheel
	HideHudComponentThisFrame(1) -- Wanted Stars
	HideHudComponentThisFrame(2) -- Weapon icon
	HideHudComponentThisFrame(3) -- Cash
	HideHudComponentThisFrame(4) -- MP CASH
	HideHudComponentThisFrame(13) -- Cash Change
	HideHudComponentThisFrame(11) -- Floating Help Text
	HideHudComponentThisFrame(12) -- more floating help text
	HideHudComponentThisFrame(15) -- Subtitle Text
	HideHudComponentThisFrame(18) -- Game Stream
end
Citizen.CreateThread(function()
	while true do
        if (holdingCam) then 
            Wait(0)
        else
            Wait(5000)
        end

		local lPed = Player.playerPed
		local vehicle = GetVehiclePedIsIn(lPed)

		if holdingCam and IsControlJustReleased(1, 38) then
        TriggerEvent('hud:toggleHUD', false)
            DisplayRadar(false)
			newscamera = true

			SetTimecycleModifier("default")

			SetTimecycleModifierStrength(0.3)
			
			local scaleform = RequestScaleformMovie("security_camera")
			local scaleform2 = RequestScaleformMovie("breaking_news")


			while not HasScaleformMovieLoaded(scaleform) do
				Citizen.Wait(10)
			end
			while not HasScaleformMovieLoaded(scaleform2) do
				Citizen.Wait(10)
			end

			local lPed = Player.playerPed
			local vehicle = GetVehiclePedIsIn(lPed)
			local cam2 = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA", true)

			AttachCamToEntity(cam2, lPed, 0.0,0.0,1.0, true)
			SetCamRot(cam2, 2.0,1.0,GetEntityHeading(lPed))
			SetCamFov(cam2, fov)
			RenderScriptCams(true, false, 0, 1, 0)
			PushScaleformMovieFunction(scaleform, "SET_CAM_LOGO")
			PushScaleformMovieFunction(scaleform2, "breaking_news")
			PopScaleformMovieFunctionVoid()

			while newscamera and not IsEntityDead(lPed) and (GetVehiclePedIsIn(lPed) == vehicle) and true do
				if IsControlJustPressed(1, 177) then
					PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
					newscamera = false
				end

				SetEntityRotation(lPed, 0, 0, new_z,2, true)
					
				local zoomvalue = (1.0/(fov_max-fov_min))*(fov-fov_min)
				CheckInputRotation(cam2, zoomvalue)

				HandleZoom(cam2)
				HideHUDThisFrame()

				DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
				DrawScaleformMovie(scaleform2, 0.5, 0.63, 1.0, 1.0, 255, 255, 255, 255)
				Breaking(("WEAZEL NEWS %s"):format(kayscoreConfigServ.ServerName))
				
				local camHeading = GetGameplayCamRelativeHeading()
				local camPitch = GetGameplayCamRelativePitch()
				if camPitch < -70.0 then
					camPitch = -70.0
				elseif camPitch > 42.0 then
					camPitch = 42.0
				end
				camPitch = (camPitch + 70.0) / 112.0
				
				if camHeading < -180.0 then
					camHeading = -180.0
				elseif camHeading > 180.0 then
					camHeading = 180.0
				end
				camHeading = (camHeading + 180.0) / 360.0
				
				Citizen.InvokeNative(0xD5BB4025AE449A4E, Player.playerPed, "Pitch", camPitch)
				Citizen.InvokeNative(0xD5BB4025AE449A4E, Player.playerPed, "Heading", camHeading * -1.0 + 1.0)
				
				Citizen.Wait(0)
			end

            DisplayRadar(true)
            TriggerEvent('hud:toggleHUD', true)
			newscamera = false
			ClearTimecycleModifier()
			fov = (fov_max+fov_min)*0.5
			RenderScriptCams(false, false, 0, 1, 0)
			SetScaleformMovieAsNoLongerNeeded(scaleform)
			DestroyCam(cam2, false)
			SetNightvision(false)
			SetSeethrough(false)
		end

		if holdingCam and IsControlJustReleased(1, 244) then
			movcamera = true
            TriggerEvent('hud:toggleHUD', false)
            DisplayRadar(false)
			SetTimecycleModifier("default")

			SetTimecycleModifierStrength(0.3)
			
			local scaleform = RequestScaleformMovie("security_camera")

			while not HasScaleformMovieLoaded(scaleform) do
				Citizen.Wait(10)
			end


			local lPed = Player.playerPed
			local vehicle = GetVehiclePedIsIn(lPed)
			local cam1 = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA", true)

			AttachCamToEntity(cam1, lPed, 0.0,0.0,1.0, true)
			SetCamRot(cam1, 2.0,1.0,GetEntityHeading(lPed))
			SetCamFov(cam1, fov)
			RenderScriptCams(true, false, 0, 1, 0)
			PushScaleformMovieFunction(scaleform, "security_camera")
			PopScaleformMovieFunctionVoid()

			while movcamera and not IsEntityDead(lPed) and (GetVehiclePedIsIn(lPed) == vehicle) and true do
				if IsControlJustPressed(0, 177) then
					PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
					movcamera = false
				end
				
				SetEntityRotation(lPed, 0, 0, new_z,2, true)

				local zoomvalue = (1.0/(fov_max-fov_min))*(fov-fov_min)
				CheckInputRotation(cam1, zoomvalue)

				HandleZoom(cam1)
				HideHUDThisFrame()

				drawRct(UI.x + 0.0, 	UI.y + 0.0, 1.0,0.15,0,0,0,255) -- Top Bar
				DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
				drawRct(UI.x + 0.0, 	UI.y + 0.85, 1.0,0.16,0,0,0,255) -- Bottom Bar
				
				local camHeading = GetGameplayCamRelativeHeading()
				local camPitch = GetGameplayCamRelativePitch()
				if camPitch < -70.0 then
					camPitch = -70.0
				elseif camPitch > 42.0 then
					camPitch = 42.0
				end
				camPitch = (camPitch + 70.0) / 112.0
				
				if camHeading < -180.0 then
					camHeading = -180.0
				elseif camHeading > 180.0 then
					camHeading = 180.0
				end
				camHeading = (camHeading + 180.0) / 360.0
				
				Citizen.InvokeNative(0xD5BB4025AE449A4E, Player.playerPed, "Pitch", camPitch)
				Citizen.InvokeNative(0xD5BB4025AE449A4E, Player.playerPed, "Heading", camHeading * -1.0 + 1.0)
				
				Citizen.Wait(0)
			end

            DisplayRadar(true)
            TriggerEvent('hud:toggleHUD', true)
			movcamera = false
			ClearTimecycleModifier()
			fov = (fov_max+fov_min)*0.5
			RenderScriptCams(false, false, 0, 1, 0)
			SetScaleformMovieAsNoLongerNeeded(scaleform)
			DestroyCam(cam1, false)
			SetNightvision(false)
			SetSeethrough(false)
		end
	end
end)

function CheckInputRotation(cam, zoomvalue)
	local rightAxisX = GetDisabledControlNormal(0, 220)
	local rightAxisY = GetDisabledControlNormal(0, 221)
	local rotation = GetCamRot(cam, 2)
	if rightAxisX ~= 0.0 or rightAxisY ~= 0.0 then
		new_z = rotation.z + rightAxisX*-1.0*(speed_ud)*(zoomvalue+0.1)
		new_x = math.max(math.min(20.0, rotation.x + rightAxisY*-1.0*(speed_lr)*(zoomvalue+0.1)), -89.5)
		SetCamRot(cam, new_x, 0.0, new_z, 2)
	end
end

function HandleZoom(cam)
	local lPed = Player.playerPed
	if not ( IsPedSittingInAnyVehicle( lPed ) ) then

		if IsControlJustPressed(0,241) then
			fov = math.max(fov - zoomspeed, fov_min)
		end
		if IsControlJustPressed(0,242) then
			fov = math.min(fov + zoomspeed, fov_max)
		end
		local current_fov = GetCamFov(cam)
		if math.abs(fov-current_fov) < 0.1 then
			fov = current_fov
		end
		SetCamFov(cam, current_fov + (fov - current_fov)*0.05)
	else
		if IsControlJustPressed(0,17) then
			fov = math.max(fov - zoomspeed, fov_min)
		end
		if IsControlJustPressed(0,16) then
			fov = math.min(fov + zoomspeed, fov_max)
		end
		local current_fov = GetCamFov(cam)
		if math.abs(fov-current_fov) < 0.1 then
			fov = current_fov
		end
		SetCamFov(cam, current_fov + (fov - current_fov)*0.05)
	end
end

function drawRct(x,y,width,height,r,g,b,a)
	DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end

function Breaking(text)
    SetTextColour(255, 255, 255, 255)
    SetTextFont(8)
    SetTextScale(1.2, 1.2)
    SetTextWrap(0.0, 1.0)
    SetTextCentre(false)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 205)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(0.2, 0.85)
end

-- MICRO MAIN GAUCHE

RegisterNetEvent('Mic:ToggleMic', function()
    local playerPed = PlayerPedId()
    if not (holdingMic) then
        local propsHash = GetHashKey(micModel) 
        RequestModel(propsHash)
        while not HasModelLoaded(propsHash) do 
            Wait(1000)
        end

        while not HasAnimDictLoaded(micanimDict) do 
            RequestAnimDict(micanimDict)
            Wait(100)
        end

        local plyCoords = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 0.0, -5.0)
        local micspawned = CreateObject(propsHash, plyCoords.x, plyCoords.y, plyCoords.z, 1,1,1)
        Wait(1000)
        local netid = ObjToNet(micspawned)
        SetNetworkIdExistsOnAllMachines(netid, true)
        NetworkSetNetworkIdDynamic(netid, true)
        SetNetworkIdCanMigrate(netid, false)
        AttachEntityToEntity(micspawned, playerPed, GetPedBoneIndex(playerPed, 60309), 0.055, 0.05, 0.0, 240.0, 0.0, 240.0, 0.0, 0.0, 1,1,0,1,0,1)
        TaskPlayAnim(playerPed, 1.0, -1, -1, 50, 0, 0, 0, 0)
        TaskPlayAnim(playerPed, micanimDict, micanimName, 1.0, -1, -1, 50, 0, 0, 0, 0)
        mic_net = netid
        holdingMic = true
    else
        ClearPedSecondaryTask(playerPed)
        DetachEntity(NetToObj(mic_net), 1,1)
        DeleteEntity(NetToObj(mic_net))
        mic_net = nil
        holdingMic = false
        usingMic = false
    end
end)


-- micro perche 

RegisterNetEvent("Mic:ToggleBMic")
AddEventHandler("Mic:ToggleBMic", function()
    if not holdingBmic then
        RequestModel(GetHashKey(bmicModel))
        while not HasModelLoaded(GetHashKey(bmicModel)) do
            Citizen.Wait(100)
        end
		
        local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(Player.playerId), 0.0, 0.0, -5.0)
        local bmicspawned = CreateObject(GetHashKey(bmicModel), plyCoords.x, plyCoords.y, plyCoords.z, true, true, false)
        Citizen.Wait(1000)
        local netid = ObjToNet(bmicspawned)
        SetNetworkIdExistsOnAllMachines(netid, true)
        NetworkSetNetworkIdDynamic(netid, true)
        SetNetworkIdCanMigrate(netid, false)
        AttachEntityToEntity(bmicspawned, GetPlayerPed(Player.playerId), GetPedBoneIndex(GetPlayerPed(Player.playerId), 28422), -0.08, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
        TaskPlayAnim(GetPlayerPed(Player.playerId), 1.0, -1, -1, 50, 0, 0, 0, 0) -- 50 = 32 + 16 + 2
        TaskPlayAnim(GetPlayerPed(Player.playerId), bmicanimDict, bmicanimName, 1.0, -1, -1, 50, 0, 0, 0, 0)
        bmic_net = netid
        holdingBmic = true
    else
        ClearPedSecondaryTask(GetPlayerPed(Player.playerId))
        DetachEntity(NetToObj(bmic_net), 1, 1)
        DeleteEntity(NetToObj(bmic_net))
        bmic_net = nil
        holdingBmic = false
        usingBmic = false
    end
end)

Citizen.CreateThread(function()
	while true do
        if (holdingBmic) then 
            Citizen.Wait(0)
        else
            Wait(5000)
        end

		if holdingBmic then
			while not HasAnimDictLoaded(bmicanimDict) do
				RequestAnimDict(bmicanimDict)
				Citizen.Wait(100)
			end

			if not IsEntityPlayingAnim(PlayerPedId(), bmicanimDict, bmicanimName, 3) then
				TaskPlayAnim(GetPlayerPed(Player.playerId), 1.0, -1, -1, 50, 0, 0, 0, 0) -- 50 = 32 + 16 + 2
				TaskPlayAnim(GetPlayerPed(Player.playerId), bmicanimDict, bmicanimName, 1.0, -1, -1, 50, 0, 0, 0, 0)
			end
			
			DisablePlayerFiring(Player.playerId, true)
			DisableControlAction(0,25,true) -- disable aim
			DisableControlAction(0, 44,  true) -- INPUT_COVER
			DisableControlAction(0,37,true) -- INPUT_SELECT_WEAPON
			SetCurrentPedWeapon(Player.playerPed, GetHashKey("WEAPON_UNARMED"), true)
			
			if (IsPedInAnyVehicle(Player.playerPed, -1) and GetPedVehicleSeat(Player.playerPed) == -1) or IsPedCuffed(Player.playerPed) or holdingMic then
				ClearPedSecondaryTask(Player.playerPed)
				DetachEntity(NetToObj(bmic_net), 1, 1)
				DeleteEntity(NetToObj(bmic_net))
				bmic_net = nil
				holdingBmic = false
				usingBmic = false
			end
		end
	end
end)
RegisterCommand('weazelnews_menu', function()
    if ESX.PlayerData.job.name ~= 'weazelnews' then return end

    OpenMobileWeazelActionsMenu()
end)

RegisterKeyMapping('weazelnews_menu', 'Menu Weazel', 'keyboard', 'F6')