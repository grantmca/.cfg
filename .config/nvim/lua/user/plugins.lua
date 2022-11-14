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
  vim.notify("Packer did work as expected")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})


-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" --Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup Aif from vim in neovim
  use "nvim-lua/plenary.nvim" --Useful Lua Funcitons used in a lot of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "LunarVim/onedarker.nvim" --Helpful for loading color Schemes DarkOner
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "nvim-tree/nvim-tree.lua"
  use "nvim-tree/nvim-web-devicons"
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The nvim completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-nvim-lua" -- path completions
  use "hrsh7th/cmp-cmdline" -- Command line completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- Command line completions
  -- snippits to use
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  --LSP
  use "neovim/nvim-lspconfig" -- enable lsp
  use "williamboman/mason.nvim" -- simple to use lanangue server installer
  use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
  use "jose-elias-alvarez/null-ls.nvim" -- For formatting and Linters

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  -- use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Git
  use 'lewis6991/gitsigns.nvim'

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
