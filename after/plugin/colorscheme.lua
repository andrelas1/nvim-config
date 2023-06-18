local kanagawa = require("kanagawa")

vim.cmd "colorscheme koehler"

-- local colorscheme = "tokyonight-night" -- ideal to set a custom colorscheme and not a default one
local colorscheme = "kanagawa-wave" -- ideal to set a custom colorscheme and not a default one

-- to set a custom colorscheme and if it is not installed, then the default one was already set
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found, using default colorscheme")
end


