---@module 'hl'
local mainMod = "SUPER"

-- Build a keychord string from a table of keys
local function bind(keys, action, opts)
  hl.bind(table.concat(keys, " + "), action, opts)
end

-- Shorthand: automatically prepend mainMod
local function mod(keys, action, opts)
  bind({ mainMod, table.unpack(keys) }, action, opts)
end

-- Apps 
mod({ "I" },     hl.dsp.exec_cmd("kitty"))                -- open terminal
mod({ "E" },     hl.dsp.exec_cmd("thunar"))               -- file browser
mod({ "SPACE" }, hl.dsp.exec_cmd("wofi"))                 -- app launcher
mod({ "u" },     hl.dsp.exec_cmd("rofimoji --files emojis html_characters"))

-- Session 
mod({ "L" },          hl.dsp.exec_cmd("hyprlock"))                          -- lock screen
mod({ "M" },          hl.dsp.exec_cmd("wlogout --protocol layer-shell"))    -- logout menu
mod({ "SHIFT", "M" }, hl.dsp.exit())                                        -- force quit Hyprland

-- Windows
mod({ "SHIFT", "X" }, hl.dsp.window.close())
mod({ "V" },          hl.dsp.window.float())
mod({ "F" },          hl.dsp.window.fullscreen())
mod({ "SHIFT", "F" }, hl.dsp.window.fullscreen())

-- Cycle windows
mod({ "bracketright" }, hl.dsp.window.cycle_next())
mod({ "bracketleft" },  hl.dsp.window.cycle_next({ next = false }))

-- Swap / move
mod({ "S" },          hl.dsp.window.swap({ next = "+1" }))
mod({ "SHIFT", "S" }, hl.dsp.workspace.move({ monitor = "+1" }))
mod({ "J" }, hl.dsp.layout("togglesplit"))

-- Drag / resize with mouse
mod({ "mouse:272" }, hl.dsp.window.drag(),   { mouse = true })
mod({ "mouse:273" }, hl.dsp.window.resize(), { mouse = true })


-- Focus

mod({ "SHIFT", "H" },         hl.dsp.focus({ direction = "left" }))
mod({ "SHIFT", "L" },         hl.dsp.focus({ direction = "right" }))
mod({ "SHIFT", "J" },         hl.dsp.focus({ direction = "up" }))
mod({ "SHIFT", "K" },         hl.dsp.focus({ direction = "down" }))
mod({ "SHIFT", "Backspace" }, hl.dsp.focus({ monitor = "+1" }))


-- Workspaces: switch
-- Number row
mod({ 1 }, hl.dsp.focus({ workspace = 1 }))
mod({ 2 }, hl.dsp.focus({ workspace = 2 }))
mod({ 3 }, hl.dsp.focus({ workspace = 3 }))
mod({ 4 }, hl.dsp.focus({ workspace = 4 }))
mod({ 5 }, hl.dsp.focus({ workspace = 5 }))
mod({ 6 }, hl.dsp.focus({ workspace = 6 }))
mod({ 7 }, hl.dsp.focus({ workspace = 7 }))
mod({ 8 }, hl.dsp.focus({ workspace = 8 }))
mod({ 9 }, hl.dsp.focus({ workspace = 9 }))
mod({ 0 }, hl.dsp.focus({ workspace = 10 }))

-- Numpad digits
mod({ "KP_1" }, hl.dsp.focus({ workspace = 1 }))
mod({ "KP_2" }, hl.dsp.focus({ workspace = 2 }))
mod({ "KP_3" }, hl.dsp.focus({ workspace = 3 }))
mod({ "KP_4" }, hl.dsp.focus({ workspace = 4 }))
mod({ "KP_5" }, hl.dsp.focus({ workspace = 5 }))
mod({ "KP_6" }, hl.dsp.focus({ workspace = 6 }))
mod({ "KP_7" }, hl.dsp.focus({ workspace = 7 }))
mod({ "KP_8" }, hl.dsp.focus({ workspace = 8 }))
mod({ "KP_9" }, hl.dsp.focus({ workspace = 9 }))
mod({ "KP_0" }, hl.dsp.focus({ workspace = 10 }))

