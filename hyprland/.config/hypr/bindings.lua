---@module 'hl'
-- mainmod
local mainMod = "SUPER"

local function keybind(...)
  local args = table.pack(...)
  for i = 1, args.n do
    args[i] = tostring(args[i])
  end
  return table.concat(args, " + ")
end

hl.bind(mainMod .. " + " .. "I", hl.dsp.exec_cmd("kitty"))

--open the terminal
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "X", hl.dsp.window.close())

-- close the active window
hl.bind(mainMod .. " + " .. "L", hl.dsp.exec_cmd("hyprlock"))

-- Lock the screen
hl.bind(mainMod .. " + " .. "M", hl.dsp.exec_cmd("wlogout --protocol layer-shell"))

-- show the logout window
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "M", hl.dsp.exit())

-- Exit Hyprland all together no (force quit Hyprland)
hl.bind(mainMod .. " + " .. "E", hl.dsp.exec_cmd("thunar"))

-- Show the graphical file browser
hl.bind(mainMod .. " + " .. "V", hl.dsp.window.float())

-- Allow a window to float
hl.bind(mainMod .. " + " .. "SPACE", hl.dsp.exec_cmd("wofi"))

-- Show the graphical app launcher
-- hl.bind(mainMod .. " + " .. "S", hl.dsp.window.swap(nil))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + "..  "S", hl.dsp.window.move({ workspace = "+1" }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "W", hl.dsp.exec_cmd("~/.config/hypr/scripts/select-wallpaper.sh"))
hl.bind(mainMod .. " + " .. "Print", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh"))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "Print", hl.dsp.exec_cmd("~/.config/hypr/scripts/screen-record.sh"))

-- screen record
hl.bind(mainMod .. " + " .. "u", hl.dsp.exec_cmd("rofimoji --files emojis html_characters"))

-- quickshell
hl.bind(mainMod .. " + " .. "Q", hl.dsp.exec_cmd("quickshell ipc call sidebar toggle"))
hl.bind(mainMod .. " + " .. "T", hl.dsp.exec_cmd("quickshell ipc call topbar toggle"))

-- bind = $mainMod, K, exec, quickshell ipc call keybinds toggle

-- check battery
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "B", hl.dsp.exec_cmd("~/scripts/check-bluetooth-dev-battery.sh"))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "Delete", hl.dsp.exec_cmd("pamixer -t"))

-- Speaker Mute FN+F1
hl.bind(mainMod .. " + " .. "Left", hl.dsp.exec_cmd("pamixer -d 5"))

-- Volume lower key
hl.bind(mainMod .. " + " .. "Right", hl.dsp.exec_cmd("pamixer -i 5"))

-- Volume Higher key
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "Left", hl.dsp.exec_cmd("brightnessctl set 10%-"))

-- Screen brightness down FN+F7
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "Right", hl.dsp.exec_cmd("brightnessctl set 10%+"))

-- Screen brightness up FN+F8

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "J", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "K", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + " .. "F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "Backspace", hl.dsp.focus({ monitor = "+1" }))

-- cycle focus
hl.bind(mainMod .. " + " .. "bracketright", hl.dsp.window.cycle_next())
hl.bind(mainMod .. " + " .. "bracketleft", hl.dsp.window.cycle_next({ next = false }))

-- Switch workspaces with mainMod + [0-9]
hl.bind(mainMod .. " + " .. 1, hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + " .. 2, hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + " .. 3, hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + " .. 4, hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + " .. 5, hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + " .. 6, hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + " .. 7, hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + " .. 8, hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + " .. 9, hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + " .. 0, hl.dsp.focus({ workspace = 10 }))

-- map numpad
hl.bind(mainMod .. " + " .. "KP_1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + " .. "KP_2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + " .. "KP_3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + " .. "KP_4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + " .. "KP_5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + " .. "KP_6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + " .. "KP_7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + " .. "KP_8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + " .. "KP_9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + " .. "KP_0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + " .. "KP_End", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + " .. "KP_Down", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + " .. "KP_Next", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + " .. "KP_Left", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + " .. "KP_Begin", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + " .. "KP_Right", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + " .. "KP_Home", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + " .. "KP_Up", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + " .. "KP_Prior", hl.dsp.focus({ workspace = 9 }))

-- other keys
hl.bind(mainMod .. " + " .. "Home", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + " .. "End", hl.dsp.focus({ workspace = -1 }))
hl.bind(mainMod .. " + " .. "Prior", hl.dsp.focus({ workspace = "previous" }))
hl.bind(mainMod .. " + " .. "Next", hl.dsp.focus({ workspace = "previous" }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 1, hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 2, hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 3, hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 4, hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 5, hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 6, hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 7, hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 8, hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 9, hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 0, hl.dsp.window.move({ workspace = 10 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "KP_End", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "KP_Down", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "KP_Next", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "KP_Left", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "KP_Begin", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "KP_Right", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "KP_Home", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "KP_Up", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "KP_Prior", hl.dsp.window.move({ workspace = 9 }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + " .. "mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + " .. "mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true })
