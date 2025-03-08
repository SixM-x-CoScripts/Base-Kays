code_menu = false

function PermisCodeMenu()
    --code_menu = false
    local menu_code = RageUI.CreateMenu("AutoEcole", "Options disponibles :")
menu_code.Closed = function()
    code_menu = false
    FreezeEntityPosition(PlayerPedId(), false)
end
    if code_menu then
        code_menu = false
        RageUI.Visible(menu_code, false)
        return
    else
        FreezeEntityPosition(PlayerPedId(), true)
        code_menu = true
        checkLicence()
        menu_code.Controls.Back.Enabled = true
        RageUI.Visible(menu_code, true)

        CreateThread(function()
            while code_menu do
                Wait(1)

                RageUI.IsVisible(menu_code, function()

                    RageUI.Separator(string.format("%s↓↓~w~  Auto-école  %s↓↓~w~", kayscoreConfigServ.GTACOLOR, kayscoreConfigServ.GTACOLOR))
                    RageUI.Line()

                    if not code then
                        RageUI.Button('Effectuer le code de la route', nil, {RightLabel = ("~g~%s$~s~ →→"):format(kayscoreConfigServ.ConfigAutoEcole.PrixCode)}, true, {
                            onSelected = function()
                                secured_TriggerServerEvent('rx:BuyLicense', kayscoreConfigServ.ConfigAutoEcole.PrixCode)
                            end
                        })
                    else
                        if not voiture then
                            RageUI.Button("Permis de voiture", nil, {RightLabel = ("~g~%s$~s~ →→"):format(kayscoreConfigServ.ConfigAutoEcole.PrixPermisVoiture)}, true, {
                                onSelected = function()
                                    secured_TriggerServerEvent('rx:BuyPermis', kayscoreConfigServ.ConfigAutoEcole.PrixPermisVoiture, 'drive')
                                    FreezeEntityPosition(PlayerPedId(), false)
                                    code_menu = false
                                    RageUI.CloseAll()
                                end
                            })
                        else
                            RageUI.Button("Permis de voiture", nil, {RightLabel = "~g~Réussi~s~"}, true, {
                            })
                        end

                        if not moto then
                            RageUI.Button("Permis de moto", nil, {RightLabel = ("~g~%s$~s~ →→"):format(kayscoreConfigServ.ConfigAutoEcole.PrixPermisMoto)}, true, {
                                onSelected = function()
                                    secured_TriggerServerEvent('rx:BuyPermis', kayscoreConfigServ.ConfigAutoEcole.PrixPermisMoto, 'drive_bike')
                                    FreezeEntityPosition(PlayerPedId(), false)
                                    code_menu = false
                                    RageUI.CloseAll()
                                end
                            })
                        else
                            RageUI.Button("Permis de moto", nil, {RightLabel = "~g~Réussi~s~"}, true, {
                            })
                        end

                        if not camion then
                            RageUI.Button("Permis de camion", nil, {RightLabel = ("~g~%s$~s~ →→"):format(kayscoreConfigServ.ConfigAutoEcole.PrixPermisCamion)}, true, {
                                onSelected = function()
                                    secured_TriggerServerEvent('rx:BuyPermis', kayscoreConfigServ.ConfigAutoEcole.PrixPermisCamion, 'drive_truck')
                                    FreezeEntityPosition(PlayerPedId(), false)
                                    code_menu = false
                                    RageUI.CloseAll()
                                end
                            })
                        else
                            RageUI.Button("Permis de camion", nil, {RightLabel = "~g~Réussi~s~"}, true, {
                            })
                        end
                    end
                end)
            end
        end)
    end
end

local ErreurPermis = 0
examen_menu = false


function CodeExamenMenu()
    local menu_examen = RageUI.CreateMenu("AutoEcole", "Examen :")
