return {
  "ojroques/nvim-bufdel",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    next = 'tabs',
    quit = false,  -- quit Neovim when last buffer is closed
  },
  keys = {
    { "<leader>c", "<CMD>BufDel<CR>", { desc = "Close Buffer" } },
  },
}
