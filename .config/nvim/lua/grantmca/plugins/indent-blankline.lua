return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opt = function()
    require("indent_blankline").setup({
      show_end_of_line = true,
      space_char_blankline = " ",
    })
  end,
}
