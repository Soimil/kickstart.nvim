local gh = require('custom.plugins._helpers').gh

vim.pack.add { gh 'akinsho/toggleterm.nvim' }

require('toggleterm').setup {
  size = function(term)
    if term.direction == 'horizontal' then return 15
    elseif term.direction == 'vertical' then return math.floor(vim.o.columns * 0.4) end
  end,
  open_mapping = [[<C-\>]],
  direction = 'float',
  float_opts = { border = 'curved' },
}

vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
