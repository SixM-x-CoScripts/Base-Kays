CreateThread(function()
    RegisterNetEvent('kayscore:preferences:recieve', function(tableau)
        for k,v in pairs(tableau) do
            if Config.Personalmenu.preferences[v.name] then
                Config.Personalmenu.preferences[v.name].active = v.active
    
                if Config.Personalmenu.preferences[v.name].type == 'checkbox' then
                    Config.Personalmenu.preferences[v.name].action(v.active)
                end
            end
        end
    end)
end)