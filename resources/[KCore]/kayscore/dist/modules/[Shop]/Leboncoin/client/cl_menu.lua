local AnnoncesLeboncoin = {}
local AllAnnonces = {}
local VehPlayer = {}
local VentePlayer = {}
local lastPos = nil
local rot = nil
local Panel = false 
local VerifPrixMec = false 
local CamShowVeh = nil
local Leboncoin = {
    PriceLabel = "Prix",
    PricelabelVeh = "Prix",
    CountLabel = "Quantité",
    Recherche = "~r~Pas de recherche",
    Desc = "~r~Indéfini",

    IndexFiltrePersoAnnonces = 1,
    IndexListShowAnnonces = 1,
    IndexVehVente = 1,
    IndexObjVente = 1,

    FilterRecherche = false,
    Object = true
}



function CheckQuantity(number)
    number = tonumber(number)
    if type(number) == "number" then
        number = ESX.Math.Round(number)

        if number > 0 then
            return true, number
        end
    end
    return false, number
end

OpenLeboncoin = function()
    FreezeEntityPosition(PlayerPedId(), true)
    secured_TriggerServerEvent('kayscore:getInformations')
    local mainlbc = RageUI.CreateMenu("", "Bienvenue sur leboncoin")
   -- mainlbc:SetSizeWidth(99)
    local showannonceperso = RageUI.CreateSubMenu(mainlbc, "", "Voici toutes vos annonces")
    local objvente = RageUI.CreateSubMenu(mainlbc, "", "Mettre un objet en vente")
    local vehvente = RageUI.CreateSubMenu(mainlbc, "", "Mettre un véhicule en vente")
    local showvehannonce = RageUI.CreateSubMenu(mainlbc, "", "Voici les véhicules en vente")
    local showobjannonce = RageUI.CreateSubMenu(mainlbc, "", "Voici les objet en vente")
    local showventeargent = RageUI.CreateSubMenu(mainlbc, "", "Voici la somme de vos vente")

    local valideachatveh = RageUI.CreateSubMenu(showvehannonce, "", "Comfirmer votre achat")
    local venteobj = RageUI.CreateSubMenu(objvente, "", "Remplir les informations")
    local venteveh = RageUI.CreateSubMenu(vehvente, "","Remplir les informations")
    -- PageCounter.showvehannonce = true 
    -- PageCounter.showobjannonce = true 

    RageUI.Visible(mainlbc, not RageUI.Visible(mainlbc))
    
    mainlbc.Closed = function()
        secured_TriggerServerEvent("kayscoreLpb:bucketlbcplayer", false)
        destorycam(CamShowVeh)
        DeleteEntity(LastVeh)
        FreezeEntityPosition(PlayerPedId(), false)
    end
    showvehannonce.Closed = function()
        secured_TriggerServerEvent("kayscoreLpb:bucketlbcplayer", false)
        destorycam(CamShowVeh)
        DeleteEntity(LastVeh)
        --FreezeEntityPosition(PlayerPedId(), false)
    end

    while mainlbc do 
        Wait(0)

        RageUI.IsVisible(mainlbc, function()
			RageUI.Separator("~y~↓ Voir les Annonces ↓")
            RageUI.Button("> Voir les annonces de véhicule", nil, {RightLabel = "→→→"}, true, {}, showvehannonce)
            RageUI.Button("> Voir les annonces d'objet", nil, {RightLabel = "→→→"}, true, {}, showobjannonce)
            RageUI.Separator("~r~↓ Me concernant ↓")
            RageUI.Button("> Consulter mes annonces", nil, {RightLabel = "→→→"}, true, {}, showannonceperso)
			RageUI.Button("> Voir ses ventes", nil, {RightLabel = "→→→"}, true, {}, showventeargent)
            RageUI.Separator("~r~↓ Dépot Annonces ↓")
            RageUI.Button("> Déposer une annonce pour un objet", nil, {RightLabel = "→→→"}, true, {}, objvente)
            RageUI.Button("> Déposer une annonce pour un véhicule", nil, {RightLabel = "→→→"}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback("kayscoreLpb:getplayerveh", function(Infoveh) 
                        VehPlayer = Infoveh
                    end)
                    Wait(10)
                    Citizen.SetTimeout(1500,function()
                        if VehPlayer ~= nil then 

                            if json.encode(VehPlayer) == "[]" then 
                                ESX.TriggerServerCallback("kayscoreLpb:getplayerveh", function(Infoveh) 
                                    VehPlayer = Infoveh
                                end)
                            end
                        else
                            ESX.ShowNotification("Vous n'avez pas de véhicules")
                        end
                    end)
                end
            }, vehvente)
        end, function()
        end)

        RageUI.IsVisible(showannonceperso, function()

            if AnnoncesLeboncoin ~= nil then
                RageUI.List("> Filtre", {"Objet", "Voiture"}, Leboncoin.IndexFiltrePersoAnnonces, nil, {}, true, {
                    onListChange = function(Index)
                        Leboncoin.IndexFiltrePersoAnnonces = Index
                        if Index == 1 then 
                            Leboncoin.Object, Leboncoin.Voiture = true, false
                        elseif Index == 2 then 
                            Leboncoin.Object, Leboncoin.Voiture = false, true
                        end
                    end,
                })
     
                if Leboncoin.Object then 
                    for k, v in pairs(AnnoncesLeboncoin) do 
                        if v.type == "obj" then 
                            RageUI.List("~r~> "..v.label.."", {"Supprimer", "Modifier le prix"}, Leboncoin.IndexListShowAnnonces, "Information sur l'annonce:\nPrix: ~r~"..v.price.." $~s~\nQuantité:~r~ x"..v.count.."", {}, true, {
                                onListChange = function(Index)
                                    Leboncoin.IndexListShowAnnonces = Index 
                                end,
                                onSelected = function(Index)
                                    if Index == 1 then 
                                        secured_TriggerServerEvent("kayscoreLpb:updateannoncelbc", "delete", v.id)
                                        ESX.ShowNotification(kayscoreConfigServ.GTACOLOR.."Slide~s~\nVous avez supprimé votre annonce")
                                    elseif Index == 2 then 
                                        local verif, newprice = CheckQuantity(ESX.GetTextInput("Indiquer le prix", "", "", 10))
                                        if verif then 
                                            secured_TriggerServerEvent("kayscoreLpb:updateannoncelbc", "price", v.id, newprice)
                                            ESX.ShowNotification(kayscoreConfigServ.GTACOLOR.."Slide~s~\nVous avez redéfini le prix de votre annonce sur "..newprice.." $")
                                        else
                                            ESX.ShowNotification("Arguments manquant")
                                        end
                                    end
                                end
                            })
                        end
                    end
                end

                if Leboncoin.Voiture then 
                    for k, v in pairs(AnnoncesLeboncoin) do 
                        if v.type ~= "obj" then 
                            RageUI.List("~r~> "..GetLabelText(GetDisplayNameFromVehicleModel(v.props.model)).."", {"Supprimer", "Modifier le prix"}, Leboncoin.IndexListShowAnnonces, "Information sur l'annonce:\nPrix: ~r~"..v.price.." $~s~\nPlaque:~r~ "..v.plate.."", {}, true, {
                                onListChange = function(Index)
                                    Leboncoin.IndexListShowAnnonces = Index 
                                end,
                                onSelected = function(Index)
                                    if Index == 1 then 
                                        secured_TriggerServerEvent("kayscoreLpb:updateannoncelbc", "delete", v.id, nil, "veh")
                                        ESX.ShowNotification(kayscoreConfigServ.GTACOLOR.."Slide~s~\nVous avez supprimé votre annonce")
                                    elseif Index == 2 then 
                                        local verif, newprice = CheckQuantity(ESX.GetTextInput("Indiquer le prix", "", "", 10))
                                        if verif then 
                                            secured_TriggerServerEvent("kayscoreLpb:updateannoncelbc", "price", v.id, newprice)
                                            ESX.ShowNotification(kayscoreConfigServ.GTACOLOR.."Slide~s~\nVous avez redéfini le prix de votre annonce sur "..newprice.." $")
                                        else
                                            ESX.ShowNotification("Arguments manquant")
                                        end
                                    end
                                end
                            })
                        end
                    end
                end

            else
                RageUI.Separator("Vous n'avez pas d'annonces")
            end

        end, function()
        end)

        RageUI.IsVisible(objvente, function()
            ESX.PlayerData = ESX.GetPlayerData()

            if #ESX.PlayerData.inventory > 0 then 
                RageUI.Separator("↓ Voici vos items ↓")
                for k, v in pairs(ESX.PlayerData.inventory) do 
                    if kayscoreConfigServ.BlackListItem[v.name] == nil then 
                        if v.count >= 0 then 
                            RageUI.Button("~r~"..v.label.."", nil, {RightLabel = "~r~x "..v.count}, true, {
                                onSelected = function()
                                    label = v.label
                                    name = v.name
                                    countt = v.count
                                    Wait(100)
                                end
                            }, venteobj)
                        end
                    end
                end
            else
                RageUI.Separator("~r~Aucun Item")
            end
            
        end, function()
        end)

        RageUI.IsVisible(vehvente, function()
            
            if VehPlayer ~= nil then 

                RageUI.Separator("↓ Voici vos véhicules ↓")
                if #VehPlayer > 0 then 
                    for k, v in pairs(VehPlayer) do 
                        RageUI.Button("~r~"..GetLabelText(GetDisplayNameFromVehicleModel(v.props.model)).."~s~ [~y~"..v.plate.."~s~]", nil, {RightLabel = "→→→"}, true, {
                            onSelected = function()
                                -- print(v.typee)
                                labelveh = GetLabelText(GetDisplayNameFromVehicleModel(v.props.model))
                                plate = v.plate 
                                props = v.props 
                                typee = v.typee 
                                Wait(50)
                            end
                        }, venteveh)
                    end
                else
                    RageUI.Separator("~r~ Chargement de vos véhicules")
                end
            else
                RageUI.Separator("~r~Vous n'avez pas de véhicules")
            end
            
        end, function()
        end)

        RageUI.IsVisible(showvehannonce, function()
            
            if #AllAnnonces > 0 then
                for k, v in pairs(AllAnnonces) do 
                    if v.type ~= "obj" then
                        RageUI.List("> "..GetLabelText(GetDisplayNameFromVehicleModel(v.props.model)).." ["..v.price.."$]", {"Acheter", "Visualiser"}, Leboncoin.IndexVehVente, v.name, {}, true, {
                            onListChange = function(Index)
                                Leboncoin.IndexVehVente = Index
                                destorycam(CamShowVeh)
                                DeleteEntity(LastVeh)
                                secured_TriggerServerEvent("kayscoreLpb:bucketlbcplayer", false)
                            end,
                            onSelected = function(Index)
                                if Index == 1 then 
                                    PriceVeh = v.price
                                    LabelVeh = GetLabelText(GetDisplayNameFromVehicleModel(v.props.model))
                                    IdVeh = v.id
                                    UniqueIDVeh = v.UniqueID
                                    RageUI.Visible(showvehannonce, false)
                                    Wait(60)
                                    RageUI.Visible(valideachatveh, true)
                                elseif Index == 2 then 
                                    Panel = true 
                                    ChageFov = true
                                    CamShowVeh = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
                                    SetCamCoord(CamShowVeh, -78.76, -811.48, 326.08)
                                    SetCamRot(CamShowVeh, 0.0, 0.0, 204.76)
                                    SetCamFov(CamShowVeh, 30.0)
                                    PointCamAtCoord(CamShowVeh, -78.76, -811.48, 326.08)
                                    SetCamActive(CamShowVeh, true)
                                    RenderScriptCams(true, true, 2000, true, false)
                                    secured_TriggerServerEvent("kayscoreLpb:bucketlbcplayer", true)
                                    DeleteEntity(LastVeh)
                                    if ESX.Game.IsSpawnPointClear(vector3(-75.16219, -819.2629, 325.1755), 100) then
                                        ESX.Game.SpawnLocalVehicle(v.props.model, vector3(-75.16219, -819.2629, 325.1755), 355.858, function(vehicle)
                                            LastVeh = vehicle
                                            ESX.Game.SetVehicleProperties(vehicle, v.props)
                                            FreezeEntityPosition(vehicle, true)
                                            SetVehicleDoorsLocked(vehicle, 2)
                                            SetEntityInvincible(vehicle, true)
                                            SetVehicleFixed(vehicle)
                                            local Moteur,Suspension,Freins,Turbo,Armure,Transmission=GetVehicleMod(vehicle,11)+1,GetVehicleMod(vehicle,15)+1,GetVehicleMod(vehicle,12)+1,IsToggleModOn(vehicle,18)and"~r~Oui"or"~r~Non",GetVehicleMod(vehicle, 16)+1,GetVehicleMod(vehicle, 13)+1
                                            ESX.ShowNotification("~w~Moteur ~r~"..Moteur.."\n~w~Freins ~r~"..Freins.."\n~w~Suspension ~r~"..Suspension.."\n~w~Turbo "..Turbo.."~r~\n~w~Armure ~r~"..Armure.."\n~w~Transmission ~r~"..Transmission.."")
                                        end)
                                    else
                                        DeleteEntity(LastVeh)
                                        ESX.Game.SpawnLocalVehicle(v.props.model, vector3(-75.16219, -819.2629, 325.1755), 355.858, function(vehicle)
                                            LastVeh = vehicle
                                            ESX.Game.SetVehicleProperties(vehicle, v.props)
                                            FreezeEntityPosition(vehicle, true)
                                            SetVehicleDoorsLocked(vehicle, 2)
                                            SetEntityInvincible(vehicle, true)
                                            SetVehicleFixed(vehicle)
                                            local Moteur,Suspension,Freins,Turbo,Armure,Transmission=GetVehicleMod(vehicle,11)+1,GetVehicleMod(vehicle,15)+1,GetVehicleMod(vehicle,12)+1,IsToggleModOn(vehicle,18)and"~r~Oui"or"~r~Non",GetVehicleMod(vehicle, 16)+1,GetVehicleMod(vehicle, 13)+1
                                            ESX.ShowNotification("~w~Moteur ~r~"..Moteur.."\n~w~Freins ~r~"..Freins.."\n~w~Suspension ~r~"..Suspension.."\n~w~Turbo "..Turbo.."~r~\n~w~Armure ~r~"..Armure.."\n~w~Transmission ~r~"..Transmission.."")
                                        end)
                                    end
                                end
                            end
                        })
                    end
                end
            else
                RageUI.Separator("Aucunes annonces")
            end
        
        end, function()
        end)

        RageUI.IsVisible(showobjannonce, function()

            if #AllAnnonces > 0 then            
                for k, v in pairs(AllAnnonces) do 
                    if v.type == "obj" then
                        ObjDispo = true 
                        RageUI.Button("> "..v.label.." [x"..v.count.."]", nil, {RightLabel = "~r~"..v.price.." $"}, true, {
                            onSelected = function()
                                local check, quant = CheckQuantity(ESX.GetTextInput('Quantité', ('Quantité'), '', 15))
                                if check then 
                                    secured_TriggerServerEvent("kayscoreLpb:buyobjlbc", v.id, v.UniqueID, quant)
                                    RageUI.GoBack()
                                end
                            end
                        })
                    else
                        ObjDispo = false 
                    end
                end
            else
                RageUI.Separator("Aucunes annonces")
            end
        
        end, function()
        end)

        RageUI.IsVisible(valideachatveh, function()

            RageUI.Separator("Nom du véhicule: ~r~"..LabelVeh)

            RageUI.Separator("Prix du véhicule: ~r~"..PriceVeh)
            
            RageUI.Button("~r~Confirmer l'achat", nil, {RightLabel = "→→→"}, true, {
                onSelected = function()
                    secured_TriggerServerEvent("kayscoreLpb:achatveh", IdVeh, UniqueIDVeh)
                    RageUI.Visible(valideachatveh, false)
                    RageUI.Visible(mainlbc, true)
                end
            })

            RageUI.Button("~r~Retour", nil, {RightLabel = "→→→"}, true, {
                onSelected = function()
                    RageUI.GoBack()
                end
            })
        end)

        RageUI.IsVisible(venteobj, function()

            RageUI.Separator("Item: ~r~"..tostring(label))

            RageUI.Button("Définir le prix de vente (Unité)", nil, {RightLabel = Leboncoin.PriceLabel}, true, {
                onSelected = function()
                    local check, price = CheckQuantity(ESX.GetTextInput("Indiquer le prix de vente", '', '', 100))
                    if check then 
                        Leboncoin.PriceLabel = tostring(price)
                        ESX.ShowNotification(kayscoreConfigServ.GTACOLOR.."Slide~s~\nPrix définir sur ~r~"..price.." $")
                    end
                end
            })

            RageUI.Button("Définir le nombre à vendre", nil, {RightLabel = Leboncoin.CountLabel}, true, {
                onSelected = function()
                    local check, count = CheckQuantity(ESX.GetTextInput("Indiquer le nombre a vendre", '', '', 100))
                    if check then 
                        if tonumber(count) > tonumber(countt) then 
                            ESX.ShowNotification("Vous ne disposez pas suffisament de "..label.." pour faire ceci")
                        else
                            Leboncoin.CountLabel = tostring(count)
                            ESX.ShowNotification(kayscoreConfigServ.GTACOLOR.."Slide~s~\nQuantité définir sur "..count.."")
                        end
                    end
                end
            })

            RageUI.Button("Valider la mise en vente", nil, {RightLabel = "→→→"}, true, {
                onSelected = function()
                    secured_TriggerServerEvent("kayscoreLpb:lbcventeitem", label, name, Leboncoin.CountLabel, Leboncoin.PriceLabel)
                    RageUI.Visible(venteobj, false)
                    RageUI.Visible(mainlbc, true)
                end
            })
        
        end, function()
        end)

        RageUI.IsVisible(venteveh, function()
                      
            RageUI.Button("> Définir le prix de vente", nil, {RightLabel = Leboncoin.PricelabelVeh}, true, {
                onSelected = function()
                    local check, price = CheckQuantity(ESX.GetTextInput("Indiquer le prix", "Indiquer  le prix", "", 10))
                    if check then
                        VerifPrixMec = true 
                        Leboncoin.PricelabelVeh = tostring(price)
                    else
                        ESX.ShowNotification("Arguments manquant")
                    end
                end
            })

            RageUI.Button("Définir une description", nil, {RightLabel = Leboncoin.Desc}, true, {
                onSelected = function()
                    local Infos = ESX.GetTextInput("Indiquer le nombre a vendre", '', '', 100)
                    Leboncoin.Desc = "~r~Définie"
                    DescVeh = tostring(Infos)
                end
            })

            RageUI.Button("Valider la mise en vente", nil, {RightLabel = "→→→"}, VerifPrixMec, {
                onSelected = function()
                    secured_TriggerServerEvent("kayscoreLpb:lbcventeveh", props, plate, Leboncoin.PricelabelVeh, labelveh, DescVeh, typee)
                    RageUI.Visible(venteveh, false)
                    RageUI.Visible(mainlbc, true)
                end
            })
        end)

        RageUI.IsVisible(showventeargent, function()
            RageUI.Separator("↓ Voici vos ventes ↓")

            for k, v in pairs(VentePlayer) do 
                RageUI.Button("> Prix ~r~"..v.price, nil, {RightLabel = "Récupérer"}, true, {
                    onSelected = function()
                        secured_TriggerServerEvent("kayscoreLpb:recupmoneyvente", v.id, v.UniqueID, v.price)
                    end
                })

            end

        end, function()
        end)
        if not RageUI.Visible(mainlbc) and 
        not RageUI.Visible(showannonceperso) and 
        not RageUI.Visible(showallannonces) and
        not RageUI.Visible(objvente) and 
        not RageUI.Visible(showvehannonce) and 
        not RageUI.Visible(showobjannonce) and 
        not RageUI.Visible(venteobj) and 
        not RageUI.Visible(venteveh) and 
        not RageUI.Visible(showventeargent) and 
        not RageUI.Visible(valideachatveh) and 
        not RageUI.Visible(vehvente) then 
            mainlbc = RMenu:DeleteType('mainlbc')
        end
    end

