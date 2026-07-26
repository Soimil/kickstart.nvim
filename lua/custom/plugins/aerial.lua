local gh = require('custom.plugins._helpers').gh

vim.pack.add { gh 'stevearc/aerial.nvim' }

require('aerial').setup {
  backends = { 'lsp', 'treesitter', 'markdown' },
  layout = { default_direction = 'right', min_width = 30, max_width = { 40, 0.2 } },
  attach_mode = 'global',
  filter_kind = false,
  show_guides = true,
}

vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>',    { desc = '[A]erial toggle symbols panel' })
vim.keymap.set('n', '<leader>A', '<cmd>AerialNavToggle<CR>',  { desc = '[A]erial nav popup' })
vim.keymap.set('n', '{',         '<cmd>AerialPrev<CR>',       { desc = 'Aerial previous symbol' })
vim.keymap.set('n', '}',         '<cmd>AerialNext<CR>',       { desc = 'Aerial next symbol' })
