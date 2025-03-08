
local remooveinventaire = "https://discord.com/api/webhooks/1134476176920944701/lEVFQDgK1hSWu_qKWyQfOgM36YeErBxR8cOYd9inb_1qHfu1Yv06yyuPSQxhy11AuJoq"
local giveinventaire = "https://discord.com/api/webhooks/1134478188131659877/OAPIc14oiPWVTchoDfimw2ilYEW-av_yKBRyUA1HPlbBvpaeWID4CqA3zhyb6x7w71Ht"


RegisterServerEvent('wGunFight:LogJoueur')
AddEventHandler('wGunFight:LogJoueur', function(content)
    PerformHttpRequest(remooveinventaire, function(err, text, headers) end, 'POST', json.encode({username = "Menu Admin", embeds = content}), { ['Content-Type'] = 'application/json' })
end) 

RegisterServerEvent('wGunFight:LogJoueur2')
AddEventHandler('wGunFight:LogJoueur2', function(content)
    PerformHttpRequest(giveinventaire, function(err, text, headers) end, 'POST', json.encode({username = "Menu Admin", embeds = content}), { ['Content-Type'] = 'application/json' })
end) 