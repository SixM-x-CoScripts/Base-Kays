
local AnimationDuration = -1
local ChosenAnimation = ""
local ChosenDict = ""
IsInAnimation = false
local MostRecentChosenAnimation = ""
local MostRecentChosenDict = ""
local MovementType = 0
local PlayerGender = "male"
local PlayerHasProp = false
local PlayerProps = {}
local PlayerParticles = {}
local SecondPropEmote = false
local PtfxNotif = false
local PtfxPrompt = false
local PtfxWait = 500
local PtfxNoProp = false

Citizen.CreateThread(function()
    while true do

        if IsPedShooting(PlayerPedId()) and IsInAnimation then
            EmoteCancel()
        end

        if PtfxPrompt then
            if not PtfxNotif then
                ESX.ShowNotification(PtfxInfo)
                PtfxNotif = true
            end
            if IsControlPressed(0, 47) then
                PtfxStart()
                Wait(PtfxWait)
                PtfxStop()
            end
        end

        if IsControlPressed(0, 73) and IsInAnimation then 
            EmoteCancel() 
        end
        Citizen.Wait(1)
    end
end)

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

RegisterCommand('e', function(source, args) 
    EmoteCommandStart(source, args) 
end)

RegisterCommand('emote', function(source, args) 
    EmoteCommandStart(source, args) 
end)

function EmoteCommandStart(source, args)
    if #args > 0 then
        local name = string.lower(args[1])
        if name == "c" then
            if IsInAnimation then
                EmoteCancel()
            else
                ESX.ShowNotification("~r~Vous ne pouvez pas annuler une animation.")
            end
            return
        end
        if Animation.Dances[name] ~= nil then
            if OnEmotePlay(Animation.Dances[name]) then end
            return
        elseif Animation.Props[name] ~= nil then
            if OnEmotePlay(Animation.Props[name]) then end
            return
        elseif Animation.Emotes[name] ~= nil then
            if OnEmotePlay(Animation.Emotes[name]) then end
            return
        elseif Animation.Expressions[name] ~= nil then
            if OnEmotePlay(Animation.Expressions[name]) then end
            return
        else
            return ESX.ShowNotification("~r~L'animation renseigné n'est pas valide.")
        end
    else
        return ESX.ShowNotification("~r~Merci de mettre une animation.")
    end
end

function LoadAnim(dict)
    while not HasAnimDictLoaded(dict) do
      RequestAnimDict(dict)
      Wait(10)
    end
end
  
function LoadPropDict(model)
    while not HasModelLoaded(GetHashKey(model)) do
      RequestModel(GetHashKey(model))
      Wait(10)
    end
end
  
function PtfxThis(asset)
    while not HasNamedPtfxAssetLoaded(asset) do
      RequestNamedPtfxAsset(asset)
      Wait(10)
    end
    UseParticleFxAssetNextCall(asset)
end

function DestroyAllProps()
    for _,v in pairs(PlayerProps) do
      DeleteEntity(v)
    end
    PlayerHasProp = false
end

function EmoteCancel()
    if ChosenDict == "MaleScenario" and IsInAnimation then
        ClearPedTasksImmediately(PlayerPedId())
        IsInAnimation = false
    elseif ChosenDict == "Scenario" and IsInAnimation then
        ClearPedTasksImmediately(PlayerPedId())
        IsInAnimation = false
    end
  
    PtfxNotif = false
    PtfxPrompt = false
  
    if IsInAnimation then
        PtfxStop()
        ClearPedTasks(PlayerPedId())
        DestroyAllProps()
        IsInAnimation = false
    end
end

function PtfxStart()
    if PtfxNoProp then
        PtfxAt = PlayerPedId()
    else
        PtfxAt = prop
    end
    UseParticleFxAssetNextCall(PtfxAsset)
    Ptfx = StartNetworkedParticleFxLoopedOnEntityBone(PtfxName, PtfxAt, Ptfx1, Ptfx2, Ptfx3, Ptfx4, Ptfx5, Ptfx6, GetEntityBoneIndexByName(PtfxName, "VFX"), 1065353216, 0, 0, 0, 1065353216, 1065353216, 1065353216, 0)
    SetParticleFxLoopedColour(Ptfx, 1.0, 1.0, 1.0)
    table.insert(PlayerParticles, Ptfx)
