local lspservers = {
  "sumneko_lua",
  "solargraph",
  -- "cssls",
  -- "html",
  -- "tsserver",
  "pyright",
  -- "bashls",
  "jsonls",
  -- "yamlls",
}

local null_ls_servers = {
  "stylua",
}

local settings = {
  ui = {
    border = "none",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-null-ls")
if not mason_lspconfig_status then
  return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  return
end

mason.setup(settings)
mason_lspconfig.setup(
  {
    ensure_installed = lspservers,
    automatic_installation = true,
  }
)

mason_null_ls.setup(
  {
    ensure_installed = null_ls_servers,
    automatic_installation = true,
  }
)
