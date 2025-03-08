VIP = {
    data = {
        have = false,
        time = 0,
    },
    haveVip = function()
        return VIP.data.have
    end,

    entity = {
        sorted = false,
        entityid = nil,
        sitting = false,
        nameActive = false,
        name = {},
        followMe = false,
    },

    animals = {
        {label = 'Husky | chien loup', entityName = 'a_c_husky'}
    }
}

secured_RegisterNetEvent('kayscore:vip:refreshData', function(v)
    VIP.data = {}
    VIP.data = v

    ESX.ShowNotification(('Information VIP~s~\n\nVotre '..kayscoreConfigServ.GTACOLOR..'VIP~s~ prendra fin dans '..kayscoreConfigServ.GTACOLOR..'%s~s~ heure(s)'):format(VIP.data.time))
end)

secured_RegisterNetEvent('kayscore:vip:animals:sort', function(coords, entityName)
    if VIP.entity.sorted == true then return ESX.ShowNotification('🐕 Vous avez déjà un animal de sorti') end

    local ee = GetHashKey(entityName)
    ESX.Game.SpawnPed(1, entityName, vector3(coords.x, coords.y, coords.z), 90.0, function(ped)
            
        -- Entity(ped).state.entityId = ped

        VIP.entity.entityid = ped

        VIP.entity.sorted = true

        ESX.ShowNotification('🐕 Animal sorti avec succès')
    end)
end)

RegisterNetEvent('kayscore:vip:animals:remove', function()
    CreateThread(function()
        if DoesEntityExist(VIP.entity.entityid) then
            DeleteEntity(VIP.entity.entityid)
        end

        VIP.entity.name[VIP.entity.entityid] = nil
        VIP.entity.sorted = false
        VIP.entity.entityId = nil
    end)

    ESX.ShowNotification('🐕 Animal rentré avec succès')
end)

local aTag = {}

secured_RegisterNetEvent('kayscore:animals:setName', function(entityId, name)
    CreateThread(function()
        VIP.entity.name[entityId] = {
            entityId = entityId,
            name = name,
            coords = GetEntityCoords(entityId)
        }
    end)
end)

Citizen.CreateThread(function()
    local interval = 2000
    while true do
        Wait(interval)
        interval = 2000

        for k,v in pairs(VIP.entity.name) do
            if DoesEntityExist(v.entityId) then
                dist = #(GetEntityCoords(PlayerPedId())-GetEntityCoords(v.entityId))
                if dist > 2 then goto continue end
            else
                break
            end
        
            interval = 1
    
            aTag[v.entityId] = CreateFakeMpGamerTag(v.entityId, ('%s | %s'):format('Animal', v.name), true, false, 'NPC', 1)
            SetMpGamerTagName(aTag[v.entityId], ('%s | %s'):format('Animal', v.name))
            SetMpGamerTagColour(aTag[v.entityId], 0, 34)
            SetMpGamerTagVisibility(aTag[v.entityId], 14, true)
            SetMpGamerTagColour(aTag[v.entityId], 14, 34)
            SetMpGamerTagAlpha(aTag[v.entityId], 14, 255)
            SetMpGamerTagHealthBarColor(aTag[v.entityId], 34)

            if dist > 2 then
                RemoveMpGamerTag(aTag[v.entityId])
            end
    
            if not DoesEntityExist(v.entityId) then
                RemoveMpGamerTag(aTag[v.entityId])
            end
    
            if not VIP.entity.name[k] then
                RemoveMpGamerTag(aTag[v.entityId])
            end
        end

        ::continue::
    end
end)

secured_RegisterNetEvent('kayscore:vip:animals:editName', function(entityId, newName)
    VIP.entity.name[entityId].name = newName
end)

secured_RegisterNetEvent('kayscore:vip:animals:removeName', function(entityID)
    VIP.entity.name[entityID] = nil
    RemoveMpGamerTag(aTag[entityID])
end)

RegisterNetEvent('kayscore:vip:animals:followMe', function()
    VIP.entity.followMe = true

    local entityToFollow = VIP.entity.entityid
    local speed = 4.0  
    
    while VIP.entity.followMe and DoesEntityExist(entityToFollow) do
        Wait(0)

        local playerPed = PlayerPedId()
        local playerPos = GetEntityCoords(playerPed)

        local entityPos = GetEntityCoords(entityToFollow)
        local distance = #(playerPos - entityPos)
        
        if distance > 5 then
            TaskFollowToOffsetOfEntity(entityToFollow, playerPed, 0.0, 0.0, 0.0, speed, -1, 2.0, true) 
        end

        if not VIP.entity.followMe then
            break
        end

        if not DoesEntityExist(entityToFollow) then
            break
        end
    end
end)



AddEventHandler('onResourceStop', function(rName)
    if GetCurrentResourceName() ~= rName then return end

    if VIP.entity.entityid ~= nil then
        if DoesEntityExist(Entity(VIP.entity.entityid).state.entityId) then
            DeleteEntity(Entity(VIP.entity.entityid).state.entityId)
        end
    end
end)

secured_RegisterNetEvent('kayscore:en:sertcoords', function(ped, coords)
    SetEntityCoords(ped, coords)
end)