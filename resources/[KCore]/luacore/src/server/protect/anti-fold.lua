--[[AddEventHandler('weaponDamageEvent', function(sender, data)
    local source = source
    if data.silenced and data.weaponDamage == 0 and data.weaponType == 2725352035 then
        DropPlayer(source, "Skript fold option (Edging) (1)")
    end
    if data.silenced and data.weaponDamage == 0 and data.weaponType == 3452007600 then
        DropPlayer(source, "Skript fold option (Edging) (2)")
    end
    if not data.silenced and data.weaponDamage == 131071 and data.weaponType == 1834887169 then
        DropPlayer(source, "Skript fold option (Edging) (3)")
	end
end)]]--