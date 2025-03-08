ESX = nil
ESXLoaded = false
fiveguardbans = true
TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
    ESXLoaded = true
end)

RegisterNetEvent("arahkayscore")
AddEventHandler("arahkayscore", function(script)
    local _source = tonumber(source)
    if not fiveguardbans then
        DropPlayer(_source, "Tried to Overflow statebags")
    else
        print(script .. ' : Ban Player for Car and Props Spawn')
        DropPlayer(_source,"Spawn Entity (Car, props...)")
    end
end)

AddEventHandler('explosionEvent', function(sender, ev)
    print(GetPlayerName(sender), json.encode(ev))
    if ev.ownerNetId == 0 then
        CancelEvent()
    end
    if ev.posX == 0.0 and ev.posY == 0.0 then
        CancelEvent()
    end
end)