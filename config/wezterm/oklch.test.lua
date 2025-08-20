-- Simple tests for colors.oklch conversions

local lua_version = _VERSION:match('%d+%.%d+')
package.path = string.format('./?.lua;./?/init.lua;./lua_modules/share/lua/%s/?.lua;./lua_modules/share/lua/%s/?/init.lua;', lua_version, lua_version) .. package.path

local colors = require 'colors.oklch'

local function hex_to_rgb(hex)
  local s = hex
  if s:sub(1,1) == '#' then s = s:sub(2) end
  if #s == 3 then
    local r = tonumber(s:sub(1,1) .. s:sub(1,1), 16)
    local g = tonumber(s:sub(2,2) .. s:sub(2,2), 16)
    local b = tonumber(s:sub(3,3) .. s:sub(3,3), 16)
    return r, g, b
  elseif #s == 6 then
    local r = tonumber(s:sub(1,2), 16)
    local g = tonumber(s:sub(3,4), 16)
    local b = tonumber(s:sub(5,6), 16)
    return r, g, b
  end
  return nil
end

local function channel_diff(a, b)
  return math.abs(a - b)
end

local function hex_diff(a, b)
  local ar, ag, ab = hex_to_rgb(a)
  local br, bg, bb = hex_to_rgb(b)
  if not (ar and br) then return math.huge end
  local dr = channel_diff(ar, br)
  local dg = channel_diff(ag, bg)
  local db = channel_diff(ab, bb)
  return math.max(dr, dg, db), dr, dg, db
end

local function assert_true(cond, msg)
  if not cond then error(msg or 'assertion failed', 2) end
end

local function printf(fmt, ...)
  io.write(string.format(fmt, ...))
end

local failures = 0

-- 1) Round-trip tests on a set of sRGB hex inputs
local samples = {
  '#000000', '#FFFFFF', '#FF0000', '#00FF00', '#0000FF',
  '#808080', '#F2CAC9', '#EDE4CD', '#BBDBF3', '#5654A2', '#BADCAD',
}

printf('Round-trip tests (hex -> OKLCH -> hex):\n')
for _, hex in ipairs(samples) do
  local lch = colors.hex_to_oklch(hex)
  local back = colors.oklch_to_hex(lch)
  local md, dr, dg, db = hex_diff(hex, back)
  local ok = md <= 1
  printf('  %-8s -> %-8s  maxΔ=%d (Δr=%d, Δg=%d, Δb=%d)  %s\n', hex, back, md, dr, dg, db, ok and 'OK' or 'FAIL')
  if not ok then failures = failures + 1 end
end

-- 2) Gamut fallback tests: request very high chroma and ensure we still get valid hex
printf('\nGamut fallback tests (high chroma requests):\n')
local hues = { 0, 60, 120, 180, 240, 300 }
for _, h in ipairs(hues) do
  local req = { l = 0.7, c = 0.5, h = h }
  local hex = colors.oklch_to_hex(req)
  local ok = type(hex) == 'string' and hex:match('^#%x%x%x%x%x%x$') ~= nil
  printf('  L=%.2f C=%.2f H=%3d -> %s  %s\n', req.l, req.c, h, tostring(hex), ok and 'OK' or 'FAIL')
  if not ok then failures = failures + 1 end
end

-- 3) Stability after fallback: hex -> oklch -> hex should be stable
printf('\nStability after fallback (round-trip from fallback hex):\n')
for _, h in ipairs(hues) do
  local req = { l = 0.7, c = 0.6, h = h }
  local hex1 = colors.oklch_to_hex(req)
  local lch1 = colors.hex_to_oklch(hex1)
  local hex2 = colors.oklch_to_hex(lch1)
  local md = hex_diff(hex1, hex2)
  local ok = md <= 1
  printf('  H=%3d  %s -> %s  maxΔ=%d  %s\n', h, hex1, hex2, md, ok and 'OK' or 'FAIL')
  if not ok then failures = failures + 1 end
end

printf('\nSummary: %s\n', failures == 0 and 'ALL TESTS PASSED' or (failures .. ' failure(s)'))
os.exit(failures == 0 and 0 or 1)


