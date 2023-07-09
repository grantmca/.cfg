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
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  "lukas-reineke/indent-blankline.nvim", -- for indent lines
  "numToStr/Comment.nvim", -- Easily comment stuff
  "nvim-tree/nvim-tree.lua",
  { "nvim-tree/nvim-web-devicons", lazy = true },
  "akinsho/bufferline.nvim",
  "moll/vim-bbye",
  "christoomey/vim-tmux-navigator", -- tmux & split window navigation
  "szw/vim-maximizer", -- max vim split handler
  "tpope/vim-surround", -- surround different words with parenthesis
  "nvim-lualine/lualine.nvim", -- line underneath the buffer
  { "folke/which-key.nvim",
    lazy = true
  }, -- for which which-key to show shortcuts
  "lewis6991/impatient.nvim", -- Speeds up startup by caching the stetup
  {
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
    -- init is called during startup. Configuration for vim plugins typically should be set in an init function
    init = function()
      vim.g.startuptime_tries = 10
    end,
  }, -- Used to help trackt the startup time of vim
  {
    "goolord/alpha-nvim",
    lazy = false,
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
  "nvim-treesitter/nvim-treesitter",
  -- rails form Tpope
  { "tpope/vim-rails",
    ft = "ruby"
  },

  -- Telescope
  "nvim-telescope/telescope.nvim",

  -- In case I need undo history
  "mbbill/undotree",
  -- Git
  'lewis6991/gitsigns.nvim',
  -- Copilot
  {
    "zbirenbaum/copilot.lua",
<<<<<<< HEAD
    config = function ()
      require("copilot").setup()
    end
  }
  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
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

  use({
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup({
    api_key_cmd = nil,
    yank_register = "+",
    edit_with_instructions = {
      diff = false,
      keymaps = {
        close = "<C-c>",
        accept = "<C-y>",
        toggle_diff = "<C-d>",
        toggle_settings = "<C-o>",
        cycle_windows = "<Tab>",
        use_output_as_input = "<C-i>",
      },
    },
    chat = {
      welcome_message = WELCOME_MESSAGE,
      loading_text = "Loading, please wait ...",
      question_sign = "",
      answer_sign = "ﮧ",
      max_line_length = 120,
      sessions_window = {
        border = {
          style = "rounded",
          text = {
            top = " Sessions ",
          },
        },
        win_options = {
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
        },
      },
      keymaps = {
        close = { "<C-c>" },
        yank_last = "<C-y>",
        yank_last_code = "<C-k>",
        scroll_up = "<C-u>",
        scroll_down = "<C-d>",
        new_session = "<C-n>",
        cycle_windows = "<Tab>",
        cycle_modes = "<C-f>",
        select_session = "<Space>",
        rename_session = "r",
        delete_session = "d",
        draft_message = "<C-d>",
        toggle_settings = "<C-o>",
        toggle_message_role = "<C-r>",
        toggle_system_role_open = "<C-s>",
      },
    },
    popup_layout = {
      default = "center",
      center = {
        width = "80%",
        height = "80%",
      },
      right = {
        width = "30%",
        width_settings_open = "50%",
      },
    },
    popup_window = {
      border = {
        highlight = "FloatBorder",
        style = "rounded",
        text = {
          top = " ChatGPT ",
        },
      },
      win_options = {
        wrap = true,
        linebreak = true,
        foldcolumn = "1",
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
      },
      buf_options = {
        filetype = "markdown",
      },
    },
    system_window = {
      border = {
        highlight = "FloatBorder",
        style = "rounded",
        text = {
          top = " SYSTEM ",
        },
      },
      win_options = {
        wrap = true,
        linebreak = true,
        foldcolumn = "2",
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
      },
    },
    popup_input = {
      prompt = "  ",
      border = {
        highlight = "FloatBorder",
        style = "rounded",
        text = {
          top_align = "center",
          top = " Prompt ",
        },
      },
      win_options = {
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
      },
      submit = "<Enter>",
      submit_n = "<C-Enter>",
    },
    settings_window = {
      border = {
        style = "rounded",
        text = {
          top = " Settings ",
        },
      },
      win_options = {
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
      },
    },
    openai_params = {
      model = "gpt-3.5-turbo",
      frequency_penalty = 0,
      presence_penalty = 0,
      max_tokens = 300,
      temperature = 0,
      top_p = 1,
      n = 1,
    },
    openai_edit_params = {
      model = "code-davinci-edit-001",
      temperature = 0,
      top_p = 1,
      n = 1,
    },
    actions_paths = {},
    show_quickfixes_cmd = "Trouble quickfix",
    predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/f/awesome-chatgpt-prompts/main/prompts.csv",
  })
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  })

  use {
=======
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
  {
>>>>>>> lazy
    "nvim-neorg/neorg",
    cmd = "Neorg",
    -- build = ":Neorg sync-parsers",
      opts  = {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              default_workspace = "notes",
              workspaces = {
                notes = "~/notes",
              },
            },
            default_workspace = "notes",
          },
        },
      }
  },
  {
  "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  }
}

local opts = {}

require("lazy").setup(plugins, opts)
