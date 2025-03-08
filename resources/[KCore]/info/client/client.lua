RegisterNetEvent('SHOW_NOTIFTOP')
AddEventHandler('SHOW_NOTIFTOP', function(show, text, icon, bordercolor)
    if show then
        SendReactMessage('SHOW_DRAWTOPNOTIF', { show = true, text = text, icon = icon, bordercolor = bordercolor })
    else
        SendReactMessage('SHOW_DRAWTOPNOTIF', { show = false, text = text, icon = icon , bordercolor = bordercolor })
    end
end)

