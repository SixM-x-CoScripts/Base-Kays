function showBox(TextEntry, ExampleText, MaxStringLenght, isValueInt)

    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        blockinput = false
        if isValueInt then
            local isNumber = tonumber(result)
            if isNumber then return result else return nil end
        end

        TextEntry = nil
        ExampleText = nil

        return result
    else
        Citizen.Wait(500)
        blockinput = false
        TextEntry = nil
        ExampleText = nil
        return nil
    end
end

