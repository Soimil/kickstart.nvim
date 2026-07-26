local gh = require('custom.plugins._helpers').gh

vim.pack.add { gh 'nvimdev/lspsaga.nvim' }

require('lspsaga').setup {
  lightbulb = { enable = false },
  symbol_in_winbar = { enable = true },
}

require('which-key').add {
  { '<leader>l',  group = '[L]spsaga' },
  { '<leader>lc', '<cmd>Lspsaga code_action<cr>',       desc = 'Code Action' },
  { '<leader>lo', '<cmd>Lspsaga outline<cr>',           desc = 'Outline' },
  { '<leader>lr', '<cmd>Lspsaga rename<cr>',            desc = 'Rename' },
  { '<leader>ld', '<cmd>Lspsaga goto_definition<cr>',   desc = 'Goto Definition' },
  { '<leader>lf', '<cmd>Lspsaga finder<cr>',            desc = 'Finder' },
  { '<leader>lp', '<cmd>Lspsaga peek_definition<cr>',   desc = 'Peek Definition' },
  { '<leader>ls', '<cmd>Lspsaga signature_help<cr>',    desc = 'Signature Help' },
  { '<leader>lh', '<cmd>Lspsaga hover_doc<cr>',         desc = 'Hover Doc' },
}
