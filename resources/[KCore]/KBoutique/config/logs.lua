Webhooks = {}
Webhooks = {
    vehicle = "#",
    item = "#",
    weapon = "#",
    money = "#",
    coins = "#",
    selling = "#",
    lootbox = "#",
    givepoint = "#",
}

function SendToDiscord(type, name, message, color)
    local discordweb = Webhooks[type]
    if discordweb ~= "" then
        local connect = {
            {
                ["color"] = "16769280", 
                ["title"] = "**".. name .."**",
                ["description"] = message,
                ["footer"] = {["text"] = "kayscore"},
            },
        }
        PerformHttpRequest(discordweb, function(err, text, headers) end, 'POST', json.encode({username = "BoutiqueV4", embeds = connect}), { ['Content-Type'] = 'application/json' })
    else
        print("------------------------------------------\nLe webhook " .. type .. " n'est pas configuré.\n------------------------------------------")
    end
end
