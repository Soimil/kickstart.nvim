local gh = require('custom.plugins._helpers').gh

vim.pack.add { gh 'nvimdev/lspsaga.nvim' }

require('lspsaga').setup {
  lightbulb = { enable = false },
  symbol_in_winbar = { enable = true },
}

-- Deliberately only the two commands Lspsaga does better than the built-ins.
--
-- Everything else it offers duplicates Neovim's own LSP mappings, and having two
-- routes to one action means neither becomes muscle memory. The built-ins win:
-- they are the 0.11+ standard, need no plugin, and work in every config.
--
--   rename        -> `grn`      code action  -> `gra`
--   references    -> `grr`      definition   -> `grd`
--   implementation-> `gri`      type def     -> `grt`
--   hover doc     -> `K`        signature    -> `<C-s>` (insert mode)
--   file symbols  -> `gO`       workspace    -> `gW`
--
-- Lspsaga still earns its keep via `symbol_in_winbar` (breadcrumbs) above.
-- Exactly one mapping: preview a definition in a floating window without leaving the
-- buffer. Neovim has no built-in for that, so it earns its key.
--
-- `Lspsaga finder` was dropped too: it is a nicer-looking `grr` + `gri`, and a nicer
-- duplicate is still a duplicate.
vim.keymap.set('n', '<leader>lp', '<cmd>Lspsaga peek_definition<cr>', { desc = '[L]sp [P]eek definition (floating)' })
