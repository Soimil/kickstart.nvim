local gh = require('custom.plugins._helpers').gh

vim.pack.add {
  gh 'kevinhwang91/nvim-ufo',
  gh 'kevinhwang91/promise-async',
}

vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

require('ufo').setup {
  provider_selector = function(_, _, _) return { 'treesitter', 'indent' } end,
}

vim.keymap.set('n', 'zR', function() require('ufo').openAllFolds() end,  { desc = 'Open all folds' })
vim.keymap.set('n', 'zM', function() require('ufo').closeAllFolds() end, { desc = 'Close all folds' })
vim.keymap.set('n', 'zr', function() require('ufo').openFoldsExceptKinds() end, { desc = 'Open folds except kinds' })
