require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.lsp"

local function open_nvim_tree()
  -- open the tree
  require("nvim-tree.api").tree.open()
end


-- Open NVIM_TREE when nvim starts
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

