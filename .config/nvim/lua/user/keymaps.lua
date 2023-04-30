local opts = { noremap = true, silent = false }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap --Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- increment  
keymap("n", "<leader>=", "<C-a>", opts) -- incrememnt numbers up
keymap("n", "<leader>-", "<C-x>", opts) -- incrememnt numbers down

-- delete single character without copying into register
keymap("n", "x", '"_x', opts)

-- Navigate buffers
keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", opts)
keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", opts)
keymap("n", "<leader>c", ":Bdelete<CR>", opts)

-- File Navigation
-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "J", ":m .+1<CR>==", opts)
keymap("v", "K", ":m .-2<CR>==", opts)

-- Move text up and down
-- Visual Block --
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Command --
-- Menu navigation





