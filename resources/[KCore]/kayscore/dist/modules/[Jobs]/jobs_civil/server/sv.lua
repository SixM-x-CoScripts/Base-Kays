local jobTimeouts = {}

RegisterServerEvent('jobs_civil:chantierReward')
AddEventHandler('jobs_civil:chantierReward', function()
    local _source = source
    if jobTimeouts[_source] and jobTimeouts[_source] > os.time() then
        DropPlayer(_source, "Trigger Job Farm...")
        return
    end
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer then
        local amount = math.random(10, 25)
        local expectedAmount = 25
            xPlayer.addAccountMoney('cash', amount)
            TriggerClientEvent('esx:showNotification', _source, ('💼 Vous avez gagné %s$ pour votre travail.'):format(amount))
            sendLog(('Le Player (%s - %s) a Gagné (%s- %s)'):format(xPlayer.name, xPlayer.UniqueID, 'cash', amount), {
                author = 'Jobs Civil',
                fields = {
                    {title = 'Player', subtitle = xPlayer.name},
                    {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                    {title = 'Identifier', subtitle = xPlayer.identifier},
                    {title = "Gain", subtitle = amount},
                },
                channel = 'JobsCivil'
            })
        jobTimeouts[_source] = os.time() + 10
    end
end)