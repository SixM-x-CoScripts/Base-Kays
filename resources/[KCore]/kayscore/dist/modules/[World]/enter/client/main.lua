
PlayerLoadedAnticheat = false

local function openConnectMenu()

    while not ESXLoaded do Wait(1) end

    local playerPdata = ESX.GetPlayerData()

    local function playerAccount(account)
        for k,v in pairs(playerPdata.accounts) do
        
            if v.name == account then
                return v.money..'$'
            end

        end
    end
    
    local sexx = {
        ['0'] = 'Homme',
        ['1'] = 'Femme'
    }
    DisplayHud(false)
    FreezeEntityPosition(Player.playerPed, true)
    SetEntityVisible(Player.playerPed, false, 0)
    CameraConnect = CreateCam("DEFAULT_SCRIPTED_CAMERA", false)
    SetCamCoord(CameraConnect, 1600.397, -2432.388, 323.4131)
    SetCamRot(CameraConnect, 0.0, 0.0, 26.352119445801)
    SetCamFov(CameraConnect, 90.97)
    ShakeCam(CameraConnect, "HAND_SHAKE", 0.2)
    SetCamActive(CameraConnect, true)
    RenderScriptCams(true, false, 2000, true, true)
    DisplayRadar(false)
    --exports['hud']:DisplayHud(false)

    local menu = RageUI.CreateMenu('', ('Bienvenue sur %s'):format(kayscoreConfigServ.ServerName))

    menu.Closable = false

    RageUI.Visible(menu, not RageUI.Visible(menu))
    SetEntityRagdoll = true
    while menu do Wait(1)
        RageUI.IsVisible(menu, function()
            RageUI.Button(('%s %s'):format(playerPdata.firstname, playerPdata.lastname), nil, {RightBadge = RageUI.BadgeStyle.Star}, true, {
                onActive = function()
                    RageUI.Info((kayscoreConfigServ.GTACOLOR..'Bienvenue sur %s'):format(kayscoreConfigServ.ServerName),
                     {
                        'Sexe',
                        'Naissance',
                        'Argent Propre',
                        'Argent Sale',
                        'Argent Banque',
                        'VIP'
                     },
                     {
                        sexx[playerPdata.sex] or 'Unedefined',
                        playerPdata.dateofbirth,
                        playerAccount('cash'),
                        playerAccount('black_money'),
                        playerAccount('bank'),
                        VIP.haveVip() and '✅' or '❌'
                     }
                    )
                end,
                onSelected = function()
                    RageUI.CloseAll()
                    
                    SwitchOutPlayer(PlayerPedId(), 0, 1)
                    exports.luacore:ShowClause()
                    while GetPlayerSwitchState() ~= 5 do
                        Citizen.Wait(0)
                    end
            
                    ShutdownLoadingScreen()
                    ShutdownLoadingScreenNui()
            
            
                    DoScreenFadeIn(2000)
                    while not IsScreenFadedIn() do
                        Citizen.Wait(0)
                    end
            
                    Citizen.Wait(5000)
            
                    SwitchInPlayer(PlayerPedId())

                    DisplayRadar(true)
            
                    while GetPlayerSwitchState() ~= 12 do
                        Citizen.Wait(0)
                    end
                end
            })
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu')

            SetEntityRagdoll = false

            DoScreenFadeOut(1500)
            Wait(2000)
            RenderScriptCams(false, false, 0, true, true)
            Wait(1300)
            FreezeEntityPosition(Player.playerPed, false)
            SetEntityVisible(Player.playerPed, true, 0)
            DoScreenFadeIn(2000)
            DisplayHud(true)
            
            -- ESX.TriggerServerCallback('kayscore:getPhoonne', function(cb)
            --     if cb then
            --         -- exports["lb-phone"]:ToggleOpen(true, false)
        
            --         -- exports["lb-phone"]:SendNotification({
            --         --     app = 'Twitter',
            --         --     title = 'Bienvenue',
            --         --     content = ('Bienvenue sur 🌴 %s'):format(GetConvar('ServerName', ' ')),
            --         -- })
            --     else
            --         -- ESX.ShowAdvancedNotification("Information", "", "Bienvenue sur ~p~🌌 tttt~s~", 'CHAR_MP_FM_CONTACT', 1)
            --     end
            -- end)
            Wait(1300)
            ExecuteCommand(('walk %s'):format(getWalkStyle()))
            PlayerLoadedAnticheat = true

            playerLoaded = true

            ESX.TriggerServerCallback('kayscore:ambulance:getPlayerDead', function(cb)
                if cb then
                    TriggerEvent('kayscore:ambulance:deathEvent')
                    ESX.ShowNotification('Vous vous êtes deconnecté en étant mort !')
                end
            end)
        end
    end
end

AddEventHandler('esx:playerLoaded', function()
    CreateThread(function()
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            if skin ~= nil then
                openConnectMenu()
            end
        end)
    end)
end)