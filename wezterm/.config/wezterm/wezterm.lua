-- ~/.config/wezterm/wezterm.lua
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- THE BRAIN: Watch Pywal for changes
local wal_path = wezterm.home_dir .. "/.cache/wal/colors.json"
config.automatically_reload_config = true
wezterm.add_to_config_reload_watch_list(wal_path)

local function get_wal()
    local f = io.open(wal_path, "r")
    if not f then return nil end
    local s = f:read("*all")
    f:close()
    return wezterm.json_parse(s)
end

local wal = get_wal()

if wal then
    -- Suit Colors
    config.colors = {
        foreground = wal.special.foreground,
        background = wal.special.background,
        cursor_bg = wal.colors.color4, -- Arc Blue
        selection_bg = wal.colors.color1, -- Stark Red
        ansi = { wal.colors.color0, wal.colors.color1, wal.colors.color2, wal.colors.color3, wal.colors.color4, wal.colors.color5, wal.colors.color6, wal.colors.color7 },
        brights = { wal.colors.color8, wal.colors.color9, wal.colors.color10, wal.colors.color11, wal.colors.color12, wal.colors.color13, wal.colors.color14, wal.colors.color15 },
    }
    -- Suit Plating (Background Art)
    config.background = {
        { source = { File = wal.wallpaper }, hsb = { brightness = 0.1 }, width = "Cover" },
        { source = { Color = "#000000" }, width = "100%", height = "100%", opacity = 0.4 },
    }
end

config.window_background_opacity = 0.9
config.window_padding = { left = 15, right = 15, top = 15, bottom = 15 }
return config
