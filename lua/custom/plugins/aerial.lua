local gh = require('custom.plugins._helpers').gh

vim.pack.add { gh 'stevearc/aerial.nvim' }

require('aerial').setup {
  backends = { 'lsp', 'treesitter', 'markdown' },
  layout = { default_direction = 'right', min_width = 30, max_width = { 40, 0.2 } },
  attach_mode = 'global',
  filter_kind = false,
  show_guides = true,
}

-- The side panel is the one thing Aerial does that no built-in does: a persistent,
-- always-visible symbol tree. `gO` (kickstart) already covers "fuzzy-pick a symbol",
-- so `AerialNavToggle` was dropped — a third route to the same information only
-- splits muscle memory three ways.
vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>',    { desc = '[A]erial toggle symbols panel' })

-- Symbol navigation on `[m` / `]m` ("member/method").
--
-- NOT on `{` / `}`: those are core paragraph motions and, unlike a `<cmd>` mapping,
-- they compose with operators (`d}`, `y}`, `>}`). Overriding them costs far more
-- than symbol jumping is worth.
-- NOT on `[a` / `]a`: taken by Neovim defaults for the argument list (`:previous` / `:next`).
--
-- `[m` / `]m` are builtin motions too, but they only work reliably in C-like languages
-- (they look for braces in column 1) and are useless in PHP/TS/Elixir. Aerial's
-- LSP-aware version is a strict upgrade here. Delete these two lines to get them back.
vim.keymap.set('n', '[m',        '<cmd>AerialPrev<CR>',       { desc = 'Aerial previous symbol' })
vim.keymap.set('n', ']m',        '<cmd>AerialNext<CR>',       { desc = 'Aerial next symbol' })
