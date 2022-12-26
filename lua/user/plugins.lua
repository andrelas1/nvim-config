local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("Issue with requiring packer")
  return
end

-- Have packer use a popup window
-- packer.init({
-- 	display = {
-- 		open_fn = function()
-- 			return require("packer.util").float({ border = "rounded" })
-- 		end,
-- 	},
-- })


-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here

  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
  use("tpope/vim-commentary") -- Add commentaries with gc
  use({ "gruvbox-community/gruvbox", alias = 'gruvbox' }) -- gruvbox theme
  use({
    "prettier/vim-prettier",
    run = 'npm install --frozen-lockfile --production',
    ft = { 'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml',
      'html' }
  }) -- Prettier for JS projects
  use("lunarvim/colorschemes") -- LunarVim colorscheme
  use("folke/tokyonight.nvim") -- tokyonight colorscheme
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
  })

  use("hrsh7th/nvim-cmp") -- code completion
  use("hrsh7th/cmp-buffer") -- buffer completion
  use("hrsh7th/cmp-path") -- path completion
  use("hrsh7th/cmp-cmdline") -- cmdline completion
  use("hrsh7th/cmp-nvim-lua") -- vim api completion
  use("hrsh7th/cmp-nvim-lsp") -- completion with nvim lsp
  use("windwp/nvim-autopairs") -- Autopairs
  use("lewis6991/gitsigns.nvim") -- Gitsigns
  use("kyazdani42/nvim-web-devicons") -- Nvim Tree Explorer
  use("kyazdani42/nvim-tree.lua") -- Nvim Tree Explorer
  use("akinsho/bufferline.nvim") -- Bufferline
  use("moll/vim-bbye") -- Delete a buffer that does not exit neovim. Useful with many windows/tabs



  use("saadparwaiz1/cmp_luasnip") -- snippet completion for nvim-cmp
  use("L3MON4D3/LuaSnip") -- snippet engine for nvim-cmp
  use("udalov/kotlin-vim") -- language support for kotlin

  use("neovim/nvim-lspconfig") -- enable LSP
  -- use("williamboman/nvim-lsp-installer")  -- simple to use language server installer
  use("williamboman/mason.nvim") -- simple to use language server installer
  use("williamboman/mason-lspconfig.nvim") -- simple to use language server installer
  use("jose-elias-alvarez/null-ls.nvim") -- utility to be able to use things from the LSP

  -- Telescope
  use("nvim-telescope/telescope.nvim") -- Telescope
  use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }) -- Telescope's faster fuzzy finder in C

  -- Treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- Treesitter
  use("p00f/nvim-ts-rainbow") -- Adds different colors for nested parenthesis
  use("nvim-treesitter/playground")

  -- Status line
  -- use("nvim-lua/lsp-status.nvim")                             -- Adds a status bar on the bottom line to give LSP info about the current file
  use({ "nvim-lualine/lualine.nvim",
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }) -- Adde a status bar on the bottom line to gite LSP and git info about the current file


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
