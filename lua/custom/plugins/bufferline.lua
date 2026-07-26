local gh = require('custom.plugins._helpers').gh

vim.pack.add {
  gh 'akinsho/bufferline.nvim',
  gh 'nvim-tree/nvim-web-devicons',
}

vim.opt.termguicolors = true

require('bufferline').setup {
  options = {
    mode = 'buffers',
    separator_style = 'slant',
    diagnostics = 'nvim_lsp',
    show_close_icon = false,
    show_buffer_close_icons = true,
    offsets = {
      { filetype = 'neo-tree', text = 'Explorer', highlight = 'Directory', separator = true },
    },
  },
}

vim.keymap.set('n', '<Tab>', '<cmd>bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = '[B]uffer [D]elete' })
vim.keymap.set('n', '<leader>bp', '<cmd>BufferLineTogglePin<CR>', { desc = '[B]uffer [P]in' })
