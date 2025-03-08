

CreateThread(function()
    local acces = false
    local sexx = {
        ['0'] = 'Homme',
        ['1'] = 'Femme'
    }
    
  --  local SaveInfo = {
   --     firstname = nil,
   --     lastname = nil,
   --     dateofbirth = nil,
  --      sex = nil,
  --      height = nil,
  --  }
  openCreateIdentityCard = function()
    FreezeEntityPosition(Player.playerPed, true)
    local mainPrefecture = RageUI.CreateMenu('', 'Actions Disponibles')

    RageUI.Visible(mainPrefecture, not RageUI.Visible(mainPrefecture))
    ESX.TriggerServerCallback('kayscore:identity_card:getCard', function(cb)
        acces = cb
    end)
    local SaveInfo = {}
    ESX.TriggerServerCallback('kayscore:identity_card:getCardInfo', function(cb)
        SaveInfo = cb
    end)
    
    while mainPrefecture do Wait(1)
        RageUI.IsVisible(mainPrefecture, function()
            if not acces then
                RageUI.Separator("~r~Vous avez déjà récupéré votre carte d'identité")
            else
                RageUI.Button('Votre Prénom', nil, {RightLabel = SaveInfo.firstname and SaveInfo.firstname or '~r~Indéfini~s~'}, true, {})
                RageUI.Button('Votre Nom', nil, {RightLabel = SaveInfo.lastname and SaveInfo.lastname or '~r~Indéfini~s~'}, true, {})
                RageUI.Button('Votre Âge', nil, {RightLabel = SaveInfo.dateofbirth and SaveInfo.dateofbirth or '~r~Indéfini~s~'}, true, {})                
                RageUI.Button('Votre Sexe', nil, {RightLabel = sexx[SaveInfo.sex] or 'Unedefined'}, true, {})
                                
                if SaveInfo.firstname ~= nil and SaveInfo.lastname ~= nil and SaveInfo.dateofbirth ~= nil and  SaveInfo.sex ~= nil then
                    RageUI.Line()
                    RageUI.Button('Confirmer la création de votre carte d\'identité', nil, {RightLabel = '→'}, true, {
                        onSelected = function()
                            local playerPed = PlayerPedId()
                            local hatIndex = GetPedPropIndex(playerPed, 0)
                            local glassesIndex = GetPedPropIndex(playerPed, 1)
                            local maskIndex = GetPedDrawableVariation(playerPed, 1)
                            
                            if (hatIndex == 7 or hatIndex == 10 or hatIndex == 12) or glassesIndex == 1 or maskIndex == 1 then
                                local items = {}
                                if hatIndex == 7 or hatIndex == 10 or hatIndex == 11 then table.insert(items, "votre chapeau") end
                                if glassesIndex == 1 then table.insert(items, "vos lunettes") end
                                if maskIndex == 1 then table.insert(items, "votre masque") end
                                ESX.ShowNotification("Veuillez retirer " .. table.concat(items, " et ") .. " avant de créer votre carte d'identité.")
                            else
                                exports['sPrompt']:displayRequest(
                                    kayscoreConfigServ.ServerName,
                                    'Voulez-vous créer votre carte ?',
                                    function() -- Oui
                                        TriggerServerEvent('kayscore:identity_card:create', SaveInfo)
                                        RageUI.CloseAll()
                                    end,
                                    function() -- Non
                                        ESX.ShowNotification("Vous avez annulé l'action")
                                    end
                                )
                            end
                        end
                    })
                end
            end
        end)

        if not RageUI.Visible(mainPrefecture) then
            mainPrefecture = RMenu:DeleteType('mainPrefecture')
            acces = false
            FreezeEntityPosition(Player.playerPed, false)
        end
    end
end



    AddZones("identity_card_create", {
		Position = kayscoreConfigServ.PosPrefecture,
        Dist = 10,
        Public = true,
        Job =  nil,
        Job2 =  nil,
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = true,
            Position = kayscoreConfigServ.PosPrefecture,
            Text = "Préfécture",
            BlipId = 498,
            Scale = 0.0,
            Color = 16
        },
        ActionText =('Appuyez sur [ %sE~w~ ] pour intéragir'):format(UTILS.COLORCODE),
        Action = function()
            openCreateIdentityCard()
        end
	})
end)