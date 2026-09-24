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
-- Mason: doinstalowanie NASZYCH narzedzi
-- ============================================================
-- Wlascicielem `mason-tool-installer` jest baza kickstarta (`init.lua`) i to ona
-- odpowiada za swoja liste (`lua_ls`, `stylua`). Nie wolamy tu `setup()` drugi raz.
--
-- DLACZEGO: plugin scala ustawienia przez `vim.tbl_deep_extend('force', ...)`, a ta
-- funkcja scala listy PO INDEKSACH, nie przez doklejanie. Drugie `setup()` z wlasna
-- lista kasuje liste bazy element po elemencie:
--
--   tbl_deep_extend('force', {'lua_ls','stylua'}, {'intelephense','prettierd','phpcs'})
--   -> {'intelephense','prettierd','phpcs'}   -- lua_ls i stylua przepadaja
--
-- Poprzednia wersja tego pliku ratowala to, powtarzajac `lua_ls` i `stylua` na poczatku
-- wlasnej listy. Dzialalo, ale trzymalo sie na kopii cudzej listy: gdyby kickstart dopisal
-- trzecie narzedzie, zniknelo by po cichu. Dlatego instalujemy swoje pakiety wprost przez
-- mason-registry - konfiguracja bazy zostaje nietknieta.

-- Nazwy pakietow Mason (NIE nazwy serwerow lspconfig - tu nie ma tlumaczenia nazw,
-- ktore robi mason-lspconfig). Sprawdzisz je przez `:Mason`.
local mason_packages = {
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
}

local registry = require 'mason-registry'

-- `refresh()` pobiera indeks pakietow asynchronicznie i dopiero potem wiadomo, czy dana
-- nazwa w ogole istnieje. `has_package` chroni przed bledem przy literowce lub pakiecie
-- wycofanym z rejestru - taki wpis jest zglaszany, a reszta instaluje sie normalnie.
registry.refresh(function()
  for _, name in ipairs(mason_packages) do
    if not registry.has_package(name) then
      vim.schedule(function() vim.notify(('mason: nie ma pakietu %q'):format(name), vim.log.levels.WARN) end)
    elseif not registry.is_installed(name) then
      registry.get_package(name):install()
    end
  end
end)

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