end


Citizen.CreateThread(function()
    while not ESXLoaded do 
        Wait(10)
    end
    Wait(1500)
    secured_TriggerServerEvent("kayscoreLpb:recieveannoncelbc")
    secured_TriggerServerEvent('kayscoreLpb:cballannonces')
end)

RegisterNetEvent("kayscoreLpb:recieveclientsideannoncelbc")
AddEventHandler("kayscoreLpb:recieveclientsideannoncelbc", function(Info)
    AnnoncesLeboncoin = Info   
end)

RegisterNetEvent("kayscoreLpb:recievevehplayer")
AddEventHandler("kayscoreLpb:recievevehplayer", function(veh)
    VehPlayer = veh
end)


secured_RegisterNetEvent("kayscoreLpb:cballannoncesafter")
secured_AddEventHandler("kayscoreLpb:cballannoncesafter", function(infos)
    AllAnnonces = infos 
end)

RegisterNetEvent("kayscoreLpb:recieveventeplayer")
AddEventHandler("kayscoreLpb:recieveventeplayer", function(infos)
    VentePlayer = infos 
end)

function destorycam(camera)
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(camera, true)
end


CreateThread(function()
    
            AddZones("LebonCoins", {
            Position = kayscoreConfigServ.PosLeboncoin,
            Dist = 10,
            Public = true,
            Job = nil,
            Job2 = nil,
            GradesJobRequire = false,
            GradesJob = {},
            InVehicleDisable = true,
            Blip = {
                Active = false,
            },
            ActionText =('Appuyez sur [ %sE~w~ ] pour intéragir'):format(UTILS.COLORCODE),
            marker = true,
            Action = function()
                ESX.TriggerServerCallback("kayscoreLpb:getplayerveh", function(Infoveh) 
                    VehPlayer = Infoveh
                end)
                OpenLeboncoin()
            end
        })
    
            ESX.addBlips({
            name = "Leboncoin",
            label = "Leboncoin",
            category = nil,
            position = vector3(-313.849365, -1034.999146, 30.530506),
            sprite = 478,
            display = 4,
            scale = 0.5,
            color = 51,
            })
end)



RegisterNetEvent('kayscoreLpblegrosfdp:sendLBCInfo')
AddEventHandler('kayscoreLpblegrosfdp:sendLBCInfo',function(LBC, LBCALL)
    AnnoncesLeboncoin = LBC
    AllAnnonces = LBCALL
end)