local fn = vim.fn


-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone", "--depth",
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
  use "catppuccin/nvim"
  use "LunarVim/tokyonight.nvim"
  -- If you are using Packer
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "nvim-tree/nvim-tree.lua"
  use "nvim-tree/nvim-web-devicons"
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use "christoomey/vim-tmux-navigator" -- tmux & split window navigation
  use "szw/vim-maximizer" -- max vim split handler
  use "tpope/vim-surround" -- surround different words with parenthesis
  use "nvim-lualine/lualine.nvim" -- line underneath the buffer
  use "folke/which-key.nvim" -- for which which-key to show shortcuts
  use "lewis6991/impatient.nvim" -- Speeds up startup by caching the stetup
  use "dstein64/vim-startuptime" -- Used to help trackt the startup time of vim
  use "goolord/alpha-nvim" -- for the start screen
  use "sindrets/diffview.nvim" -- for file history and diff views
  use "kg8m/vim-simple-align" -- for alignment 

  --LSP
  use "neovim/nvim-lspconfig" -- enable lsp
  use "williamboman/mason.nvim" -- simple to use lanangue server installer
  use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
  use "jose-elias-alvarez/null-ls.nvim" -- For formatting and Linters
  use "jayp0521/mason-null-ls.nvim" -- For formatting and Linters

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

  -- GitHub CoPilot
  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  }

  use {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end
  }

  -- rails form Tpope
  use {
    "tpope/vim-rails",
  }
  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  -- In case I need undo history
  use "mbbill/undotree"
  -- Git
  use 'lewis6991/gitsigns.nvim'

  -- VimWiki
  use {
    'vimwiki/vimwiki',
    config = function()
      vim.g.vimwiki_list = {
        {
          path = '~/',
          syntax = 'markdown',
          ext  = '.md',
        }
      }
      vim.g.vimwiki_ext2syntax = {
        ['.md'] = 'markdown',
        ['.markdown'] = 'markdown',
        ['.mdown'] = 'markdown',
      }
    end
  }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
