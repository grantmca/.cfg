return   {
  "zbirenbaum/copilot-cmp",
  event = "InsertEnter",
  dependencies = {
    "zbirenbaum/copilot.lua",
  },
  config = function ()
    require("copilot_cmp").setup({
      fix_pairs = true,
    })
  end
}