-- Numpad arrows / named keys
mod({ "KP_End" },   hl.dsp.focus({ workspace = 1 }))
mod({ "KP_Down" },  hl.dsp.focus({ workspace = 2 }))
mod({ "KP_Next" },  hl.dsp.focus({ workspace = 3 }))
mod({ "KP_Left" },  hl.dsp.focus({ workspace = 4 }))
mod({ "KP_Begin" }, hl.dsp.focus({ workspace = 5 }))
mod({ "KP_Right" }, hl.dsp.focus({ workspace = 6 }))
mod({ "KP_Home" },  hl.dsp.focus({ workspace = 7 }))
mod({ "KP_Up" },    hl.dsp.focus({ workspace = 8 }))
mod({ "KP_Prior" }, hl.dsp.focus({ workspace = 9 }))

-- Navigation keys
mod({ "Home" },  hl.dsp.focus({ workspace = 1 }))
mod({ "End" },   hl.dsp.focus({ workspace = -1 }))
mod({ "Prior" }, hl.dsp.focus({ workspace = "previous" }))
mod({ "Next" },  hl.dsp.focus({ workspace = "previous" }))

-- Mouse scroll
mod({ "mouse_down" }, hl.dsp.focus({ workspace = "e+1" }))
mod({ "mouse_up" },   hl.dsp.focus({ workspace = "e-1" }))

-- Workspaces: move window
mod({ "SHIFT", 1 }, hl.dsp.window.move({ workspace = 1 }))
mod({ "SHIFT", 2 }, hl.dsp.window.move({ workspace = 2 }))
mod({ "SHIFT", 3 }, hl.dsp.window.move({ workspace = 3 }))
mod({ "SHIFT", 4 }, hl.dsp.window.move({ workspace = 4 }))
mod({ "SHIFT", 5 }, hl.dsp.window.move({ workspace = 5 }))
mod({ "SHIFT", 6 }, hl.dsp.window.move({ workspace = 6 }))
mod({ "SHIFT", 7 }, hl.dsp.window.move({ workspace = 7 }))
mod({ "SHIFT", 8 }, hl.dsp.window.move({ workspace = 8 }))
mod({ "SHIFT", 9 }, hl.dsp.window.move({ workspace = 9 }))
mod({ "SHIFT", 0 }, hl.dsp.window.move({ workspace = 10 }))

-- Numpad
mod({ "SHIFT", "KP_End" },   hl.dsp.window.move({ workspace = 1 }))
mod({ "SHIFT", "KP_Down" },  hl.dsp.window.move({ workspace = 2 }))
mod({ "SHIFT", "KP_Next" },  hl.dsp.window.move({ workspace = 3 }))
mod({ "SHIFT", "KP_Left" },  hl.dsp.window.move({ workspace = 4 }))
mod({ "SHIFT", "KP_Begin" }, hl.dsp.window.move({ workspace = 5 }))
mod({ "SHIFT", "KP_Right" }, hl.dsp.window.move({ workspace = 6 }))
mod({ "SHIFT", "KP_Home" },  hl.dsp.window.move({ workspace = 7 }))
mod({ "SHIFT", "KP_Up" },    hl.dsp.window.move({ workspace = 8 }))
mod({ "SHIFT", "KP_Prior" }, hl.dsp.window.move({ workspace = 9 }))


-- Media & brightness
mod({ "SHIFT", "Delete" }, hl.dsp.exec_cmd("pamixer -t"))         -- toggle mute
mod({ "Left" },            hl.dsp.exec_cmd("pamixer -d 5"))        -- volume down
mod({ "Right" },           hl.dsp.exec_cmd("pamixer -i 5"))        -- volume up
mod({ "SHIFT", "Left" },  hl.dsp.exec_cmd("brightnessctl set 10%-"))  -- brightness down
mod({ "SHIFT", "Right" }, hl.dsp.exec_cmd("brightnessctl set 10%+"))  -- brightness up


-- Screenshots & wallpaper
mod({ "Print" },         hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh"))
mod({ "SHIFT", "Print"}, hl.dsp.exec_cmd("~/.config/hypr/scripts/screen-record.sh"))
mod({ "SHIFT", "W" },    hl.dsp.exec_cmd("~/.config/hypr/scripts/select-wallpaper.sh"))


-- Quickshell & misc
mod({ "Q" }, hl.dsp.exec_cmd("quickshell ipc call sidebar toggle"))
mod({ "T" }, hl.dsp.exec_cmd("quickshell ipc call topbar toggle"))

mod({ "SHIFT", "B" }, hl.dsp.exec_cmd("~/scripts/check-bluetooth-dev-battery.sh"))
