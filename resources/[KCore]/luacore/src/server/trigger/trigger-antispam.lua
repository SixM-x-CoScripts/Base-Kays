local TriggersList = {
    'kayscore:GetArgent', -- fourgon argent 
    'kayscore:CacaGofast', -- argent gofast
    'kayscore:Givesac',
    'kayscore:GiveItem',
}

local Counter = {}
local debug = false

for k,v in pairs(TriggersList) do
    RegisterServerEvent(v)
    AddEventHandler(v, function(x)
        local color = math.random(1, 9)
        local color2 = math.random(1,9)
        if color == color2 then
            color2 = math.random(1,9)
        end
        if GetPlayerName(source) ~= nil then
            if not Counter[source] then
                Counter[source] = {}
            end
            if debug == true then
                print('^'..color..'[DEBUG] Le joueur : [^'..color2..GetPlayerName(source)..' - ID: '..source..'^'..color..'] a Triggers : [^'..color2.. ''.. v..'^'..color..']')
            end
            if not Counter[source][v] then
                Counter[source][v] = {}
                Counter[source][v] = 1
            else
                Counter[source][v] = Counter[source][v] +1
            end
            if Counter[source][v] >= 8 then
                print('^'..color..'Le joueur : [^'..color2..GetPlayerName(source)..' - ID: '..source..'^'..color..'] a spam le Triggers : [^'..color2.. ''.. v..'^'..color..']')
                if x then
                    --print("FirstArg: ",x)
                end
            end
            if Counter[source][v] >= 15 then
                print('^'..color..'Le joueur : [^'..color2..GetPlayerName(source)..' - ID: '..source..'^'..color..'] a était kick pour spam Triggers  [^'..color2.. ''.. v..'^'..color..']')
                if x then
                    --print("FirstArg: ",x)
                end
                DropPlayer(source,'Vous avez effectuer trop d\'action en peu de temps.')
            end
        end
    end)
end

Citizen.CreateThread(function()
    while true do 
        Wait(11000) -- temp en seconde la c'est 11 seconde
        Counter = {}
    end
end)

