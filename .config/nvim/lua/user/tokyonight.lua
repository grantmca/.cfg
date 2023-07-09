require("tokyonight").setup({
  on_highlights = function(hl, c)
    hl.DiffAdd = {
      bg = c.gitSigns.add
    }
    hl.DiffDelete = {
      bg = c.gitSigns.delete
    }
    hl.DiffChange = {
      bg = c.gitSigns.change
    }
  end
})
