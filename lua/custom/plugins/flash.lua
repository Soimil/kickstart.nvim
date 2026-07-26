local gh = require('custom.plugins._helpers').gh

vim.pack.add { gh 'folke/flash.nvim' }
require('flash').setup {}

require('which-key').add {
  { '<leader>L', group = '[F]lash' },
  { '<leader>Ls', function() require('flash').jump() end,              desc = 'Flash Jump' },
  { '<leader>Lt', function() require('flash').treesitter() end,        desc = 'Flash Treesitter' },
  { '<leader>Lr', function() require('flash').treesitter_search() end, desc = 'Flash Treesitter Search' },
}
