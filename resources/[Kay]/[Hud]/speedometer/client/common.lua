FEencode = function(data)
  if type(data) ~= 'table' then return data end

  local _t = {}
  for a, b in pairs(data) do
    if type(a) == 'number' then
      _t['*' .. tostring(a)] = FEencode(b)
    else
      _t[a] = FEencode(b)
    end
  end

  return _t
end

SendReactMessageFE = function(action, data)
  SendNUIMessage({
      action = action,
      data = FEencode(data),
      fe = true,
  })
end

SendReactMessage = function(action, data)
    SendNUIMessage({
        action = action,
        data = data,
    })
end

AddEventHandler('fb_ui:SendReactMessage', function(action, data)
  SendReactMessage(action, data)
end)

GetMinimapAnchor = function()
    local safezone = GetSafeZoneSize()
    local safezone_x = 1.0 / 20.0
    local safezone_y = 1.0 / 20.0
    local aspect_ratio = GetAspectRatio(0)
    local res_x, res_y = GetActiveScreenResolution()

    local xscale = 1.0 / res_x
    local yscale = 1.0 / res_y
    local Minimap = {}
    Minimap.width = xscale * (res_x / (4 * aspect_ratio))
    Minimap.height = yscale * (res_y / 5.674)
    Minimap.left_x = (xscale * (res_x * (safezone_x * ((math.abs(safezone - 1.0)) * 10))))
    Minimap.bottom_y = 1.0 - yscale * (res_y * (safezone_y * ((math.abs(safezone - 1.0)) * 10)))
    Minimap.right_x = Minimap.left_x + Minimap.width
    Minimap.top_y = Minimap.bottom_y - Minimap.height
    Minimap.x = Minimap.left_x
    Minimap.y = Minimap.top_y
    Minimap.xunit = xscale
    Minimap.yunit = yscale
    return Minimap
end

math.lerp = function(a, b, perc)
	return a * (1 - perc) + b * perc
end