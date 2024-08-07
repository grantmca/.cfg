return {
  "zk-org/zk-nvim",
  config = function()
    local zk = require("zk")

    zk.setup({
      -- can be "telescope", "fzf", "fzf_lua" or "select" (`vim.ui.select`)
      -- it's recommended to use "telescope", "fzf" or "fzf_lua"
      picker = "telescope",

      lsp = {
        -- `config` is passed to `vim.lsp.start_client(config)`
        config = {
          cmd = { "zk", "lsp"},
          name = "zk",
        },

        -- automatically attach buffers in a zk notebook that match the given filetypes
        auto_attach = {
          enabled = true,
          filetypes = { "markdown" },
        },
      },
    })

    local opts = { noremap=true, silent=false }
    -- Insert links in place
    vim.api.nvim_set_keymap("n", "<leader>zi", "<Cmd>ZkInsertLink<CR>", opts)

    -- Create a new note after asking for its title.
    vim.api.nvim_set_keymap("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts)
    -- Open notes.
    vim.api.nvim_set_keymap("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)

    -- Open notes associated with the selected tags.
    vim.api.nvim_set_keymap("n", "<leader>zt", "<Cmd>ZkTags<CR>", opts)

    -- Search for the notes matching a given query.
    vim.api.nvim_set_keymap("n", "<leader>zf", "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", opts)
    -- Search for the notes matching the current visual selection.
    vim.api.nvim_set_keymap("v", "<leader>zf", ":'<,'>ZkMatch<CR>", opts)

    local commands = require("zk.commands")

    commands.add("ZkOrphans", function(options)
      options = vim.tbl_extend("force", { orphan = true }, options or {})
      zk.edit(options, { title = "Zk Orphans" })
    end)

  end
}
