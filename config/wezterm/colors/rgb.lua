-- RGB color utilities

-- Clamp a number to [min, max]
local function clamp(v, min, max)
  if v < min then return min end
  if v > max then return max end
  return v
end

-- Convert a hex color and alpha to an rgba() string
-- hex: "#RGB" | "#RRGGBB" (case-insensitive)
-- alpha: number in [0,1] (defaults to 1)
local function hex_to_rgba(hex, alpha)
  if type(hex) ~= 'string' then return nil end
  local a = alpha
  if type(a) ~= 'number' then a = 1 end
  a = clamp(a, 0, 1)
  local h = hex:gsub('^#', '')
  if #h == 3 then
    h = h:sub(1,1)..h:sub(1,1) .. h:sub(2,2)..h:sub(2,2) .. h:sub(3,3)..h:sub(3,3)
  elseif #h ~= 6 then
    return nil
  end
  local r = tonumber(h:sub(1,2), 16)
  local g = tonumber(h:sub(3,4), 16)
  local b = tonumber(h:sub(5,6), 16)
  if not (r and g and b) then return nil end
  return string.format("rgba(%d, %d, %d, %s)", r, g, b, tostring(a))
end

return {
  hex_to_rgba = hex_to_rgba,
}


