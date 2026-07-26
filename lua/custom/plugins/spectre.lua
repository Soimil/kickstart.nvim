local gh = require('custom.plugins._helpers').gh

vim.pack.add {
  gh 'nvim-pack/nvim-spectre',
  gh 'nvim-lua/plenary.nvim',
}

require('spectre').setup {
  result_padding = '',
}

vim.keymap.set('n', '<leader>S',  function() require('spectre').toggle() end,                              { desc = 'Toggle [S]pectre' })
vim.keymap.set('n', '<leader>sR', function() require('spectre').open_visual({ select_word = true }) end,  { desc = '[S]earch [R]eplace word' })
vim.keymap.set('v', '<leader>sR', function() require('spectre').open_visual() end,                        { desc = '[S]earch [R]eplace selection' })
vim.keymap.set('n', '<leader>sp', function() require('spectre').open_file_search({ select_word = true }) end, { desc = '[S]earch in current [P]ath' })
