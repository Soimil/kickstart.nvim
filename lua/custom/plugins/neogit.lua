local gh = require('custom.plugins._helpers').gh

vim.pack.add {
  gh 'NeogitOrg/neogit',
  gh 'nvim-lua/plenary.nvim',
  gh 'sindrets/diffview.nvim',
}

require('neogit').setup {
  integrations = { diffview = true, telescope = true },
}

vim.keymap.set('n', '<leader>gn', '<cmd>Neogit<cr>',           { desc = 'Neo[G]it' })
vim.keymap.set('n', '<leader>gc', '<cmd>Neogit commit<cr>',    { desc = '[G]it [C]ommit' })
vim.keymap.set('n', '<leader>gp', '<cmd>Neogit pull<cr>',      { desc = '[G]it [P]ull' })
vim.keymap.set('n', '<leader>gP', '<cmd>Neogit push<cr>',      { desc = '[G]it [P]ush' })
