local configs = require("nvim-treesitter.configs")
configs.setup {
  -- ensure_installed = "all",
  ensure_installed = { "c", "lua", "rust", "typescript", "svelte", "python", "kotlin", "java", "html", "go", "elm", "javascript", "vue", "yaml" },
  sync_install = false, 
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "yaml" } },
  rainbow = {
    -- disable = {},
    enable = true,
    extended_mode = true,
    max_file_lines = nil
  }
}
