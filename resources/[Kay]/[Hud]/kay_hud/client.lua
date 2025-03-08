local hunger, thirst = 0, 0
local Framework = nil
local Framework_Obj = nil
local _GetResourceState = GetResourceState

Citizen.CreateThread(function()
  if _GetResourceState('qb-core'):find('start') then
    Framework = 'QB'
    Framework_Obj = exports['qb-core']:GetCoreObject()
    Framework_Obj.IsPlayerLoaded = function()
      return true
    end
  elseif _GetResourceState('frwk'):find('start') then
    Framework = 'ESX'
    Framework_Obj = exports['frwk']:getSharedObject()
  else
    -- put your code here
  end
end)

local getStatus = function()
  if Framework == 'QB' then
    local metadata = Framework_Obj.Functions.GetPlayerData()?.metadata
    if type(metadata) == "table" then
      hunger = metadata.hunger
      thirst = metadata.thirst
    end
  elseif Framework == 'ESX' then
    TriggerEvent('esx_status:getStatus', 'hunger', function(status)
      hunger = status.val / 10000
    end)
    TriggerEvent('esx_status:getStatus', 'thirst', function(status)
      thirst = status.val / 10000
    end)
  else
    -- put your code here
  end
end

Citizen.CreateThread(function()
  while true do
    getStatus()
    SetPedMaxHealth(cache.ped, 200)
    SendNUIMessage({
      stats = Framework_Obj.IsPlayerLoaded(),
      heal = GetEntityHealth(cache.ped) - 100,
      armour = GetPedArmour(cache.ped),
      thirst = thirst,
      food = hunger,
    })
    Wait(1000)
  end
end)