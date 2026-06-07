---@module 'hl'
-- window rules
hl.window_rule({
  name = "dolphin-float",
  float = true,
  match = {
    title = "Dolphin$",
  },
})

hl.window_rule({
  name = "thunar-float",
  rounding = 10,
  float = true,
  size = {900, 600},
  move = {"(monitor_w)*0.25", "(monitor_h)*0.25"},
  match = {
    initial_class = "thunar",
  },
})

hl.window_rule({
  name = "show-me-the-key",
  rounding = 0,
  match = {
    class = ".*showmethekey",
    title = "^(Show Me The Key)$",
  },
})

hl.window_rule({
  name = "spotify",
  rounding = 10,
})

hl.window_rule({
  name = "rgraphics_device",
  rounding = 10,
  match = {
    initial_class = "^(R_x11)$",
  },
})

-- move = ((monitor_w * 0.5) - (window_w * 0.5)) ((monitor_h * 0.5) - (window_h * 0.5))
hl.window_rule({
  name = "nm_connection_editor",
  rounding = 10,
  float = true,
  size = {900, 600},
  move = {"((monitor_w * 0.5) - (window_w * 0.5))", "((monitor_h * 0.5) - (window_h * 0.35))"},
  match = {
    initial_class = "nm-connection-editor",
  },
})

-- layer rules
hl.layer_rule({
  name = "quickshell-sidebar",
  blur = true,
  xray = true,
  animation = "slide right",
  ignore_alpha = 0.1,
  match = {
    namespace = "quickshell",
  },
})

hl.layer_rule({
  name = "sidebar-logic",
  blur = true,
  xray = true,
  animation = "slide right",
  ignore_alpha = 0.1,
  match = {
    namespace = "quickshell-sidebar",
  },
})

hl.layer_rule({
  name = "topbar-glass",
  blur = true,
  xray = true,
  animation = "slide",
  ignore_alpha = 0.5,
  match = {
    namespace = "quickshell-topbar",
  },
})

hl.layer_rule({
  name = "keybinds-glass",
  blur = true,
  xray = true,
  animation = "slide",
  ignore_alpha = 0.5,
  match = {
    namespace = "quickshell-keybinds",
  },
})
