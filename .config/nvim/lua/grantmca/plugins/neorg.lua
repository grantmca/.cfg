return {
  "nvim-neorg/neorg",
  cmd = "Neorg",
  -- build = ":Neorg sync-parsers",
  opts = {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      -- ["core.ui"] = {}, -- Adds pretty calendar
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
