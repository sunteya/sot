local wezterm = require 'wezterm'
local root_path = wezterm.config_dir
local lua_version = _VERSION:match("%d+%.%d+")
package.path = string.format("%s/lua_modules/share/lua/%s/?.lua;", root_path, lua_version) .. package.path
package.path = string.format("%s/lua_modules/share/lua/%s/?/init.lua;", root_path, lua_version) .. package.path
package.cpath = string.format("lua_modules/lib/lua/%s/?.so;", lua_version) .. package.cpath

local colors = require 'colors'
local M = require "moses"

local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback {
  { family = 'Iosevka Kai Nerd' },
  { family = 'PingFang SC' },
}
config.font_size = 14

local gary_50  = "#f2f2f2";
local gary_100 = "#e6e6e6";
local gary_200 = "#cfcfcf";
local gary_300 = "#b5b5b5";
local gary_400 = "#9e9e9e";
local gary_500 = "#858585";
local gary_600 = "#737373";
local gary_700 = "#616161";
local gary_800 = "#4f4f4f";
local gary_900 = "#3d3d3d";
local gary_950 = "#363636";

-- 蝋色 #2b2b2b ろういろ
-- 墨 #595857 すみ
-- 消炭色 #524e4d けしずみいろ
local black = colors.hex_to_oklch("#524e4d")
-- 白磁 #f8fbf8 はくじ
local white = colors.hex_to_oklch("#f8fbf8")

local black_normal = colors.hex_to_oklch(gary_800)
local black_bright = colors.hex_to_oklch(gary_600)
local white_normal = colors.hex_to_oklch(gary_200)
local white_bright = colors.hex_to_oklch(gary_50)


-- 退紅 #d69090 あらぞめ
-- 白茶 #ddbb99 しらちゃ
-- 水柿 #e4ab9b みずがき
-- 洗柿 #f2c9ac あらいがき
local base_normal = colors.hex_to_oklch("#f2c9ac")

-- 練色 #ede4cd ねりいろ
-- 裏葉柳 #c1d8ac うらはやなぎ
-- 春绿 #e3efd1
local base_bright = colors.hex_to_oklch("#e3efd1")

-- 淡绯 #f2cac9
local red = colors.hex_to_oklch("#f2cac9")
local red_normal = M.extend({}, base_normal, { h = red.h }, { l = base_normal.l * 1.0 })
local red_bright = M.extend({}, base_bright, { h = red.h })

-- 女郎花 #f2f2b0 おみなえし
local yellow = colors.hex_to_oklch("#f2f2b0")
local yellow_normal = M.extend({}, base_normal, { h = yellow.h }, { l = base_normal.l * 1.1 })
local yellow_bright = M.extend({}, base_bright, { h = yellow.h }, { c = base_bright.c })

-- 薄萌葱 #badcad うすもえぎ
-- 若緑 #98d98e わかみどり
local green = colors.hex_to_oklch('#98d98e')
local green_normal = M.extend({}, base_normal, { h = green.h }, { l = base_normal.l * 1.1 })
local green_bright = M.extend({}, base_bright, { h = green.h }, { l = base_bright.l })

-- 撫子色 #eebbcb なでしこいろ
-- 青莲紫 #95509f
-- 木槿紫 #a381ba
-- 紫水晶 #c3a6cb
-- 桔梗色 #5654a2 ききょういろ
-- 江戸紫 #745399 えどむらさき
-- 菖蒲色 #674196 しょうぶいろ
-- 菫色 #7058a3 すみれいろ
local magenta = colors.hex_to_oklch('#7058a3')
local magenta_normal = M.extend({}, base_normal, { h = magenta.h })
local magenta_bright = M.extend({}, base_bright, { h = magenta.h })

-- 勿忘草色 #89c3eb わすれなぐさいろ
-- frosty blue #bbdbf3 フロスティブルー
-- 淡藤色 #bbc8e6 あわふじいろ
-- 碧玉石 #569597
-- 新橋色 #59b9c6 しんばしいろ
-- 錆浅葱 #5c9291 さびあさぎ
local cyan = colors.hex_to_oklch("#5c9291")
local cyan_normal = M.extend({}, base_normal, { h = cyan.h })
local cyan_bright = M.extend({}, base_bright, { h = cyan.h })

-- 青藤色 #84a2d4 あおふじいろ
-- 薄群青 #5383c3 うすぐんじょう
-- 宝石蓝 #1f3696
-- 薄花桜 #5a79ba うすはなざくら
local blue = colors.hex_to_oklch("#5a79ba")
local blue_normal = M.extend({}, base_normal, { h = blue.h }, { c = base_normal.c * 1.2 })
local blue_bright = M.extend({}, base_bright, { h = blue.h })

local foreground = M.extend({ c = 0, h = 0 }, { l = 0.9 })
local background = M.extend({ c = 0, h = 0 }, { l = 0.15 })

-- 花葉色 #fbd26b はなばいろ
local cursor = '#fbd26b'

