Bind = {}
Animations = {
    BindIndex = 1,
    UnBindIndex = 1
}

function AnimationMenu()
    local mainMenu = RageUI.CreateMenu("", "Animation")
    local expressions = RageUI.CreateSubMenu(mainMenu, "", "Expressions")
    local emotes = RageUI.CreateSubMenu(mainMenu, "", "Emotes")
    local dances = RageUI.CreateSubMenu(mainMenu, "", "Dances")
    local shared = RageUI.CreateSubMenu(mainMenu, "", "Partagés")
    local objets = RageUI.CreateSubMenu(mainMenu, "", "Objets")
    local bindEmotes = RageUI.CreateSubMenu(emotes, "", "Bind")
    local bindDances = RageUI.CreateSubMenu(dances, "", 'Bind')
    local bindShared = RageUI.CreateSubMenu(shared, "", "Bind")
    local bindObject = RageUI.CreateSubMenu(objets, "", "Bind")
    local bindExpressions = RageUI.CreateSubMenu(expressions, "", "Bind")
    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
    while mainMenu do
        Wait(1.0)
        RageUI.IsVisible(mainMenu, function()

            RageUI.Button("Expressions", nil, {}, true, {
            }, expressions)
            RageUI.Button("Animations", nil, {}, true, {
            }, emotes)
            RageUI.Button("Danses", nil, {}, true, {
            }, dances)
            RageUI.Button("Partagés", nil, {}, true, {
            }, shared)
            RageUI.Button("Objets", nil, {}, true, {
            }, objets)
        end)



        RageUI.IsVisible(expressions, function()
            for emoteName,emoteValue in pairs(Animation.Expressions) do
                RageUI.Button(emoteName, emoteName, {}, true, {
                    onSelected = function()
                        onEmoteType = "expressions"
                        onEmoteName = emoteName
                    end
                },bindExpressions)
            end
        end)

        RageUI.IsVisible(emotes, function()
            for emoteName,emoteValue in pairs(Animation.Emotes) do
                _,_,name = table.unpack(emoteValue)
                RageUI.Button(name, emoteName, {}, true, {
                    onSelected = function()
                        onEmoteType = "emotes"
                        onEmoteName = emoteName
                    end
                },bindEmotes)
            end
        end)

        RageUI.IsVisible(dances, function()
            for emoteName,emoteValue in pairs(Animation.Dances) do
                _,_,name = table.unpack(emoteValue)
                RageUI.Button(name, emoteName, {}, true, {
                    onSelected = function()
                        onEmoteType = "dances"
                        onEmoteName = emoteName
                    end
                },bindDances)
            end
        end)

        RageUI.IsVisible(shared, function()
            for emoteName,emoteValue in pairs(Animation.Shared) do
                _,_,name = table.unpack(emoteValue)
                RageUI.Button(name, emoteName, {}, true, {
                    onSelected = function()
                        onEmoteType = "shared"
                        onEmoteName = emoteName
                    end
                },bindShared)
            end
        end)

        RageUI.IsVisible(objets, function()
            for emoteName,emoteValue in pairs(Animation.Props) do 
                _,_,name = table.unpack(emoteValue)
                RageUI.Button(name, emoteName, {}, true, {
                    onSelected = function()
                        onEmoteType = "props"
                        onEmoteName = emoteName
                    end
                },bindObject)
            end
        end)



        RageUI.IsVisible(bindExpressions, function()
            RageUI.Button("Jouer l'animation", nil, {}, true, {
                onSelected = function()
                    if OnEmotePlay(Animation.Expressions[onEmoteName]) then end
                end
            })
            RageUI.Button("Annuler l'animation", nil, {}, true, {
                onSelected = function()
                    ClearFacialIdleAnimOverride(PlayerPedId())
                end
            })
            RageUI.List("Bind sur la touche", {"num 1","num 2", "num 3","num 4","num 5","num 6","num 7","num 8","num 9"}, Animations.BindIndex, nil, {}, true, {
                onListChange = function(Index, Item)
                    Animations.BindIndex = Index
                end,

                onSelected = function(Index, Item)
                    for k,v in pairs(Bind) do
                        if k == Animations.BindIndex then
                            if not v.usable then
                                ESX.ShowNotification("Vous avez bind l'animation : ~b~"..onEmoteName.."~s~ sur la touche : ~b~"..Item.."~s~.")
                                SetAnimationKvp(Animations.BindIndex, {emoteType = onEmoteType, emoteName = onEmoteName})
                            else
                                ESX.ShowNotification("~r~Vous ne pouvez pas bind cette animations car cette touche est déjà prise.")
                            end
                        end
                    end 
                end,
            })
            RageUI.List("Supprimer un bind", {"num 1","num 2", "num 3","num 4","num 5","num 6","num 7","num 8","num 9"}, Animations.UnBindIndex, nil, {}, true, {
                onListChange = function(Index, Item)
                    Animations.UnBindIndex = Index
                end,

                onSelected = function(Index, Item)
                    for k,v in pairs(Bind) do
                        if v.usable then
                            ESX.ShowNotification("~r~Vous avez supprimé une animations sur la touche : "..Item..".")
                            SetAnimationKvp(Animations.UnBindIndex, false)
                        end
                    end 
                end,
            })
        end)

        RageUI.IsVisible(bindObject, function()
            RageUI.Button("Jouer l'animation", nil, {}, true, {
                onSelected = function()
                    if OnEmotePlay(Animation.Props[onEmoteName]) then end
                end
            })
            RageUI.Button("Annuler l'animation", nil, {}, true, {
                onSelected = function()
                    if IsInAnimation then
                        EmoteCancel()
                    end
                end
            })
            RageUI.List("Bind sur la touche", {"num 1","num 2", "num 3","num 4","num 5","num 6","num 7","num 8","num 9"}, Animations.BindIndex, nil, {}, true, {
                onListChange = function(Index, Item)
                    Animations.BindIndex = Index
                end,

                onSelected = function(Index, Item)
                    for k,v in pairs(Bind) do
                        if k == Animations.BindIndex then
                            if not v.usable then
                                ESX.ShowNotification("Vous avez bind l'animation : ~b~"..onEmoteName.."~s~ sur la touche : ~b~"..Item.."~s~.")
                                SetAnimationKvp(Animations.BindIndex, {emoteType = onEmoteType, emoteName = onEmoteName})
                            else
                                ESX.ShowNotification("~r~Vous ne pouvez pas bind cette animations car cette touche est déjà prise.")
                            end
                        end
                    end 
                end,
            })
            RageUI.List("Supprimer un bind", {"num 1","num 2", "num 3","num 4","num 5","num 6","num 7","num 8","num 9"}, Animations.UnBindIndex, nil, {}, true, {
                onListChange = function(Index, Item)
                    Animations.UnBindIndex = Index
                end,

                onSelected = function(Index, Item)
                    for k,v in pairs(Bind) do
                        if v.usable then
                            ESX.ShowNotification("~r~Vous avez supprimé une animations sur la touche : "..Item..".")
                            SetAnimationKvp(Animations.UnBindIndex, false)
                        end
                    end 
                end,
            })
        end)

        RageUI.IsVisible(bindShared, function()
            RageUI.Button("Jouer l'animation", nil, {}, true, {
                onSelected = function()
                    target, distance = GetClosestPlayer()
                    if (distance ~= -1 and distance < 3) then
                        TriggerServerEvent("ServerEmoteRequest", GetPlayerServerId(target), onEmoteName)
                    else
                        ESX.ShowNotification("~r~Aucun individu à proximité.")
                    end
                end
            })
            RageUI.Button("Annuler l'animation", nil, {}, true, {
                onSelected = function()
                    if IsInAnimation then
                        EmoteCancel()
                    end
                end
            })
            RageUI.List("Bind sur la touche", {"num 1","num 2", "num 3","num 4","num 5","num 6","num 7","num 8","num 9"}, Animations.BindIndex, nil, {}, true, {
                onListChange = function(Index, Item)
                    Animations.BindIndex = Index
                end,

                onSelected = function(Index, Item)
                    for k,v in pairs(Bind) do
                        if k == Animations.BindIndex then
                            if not v.usable then
                                ESX.ShowNotification("Vous avez bind l'animation : ~b~"..onEmoteName.."~s~ sur la touche : ~b~"..Item.."~s~.")
                                SetAnimationKvp(Animations.BindIndex, {emoteType = onEmoteType, emoteName = onEmoteName})
                            else
                                ESX.ShowNotification("~r~Vous ne pouvez pas bind cette animations car cette touche est déjà prise.")
                            end
                        end
                    end 
                end,
            })
            RageUI.List("Supprimer un bind", {"num 1","num 2", "num 3","num 4","num 5","num 6","num 7","num 8","num 9"}, Animations.UnBindIndex, nil, {}, true, {
                onListChange = function(Index, Item)
                    Animations.UnBindIndex = Index
                end,

                onSelected = function(Index, Item)
                    for k,v in pairs(Bind) do
                        if v.usable then
                            ESX.ShowNotification("~r~Vous avez supprimé une animations sur la touche : "..Item..".")
                            SetAnimationKvp(Animations.UnBindIndex, false)
                        end
                    end 
                end,
            })
        end)

        RageUI.IsVisible(bindEmotes, function()
            RageUI.Button("Jouer l'animation", nil, {}, true, {
                onSelected = function()
                    if OnEmotePlay(Animation.Emotes[onEmoteName]) then end
                end
            })
            RageUI.Button("Annuler l'animation", nil, {}, true, {
                onSelected = function()
                    if IsInAnimation then
                        EmoteCancel()
                    end
                end
            })
            RageUI.List("Bind sur la touche", {"num 1","num 2", "num 3","num 4","num 5","num 6","num 7","num 8","num 9"}, Animations.BindIndex, nil, {}, true, {
                onListChange = function(Index, Item)
                    Animations.BindIndex = Index
                end,

                onSelected = function(Index, Item)
                    for k,v in pairs(Bind) do
                        if k == Animations.BindIndex then
                            if not v.usable then
                                ESX.ShowNotification("Vous avez bind l'animation : ~b~"..onEmoteName.."~s~ sur la touche : ~b~"..Item.."~s~.")
                                SetAnimationKvp(Animations.BindIndex, {emoteType = onEmoteType, emoteName = onEmoteName})
                            else
                                ESX.ShowNotification("~r~Vous ne pouvez pas bind cette animations car cette touche est déjà prise.")
                            end
                        end
                    end 
                end,
            })
            RageUI.List("Supprimer un bind", {"num 1","num 2", "num 3","num 4","num 5","num 6","num 7","num 8","num 9"}, Animations.UnBindIndex, nil, {}, true, {
                onListChange = function(Index, Item)
                    Animations.UnBindIndex = Index
                end,

                onSelected = function(Index, Item)
                    for k,v in pairs(Bind) do
                        if v.usable then
                            ESX.ShowNotification("~r~Vous avez supprimé une animations sur la touche : "..Item..".")
                            SetAnimationKvp(Animations.UnBindIndex, false)
                        end
                    end 
                end,
            })
        end)

        RageUI.IsVisible(bindDances, function()
            RageUI.Button("Jouer l'animation", nil, {}, true, {
                onSelected = function()
                    if OnEmotePlay(Animation.Dances[onEmoteName]) then end
                end
            })
            RageUI.Button("Annuler l'animation", nil, {}, true, {
                onSelected = function()
                    if IsInAnimation then
                        EmoteCancel()
                    end
                end
            })
            RageUI.List("Bind sur la touche", {"num 1","num 2", "num 3","num 4","num 5","num 6","num 7","num 8","num 9"}, Animations.BindIndex, nil, {}, true, {
                onListChange = function(Index, Item)
                    Animations.BindIndex = Index
                end,

                onSelected = function(Index, Item)
                    for k,v in pairs(Bind) do
                        if k == Animations.BindIndex then
                            if not v.usable then
                                ESX.ShowNotification("Vous avez bind l'animation : ~b~"..onEmoteName.."~s~ sur la touche : ~b~"..Item.."~s~.")
                                SetAnimationKvp(Animations.BindIndex, {emoteType = onEmoteType, emoteName = onEmoteName})
                            else
                                ESX.ShowNotification("~r~Vous ne pouvez pas bind cette animations car cette touche est déjà prise.")
                            end
                        end
                    end 
                end,
            })
            RageUI.List("Supprimer un bind", {"num 1","num 2", "num 3","num 4","num 5","num 6","num 7","num 8","num 9"}, Animations.UnBindIndex, nil, {}, true, {
                onListChange = function(Index, Item)
                    Animations.UnBindIndex = Index
                end,

                onSelected = function(Index, Item)
                    for k,v in pairs(Bind) do
                        if v.usable then
                            ESX.ShowNotification("~r~Vous avez supprimé une animations sur la touche : "..Item..".")
                            SetAnimationKvp(Animations.UnBindIndex, false)
                        end
                    end 
                end,
            })
        end)

        if not RageUI.Visible(mainMenu) and not RageUI.Visible(expressions) and not RageUI.Visible(bindExpressions)  and not RageUI.Visible(shared) and not RageUI.Visible(bindShared) and not RageUI.Visible(emotes) and not RageUI.Visible(dances) and not RageUI.Visible(objets) and not RageUI.Visible(bindObject) and not RageUI.Visible(bindEmotes) and not RageUI.Visible(bindDances) then
            mainMenu = RMenu:DeleteType("menu", true)
        end
    end
