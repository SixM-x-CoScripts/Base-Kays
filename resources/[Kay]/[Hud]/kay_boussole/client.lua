-- BY LEE TA CHANG & IMPOSTEUR DISCORD.GG/CHINALEAK

local lastHeading = -1
local lastStreetName = ""
local compassEnabled = true
local streetNameEnabled = true

RegisterCommand("boussole-off", function()
    SendNUIMessage({type = "hideCompass"})
    compassEnabled = false
end, false)

RegisterCommand("boussole-on", function()
    SendNUIMessage({type = "showCompass"})
    compassEnabled = true
end, false)

RegisterCommand("rue-off", function()
    SendNUIMessage({type = "hideStreetName"})
    streetNameEnabled = false
end, false)

RegisterCommand("rue-on", function()
    SendNUIMessage({type = "showStreetName"})
    streetNameEnabled = true
end, false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if compassEnabled then
            local camRot = GetGameplayCamRot(2)
            local heading = math.floor(360.0 - ((camRot.z + 360.0) % 360.0))
            
            if heading ~= lastHeading then
                SendNUIMessage({
                    type = "updateCompass",
                    heading = heading
                })
                lastHeading = heading
            end
        else
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if streetNameEnabled then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            
            local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(pos.x, pos.y, pos.z))
            
            if streetName ~= lastStreetName then
                SendNUIMessage({
                    type = "updateStreetName",
                    streetName = streetName
                })
                lastStreetName = streetName
            end
        else
            Citizen.Wait(1000)
        end
    end
end)