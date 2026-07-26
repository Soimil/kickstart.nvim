-- Language support: LSP servers, mason auto-install, treesitter parsers, formatters.
-- Languages: Lua (base), PHP, JS/TS, HTML/CSS, Elixir.

-- ============================================================
-- Treesitter parsers (syntax highlighting)
-- ============================================================
local parsers = {
  'php', 'phpdoc',
  'javascript', 'jsdoc', 'typescript', 'tsx',
  'html', 'css', 'scss',
  'elixir', 'heex', 'eex',
  'json', 'yaml', 'toml', 'twig',
}
require('nvim-treesitter').install(parsers)

vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'php', 'javascript', 'typescript', 'typescriptreact', 'javascriptreact',
    'html', 'css', 'scss',
    'elixir', 'heex', 'eex',
    'json', 'yaml', 'toml', 'twig',
  },
  callback = function() vim.treesitter.start() end,
})

-- ============================================================
-- LSP servers
-- ============================================================
local capabilities = require('blink.cmp').get_lsp_capabilities()

---@type table<string, vim.lsp.Config>
local servers = {
  intelephense = {},
  ts_ls        = {},
  html         = {},
  cssls        = {},
  taplo        = {}, -- TOML
  twiggy_language_server = {}, -- Twig
  elixirls     = {
    cmd = { 'elixir-ls' },
    settings = {
      elixirLS = {
        dialyzerEnabled = true,
        fetchDeps = false,
      },
    },
  },
}

for name, server in pairs(servers) do
  server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
  vim.lsp.config(name, server)
  vim.lsp.enable(name)
end

-- ============================================================
-- Mason auto-install (extends kickstart's list with our tools)
-- ============================================================
require('mason-tool-installer').setup {
  ensure_installed = {
    -- Already in kickstart base
    'lua_ls', 'stylua',
    -- LSP servers
    'intelephense',
    'typescript-language-server',
    'html-lsp',
    'css-lsp',
    'taplo',
    'twiggy-language-server',
    'elixir-ls',
    -- Formatters
    'prettierd',
    'php-cs-fixer',
    -- Linters
    'phpcs',
    'eslint_d',
    'stylelint',
  },
}

-- ============================================================
-- Conform formatters
-- ============================================================
local conform = require('conform')
local formatters_by_ft = {
  lua             = { 'stylua' },
  php             = { 'php_cs_fixer' },
  javascript      = { 'prettierd' },
  typescript      = { 'prettierd' },
  javascriptreact = { 'prettierd' },
  typescriptreact = { 'prettierd' },
  html            = { 'prettierd' },
  css             = { 'prettierd' },
  scss            = { 'prettierd' },
  json            = { 'prettierd' },
  jsonc           = { 'prettierd' },
  yaml            = { 'prettierd' },
  twig            = { 'twig-cs-fixer' },
  -- elixir is formatted via LSP (mix format)
}

for ft, fmts in pairs(formatters_by_ft) do
  conform.formatters_by_ft[ft] = fmts
end
