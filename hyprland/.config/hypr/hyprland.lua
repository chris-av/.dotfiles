---@module 'hl'
-- Setup monitors
hl.monitor({
  output   = "eDP-1",
  mode     = "1920x1080",
  position = "0x0",
  scale    = 1,
})

hl.monitor({
  output   = "DP-5",
  mode     = "3840x1600",
  position = "-3840x0",
  scale    = 1,
})

hl.workspace_rule({
  workspace = "eDP-1",
})

hl.workspace_rule({
  workspace = "DP-2",
})

hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("HYPRCURSOR_SIZE", 32)

hl.config({
  input = {
      kb_layout = "us",
      kb_options = "compose:ralt",
      follow_mouse = 1,
      touchpad = {
        natural_scroll = false,
      },
      numlock_by_default = true,
      sensitivity = 0.5,
  },
})

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 5,
    ["col.active_border"] = "rgb(cdd6f4)",
    ["col.inactive_border"] = "rgba(595959aa)",
    layout = "dwindle",
  },
})

hl.config({
  cursor = {
    enable_hyprcursor = true,
    inactive_timeout = 3,
  },
})

hl.config({
  decoration = {
    rounding = 0,
    blur = {
      enabled = false,
      size = 7,
      passes = 3,
    },
    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = "rgba(1a1a1aee)",
    },
  },
})

hl.curve("myBezier", {
  type = "bezier",
  points = { {0.05, 0.9}, {0.1, 1.05} },
})

hl.curve("mySpring", {
  type = "spring",
  mass = 1,
  stiffness = 70,
  dampening = 20,
})

-- animations
hl.animation({
  leaf = "workspaces",
  enabled = true,
  spring = "mySpring",
  speed = 10,
  style = "slide",
})

hl.animation({
  leaf = "windows",
  enabled = true,
  bezier = "myBezier",
  speed = 8,
  style = "slide",
})

hl.animation({
  leaf = "windowsOut",
  enabled = true,
  bezier = "myBezier",
  style = "popin 80%",
  speed = 8,
})

hl.animation({
  leaf = "border",
  enabled = true,
  bezier = "myBezier",
  speed = 8,
})

hl.config({
  dwindle = {
    preserve_split = true,
    -- you probably want this
  },
})

hl.config({
  master = {
    new_status = "master",
  },
})

hl.gesture({
  fingers = 3, 
  direction = "horizontal", 
  action = "workspace",
})

require("devices")
require("bindings")
require("window-rules")

-- Autostart
hl.on("hyprland.start", function()
  hl.exec_cmd("~/.config/hypr/xdg-portal-hyprland")
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
  hl.exec_cmd("waybar")
  hl.exec_cmd("mako")
  hl.exec_cmd("nm-applet --indicator")
  hl.exec_cmd("awww-daemon")
  hl.exec_cmd("/usr/bin/quickshell")
  hl.exec_cmd("mpd-mpris")
end)
