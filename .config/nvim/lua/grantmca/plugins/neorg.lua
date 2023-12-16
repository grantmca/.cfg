return {
  "nvim-neorg/neorg",
  cmd = "Neorg",
  dependencies = {
  },
  build = ":Neorg sync-parsers",
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
      ["core.integrations.nvim-cmp"] = {},
      ["core.concealer"] = { config = { icon_preset = "diamond" } },
      ["core.export"] = {},
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
  },
}
