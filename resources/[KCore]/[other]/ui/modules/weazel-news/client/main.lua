RegisterNetEvent("ui:weazelnews:sendMsg", function(msg, time, imgType)
    local fields = {
        text = msg,
        time = time,
        playerName = "slide",
    }

    if imgType == 'gouv' then 
        fields['img'] = "/web/Gouvernement.png"
        fields['job'] = "Gouvernement"
    else
        fields['img'] = "/web/Journaliste.png"
        fields['job'] = "Journaliste"
    end

    SendNuiMessage({
        type = "wzNotif:show",
        data = fields
    })
end)