require("notify").setup {
  -- background_colour = "NotifyBackground",
  background_colour = "#000000",
  fps = 30,
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = "",
  },
  level = 2,
  minimum_width = 25,
  max_width = 50,
  render = "wrapped-default",
  stages = "fade",
  -- time_formats = {
  --   notification = "%T",
  --   notification_history = "%FT%T",
  -- },
  timeout = 5000,
  top_down = true,
}
