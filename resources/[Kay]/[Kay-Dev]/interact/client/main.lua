local display = false

local result

RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)


RegisterNUICallback("sendInformation", function(data)
	result = data
	SetDisplay(false) 
end)

RegisterNUICallback("main", function(data)
    SetDisplay(false)
end)

exports("uiInput", function(data)
	SetDisplay(not display, data)
 
	while display do 
		Wait(0)
		if result ~= nil then
			local BeforeResult = result
			result = nil
			return BeforeResult
		end
	end 
end)

function uiInput(data)    
	SetDisplay(not display, data)
 
	while display do 
		Wait(0)
		if result ~= nil then
			local BeforeResult = result
			result = nil
			return BeforeResult
		end
	end 
end


function SetDisplay(bool, information)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
		data = information
    })
end