end

RegisterKeyMapping("animation", "Ouvrir le menu des animations", "keyboard", "F2")
RegisterCommand("animation", function()
    AnimationMenu()
end)

function SetAnimationKvp(keys, animationsdata)
    if not animationsdata then
        DeleteResourceKvp(string.format('animBind%s', keys))
    else
        SetResourceKvp(string.format('animBind%s', keys),tostring(animationsdata.emoteType) .. "," .. tostring(animationsdata.emoteName))
    end
    local bindanimation = {}
    local kvpcache = GetResourceKvpString(string.format('animBind%s', keys))
    if kvpcache ~= nil then
        for id in kvpcache:gmatch('([^,]+)') do table.insert(bindanimation, id) end
        if bindanimation[1] and bindanimation[2] then
            Bind[keys] = {usable = true, animation = {bindanimation[1],bindanimation[2], bindanimation[3]}}
        else
            Bind[keys] = {usable = false, animation = false}
        end
    else
        Bind[keys] = {usable = false, animation = false}
    end
end

function SetBindAnimation()
    for numpad = 1, 9 do
        local bindanimation = {}
        local kvpcache = GetResourceKvpString(string.format('animBind%s', numpad))
        if kvpcache ~= nil then
            for id in kvpcache:gmatch('([^,]+)') do table.insert(bindanimation, id) end
            if bindanimation[1] and bindanimation[2] then
                SetAnimationKvp(numpad, {emoteType = bindanimation[1], emoteName = bindanimation[2]})
            elseif bindanimation[1] and bindanimation[2] and bindanimation[3] then
                SetAnimationKvp(numpad, {emoteType = bindanimation[1], emoteName = bindanimation[2]})
            else
                SetAnimationKvp(numpad, false)
            end
        else
            SetAnimationKvp(numpad, false)
        end
        RegisterKeyMapping(string.format('animBind%s', numpad),string.format("Jouer l'animation n°%s", numpad),"keyboard", string.format("NUMPAD%s", numpad))
        RegisterCommand(string.format('animBind%s', numpad), function()
        if GetSelectedPedWeapon(PlayerPedId()) ~= GetHashKey("weapon_musket") then
            if Bind[numpad].usable then
                if not exports.inv:getOpenInventory() then
                    local extractdata = Bind[numpad].animation;
                    local emoteType, emoteName = table.unpack(extractdata)
                    if emoteType == "props" then
                        if OnEmotePlay(Animation.Props[emoteName]) then end
                    elseif emoteType == "emotes" then
                        if OnEmotePlay(Animation.Emotes[emoteName]) then end
                    elseif emoteType == "dances" then
                        if OnEmotePlay(Animation.Dances[emoteName]) then end
                    elseif emoteType == "shared" then
                        target, distance = GetClosestPlayer()
                        if (distance ~= -1 and distance < 3) then
                            TriggerServerEvent("ServerEmoteRequest", GetPlayerServerId(target), onEmoteName)
                        else
                            ESX.ShowNotification("~r~Aucun individu à proximité.")
                        end
                    elseif emoteType == "expressions" then
                        if OnEmotePlay(Animation.Expressions[emoteName]) then end
                    end
                end
            end
        end
        end)
    end
end

SetBindAnimation()