local menu_examen_1 = RageUI.CreateSubMenu(menu_examen, "AutoEcole", "Réponses disponibles :")
local menu_examen_2 = RageUI.CreateSubMenu(menu_examen, "AutoEcole", "Réponses disponibles :")
local menu_examen_3 = RageUI.CreateSubMenu(menu_examen, "AutoEcole", "Réponses disponibles :")
local menu_examen_4 = RageUI.CreateSubMenu(menu_examen, "AutoEcole", "Réponses disponibles :")
local menu_examen_5 = RageUI.CreateSubMenu(menu_examen, "AutoEcole", "Réponses disponibles :")
local menu_examen_6 = RageUI.CreateSubMenu(menu_examen, "AutoEcole", "Réponses disponibles :")
local menu_examen_7 = RageUI.CreateSubMenu(menu_examen, "AutoEcole", "Réponses disponibles :")
local menu_examen_8 = RageUI.CreateSubMenu(menu_examen, "AutoEcole", "Réponses disponibles :")
local menu_examen_9 = RageUI.CreateSubMenu(menu_examen, "AutoEcole", "Réponses disponibles :")
local menu_examen_10 = RageUI.CreateSubMenu(menu_examen, "AutoEcole", "Réponses disponibles :")
local menu_examen_final = RageUI.CreateSubMenu(menu_examen, "AutoEcole", "Résultat du code :")
menu_examen.Closable = false
menu_examen.Closed = function()
    examen_menu = false
