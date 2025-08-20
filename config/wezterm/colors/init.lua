-- Aggregate colors module

local oklch = require 'colors.oklch'
local hex = require 'colors.rgb'

local M = {}
for k, v in pairs(oklch) do M[k] = v end
for k, v in pairs(hex) do M[k] = v end
return M


