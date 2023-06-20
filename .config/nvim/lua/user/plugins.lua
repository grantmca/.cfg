local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  "nvim-lua/popup.nvim", -- An implementation of the Popup Aif from vim in neovim
  "nvim-lua/plenary.nvim", --Useful Lua Funcitons used in a lot of plugins
  {"windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = require("user.autopairs")
  },
  "catppuccin/nvim",
  "LunarVim/tokyonight.nvim",
  "lukas-reineke/indent-blankline.nvim", -- for indent lines
  "numToStr/Comment.nvim", -- Easily comment stuff
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",
  "akinsho/bufferline.nvim",
  "moll/vim-bbye",
  "christoomey/vim-tmux-navigator", -- tmux & split window navigation
  "szw/vim-maximizer", -- max vim split handler
  "tpope/vim-surround", -- surround different words with parenthesis
  "nvim-lualine/lualine.nvim", -- line underneath the buffer
  "folke/which-key.nvim", -- for which which-key to show shortcuts
  "lewis6991/impatient.nvim", -- Speeds up startup by caching the stetup
  "dstein64/vim-startuptime", -- Used to help trackt the startup time of vim
  {
    "goolord/alpha-nvim",
    lazy = true,
  },
  "sindrets/diffview.nvim", -- for file history and diff views
  "kg8m/vim-simple-align", -- for alignment 

  --LSP
  "neovim/nvim-lspconfig", -- enable lsp
  "williamboman/mason.nvim", -- simple to use lanangue server installer
  "williamboman/mason-lspconfig.nvim", -- simple to use language server installer
  "jose-elias-alvarez/null-ls.nvim", -- For formatting and Linters
  "jayp0521/mason-null-ls.nvim", -- For formatting and Linters

  -- cmp plugins
  "hrsh7th/nvim-cmp", -- The nvim completion plugin
  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-path", -- path completions
  "hrsh7th/cmp-nvim-lua", -- path completions
  "hrsh7th/cmp-cmdline", -- Command line completions
  "saadparwaiz1/cmp_luasnip", -- snippet completions
  "hrsh7th/cmp-nvim-lsp", -- Command line completions
  -- snippits to use
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",

  -- rails form Tpope
  "tpope/vim-rails",

  -- Telescope
  "nvim-telescope/telescope.nvim",

  -- In case I need undo history
  "mbbill/undotree",
  -- Git
  'lewis6991/gitsigns.nvim',
  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = {
      "zbirenbaum/copilot.lua",
    },
    config = function ()
      require("copilot_cmp").setup()
    end
  },
  -- {
  --   "nvim-neorg/neorg",
  --   build = ":Neorg sync-parsers",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require("neorg").setup {
  --       load = {
  --         ["core.defaults"] = {}, -- Loads default behaviour
  --         ["core.concealer"] = {}, -- Adds pretty icons to your documents
  --         ["core.dirman"] = { -- Manages Neorg workspaces
  --           config = {
  --             workspaces = {
  --               notes = "~/notes",
  --             },
  --           },
  --         },
  --       },
  --     }
  --   end,
  -- },
}

local opts = {}

require("lazy").setup(plugins, opts)