end
    if examen_menu then
        examen_menu = false
        RageUI.Visible(menu_examen, false)
        return
    else
        examen_menu = true
        menu_examen.Controls.Back.Enabled = false
        RageUI.Visible(menu_examen, true)

        CreateThread(function()
            while examen_menu do
                Wait(1)

                RageUI.IsVisible(menu_examen, function()

                    RageUI.Separator(string.format("%s↓↓~w~  Auto-école  %s↓↓~w~", kayscoreConfigServ.GTACOLOR, kayscoreConfigServ.GTACOLOR))
                    RageUI.Line()

                    RageUI.Button('Commencer le code de la route', nil, {RightLabel = ("→→")}, true, {
                        onSelected = function()
                            ErreurPermis = 0
                            kayscoreConfigServ.ConfigAutoEcole.timer = 180
                            timer_active = true
                            Notification(("[~y~Information~s~] Vous commencez votre code de la route, vous avez ~g~%s minutes~s~."):format(kayscoreConfigServ.ConfigAutoEcole.timer/60))
                        end
                    }, menu_examen_1)
                end)

                RageUI.IsVisible(menu_examen_1, function()

                    RageUI.Separator("Question :")
                    RageUI.Separator("Quelle est la vitesse adaptée en ville :")
                    RageUI.Line()

                    RageUI.Button('50 km/h', nil, {RightLabel = ("→→")}, true, {
                    }, menu_examen_2)

                    RageUI.Button('70 km/h', nil, {RightLabel = ("→→")}, true, {
                        onSelected = function()
                            ErreurPermis = ErreurPermis + 1
                        end
                    }, menu_examen_2)

                    RageUI.Button('90 km/h', nil, {RightLabel = ("→→")}, true, {
                        onSelected = function()
                            ErreurPermis = ErreurPermis + 1
                        end
                    }, menu_examen_2)
                end)

                RageUI.IsVisible(menu_examen_2, function()

                    RageUI.Separator("Question :")
                    RageUI.Separator("Avant chaque changement de file :")
                    RageUI.Line()

                    RageUI.Button('Vérifiez vos rétroviseurs', nil, {RightLabel = ("→→")}, true, {
                        onSelected = function()
                            ErreurPermis = ErreurPermis + 1
                        end
                    }, menu_examen_3)

                    RageUI.Button('Vérifiez vos angles morts', nil, {RightLabel = ("→→")}, true, {
                        onSelected = function()
                            ErreurPermis = ErreurPermis + 1
                        end
                    }, menu_examen_3)

                    RageUI.Button('Signalez vos intentions', nil, {RightLabel = ("→→")}, true, {
                        onSelected = function()
                            ErreurPermis = ErreurPermis + 1
                        end
                    }, menu_examen_3)

                    RageUI.Button('Tout cela', nil, {RightLabel = ("→→")}, true, {
                    }, menu_examen_3)
                end)

                RageUI.IsVisible(menu_examen_3, function()

                    RageUI.Separator("Question :")
                    RageUI.Separator("Quelle est le taux d'alcoolémie maximale :")
                    RageUI.Line()

                    RageUI.Button('1.5%', nil, {RightLabel = ("→→")}, true, {
                        onSelected = function()
                            ErreurPermis = ErreurPermis + 1
                        end
                    }, menu_examen_4)

                    RageUI.Button('0.5%', nil, {RightLabel = ("→→")}, true, {
                    }, menu_examen_4)

                    RageUI.Button('1.0%', nil, {RightLabel = ("→→")}, true, {
                        onSelected = function()
                            ErreurPermis = ErreurPermis + 1
                        end
                    }, menu_examen_4)
                end)

                RageUI.IsVisible(menu_examen_4, function()

                    RageUI.Separator("Question :")
                    RageUI.Separator("À quel moment vous pouvez passer au feu :")
                    RageUI.Line()

                    RageUI.Button('Vert et/ou rouge et que je tourne à droite', nil, {RightLabel = ("→→")}, true, {
                        onSelected = function()
                            ErreurPermis = ErreurPermis + 1
                        end
                    }, menu_examen_5)

                    RageUI.Button('Quand il n\'y a personne sur l\'intersection', nil, {RightLabel = ("→→")}, true, {
                        onSelected = function()
                            ErreurPermis = ErreurPermis + 1
                        end
                    }, menu_examen_5)

                    RageUI.Button('Quand il est vert', nil, {RightLabel = ("→→")}, true, {
                    }, menu_examen_5)
                end)

                RageUI.IsVisible(menu_examen_5, function()

                    RageUI.Separator("Question :")
                    RageUI.Separator("Vous êtes dépassé, il est important de ne pas:")
                    RageUI.Line()

                    RageUI.Button('Vérifiez vos rétroviseurs', nil, {RightLabel = ("→→")}, true, {
                        onSelected = function()
                            ErreurPermis = ErreurPermis + 1
                        end
                    }, menu_examen_6)

                    RageUI.Button('Augmenter votre vitesse', nil, {RightLabel = ("→→")}, true, {
                    }, menu_examen_6)

                    RageUI.Button('Regarder les autres conducteurs', nil, {RightLabel = ("→→")}, true, {
                        onSelected = function()
                            ErreurPermis = ErreurPermis + 1
                        end
                    }, menu_examen_6)
                end)

                RageUI.IsVisible(menu_examen_6, function()

                    RageUI.Separator("Question :")
                    RageUI.Separator("Quelle est la vitesse adaptée sur l'autoroute :")
                    RageUI.Line()

                    RageUI.Button('90 km/h', nil, {RightLabel = ("→→")}, true, {
                        onSelected = function()
                            ErreurPermis = ErreurPermis + 1
                        end
                    }, menu_examen_7)

                    RageUI.Button('110 km/h', nil, {RightLabel = ("→→")}, true, {
                    }, menu_examen_7)

                    RageUI.Button('150 km/h', nil, {RightLabel = ("→→")}, true, {
                        onSelected = function()
                            ErreurPermis = ErreurPermis + 1
                        end
                    }, menu_examen_7)
                end)

                RageUI.IsVisible(menu_examen_7, function()

                    RageUI.Separator("Question :")
                    RageUI.Separator("En cas de voyant moteur orange allumé :")
                    RageUI.Line()

                    RageUI.Button("Je m'arrête directement", nil, {RightLabel = ("→→")}, true, {
                        onSelected = function()
                            ErreurPermis = ErreurPermis + 1
                        end
                    }, menu_examen_8)

                    RageUI.Button('Je passe au garage au plus vite', nil, {RightLabel = ("→→")}, true, {
                    }, menu_examen_8)

                    RageUI.Button('Je continue sans inquiétude', nil, {RightLabel = ("→→")}, true, {
                        onSelected = function()
                            ErreurPermis = ErreurPermis + 1
                        end
                    }, menu_examen_8)

                    RageUI.Button("Je saute de ma voiture, risque d'explosion", nil, {RightLabel = ("→→")}, true, {
                        onSelected = function()
                            ErreurPermis = ErreurPermis + 1
                        end
                    }, menu_examen_8)
                end)

                RageUI.IsVisible(menu_examen_8, function()

                    RageUI.Separator("Question :")
                    RageUI.Separator("Quelle est la distance de sécurité :")
                    RageUI.Line()

                    RageUI.Button('10m sur autoroute et 2m en ville', nil, {RightLabel = ("→→")}, true, {
                    }, menu_examen_9)

                    RageUI.Button('1m sur autoroute et 1m en ville', nil, {RightLabel = ("→→")}, true, {
                        onSelected = function()
                            ErreurPermis = ErreurPermis + 1
                        end
                    }, menu_examen_9)

                    RageUI.Button('50m sur autoroute et 25m en ville', nil, {RightLabel = ("→→")}, true, {
                        onSelected = function()
                            ErreurPermis = ErreurPermis + 1
                        end
                    }, menu_examen_9)
                end)

                RageUI.IsVisible(menu_examen_9, function()

                    RageUI.Separator("Question :")
                    RageUI.Separator("Vitesse adaptée en zone résidentielle :")
                    RageUI.Line()

                    RageUI.Button('15 km/h', nil, {RightLabel = ("→→")}, true, {
                        onSelected = function()
                            ErreurPermis = ErreurPermis + 1
                        end
                    }, menu_examen_10)

                    RageUI.Button('30 km/h', nil, {RightLabel = ("→→")}, true, {
                    }, menu_examen_10)

                    RageUI.Button('40 km/h', nil, {RightLabel = ("→→")}, true, {
                        onSelected = function()
                            ErreurPermis = ErreurPermis + 1
                        end
                    }, menu_examen_10)
                end)

                RageUI.IsVisible(menu_examen_10, function()

                    RageUI.Separator("Question :")
                    RageUI.Separator("Lorsque les secours sont en alerte :")
                    RageUI.Line()

                    RageUI.Button('Je dégage la voix au plus vite', nil, {RightLabel = ("→→")}, true, {
                        onSelected = function()
                            timer_active = false
                            if ErreurPermis >= 3 then
                                Notification(("[~r~Échoué~s~] Vous avez fait ~r~%s~s~ erreurs."):format(ErreurPermis))
                            else
                                Notification(("[~g~Réussi~s~] Félicitaion, vous avez eu ~r~%s~s~ erreurs."):format(ErreurPermis))
                                secured_TriggerServerEvent('rx:addLicense', 'dmv')
                            end
                        end
                    }, menu_examen_final)

                    RageUI.Button("Je m'arrête au millieu de la route", nil, {RightLabel = ("→→")}, true, {
                        onSelected = function()
                            timer_active = false
                            ErreurPermis = ErreurPermis + 1
                            if ErreurPermis >= 3 then
                                Notification(("[~r~Échoué~s~] Vous avez fait ~r~%s~s~ erreurs."):format(ErreurPermis))
                            else
                                Notification(("[~g~Réussi~s~] Félicitaion, vous avez eu ~r~%s~s~ erreurs."):format(ErreurPermis))
                                secured_TriggerServerEvent('rx:addLicense', 'dmv')
                            end
                        end
                    }, menu_examen_final)

                    RageUI.Button("J'accèlere", nil, {RightLabel = ("→→")}, true, {
                        onSelected = function()
                            timer_active = false
                            ErreurPermis = ErreurPermis + 1
                            if ErreurPermis >= 3 then
                                Notification(("[~r~Échoué~s~] Vous avez fait ~r~%s~s~ erreurs."):format(ErreurPermis))
                            else
                                Notification(("[~g~Réussi~s~] Félicitaion, vous avez eu ~r~%s~s~ erreurs."):format(ErreurPermis))
                                secured_TriggerServerEvent('rx:addLicense', 'dmv')
                            end
                        end
                    }, menu_examen_final)
                end)

                RageUI.IsVisible(menu_examen_final, function()

                    if ErreurPermis >= 3 then
                        RageUI.Separator("Résultat : ~r~Échoué")
                        RageUI.Separator("Vous avez eu ~r~"..ErreurPermis.."~s~ erreurs.")
                    else
                        RageUI.Separator("Résultat : ~g~Réussi")
                        if ErreurPermis == 0 then
                            RageUI.Separator("Vous avez eu ~g~"..ErreurPermis.."~s~ erreurs.")
                        else
                            RageUI.Separator("Vous avez eu ~r~"..ErreurPermis.."~s~ erreurs.")
                        end
                    end
                    RageUI.Line()

                    RageUI.Button("~g~Fermer l'examen", nil, {RightLabel = ("→→")}, true, {
                        onSelected = function()
                            DoScreenFadeOut(1700)
                            Wait(2000)
                            examen_menu = false
                            RageUI.CloseAll()
                            SetPlayerControl(PlayerId(), true)
                            destroyCam(1)
                            SetEntityCoords(PlayerPedId(), vector3(202.1189, -1392.098, 30.61905))
                            SetEntityHeading(PlayerPedId(), 321.98852539063)
                            Wait(1000)
                            DoScreenFadeIn(1700)
                        end
                    })
                end)
            end
        end)
    end
end
CreateThread(function()

    AddZones('AutoEcolePoint', {
        Position = kayscoreConfigServ.ConfigAutoEcole.Pos,
        Dist = 10,
        Public = true,
        Job = nil,
        Job2 = nil,
        GradesJob = {},
        InVehicleDisable = true,
        Blip = {
            Active = false,
        },
        marker = true,
        ActionText =('Appuyez sur [ %sE~w~ ] pour intéragir'):format(UTILS.COLORCODE),
        Action = function()
            PermisCodeMenu()
        end
    })
end)