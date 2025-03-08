function Notify(text)
    SendNUIMessage({
        type = "notify",
        notif = text,
    })
end