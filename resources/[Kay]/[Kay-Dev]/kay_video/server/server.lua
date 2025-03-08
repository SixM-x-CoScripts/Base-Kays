RegisterServerEvent('youtube:syncVideo')
AddEventHandler('youtube:syncVideo', function(videoId, mode)
    TriggerClientEvent('youtube:playVideo', -1, videoId, mode)
end)
