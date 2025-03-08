while not ESXLoaded do Wait(1)

end

boost_farm = {
    active = {
        UniqueID = ESX.GetPlayerData().UniqueID,
        boost = 0,
        time = 0,
        multiplication = 0,
    }
}

RegisterNetEvent('kayscore:boutique:boost:load', function(data)
    boost_farm.active = data

    InfoPlayer.boost = data.boost
end)

function boost_farm.boostFarm()
    return boost_farm.active.boost
end

function boost_farm.have()
    local r = false 

    if boost_farm.active.boost > 0 then
        r = true
    else
        r = false
    end

    return r
end