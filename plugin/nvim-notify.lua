vim.notify = require("notify")

vim.notify.setup({
    background_colour = "#000000",
    fps = 60,
    icons = {
      DEBUG = "",
      ERROR = "",
      INFO = "",
      TRACE = "✎",
      WARN = ""
    },
    level = 2,
    minimum_width = 20,
    render = "compact",
    stages = "slide",
    timeout = 2000,
    top_down = true
})

vim.notify("nvim-notify started")
