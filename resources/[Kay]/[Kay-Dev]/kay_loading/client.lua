local checkState = false
AddEventHandler("playerSpawned", function ()
    if not checkState then
        ShutdownLoadingScreenNui()
        checkState = true
    end
end)

-- RegisterCommand("loading", function()
--     ShutdownLoadingScreenNui()
-- end)
