local gh = require('custom.plugins._helpers').gh

vim.pack.add {
  gh 'sindrets/diffview.nvim',
  gh 'nvim-lua/plenary.nvim',
}

require('diffview').setup {}

vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewOpen<CR>', { desc = '[G]it [D]iffview open' })
vim.keymap.set('n', '<leader>gD', '<cmd>DiffviewClose<CR>', { desc = '[G]it [D]iffview close' })
vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewFileHistory %<CR>', { desc = '[G]it [H]istory current file' })
vim.keymap.set('n', '<leader>gH', '<cmd>DiffviewFileHistory<CR>', { desc = '[G]it [H]istory all' })