config.color_schemes = {
  ['Saoto'] = {
    foreground = colors.oklch_to_hex(foreground),
    background = colors.oklch_to_hex(background),

    -- cursor_fg = cursor,
    cursor_bg = cursor,
    cursor_border = cursor,

    -- 紺青 #192f60 こんじょう
    -- 濃藍 #0f2350 こいあい
    -- selection_fg = '#f3f3f3',
    -- selection_bg = '#0f2350',
    selection_bg = colors.hex_to_rgba('#0f2350', 0.8),

    -- 鼠色 #949495 ねずみいろ
    scrollbar_thumb = colors.hex_to_rgba('#949495', 0.6),
    ansi = {
      colors.oklch_to_hex(black_normal), -- (Black	黑色)
      colors.oklch_to_hex(red_normal), -- (Red	红色)
      colors.oklch_to_hex(green_normal), -- 白緑 (Green	绿色)
      colors.oklch_to_hex(yellow_normal), -- (Yellow	黄色（或棕色）)
      colors.oklch_to_hex(blue_normal), -- (Blue	蓝色)
      colors.oklch_to_hex(magenta_normal), -- (Magenta	洋红色 / 紫色)
      colors.oklch_to_hex(cyan_normal), -- (Cyan	青色)
      colors.oklch_to_hex(white_normal), -- (White	白色（实际是浅灰）)
    },

    brights = {
      colors.oklch_to_hex(black_bright), -- (Bright Black	深灰色)
      colors.oklch_to_hex(red_bright), -- (Bright Red 亮红色)
      colors.oklch_to_hex(green_bright), -- (Bright Green	亮绿色)
      colors.oklch_to_hex(yellow_bright), -- (Bright Yellow 亮黄色)
      colors.oklch_to_hex(blue_bright), -- (Bright Blue	亮蓝色)
      colors.oklch_to_hex(magenta_bright), -- (Bright Magenta	亮紫色)
      colors.oklch_to_hex(cyan_bright), -- (Bright Cyan	亮青色)
      colors.oklch_to_hex(white_bright), -- (Bright White	纯白)
    },
  },
}

config.colors = {
  tab_bar = {
    inactive_tab_edge = colors.oklch_to_hex(background),

    active_tab = {
      bg_color = colors.oklch_to_hex(background),
      fg_color = colors.oklch_to_hex(foreground),
    },

    inactive_tab = {
      bg_color = colors.oklch_to_hex(background),
      fg_color = colors.oklch_to_hex(black_normal),
    },
    inactive_tab_hover = {
      bg_color = colors.oklch_to_hex(black_normal),
      fg_color = colors.oklch_to_hex(foreground),
    },

    new_tab = {
      bg_color = colors.oklch_to_hex(background),
      fg_color = colors.oklch_to_hex(foreground),
    },
    new_tab_hover = {
      bg_color = colors.oklch_to_hex(black_normal),
      fg_color = colors.oklch_to_hex(foreground),
    },
  },
}
config.window_frame = {
  inactive_titlebar_bg = colors.oklch_to_hex(background),
  active_titlebar_bg = colors.oklch_to_hex(background),

  font = config.font,
  font_size = 14
}
local theme = config.color_schemes['Saoto']
config.color_scheme = 'Saoto'

config.enable_scroll_bar = true
config.window_decorations = "RESIZE|INTEGRATED_BUTTONS"
config.window_padding = {
  left = '0.5cell',
  right = '0.5cell',
  top = '0cell',
  bottom = '0cell'
}
config.show_close_tab_button_in_tabs = false
-- config.show_new_tab_button_in_tab_bar = false
-- config.use_fancy_tab_bar = false

config.keys = {
  -- Make Option-Left/Right equivalent to Alt-b/f which many line editors interpret as backward-word / forward-word
  -- { key = "LeftArrow", mods = "OPT", action = wezterm.action { SendString="\x1bb" } },
  -- { key = "RightArrow", mods = "OPT", action = wezterm.action { SendString="\x1bf" } },
}

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end


wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local title = tab_title(tab)
    title = wezterm.truncate_right(title, max_width - 2)

    local number_bg = colors.oklch_to_hex(background)
    local title_bg = colors.oklch_to_hex(background)
    local title_fg = colors.oklch_to_hex(black_bright)

    if tab.is_active then
      number_bg = gary_700
      title_bg = gary_900
      title_fg = colors.oklch_to_hex(white_bright)
    end

    local result = { -- disable default background
      { Background = { Color = colors.oklch_to_hex(background) } },
      { Text = '​' }, -- zero width space
    }

    M.push(result,
      { Background = { Color = number_bg } },
      { Foreground = { Color = title_fg } },
      { Text = ' #' .. tab.tab_index + 1 .. '' }
    )

    if tab.is_active then
      M.push(result,
        { Background = { Color = number_bg } },
        { Foreground = { Color = title_bg } },
        { Text = wezterm.nerdfonts.ple_left_hard_divider_inverse }
      )
    else
      M.push(result,
        { Background = { Color = number_bg } },
        { Foreground = { Color = title_fg } },
        { Text = wezterm.nerdfonts.pl_left_soft_divider }
      )
    end

    M.push(result,
      { Background = { Color = title_bg } },
      { Foreground = { Color = title_fg } },
      { Text = ' ' .. title .. ' ' }
    )

    return result
  end
)

-- Load optional local overrides from `wezterm.local.lua` if present.
do
  local ok, apply_local = pcall(dofile, root_path .. '/wezterm.local.lua')
  if ok and type(apply_local) == 'function' then
    apply_local(config, wezterm)
  end
end

-- Press Ctrl + Shift + L to enter Debug mode
-- wezterm.log_info('Config file ' .. wezterm.config_file)
-- wezterm.log_info('Config dir ' .. wezterm.config_dir)
-- window:effective_config()
return config