end

function PtfxStop()
    for k,v in pairs(PlayerParticles) do
        StopParticleFxLooped(v, false)
        table.remove(PlayerParticles, k)
    end
end

function pairsByKeys(t, f)
    local table = {}
    for v in pairs(t) do
        table.insert(table, v)
    end
    table.sort(table, f)
    local i = 0
    local iter = function ()
        i = i + 1
        if table[i] == nil then
            return nil
        else
            return table[i], t[table[i]]
        end
    end
    return iter
end

function AddPropToPlayer(prop1, bone, off1, off2, off3, rot1, rot2, rot3)
    local Player = PlayerPedId()
    local x,y,z = table.unpack(GetEntityCoords(Player))
  
    if not HasModelLoaded(prop1) then
      LoadPropDict(prop1)
    end
  
    prop = CreateObject(GetHashKey(prop1), x, y, z+0.2,  true,  true, true)
    AttachEntityToEntity(prop, Player, GetPedBoneIndex(Player, bone), off1, off2, off3, rot1, rot2, rot3, true, true, false, true, 1, true)
    table.insert(PlayerProps, prop)
    PlayerHasProp = true
    SetModelAsNoLongerNeeded(prop1)
end

function CheckGender()
    local hashSkinMale = GetHashKey("mp_m_freemode_01")
    local hashSkinFemale = GetHashKey("mp_f_freemode_01")
  
    if GetEntityModel(PlayerPedId()) == hashSkinMale then
       PlayerGender = "male"
    elseif GetEntityModel(PlayerPedId()) == hashSkinFemale then
       PlayerGender = "female"
    end
end

