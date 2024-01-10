return {
  "zk-org/zk-nvim",
  config = function()
    require("zk").setup({
      -- can be "telescope", "fzf", "fzf_lua" or "select" (`vim.ui.select`)
      -- it's recommended to use "telescope", "fzf" or "fzf_lua"
      picker = "telescope",

      lsp = {
        -- `config` is passed to `vim.lsp.start_client(config)`
        config = {
          cmd = { "zk", "lsp", '--log', '/tmp/zk-lsp.log'},
          name = "zk",
          on_attach = function(client, bufnr)

            local opts = { noremap = true, silent = true }
            local keymap = vim.api.nvim_buf_set_keymap
            opts.desc = "Go to declaration"
            keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
            opts.desc = "Show LSP definitions"
            keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
            opts.desc = "Show documentation for what is under cursor"
            keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
            opts.desc = "Show LSP implementations"
            keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
            opts.desc = "Show LSP references"
            keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
            opts.desc = "Show LSP diagnostic"
            keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
            opts.desc = "Show LSP format"
            keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
            opts.desc = "Show LSP Info"
            keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
            opts.desc = "Show LSP Install Info"
            keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
            opts.desc = "Code Action"
            keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
            opts.desc = "Next Diagnostic"
            keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
            opts.desc = "Previous Diagnostic"
            keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
            opts.desc = "LSP Rename"
            keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
            opts.desc = "LSP Singature Help"
            keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
            opts.desc = "LSP Quickfix"
            keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
          end

          -- etc, see `:h vim.lsp.start_client()`
        },

        -- automatically attach buffers in a zk notebook that match the given filetypes
        auto_attach = {
          enabled = true,
          filetypes = { "markdown" },
        },
      },
    })
  end
}
