-- OKLCH <-> Hex conversion utilities with sRGB gamut fallback
-- Exports:
--   hex_to_oklch(hex: string) -> { l, c, h }
--   oklch_to_hex(lch_or_L[, C, Hdeg]) -> "#RRGGBB"

local sqrt = math.sqrt
local cos = math.cos
local sin = math.sin
local atan2 = math.atan2 or function(y, x)
  if x > 0 then return math.atan(y / x) end
  if x < 0 and y >= 0 then return math.atan(y / x) + math.pi end
  if x < 0 and y < 0 then return math.atan(y / x) - math.pi end
  if x == 0 and y > 0 then return math.pi / 2 end
  if x == 0 and y < 0 then return -math.pi / 2 end
  return 0
end
local pi = math.pi

local function cbrt(x)
  if x >= 0 then return x ^ (1/3) else return -((-x) ^ (1/3)) end
end

-- sRGB companding
local function srgb_to_linear(u)
  if u <= 0.04045 then return u / 12.92 end
  return ((u + 0.055) / 1.055) ^ 2.4
end

local function linear_to_srgb(u)
  if u <= 0.0031308 then return 12.92 * u end
  return 1.055 * (u ^ (1/2.4)) - 0.055
end

-- Hex helpers
local function clamp01(x)
  if x < 0 then return 0 end
  if x > 1 then return 1 end
  return x
end

local function parse_hex_rgb(hex)
  if type(hex) ~= 'string' then return nil end
  local s = hex
  if s:sub(1,1) == '#' then s = s:sub(2) end
  if #s == 3 then
    local r = tonumber(s:sub(1,1) .. s:sub(1,1), 16)
    local g = tonumber(s:sub(2,2) .. s:sub(2,2), 16)
    local b = tonumber(s:sub(3,3) .. s:sub(3,3), 16)
    if r and g and b then return r/255, g/255, b/255 end
    return nil
  elseif #s == 6 then
    local r = tonumber(s:sub(1,2), 16)
    local g = tonumber(s:sub(3,4), 16)
    local b = tonumber(s:sub(5,6), 16)
    if r and g and b then return r/255, g/255, b/255 end
    return nil
  end
  return nil
end

local function rgb_to_hex(r, g, b)
  r = clamp01(r); g = clamp01(g); b = clamp01(b)
  local R = math.floor(r * 255 + 0.5)
  local G = math.floor(g * 255 + 0.5)
  local B = math.floor(b * 255 + 0.5)
  return string.format('#%02X%02X%02X', R, G, B)
end

-- Linear sRGB <-> OKLab using OKLab reference matrices
local function linrgb_to_oklab(r, g, b)
  -- to LMS
  local l = cbrt(0.4122214708 * r + 0.5363325363 * g + 0.0514459929 * b)
  local m = cbrt(0.2119034982 * r + 0.6806995451 * g + 0.1073969566 * b)
  local s = cbrt(0.0883024619 * r + 0.2817188376 * g + 0.6299787005 * b)
  -- to OKLab
  local L = 0.2104542553 * l + 0.7936177850 * m - 0.0040720468 * s
  local a = 1.9779984951 * l - 2.4285922050 * m + 0.4505937099 * s
  local b_ = 0.0259040371 * l + 0.7827717662 * m - 0.8086757660 * s
  return L, a, b_
end

local function oklab_to_linrgb(L, a, b)
  local l = (L + 0.3963377774 * a + 0.2158037573 * b)
  local m = (L - 0.1055613458 * a - 0.0638541728 * b)
  local s = (L - 0.0894841775 * a - 1.2914855480 * b)

  l = l * l * l
  m = m * m * m
  s = s * s * s

  local r = 4.0767416621 * l - 3.3077115913 * m + 0.2309699292 * s
  local g = -1.2684380046 * l + 2.6097574011 * m - 0.3413193965 * s
  local b_ = -0.0041960863 * l - 0.7034186147 * m + 1.7076147010 * s
  return r, g, b_
end

-- Oklab <-> Oklch
local function lab_to_lch(L, a, b)
  local C = sqrt(a * a + b * b)
  local H
  if C < 1e-9 then
    H = 0
  else
    H = math.deg(atan2(b, a))
    if H < 0 then H = H + 360 end
  end
  return L, C, H
end

local function lch_to_lab(L, C, Hdeg)
  local hr = (Hdeg or 0) * pi / 180
  local a = C * cos(hr)
  local b = C * sin(hr)
  return L, a, b
end

local function is_in_gamut_srgb(r, g, b)
  return r >= 0 and r <= 1 and g >= 0 and g <= 1 and b >= 0 and b <= 1
end

local function oklch_to_srgb_internal(L, C, H)
  local L_, a, b = lch_to_lab(L, C, H)
  local rl, gl, bl = oklab_to_linrgb(L_, a, b)
  local r = linear_to_srgb(rl)
  local g = linear_to_srgb(gl)
  local b_ = linear_to_srgb(bl)
  return r, g, b_
end

local function oklch_to_srgb_with_fallback(L, C, H)
  local r, g, b = oklch_to_srgb_internal(L, C, H)
  if is_in_gamut_srgb(r, g, b) then
    return clamp01(r), clamp01(g), clamp01(b)
  end

  -- Binary search maximum chroma within sRGB gamut while preserving L and hue
  local lo, hi = 0, 1
  for _ = 1, 24 do
    local mid = (lo + hi) / 2
    local rr, gg, bb = oklch_to_srgb_internal(L, C * mid, H)
    if is_in_gamut_srgb(rr, gg, bb) then
      lo = mid
      r, g, b = rr, gg, bb
    else
      hi = mid
    end
  end
  return clamp01(r), clamp01(g), clamp01(b)
end

-- Public API
local function hex_to_oklch(hex)
  local r8, g8, b8 = parse_hex_rgb(hex)
  if not r8 then return {} end
  local rl = srgb_to_linear(r8)
  local gl = srgb_to_linear(g8)
  local bl = srgb_to_linear(b8)
  local L, a, b = linrgb_to_oklab(rl, gl, bl)
  local l, c, h = lab_to_lch(L, a, b)
  return { l = l, c = c, h = h }
end

local function oklch_to_hex(l_or_tbl, c, h)
  local L, C, H
  if type(l_or_tbl) == 'table' then
    L = l_or_tbl.l or l_or_tbl[1]
    C = l_or_tbl.c or l_or_tbl[2]
    H = l_or_tbl.h or l_or_tbl[3]
  else
    L = l_or_tbl; C = c; H = h
  end

  if type(L) ~= 'number' or type(C) ~= 'number' or type(H) ~= 'number' then
    return l_or_tbl
  end
  local r, g, b = oklch_to_srgb_with_fallback(L, C, H)
  return rgb_to_hex(r, g, b)
end

return {
  hex_to_oklch = hex_to_oklch,
  oklch_to_hex = oklch_to_hex,
}


