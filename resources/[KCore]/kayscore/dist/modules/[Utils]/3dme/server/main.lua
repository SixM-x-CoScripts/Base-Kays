--[[
  This file is part of Slide RolePlay.
  Copyright (c) Slide RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local lang = Languages[dmeC.language]

local function onMeCommand(source, args)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source) 
    local text = "* " .. lang.prefix .. table.concat(args, " ") .. " *"
    if (string.find(text, "<img src")) then
       DropPlayer(source, 'usebug me image');
      return
    end
    if (string.find(text, "discord")) then
      DropPlayer(source, 'usebug me');
    return
  end
  if (string.find(text, "tiktok")) then
    DropPlayer(source, 'usebug me');
  return
end
    TriggerClientEvent('3dme:shareDisplay', -1, text, source)
end

local function onMeCommand2(source, args)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local text = "* " .. lang.prefix .. ""..args .. " *"
    if (string.find(text, "<img src")) then
        DropPlayer(source, 'usebug me image');
      return
    end
    if (string.find(text, "discord")) then
      DropPlayer(source, 'usebug me');
    return
  end
  if (string.find(text, "tiktok")) then
    DropPlayer(source, 'usebug me');
  return
end
    TriggerClientEvent('3dme:shareDisplay', -1, text, source)
end

RegisterCommand(lang.commandName, onMeCommand)