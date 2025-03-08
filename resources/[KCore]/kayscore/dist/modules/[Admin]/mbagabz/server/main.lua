CreateThread(function()
    GlobalState.mba = ConfigMBA.Default
end)

-- RegisterCommand('setmba', function(source, args)
--         local mba = args[1]

--         if not mba or not ConfigMBA.Sets[mba] then return end

--         GlobalState.mba = mba
-- end, false)