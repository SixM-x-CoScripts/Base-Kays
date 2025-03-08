CreateThread(function()
    function adminManagement:setLogsType(type, title, dsc, author, webhooks, imgactive, img, func)

        if type == nil or title == nil or dsc == nil or author == nil or webhooks == nil or imgactive == nil then goto continue end

        local setLogs = {
            {
                ["color"] = '5897984',

                ['author'] = {
                    ['name'] = author,
                    ['icon_url'] = 'https://cdn.discordapp.com/attachments/1194740715377414247/1200545338570846258/STAFF.png?ex=65c691f9&is=65b41cf9&hm=4dd9ab005f843b161f36e7738012fc980d93bae2540989cb2afd5199c8ffe97c&'
                },
    
                ['title'] = title,
    
                ['description'] = dsc,
    
                ["footer"] = {
    
                    ["text"] = os.date("%x %X %p"),
    
                },
            }
        }

        PerformHttpRequest(webhooks , function(err, text, headers) end, 'POST', json.encode({username = name, embeds = setLogs}), { ['Content-Type'] = 'application/json' })
    
        ::continue::
    end
end)

ESX.RegisterServerCallback('screenshot:getwebhook', function(source, cb)
    cb('https:webhooks/1233816353677377566/f0hm3B3Ood1uAvtl6_PDbiwBurOq8UZSfLKvifftGAUPkOtSKYo8UmEYDEti5EdqXRhq')
end)

secured_RegisterNetEvent('kayscore:admin:sendLogsScreen', function(uniquesource, licensesource, img, sourceName)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local plyplayer = ESX.GetPlayerFromId(uniquesource)
    local content = {

        {

            ["color"] = '3447003', --rosso

            ["image"] = {
                ["url"] = img.attachments[1].url,
            },

            ['author'] = {
                ['name'] = "AdminMenu",
                ['icon_url'] = ''
            },

            ['thumbnail'] = {
                ['icon_url'] = ''
            },

            ["title"] = ("Screenshot par (%s)"):format(sourceName),

            ["description"] = ('Screen de l\'écran du joueur: **%s**\nID : **%s**\nUniqueID : **%s**\nLicence : **%s**\nGroup : **%s**'):format(plyplayer.name, uniquesource, plyplayer.UniqueID, plyplayer.identifier, plyplayer.group == 'user' and 'Joueur' or plyplayer.group),

            ["footer"] = {

                ["text"] = "© % - LOGS - "..os.date("%x %X %p"),

            },

        }

    }

    PerformHttpRequest('https:webhooks/1233816353677377566/f0hm3B3Ood1uAvtl6_PDbiwBurOq8UZSfLKvifftGAUPkOtSKYo8UmEYDEti5EdqXRhq' , function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })
end)