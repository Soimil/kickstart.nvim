local gh = require('custom.plugins._helpers').gh

vim.pack.add { gh 'Wansmer/treesj' }

require('treesj').setup {
  max_join_length = 120,
  cursor_behavior = 'hold',
  notify = true,
  dot_repeat = true,
}

vim.keymap.set('n', '<leader>j', function() require('treesj').toggle() end, { desc = 'Tree[J] split/join toggle' })
