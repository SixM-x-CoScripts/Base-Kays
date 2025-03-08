
Map = {

        {name="Magasin de tatouage",color= 48, id=75,ZoneBlip = false, Position = vector3(1322.64, -1651.97, 52.27)},
        {name="Magasin de tatouage",color= 48, id=75,ZoneBlip = false, Position = vector3(-1153.67, -1425.6, 4.95)},
        {name="Magasin de tatouage",color= 48, id=75,ZoneBlip = false, Position = vector3(322.13, 180.46, 103.58)},
        {name="Magasin de tatouage",color= 48, id=75,ZoneBlip = false, Position = vector3(-3170.07, 1075.05, 20.82)},
        {name="Magasin de tatouage",color= 48, id=75,ZoneBlip = false, Position = vector3(1864.63, 3747.73, 33.03)},
        {name="Magasin de tatouage",color= 48, id=75,ZoneBlip = false, Position = vector3(-332.7154, 7187.9116, 6.4778)},
        {name="Magasin de tatouage",color= 48, id=75,ZoneBlip = false, Position = vector3(-293.71, 6200.04, 31.48)},



    }

    
    Citizen.CreateThread(function()
        for k,v in pairs(Map) do
            local blip = AddBlipForCoord(v.Position) 
            SetBlipSprite (blip, v.id)
            SetBlipDisplay(blip, 6)
            SetBlipScale  (blip, 0.55)
            SetBlipColour (blip, v.color)
            SetBlipAsShortRange(blip, true)
              BeginTextCommandSetBlipName("STRING") 
              AddTextComponentString(v.name)
            EndTextCommandSetBlipName(blip)
            if v.ZoneBlip then
                local zoneblip = AddBlipForRadius(v.Position, 800.0)
            SetBlipSprite(zoneblip,1)
            SetBlipColour(zoneblip, v.color)
            SetBlipAlpha(zoneblip,100)
            end
        end
    end)