function OnEmotePlay(EmoteName)

    InVehicle = IsPedInAnyVehicle(PlayerPedId(), true)
    if InVehicle == 1 then
       return
    end
  
    if not DoesEntityExist(PlayerPedId()) then
       return false
    end
  
    ChosenDict,ChosenAnimation,ename = table.unpack(EmoteName)
    AnimationDuration = -1
  
    if PlayerHasProp then
      DestroyAllProps()
    end
  
    if ChosenDict == "Expression" then
      SetFacialIdleAnimOverride(PlayerPedId(), ChosenAnimation, 0)
      return
    end
  
    if ChosenDict == "MaleScenario" or "Scenario" then 
        CheckGender()
        if ChosenDict == "MaleScenario" then if InVehicle then return end
            if PlayerGender == "male" then
                ClearPedTasks(PlayerPedId())
                TaskStartScenarioInPlace(PlayerPedId(), ChosenAnimation, 0, true)
                IsInAnimation = true
            else
                ESX.ShowNotification("~r~Cette animation n'est pas disponible pour les femmes.")
            end 
            return
        elseif ChosenDict == "ScenarioObject" then 
            if InVehicle then 
                return 
            end
            BehindPlayer = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0 - 0.5, -0.5);
            ClearPedTasks(PlayerPedId())
            TaskStartScenarioAtPosition(PlayerPedId(), ChosenAnimation, BehindPlayer['x'], BehindPlayer['y'], BehindPlayer['z'], GetEntityHeading(PlayerPedId()), 0, 1, false)
            IsInAnimation = true
            return
        elseif ChosenDict == "Scenario" then 
            if InVehicle then 
                return 
            end
            ClearPedTasks(PlayerPedId())
            TaskStartScenarioInPlace(PlayerPedId(), ChosenAnimation, 0, true)
            IsInAnimation = true
            return 
        end 
    end
  
    LoadAnim(ChosenDict)
  
    if EmoteName.AnimationOptions then
        if EmoteName.AnimationOptions.EmoteLoop then
            MovementType = 1
            if EmoteName.AnimationOptions.EmoteMoving then
                MovementType = 51
            end
        elseif EmoteName.AnimationOptions.EmoteMoving then
            MovementType = 51
        elseif EmoteName.AnimationOptions.EmoteMoving == false then
            MovementType = 0
        elseif EmoteName.AnimationOptions.EmoteStuck then
            MovementType = 50
        end
    else
        MovementType = 0
    end
  
    if InVehicle == 1 then
        MovementType = 51
    end
  
    if EmoteName.AnimationOptions then
        if EmoteName.AnimationOptions.EmoteDuration == nil then 
            EmoteName.AnimationOptions.EmoteDuration = -1
            AttachWait = 0
        else
            AnimationDuration = EmoteName.AnimationOptions.EmoteDuration
            AttachWait = EmoteName.AnimationOptions.EmoteDuration
        end
  
        if EmoteName.AnimationOptions.PtfxAsset then
            PtfxAsset = EmoteName.AnimationOptions.PtfxAsset
            PtfxName = EmoteName.AnimationOptions.PtfxName
            if EmoteName.AnimationOptions.PtfxNoProp then
                PtfxNoProp = EmoteName.AnimationOptions.PtfxNoProp
            else
                PtfxNoProp = false
            end
            Ptfx1, Ptfx2, Ptfx3, Ptfx4, Ptfx5, Ptfx6, PtfxScale = table.unpack(EmoteName.AnimationOptions.PtfxPlacement)
            PtfxInfo = EmoteName.AnimationOptions.PtfxInfo
            PtfxWait = EmoteName.AnimationOptions.PtfxWait
            PtfxNotif = false
            PtfxPrompt = true
            PtfxThis(PtfxAsset)
        else
            PtfxPrompt = false
        end
    end
  
    TaskPlayAnim(PlayerPedId(), ChosenDict, ChosenAnimation, 2.0, 2.0, AnimationDuration, MovementType, 0, false, false, false)
    RemoveAnimDict(ChosenDict)
    IsInAnimation = true
    MostRecentDict = ChosenDict
    MostRecentAnimation = ChosenAnimation
  
    if EmoteName.AnimationOptions then
        if EmoteName.AnimationOptions.Prop then
            PropName = EmoteName.AnimationOptions.Prop
            PropBone = EmoteName.AnimationOptions.PropBone
            PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 = table.unpack(EmoteName.AnimationOptions.PropPlacement)
            if EmoteName.AnimationOptions.SecondProp then
                SecondPropName = EmoteName.AnimationOptions.SecondProp
                SecondPropBone = EmoteName.AnimationOptions.SecondPropBone
                SecondPropPl1, SecondPropPl2, SecondPropPl3, SecondPropPl4, SecondPropPl5, SecondPropPl6 = table.unpack(EmoteName.AnimationOptions.SecondPropPlacement)
                SecondPropEmote = true
            else
                SecondPropEmote = false
            end
            Wait(AttachWait)
            AddPropToPlayer(PropName, PropBone, PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6)
            if SecondPropEmote then
                AddPropToPlayer(SecondPropName, SecondPropBone, SecondPropPl1, SecondPropPl2, SecondPropPl3, SecondPropPl4, SecondPropPl5, SecondPropPl6)
            end
        end
    end
    return true
end

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        DestroyAllProps()
        ClearPedTasksImmediately(PlayerPedId())
        ResetPedMovementClipset(PlayerPedId())
    end
end)

function EmoteMenuStart(name, emoteType)
    if emoteType == "dances" then
        if Animation.Dances[name] ~= nil then
            if OnEmotePlay(Animation.Dances[name]) then end
        end
    elseif emoteType == "props" then
        if Animation.Props[name] ~= nil then
            if OnEmotePlay(Animation.Props[name]) then end
        end
    elseif emoteType == "emotes" then
        if Animation.Emotes[name] ~= nil then
            if OnEmotePlay(Animation.Emotes[name]) then end
        end
    elseif emoteType == "expression" then
        if Animation.Expressions[name] ~= nil then
            if OnEmotePlay(Animation.Expressions[name]) then end
        end
    end
end